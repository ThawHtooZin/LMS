ALTER TABLE `purchase_payments`
  ADD COLUMN `payment_batches` varchar(50) DEFAULT NULL AFTER `id`,
  ADD KEY `idx_purchase_payments_payment_batches` (`payment_batches`);

UPDATE `purchase_payments` pp
INNER JOIN (
  SELECT candidates.reference, candidates.payment_account, MIN(candidates.sr_no) AS payment_batches
  FROM (
    SELECT allocation.reference, allocation.payment_account, ledger.sr_no
    FROM (
      SELECT pp.reference, pp.payment_account, SUM(pp.amount) AS amount, COUNT(DISTINCT p.contact_id) AS supplier_count
      FROM `purchase_payments` pp
      INNER JOIN `purchases` p ON p.id = pp.purchase_id
      WHERE pp.payment_batches IS NULL
      GROUP BY pp.reference, pp.payment_account
      HAVING supplier_count = 1
    ) allocation
    INNER JOIN (
      SELECT
        gl.voucherno,
        gl.sr_no,
        SUM(CASE WHEN gl.ac_code = '2000' AND CAST(gl.debit AS DECIMAL(15, 2)) > 0 AND CAST(gl.credit AS DECIMAL(15, 2)) = 0 THEN CAST(gl.debit AS DECIMAL(15, 2)) ELSE 0 END) AS payable_debit,
        SUM(CASE WHEN gl.ac_code <> '2000' AND CAST(gl.credit AS DECIMAL(15, 2)) > 0 AND CAST(gl.debit AS DECIMAL(15, 2)) = 0 THEN CAST(gl.credit AS DECIMAL(15, 2)) ELSE 0 END) AS asset_credit,
        MAX(CASE WHEN gl.ac_code <> '2000' AND CAST(gl.credit AS DECIMAL(15, 2)) > 0 AND CAST(gl.debit AS DECIMAL(15, 2)) = 0 THEN gl.ac_code END) AS asset_account,
        SUM(CASE WHEN gl.ac_code = '2000' AND CAST(gl.debit AS DECIMAL(15, 2)) > 0 AND CAST(gl.credit AS DECIMAL(15, 2)) = 0 THEN 1 ELSE 0 END) AS payable_lines,
        SUM(CASE WHEN gl.ac_code <> '2000' AND CAST(gl.credit AS DECIMAL(15, 2)) > 0 AND CAST(gl.debit AS DECIMAL(15, 2)) = 0 THEN 1 ELSE 0 END) AS asset_lines,
        COUNT(*) AS line_count
      FROM `general_ledger` gl
      GROUP BY gl.voucherno, gl.sr_no
      HAVING payable_lines = 1 AND asset_lines = 1 AND line_count = 2
    ) ledger
      ON ledger.voucherno = allocation.reference
      AND ledger.asset_account = allocation.payment_account
      AND ledger.payable_debit = allocation.amount
      AND ledger.asset_credit = allocation.amount
  ) candidates
  GROUP BY candidates.reference, candidates.payment_account
  HAVING COUNT(*) = 1
) safe_batches
  ON safe_batches.reference = pp.reference
  AND safe_batches.payment_account = pp.payment_account
SET pp.payment_batches = safe_batches.payment_batches
WHERE pp.payment_batches IS NULL;
