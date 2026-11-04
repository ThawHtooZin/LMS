UPDATE `general_ledger`
SET `currency` = 'MMK'
WHERE `currency` IS NULL;

ALTER TABLE `general_ledger`
  MODIFY COLUMN `currency` varchar(10) NOT NULL DEFAULT 'MMK';

ALTER TABLE `manual_journal_lines`
  ADD COLUMN `currency` varchar(10) NOT NULL DEFAULT 'MMK' AFTER `credit`;
