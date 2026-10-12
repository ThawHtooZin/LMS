# Shipment Export — User Flow

**Access:** The **Logestic** sidebar shows **Shippment Export** to roles with the `manage_shippmentexport` permission.

Shipment Export is the sea-freight packing list in `packingliststock`. Each row is one shipment: customer, country, invoice, and container. The lines of that shipment live in `packingliststockinfo`, and adding a line also creates the actual invoice, packing material, and invoice costing rows for that shipment.

## 1. Open the shipment list

```mermaid
flowchart TD
    A[Open Logestic in sidebar] --> B[Open Shippment Export]
    B --> C[Actual Packing List]
    C --> D[One row per shipment]
    D --> E[Columns: Date, Customer Name, Country, Invoice No, Container No]
    E --> F{Row action}
    F -->|Add Packing| G[Open Add Packing Data]
    F -->|Pencil| H[Edit that shipment header]
    F -->|List icon| I[Open the packing list for that shipment]
    F -->|Box icon| J[Open Packing Material for that shipment]
    F -->|Dollar icon| K[Open Invoice Costing for that shipment]
```

## 2. Add or edit a shipment

```mermaid
flowchart TD
    A[Add Packing] --> B[Date, customer, country, invoice no, container no]
    B --> C[Vessel name, voy name, and FDA]
    C --> D[Customer list is contacts marked as customers]
    D --> E[Add]
    E --> F[Insert packingliststock]
    H[Pencil on a row] --> I[Same fields, filled from the row]
    I --> J[Edit]
    J --> K[Update that packingliststock row]
```

## 3. Add packing lines

```mermaid
flowchart TD
    A[List icon] --> B[Actual Packing List for that shipment]
    B --> C[Header shows customer name, details, and phone]
    C --> D[Add Packing Stock]
    D --> E{Any commodity already on Form-10 Frozen?}
    E -->|No| F[Nothing On Stock, and Add Line stays disabled]
    E -->|Yes| G[Line grid: commodity, size, packing kg per box, mc]
    G --> H[Add another line or remove a line]
    H --> I[Keep at least one line]
    I --> J[Save]
    J --> K[Skip lines with no commodity]
    K --> L[Net weight is kg per box times mc]
    L --> M{Product name contains block or balachaung?}
    M -->|Yes| N[Store the line with net weight and no gross weight]
    M -->|No| O[Gross weight is net weight plus mc]
    N --> P[Also insert actual invoice, packing material, and invoice costing for that line]
    O --> P
```

The list columns are No, Commodity, Size, Packing Kg Per Box, Mc, Total Net Weight, and Total Gross Weight. **View** can limit the lines to one commodity. **Export** downloads this packing list.

## 4. Edit a line or its gross weight

```mermaid
flowchart TD
    A[Pencil on a packing line] --> B[Edit commodity, size, kg per box, and mc]
    B --> C[Recalculate net weight and gross weight]
    C --> D[Update the packing line, the actual invoice, invoice costing, and packing material]
    A --> E[Gross weight edit]
    E --> F[Type a total gross weight]
    F --> G[Store that figure on the packing line only]
```

## 5. Actual invoice and bank

```mermaid
flowchart TD
    A[Actual Invoice] --> B[Same lines with FOD/USD and Total USD]
    B --> C[Update Price Of USD]
    C --> D{Product name contains block?}
    D -->|Yes| E[Store the USD figure only]
    D -->|No| F[Total USD is USD times net weight]
    B --> G[Block lines can also type Total USD directly]
    B --> H[Page shows the shipment Total USD]
    H --> I[Pick a master bank]
    I --> J[Company, address, USD account, bank, swift, and branch fill in from that bank]
    J --> K[Save Bank Link]
    K --> L{A bank was selected?}
    L -->|No| M[Warning: select a Master Bank first]
    L -->|Yes| N[Link those bank details to this shipment]
    A --> O[Back returns to the packing list]
    B --> P[Export downloads the actual invoice]
```

**Back** on the header returns to the shipment list.

## Rules and details

- **One shipment** is one `packingliststock` row. Lines hang off it by `infoid`.
- **Commodities** on a new line come from distinct items already in Form-10 Frozen (`form10stock`). An empty list shows **Nothing On Stock**.
- **Net weight** is packing kg per box times mc. **Gross weight** is that net weight plus mc, except products whose name contains `block` or `balachaung`, which are saved without a gross weight.
- **Editing a line** rewrites the linked actual invoice, invoice costing, and packing material. A manual gross-weight edit changes only the packing line.
- **FOD/USD** times net weight is Total USD. A product whose name contains `block` stores the typed USD without that multiplication, and that line can also have Total USD typed in directly.
- **Bank link** requires a master bank. The form copies that bank's details, and they can still be edited before save.
- **No delete** of a shipment or a line from these screens.
