ALTER TABLE `general_ledger`
  ADD COLUMN `currency` varchar(10) DEFAULT NULL AFTER `sr_no`;

