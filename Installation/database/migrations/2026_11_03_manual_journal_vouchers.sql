ALTER TABLE `manual_journals`
  ADD COLUMN `usd_exchange_rate` decimal(15,4) DEFAULT NULL AFTER `narration`;

ALTER TABLE `manual_journal_lines`
  ADD COLUMN `voucher_no` varchar(255) DEFAULT NULL AFTER `currency`,
  ADD COLUMN `debit_mmk` decimal(15,2) DEFAULT NULL AFTER `voucher_no`,
  ADD COLUMN `credit_mmk` decimal(15,2) DEFAULT NULL AFTER `debit_mmk`,
  ADD KEY `idx_manual_journal_voucher_no` (`voucher_no`);

ALTER TABLE `general_ledger`
  ADD COLUMN `manual_journal_line_id` int(11) DEFAULT NULL AFTER `currency`,
  ADD UNIQUE KEY `uniq_gl_manual_journal_line_id` (`manual_journal_line_id`);
