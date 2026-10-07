# Form-10 — User Flow

**Access:** The **Stock Control** sidebar shows **Form-10** to roles with the `manage_form10` permission.

Form-10 records **production output** after Form-7 intake: MC, kg, pcs, loose movements, and (for TCL) split balances (CC, လမ်းငါး, Cut Piece, HHK, MSL). Data lives in **Frozen** (`form10stock`) and **TCL** (`form10stocktcl`). Entries are created on dedicated **Add Form-10** screens; the overview pages filter, edit, compare totals to Form-7, and export. See the [Form-7 workflow](./form7UserFlowDiagram.md) for raw intake and the [Purchase workflow](../Account/purchaseUserFlowDiagram.md) where Form-7 rows often originate.

## 1. Open Form-10 and choose a ledger

```mermaid
flowchart TD
    A[Open Stock Control in sidebar] --> B[Open Form-10]
    B --> C[Form-10 hub with two cards]
    C -->|Form-10 Frozen| D[Open Link Mark Limited F-10 Frozen]
    C -->|Form-10 TCL| E[Open Link Mark Limited F-10 TCL]
```

## 2. Review Frozen production rows

```mermaid
flowchart TD
    A[F-10 Frozen overview] --> B[Optional header filters]
    B --> C[Commodity from all Products]
    B --> D[Date exact match]
    B --> E[Size from distinct form10stock sizes]
    C --> F{Action}
    D --> F
    E --> F
    F -->|View| G[Store commodity, date, size in session]
    F -->|Clear Filter| H[Clear session filters]
    G --> I{At least one filter set?}
    I -->|No| J[Show empty table until a filter is applied]
    I -->|Yes| K[Load form10stock rows matching AND filters]
    H --> J
    K --> L[Show supplier from contacts is_supplier, fish type, production and loose columns, total kg]
    L --> M[Footer totals for visible rows]
    M --> N{User action}
    N -->|New Form-10 Data| O[Go to add_form_10_frozen.php]
    N -->|Edit pencil| P[Open update modal for that row]
    N -->|Percentage Report binoculars| Q[Open Percentage Report modal]
```

## 3. Review TCL production rows

```mermaid
flowchart TD
    A[F-10 TCL overview] --> B[Commodity from items already in form10stocktcl]
    B --> C[Date exact match]
    C --> D{Action}
    D -->|View| E[Store commodity and/or date in search_tcl session]
    D -->|Clear Filter| F[Clear search_tcl session]
    E --> G{Any filter set?}
    G -->|No| H[Load entire form10stocktcl table]
    G -->|Yes| I[Load rows matching AND on set filters]
    F --> H
    H --> J[Show production, loose, CC, lanfish, cut piece, HHK, MSL, total kg]
    J --> K[Footer totals; extra % column when any filter active]
    K --> L{User action}
    L -->|Add Form-10 Data| M[Go to add_form_10_tcl.php]
    L -->|Edit pencil| N[Open update modal]
    L -->|Export Excel| O[Available only when both commodity and date filters set]
```

## 4. Add Frozen Form-10 (multi-line)

```mermaid
flowchart TD
    A[New Form-10 Data] --> B[Add Form 10 Data page]
    B --> C[Header: Date, Type frozen, Supplier contact, Country]
    C --> D[Line grid: commodity, fish type, size, MC, kg, pcs, loose in/out kg and pcs]
    D --> E[Add a new line or remove line keep at least one row]
    E --> F[Save Form 10]
    F --> G{Client validation}
    G -->|Missing date, supplier, or country| H[Highlight fields; SweetAlert warning]
    G -->|No commodity selected on any line| I[SweetAlert: select at least one commodity]
    G -->|Valid| J[For each line with item_id]
    J --> K[Server: require supplier in contacts with is_supplier]
    K --> L[Compute total_kg = kg + loose in kg - loose out kg]
    L --> M[Compute pcsform10 = pcs + loose in pcs - loose out pcs rounded]
    M --> N[Insert one form10stock row per line]
    N --> O[SweetAlert success; redirect to F-10 Frozen overview]
    O --> P[Remember date, contact_id, country in session for next entry]
```

## 5. Add TCL Form-10 (multi-line)

```mermaid
flowchart TD
    A[Add Form-10 Data on TCL] --> B[Header: Date and Country]
    B --> C[Line grid: commodity, size, MC, kg, pcs, loose out/in, CC, cut piece, HHK, MSL, lanfish kg and pcs]
    C --> D[Save Form 10 TCL]
    D --> E{Client validation date and country and at least one commodity}
    E -->|Fail| F[SweetAlert warning]
    E -->|Pass| G[For each line with item_id]
    G --> H[Compute total_kg = production kg + loose in kg + CC + cut piece + HHK + MSL + lanfish kg - loose out kg]
    H --> I[Compute pcsform10 = sum of production and bucket pcs minus loose out pcs]
    I --> J[Insert form10stocktcl row type TCL]
    J --> K[SweetAlert success; redirect to F-10 TCL overview]
```

## 6. Update an existing row

```mermaid
flowchart TD
    A[Edit pencil on overview row] --> B{Ledger}
    B -->|Frozen| C[Update modal: date, type, supplier, commodity, fish type, country, size, MC, kg, pcs, loose fields]
    C --> D[Submit Update]
    D --> E[Recalculate total_kg and pcsform10 from production + loose only]
    E --> F[Update form10stock including contact_id and fish_type]

    B -->|TCL| G[Update modal: date, commodity, country, size, MC, kg, pcs, loose in/out only]
    G --> H[Submit Update]
    H --> I[Recalculate total_kg and pcsform10 from production + loose only]
    I --> J[Update form10stocktcl; CC/HHK/MSL/lanfish/cut piece columns unchanged by this modal]
```

## 7. Percentage report vs Form-7 (Frozen)

```mermaid
flowchart TD
    A[Percentage Report modal on Frozen] --> B[Form7Date multi-date picker]
    B --> C[Form10Date, Country, Commodity, Fish Type]
    C --> D[Submit View name=view]
    D --> E[Filter form10stock by commodity, country, Form10 date, optional fish type]
    E --> F[Hide Action column; show % column]
    F --> G[Sum Form-10 total_kg for visible rows]
    G --> H[Sum Form-7 kg from form7stock for same commodity, country, fish type, dates in Form7Date list]
    H --> I{Form-7 total kg non-zero?}
    I -->|Yes| J[Percentage = Form10 total kg minus Form7 total kg divided by Form7 total kg times 100]
    I -->|No| K[Show dash in % column]
    J --> L[Negative % shown in red with leading plus omitted for positive]
    D --> M[If commodity, country, fish type and Form7Date all set: Export Excel link to testing_export_two form10frozen]
```

## 8. Percentage vs Form-7 (TCL)

```mermaid
flowchart TD
    A[TCL overview with commodity and date filters both set] --> B[Footer computes % column]
    B --> C[Find latest form10stocktcl date strictly before selected Form-10 date]
    C --> D[Sum Form-7 kg from form7stocktcl for commodity between that date and Form-10 date inclusive]
    D --> E{Form-7 sum non-zero?}
    E -->|Yes| F[Percentage = visible Form-10 total_kg minus Form-7 sum over Form-7 sum times 100]
    E -->|No| G[Show dash]
    A --> H[Export Excel when both filters set via export.php form_10_tcl]
```

## Rules and details

- **Two ledgers:** **Form-10 (Frozen)** uses `form10stock` with supplier (`contact_id`), **fish_type**, and type frozen/tcl on each row. **Form-10 (TCL)** uses `form10stocktcl` with extra bucket columns (CC, lanfish, cut piece, HHK, MSL) and fixed type **TCL** on insert.
- **Permissions:** `manage_form10` gates the menu; Frozen and TCL share one permission.
- **Frozen list behaviour:** The main table stays **empty until at least one** of commodity, date, or size filter is applied and **View** is clicked. **TCL list behaviour:** With **no** filters, **View** loads **all** TCL Form-10 rows; with one or both filters, rows must match every set filter.
- **Calculated fields on save:** **PCS/Form-10** (`pcsform10`) and **Total kg** (`total_kg`) are computed server-side on add (and on update for the fields included in the update handler). Frozen: totals use production plus loose in minus loose out. TCL add: totals include all bucket kg/pcs; TCL **update** only recomputes from production and loose columns—bucket fields are not editable in the update modal.
- **Supplier (Frozen):** Add and update require a **contacts** record with `is_supplier = 1`. Invalid supplier throws a validation error on save.
- **No delete:** Neither overview exposes row delete; corrections are done via **Update** only.
- **Session helpers:** After a successful Frozen add, date, supplier, and country are stored in session for the next entry. TCL add stores date and country.
- **Percentage reports** compare aggregated **total kg** on the filtered Form-10 view to Form-7 intake (Frozen: explicit multi-date Form-7 selection plus country and fish type; TCL: Form-7 TCL kg over a date window anchored on the prior Form-10 date). They are operational variance indicators, not accounting postings.
- **Exports:** Frozen percentage view can export via **testing_export_two.php** when modal criteria are complete. TCL exports via **export.php** when both commodity and date header filters are set.
- **Downstream use:** Form-10 totals appear in **stock/Mc reports**, **export** layouts, and related packing-cost screens (e.g. material per kg uses a separate `form10kg` input on truck packing material). **TCL Mc Stock** is a separate screen that records MC movements including a **Form-10 MC** column; it is not auto-created when saving Form-10 TCL lines.
