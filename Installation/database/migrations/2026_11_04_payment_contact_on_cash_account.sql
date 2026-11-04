UPDATE `general_ledger` gl
INNER JOIN (
  SELECT pp.payment_batches, pp.reference, pp.payment_account,
         MIN(p.contact_id) AS contact_id
  FROM `purchase_payments` pp
  INNER JOIN `purchases` p ON p.id = pp.purchase_id
  WHERE pp.payment_batches IS NOT NULL
  GROUP BY pp.payment_batches, pp.reference, pp.payment_account
  HAVING COUNT(DISTINCT p.contact_id) = 1
) payment_contacts
  ON payment_contacts.payment_batches = gl.sr_no
 AND payment_contacts.reference = gl.voucherno
SET gl.contact_id = CASE
  WHEN gl.ac_code = payment_contacts.payment_account
   AND CAST(gl.credit AS DECIMAL(15,2)) > 0
   AND CAST(gl.debit AS DECIMAL(15,2)) = 0
  THEN payment_contacts.contact_id
  ELSE NULL
END;

UPDATE `general_ledger` gl
INNER JOIN (
  SELECT sp.payment_batches, sp.reference, sp.payment_account,
         MIN(s.contact_id) AS contact_id
  FROM `sale_payments` sp
  INNER JOIN `sales` s ON s.id = sp.sale_id
  WHERE sp.payment_batches IS NOT NULL
  GROUP BY sp.payment_batches, sp.reference, sp.payment_account
  HAVING COUNT(DISTINCT s.contact_id) = 1
) receipt_contacts
  ON receipt_contacts.payment_batches = gl.sr_no
 AND receipt_contacts.reference = gl.voucherno
SET gl.contact_id = CASE
  WHEN gl.ac_code = receipt_contacts.payment_account
   AND CAST(gl.debit AS DECIMAL(15,2)) > 0
   AND CAST(gl.credit AS DECIMAL(15,2)) = 0
  THEN receipt_contacts.contact_id
  ELSE NULL
END;
