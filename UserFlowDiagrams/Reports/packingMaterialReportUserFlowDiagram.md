# Packing Material Report — User Flow

**Access:** The Reports sidebar shows Packing Material Report to roles with the `packing_material_report` permission.

The sidebar page is a hub with three cards. The payable card opens the same Supplier Statement used by Payable Report. The `type=material` value on that link is not applied, so the statement still defaults to All Types.

## 1. Choose a packing material report

```mermaid
flowchart TD
    A[Open Reports in sidebar] --> B[Open Packing Material Report]
    B --> C[Show three cards]
    C -->|LM WareHouse Report| D[Open Packing Material Link Mark WareHouse Report]
    C -->|Packing Material Payable Report| E[Open Link Mark Supplier Statement]
    C -->|Gate Pass Report| F[Open Packing Material Gate Pass Report]
```

## 2. Warehouse report

```mermaid
flowchart TD
    A[Open LM WareHouse Report] --> B[Show warehouse movements]
    B --> C[Default columns: Id, Date, Voucher No, Supplier, Item Name, Unit, In, Out, Balance]
    B --> D[Select Select Report]
    D --> E[Set Start Date and End Date]
    E --> F{Choose a report type}
    F -->|All Data| G[Select Show]
    F -->|Total In| G
    F -->|Total Out| G
    F -->|Each Material Total In/Out| H[Choose a packing material, then Show]
    F -->|Each Material Balance| H
    F -->|Each Material Balance Amount| H
    G --> I[Save the dates and report type, then reload the table]
    H --> I
    I --> J[Page the result, 13 rows at a time]
    J --> K[Move with First, previous, next, and Last]
    D --> L[Select Close to leave the filter unchanged]
```

## 3. Gate Pass report

```mermaid
flowchart TD
    A[Open Gate Pass Report] --> B[Show a button for each gate-pass destination]
    B --> C[Select a destination]
    C --> D[Remember that destination and reload]
    D --> E[Select Select Report]
    E --> F[Set Start Date and End Date]
    F --> G{Choose a report type}
    G -->|All Data, Total In, or Total Out| H[Select Show]
    G -->|Each Material Total In/Out, Balance, or Balance Amount| I[Choose a material used by the current destination, then Show]
    H --> J[Reload gate-pass rows for the date range]
    I --> J
    J --> K[Page the result, 13 rows at a time]
```

## 4. Packing Material Payable Report

```mermaid
flowchart TD
    A[Select Packing Material Payable Report] --> B[Open Link Mark Supplier Statement]
    B --> C[Default range is the first day of this month through today]
    C --> D[Default supplier type is All Types]
    D --> E[Follow the Payable Report flow to filter, load, export, or print]
```
