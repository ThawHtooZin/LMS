# HHK Mc Stock — User Flow

**Access:** The **Stock Control** sidebar shows **HHK Mc Stock** to roles with the `manage_hhkmcstock` permission.

HHK Mc Stock is the master-carton ledger in `hhkmcstock`. Each line is one pack: country, commodity, fish type, size, and kg. Stock comes in as **From Form-10** or **Balance**, and goes out as **HHK to GFC** or **Repacking Out**. A transfer also creates the matching row on [GFC Mc Stock](./gfcMcStockUserFlowDiagram.md). Combined HHK and GFC balances are read on [Mc Report](./mcReportUserFlowDiagram.md).

## 1. Open HHK Mc Stock and choose a country

```mermaid
flowchart TD
    A[Open Stock Control in sidebar] --> B[Open HHK Mc Stock]
    B --> C[Country tabs from distinct hhkmcstock countries]
    C --> D[Select a country tab]
    D --> E[Remember that country in the session]
    E --> F[Show only that country's table]
    F --> G[Commodity and fish-type filters follow the selected country]
```

## 2. Review on-hand Mc

```mermaid
flowchart TD
    A[Country table] --> B[One row per commodity, fish type, size, and kg]
    B --> C[Columns: Commodity, Country, Size, Kg, Total Mc]
    C --> D[Total Mc is stock in, minus HHK to GFC, minus Repacking Out]
    D --> E[In is a particular that contains neither to nor out]
    E --> F[Highlight the row green when Total Mc is over 200]
    F --> G{Header action}
    G -->|View with a commodity and fish type| H[Limit the table to that commodity and fish type]
    G -->|Add Mc Data| I[Open Add Data]
    G -->|Transfer Mc| J[Open Transfer Mc]
    G -->|Repacking Out Mc| K[Open Repacking Out Mc]
    G -->|List icon| L[Open HHK Mc Stock Info for that pack]
```

## 3. Add Mc

```mermaid
flowchart TD
    A[Add Mc Data] --> B[Date, fish type, size, kg, mc, optional remark]
    B --> C{Particular}
    C -->|From Form-10| D[Commodity list from Form-10 stock]
    D --> E[Country list from Form-10 countries]
    C -->|Balance| F[Commodity list from all Products]
    F --> G[Country typed in]
    E --> H[Add]
    G --> H
    H --> I[On-hand for that pack plus the new mc]
    I --> J[Insert hhkmcstock row]
    J --> K[Success: Mc Added Successfully]
    K --> L[Remember date, particular, and size for the next entry]
```

Fish types are G, egg, ggs, fillet, W, Cut Piece, Scaless, Bl's, and IQF.

## 4. Transfer Mc to GFC

```mermaid
flowchart TD
    A[Transfer Mc] --> B[Date, commodity, fish type, country, size, kg, mc, optional remark]
    B --> C[Particular is fixed to HHK To GFC]
    C --> D[Move]
    D --> E{On-hand for that pack is at least the mc?}
    E -->|No| F[Error: Invalid Data]
    E -->|Yes| G[Insert HHK row particular hhktogfc]
    G --> H[Insert matching GFC row linked by hhk_id]
    H --> I[HHK balance falls by mc; GFC balance rises by mc]
    I --> J[Success: Transfered Successfully]
```

## 5. Repacking Out

```mermaid
flowchart TD
    A[Repacking Out Mc] --> B[Date, commodity, fish type, country, size, kg, mc, optional remark]
    B --> C[Particular is fixed to Repacking Out]
    C --> D[Add]
    D --> E{On-hand for that pack is at least the mc?}
    E -->|No| F[Error: Invalid Data]
    E -->|Yes| G[Insert HHK row particular repackingout]
    G --> H[HHK balance falls by mc]
    H --> I[Success: Added Repacking Mc Successfully]
```

## 6. Line detail

```mermaid
flowchart TD
    A[List icon on a pack] --> B[HHK Mc Stock Info]
    B --> C[Rows for that size, commodity, country, and fish type]
    C --> D[Optional kg filter, then View]
    D --> E[Columns: date, particular, commodity, country, size, kg, mc, balance mc, loose in, loose out, remark]
    E --> F[Rows whose particular contains to are tinted red]
    F --> G{Click a cell}
    G -->|Row| H[Update date, particular, commodity, fish type, country, size, kg, mc, remark]
    G -->|Loose in or loose out| I[Edit loose size, kg, and pcs]
    G -->|Remark| J[Edit remark only]
    H --> K[Save the row, then rebuild balance mc for every HHK pack]
    K --> L[If this row created a GFC line, update that GFC line too]
    E --> M[Back returns to HHK Mc Stock]
```

Update particulars are Repacking Out, HHK to GFC, From Form-10, and Balance.

## Rules and details

- **One pack** is country + commodity + fish type + size + kg. The list and the on-hand check both use that key, so two kg values of the same size stay separate.
- **On-hand** is the sum of mc. Particulars that contain `to` (HHK to GFC) and particulars that contain `out` (Repacking Out) are subtracted. Anything else is added. A stored balance of 0 does not by itself block a transfer when this sum is still above zero.
- **Transfer and Repacking Out** are refused when the quantity is zero or greater than that on-hand. The message is **Invalid Data**.
- **Opening the list or the info page** rewrites `balance_mc` down the ledger so each row's balance matches that running sum.
- **No delete** on the list. Corrections are done from the info page.
- **Green rows** are a display hint only: Total Mc over 200.
- **Remarks containing packing** are left out of the country list.
