-- Migration: create form7stocktcl if missing
-- Run with: mysql -u root -p lms < create_form7stocktcl.sql

CREATE TABLE IF NOT EXISTS `form7stocktcl` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `country` varchar(155) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `size` varchar(11) NOT NULL,
  `viss` varchar(11) NOT NULL,
  `kg` varchar(15) NOT NULL,
  `pcspervr` varchar(15) NOT NULL,
  `pcsperf7` int(11) NOT NULL,
  `link_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- add primary key and auto_increment
ALTER TABLE `form7stocktcl`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `form7stocktcl`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
