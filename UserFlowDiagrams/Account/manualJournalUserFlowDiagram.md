# Manual Journals — User Flow

Manual journals are accounting adjustments. The New Manual Journal page recommends that only an accountant or bookkeeper create them.

## 1. Review the journal list

```mermaid
flowchart TD
    A[Open Account → Manual Journals] --> B[Load all manual journals]
    B --> C[Order newest journal date first, then newest ID]
    C --> D[Show date, narration, amount, and status]
    D --> E[Amount is the sum of journal-line debits]
    D --> F{Choose an action}
    F -->|New Journal| G[Open a blank journal form]
    F -->|Select a journal row| H[Open that journal]
    H --> I{Journal status}
    I -->|Draft| J[Edit the journal]
    I -->|Posted| K[View the posted journal read-only]
```

## 2. Create a journal

```mermaid
flowchart TD
    A[Open New Manual Journal] --> B[Enter required Narration and Date]
    B --> C[Date defaults to today; show the latest USD rate for that date]
    C --> D[Show or update the USD exchange rate in MMK per USD]
    D --> E[Complete the initial two journal lines]
    E --> F[For each row enter Voucher No., optional Description, Account, MMK Debit and/or Credit, and Currency]
    F --> G{Need more lines?}
    G -->|Yes| H[Select Add a new line]
    H --> F
    G -->|No| I[Review totals by voucher in entered MMK and USD conversion previews]
    I --> J{Choose Save as draft, Post, or Cancel}
    J -->|Cancel| K[Return to Manual Journals without submitting]
    J -->|Save as draft| L[Submit draft]
    J -->|Post| M{Every voucher has at least two rows and balances in entered MMK?}
    M -->|No| N[Show imbalance warning and do not submit]
    M -->|Yes| O[Submit for server validation]
    L --> P{Every used voucher has at least two amount-bearing lines?}
    O --> Q{Valid accounts, amounts, rate, voucher groups, and per-voucher MMK balance?}
    P -->|No| R[Show save error]
    P -->|Yes| S[Save journal and lines with Draft status]
    Q -->|No| T[Show validation error]
    Q -->|Yes| U[Save journal and lines with Posted status]
    U --> V[Convert USD line amounts using the saved dated USD rate]
    V --> W[Write each line to General Ledger using its voucher number and link it to its source line]
    W --> X[Posted journal is visible and synchronized with General Ledger]
    S --> Y[Show result and return to Manual Journals]
    X --> Y
```

## 3. Edit or view an existing journal

```mermaid
flowchart TD
    A[Select a journal in the list] --> B{Status is Draft?}
    B -->|No, Posted| C[Show narration, date, voucher numbers, line descriptions, accounts, amounts, and currencies]
    C --> D[Return to Manual Journals]
    B -->|Yes| E[Edit narration and date]
    E --> F[Edit voucher numbers, line descriptions, accounts, MMK debit and credit inputs, currencies, and USD rate]
    F --> G{Choose Update draft, Post to Ledger, or Cancel}
    G -->|Cancel| D
    G -->|Update draft| H[Require at least one valid amount line; save Draft]
    G -->|Post to Ledger| I[Require at least two lines per voucher and balanced MMK totals per voucher]
    I -->|Invalid| J[Show error; do not post]
    I -->|Valid| K[Save as Posted and write one General Ledger row per journal line]
    K --> M[Rows carry voucher, selected account, converted debit/credit, currency, journal date, and a source-line link]
    M --> N[Posted journal is visible in General Ledger]
    H --> L[Show result and return to Manual Journals]
    N --> L
```

## Rules and details

- The journal list includes Draft and Posted entries, ordered by journal date descending and ID descending. Its debit total is displayed separately for each currency. Selecting a row opens its detail page. There are no visible delete or void actions.
- Narration and date are required; the date defaults to today. Each row has a voucher number, optional description, a required account selected from accounts grouped by account type, debit and credit inputs in MMK, and a currency (`MMK` or `USD`, defaulting to `MMK`). A new journal starts with two rows; **Add a new line** appends rows.
- The USD exchange-rate input is MMK per USD. It is prefilled from the latest USD rate effective on or before the journal date. Saving an entered rate creates or updates the USD rate for that date in `exchange_rates`. Each USD row stores the entered MMK amount for editing and balancing, and posts the converted amount (MMK divided by the rate, rounded to two decimals) with currency `USD`; MMK rows post the entered amount as MMK.
- The New Journal form has no remove control on its initial two rows; lines added with **Add a new line** can be removed. The edit form provides a remove control for each existing line.
- Totals update by voucher in entered MMK. Each used voucher needs at least two amount-bearing rows; posting requires debit and credit to balance to two decimals separately within every voucher. Drafts may be unbalanced.
- Drafts have no General Ledger effect. Posting changes status to Posted and creates one General Ledger row per line using that row's voucher number. Each General Ledger row links back to its manual journal line, and uses the line description as narration or the journal narration when the line description is blank.
- Draft detail can be updated as Draft or posted to the ledger. Posted journals are shown read-only in the normal page flow.
- A linked posted manual journal opened from the General Ledger uses the same form and validation rules; saving replaces its linked ledger rows and source lines together in one transaction. This editor is limited to complete, linked vouchers in the current month.
- Non-manual General Ledger vouchers continue to use their existing editor. The manual-journal editor updates the exchange rate, journal header, source lines, and linked ledger rows together.
