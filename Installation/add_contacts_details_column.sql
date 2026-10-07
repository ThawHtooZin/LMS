-- Export Customer extra info (Manage Contacts → customer_details field)
ALTER TABLE `contacts`
  ADD COLUMN `details` text DEFAULT NULL AFTER `contact_type`;
