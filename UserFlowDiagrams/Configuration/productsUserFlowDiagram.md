# Products User Flow Diagram

> Products configured here are used in purchase, sales, and stock workflows.

```mermaid
flowchart TD
    A[User with Manage Products access] --> B[Open Configuration]
    B --> C[Open Products]
    C --> D[View product list]
    D --> D1[See code, name, type, purchase account, sales account, and actions]
    D --> D2[Search by product code or name]
    D --> D3[Filter by product type]
    D --> D4[Browse 12 products per page]
    D1 --> E{Choose an action}
    D2 --> D
    D3 --> D
    D4 --> D

    E -->|Add product| F[Enter unique code, name, product type, optional unit, and optional description]
    F --> F1{Purchased by the business?}
    F1 -->|Yes| F2[Enable and select Purchase Account]
    F1 -->|No| F3[Leave Purchase Account unset]
    F2 --> F4{Sold by the business?}
    F3 --> F4
    F4 -->|Yes| F5[Enable and select Sales Account]
    F4 -->|No| F6[Leave Sales Account unset]
    F5 --> F7[Save product]
    F6 --> F7
    F7 --> F8{Code already exists?}
    F8 -->|Yes| F9[Show duplicate-code error]
    F8 -->|No| F10{Save succeeds?}
    F10 -->|Yes| F11[Show success and refresh list]
    F10 -->|No| F12[Show save error]
    F11 --> D
    F9 --> F

    E -->|Edit product| G[Update code, name, type, unit, or description]
    G --> G1[Set whether the product is purchased and/or sold]
    G1 --> G2[Select the applicable purchase and/or sales accounts]
    G2 --> G3{Code used by another product?}
    G3 -->|Yes| G4[Show duplicate-code error]
    G3 -->|No| G5{Update succeeds?}
    G5 -->|Yes| G6[Show success and refresh list]
    G5 -->|No| G7[Show update error]
    G6 --> D
    G4 --> G

    E -->|Delete product| H[Confirm deletion]
    H -->|Cancel| D
    H -->|Confirm| I[Delete product]
    I --> I1{Linked to transactions or stock movements?}
    I1 -->|Yes| I2[Block deletion and show action denied]
    I1 -->|No| I3[Show success and refresh list]
    I2 --> D
    I3 --> D
```

## Quick guide

- Create a product with a unique **code**, a **name**, and an existing **product type**. Unit and description are optional.
- Mark whether the business purchases the product, sells it, or both. When enabled, select the corresponding **Purchase Account** and/or **Sales Account** from the Chart of Accounts. Leave the checkbox off when that activity does not apply.
- The account lists come from the Chart of Accounts. Coordinate account choices with the accountant so purchases and sales are recorded consistently.
- Search by code or name, filter by product type, and use the page controls to browse the list.
- Edit a product to maintain its details and accounting links. Codes must remain unique.
- Deletion requires confirmation and may be denied when the product is already linked to transactions or stock movements.
- Product types are selected here but maintained separately under **Product Types**.
