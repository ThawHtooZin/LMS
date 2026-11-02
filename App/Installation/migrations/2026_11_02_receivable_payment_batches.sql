ALTER TABLE `sale_payments`
  ADD COLUMN `payment_batches` varchar(50) DEFAULT NULL AFTER `id`,
  ADD KEY `idx_sale_payments_payment_batches` (`payment_batches`);
