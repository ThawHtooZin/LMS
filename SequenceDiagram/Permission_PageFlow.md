# Permission - Page Flow

Purpose:
- Assign access rights to a selected role.
- Save a comma-separated permission string for that role.

Connected files:
- [App/admin/permission.php](../App/admin/permission.php)
- [App/admin/managerole.php](../App/admin/managerole.php)
- [Auth/authrize.ctr.php](../Auth/authrize.ctr.php)
- [Controllers/query.ctr.php](../Controllers/query.ctr.php)
- Tables: role, permission

Query functions used:
- select($table, $id, $select_id)
- permission($permission, $role_id)

```mermaid
sequenceDiagram
    autonumber
    actor Admin
    participant Browser
    participant Page as permission.php
    participant Auth as authrize.ctr.php
    participant QueryBox as Query
    participant DB as Database

    Admin->>Browser: Click Permissions button
    Browser->>Page: GET permission.php?role_id=...
    Page->>Auth: checkadmin()
    Auth-->>Page: valid session

    Page->>QueryBox: select('role', role_id, 'role_id')
    QueryBox->>DB: SELECT * FROM role WHERE role_id = ?
    DB-->>QueryBox: role row
    QueryBox-->>Page: role_name

    Page->>DB: SELECT * FROM permission WHERE role_id = ?
    DB-->>Page: previous permission string
    Page-->>Browser: render checkboxes checked from stored string

    Admin->>Browser: Tick selected permissions
    Browser->>Page: POST save
    Page->>Page: build permissions_array
    Page->>Page: filter checked items
    Page->>Page: implode(',', $selected_permissions)

    Page->>QueryBox: permission(permissionString, role_id)
    QueryBox->>DB: SELECT * FROM permission WHERE role_id = ?
    DB-->>QueryBox: existing role permission row

    alt row exists
        QueryBox->>DB: UPDATE permission SET permission = ? WHERE role_id = ?
    else no row exists
        QueryBox->>DB: INSERT INTO permission(role_id, permission) VALUES(?, ?)
    end

    DB-->>QueryBox: save success
    QueryBox-->>Page: finished
    Page-->>Browser: redirect back to managerole.php
```

Validation map:
- Open permission page -> role name and saved permissions load
- Save with valid permissions -> update/insert row + redirect
- Save with no permissions -> empty string saved
- Missing role_id -> page cannot load proper role
- Missing session -> redirect login
- Re-open page -> all checked permissions appear again

Continued in:
- [ManageRoles_PageFlow.md](ManageRoles_PageFlow.md)
- other admin pages read permission values to decide access
