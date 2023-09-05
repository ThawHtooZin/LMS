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
INSERT INTO accounts VALUES("5","U Zin Lin Oo","uzinlinoo","uzinlinoo@gmail.com","1");
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO category VALUES("4","Fish");
INSERT INTO category VALUES("11","IQF");
INSERT INTO category VALUES("12","Block");
INSERT INTO category VALUES("13","Pujanut");



DROP TABLE coldstore;

CREATE TABLE `coldstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `day` int(11) NOT NULL,
  `rate` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO coldstore VALUES("79","2023-09-05","2023-09-10","4","50","50","150","150","5","4","3000","3000");
INSERT INTO coldstore VALUES("81","2023-09-02","2023-09-06","4","100","150","300","450","5","4","6000","9000");
INSERT INTO coldstore VALUES("82","2023-09-04","2023-09-07","11","50","50","150","150","3","4","1800","1800");
INSERT INTO coldstore VALUES("83","2023-09-01","2023-09-05","4","50","100","150","300","5","4","3000","4800");



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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcdryfishcoldstore VALUES("23","2023-09-02","import","300","300","1.6","480","480");
INSERT INTO gfcdryfishcoldstore VALUES("24","2023-09-02","takeout","50","250","1.6","0","0");
INSERT INTO gfcdryfishcoldstore VALUES("25","2023-09-02","takeout","10","240","1.6","480","0");
INSERT INTO gfcdryfishcoldstore VALUES("26","2023-09-02","import","300","540","1.6","864","1344");
INSERT INTO gfcdryfishcoldstore VALUES("27","2023-09-02","takeout","150","390","1.6","0","0");
INSERT INTO gfcdryfishcoldstore VALUES("28","2023-09-02","takeout","50","340","1.6","864","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcdryfishlabour VALUES("13","2023-09-01","import","150","3","450","450");
INSERT INTO gfcdryfishlabour VALUES("14","2023-09-01","takeout","50","3","150","600");
INSERT INTO gfcdryfishlabour VALUES("15","2023-09-01","export","10","3","30","630");
INSERT INTO gfcdryfishlabour VALUES("16","2023-09-02","import","300","3","900","1530");
INSERT INTO gfcdryfishlabour VALUES("17","2023-09-02","import","300","3","900","2430");
INSERT INTO gfcdryfishlabour VALUES("18","2023-09-02","import","300","3","900","3330");
INSERT INTO gfcdryfishlabour VALUES("19","2023-09-02","takeout","50","3","150","3480");
INSERT INTO gfcdryfishlabour VALUES("20","2023-09-02","import","300","3","900","4380");
INSERT INTO gfcdryfishlabour VALUES("21","2023-09-02","takeout","150","4","600","4980");



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
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcfishcoldstore VALUES("101","2023-09-01","balance","0","0","","0","","0","0");
INSERT INTO gfcfishcoldstore VALUES("102","2023-09-01","import","50","50","150","150","1.5","225","225");
INSERT INTO gfcfishcoldstore VALUES("105","2023-09-02","import","50","100","150","300","1.5","450","675");
INSERT INTO gfcfishcoldstore VALUES("121","2023-09-02","takeout","10","90","30","270","1.5","0","0");
INSERT INTO gfcfishcoldstore VALUES("122","2023-09-02","takeout","0","90","10","260","1.5","450","0");
INSERT INTO gfcfishcoldstore VALUES("123","2023-09-02","export","10","80","30","230","1.5","450","0");
INSERT INTO gfcfishcoldstore VALUES("132","2023-09-02","import","150","230","300","530","1.5","795","1470");



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
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcfishlabour VALUES("74","2023-09-01","import","150","3","450","450");
INSERT INTO gfcfishlabour VALUES("75","2023-09-01","import","150","3","450","900");
INSERT INTO gfcfishlabour VALUES("76","2023-09-01","import","150","3","450","1350");
INSERT INTO gfcfishlabour VALUES("77","2023-09-02","import","150","3","450","1800");
INSERT INTO gfcfishlabour VALUES("78","2023-09-02","takeout","15","3","45","1845");
INSERT INTO gfcfishlabour VALUES("79","0000-00-00","import","30","3","90","1935");
INSERT INTO gfcfishlabour VALUES("80","2023-09-02","takeout","30","3","90","2025");
INSERT INTO gfcfishlabour VALUES("81","2023-09-02","export","30","3","90","2115");
INSERT INTO gfcfishlabour VALUES("82","0000-00-00","0","30","3","0","0");
INSERT INTO gfcfishlabour VALUES("83","0000-00-00","0","30","3","0","0");
INSERT INTO gfcfishlabour VALUES("84","2023-09-02","takeout","30","3","90","90");
INSERT INTO gfcfishlabour VALUES("85","2023-09-02","takeout","30","3","90","180");
INSERT INTO gfcfishlabour VALUES("86","2023-09-02","export","30","3","90","270");
INSERT INTO gfcfishlabour VALUES("87","2023-09-02","import","300","3","900","1170");
INSERT INTO gfcfishlabour VALUES("88","2023-09-02","import","300","3","900","2070");
INSERT INTO gfcfishlabour VALUES("89","2023-09-02","import","300","3","900","2970");
INSERT INTO gfcfishlabour VALUES("90","2023-09-02","import","300","3","900","3870");
INSERT INTO gfcfishlabour VALUES("91","2023-09-02","import","300","3","900","4770");
INSERT INTO gfcfishlabour VALUES("92","2023-09-02","import","300","3","900","5670");



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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfctotal VALUES("18","0000-00-00","1470","5670","1575","0","4980","10000","23695","0000-00-00","0","23695");
INSERT INTO gfctotal VALUES("19","0000-00-00","0","0","0","0","0","0","0","2023-09-05","20000","3695");



DROP TABLE hhkstock;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

INSERT INTO hhkstock VALUES("3","2023-09-01","0000-00-00","4","200","200","600","600","600");
INSERT INTO hhkstock VALUES("5","0000-00-00","2023-09-10","4","50","150","150","450","450");
INSERT INTO hhkstock VALUES("7","2023-09-02","0000-00-00","4","100","250","300","750","1200");
INSERT INTO hhkstock VALUES("9","0000-00-00","2023-09-06","4","100","150","300","450","750");
INSERT INTO hhkstock VALUES("11","2023-09-03","0000-00-00","11","100","100","300","300","300");
INSERT INTO hhkstock VALUES("12","0000-00-00","2023-09-07","11","50","50","150","150","150");
INSERT INTO hhkstock VALUES("13","2023-09-04","0000-00-00","11","100","150","300","450","600");
INSERT INTO hhkstock VALUES("14","0000-00-00","2023-09-05","4","50","100","150","300","450");
INSERT INTO hhkstock VALUES("15","2023-09-02","0000-00-00","4","100","200","300","600","1050");



DROP TABLE item;

CREATE TABLE `item` (
  `item_id` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `category_id` int(11) NOT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO item VALUES("BJ123","4","Baby Koral");
INSERT INTO item VALUES("BL625","12","Block");
INSERT INTO item VALUES("HG184","4","D-Puti");
INSERT INTO item VALUES("HL123","4","Hilsa");
INSERT INTO item VALUES("KJ142","11","IQF");
INSERT INTO item VALUES("KJ243","4","Poa");
INSERT INTO item VALUES("OJ247","4","Puti");
INSERT INTO item VALUES("TU145","13","Pujanut");
INSERT INTO item VALUES("UT216","4","Rohu");



DROP TABLE labour;

CREATE TABLE `labour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `rate` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO labour VALUES("79","2023-09-05","2023-09-10","4","50","50","150","150","5","750","750");
INSERT INTO labour VALUES("81","2023-09-02","2023-09-06","4","100","150","300","450","5","1500","2250");
INSERT INTO labour VALUES("82","2023-09-04","2023-09-07","11","50","50","150","150","5","750","750");
INSERT INTO labour VALUES("83","2023-09-01","2023-09-05","4","50","200","150","600","5","750","3000");



DROP TABLE msl_total_charges;

CREATE TABLE `msl_total_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `total_coldstore_charges` bigint(19) NOT NULL,
  `total_freezing_charges` bigint(19) NOT NULL,
  `total_export_charges` bigint(19) NOT NULL,
  `repacking_charges` bigint(19) NOT NULL,
  `ice_charges` bigint(19) NOT NULL,
  `total_charges` bigint(19) NOT NULL,
  `grand_total_charges` bigint(19) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` bigint(19) NOT NULL,
  `balance_amount` bigint(19) NOT NULL,
  `remark` bigint(19) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;

INSERT INTO msl_total_charges VALUES("67","0000-00-00","BJ123","4800","36000","600","0","0","41400","41400","0000-00-00","0","41400","0");
INSERT INTO msl_total_charges VALUES("68","0000-00-00","HG184","4800","36000","600","10000","10000","61400","102800","0000-00-00","0","102800","0");
INSERT INTO msl_total_charges VALUES("69","0000-00-00","","0","0","0","0","0","0","0","2023-09-02","2800","100000","0");



DROP TABLE mslcoldstore;

CREATE TABLE `mslcoldstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `item_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `day` int(11) NOT NULL,
  `rate` varchar(12) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO mslcoldstore VALUES("87","2023-09-02","2023-09-06","BJ123","50","50","150","150","4","3","1800","1800");
INSERT INTO mslcoldstore VALUES("88","2023-09-02","2023-09-06","HG184","50","50","150","150","4","3","1800","1800");



DROP TABLE mslexportcharges;

CREATE TABLE `mslexportcharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `item_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `rate` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO mslexportcharges VALUES("87","2023-09-02","2023-09-06","BJ123","50","50","150","150","4","600","600");
INSERT INTO mslexportcharges VALUES("88","2023-09-02","2023-09-06","HG184","50","50","150","150","4","600","600");



DROP TABLE mslfreezing;

CREATE TABLE `mslfreezing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `item_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `rate` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO mslfreezing VALUES("87","2023-09-02","2023-09-06","BJ123","50","50","150","150","240","36000","36000");
INSERT INTO mslfreezing VALUES("88","2023-09-02","2023-09-06","HG184","50","50","150","150","240","36000","36000");



DROP TABLE mslrepacking;

CREATE TABLE `mslrepacking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `description` varchar(255) NOT NULL,
  `sheet` int(11) NOT NULL,
  `plastic` varchar(11) NOT NULL,
  `price` varchar(11) NOT NULL,
  `amount` varchar(11) NOT NULL,
  `total_charges` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

INSERT INTO mslrepacking VALUES("1","2023-09-01","Master Carton Charges","32","","1500","48000","48000");
INSERT INTO mslrepacking VALUES("2","2023-09-02","Plastic Bag Charges","0","54.4","2000","108000","156000");



DROP TABLE mslstock;

CREATE TABLE `mslstock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `balance` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

INSERT INTO mslstock VALUES("21","2023-09-01","0000-00-00","BJ123","100","100","300","300","300");
INSERT INTO mslstock VALUES("24","0000-00-00","2023-09-06","BJ123","50","50","150","150","150");
INSERT INTO mslstock VALUES("25","2023-09-01","0000-00-00","HG184","100","100","300","300","300");
INSERT INTO mslstock VALUES("26","0000-00-00","2023-09-06","HG184","50","50","150","150","150");



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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
INSERT INTO payable VALUES("69","KJ122","2008","250000","0000-00-00","","0","250000","31");
INSERT INTO payable VALUES("70","KJ122","","0","2023-09-02","AP007","100000","0","0");



DROP TABLE processing;

CREATE TABLE `processing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `rate` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO processing VALUES("79","2023-09-05","2023-09-10","4","50","50","150","150","270","40500","40500");
INSERT INTO processing VALUES("81","2023-09-02","2023-09-06","4","100","150","300","450","270","81000","121500");
INSERT INTO processing VALUES("82","2023-09-04","2023-09-07","11","50","50","150","150","470","70500","70500");
INSERT INTO processing VALUES("83","2023-09-01","2023-09-05","4","50","200","150","600","270","40500","162000");



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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO purchase VALUES("25","2023-08-26","2001","DK123","frozen","HL123","10","200","0","4000","800000");
INSERT INTO purchase VALUES("26","2023-08-26","2001","DK123","frozen","HG184","10","100","0","30000","3000000");
INSERT INTO purchase VALUES("28","2023-08-26","2001","DK123","frozen","HG184","10","200","0","5000","1000000");
INSERT INTO purchase VALUES("29","2023-08-26","2002","NS123","frozen","BJ123","10","100","0","2000","200000");
INSERT INTO purchase VALUES("30","2023-08-26","2002","NS123","frozen","BJ123","10","100","0","9000","900000");
INSERT INTO purchase VALUES("31","2023-09-27","2008","KJ122","frozen","UT216","10","50","5","5000","250000");



DROP TABLE repacking;

CREATE TABLE `repacking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `in_mc` int(10) NOT NULL,
  `in_kg` varchar(10) NOT NULL,
  `out_mc` int(11) NOT NULL,
  `out_kg` varchar(11) NOT NULL,
  `diff_mc` int(11) NOT NULL,
  `diff_kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` varchar(11) NOT NULL,
  `total_charges` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;




DROP TABLE repackingout;

CREATE TABLE `repackingout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `outkg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO repackingout VALUES("1","2023-08-01","100","4.5","450","450");
INSERT INTO repackingout VALUES("2","2023-08-02","150","4.5","675","1125");
INSERT INTO repackingout VALUES("3","2023-09-03","100","4.5","450","1575");



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
  `commondity_id` int(11) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4;

INSERT INTO total_charges VALUES("61","0000-00-00","4","3000","750","40500","0","0","44250","44250","0000-00-00","0","44250","0");
INSERT INTO total_charges VALUES("63","0000-00-00","4","9000","2250","121500","0","0","132750","177000","0000-00-00","0","177000","0");
INSERT INTO total_charges VALUES("64","0000-00-00","11","1800","750","70500","0","0","73050","250050","0000-00-00","0","250050","0");
INSERT INTO total_charges VALUES("65","0000-00-00","4","4800","3000","162000","10000","10000","199800","449850","0000-00-00","0","449850","0");
INSERT INTO total_charges VALUES("66","0000-00-00","0","0","0","0","0","0","0","0","2023-09-10","49850","400000","0");



