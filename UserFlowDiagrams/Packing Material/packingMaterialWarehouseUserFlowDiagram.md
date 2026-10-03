# Packing Material W/H — User Flow

This diagram documents warehouse stock summaries, issue-to-coldstore outputs, and item movement details. The coldstore-side Use, Transfer, Return, and Damaged actions are covered in the [Packing Material Gate Pass workflow](./packingMaterialGatePassUserFlowDiagram.md).

## 1. Review packing material stock

```mermaid
flowchart TD
    A[Open Packing Material → Packing Material W/H] --> B[Load distinct material IDs with warehouse transactions]
    B --> C[Sort by material ID and show 13 items per page]
    C --> D[Resolve each material name from Products]
    D --> E[Sum all incoming and outgoing quantities for each item]
    E --> F[Show Packing Material Item, In, Out, Balance, and Detail]
    F --> G{Choose an action}
    G -->|Output| H[Open Output Stock dialog]
    G -->|Detail| I[Open movement history for that material]
    G -->|Navigate pages| J[Use First, Previous, Next, or Last]
    J --> C
```

## 2. Issue warehouse stock to a coldstore

```mermaid
flowchart TD
    A[Open Output Stock dialog] --> B[Enter required Date]
    B --> C[Select Stock To from Configuration Coldstore names]
    C --> D[Select a material already present in warehouse transactions]
    D --> E[Enter required GatePass Voucher No and Quantity]
    E --> F[Submit Output]
    F --> G[Calculate available quantity from all warehouse In and Out transactions]
    G --> H{Available quantity is less than requested quantity?}
    H -->|Yes| I[Show Not enough quantity warning and leave stock unchanged]
    H -->|No| J[Create destination-side stock output group entry]
    J --> K[Create warehouse Out entry linked to the output group]
    K --> L[Warehouse balance decreases; output is associated with destination and gate-pass voucher]
    L --> M[Reload warehouse stock summary]
    M --> N[Coldstore receives stock for use, transfer, return, or damage management in Gate Pass]
```

## 3. Record incoming stock through Account Purchase

```mermaid
flowchart TD
    A[Open Account → Purchase] --> B[Create purchase with type Material]
    B --> C[Choose supplier, date, voucher, and currency]
    C --> D[Add product lines with Pcs quantity, unit price, and account]
    D --> E{Need another material line?}
    E -->|Yes| F[Add a new line and enter its details]
    F --> D
    E -->|No| G[Save draft, submit for approval, or approve]
    G --> H{Approve purchase?}
    H -->|No| I[Draft or Awaiting Approval; no stock-in or payable posting yet]
    H -->|Yes| J[Set status to Awaiting Payment]
    J --> K[Create warehouse In movement for each material line]
    J --> L[Debit selected line accounts and credit A/P control 2000]
    J --> M[Bill appears in Account → A/C Payable]
    K --> N[Incoming quantities contribute to the W/H item balance]
    J --> O{Later edit or void the approved unpaid bill?}
    O -->|Edit| P[Refresh its related warehouse movement]
    O -->|Void| Q[Remove its related warehouse movement]
```

## 4. Inspect material movements

```mermaid
flowchart TD
    A[Select Detail for a material] --> B[Open that material's Store Detail]
    B --> C[Load movement rows ordered by row ID]
    C --> D[Show 13 movement rows per page]
    D --> E[Review date, warehouse voucher, Stock To, G/P Voucher No, supplier, description, unit, In, Out, and Balance]
    E --> F{More movement pages?}
    F -->|Yes| G[Use First, Previous, Next, or Last]
    G --> D
    F -->|No| H[Select Back to warehouse summary]
```

## Rules and details

- The summary aggregates every warehouse transaction for each material: **In** is the sum of incoming quantities, **Out** is the sum of outgoing quantities, and **Balance** is In minus Out. Items with no warehouse transaction do not appear.
- The Packing Material workflow uses **Account → Purchase** with type **Material** for stock-in; the Warehouse page itself exposes an **Output** action, not a direct stock-in form. A Material purchase can contain multiple lines, and approval creates a warehouse In movement for each line. It also becomes an **Awaiting Payment** bill, posts its line-account debits and A/P control account `2000` credit to General Ledger, and appears in **Account → A/C Payable**. See the [Account Purchase workflow](../Account/purchaseUserFlowDiagram.md).
- The separate **Packing Material Purchase** screen is not part of this workflow.
- The Output dialog takes a date, a configured coldstore destination, a previously stocked material, a GatePass Voucher No, and a quantity. If the requested quantity is greater than current stock, the page warns **Not enough quantity** and does not call the output operation.
- A successful output creates both a stock-issue transaction in the warehouse and a destination-side stock output group record. The movement detail resolves the destination and gate-pass voucher from that linked record; incoming purchase entries display their supplier and warehouse voucher.
- Movement details show material unit from Products, supplier name when the supplier ID resolves to a contact, and description when present. The **Back** action returns to the warehouse list.
- Server-side output validation requires a positive quantity, a valid configured coldstore destination, a material present in warehouse stock, and sufficient available quantity. Invalid submissions show an error and do not create an output.
- Movement balances continue across pages, using transactions before the displayed page as the opening balance.
