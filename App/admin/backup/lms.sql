DROP TABLE accounts;

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO accounts VALUES("2","user","user","user@gmail.com","2");
INSERT INTO accounts VALUES("3","saleperson","saleperson","saleperson@gmail.com","3");
INSERT INTO accounts VALUES("5","uzinlinoo","uzinlinoo","uzinlinoo@gmail.com","1");
INSERT INTO accounts VALUES("16","Lwing Paing Oo","lpo","lpo@gmail.com","3");
INSERT INTO accounts VALUES("17","Myat Thu","mt","mt@gmail.com","4");
INSERT INTO accounts VALUES("18","admin","admin","admin@gmail.com","1");



DROP TABLE cashbook;

CREATE TABLE `cashbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `serial_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `ac_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `particular` text COLLATE utf8_unicode_ci NOT NULL,
  `debit` bigint(20) DEFAULT NULL,
  `credit` bigint(20) DEFAULT NULL,
  `balance` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO cashbook VALUES("6","2023-08-24","Mr.Myat","Supplier","Paid to Supplier BoBo vno EG123","0","1000000","-1000000");
INSERT INTO cashbook VALUES("8","2023-08-24","Mrs.Phyo","Receive","Received from USA","10000000","0","9000000");
INSERT INTO cashbook VALUES("9","2023-08-24","Mr.Jphn","Supplier","Paid to Supplier Mg Mg vno SS123","0","40000000","-31000000");
INSERT INTO cashbook VALUES("10","2023-08-23","Mrs.Que","receive","received from Canada","40000000","0","9000000");
INSERT INTO cashbook VALUES("11","2023-08-24","Mr.Jumbo","Supplier","Paid to Supplier JoJo vno SB140","0","5000000","4000000");
INSERT INTO cashbook VALUES("14","2023-09-01","Mr.JohnDoe","Buyer","Buy Product","1000000","0","5000000");
INSERT INTO cashbook VALUES("15","2023-09-01","Mr.Broke","Buyer","Buy Product
","100000","0","5100000");
INSERT INTO cashbook VALUES("16","2023-09-02","Mr.Haven","Buyer","Buy Product","900000","0","6000000");



DROP TABLE category;

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO category VALUES("4","Fish");
INSERT INTO category VALUES("5","Crab");
INSERT INTO category VALUES("8","Cold Drinks");
INSERT INTO category VALUES("9","Snack");



DROP TABLE coldstore;

CREATE TABLE `coldstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `day` int(11) NOT NULL,
  `rate` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO coldstore VALUES("1","2023-08-10","2023-08-20","10","10","150","150","10","3","4500","4500");
INSERT INTO coldstore VALUES("3","2023-08-21","2023-08-25","15","10","150","300","4","3","1800","6300");



DROP TABLE customers;

CREATE TABLE `customers` (
  `customer_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_phone` bigint(14) NOT NULL,
  `customer_address` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO customers VALUES("B133","U KoKo","911111111","mandalay");
INSERT INTO customers VALUES("e3333","ssss","344544","sssss");



DROP TABLE item;

CREATE TABLE `item` (
  `item_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO item VALUES("BJ123","4","Baby Koral");
INSERT INTO item VALUES("BJ536","4","Boal");
INSERT INTO item VALUES("HG184","4","D-Puti");
INSERT INTO item VALUES("HJ275","4","Taboshi");
INSERT INTO item VALUES("HL123","4","Hilsa");
INSERT INTO item VALUES("JK167","4","Tilapia");
INSERT INTO item VALUES("KJ243","4","Poa");
INSERT INTO item VALUES("LK123","4","Batashi");
INSERT INTO item VALUES("OJ247","4","Puti");
INSERT INTO item VALUES("UT216","4","Rohu");



DROP TABLE labour;

CREATE TABLE `labour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `rate` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO labour VALUES("1","2023-08-10","2023-08-20","10","10","150","150","4","600","600");
INSERT INTO labour VALUES("3","2023-08-21","2023-08-25","15","10","150","300","4","600","1200");



DROP TABLE payable;

CREATE TABLE `payable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `supplier_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_voucher_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_amount` bigint(19) NOT NULL,
  `paid_date` date NOT NULL,
  `paid_voucher` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount` bigint(25) NOT NULL,
  `balance` bigint(25) NOT NULL,
  `link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO payable VALUES("57","DK123","2001","800000","0000-00-00","","0","800000","25");
INSERT INTO payable VALUES("58","DK123","","0","2023-08-26","AP0001","500000","0","0");
INSERT INTO payable VALUES("59","DK123","2001","3000000","0000-00-00","","0","3000000","26");
INSERT INTO payable VALUES("60","DK123","","0","2023-08-26","AP0002","200000","0","0");
INSERT INTO payable VALUES("62","DK123","2001","600000","0000-00-00","","0","2100000","28");
INSERT INTO payable VALUES("64","DK123","","0","2023-08-26","AP0003","2400000","0","0");
INSERT INTO payable VALUES("65","DK123","","0","2023-08-26","AP0004","100000","0","0");
INSERT INTO payable VALUES("66","NS123","2002","200000","0000-00-00","","0","200000","29");
INSERT INTO payable VALUES("67","NS123","2002","900000","0000-00-00","","0","1100000","30");
INSERT INTO payable VALUES("68","NS123","","0","2023-08-26","AP0006","100000","0","0");



DROP TABLE processing;

CREATE TABLE `processing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` int(11) NOT NULL,
  `rate` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO processing VALUES("1","2023-08-10","2023-08-20","10","10","150","150","1.5","225","225");
INSERT INTO processing VALUES("3","2023-08-21","2023-08-25","15","10","150","300","1.5","225","450");



DROP TABLE purchase;

CREATE TABLE `purchase` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `voucher_no` int(11) NOT NULL,
  `supplier_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tclfrozen` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `commodity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `viss` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `pcs` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO purchase VALUES("25","2023-08-26","2001","DK123","frozen","HL123","10","200","0","4000","800000");
INSERT INTO purchase VALUES("26","2023-08-26","2001","DK123","frozen","HG184","10","100","0","30000","3000000");
INSERT INTO purchase VALUES("28","2023-08-26","2001","DK123","frozen","HG184","10","200","0","3000","600000");
INSERT INTO purchase VALUES("29","2023-08-26","2002","NS123","frozen","BJ123","10","100","0","2000","200000");
INSERT INTO purchase VALUES("30","2023-08-26","2002","NS123","frozen","BJ123","10","100","0","9000","900000");



DROP TABLE supplier;

CREATE TABLE `supplier` (
  `supplier_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO supplier VALUES("DK123","Naung Naung","09123123","Mandalay");
INSERT INTO supplier VALUES("NS123","Tun Naing","0923423423","Yangon");
INSERT INTO supplier VALUES("DG214","Thaung Htun","09234234","Mandalay");
INSERT INTO supplier VALUES("KJ122","Soe Naing","09342124","Nay Pyi Daw");
INSERT INTO supplier VALUES("OP123","Pho Zaw","092342342","Ayar Wa Di");
INSERT INTO supplier VALUES("HE132","Bar Bulay","09123123","India");
INSERT INTO supplier VALUES("KJ126","Soe Thain","091324124","Na Kya Pa Noung");
INSERT INTO supplier VALUES("JK909","Phyo Lay","09976476","Nay Pyi Daw");
INSERT INTO supplier VALUES("KJ234","Ko Myo","0938757878","Ka Chin");
INSERT INTO supplier VALUES("KH122","Soe Myint","09234234","Mandalay");
INSERT INTO supplier VALUES("JH123","Thar Hla","0924234345","Thi Li Lin Kar");
INSERT INTO supplier VALUES("DK123","Naung Naung","09123123","Mandalay");
INSERT INTO supplier VALUES("NS123","Tun Naing","0923423423","Yangon");
INSERT INTO supplier VALUES("DG214","Thaung Htun","09234234","Mandalay");
INSERT INTO supplier VALUES("KJ122","Soe Naing","09342124","Nay Pyi Daw");
INSERT INTO supplier VALUES("OP123","Pho Zaw","092342342","Ayar Wa Di");
INSERT INTO supplier VALUES("HE132","Bar Bulay","09123123","India");
INSERT INTO supplier VALUES("KJ126","Soe Thain","091324124","Na Kya Pa Noung");
INSERT INTO supplier VALUES("JK909","Phyo Lay","09976476","Nay Pyi Daw");
INSERT INTO supplier VALUES("KJ234","Ko Myo","0938757878","Ka Chin");
INSERT INTO supplier VALUES("KH122","Soe Myint","09234234","Mandalay");
INSERT INTO supplier VALUES("JH123","Thar Hla","0924234345","Thi Li Lin Kar");
INSERT INTO supplier VALUES("DK123","Naung Naung","09123123","Mandalay");
INSERT INTO supplier VALUES("NS123","Tun Naing","0923423423","Yangon");
INSERT INTO supplier VALUES("DG214","Thaung Htun","09234234","Mandalay");
INSERT INTO supplier VALUES("KJ122","Soe Naing","09342124","Nay Pyi Daw");
INSERT INTO supplier VALUES("OP123","Pho Zaw","092342342","Ayar Wa Di");
INSERT INTO supplier VALUES("HE132","Bar Bulay","09123123","India");
INSERT INTO supplier VALUES("KJ126","Soe Thain","091324124","Na Kya Pa Noung");
INSERT INTO supplier VALUES("JK909","Phyo Lay","09976476","Nay Pyi Daw");
INSERT INTO supplier VALUES("KJ234","Ko Myo","0938757878","Ka Chin");
INSERT INTO supplier VALUES("KH122","Soe Myint","09234234","Mandalay");
INSERT INTO supplier VALUES("JH123","Thar Hla","0924234345","Thi Li Lin Kar");
INSERT INTO supplier VALUES("DK123","Naung Naung","09123123","Mandalay");
INSERT INTO supplier VALUES("NS123","Tun Naing","0923423423","Yangon");
INSERT INTO supplier VALUES("DG214","Thaung Htun","09234234","Mandalay");
INSERT INTO supplier VALUES("KJ122","Soe Naing","09342124","Nay Pyi Daw");
INSERT INTO supplier VALUES("OP123","Pho Zaw","092342342","Ayar Wa Di");
INSERT INTO supplier VALUES("HE132","Bar Bulay","09123123","India");
INSERT INTO supplier VALUES("KJ126","Soe Thain","091324124","Na Kya Pa Noung");
INSERT INTO supplier VALUES("JK909","Phyo Lay","09976476","Nay Pyi Daw");
INSERT INTO supplier VALUES("KJ234","Ko Myo","0938757878","Ka Chin");
INSERT INTO supplier VALUES("KH122","Soe Myint","09234234","Mandalay");
INSERT INTO supplier VALUES("JH123","Thar Hla","0924234345","Thi Li Lin Kar");
INSERT INTO supplier VALUES("DK123","Naung Naung","09123123","Mandalay");
INSERT INTO supplier VALUES("NS123","Tun Naing","0923423423","Yangon");
INSERT INTO supplier VALUES("DG214","Thaung Htun","09234234","Mandalay");
INSERT INTO supplier VALUES("KJ122","Soe Naing","09342124","Nay Pyi Daw");
INSERT INTO supplier VALUES("OP123","Pho Zaw","092342342","Ayar Wa Di");
INSERT INTO supplier VALUES("HE132","Bar Bulay","09123123","India");
INSERT INTO supplier VALUES("KJ126","Soe Thain","091324124","Na Kya Pa Noung");
INSERT INTO supplier VALUES("JK909","Phyo Lay","09976476","Nay Pyi Daw");
INSERT INTO supplier VALUES("KJ234","Ko Myo","0938757878","Ka Chin");
INSERT INTO supplier VALUES("KH122","Soe Myint","09234234","Mandalay");
INSERT INTO supplier VALUES("JH123","Thar Hla","0924234345","Thi Li Lin Kar");



