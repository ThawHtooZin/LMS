# Form-7 — User Flow

**Access:** The **Stock Control** sidebar shows **Form-7** to roles with the `manage_form7` permission.

Form-7 records incoming fish stock (by commodity, supplier, size, and weight) in two parallel ledgers: **Frozen** (`form7stock`) and **TCL** (`form7stocktcl`). Most rows are created when an **Account → Purchase** bill of type **Frozen** or **TCL** is approved; both screens also support manual entry, filters, line maintenance, and bulk updates. See the [Purchase workflow](../Account/purchaseUserFlowDiagram.md) for bill approval and void behaviour.

## 1. Open Form-7 and choose a ledger

```mermaid
flowchart TD
    A[Open Stock Control in sidebar] --> B[Open Form-7]
    B --> C[Form-7 hub with two cards]
    C -->|Form-7 Frozen| D[Open Link Mark Limited F-7 Frozen]
    C -->|Form-7 TCL| E[Open Link Mark Limited F-7 TCL]
```

## 2. Filter and review rows

```mermaid
flowchart TD
    A[Frozen or TCL Form-7 screen] --> B[Optional filters in header]
    B --> C[Select Commodity from distinct item_ids already in that ledger]
    B --> D[Select Date exact match]
    B --> E[Select Size from distinct sizes in that ledger]
    C --> F{User action}
    D --> F
    E --> F
    F -->|View| G[Save filters to session and reload table]
    F -->|Clear Filter| H[Clear session filters and reload]
    G --> I[Query ledger with AND on each non-empty filter]
    H --> J[Show all rows in that ledger when no filters]
    I --> K[Render table with footer totals for visible rows]
    J --> K
    K --> L[Resolve Fish Name from Products]
    K --> M[Resolve Supplier Name from accodes or contacts]
    K --> N[Frozen only: show fish_type beside product name]
    K --> O[Frozen only: Original Kg column = Viss x 1.634 display]
    K --> P[TCL: Kg column from stored kg when present]
```

## 3. Stock-in from Account Purchase (primary path)

```mermaid
flowchart TD
    A[Account → Purchase] --> B[Create bill with type Frozen or TCL]
    B --> C[Add lines with product, size, Viss, optional Pcs, unit price, account]
    C --> D[Approve bill → status Awaiting Payment]
    D --> E{Purchase type}
    E -->|Frozen| F[Insert form7stock row per line]
    E -->|TCL| G[Insert form7stocktcl row per line]
    F --> H[Copy date, item_id, supplier, size, viss, kg = viss x 1.634, pcspervr from line Pcs, type Frozen, link_id = purchase_line id]
    G --> I[Same fields; country DAKA; type TCl; link_id = purchase_line id]
    H --> J[Row appears on Form-7 Frozen after refresh/filter]
    I --> K[Row appears on Form-7 TCL after refresh/filter]
    D --> L{Later void unpaid Awaiting Payment bill?}
    L -->|Yes| M[Delete form7 rows where link_id matches voided purchase lines]
    L -->|Update approved unpaid bill| N[Refresh purchase lines and linked form7 rows via purchase engine]
```

## 4. Manually add a Form-7 row

```mermaid
flowchart TD
    A[Click Add Data] --> B[Add New Data modal]
    B --> C[Enter Date]
    B --> D[Select Fish Name from Products]
    B --> E[Select Supplier]
    B --> F[Select Type frozen or TCl]
    B --> G[Enter Size and Viss]
    G --> H[Submit Add]
    H --> I[Server computes kg = Viss x 1.634]
    I --> J[Insert into form7stock]
    J --> K[Reload page; new row on Frozen screen if filters match]
    K --> L[TCL screen reads form7stocktcl only]
    L --> M[Manual Add on TCL page uses same insert handler as Frozen]
    M --> N[Prefer TCL stock-in via Purchase type TCL approval for TCL ledger]
```

## 5. Maintain a row (Frozen)

```mermaid
flowchart TD
    A[Frozen row in table] --> B{User action}
    B -->|Click Pcs per F-7 cell| C[Update Data modal]
    C --> D[Enter Pcs Per F7]
    D --> E[Update preserves existing Country on row]
    E --> F[Save pcsperf7 on form7stock]

    B -->|Click Size cell| G[Add Size modal]
    G --> H[Enter new Size value]
    H --> I[Insert new form7stock row copying date, item, supplier, country, type, link_id from source row with new size]
    I --> J[New row starts without viss/kg until filled elsewhere]

    B -->|Click Water Kg cell| K[Add WaterKg modal]
    K --> L[Enter Water Kg]
    L --> M[Set water_kg and recompute kg = viss x 1.634 minus water_kg]

    B -->|Delete button| N[Confirm via submit]
    N --> O[Delete that form7stock id]

    B -->|Select row checkboxes| P[Bulk Update flow]
```

## 6. Maintain a row (TCL)

```mermaid
flowchart TD
    A[TCL row in table] --> B{User action}
    B -->|Click row except checkbox, Size, or Delete| C[Update Data modal]
    C --> D[Enter Pcs Per F7]
    D --> E[Update country if posted empty string sets NULL else keeps or sets country with pcsperf7]

    B -->|Click Size cell| F[Add Size modal]
    F --> G[Enter Size]
    G --> H[Insert new form7stocktcl row copying header fields and link_id from source]

    B -->|Delete button| I[Delete that form7stocktcl id]

    B -->|Select row checkboxes| J[Bulk Update flow]
```

## 7. Bulk update selected rows

```mermaid
flowchart TD
    A[Select one or more row checkboxes] --> B[Click Bulk Update]
    B --> C{Any row selected?}
    C -->|No| D[SweetAlert warning: select at least one row]
    C -->|Yes| E[Open bulk modal with comma-separated ids]
    E --> F{Ledger}
    F -->|Frozen| G[Optional Country text]
    F -->|Frozen| H[Optional Fish Type from fixed list G, egg, ggs, fillet, W, Cut Piece, Scaless, Bl's, IQF]
    F -->|TCL| I[Country required non-empty for bulk apply]
    G --> J[Submit Update Selected]
    H --> J
    I --> J
    J --> K[Frozen: update only non-blank fields on selected ids]
    J --> L[TCL: set country on all selected ids when country provided]
    K --> M[SweetAlert success on Frozen bulk complete]
    L --> N[SweetAlert success on TCL bulk complete]
```

## Rules and details

- **Two ledgers:** **Form-7 (Frozen)** lists `form7stock`. **Form-7 (TCL)** lists `form7stocktcl`. They share the same sidebar entry (`form_7.php`) but different detail pages (`form_7_frozen.php`, `form_7_tcl.php`).
- **Permissions:** `manage_form7` gates the menu item; there is no separate Frozen vs TCL permission.
- **Filters** (commodity, date, size) are stored in `$_SESSION['search']` and combined with **AND**. **View** applies them; **Clear Filter** empties them. With no filters, the full ledger loads. Filter dropdowns only list values that already exist in that ledger’s table.
- **Columns (Frozen):** Date, Fish Name (with `fish_type` in parentheses when set), Supplier, Type, Country, Size, Viss, **Original Kg** (display-only Viss × 1.634), **Water Kg**, **Kg** (stored; adjusted when water is applied), Pcs per Vr, Pcs per F-7, Delete.
- **Columns (TCL):** Same except no Water Kg / Original Kg columns; **Kg** is shown from the stored value when present.
- **Footer totals** sum Viss, Kg (Frozen stored kg total), Pcs per Vr, and Pcs per F-7 for **currently visible** filtered rows only.
- **Purchase link:** Approved Frozen/TCL purchase lines create Form-7 rows with `link_id` pointing at `purchase_lines.id`. Voiding an unpaid **Awaiting Payment** purchase removes linked Form-7 rows in the matching ledger. Updating an approved unpaid purchase refreshes stock through the purchase engine.
- **Manual add:** Computes **kg = Viss × 1.634** and inserts into **`form7stock`** only. Rows on the TCL screen normally come from **Purchase type TCL** approval into **`form7stocktcl`**. The TCL **Add Data** button calls the same insert as Frozen; use purchase approval for TCL ledger entries unless manual Frozen-table entry is intentional.
- **Add Size** does not edit the current row in place; it **inserts a sibling row** with the same date, commodity, supplier, country, type, and `link_id`, and the size you enter (quantities on the new row are empty until entered or supplied by purchase).
- **Frozen Pcs per F-7 update** changes only `pcsperf7` and leaves **Country** unchanged from the existing row.
- **Water Kg (Frozen only):** Updates `water_kg` and sets **Kg** to `(Viss × 1.634) − water_kg`.
- **Bulk update (Frozen):** Blank Country or Fish Type means “no change” for that field. **Bulk update (TCL):** Requires a non-empty **Country**; otherwise the handler returns without updating.
- **Delete** removes a single row by id from the active ledger; there is no undo on the Form-7 screens.
- **Supplier pickers:** Frozen **Add Data** lists suppliers from `accodes` (code) union `contacts` (id). TCL **Add Data** lists `contacts` (id and name). Display rows resolve suppliers via `accodes.code` or `contacts.id` as stored on the row.
- Form-7 quantities feed **Mc stock reports**, **packing/stock exports**, and downstream **Form-10** workflows; those screens are documented separately under Stock Control.
