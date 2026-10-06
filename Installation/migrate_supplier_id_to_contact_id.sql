-- Suppliers are contacts (contacts.is_supplier = 1). Legacy supplier_id columns are deprecated.
-- Run once after DB restore on strict MySQL/MariaDB to avoid error 1364 on partial INSERTs.
-- If contact_id already exists, skip the ADD COLUMN lines.

ALTER TABLE `form10stock` ADD COLUMN `contact_id` int(11) NULL DEFAULT NULL AFTER `item_id`;

UPDATE `form10stock`
SET `contact_id` = CAST(`supplier_id` AS UNSIGNED)
WHERE (`contact_id` IS NULL OR `contact_id` = 0)
  AND `supplier_id` REGEXP '^[0-9]+$';

ALTER TABLE `form10stock`
  MODIFY `supplier_id` varchar(20) NULL DEFAULT NULL,
  MODIFY `percentage` varchar(11) NULL DEFAULT NULL,
  MODIFY `pcsform10` int(11) NULL DEFAULT NULL,
  MODIFY `mc` int(11) NULL DEFAULT NULL,
  MODIFY `kg` varchar(11) NULL DEFAULT NULL,
  MODIFY `pcs` int(11) NULL DEFAULT NULL,
  MODIFY `looseinkg` varchar(11) NULL DEFAULT NULL,
  MODIFY `looseinpcs` int(11) NULL DEFAULT NULL,
  MODIFY `looseoutkg` varchar(11) NULL DEFAULT NULL,
  MODIFY `looseoutpcs` int(11) NULL DEFAULT NULL,
  MODIFY `total_kg` varchar(11) NULL DEFAULT NULL,
  MODIFY `fish_type` varchar(255) NULL DEFAULT NULL;

ALTER TABLE `form10stocktcl` ADD COLUMN `contact_id` int(11) NULL DEFAULT NULL AFTER `item_id`;

UPDATE `form10stocktcl`
SET `contact_id` = CAST(`supplier_id` AS UNSIGNED)
WHERE (`contact_id` IS NULL OR `contact_id` = 0)
  AND `supplier_id` REGEXP '^[0-9]+$';

ALTER TABLE `form10stocktcl`
  MODIFY `supplier_id` varchar(20) NULL DEFAULT NULL,
  MODIFY `percentage` varchar(11) NULL DEFAULT NULL,
  MODIFY `pcsform10` int(11) NULL DEFAULT NULL,
  MODIFY `mc` int(11) NULL DEFAULT NULL,
  MODIFY `kg` varchar(11) NULL DEFAULT NULL,
  MODIFY `pcs` int(11) NULL DEFAULT NULL,
  MODIFY `looseinkg` varchar(11) NULL DEFAULT NULL,
  MODIFY `looseinpcs` int(11) NULL DEFAULT NULL,
  MODIFY `looseoutkg` varchar(11) NULL DEFAULT NULL,
  MODIFY `looseoutpcs` int(11) NULL DEFAULT NULL,
  MODIFY `total_kg` varchar(11) NULL DEFAULT NULL;

ALTER TABLE `material_store_house` ADD COLUMN `contact_id` int(11) NULL DEFAULT NULL AFTER `material_id`;

UPDATE `material_store_house`
SET `contact_id` = CAST(`supplier_id` AS UNSIGNED)
WHERE (`contact_id` IS NULL OR `contact_id` = 0)
  AND `supplier_id` REGEXP '^[0-9]+$';

ALTER TABLE `material_store_house`
  MODIFY `supplier_id` text NULL;
