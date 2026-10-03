# A/C Payable User Flow Diagram

**Access:** The Account sidebar shows A/C Payable to roles with the `manage_acpayable` permission.

> This diagram covers **A/C Payable** (`acpayable.php` and supplier detail/payment). The separate **Account Payable** menu item is a different, legacy workflow.

## 1. Review supplier balances

```mermaid
flowchart TD
    A[Approve a purchase in Account → Purchase] --> A1[Set status to Awaiting Payment]
    A --> A2[Debit selected account for each purchase line]
    A --> A3[Credit Accounts Payable control account 2000 for the bill total]
    A1 --> A4[Bill is included in A/C Payable]
    B[Open Account → A/C Payable] --> C[View supplier payable summary]
    A4 --> B
    C --> D[Show suppliers with Awaiting Payment or Paid purchase bills]
    D --> E[For each supplier show total billed, total paid, and balance owed]
    E --> F[Order suppliers by balance owed, highest first]
    F --> G[Show grand totals across listed suppliers]
    E --> H[Choose Detail for a supplier]
    H --> I[Open that supplier's payable details]
```

## 2. Review bills and payment history

```mermaid
flowchart TD
    A[Open supplier payable details] --> B[Load Awaiting Payment and Paid bills for this supplier]
    B --> C[Show date, voucher, bill amount, paid amount, balance, and status]
    C --> D{Paid amount greater than zero?}
    D -->|Yes| E[Expand paid amount to view payment history]
    E --> F{Detailed allocation history exists?}
    F -->|Yes| G[Show payment date, account, reference, check number, notes, and allocated amount]
    F -->|No| H[Show legacy payment record notice]
    D -->|No| I[No payment history to expand]
    C --> J{Total outstanding greater than zero?}
    J -->|Yes| K[Offer Make Payment]
    J -->|No| L[Do not show Make Payment]
    K --> M[Choose Back to return to supplier summary]
    L --> M
```

## 3. Apply a supplier payment

```mermaid
flowchart TD
    A[Select Make Payment] --> B[Enter payment date]
    B --> C[Select payment account from Asset accounts]
    C --> D{Selected account is registered as a bank?}
    D -->|Yes| E[Show optional Check Number]
    D -->|No| F[Hide and clear Check Number]
    E --> G[Enter required payment reference]
    F --> G
    G --> H[Optionally enter description or notes]
    H --> I[Enter payment amount up to displayed total outstanding]
    I --> J[Select Apply Payment]
    J --> K{Amount greater than zero?}
    K -->|No| L[Reject payment and show error]
    K -->|Yes| M[Apply payment to Awaiting Payment bills by oldest date, then ID]
    M --> N{Payment covers each bill in full?}
    N -->|Yes| O[Mark covered bills Paid]
    N -->|No| P[Apply remaining amount to next bill; keep partial bill Awaiting Payment]
    O --> Q[Record allocations and post debit to Accounts Payable control account 2000]
    P --> Q
    Q --> QA[Credit selected Asset account for amount applied]
    QA --> QB[Payment is visible in General Ledger]
    QB --> R[Commit payment and show amount actually applied]
    R --> S[Return to supplier detail and refresh balances/history]
    L --> T[Stay on supplier detail]
```

## Rules and details

- The summary is calculated from supplier contacts and purchase bills with status **Awaiting Payment** or **Paid**. It excludes Draft, Awaiting Approval, and Voided bills.
- An approved purchase from **Account → Purchase** creates the bill that appears here: the purchase posts debits to its selected line accounts and a credit to Accounts Payable control account `2000`. Draft and Awaiting Approval purchases have not yet created these approval postings and are excluded from this summary. See the [Purchase workflow](./purchaseUserFlowDiagram.md).
- Packing Material purchases are entered through **Account → Purchase** with type **Material**. Once approved, they become **Awaiting Payment** bills and appear here like other approved purchases. The separate Packing Material Purchase screen is not part of this workflow; see the [Packing Material W/H workflow](../Packing%20Material/packingMaterialWarehouseUserFlowDiagram.md).
- **Balance owed** is the sum of each included bill's `grand_total - paid_amount`. The bottom row totals billed, paid, and owed across the displayed supplier rows.
- Supplier detail lists bills in oldest-first order and labels them **Unpaid**, **Partial**, or **Paid**. A paid amount can be expanded to show its allocation history. Older records without detailed payment allocations show a legacy notice instead.
- **Make Payment** appears only when the supplier's total outstanding balance is greater than zero. Required fields are payment date, payment account, reference, and a positive amount. Description/notes and check number are optional.
- The account dropdown uses Asset-class accounts. Check Number appears only when the selected account is registered as a bank; switching to a non-bank account hides and clears it.
- One payment is allocated automatically across the supplier's **Awaiting Payment** bills, oldest date and then lowest ID first. Bills fully covered become **Paid**; a bill that receives only part of the remaining payment stays **Awaiting Payment**.
- Each allocation records date, account, reference, optional check number/description, and amount. The payment also posts a debit to Accounts Payable control account `2000` and a credit to the selected Asset account in the General Ledger. Supplier bill approval and supplier cash payment are separate ledger events.
- The server validates the payment amount against total outstanding and reports the amount actually applied.
- Use **Back** to return to the supplier balance summary. The detail page does not provide controls to edit or delete individual payment allocations.
