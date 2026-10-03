# Product Types User Flow Diagram

```mermaid
flowchart TD
    A[User with Manage Product Types access] --> B[Open Configuration]
    B --> C[Open Product Types]
    C --> D[View product types]
    D --> D1[See type name, rate, and actions]
    D1 --> D2[Browse 12 types per page]
    D1 --> E{Choose an action}
    D2 --> D

    E -->|Add type| F[Enter type name and integer rate]
    F --> F1{Type name already exists?}
    F1 -->|Yes| F2[Show duplicate-name error]
    F1 -->|No| F3[Save product type]
    F3 --> F4{Save succeeds?}
    F4 -->|Yes| F5[Show success and refresh list]
    F4 -->|No| F6[No explicit failure message is shown]
    F5 --> D
    F2 --> F

    E -->|Edit type| G[Change type name and integer rate]
    G --> G1{Another type has this name?}
    G1 -->|Yes| G2[Show duplicate-name error]
    G1 -->|No| G3[Save changes]
    G3 --> G4{Update succeeds?}
    G4 -->|Yes| G5[Show success and refresh list]
    G4 -->|No| G6[No explicit failure message is shown]
    G5 --> D
    G2 --> G

    E -->|Delete type| H[Confirm deletion]
    H -->|Cancel| D
    H -->|Confirm| I[Delete product type]
    I --> I1{Products are assigned to this type?}
    I1 -->|Yes| I2[Block deletion and show action denied]
    I1 -->|No| I3[Show success and refresh list]
    I2 --> D
    I3 --> D
```

## Quick guide

- Product types are labels used to classify products. They are selected when adding or editing a product.
- Each type has a **name** and an integer **rate**. Names must be unique. The application does not explain the business meaning of the rate, so confirm how it is used before changing it.
- Use this page to add, edit, and browse types. It shows 12 types per page.
- A type cannot be deleted while products are assigned to it. Reassign those products first, if appropriate.
- The sidebar displays this page to roles with the `manage_product_types` permission.
