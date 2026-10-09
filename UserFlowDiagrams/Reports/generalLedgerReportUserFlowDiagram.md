# General Ledger Report — User Flow

**Access:** The Reports sidebar shows General Ledger Report to roles with the `manage_generalledger` permission.

Until a search is run, the ledger table has headings only. Each successful search groups rows by account code, in date order, with a running balance of debit minus credit, then a total row for debit, credit, and balance. Currency is taken from the voucher.

## 1. Open the report

```mermaid
flowchart TD
    A[Open Reports in sidebar] --> B[Open General Ledger Report]
    B --> C[Show the report method list]
    C --> D[Show an empty ledger table]
    D --> E[Columns: Date, Voucher No, Account Name, Description, Debit, Credit, Currency, Balance]
```

## 2. Choose a method and run the search

```mermaid
flowchart TD
    A[Select a report method] --> B[Select Ok]
    B --> C{Method}
    C -->|Account Name Search| D[Type an account code]
    D --> E[Account name fills in beside the code]
    E --> F[Select Check Reports]
    C -->|Date Between Search| G[Enter Start Date and End Date]
    G --> H[Select Check Reports]
    C -->|Today Search| I[Enter a single date]
    I --> J[Select Search Date Report]
    C -->|Account name and Date between Search| K[Type an account code]
    K --> L[Account name fills in beside the code]
    L --> M[Enter Start Date and End Date]
    M --> N[Select Check Reports]
    F --> O[Load ledger lines for that account code]
    H --> P[Load every account that has lines between the two dates]
    J --> Q[Load every account that has lines on that date]
    N --> R[Load that account's lines between the two dates]
    O --> S[Print an account heading, then its lines and a Total row]
    P --> S
    Q --> S
    R --> S
```

## 3. Export

```mermaid
flowchart TD
    A[General Ledger Report is open] --> B[Select Export]
    B --> C[Open the full General Ledger export]
    C --> D[The export does not receive the filter chosen on this page]
```
