# Manage Banks User Flow Diagram

```mermaid
flowchart TD
    A[User with Manage Bank access] --> B[Open Configuration]
    B --> C[Open Manage Banks]
    C --> D[View system bank accounts]
    D --> D1[See code, bank name, account type, USD account, company name, SWIFT code, and actions]
    D1 --> E{Choose an action}

    E -->|Add bank account| F[Enter required account code and bank name]
    F --> F1[Optionally enter account type, USD account, SWIFT code, company name, branch name, and addresses]
    F1 --> F2{Code already exists in Chart of Accounts?}
    F2 -->|Yes| F3[Show duplicate-code error]
    F2 -->|No| F4[Create bank account and matching Current Asset account]
    F4 --> F5{Save succeeds?}
    F5 -->|Yes| F6[Show success and refresh list]
    F5 -->|No| F7[Roll back changes and show error]
    F6 --> D
    F3 --> F

    E -->|Edit bank account| G[Update account code and bank name]
    G --> G1[Optionally update account type, USD account, SWIFT code, company, branch, and addresses]
    G1 --> G2{New code is already used?}
    G2 -->|Yes| G3[Show duplicate-code error]
    G2 -->|No| G4[Update bank details and matching Chart of Accounts code/name]
    G4 --> G5{Save succeeds?}
    G5 -->|Yes| G6[Show success and refresh list]
    G5 -->|No| G7[Roll back changes and show error]
    G6 --> D
    G3 --> G

    E -->|Delete bank account| H[Confirm deletion]
    H -->|Cancel| D
    H -->|Confirm| I[Delete bank details and matching Chart of Accounts entry]
    I --> I1{Deletion succeeds?}
    I1 -->|Yes| I2[Show success and refresh list]
    I1 -->|No| I3[Roll back changes and show transaction-history denial]
    I2 --> D
    I3 --> D
```

## Quick guide

- Manage Banks records the bank account details used by the system. **Account code** and **bank name** are required; the remaining details are optional.
- Adding a bank account also creates a matching **Current Asset** account in the Chart of Accounts. Its code must not already exist there.
- Editing keeps the bank details and matching Chart of Accounts account code/name synchronized. Choose a code that is not already used by another account.
- Deleting removes both the bank details and the matching Chart of Accounts entry. The application may block deletion when the account has transaction history.
- The Configuration sidebar shows Manage Banks to roles with the `manage_bank` permission.
