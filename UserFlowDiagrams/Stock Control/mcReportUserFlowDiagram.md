# Mc Report — User Flow

**Access:** The **Stock Control** sidebar shows **Mc Report** to roles with the `manage_mcreport` permission.

Mc Report reads the latest master-carton balance from [HHK Mc Stock](./hhkMcStockUserFlowDiagram.md) and [GFC Mc Stock](./gfcMcStockUserFlowDiagram.md). It does not include [TCL Mc Stock](./tclMcStockUserFlowDiagram.md). The same screen is also opened from **Reports → Stock Report → Mc Report**.

## 1. Open Mc Report and choose a country

```mermaid
flowchart TD
    A[Open Stock Control in sidebar] --> B[Open Mc Report]
    B --> C[Country tabs from countries on HHK or GFC Mc stock]
    C --> D[Select a country tab]
    D --> E[Remember that country in the session]
    E --> F[Commodity and fish-type lists follow the selected country]
    F --> G[Show that country's Mc table]
```

## 2. Read balances

```mermaid
flowchart TD
    A[Country table] --> B{View}
    B -->|Commodity left on View Each Commodity| C[Every commodity for that country]
    B -->|A commodity and a fish type, then View| D[That commodity and fish type only]
    C --> E[One row per size, kg, and fish type]
    D --> E
    E --> F[Columns: No, Fish Name, Country, Size, Kg, HHK Mc, GFC Mc, Total Mc]
    F --> G[HHK Mc is the latest HHK balance for that pack]
    G --> H[GFC Mc is the latest GFC balance for that pack]
    H --> I[Total Mc is HHK Mc plus GFC Mc]
    I --> J[A zero balance is shown as a dash]
    J --> K[Hide the row when both HHK and GFC balances are zero]
    K --> L[Footer totals for the Mc columns that are on screen]
```

Rows used to build the list skip particulars that contain `to`, and skip remarks that contain packing. The Mc numbers themselves are still the latest stored `balance_mc`, including transfer rows.

## 3. Date search

```mermaid
flowchart TD
    A[Date Search] --> B[Mc Reports With Date]
    B --> C[Filter With Date]
    C --> D[Country, Date From, and Date To]
    D --> E[Search]
    E --> F[Store country and dates in the session]
    F --> G[Show packs that have an HHK or GFC row in that range]
    G --> H[Same columns, without a separate Country column]
    H --> I[Header shows the country and the from and to dates]
    I --> J[Excel Report exports that dated result]
    B --> K[Clear resets the country and dates]
    B --> L[Back returns to Mc Reports]
```

## 4. Excel from the main report

```mermaid
flowchart TD
    A[Mc Reports] --> B[Excel Report]
    B --> C[Export the Mc stock report]
```

The main Excel link does not send the commodity or fish-type filter. The dated Excel link sends the country and the from and to dates.

## Rules and details

- **Latest balance, not a movement sum.** Each Mc cell is the newest `balance_mc` for that commodity, country, fish type, size, and kg.
- **A pack with no row** on one side shows a dash for that side. Total Mc is the other side alone.
- **Both sides zero** drops the row on the main report. The dated report still lists the pack.
- **Date Search** limits which packs appear. It does not recompute a balance as of the end date; the Mc columns stay the latest stored balance.
- **TCL is not on this report.** TCL balances stay on [TCL Mc Stock](./tclMcStockUserFlowDiagram.md).
