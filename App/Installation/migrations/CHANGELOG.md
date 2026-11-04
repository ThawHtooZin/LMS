# Migration changelog

## 2026-11-02 - Supplier payment batches

- Added nullable `purchase_payments.payment_batches`, containing the generated payment-batch key shared by all bill-allocation rows from one payment. Existing rows are backfilled only when their reference/account, allocation total, and exact two-line General Ledger pair identify one unambiguous batch; unmatched rows stay legacy and non-editable.
- New payment batches use a generated key as the General Ledger `sr_no`; editing any batch recalculates all of that supplier's batches in General Ledger insertion order and updates the edited batch's matching debit/credit pair, found by reference (`voucherno`) and generated key (`sr_no`).
- Apply `2026_11_02_supplier_payment_batches.sql` once to databases created from the baseline or already in use.

## 2026-11-02 - Customer receipt batches

- Added nullable `sale_payments.payment_batches`, shared by allocation rows belonging to one customer receipt. Existing rows remain unbatched because their General Ledger `voucherno` was generated independently of the entered reference and cannot be safely matched.
- New receipt General Ledger rows use the entered payment reference as `voucherno` and the generated receipt batch key as `sr_no`.
- Editing a receipt recalculates all of that customer's batched receipts in General Ledger insertion order, updating invoice allocations/statuses and the edited receipt's debit/credit pair atomically.
- Apply `2026_11_02_receivable_payment_batches.sql` once to databases created from the baseline or already in use.

## 2026-11-02 - General Ledger currency

- Added `general_ledger.currency` with `MMK` as the required default. The follow-up migration backfills existing NULL currency values to `MMK` before making the column non-null.
- Added `manual_journal_lines.currency` with an `MMK` default so draft journal lines retain their selected currencies.
- New General Ledger entries use `MMK` for Purchase, Payable, and legacy/manual postings, the selected Sales currency for Sales, and `USD` for Receivable receipts/opening balances.
- Apply `2026_11_02_general_ledger_currency.sql`, then `2026_11_02_general_ledger_currency_required.sql`, once to databases whose schema predates these changes.
- New installations using the updated baseline already include both columns and do not need these migrations.

## 2026-11-03 - Manual journal voucher grouping and USD conversion

- Added per-line voucher numbers, MMK-entered amount snapshots, and a journal-level USD exchange-rate snapshot. Manual journal General Ledger rows now link to their source line by `manual_journal_line_id`.
- Manual journal amounts are entered in MMK. USD rows are converted using the USD exchange rate effective on the journal date, saved to `exchange_rates`, and posted to General Ledger in USD; the original MMK amount is retained for stable editing and balancing.
- Each voucher group must contain at least two amount-bearing lines. Posting requires debit and credit totals to balance in MMK within each voucher group.
- Apply `2026_11_02_general_ledger_currency.sql` and `2026_11_02_general_ledger_currency_required.sql` first if the database predates General Ledger currency, then apply `2026_11_03_manual_journal_vouchers.sql` once. Existing manual journal rows remain unlinked and retain their existing amounts because their original voucher grouping and MMK source amounts cannot be inferred safely.
- The automated migration runner reads `Installation/database/migrations`; keep the ordered upgrade SQL there as well as in this feature migration directory so the runner can apply and record upgrades.