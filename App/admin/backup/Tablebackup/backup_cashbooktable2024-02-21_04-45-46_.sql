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
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data for table `cashbook`
INSERT INTO cashbook VALUES ('266', '2024-02-01', '', '3600/001', 'paid to workers', '0', '2500000', '-2500000', 'Dr 24/Jan001', '9100/001');
INSERT INTO cashbook VALUES ('267', '2024-02-01', '', '3600/001', 'paid to workers', '0', '2500000', '-5000000', 'Dr 24/Jan001', '9100/006');
INSERT INTO cashbook VALUES ('268', '2024-02-01', '', '3600/001', 'paid to workers', '0', '2500000', '-7500000', 'Dr 24/Jan001', '9100/002');
INSERT INTO cashbook VALUES ('269', '2024-02-01', '', '3600/001', 'Water 6 pk purchase for WH', '0', '5400', '-7505400', 'Dr-Feb 24/001', '9100/003');
INSERT INTO cashbook VALUES ('270', '2024-02-01', '', '3600/001', 'Sir Phone Bill and Monthly/ Phone 6 pcs Bill/ Sir-6000 (Sir,Daw Nan,Lai-15000) (Office,Sandar,Mar)', '0', '39000', '-7544400', 'Dr-Feb 24/002', '9100/004');
INSERT INTO cashbook VALUES ('271', '2024-02-01', '', '3600/001', 'Medicine and Taxi for sir', '0', '14000', '-7558400', 'Dr Feb\'24/003', '9100/005');
INSERT INTO cashbook VALUES ('272', '2024-02-01', '', '3600/001', 'Car Diesel for 5L-2848 (30.1.24-10000)(30.1.24-70000)', '0', '80000', '-7638400', 'Dr Feb\'24/004', '9100/006');
INSERT INTO cashbook VALUES ('273', '2024-02-01', '', '3600/001', 'Car Diesel for 6J-3015 (31.1.24-50000)', '0', '50000', '-7688400', 'Dr Feb\'24/005', '9100/006');
INSERT INTO cashbook VALUES ('274', '2024-02-01', '', '3600/001', 'Material and Taxi Charges for PK Machine', '0', '50000', '-7738400', 'Dr Feb\'24/006', '9100/007');
INSERT INTO cashbook VALUES ('275', '2024-02-01', '', '3600/001', 'Bejon Loan take from LM 2020ED Balance $25176*3572ks(Best Brand)', '0', '89928700', '-97667100', 'Dr Feb\'24/007', '3300/001');
INSERT INTO cashbook VALUES ('276', '2024-02-01', '', '3600/001', 'DHL charges for Italy Document sent', '0', '377000', '-98044100', 'Dr Feb\'24/008', '9100/008');
INSERT INTO cashbook VALUES ('277', '2024-02-01', '', '3600/001', 'Paid to Ka Yin Lay for Vr No-11337', '0', '100000', '-98144100', 'Dr Feb\'24/009', '4000/K06');
INSERT INTO cashbook VALUES ('278', '2024-02-01', '', '3600/001', 'Wave Money charges for Ka Yin Lay Money sent', '0', '1500', '-98145600', 'Dr Feb\'24/010', '9100/009');
INSERT INTO cashbook VALUES ('279', '2024-02-01', '', '3600/001', 'All people Salary Payment for Jan/24', '0', '17754000', '-115899600', 'Dr Feb\'24/011', '9100/001');
INSERT INTO cashbook VALUES ('280', '2024-02-01', '', '3600/001', 'All people Salary Payment for Jan/24', '0', '17754000', '-133653600', 'Dr Feb\'24/011', '9100/010');
INSERT INTO cashbook VALUES ('281', '2024-02-01', '', '3600/001', 'Donation for Bangladesh Embassy', '0', '3000000', '-136653600', 'Dr Feb\'24/012', '9100/011');
INSERT INTO cashbook VALUES ('282', '2024-02-20', '', '', '', '0', '0', '1000000', '', '');
INSERT INTO cashbook VALUES ('283', '2024-02-20', '', '', '', '0', '0', '1000000', '', '');
INSERT INTO cashbook VALUES ('284', '2024-02-20', '', '', '', '0', '0', '10000000', '', '');
INSERT INTO cashbook VALUES ('285', '2024-02-20', '', '', '', '0', '0', '10000000', '', '');
INSERT INTO cashbook VALUES ('286', '2024-02-20', '', '', '', '0', '0', '10000000', '', '');
