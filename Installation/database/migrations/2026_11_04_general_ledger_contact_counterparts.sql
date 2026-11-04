UPDATE `general_ledger` gl
INNER JOIN (
  SELECT source_documents.voucherno, MIN(source_documents.contact_id) AS contact_id
  FROM (
    SELECT voucher_no AS voucherno, contact_id FROM `purchases`
    UNION ALL
    SELECT sr_no AS voucherno, contact_id FROM `sales`
  ) source_documents
  GROUP BY source_documents.voucherno
  HAVING COUNT(DISTINCT source_documents.contact_id) = 1
) document_contacts ON document_contacts.voucherno = gl.voucherno
SET gl.contact_id = document_contacts.contact_id
WHERE gl.contact_id IS NULL;

UPDATE `general_ledger` gl
INNER JOIN (
  SELECT payment_batches, MIN(contact_id) AS contact_id
  FROM (
    SELECT pp.payment_batches, p.contact_id
    FROM `purchase_payments` pp
    INNER JOIN `purchases` p ON p.id = pp.purchase_id
    WHERE pp.payment_batches IS NOT NULL
    UNION ALL
    SELECT sp.payment_batches, s.contact_id
    FROM `sale_payments` sp
    INNER JOIN `sales` s ON s.id = sp.sale_id
    WHERE sp.payment_batches IS NOT NULL
  ) payment_contacts
  GROUP BY payment_batches
  HAVING COUNT(DISTINCT contact_id) = 1
) batch_contacts ON batch_contacts.payment_batches = gl.sr_no
SET gl.contact_id = batch_contacts.contact_id
WHERE gl.contact_id IS NULL;

UPDATE `general_ledger` gl
INNER JOIN (
  SELECT payment_references.reference, MIN(payment_references.contact_id) AS contact_id
  FROM (
    SELECT pp.reference, p.contact_id
    FROM `purchase_payments` pp
    INNER JOIN `purchases` p ON p.id = pp.purchase_id
    UNION ALL
    SELECT sp.reference, s.contact_id
    FROM `sale_payments` sp
    INNER JOIN `sales` s ON s.id = sp.sale_id
  ) payment_references
  GROUP BY payment_references.reference
  HAVING COUNT(DISTINCT payment_references.contact_id) = 1
) reference_contacts ON reference_contacts.reference = gl.voucherno
SET gl.contact_id = reference_contacts.contact_id
WHERE gl.contact_id IS NULL;
