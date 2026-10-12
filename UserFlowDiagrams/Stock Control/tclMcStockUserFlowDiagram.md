# TCL Mc Stock — User Flow

**Access:** The **Stock Control** sidebar shows **TCL Mc Stock** to roles with the `manage_tclmcstock` permission.

TCL Mc Stock records master cartons in `tclmcstock`, with outs logged in `tclmc_transactions`. It is not filled automatically when [Form-10 TCL](./form10UserFlowDiagram.md) is saved. Someone adds a Form-10 Mc quantity here, then transfers or exports it from the size ledger.

## 1. Review balance by fish and size

```mermaid
flowchart TD
    A[Open Stock Control in sidebar] --> B[Open TCL Mc Stock]
    B --> C[Default table with no date search]
    C --> D[One row per fish and size]
    D --> E[Balance Mc is the sum of grand total mc for that fish and size]
    E --> F{Header action}
    F -->|Add Mc Data| G[Open Add Data]
    F -->|Export Excel| H[Export the full TCL Mc stock table]
    F -->|List icon| I[Open TCL Mc Stock Info for that fish and size]
```

## 2. View one date

```mermaid
flowchart TD
    A[Pick a date and select View] --> B[Hide Add Mc Data]
    B --> C[Rows from tclmcstock for that date]
    C --> D[Columns: Date, Fish Name, Size, Pcs, Kg, Opening Mc, Form-10 Mc]
    D --> E[Transfer column sums transfer transactions]
    E --> F[Loading column sums export transactions]
    F --> G[Grand Total Mc from the stored row]
    G --> H[Footer totals for opening, Form-10, transfer, loading, and grand total]
    H --> I[Export Excel for that date only]
    C --> J[Date, fish name, and size are shown on the first row of each group and left blank on repeats]
```

The transfer header reads **Transfer to** plus the first transfer destination that day. The loading header reads **Loading** plus the first export destination that day. A zero quantity is shown as a dash.

## 3. Add Form-10 Mc

```mermaid
flowchart TD
    A[Add Mc Data] --> B[Date, fish name, size, pcs, kg, Form 10 Mc]
    B --> C[Fish names are commodities already on Form-10 TCL]
    C --> D[Add]
    D --> E[Insert tclmcstock]
    E --> F[Opening mc is 0]
    F --> G[Grand total mc starts equal to Form 10 Mc]
```

Add Mc Data is only on the undated balance list. It is hidden after a date View.

## 4. Size ledger, transfer, and export

```mermaid
flowchart TD
    A[List icon] --> B[TCL Mc Stock Info for that fish and size]
    B --> C[Header shows the fish name and Balance Mc for this size]
    C --> D[Ledger in date order]
    D --> E[In row: opening mc plus Form-10 mc]
    E --> F[Out row: Transfer to a destination, or Export loading a number]
    F --> G[Balance Mc runs down the ledger]
    G --> H{Header action}
    H -->|Transfer Mc| I[Destination defaults to HHK, plus a quantity]
    H -->|Export Mc| J[Loading number plus a quantity]
    I --> K{Quantity within the lot grand total?}
    J --> K
    K -->|No| L[Error: Not enough MC]
    K -->|Yes| M[Reduce that row grand total mc]
    M --> N[Log tclmc_transactions]
    N --> O[Transfer type is transfer; export type is export]
    O --> P[Success, then stay on this size ledger]
    B --> Q[Back returns to TCL Mc Stock]
```

The quantity field cannot be set above the grand total of the lot that still has stock. Transfer and export use today's date on the transaction log.

## Rules and details

- **Two views.** With no date, the page is a balance list grouped by fish and size. With a date and **View**, it is a daily sheet and **Add Mc Data** is hidden.
- **Form-10 does not post here.** Commodities offered on Add are the distinct items already in `form10stocktcl`, but saving Form-10 TCL does not create a TCL Mc row.
- **Grand total on add** equals the Form-10 Mc. Opening mc is stored as 0.
- **Outs do not delete the row.** Transfer and export lower `grandtotal_mc` and append `tclmc_transactions`. The daily sheet reads those logs for the Transfer and Loading columns.
- **Not enough MC** is returned when the requested quantity is greater than that row's current grand total.
- **Excel** without a date exports the whole `tclmcstock` table. Excel after View exports that date only.
