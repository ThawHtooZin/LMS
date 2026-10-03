# Packing Material Gate Pass — User Flow

**Access:** The Packing Material sidebar shows **Packing Material Gate Pass** to users with the `material_gatepass` permission.

This screen manages packing material held at configured coldstores. It is separate from the main warehouse stock summary, but stock moves between them through the warehouse Output and Gate Pass Return actions.

## 1. Open a coldstore stock balance

```mermaid
flowchart TD
    A[Open Packing Material → Packing Material Gate Pass] --> B[Load coldstore locations with Gate Pass transactions]
    B --> C{Choose a coldstore tab}
    C -->|Select location| D[Set active coldstore location]
    C -->|No active location yet| E[Select the first available location]
    D --> F[Show distinct materials with transactions at this location]
    E --> F
    F --> G[Calculate each material balance as total In minus total Out]
    G --> H[Show material, In, Out, Balance, and Detail]
    H --> I{Choose an action}
    I -->|Manage| J[Open Manage Stock form]
    I -->|Detail| K[Open selected material's movement history]
    I -->|Navigate pages| L[Use First, Previous, Next, or Last]
    L --> F
```

## 2. Manage stock at a coldstore

```mermaid
flowchart TD
    A[Select Manage] --> B[Choose Action Type: Use, Transfer, Return, or Damaged]
    B --> C[Enter Date, Packing Material Item, Voucher No, and Quantity]
    C --> D[Optionally enter Description]
    B -->|Transfer only| E[Choose Transfer To coldstore]
    C --> F[Submit Manage]
    E --> F
    F --> G[Check available quantity for the selected material]
    G --> H{Requested quantity exceeds checked availability?}
    H -->|Yes| I[Show Not enough quantity warning; do not save the movement]
    H -->|No| J[Write an Out movement for the active coldstore]
    J --> K{Selected action}
    K -->|Use| L[Record stock used; no destination In movement]
    K -->|Damaged| M[Record stock damaged; no destination In movement]
    K -->|Transfer| N[Write a matching In movement for Transfer To coldstore]
    K -->|Return| O[Write an In movement back to Packing Material W/H]
    L --> P[Refresh coldstore balances]
    M --> P
    N --> P
    O --> Q[Refresh coldstore balances and main W/H stock]
```

## 3. Follow the connected stock movements

```mermaid
flowchart LR
    A[Account → Purchase: approve a Material purchase] --> B[Material quantity enters Packing Material W/H]
    B --> C[W/H Output: issue quantity to a configured coldstore]
    C --> D[Gate Pass: coldstore receives an In movement]
    D --> E{Gate Pass action}
    E -->|Use or Damaged| F[Coldstore records Out quantity]
    E -->|Transfer| G[Source coldstore Out; destination coldstore In]
    E -->|Return| H[Coldstore Out; Packing Material W/H In]
```

## 4. Inspect coldstore movements

```mermaid
flowchart TD
    A[Select Detail for a material] --> B[Open material movement history for the active coldstore]
    B --> C[Load movements in row ID order]
    C --> D[Show 13 rows per page]
    D --> E[Review date, voucher, description, action, In, Out, and Balance]
    E --> F{More movement pages?}
    F -->|Yes| G[Use First, Previous, Next, or Last]
    G --> D
    F -->|No| H[Select Back to Gate Pass]
```

## Rules and details

- Coldstore tabs are built from the locations already present in Gate Pass transactions. The active location determines which stock summary and movement detail are displayed.
- **Manage Stock** requires a date, material, voucher number, and quantity in the form. Description is optional. **Transfer To** is shown only for a Transfer action. There are no edit or delete controls for recorded movements.
- Every successful action records an **Out** movement for the active coldstore. **Transfer** also records an **In** movement for the selected destination. **Return** adds the quantity back to Packing Material W/H. **Use** and **Damaged** have no additional stock destination.
- Warehouse **Output** creates an In movement at the selected coldstore and an Out movement in Packing Material W/H. The Gate Pass and warehouse movement details are separate histories of the connected issue.
- Gate Pass stock movements do not create General Ledger entries in this flow.
- **Availability caveat:** the form's pre-submit check totals Gate Pass In and Out quantities for that material across all coldstores, rather than checking the active coldstore's balance. It also does not enforce a positive quantity or validate the submitted action and transfer destination server-side. A movement may therefore overdraw a particular coldstore or accept an invalid quantity/destination.
- **Feedback caveat:** the page displays a warning for insufficient quantity, but does not show a clear success/error result after a successful Manage action.
- **Balance caveat:** movement details start the running balance at zero on each page, so later pages do not include earlier-page movements in the displayed balance.
- The Purchase → Warehouse → coldstore stock path is documented in the [Packing Material W/H workflow](./packingMaterialWarehouseUserFlowDiagram.md).
