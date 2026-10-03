# General Ledger — User Flow

This diagram covers the **Account → General Ledger** page and its ledger report controls.

## 1. Open the ledger

```mermaid
flowchart TD
    A[Open Account → General Ledger] --> B{Choose view}
    B -->|First visit without filters| C[Reports modal opens automatically; ledger table is hidden]
    B -->|Select Full View| D[Load all General Ledger entries]
    B -->|Open Reports| E[Open date and account filters]
    E --> F[Select optional Date From and Date To]
    F --> G[Type account code or name to search]
    G --> H[Select one or more matching accounts as tags]
    H --> I{Change selected accounts?}
    I -->|Yes| J[Remove an account tag or add another]
    J --> H
    I -->|No; leave account list empty for all| K[Select Search]
    F --> K
    K --> L[Load matching General Ledger entries]
    C --> E
```

## 2. Read, export, or edit ledger entries

```mermaid
flowchart TD
    A[Load all entries or filtered results] --> B[Group entries by account code]
    B --> C[Show account heading and ordered transactions]
    C --> D[Review date, voucher number, offset account, narration, debit, credit, currency, and running balance]
    D --> E[Review per-account debit total, credit total, and net movement]
    D --> F{Choose an action}
    F -->|Export| G[Export General Ledger; filtered export carries selected dates and account codes]
    F -->|Edit action is available| H[Open Edit Transaction for that ledger entry]
    F -->|No further action| I[Finish]
```

## 3. Where Account General Ledger entries come from

```mermaid
flowchart LR
    A[Approve purchase through Account → Purchase] -->|Debit selected line accounts; credit Accounts Payable 2000| G[General Ledger]
    B[Pay supplier through A/C Payable] -->|Debit Accounts Payable 2000; credit selected Asset account| G
    C[Approve sale] -->|Debit Accounts Receivable 600; credit selected Revenue accounts| G
    D[Post Manual Journal] -->|Write each balanced journal line to its selected account| G
    E[Receive customer payment through A/C Receivable] -->|Debit selected deposit account; credit Accounts Receivable 600| G
    G --> H[Filter, review, export, or edit available ledger rows]
```

## Rules and details

- On a fresh visit, the Reports modal opens automatically and the table stays hidden until a report is run. **Full View** loads the ledger without date or account filters. The **Reports** button opens the filters again.
- **Date From** and **Date To** are optional. When both are supplied, the search includes entries between and including those dates. The account selector searches both account codes and names; selected accounts appear as removable tags. Leaving the account selection empty searches all accounts.
- Results are grouped by account, with transactions ordered by account code, date, then ledger row ID. Each transaction shows date, voucher number, offset account, narration, debit, credit, currency, and a running debit-minus-credit balance. Each account section also shows total debit, total credit, and net movement for the displayed result set.
- This page is the shared view of accounting postings made by other Account workflows; it is not the source screen for entering purchase bills, sales invoices, supplier payments, or manual journals. Approved purchases and sales create invoice-side postings; A/C Payable supplier payments and A/C Receivable customer receipts create cash-settlement postings; posted Manual Journals write their entered lines. See the [Purchase](./purchaseUserFlowDiagram.md), [A/C Payable](./acPayableUserFlowDiagram.md), [Sales](./salesUserFlowDiagram.md), [A/C Receivable](./acReceivableUserFlowDiagram.md), and [Manual Journals](./manualJournalUserFlowDiagram.md) workflows.
- In this application’s current posting paths: purchase approval through **Account → Purchase** debits each selected purchase line account and credits Accounts Payable control account `2000`; supplier payment debits `2000` and credits the selected Asset account; sale approval debits Accounts Receivable control account `600` and credits each selected Revenue account; customer receipt debits the selected deposit account and credits Accounts Receivable `600`. Manual Journals write each line’s selected account and debit/credit amount. Packing Material purchases use the Material type in **Account → Purchase**, so they follow the same payable and ledger posting path while also adding Warehouse stock.
- Currency is inferred from the account code: the page labels accounts containing `1502` or `3600/002` as USD and other accounts as MMK.
- The per-entry edit control is hidden when the displayed offset account name contains “purchase”; otherwise it opens the transaction editor. Export is available for all ledger entries or the current filtered date/account selection.
- When only Date From is supplied, the ledger includes entries on or after that date; when only Date To is supplied, it includes entries on or before that date. The running balance starts at zero within the displayed filtered rows rather than including a prior-period opening balance.
