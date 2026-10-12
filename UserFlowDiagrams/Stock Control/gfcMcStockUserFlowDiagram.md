# GFC Mc Stock — User Flow

**Access:** The **Stock Control** sidebar shows **GFC Mc Stock** to roles with the `manage_gfcmcstock` permission.

GFC Mc Stock is the master-carton ledger in `gfcmcstock`. Cartons arrive from [HHK Mc Stock](./hhkMcStockUserFlowDiagram.md) when someone transfers **HHK to GFC**, or from **Add Balance** on this page. They leave through **Export Mc** (particulars that contain ship or t/o). Combined balances are read on [Mc Report](./mcReportUserFlowDiagram.md).

## 1. Open GFC Mc Stock and choose a country

```mermaid
flowchart TD
    A[Open Stock Control in sidebar] --> B[Open GFC Mc Stock]
    B --> C[Country tabs from distinct gfcmcstock countries]
    C --> D[Select a country tab]
    D --> E[Remember that country in the session]
    E --> F[Show only that country's table]
    F --> G[Commodity and fish-type filters follow the selected country]
```

## 2. Review on-hand Mc

```mermaid
flowchart TD
    A[Country table] --> B[One row per commodity, fish type, and size]
    B --> C[Columns: Commodity, Country, Size, Total Mc]
    C --> D[Add mc unless the particular contains ship or t/o]
    D --> E[Those particulars are subtracted]
    E --> F[Highlight the row green when Total Mc is over 200]
    F --> G{Header action}
    G -->|View with a commodity and fish type| H[Limit the table to that commodity and fish type]
    G -->|Add Balance| I[Open Add Data]
    G -->|Export Mc| J[Open Export Mc]
    G -->|List icon| K[Open GFC Mc Stock Info for that size]
```

## 3. Add a balance

```mermaid
flowchart TD
    A[Add Balance] --> B[Date, commodity from Products, fish type, size, kg, mc]
    B --> C[Particular defaults to Balance and can be edited]
    C --> D[Country is typed in]
    D --> E[Add]
    E --> F{A previous row exists for that kg, size, commodity, fish type, and country?}
    F -->|Yes| G[New balance mc is the previous balance plus this mc]
    F -->|No| H[New balance mc is this mc]
    G --> I[Insert gfcmcstock row]
    H --> I
    I --> J[Success: Mc Added Successfully]
```

## 4. Export Mc

```mermaid
flowchart TD
    A[Export Mc] --> B[Date, commodity already on GFC stock, fish type, country, size, kg, mc]
    B --> C[Particular defaults to Ship/ and can be edited]
    C --> D[Export]
    D --> E[Find the latest GFC row for that kg, size, commodity, fish type, and country]
    E --> F[New balance mc is that balance minus the export mc]
    F --> G[Insert gfcmcstock row]
    G --> H[Success: Exported Successfully]
```

## 5. Line detail

```mermaid
flowchart TD
    A[List icon on a size] --> B[GFC Mc Stock Info]
    B --> C[Rows for that size, commodity, country, and fish type]
    C --> D[Optional kg filter, then View]
    D --> E[Columns: date, particular, commodity, country, size, kg, mc, balance mc, loose in, loose out, remark]
    E --> F{Click a cell}
    F -->|Row| G[Update date, particular, commodity, fish type, country, size, kg, mc]
    F -->|Loose in or loose out| H[Edit loose size, kg, and pcs]
    F -->|Remark| I[Edit remark only]
    G --> J[Recalculate balance mc from the previous row of the same pack]
    J --> K[Particulars that contain ship or t/o subtract; every other particular adds]
    K --> L[Rewrite balance mc on later rows of that same pack]
    E --> M[Back returns to GFC Mc Stock]
```

## Rules and details

- **List grouping** is commodity + fish type + size. Kg is not part of the list row. The info page can still filter one kg.
- **Balance math on the list** treats a particular as an issue when it contains `ship` or `t/o`. Balance, HHK to GFC, and any other wording are receipts.
- **Add Balance** stacks onto the latest `balance_mc` of the same kg, size, commodity, fish type, and country. The first row of a pack starts at the entered mc.
- **Export** always subtracts from that latest balance. The particular text is what later screens use to recognise an issue, so leaving **Ship/** in place keeps the export as an out movement.
- **HHK transfers** insert a GFC row with the same commodity, fish type, country, size, kg, and mc, and store the HHK row id in `hhk_id`. Editing that HHK row can update the linked GFC row. See [HHK Mc Stock](./hhkMcStockUserFlowDiagram.md).
- **No delete** on the list. Corrections are done from the info page.
- **Green rows** are a display hint only: Total Mc over 200.
