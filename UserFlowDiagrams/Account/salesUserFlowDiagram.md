# Sales User Flow Diagram

**Access:** The Account sidebar shows Sales to roles with the `manage_sale` permission.

## 1. Find and open a sale

```mermaid
flowchart TD
    A[Open Account in sidebar] --> B[Open Sales]
    B --> C[Sales Overview]
    C --> D{Choose a status view}
    D -->|All| E[Show all sales, including statuses without their own tab]
    D -->|Draft| F[Filter to Draft]
    D -->|Awaiting Payment| G[Filter to Awaiting Payment]
    D -->|Paid| H[Filter to Paid]
    C --> I[Search by SR number or customer name]
    E --> J[Review SR number, customer, containers, dates, total, paid, balance, and status]
    F --> J
    G --> J
    H --> J
    I --> J
    J -->|Select row| K[Open Edit Sale]
    J -->|Draft only: select trash icon| L[Confirm draft deletion]
    L -->|Cancel| J
    L -->|Confirm| M[Request deletion]
    M --> N[Return to or remain on Sales overview]
    C -->|New Sale| O[Open a blank invoice form]
```

## 2. Create a sale

```mermaid
flowchart TD
    A[New Sale form] --> B[Choose customer, date, and SR number]
    B --> C[Optionally set due date and currency]
    C --> D[Start with two item rows]
    D --> E{Add another row?}
    E -->|Yes| F[Select Add a new line]
    F --> G[Enter optional container reference, revenue account, and amount]
    E -->|No| G
    G --> H[Recalculate and display invoice total]
    H --> I{Choose action}
    I -->|Save / Save as draft| J[Validate and save as Draft]
    I -->|Save continue editing| K[Validate, save, and open the new invoice]
    I -->|Approve| L[Validate account assignment and approve]
    I -->|Approve and add another| M[Validate, approve, and open a blank invoice]
    I -->|Cancel| N[Return to Sales overview without saving]
    J --> O{Customer, date, SR number, and at least one valid line present?}
    K --> O
    L --> O
    M --> O
    O -->|No| P[Highlight missing fields or show validation warning]
    O -->|Yes| Q{SR number already exists?}
    Q -->|Yes| R[Show duplicate invoice warning; do not save]
    Q -->|No| S{Approving and any line lacks Revenue Account?}
    S -->|Yes| T[Show missing Revenue Account error; do not approve]
    S -->|No| U[Save invoice and lines]
    U --> V{Selected action}
    V -->|Save / draft| W[Show result and return to Sales overview]
    V -->|Continue editing| X[Show result and open Edit Sale]
    V -->|Approve| Y[Set Awaiting Payment and post invoice entries to General Ledger]
    V -->|Approve and add another| Y
    Y --> ZA[Debit Accounts Receivable control account 600 for invoice total]
    Y --> ZB[Credit each selected Revenue Account for its line amount]
    ZA --> Z[Invoice now appears in A/C Receivable as an open customer balance]
    ZB --> Z
    Y -->|Approve| ZC[Return to Sales overview]
    Y -->|Approve and add another| AA[Open a blank New Sale form]
```

## 3. Edit, submit, approve, delete, or void

```mermaid
flowchart TD
    A[Open Edit Sale] --> B[Review status, customer, dates, SR number, currency, rows, and total]
    B --> C{Paid amount greater than zero?}
    C -->|Yes| D[Lock invoice against edits; show Back to Sales]
    C -->|No| E[Edit customer, dates, SR number, currency, or item rows]
    E --> F[Update container reference, Revenue Account, or amount]
    F --> G[Add more rows if needed; total recalculates]
    G --> H{Choose action available for status}

    H -->|Draft or Awaiting Approval: Delete in Invoice Options| I[Confirm deletion]
    I -->|Cancel| B
    I -->|Confirm| J[Delete invoice and its lines]
    J --> K[Show result and return to Sales]

    H -->|Awaiting Payment with no payment: Void in Invoice Options| L[Confirm void]
    L -->|Cancel| B
    L -->|Confirm| M[Remove invoice General Ledger entries and mark invoice Voided]
    M --> N[Show result and return to Sales]

    H -->|Save| O[Save as Draft, except approved invoice remains Awaiting Payment]
    H -->|Save continue editing| P[Save and reopen the invoice]
    H -->|Save and submit for approval| Q[Set status to Awaiting Approval]
    H -->|Approve| R[Require Revenue Account on every line; set Awaiting Payment]
    H -->|Approve and add another| S[Approve and open a blank invoice]
    H -->|Awaiting Payment: Update Invoice| T[Update approved invoice]
    O --> U[Check required fields and at least one valid line]
    P --> U
    Q --> U
    R --> U
    S --> U
    T --> U
    U -->|Invalid| V[Show validation warning]
    U -->|SR number duplicate| W[Show duplicate invoice warning]
    U -->|Valid| X[Save invoice and lines]
    X -->|Draft or Awaiting Approval| Y[No General Ledger invoice posting yet]
    X -->|Awaiting Payment| Z[Replace invoice's General Ledger rows]
    Z --> ZA[Debit Accounts Receivable control account 600 for invoice total]
    Z --> ZB[Credit each selected Revenue Account for its line amount]
    Y --> ZC[Show result and navigate to selected destination]
    ZA --> ZC
    ZB --> ZC
```

## 4. Receive payment (via A/C Receivable)

```mermaid
flowchart TD
    A[Open Account Receivable] --> B[View customer totals: billed, paid, and balance owed]
    B --> C[Open customer Detail]
    C --> D[Review Awaiting Payment and Paid invoices]
    D --> E[See invoice amount, paid amount, balance, and status]
    E --> F{Paid amount greater than zero?}
    F -->|Yes| G[Expand payment amount to inspect payment history]
    F -->|No| H[No payment history to expand]
    E --> I{Customer has outstanding balance?}
    I -->|No| J[Receive Payment is unavailable]
    I -->|Yes| K[Select Receive Payment]
    K --> L[Enter date, deposit account, reference, amount; optionally add notes]
    L --> M{Selected deposit account is a registered bank?}
    M -->|Yes| N[Show optional Check Number]
    M -->|No| O[Hide and clear Check Number]
    N --> P[Submit Receive Payment]
    O --> P
    P --> Q{Positive amount and open invoices exist?}
    Q -->|No| R[Show payment error]
    Q -->|Yes| S[Allocate oldest open invoices first]
    S --> T[Mark fully paid invoices Paid; keep partial invoices Awaiting Payment]
    T --> U{Entered amount exceeds open invoice balance?}
    U -->|No| V[Save per-invoice payment history]
    U -->|Yes| W[Apply only amounts due; excess remains unallocated]
    V --> X[Refresh balances and show success]
    W --> Y[Current response reports entered amount, not applied amount]
    Y --> X
```

## Rules and details

- Sales Overview has **All, Draft, Awaiting Approval, Awaiting Payment, Paid, and Voided** tabs with distinct status styles. Search matches the **SR number** or **customer name**. Selecting a row opens Edit Sale.
- Each row shows SR number, customer, distinct container references, date, optional due date, total and currency, paid amount, balance due, status, and an action. The overview trash icon is shown only for Draft invoices.
- Voided invoices are read-only and cannot be edited or approved. Draft sale deletion is submitted via POST and its result is shown.
- A new sale starts with two rows; **Add a new line** appends rows. There is no visible row-removal control. Empty rows are ignored when saving.
- Each line has an optional **Container Reference**, a **Revenue Account**, and an **Amount**. The page recalculates the total from line amounts. At least one line with a Revenue Account and positive amount is required; approval also requires an account on every saved line.
- Required invoice fields are customer, date, and SR number; the SR number must be unique. Due date is optional. Customer choices are contacts marked as customers. Currency is USD by default on the new form, with configured active currencies also available.
- New Sale offers **Save / Save as draft**, **Save (continue editing)**, **Approve**, **Approve & add another**, and **Cancel**. It does not show a Submit for Approval action. Edit Sale additionally offers **Save & submit for approval** for Draft/Awaiting Approval invoices.
- Editing a Draft or Awaiting Approval invoice can save it, submit it for approval, or approve it. An approved, unpaid invoice can be updated. Any invoice with a positive paid amount is locked.
- Draft and Awaiting Approval invoices can be deleted in Edit Sale. The overview exposes deletion only for Drafts. An Awaiting Payment invoice can be voided from Edit Sale only while it has no payment; voiding removes matching General Ledger entries and changes status to Voided.
- When approved, an invoice posts a debit to Accounts Receivable control account `600` for the invoice total and credits each selected Revenue Account for that line's amount. The invoice then appears in **A/C Receivable** as an outstanding customer balance. Draft and Awaiting Approval invoices do not post these invoice entries.
- Customer receipts are not entered in Sales; use **Account → A/C Receivable → customer Detail → Receive Payment**. The payment is allocated oldest invoice first, and invoices transition to Paid when fully covered. The receipt form requires date, deposit account, reference, and amount; notes and check number are optional, with check number shown for registered banks.
- The server validates customer receipt amounts against total outstanding and reports the actual amount allocated. Receipts also post a debit to the selected deposit account and a credit to Accounts Receivable `600`.
- A/C Receivable summary totals exclude Draft and Awaiting Approval sales; customer detail shows only Awaiting Payment and Paid invoices.
