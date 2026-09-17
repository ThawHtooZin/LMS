# Manage Roles - Page Flow

Purpose:
- View, add, edit, delete roles.
- Open permissions page for each role.

Connected files:
- [App/admin/managerole.php](../App/admin/managerole.php)
- [App/admin/permission.php](../App/admin/permission.php)
- [Auth/authrize.ctr.php](../Auth/authrize.ctr.php)
- [Controllers/query.ctr.php](../Controllers/query.ctr.php)
- Tables: role, permission

Query functions used:
- selectall($table)
- select($table, $id, $select_id)
- addrole($role_name)
- updaterole($role_id, $role_name)
- deleterole($delete_role_id)
- permission($permission, $role_id)

```mermaid
sequenceDiagram
    autonumber
    actor Admin
    participant Browser
    participant Page as managerole.php
    participant PermissionPage as permission.php
    participant Auth as authrize.ctr.php
    participant QueryBox as Query
    participant DB as Database

    Admin->>Browser: Open page
    Browser->>Page: GET managerole.php
    Page->>Auth: checkadmin()
    Auth-->>Page: valid session

    Page->>QueryBox: selectall('role')
    QueryBox->>DB: SELECT * FROM role
    DB-->>QueryBox: all roles
    QueryBox-->>Page: role list
    Page-->>Browser: render table

    Admin->>Browser: Click Add Role
    Browser->>Page: POST addrolebtn
    Page->>QueryBox: addrole(role_name)
    QueryBox->>DB: INSERT INTO role(role_name)
    DB-->>QueryBox: success
    QueryBox-->>Page: Role added
    Page-->>Browser: refresh list

    Admin->>Browser: Click Edit
    Browser->>Page: POST updaterolebtn
    Page->>QueryBox: updaterole(role_id, role_name)
    QueryBox->>DB: UPDATE role SET role_name = ? WHERE role_id = ?
    DB-->>QueryBox: success
    QueryBox-->>Page: Role updated
    Page-->>Browser: refresh list

    Admin->>Browser: Click Delete
    Browser->>Page: POST deletebtn
    Page->>QueryBox: deleterole(role_id)
    QueryBox->>DB: DELETE FROM role WHERE role_id = ?
    DB-->>QueryBox: success
    QueryBox-->>Page: Role deleted
    Page-->>Browser: refresh list

    Admin->>Browser: Click Permissions
    Browser->>PermissionPage: GET permission.php?role_id=...
    PermissionPage->>QueryBox: select('role', role_id, 'role_id')
    QueryBox->>DB: SELECT * FROM role WHERE role_id = ?
    DB-->>QueryBox: role record
    PermissionPage->>DB: SELECT * FROM permission WHERE role_id = ?
    DB-->>PermissionPage: saved permissions
    PermissionPage-->>Browser: permission checklist

    Admin->>Browser: Save permissions
    Browser->>PermissionPage: POST save
    PermissionPage->>QueryBox: permission(permissionString, role_id)
    QueryBox->>DB: INSERT/UPDATE permission row
    DB-->>QueryBox: success
    QueryBox-->>PermissionPage: saved
    PermissionPage-->>Browser: success alert
```

Validation map:
- Load page -> table loads
- Add role -> DB insert + refresh
- Edit role -> DB update + refresh
- Delete role -> DB delete + refresh
- Invalid empty role name -> validation/error path
- Open permissions -> gets role + permission data
- Save permissions -> saves role access list
- Missing session -> redirect login

Continued in:
- [ManageAccounts_PageFlow.md](ManageAccounts_PageFlow.md)
- other admin pages use permission values to restrict access