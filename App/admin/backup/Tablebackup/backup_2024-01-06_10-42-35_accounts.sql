-- Table structure for table `accounts`
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data for table `accounts`
INSERT INTO accounts VALUES ('1', 'admin', 'admin', 'admin@gmail.com', '1');
INSERT INTO accounts VALUES ('2', 'Ma Sandar Aung', '12341234', 'sandaraung@gmail.com', '1');
INSERT INTO accounts VALUES ('3', 'Ma Soe Soe Khaing', 'stockstock', 'masoesoekhaing@gmail.com', '2');
INSERT INTO accounts VALUES ('4', 'Lwin Mi Khaing', 'shippment', 'lwinmikhaing@gmail.com', '1');
INSERT INTO accounts VALUES ('5', 'Thin Zar Kyaw', 'thinzarkyaw', 'thinzarkyaw@gmail.com', '4');
INSERT INTO accounts VALUES ('6', 'Lin Lin Naing', 'coldstore', 'linlinnaing@gmail.com', '5');
