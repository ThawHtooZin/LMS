ALTER TABLE `general_ledger`
  ADD COLUMN `contact_id` int(11) DEFAULT NULL,
  ADD KEY `idx_general_ledger_contact_id` (`contact_id`);

UPDATE `general_ledger` gl
INNER JOIN `purchases` p ON p.voucher_no = gl.voucherno
SET gl.contact_id = p.contact_id
WHERE gl.ac_code = '2000'
  AND gl.contact_id IS NULL;

UPDATE `general_ledger` gl
INNER JOIN (
  SELECT pp.payment_batches, MIN(p.contact_id) AS contact_id
  FROM `purchase_payments` pp
  INNER JOIN `purchases` p ON p.id = pp.purchase_id
  WHERE pp.payment_batches IS NOT NULL
  GROUP BY pp.payment_batches
  HAVING COUNT(DISTINCT p.contact_id) = 1
) payment_contacts ON payment_contacts.payment_batches = gl.sr_no
SET gl.contact_id = payment_contacts.contact_id
WHERE gl.ac_code = '2000'
  AND gl.contact_id IS NULL;

UPDATE `general_ledger` gl
INNER JOIN (
  SELECT pp.reference, MIN(p.contact_id) AS contact_id
  FROM `purchase_payments` pp
  INNER JOIN `purchases` p ON p.id = pp.purchase_id
  GROUP BY pp.reference
  HAVING COUNT(DISTINCT p.contact_id) = 1
) payment_contacts ON payment_contacts.reference = gl.voucherno
SET gl.contact_id = payment_contacts.contact_id
WHERE gl.ac_code = '2000'
  AND gl.contact_id IS NULL;

UPDATE `general_ledger` gl
INNER JOIN `sales` s ON s.sr_no = gl.voucherno
SET gl.contact_id = s.contact_id
WHERE gl.ac_code = '600'
  AND gl.contact_id IS NULL;

UPDATE `general_ledger` gl
INNER JOIN (
  SELECT sp.payment_batches, MIN(s.contact_id) AS contact_id
  FROM `sale_payments` sp
  INNER JOIN `sales` s ON s.id = sp.sale_id
  WHERE sp.payment_batches IS NOT NULL
  GROUP BY sp.payment_batches
  HAVING COUNT(DISTINCT s.contact_id) = 1
) receipt_contacts ON receipt_contacts.payment_batches = gl.sr_no
SET gl.contact_id = receipt_contacts.contact_id
WHERE gl.ac_code = '600'
  AND gl.contact_id IS NULL;
