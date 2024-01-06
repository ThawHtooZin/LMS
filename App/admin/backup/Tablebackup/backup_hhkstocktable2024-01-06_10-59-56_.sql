-- Table structure for table `hhkstock`
CREATE TABLE `hhkstock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `balance` varchar(11) NOT NULL,
  `balance_kg` varchar(11) NOT NULL,
  `balance_mc` int(11) DEFAULT NULL,
  `link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Data for table `hhkstock`
INSERT INTO hhkstock VALUES ('1', '2024-01-03', '0000-00-00', '1', '100', '100', '900', '900', '900', '900', '100', '0');
INSERT INTO hhkstock VALUES ('2', '2024-01-04', '0000-00-00', '5', '100', '100', '900', '900', '900', '900', '100', '0');
INSERT INTO hhkstock VALUES ('4', '2024-01-04', '2024-01-06', '1', '10', '90', '90', '810', '90', '', '', '2');
INSERT INTO hhkstock VALUES ('5', '2024-01-04', '2024-01-06', '1', '10', '80', '90', '720', '-630', '', '', '3');
INSERT INTO hhkstock VALUES ('6', '2024-01-04', '2024-01-06', '1', '10', '70', '90', '630', '-1260', '', '', '4');
