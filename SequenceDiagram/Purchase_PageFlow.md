# Purchase - Page Flow

Purpose:
- Create new purchase bills
- View purchase list and filter by status
- Edit draft or awaiting-approval bills
- Approve bills into payment stage
- Delete drafts or void approved bills
- Post stock and ledger entries when approved

Connected files:
- [App/admin/purchase.php](../App/admin/purchase.php)
- [App/admin/newpurchase.php](../App/admin/newpurchase.php)
- [App/admin/editpurchase.php](../App/admin/editpurchase.php)
- [Auth/authrize.ctr.php](../Auth/authrize.ctr.php)
- [Controllers/query.ctr.php](../Controllers/query.ctr.php)
- Tables: purchases, purchase_lines, contacts, products, general_ledger, form7stock, form7stocktcl, material_store_house

Query functions used:
- savePurchase($id, $contact_id, $date, $tclfrozen, $due_date, $voucher_no, $currency, $status, $subtotal, $grand_total, $lines, $action_type)
- deletePurchase($id)
- voidPurchase($id)
- payPurchaseBill($purchase_id, $payment_date, $payment_account, $reference)

```mermaid
sequenceDiagram
    autonumber
    actor Admin
    participant Browser
    participant Overview as purchase.php
    participant NewPage as newpurchase.php
    participant EditPage as editpurchase.php
    participant Auth as authrize.ctr.php
    participant QueryBox as Query
    participant DB as Database

    Admin->>Browser: Open Purchases overview
    Browser->>Overview: GET purchase.php
    Overview->>Auth: checkadmin()
    Auth-->>Overview: valid session

    Overview->>DB: SELECT purchases + contact name with filters/tabs
    DB-->>Overview: purchase list
    Overview-->>Browser: Render tabs + search + table

    Admin->>Browser: Click New Purchase
    Browser->>NewPage: GET newpurchase.php
    NewPage->>Auth: checkadmin()
    Auth-->>NewPage: valid session
    NewPage->>DB: SELECT suppliers, products, currencies, accounts
    DB-->>NewPage: form data
    NewPage-->>Browser: Show purchase form

    Admin->>Browser: Fill supplier, date, voucher, type, line items
    Browser->>NewPage: POST action_type + form data
    NewPage->>NewPage: build subtotal + lines
    NewPage->>QueryBox: savePurchase(null, contact_id, date, tclfrozen, due_date, voucher_no, currency, status, subtotal, grand_total, lines, action_type)
    QueryBox->>DB: SELECT COUNT(*) FROM purchases WHERE voucher_no = ?
    DB-->>QueryBox: duplicate check result

    alt duplicate voucher found
        QueryBox-->>NewPage: validation_error
        NewPage-->>Browser: swal duplicate voucher message
    else unique voucher
        QueryBox->>DB: BEGIN TRANSACTION
        QueryBox->>DB: INSERT INTO purchases(...)
        DB-->>QueryBox: purchase_id created

        loop each line item
            QueryBox->>DB: INSERT INTO purchase_lines(...)
            DB-->>QueryBox: line inserted

            alt status is AWAITING_PAYMENT
                alt type is Frozen or TCL
                    QueryBox->>DB: INSERT INTO form7stock or form7stocktcl
                else type is Material
                    QueryBox->>DB: INSERT INTO material_store_house
                end

                QueryBox->>DB: INSERT INTO general_ledger (debit)
            end
        end

        alt status is AWAITING_PAYMENT
            QueryBox->>DB: INSERT INTO general_ledger (credit)
        end

        QueryBox->>DB: COMMIT
        QueryBox-->>NewPage: save success
        NewPage-->>Browser: redirect to purchase.php or newpurchase.php or editpurchase.php
    end

    Admin->>Browser: Open existing bill
    Browser->>EditPage: GET editpurchase.php?id=...
    EditPage->>Auth: checkadmin()
    Auth-->>EditPage: valid session
    EditPage->>DB: SELECT * FROM purchases WHERE id = ?
    DB-->>EditPage: purchase record
    EditPage->>DB: SELECT * FROM purchase_lines WHERE purchase_id = ?
    DB-->>EditPage: existing lines
    EditPage-->>Browser: show edit form with status lock state

    alt bill is paid or partially paid
        EditPage-->>Browser: locked from editing
    else draft or awaiting approval
        Admin->>Browser: Update fields and submit
        Browser->>EditPage: POST action_type

        alt action_type == delete
            EditPage->>QueryBox: deletePurchase(id)
            QueryBox->>DB: SELECT voucher_no, status FROM purchases WHERE id = ?
            DB-->>QueryBox: bill record
            QueryBox->>DB: DELETE related stock rows + general_ledger + purchase_lines + purchases
            DB-->>QueryBox: delete success
            QueryBox-->>EditPage: success
            EditPage-->>Browser: redirect to purchase.php

        else action_type == void
            EditPage->>QueryBox: voidPurchase(id)
            QueryBox->>DB: SELECT voucher_no, status, tclfrozen FROM purchases WHERE id = ?
            DB-->>QueryBox: record
            QueryBox->>DB: DELETE stock entries + general_ledger
            QueryBox->>DB: UPDATE purchases SET status = 'VOIDED'
            DB-->>QueryBox: void success
            QueryBox-->>EditPage: success
            EditPage-->>Browser: redirect to purchase.php

        else normal update
            EditPage->>QueryBox: savePurchase(id, contact_id, date, tclfrozen, due_date, voucher_no, currency, status, subtotal, grand_total, lines, action_type)
            QueryBox->>DB: SELECT COUNT(*) FROM purchases WHERE voucher_no = ? AND id != ?
            DB-->>QueryBox: duplicate result

            alt duplicate voucher found
                QueryBox-->>EditPage: validation_error
                EditPage-->>Browser: warning popup
            else unique voucher
                QueryBox->>DB: BEGIN TRANSACTION
                QueryBox->>DB: UPDATE purchases SET ... WHERE id=?
                QueryBox->>DB: DELETE old related stock + general_ledger + purchase_lines
                QueryBox->>DB: INSERT new purchase_lines and related records
                QueryBox->>DB: COMMIT
                QueryBox-->>EditPage: success
                EditPage-->>Browser: redirect based on action_type
            end
        end
    end
```

Validation map:
- Overview page -> tabs and search filter work
- New purchase -> supplier/date/voucher required
- Duplicate voucher -> validation error
- Missing account code on approved item -> validation error
- Save draft -> record stays draft
- Submit for approval -> status becomes AWAITING_APPROVAL
- Approve -> status becomes AWAITING_PAYMENT and stock/ledger entries are created
- Edit paid or partially paid bill -> audit block
- Delete draft -> allowed
- Delete approved/paid bill -> strict audit block
- Void approved bill -> reverse stock + ledger + status voided
- Re-open bill -> correct status and lock state

Continuation:
- [SequenceDiagram/Permission_PageFlow.md](Permission_PageFlow.md) controls which role can access purchase functions
- Purchase approval and payment details continue into payable/ledger-related flows in other pages
- Payment processing logic connects to [Controllers/query.ctr.php](../Controllers/query.ctr.php) through payPurchaseBill() and related ledger updates
