# Manage Accounts - Page Flow

Purpose:
- View, create, update, delete admin accounts.

Connected files:
- [App/admin/manageaccounts.php](../App/admin/manageaccounts.php)
- [Auth/authrize.ctr.php](../Auth/authrize.ctr.php)
- [Controllers/query.ctr.php](../Controllers/query.ctr.php)
- [Controllers/ValidatorInstance.php](../Controllers/ValidatorInstance.php)
- Tables: accounts, role

Query functions used:
- selectall($table)
- select($table, $id, $select_id)
- createaccount($table, $username, $password, $email, $role)
- updateaccount($table, $username, $password, $email, $role, $updateid)
- deleteaccount($table, $deleteid)

```mermaid
sequenceDiagram
    autonumber
    actor Admin
    participant Browser
    participant Page as manageaccounts.php
    participant Auth as authrize.ctr.php
    participant Validator as ValidatorInstance
    participant QueryBox as Query
    participant DB as Database

    Admin->>Browser: Open page
    Browser->>Page: GET manageaccounts.php
    Page->>Auth: checkadmin()
    Auth-->>Page: valid session

    Page->>QueryBox: selectall('accounts')
    QueryBox->>DB: SELECT * FROM accounts ORDER BY id
    DB-->>QueryBox: rows
    QueryBox-->>Page: account list

    Page->>DB: SELECT * FROM accounts ORDER BY id LIMIT offset, 8
    DB-->>Page: paginated rows

    loop each row
        Page->>QueryBox: select('role', role_id, 'role_id')
        QueryBox->>DB: SELECT * FROM role WHERE role_id = ?
        DB-->>QueryBox: role name
        QueryBox-->>Page: role_name
    end

    Admin->>Browser: Click Add User
    Browser->>Page: POST createaccount
    Page->>Validator: validate username/password/email
    Validator-->>Page: valid or invalid

    alt valid
        Page->>QueryBox: createaccount(...)
        QueryBox->>DB: INSERT INTO accounts(...)
        DB-->>QueryBox: success
        QueryBox-->>Page: Account Created Successfully
        Page-->>Browser: success alert
    else invalid
        Page-->>Browser: warning alert
    end

    Admin->>Browser: Click Edit
    Browser->>Page: POST updateaccount
    Page->>QueryBox: updateaccount(...)
    QueryBox->>DB: UPDATE accounts SET ... WHERE id = ?
    DB-->>QueryBox: success
    QueryBox-->>Page: Account Updated Successfully
    Page-->>Browser: success alert

    Admin->>Browser: Click Delete
    Browser->>Page: POST deletebutton
    Page->>QueryBox: deleteaccount(...)
    QueryBox->>DB: DELETE FROM accounts WHERE id = ?
    DB-->>QueryBox: success
    QueryBox-->>Page: Account Deleted Successfully
    Page-->>Browser: success alert
```

Validation map:
- Load page -> list loads
- Add valid user -> DB insert + success alert
- Add invalid username -> warning
- Add invalid email -> warning
- Update valid record -> DB update + success
- Delete record -> confirm + DB delete + success
- Missing session -> redirect login

Continued in:
- [ManageRoles_PageFlow.md](ManageRoles_PageFlow.md)
- [App/admin/permission.php](../App/admin/permission.php)

- `toggleInputPassword(inputId, iconId)`

---

## 9) End-to-end overall flow

```mermaid
sequenceDiagram
    autonumber
    actor Admin
    participant Browser
    participant Page as manageaccounts.php
    participant Auth as authrize.ctr.php
    participant Query as Query class
    participant Validator
    participant DB as Database

    Admin->>Browser: Log in as admin
    Browser->>Page: Load Manage Accounts page
    Page->>Auth: checkadmin()
    Auth-->>Page: Access granted
    Page->>DB: Load accounts list
    DB-->>Page: Records
    Page-->>Browser: Show table

    Admin->>Browser: Add account
    Browser->>Page: POST createaccount
    Page->>Validator: Validate fields
    Page->>Query: createaccount(...)
    Query->>DB: INSERT

    Admin->>Browser: Update account
    Browser->>Page: POST updateaccount
    Page->>Query: updateaccount(...)
    Query->>DB: UPDATE

    Admin->>Browser: Delete account
    Browser->>Page: POST deletebutton
    Page->>Query: deleteaccount(...)
    Query->>DB: DELETE

    Page-->>Browser: Refresh list and show notifications
```

---

## 10) Summary

The Manage Accounts page is a standard admin CRUD page with:

- Create new account
- Read all account data
- Update account details
- Delete account
- Role-based display from `role` table
- Client-side password toggle
- Pagination
- Server-side validation

This makes the complete flow from admin action to database update easy to trace.
