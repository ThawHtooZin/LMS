# Cold Store Charges — User Flow

**Access:** The **Production** sidebar shows **Cold Store Charges** to roles with the `manage_coldstorecharges` permission.

Cold Store Charges is the only Production screen. It splits into a **date-range** ledger (HHK and MSL) and a **monthly** GFC ledger. Rates are typed on each entry. Configuration of cold-store settings lives outside this menu.

## 1. Choose date range or monthly

```mermaid
flowchart TD
    A[Open Production in sidebar] --> B[Open Cold Store Charges]
    B --> C[Two cards]
    C -->|Date Range Cold Store Charge| D[Choose HHK or MSL]
    C -->|Monthly Cold Store Charge| E[Open Monthly Cold Store Charges]
    D -->|Hlaing Htate Khaung| F[HHK Date Range Cold Store Charges]
    D -->|MSL| G[MSL Date Range Cold Store Charges]
```

## 2. HHK date range

```mermaid
flowchart TD
    A[HHK Date Range] --> B[Opens on Remaining Stock]
    B --> C{Tab}
    C -->|Remaining Stock| D[Add New Stock, edit a row, or edit balance kg and balance mc]
    C -->|Cold Store Charges| E[Add New Charges]
    C -->|Labour Charges| F[Add New Labour Charges]
    C -->|Processing Charges| G[Import Kg or Import Charges on a row]
    C -->|Repacking Charges| H[Add Repacking Charges]
    C -->|Total Charges| I[Edit the charge breakdown, add a remark, or Add Payment]
    A --> J[Export to Excel]
```

Add New Charges asks for in date, out date, commodity, mc, kg, cold store rate, and labour rate. The commodity list is fish already on HHK stock.

```mermaid
flowchart TD
    A[Add on New Charges] --> B{In date, out date, commodity, mc, kg, and both rates filled?}
    B -->|No| C[Error naming the missing field]
    B -->|Yes| D{Mc is within that commodity latest HHK total mc?}
    D -->|No| E[Sorry: Mc not enough]
    D -->|Yes| F[Days are out date minus in date, plus one]
    F --> G[Charges are days times cold store rate times kg]
    G --> H[Add those charges onto the running total for that commodity]
    H --> I[Also store the labour side of the same entry]
```

A pencil on a cold-store row updates in date, out date, mc, kg, commodity, cold store rate, and labour rate. Remaining stock can be deleted after a confirm. Delete stays hidden once that stock row already has a charge.

## 3. MSL date range

```mermaid
flowchart TD
    A[MSL Date Range] --> B{Tab}
    B -->|Remaining Stock| C[Add New Stock: in date, fish, mc, kg]
    B -->|Cold Store Charges| D[Add New Charges]
    B -->|Freezing Charges| E[Same rows, freezing rate]
    B -->|Export Handling Charges| F[Same rows, export handling rate]
    B -->|Repacking Charges| G[Date, description, sheet, plastic, and price]
    B -->|Total Charges| H[Edit repacking and ice, or Add Payment]
```

New Charges takes in date, out date, fish, fish type, mc, kg, cold store rate, freezing rate, export rate, loose mc, and loose kg. A pencil updates in date, out date, mc, kg, and the three rates.

## 4. Monthly charges

```mermaid
flowchart TD
    A[Monthly Cold Store Charges] --> B[Opens on Fish C-S]
    B --> C{Tab}
    C -->|Fish C-S| D[Add Fish Charges]
    C -->|Fish L-B| E[Fish labour rows and remarks]
    C -->|Dry Fish C-S| F[Add Dry Fish Charges]
    C -->|Dry Fish L-B| G[Dry fish labour rows and remarks]
    C -->|RP Out| H[Add Repacking Out]
    C -->|Total Amount Balance| I[Add Total Amount, Add Opening Balance, or record a payment]
    A --> J[Export to Excel]
```

Fish C-S columns are Date, I.T.E, Mc, Total Mc, Kg, Total Kg, Rate, Charges, Total Charges, Remark, and Action. I.T.E values used on the sheet are balance, import, export, and takeout.

```mermaid
flowchart TD
    A[Add Fish Charges] --> B[Date, I.T.E, mc, kg, cold store rate, labour rate]
    B --> C{All of those filled?}
    C -->|No| D[Error naming the missing field]
    C -->|Yes| E[Save fish cold store and the matching labour row]
    F[Add Dry Fish Charges] --> G[Date, I.T.E, and dry cold store rate are required]
    G --> H[Kg, labour rate, and damage kg are optional]
    I[Add Repacking Out] --> J[Date, out kg, and rate]
    K[Add Total Amount] --> L[Date and plug-on charges]
    M[Add Opening Balance] --> N[Opening amount]
    O[Click a total row] --> P[Payment date and payment amount]
```

A fish or dry-fish row can be updated or deleted. Delete asks for confirmation. Remark cells open their own edit.

The total sheet lists fish cold store, fish labour, repacking, dry-fish cold store, dry-fish labour, plug-on, total, payment date, payment amount, balance, and remark.

## Rules and details

- **Two ledgers.** Date range is split into **HHK** and **MSL**. Monthly is the GFC month sheet and is not split by those two sites.
- **HHK cold-store math.** The day count includes both the in date and the out date. Charges equal that day count times the cold store rate times kg, then add to the previous total for that commodity.
- **HHK stock check.** New charges are refused when the mc is greater than the latest `total_mc` on HHK stock for that commodity. The message is **Mc not enough**.
- **Monthly balance row.** A balance I.T.E charges the cold store rate times the kg already on hand. The first row of a new month starts the running total again. Later rows in the same month add onto it.
- **One fish entry, two sheets.** Add Fish Charges writes the cold-store row and the labour row together. Dry fish does the same with the dry cold-store rate.
- **Buttons follow the tab.** Add Fish Charges, Add Dry Fish Charges, Add Repacking Out, Add Opening Balance, and Add Total Amount are shown only on the tab they belong to.
- **Payments** sit on Total Charges for HHK and MSL, and on Total Amount Balance for the monthly sheet.
- **Excel** is on the HHK date-range page and on the monthly page.
