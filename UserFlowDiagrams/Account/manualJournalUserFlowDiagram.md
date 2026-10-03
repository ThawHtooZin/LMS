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
    B --> C[Date defaults to today]
    C --> D[Complete the initial two journal lines]
    D --> E[For each line enter optional Description, select Account, and enter Debit and/or Credit]
    E --> F{Need more lines?}
    F -->|Yes| G[Select Add a new line]
    G --> E
    F -->|No| H[Review live Debit and Credit totals]
    H --> I{Choose Save as draft, Post, or Cancel}
    I -->|Cancel| J[Return to Manual Journals without submitting]
    I -->|Save as draft| K[Submit draft]
    I -->|Post| L{Browser totals match?}
    L -->|No| M[Show imbalance warning and do not submit]
    L -->|Yes| N[Submit for server validation]
    K --> O{At least one line has an account and a positive debit or credit?}
    N --> P{Valid lines exist and debit equals credit to two decimals?}
    O -->|No| Q[Show save error]
    O -->|Yes| R[Save journal and lines with Draft status]
    P -->|No| S[Show validation error]
    P -->|Yes| T[Save journal and lines with Posted status]
    T --> U[Write one General Ledger row per journal line under a shared MJ voucher number]
    U --> W[Each row carries its account, debit, credit, date, and line or header narration]
    W --> X[Posted journal is visible in General Ledger]
    R --> V[Show result and return to Manual Journals]
    X --> V
```

## 3. Edit or view an existing journal

```mermaid
flowchart TD
    A[Select a journal in the list] --> B{Status is Draft?}
    B -->|No, Posted| C[Show narration, date, line descriptions, accounts, debit and credit totals]
    C --> D[Return to Manual Journals]
    B -->|Yes| E[Edit narration and date]
    E --> F[Edit line descriptions, accounts, debit and credit values]
    F --> G{Choose Update draft, Post to Ledger, or Cancel}
    G -->|Cancel| D
    G -->|Update draft| H[Require at least one valid amount line; save Draft]
    G -->|Post to Ledger| I[Require valid lines and balanced totals]
    I -->|Invalid| J[Show error; do not post]
    I -->|Valid| K[Save as Posted and write one General Ledger row per journal line]
    K --> M[Rows carry the selected account, debit, credit, journal date, and narration]
    M --> N[Posted journal is visible in General Ledger]
    H --> L[Show result and return to Manual Journals]
    N --> L
```

## Rules and details

- The journal list includes Draft and Posted entries, ordered by journal date descending and ID descending. Selecting a row opens its detail page. There are no visible delete or void actions.
- Narration and date are required; the date defaults to today. Each line has an optional description, a required account selected from accounts grouped by account type, and debit and credit amounts. A new journal starts with two rows; **Add a new line** appends rows.
- The New Journal form has no remove control on its initial two rows; lines added with **Add a new line** can be removed. The edit form provides a remove control for each existing line.
- Totals update as amounts are entered. The interface indicates balanced totals in green and an imbalance in red. Browser-side posting validation requires equal, non-zero totals; the server also validates that the posted journal balances to two decimal places.
- Drafts may be saved unbalanced, but a journal must contain at least one account line with a positive amount. Drafts have no General Ledger effect. Posting changes status to Posted and creates one General Ledger row per line under a shared `MJ-...` voucher number. Each row uses the line description as narration or the journal narration when the line description is blank.
- Draft detail can be updated as Draft or posted to the ledger. Posted journals are shown read-only in the normal page flow.
- The update endpoint also enforces Posted journals as read-only; a direct update request cannot change a posted journal or create duplicate ledger lines.
