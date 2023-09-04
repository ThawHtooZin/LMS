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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO coldstore VALUES("1","2023-08-01","2023-08-10","20","20","60","60","10","3","1800","1800");
INSERT INTO coldstore VALUES("2","2023-08-11","2023-08-15","15","35","45","105","5","3","675","2475");
INSERT INTO coldstore VALUES("3","2023-08-16","2023-08-20","5","40","15","120","5","3","225","2700");
INSERT INTO coldstore VALUES("4","2023-08-21","2023-08-25","11","51","30.3","150.3","5","3","455","3155");



DROP TABLE container;

CREATE TABLE `container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_no` int(11) NOT NULL,
  `country` varchar(20) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO container VALUES("2","1","USA","2023-09-30");
INSERT INTO container VALUES("3","2","Canada","2023-09-30");
INSERT INTO container VALUES("4","3","Bangladish","2023-09-30");



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



DROP TABLE gfcdryfishcoldstore;

CREATE TABLE `gfcdryfishcoldstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `ite` varchar(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcdryfishcoldstore VALUES("7","2023-08-01","import","150","150","1.6","240","240");
INSERT INTO gfcdryfishcoldstore VALUES("8","2023-08-01","import","300","450","1.6","720","960");
INSERT INTO gfcdryfishcoldstore VALUES("9","2023-08-01","export","150","300","1.6","720","1680");
INSERT INTO gfcdryfishcoldstore VALUES("10","2023-08-02","import","450","750","1.6","1200","2880");
INSERT INTO gfcdryfishcoldstore VALUES("11","2023-08-02","takeout","150","600","1.6","1200","4080");
INSERT INTO gfcdryfishcoldstore VALUES("12","2023-08-02","takeout","50","550","1.6","1200","4080");
INSERT INTO gfcdryfishcoldstore VALUES("13","2023-08-03","balance","","550","1.6","880","4960");
INSERT INTO gfcdryfishcoldstore VALUES("14","2023-08-04","balance","","550","1.6","880","5840");



DROP TABLE gfcdryfishlabour;

CREATE TABLE `gfcdryfishlabour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `ite` varchar(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcdryfishlabour VALUES("7","2023-08-01","import","150","2.5","375","375");
INSERT INTO gfcdryfishlabour VALUES("8","2023-08-01","import","300","2.5","750","1125");
INSERT INTO gfcdryfishlabour VALUES("9","2023-08-01","export","150","3","450","1575");
INSERT INTO gfcdryfishlabour VALUES("10","2023-08-02","import","450","3","1350","2925");
INSERT INTO gfcdryfishlabour VALUES("11","2023-08-02","takeout","150","3","450","3375");



DROP TABLE gfcfishcoldstore;

CREATE TABLE `gfcfishcoldstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `ite` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(13) NOT NULL,
  `total_charges` bigint(14) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcfishcoldstore VALUES("80","2023-08-01","import","50","50","150","150","1.5","225","225");
INSERT INTO gfcfishcoldstore VALUES("81","2023-08-01","import","100","150","300","450","1.5","675","900");
INSERT INTO gfcfishcoldstore VALUES("82","2023-08-01","export","50","100","150","300","1.5","675","1575");
INSERT INTO gfcfishcoldstore VALUES("83","2023-08-02","import","100","200","300","600","1.5","900","2475");
INSERT INTO gfcfishcoldstore VALUES("84","2023-08-02","export","150","50","450","150","1.5","900","3375");
INSERT INTO gfcfishcoldstore VALUES("85","2023-08-03","import","200","250","600","750","1.5","1125","4500");
INSERT INTO gfcfishcoldstore VALUES("96","2023-08-03","takeout","50","200","150","600","1.5","1125","5625");
INSERT INTO gfcfishcoldstore VALUES("97","2023-08-03","takeout","0","200","50","550","1.5","0","0");
INSERT INTO gfcfishcoldstore VALUES("98","2023-08-04","balance","0","200","","550","1.5","825","6450");



DROP TABLE gfcfishlabour;

CREATE TABLE `gfcfishlabour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `ite` varchar(12) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcfishlabour VALUES("61","2023-08-01","import","150","3","450","450");
INSERT INTO gfcfishlabour VALUES("62","2023-08-01","import","300","3","900","1350");
INSERT INTO gfcfishlabour VALUES("63","2023-08-01","export","150","3","450","1800");
INSERT INTO gfcfishlabour VALUES("64","2023-08-02","import","300","3","900","2700");
INSERT INTO gfcfishlabour VALUES("65","2023-08-02","export","450","3","1350","4050");
INSERT INTO gfcfishlabour VALUES("66","2023-08-03","import","600","3","1800","5850");
INSERT INTO gfcfishlabour VALUES("72","2023-08-03","takeout","150","3","450","6300");



DROP TABLE gfctotal;

CREATE TABLE `gfctotal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `totalfishcoldstorecharges` bigint(15) NOT NULL,
  `totalfishlabourcharges` bigint(15) NOT NULL,
  `totalrepackingcharges` bigint(15) NOT NULL,
  `totaldryfishcoldstorecharges` bigint(15) NOT NULL,
  `totaldryfishlabourcharges` bigint(15) NOT NULL,
  `plugoncharges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` bigint(15) NOT NULL,
  `balance_amount` bigint(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfctotal VALUES("8","2023-08-31","6450","6300","1125","5840","3375","800","23890","0000-00-00","0","23890");
INSERT INTO gfctotal VALUES("14","0000-00-00","0","0","0","0","0","0","0","2023-09-02","10000","13890");
INSERT INTO gfctotal VALUES("16","0000-00-00","0","0","0","0","0","0","0","2023-09-03","10000","3890");



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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO labour VALUES("1","2023-08-01","2023-08-10","20","20","60","60","4","240","240");
INSERT INTO labour VALUES("2","2023-08-11","2023-08-15","15","35","45","105","4","180","420");
INSERT INTO labour VALUES("3","2023-08-16","2023-08-20","5","40","15","120","4","60","480");
INSERT INTO labour VALUES("4","2023-08-21","2023-08-25","11","51","30.3","150.3","4","121","601");



DROP TABLE packingmaterial;

CREATE TABLE `packingmaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commondity_id` varchar(11) NOT NULL,
  `fish_size` varchar(11) NOT NULL,
  `plastic` varchar(11) NOT NULL,
  `jcv` varchar(11) NOT NULL,
  `inner_box` varchar(11) NOT NULL,
  `sticker` varchar(11) NOT NULL,
  `mc_plastic` varchar(11) NOT NULL,
  `carton_box` varchar(11) NOT NULL,
  `tape` int(11) NOT NULL,
  `penon` int(11) NOT NULL,
  `p_sticker` int(11) NOT NULL,
  `plastic_rope` varchar(11) NOT NULL,
  `micellion` int(11) NOT NULL,
  `processing` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `perkgcost` varchar(11) NOT NULL,
  `plastic_size` varchar(11) NOT NULL,
  `pcsperlb` int(11) NOT NULL,
  `pcspermc` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO packingmaterial VALUES("7","BJ123","1.5","106.1666666","8.25","","22.75","24.5","72","3","16","4","4.571428571","50","350","657","0.24","8*27","15","13");
INSERT INTO packingmaterial VALUES("8","BJ123","2","94.23076923","8.25","","17.5","24.5","72","3","16","4","4.571428571","50","350","640","0.23","9*30","13","10");



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
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `rate` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO processing VALUES("1","2023-08-01","2023-08-10","20","20","60","60","1.5","90","90");
INSERT INTO processing VALUES("2","2023-08-11","2023-08-15","15","35","45","105","1.5","68","158");
INSERT INTO processing VALUES("3","2023-08-16","2023-08-20","5","40","15","120","1.5","23","181");
INSERT INTO processing VALUES("4","2023-08-21","2023-08-25","11","51","30.3","150.3","1.5","45","226");



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



DROP TABLE repackingout;

CREATE TABLE `repackingout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `outkg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO repackingout VALUES("1","2023-08-01","100","4.5","450","450");
INSERT INTO repackingout VALUES("2","2023-08-02","150","4.5","675","1125");



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



DROP TABLE total_charges;

CREATE TABLE `total_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `total_coldstore_charges` bigint(19) NOT NULL,
  `total_labour_charges` bigint(19) NOT NULL,
  `total_processing_charges` bigint(19) NOT NULL,
  `repacking_charges` bigint(19) NOT NULL,
  `ice_charges` bigint(19) NOT NULL,
  `total_charges` bigint(19) NOT NULL,
  `grand_total_charges` bigint(19) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` bigint(19) NOT NULL,
  `balance_amount` bigint(19) NOT NULL,
  `remark` bigint(19) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO total_charges VALUES("2","2023-08-31","10000000","5000000","4000000","1000000","100000","20100000","20100000","0000-00-00","0","0","0");



