# Purchase Report — User Flow

**Access:** The Reports sidebar shows Purchase Report to roles with the `purchase_report` permission.

The page lists purchase lines from approved and other purchase bills. Kg is displayed as Viss × 1.634. With no filter applied, the table shows the first 100 lines and no footer totals.

## 1. Open the report

```mermaid
flowchart TD
    A[Open Reports in sidebar] --> B[Open Purchase Report]
    B --> C[Show Manage Purchase Report]
    C --> D[Show filter method list and the first 100 purchase lines]
    D --> E[Review Date, Voucher No, Type, Supplier, Commodity, Size, Viss, Kg, Pcs, Price, and Amount]
```

## 2. Choose a filter and load the matching lines

```mermaid
flowchart TD
    A[Select a report method] --> B[Select Load Filter]
    B --> C{Method}
    C -->|Date Between Search| D[Enter Start Date and End Date]
    C -->|Today Search| E[Select Search Today Report]
    C -->|Supplier Search| F[Select a contact]
    C -->|Commodity Search| G[Select a product]
    C -->|Supplier and Date Between Search| H[Select a contact, Start Date, and End Date]
    C -->|Commodity and Date Between Search| I[Select a product, Start Date, and End Date]
    C -->|Voucher Search| J[Select a voucher number from purchases]
    C -->|Commodity and Size Search| K[Select a product and enter Size]
    D --> L[Select Check Reports]
    F --> M[Select Search]
    G --> M
    H --> M
    I --> M
    J --> M
    K --> M
    E --> N[Reload the table with today's purchase lines]
    L --> N
    M --> N
    N --> O[Show matching lines]
    O --> P{Which search ran?}
    P -->|Supplier, date range, today, supplier plus date, commodity plus date, or voucher| Q[Show Total Amount]
    P -->|Commodity, or Commodity and Size| R[Show Total Amount, Total Viss, and Total Kg]
```

## 3. Export the current result

```mermaid
flowchart TD
    A[Review the table] --> B{Choose an export}
    B -->|Export Excel| C[Open a new tab and download the purchase report as Excel]
    B -->|Export PDF| D[Open a new tab and generate a printable PDF of the purchase report]
    C --> E[Export uses the same filter that produced the on-screen table]
    D --> E
    E --> F{No filter is active?}
    F -->|Yes| G[Export the first 100 lines]
    F -->|No| H[Export the filtered lines and the same totals shown on screen]
```
