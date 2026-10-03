# Chart of Accounts User Flow Diagram

**Intended users:** Accountants or authorized finance staff. In the application, the Configuration menu displays this page for roles with the `manage_coa` permission.

```mermaid
flowchart TD
    A[Accountant or authorized finance user] --> B[Open Configuration]
    B --> C[Open Chart of Accounts]
    C --> D[View accounts]
    D --> D1[Browse All, Assets, Liabilities, Equity, Expenses, or Revenue]
    D1 --> D
    D --> D2[Search by account code or name]
    D2 --> D
    D --> D3[Browse 12 accounts per page]
    D3 --> D
    D --> E{Choose an action}

    E -->|Add account| F[Enter account type, unique code, name, and optional description]
    F --> F1[System derives account class from selected type]
    F1 --> F2{Code already exists?}
    F2 -->|Yes| F3[Show duplicate-code error]
    F2 -->|No| F4[Save account]
    F4 --> F5{Save succeeds?}
    F5 -->|Yes| F6[Show success and refresh list]
    F5 -->|No| F7[Show save error]
    F6 --> D
    F3 --> F

    E -->|Edit account| G[Change account type, code, name, or description]
    G --> G1[System derives account class from selected type]
    G1 --> G2{Code is used by another account?}
    G2 -->|Yes| G3[Show duplicate-code error]
    G2 -->|No| G4[Save changes]
    G4 --> G5{Update succeeds?}
    G5 -->|Yes| G6[Show success and refresh list]
    G5 -->|No| G7[Show update error]
    G6 --> D
    G3 --> G

    E -->|Delete account| H[Submit delete request]
    H --> H1{Delete succeeds?}
    H1 -->|Yes| H2[Show success and refresh list]
    H1 -->|No| H3[Show database error]
    H2 --> D
    H3 --> D
```

## Quick guide

- Use the chart to define the accounts used to organize the organization's financial activity. Set it up with the accountant responsible for the books.
- Every account needs a **unique code**, a **name**, and a **type**. The description is optional.
- Choose the type that reflects the account's purpose. The available types are grouped under Assets, Equity, Expenses, Liabilities, and Revenue. The system assigns the corresponding class automatically.
- Search by code or name, or use the class tabs to narrow the list. The page shows 12 accounts at a time.
- Review account changes with the accountant: other financial workflows use the chart. Before deleting an account, check whether it is already used; the application may reject deletion when the database prevents it.
- `manage_coa` controls whether the Chart of Accounts link appears in Configuration for a role. Give it only to the intended accountant/finance role.
