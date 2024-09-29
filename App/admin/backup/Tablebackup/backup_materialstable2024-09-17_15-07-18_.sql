-- Table structure for table `materials`
CREATE TABLE `materials` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Data for table `materials`
INSERT INTO materials VALUES ('1', 'Tape', 'tape for taping boxes when packaging', '5', 'roll', '5000');
INSERT INTO materials VALUES ('3', 'Test', 'test', '10', 'roll', '1000');
