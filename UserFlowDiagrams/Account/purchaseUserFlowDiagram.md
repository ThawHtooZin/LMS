# Purchase User Flow Diagram

**Access:** The Account sidebar shows Purchase to roles with the `manage_purchase` permission.

## 1. Find and open a purchase

```mermaid
flowchart TD
    A[Open Account in sidebar] --> B[Open Purchase]
    B --> C[Purchases overview]
    C --> D{Choose a view}
    D -->|All| E[Show purchases of every status]
    D -->|Draft| F[Filter to Draft]
    D -->|Awaiting Approval| G[Filter to Awaiting Approval]
    D -->|Awaiting Payment| H[Filter to Awaiting Payment]
    D -->|Paid| I[Filter to Paid]
    C --> J[Search supplier name or voucher reference]
    E --> K[Review supplier, status, SR number, date, due date, paid amount, and amount due]
    F --> K
    G --> K
    H --> K
    I --> K
    J --> K
    K -->|Select a purchase row| L[Open Edit Purchase]
    C -->|New Purchase| M[Open a blank purchase form]
    K -->|Check for a voided purchase| N[Use All and search supplier or voucher reference]
```

## 2. Create a purchase

```mermaid
flowchart TD
    A[New Purchase form] --> B[Choose supplier, date, purchase type, and voucher reference]
    B --> C[Optionally enter due date and choose currency]
    C --> D{Add or complete item lines}
    D -->|Add a new line| E[Add another item row]
    D -->|Select product| F[Choose a product marked as purchased]
    F --> G[Purchase account auto-fills from product when configured]
    G --> H[Enter line details and account]
    E --> H
    H --> I{Purchase type is Material?}
    I -->|Yes| J[Hide Size and Viss; use Pcs as quantity]
    I -->|No| K[Show Size and Viss; Pcs is optional]
    J --> L[Calculate line amount as Pcs x unit price]
    K --> M[Calculate line amount as Viss x unit price]
    L --> N[Update subtotal and total]
    M --> N
    N --> O{Choose an action}
    O -->|Save / Save as draft| P[Validate and save as Draft]
    O -->|Save continue editing| Q[Validate, save, and open saved purchase]
    O -->|Save and submit for approval| R[Validate and save as Awaiting Approval]
    O -->|Save and add another| S[Validate, save, and open a new blank form]
    O -->|Approve| T[Validate, approve, and post purchase]
    O -->|Approve and add another| U[Validate, approve, post, and open a new blank form]
    O -->|Cancel| V[Return to Purchases overview without saving]

    P --> W{Voucher reference unique?}
    Q --> W
    R --> W
    S --> W
    T --> W
    U --> W
    W -->|No| X[Show duplicate-voucher warning; do not save]
    W -->|Yes| Y{Form and line validation passes?}
    Y -->|No| Z[Highlight missing or invalid fields; show warning]
    Y -->|Yes| AA[Save purchase and its item lines]
    AA --> AB{Action}
    AB -->|Save / draft| AC[Show confirmation; return to overview]
    AB -->|Continue editing| AD[Show confirmation; open saved purchase]
    AB -->|Submit for approval| AE[Show confirmation; return to overview]
    AB -->|Add another| AF[Show confirmation; open blank purchase form]
    AB -->|Approve| AG[Require an account code on every line; post purchase]
    AB -->|Approve and add another| AG
    AG -->|Account missing or posting fails| AH[Show validation or save error]
    AG -->|Posting succeeds| AI[Set purchase status to Awaiting Payment]
    AI --> AM[Debit each line's selected account; credit payable control account 2000 in General Ledger]
    AI --> AL{Purchase type}
    AL -->|Frozen| AN[Add lines to Frozen stock]
    AL -->|TCL| AO[Add lines to TCL stock]
    AL -->|Material| AP[Add Pcs quantities to Packing Material W/H]
    AL -->|Other| AQ[No Frozen, TCL, or Material stock movement]
    AM --> AK[Bill is now included in A/C Payable supplier balances and bill detail]
    AI -->|Approve| AJ[Return to Purchases overview]
    AI -->|Approve and add another| AF
```

## 3. Edit, delete, or void a purchase

```mermaid
flowchart TD
    A[Open purchase from overview] --> B[View status and purchase details]
    B --> C{Paid amount greater than zero?}
    C -->|Yes| D[Lock fields and prevent editing]
    D --> E[Show Back to Purchases]
    C -->|No| F[Edit header and item lines]
    F --> G[Add item lines; existing lines can be edited]
    G --> H[Type controls Material versus Size/Viss fields]
    H --> I[Product selection may auto-fill purchase account]
    I --> J[Line amounts and total recalculate]
    J --> K{Choose an available action}

    K -->|Draft or Awaiting Approval: Delete| L[Confirm deletion]
    L -->|Cancel| B
    L -->|Confirm| M{Deletion allowed?}
    M -->|Yes| N[Delete purchase and related lines; return to overview]
    M -->|No| O[Show deletion error]
    O --> B

    K -->|Awaiting Payment with no payment: Void| P[Confirm void]
    P -->|Cancel| B
    P -->|Confirm| Q[Remove associated posting effects and mark bill Voided]
    Q --> R[Show result and return to overview]

    K -->|Draft or Awaiting Approval: Save| S[Save as Draft]
    K -->|Draft or Awaiting Approval: Submit for approval| T[Save as Awaiting Approval]
    K -->|Draft or Awaiting Approval: Approve| U[Validate account codes and post]
    K -->|Awaiting Payment with no payment: Update Bill| V[Validate and update approved bill]
    S --> W[Check voucher is unique and validate fields/lines]
    T --> W
    U --> W
    V --> W
    W -->|Validation or duplicate error| X[Show warning; stay on form]
    W -->|Paid/part-paid audit block| Y[Prevent update; return to overview]
    W -->|Valid save/update| Z[Save header and lines; refresh stock and ledger postings when approved]
    Z --> AA[Show result and go to selected destination]
    Z --> AB{Saved as Awaiting Payment?}
    AB -->|Yes| AC[Included in A/C Payable totals and supplier bill detail]
    AB -->|No| AD[Draft or Awaiting Approval is not yet included in A/C Payable]
```

## Rules and details

- The overview has **All, Draft, Awaiting Approval, Awaiting Payment, and Paid** tabs. Select a row to open it. The displayed **Amount** is the outstanding amount (`grand total - paid amount`); Paid is shown separately.
- The overview has a **Voided** tab and distinct status styling for voided purchases.
- Purchase header fields: supplier, date, type (**Frozen**, **TCL**, **Material**, or **Other**), optional due date, voucher/reference number, and currency (MMK or an active currency). The voucher/reference must be unique.
- Add item rows with **Add a new line**. Each row can contain product, description, size, Viss, Pcs, unit price, and account. Product choices are limited to products marked as purchasable. Selecting a product can automatically fill its configured purchase account.
- There is no visible remove-row button. A row with no entered values is skipped when saving; the form does not offer an explicit row-removal action.
- For **Material**, Size and Viss are hidden and Pcs is the quantity. For Frozen, TCL, and Other, Size and Viss are shown and Viss is used for the line amount; Pcs is optional. The displayed line amount is quantity × unit price; subtotal and total update as values change.
- Before saving, the form requires supplier, date, and voucher reference, at least one product line, a positive unit price and account for each selected product, plus Size and positive Viss for non-Material types or positive Pcs for Material. Description, Pcs on non-Material lines, and due date are optional. Approval/posting additionally requires an account code for every saved line.
- Saving as Draft creates a **Draft**. Submitting for approval creates **Awaiting Approval**. Approving posts the purchase and sets it to **Awaiting Payment**. The save menu also has **Save (continue editing)** and **Save & add another**; the approval menu has **Approve & add another**.
- Only **Awaiting Payment** and **Paid** purchases appear in **A/C Payable**. Draft and Awaiting Approval purchases are excluded; approving a purchase makes it an outstanding supplier bill in A/C Payable. Supplier payments can then allocate against that bill and eventually change it to Paid.
- Approval posts a debit for each item line to its selected account and a credit for the bill total to payable control account `2000` in the General Ledger. The approved purchase type also determines its operational stock movement: Frozen and TCL post to their respective stock records; Material adds quantity to Packing Material W/H. These effects are refreshed when an approved unpaid purchase is updated and removed when it is voided.
- On an existing bill, Draft and Awaiting Approval records can be deleted. Awaiting Payment records with no payment can be voided. Any paid or partially paid purchase is locked against editing; approved purchases with no payment can be updated.
- A void action is available only for an unpaid Awaiting Payment purchase. It removes the related general-ledger entries and the applicable frozen/TCL stock or material-store movement, then marks the purchase **VOIDED**. A paid/part-paid purchase cannot be voided through this action.
- Edit Purchase, like New Purchase, limits the supplier picker to suppliers.
