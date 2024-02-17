-- Table structure for table `cashbook`
CREATE TABLE `cashbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `ac_name` varchar(25) NOT NULL,
  `particular` text DEFAULT NULL,
  `debit` bigint(20) NOT NULL,
  `credit` bigint(20) NOT NULL,
  `balance` bigint(25) NOT NULL,
  `voucher_no` varchar(25) DEFAULT NULL,
  `crossac_name` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=269 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data for table `cashbook`
INSERT INTO cashbook VALUES ('266', '2024-02-01', '', '3600/001', 'paid to workers', '0', '2500000', '-2500000', 'Dr 24/Jan001', '9100/001');
INSERT INTO cashbook VALUES ('267', '2024-02-01', '', '3600/001', 'paid to workers', '0', '2500000', '-5000000', 'Dr 24/Jan001', '9100/006');
INSERT INTO cashbook VALUES ('268', '2024-02-01', '', '3600/001', 'paid to workers', '0', '2500000', '-7500000', 'Dr 24/Jan001', '9100/002');
