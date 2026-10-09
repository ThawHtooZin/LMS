# Payable Report — User Flow

**Access:** The Reports sidebar shows Payable Report to roles with the `payable_report` permission.

The screen title is Link Mark Supplier Statement. It groups contacts by type and shows opening balance, additions, payments, and closing balance. Contacts with no opening, additions, payments, or balance in the range are omitted.

Opening balance is purchases before the start date, minus payments before the start date. Add Amt is purchases inside the range. Paid Amt is payments inside the range. Balance is opening plus additions minus payments. Only purchases with status Awaiting Payment or Paid are counted.

## 1. Open the statement

```mermaid
flowchart TD
    A[Open Reports in sidebar] --> B[Open Payable Report]
    B --> C[Default Start Date to the first day of the current month]
    C --> D[Default End Date to today]
    D --> E[Default Supplier Type to All Types]
    E --> F[Build one section per contact type]
    F --> G[Fish Supplier section titled Payable for Supplier]
    F --> H[Material Supplier section titled Materials]
    F --> I[Cold Store Factory section titled Cold Store Charges Balance]
    G --> J[List supplier name, opening, add amount, paid amount, and balance]
    H --> K[List name, opening, add amount, paid amount, and balance]
    I --> L[List factory, opening, add amount, paid amount, and balance]
    J --> M[Show a Total Amount row for that section]
    K --> M
    L --> M
    M --> N[Show Prepared and Checked By signature lines]
```

## 2. Change the date range or supplier type

```mermaid
flowchart TD
    A[Statement is on screen] --> B[Set Start Date and End Date]
    B --> C{Choose Supplier Type}
    C -->|All Types| D[Keep all three sections]
    C -->|Fish Supplier| E[Show only Payable for Supplier]
    C -->|Material Supplier| F[Show only Materials]
    C -->|Cold Store Factory| G[Show only Cold Store Charges Balance]
    D --> H[Select Load Statement]
    E --> H
    F --> H
    G --> H
    H --> I[Reload the statement for the new range and type]
    I --> J[Show the statement date as the chosen End Date]
```

## 3. Export or print

```mermaid
flowchart TD
    A[Statement is on screen] --> B{Choose an export}
    B -->|Export Excel| C[Download Supplier Statement as Excel in a new tab]
    B -->|Print / Save PDF| D[Open a printable statement in a new tab]
    C --> E[Export carries the current Start Date, End Date, and Supplier Type]
    D --> E
```
