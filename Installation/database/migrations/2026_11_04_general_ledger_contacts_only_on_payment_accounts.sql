UPDATE `general_ledger`
SET `contact_id` = NULL
WHERE `contact_id` IS NOT NULL;

UPDATE `general_ledger` gl
INNER JOIN (
  SELECT gl.id, MIN(p.contact_id) AS contact_id
  FROM `general_ledger` gl
  INNER JOIN `purchase_payments` pp ON pp.payment_account = gl.ac_code
  INNER JOIN `purchases` p ON p.id = pp.purchase_id
  WHERE CAST(gl.credit AS DECIMAL(15,2)) > 0
    AND CAST(gl.debit AS DECIMAL(15,2)) = 0
    AND (
      (pp.payment_batches IS NOT NULL
       AND pp.payment_batches = gl.sr_no
       AND pp.reference = gl.voucherno)
      OR
      (pp.payment_batches IS NULL
       AND p.voucher_no = gl.voucherno
       AND pp.payment_date = gl.date
       AND CAST(gl.credit AS DECIMAL(15,2)) = pp.amount)
    )
  GROUP BY gl.id
  HAVING COUNT(DISTINCT p.contact_id) = 1
) supplier_payment_accounts ON supplier_payment_accounts.id = gl.id
SET gl.contact_id = supplier_payment_accounts.contact_id;

UPDATE `general_ledger` gl
INNER JOIN (
  SELECT gl.id, MIN(s.contact_id) AS contact_id
  FROM `general_ledger` gl
  INNER JOIN `sale_payments` sp
    ON sp.payment_batches IS NOT NULL
   AND sp.payment_batches = gl.sr_no
   AND sp.reference = gl.voucherno
  INNER JOIN `sales` s ON s.id = sp.sale_id
  WHERE gl.ac_code = sp.payment_account
    AND CAST(gl.debit AS DECIMAL(15,2)) > 0
    AND CAST(gl.credit AS DECIMAL(15,2)) = 0
  GROUP BY gl.id
  HAVING COUNT(DISTINCT s.contact_id) = 1
) customer_deposit_accounts ON customer_deposit_accounts.id = gl.id
SET gl.contact_id = customer_deposit_accounts.contact_id;
