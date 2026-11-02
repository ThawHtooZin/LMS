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