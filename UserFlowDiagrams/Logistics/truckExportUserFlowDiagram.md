# Truck Export — User Flow

**Access:** The **Logestic** sidebar shows **Truck Export** to roles with the `manage_truckexport` permission.

Truck Export is the road-freight packing list in `truckpackingliststock`. Each row is one truck load: date, invoice number, and truck number. Adding a fish line also creates the actual invoice, foam box, declare list, and total costing rows for that invoice.

## 1. Open the truck list

```mermaid
flowchart TD
    A[Open Logestic in sidebar] --> B[Open Truck Export]
    B --> C[Truck Actual Packing List]
    C --> D[Columns: Date, Invoice No, Truck No]
    D --> E{Row action}
    E -->|Add Packing| F[Open Add Packing Data]
    E -->|Pencil| G[Edit that truck header]
    E -->|List icon| H[Open the packing list for that invoice]
    E -->|Box icon| I[Open Packing Material for that invoice]
    E -->|Dollar icon| J[Open Total Costing for that invoice]
```

## 2. Add or edit a truck

```mermaid
flowchart TD
    A[Add Packing] --> B[Date, invoice no, and truck no]
    B --> C[Add]
    C --> D[Insert truckpackingliststock]
    G[Pencil on a row] --> H[Same three fields]
    H --> I[Edit]
    I --> J[Update the truck row]
    J --> K[If the invoice number changed, rewrite it on the lines, declare list, foam boxes, actual invoice, and total costing]
```

## 3. Add packing lines

```mermaid
flowchart TD
    A[List icon] --> B[Actual Packing List]
    B --> C[Header shows Yangon loading date, invoice no, and truck no]
    C --> D[Add Packing Stock]
    D --> E{Any commodity already on Form-10 TCL?}
    E -->|No| F[Nothing On Stock, and Add Stock stays disabled]
    E -->|Yes| G[Line grid: commodity, size, pcs per box, kg per box, mc]
    G --> H[Add another line or remove a line]
    H --> I[Keep at least one line]
    I --> J[Add Stock]
    J --> K[Skip lines with no commodity]
    K --> L[Net weight is kg per box times mc]
    L --> M[Gross weight is mc times 60]
    M --> N[Insert the packing line]
    N --> O[Also insert actual invoice, foam box, declare list, and total costing linked to that line]
```

The packing list columns are No, Commodity, Size, Pcs Per Box, Packing Kg Per Box, Mc, Total Net Weight, and Total Gross Weight. Totals under the table show foam boxes, net weight, and gross weight. **View** can limit the lines to one commodity. **Excel Report** on this tab exports the packing list.

A pencil on a line edits commodity, size, pcs per box, kg per box, and mc, then recalculates net and gross and updates the linked declare, foam box, invoice, and costing rows.

## 4. Switch the working view

```mermaid
flowchart TD
    A[Actual Packing List is the opening view] --> B{Header button}
    B -->|Actual Invoice| C[Price per kg and total value USD]
    B -->|Foam Box| D[Foam box numbers]
    B -->|Declare List| E[Declared kg per box]
    C --> F[Back returns to the packing list]
    D --> F
    E --> F
    A --> G[The red Back button returns to the truck list]
```

Each of those three views has its own **Excel Report**, shown only while that view is open. **Add Packing Stock** is only on the packing list.

## 5. Actual invoice

```mermaid
flowchart TD
    A[Actual Invoice] --> B[Columns add Price Per Kg USD and Total Value USD]
    B --> C[Update Price Of USD]
    C --> D[Total value is the USD price times net weight]
    D --> E[Page total shows Total Value USD]
```

New lines start at 0 USD until a price is entered.

## 6. Foam box and declare list

```mermaid
flowchart TD
    A[Foam Box] --> B[Enter a foam box number on a line]
    B --> C[Add]
    C --> D[Store that number and count the boxes for the invoice]
    E[Declare List] --> F[Enter kg per box on a line]
    F --> G[Add]
    G --> H[Declared net weight is mc times that kg per box]
```

A new line is created with an empty foam box number, and with declared kg per box and declared net weight at 0, until these two screens are filled in.

## Rules and details

- **One truck load** is one `truckpackingliststock` row. Child rows share its invoice number and point back with `link_id`.
- **Changing the invoice number** on the header updates the packing lines, declare list, foam boxes, actual invoice, and total costing so they stay on the new number.
- **Commodities** come from distinct items already in Form-10 TCL (`form10stocktcl`). An empty list shows **Nothing On Stock**.
- **Packing weights.** Net weight is kg per box times mc. Gross weight is mc times 60.
- **Four records per line.** Saving a packing line also inserts `truckactualinvoice`, `truckfoambox`, `truckdeclare`, and `trucktotalcosting`. Editing the packing line updates those linked rows.
- **Declare kg** is separate from the packing kg per box. It starts at 0 and is typed later on the Declare List.
- **No delete** of a truck or a line from these screens.
