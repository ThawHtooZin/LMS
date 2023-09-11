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



DROP TABLE actualinvoice;

CREATE TABLE `actualinvoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commondity_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `packingkgperbox` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `totalnetweight` varchar(11) NOT NULL,
  `usd` varchar(11) NOT NULL,
  `total_usd` varchar(11) NOT NULL,
  `infoid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

INSERT INTO actualinvoice VALUES("11","HG184","2up","20","10","200","0","0","1");
INSERT INTO actualinvoice VALUES("12","HG184","3up","15","10","150","0","0","1");
INSERT INTO actualinvoice VALUES("13","HL123","3up","20","10","200","0","0","3");
INSERT INTO actualinvoice VALUES("14","UT216","2up","20","10","200","","","3");
INSERT INTO actualinvoice VALUES("15","HL123","2up","21","5","105","2","40","3");
INSERT INTO actualinvoice VALUES("16","HL123","3up","21","5","105","0","0","3");



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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO coldstore VALUES("79","2023-09-05","2023-09-10","4","50","50","150","150","5","4","3000","3000");
INSERT INTO coldstore VALUES("81","2023-09-02","2023-09-06","4","100","150","300","450","5","4","6000","9000");
INSERT INTO coldstore VALUES("82","2023-09-04","2023-09-07","11","50","50","150","150","3","4","1800","1800");
INSERT INTO coldstore VALUES("83","2023-09-01","2023-09-05","4","50","100","150","300","5","4","3000","4800");
INSERT INTO coldstore VALUES("84","2023-09-02","2023-09-06","11","100","150","300","450","5","4","6000","7800");



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
INSERT INTO customers VALUES("M3333","MomboJumbo","344544","NY");
INSERT INTO customers VALUES("w12121","Mr.LPO","97854234","DAKA");



DROP TABLE form10stock;

CREATE TABLE `form10stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `country` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `pcsform10` int(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `pcs` int(11) NOT NULL,
  `looseinkg` varchar(11) NOT NULL,
  `looseinpcs` int(11) NOT NULL,
  `looseoutkg` varchar(11) NOT NULL,
  `looseoutpcs` int(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `percentage` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO form10stock VALUES("1","2023-09-08","HG184","Japan","2up","10","3","60","9","3","1","","0","63","");
INSERT INTO form10stock VALUES("2","2023-09-08","HL123","NY","3up","20","2","40","10","","0","","0","40","");
INSERT INTO form10stock VALUES("3","2023-09-07","KJ243","NY","4up","79","25","500","3","12.5","4","","0","512","");
INSERT INTO form10stock VALUES("4","2023-08-16","UT216","NY","2up","10","3","60","3","3","1","","0","63","");



DROP TABLE form7stock;

CREATE TABLE `form7stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `supplier_name` varchar(255) NOT NULL,
  `country` varchar(155) NOT NULL,
  `size` varchar(11) NOT NULL,
  `viss` varchar(11) NOT NULL,
  `kg` varchar(15) NOT NULL,
  `pcspervr` varchar(15) NOT NULL,
  `pcsperf7` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;

INSERT INTO form7stock VALUES("1","2023-09-06","KJ243","NS123","NY","3up","209.4","342.1596","89","10");
INSERT INTO form7stock VALUES("2","2023-09-06","KJ243","NS123","","4up","357.5","584.155","79","20");
INSERT INTO form7stock VALUES("3","2023-09-06","UT216","NS123","Japan","2up","200","326.8","50","10");
INSERT INTO form7stock VALUES("4","2023-09-06","UT216","NS123","","5up","100","163.4","100","0");
INSERT INTO form7stock VALUES("5","2023-09-06","HL123","NS123","","1up","45","73.53","20","20");
INSERT INTO form7stock VALUES("6","2023-09-07","OJ247","HE132","","3up","200","326.8","50","0");
INSERT INTO form7stock VALUES("7","2023-09-07","HG184","JH123","Japan","2up","100","163.4","","10");
INSERT INTO form7stock VALUES("8","2023-09-09","HL123","JK909","","4up","75","122.55","","0");
INSERT INTO form7stock VALUES("9","2023-09-09","HL123","JK909","","3up","100","163.4","","0");
INSERT INTO form7stock VALUES("10","2023-09-08","HL123","NS123","","6up","150","245.1","","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

INSERT INTO hhkstock VALUES("3","2023-09-01","0000-00-00","4","200","200","600","600","600");
INSERT INTO hhkstock VALUES("5","0000-00-00","2023-09-10","4","50","150","150","450","450");
INSERT INTO hhkstock VALUES("7","2023-09-02","0000-00-00","4","100","250","300","750","1200");
INSERT INTO hhkstock VALUES("9","0000-00-00","2023-09-06","4","100","150","300","450","750");
INSERT INTO hhkstock VALUES("11","2023-09-03","0000-00-00","11","100","100","300","300","300");
INSERT INTO hhkstock VALUES("12","0000-00-00","2023-09-07","11","50","50","150","150","150");
INSERT INTO hhkstock VALUES("13","2023-09-04","0000-00-00","11","100","150","300","450","600");
INSERT INTO hhkstock VALUES("14","0000-00-00","2023-09-05","4","50","100","150","300","450");
INSERT INTO hhkstock VALUES("15","2023-09-02","0000-00-00","4","100","200","300","600","1050");
INSERT INTO hhkstock VALUES("17","0000-00-00","2023-09-06","11","100","50","300","150","450");



DROP TABLE invoice_costing;

CREATE TABLE `invoice_costing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commondity_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `priceperviss` varchar(11) NOT NULL,
  `priceperkg` varchar(11) NOT NULL,
  `yield` varchar(11) NOT NULL,
  `total_price` varchar(11) NOT NULL,
  `usd` varchar(11) NOT NULL,
  `packing_material` varchar(11) NOT NULL,
  `ocean_pacific` varchar(11) NOT NULL,
  `tax` varchar(11) NOT NULL,
  `agent` varchar(11) NOT NULL,
  `transport` varchar(11) NOT NULL,
  `total_usd` varchar(11) NOT NULL,
  `sellingpriceperkg` varchar(11) NOT NULL,
  `total_selling_price` varchar(11) NOT NULL,
  `profitorlossperkg` varchar(11) NOT NULL,
  `profit_amount` varchar(11) NOT NULL,
  `total_kg_price` varchar(11) NOT NULL,
  `infoid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO invoice_costing VALUES("1","HG184","2up","20","1100","673.1946144","4.5","699.92","0.233","0.3","0.04","0.3","0.3","0.2","1.373","1.5","30","0.127","2.54","27.46","1");
INSERT INTO invoice_costing VALUES("2","HG184","3up","15","1200","734.3941248","-3.5","756.02","0.252","0.3","0.04","0.3","0.3","0.2","1.392","1.6","24","0.208","3.12","20.88","1");
INSERT INTO invoice_costing VALUES("3","HL123","3up","20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","3");
INSERT INTO invoice_costing VALUES("4","UT216","2up","20","","","","","","","","","","","","","","","","","3");
INSERT INTO invoice_costing VALUES("5","HL123","2up","21","1100","1797.4","4.5","1720","0.573333333","0.3","0.04","0.3","0.3","0.2","1.713333333","2","42","0.286666667","6.020000007","35.98","3");
INSERT INTO invoice_costing VALUES("6","HL123","3up","21","","","","","","","","","","","","","","","","","3");



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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO labour VALUES("79","2023-09-05","2023-09-10","4","50","50","150","150","5","750","750");
INSERT INTO labour VALUES("81","2023-09-02","2023-09-06","4","100","150","300","450","5","1500","2250");
INSERT INTO labour VALUES("82","2023-09-04","2023-09-07","11","50","50","150","150","5","750","750");
INSERT INTO labour VALUES("83","2023-09-01","2023-09-05","4","50","200","150","600","5","750","3000");
INSERT INTO labour VALUES("84","2023-09-02","2023-09-06","11","100","150","300","450","5","1500","2250");



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
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8mb4;

INSERT INTO msl_total_charges VALUES("67","0000-00-00","BJ123","4800","36000","600","0","0","41400","41400","0000-00-00","0","41400","0");
INSERT INTO msl_total_charges VALUES("76","0000-00-00","HL123","1050","16800","280","0","0","18130","59530","0000-00-00","0","59530","0");
INSERT INTO msl_total_charges VALUES("77","0000-00-00","UT216","2250","36000","600","0","50000","88850","148380","0000-00-00","0","148380","0");
INSERT INTO msl_total_charges VALUES("78","0000-00-00","","0","0","0","0","0","0","0","2023-09-07","48380","100000","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO mslcoldstore VALUES("87","2023-09-02","2023-09-06","BJ123","50","50","150","150","4","3","1800","1800");
INSERT INTO mslcoldstore VALUES("101","2023-09-01","2023-09-06","HL123","20","20","60","60","5","3","900","900");
INSERT INTO mslcoldstore VALUES("102","2023-09-01","0000-00-00","HL123","30","50","10","70","5","3","150","1050");
INSERT INTO mslcoldstore VALUES("103","2023-09-01","2023-09-06","UT216","50","50","150","150","5","3","2250","2250");



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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO mslexportcharges VALUES("87","2023-09-02","2023-09-06","BJ123","50","50","150","150","4","600","600");
INSERT INTO mslexportcharges VALUES("101","2023-09-01","2023-09-06","HL123","20","20","60","60","4","240","240");
INSERT INTO mslexportcharges VALUES("102","2023-09-01","0000-00-00","HL123","30","50","10","60","70","40","280");
INSERT INTO mslexportcharges VALUES("103","2023-09-01","2023-09-06","UT216","50","50","150","150","4","600","600");



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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO mslfreezing VALUES("87","2023-09-02","2023-09-06","BJ123","50","50","150","150","240","36000","36000");
INSERT INTO mslfreezing VALUES("101","2023-09-01","2023-09-06","HL123","20","20","60","60","240","14400","14400");
INSERT INTO mslfreezing VALUES("102","2023-09-01","0000-00-00","HL123","30","50","10","60","70","2400","16800");
INSERT INTO mslfreezing VALUES("103","2023-09-01","2023-09-06","UT216","50","50","150","150","240","36000","36000");



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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

INSERT INTO mslstock VALUES("21","2023-09-01","0000-00-00","BJ123","100","100","300","300","300");
INSERT INTO mslstock VALUES("24","0000-00-00","2023-09-06","BJ123","50","50","150","150","150");
INSERT INTO mslstock VALUES("27","2023-09-01","0000-00-00","HL123","100","100","300","300","300");
INSERT INTO mslstock VALUES("28","2023-09-01","0000-00-00","UT216","150","150","450","450","450");
INSERT INTO mslstock VALUES("35","0000-00-00","2023-09-06","HL123","20","80","60","240","60");
INSERT INTO mslstock VALUES("36","0000-00-00","2023-09-06","UT216","50","100","150","300","");



DROP TABLE packingliststock;

CREATE TABLE `packingliststock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `customer_id` varchar(11) NOT NULL,
  `country` varchar(11) NOT NULL,
  `invoiceno` varchar(11) NOT NULL,
  `containerno` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

INSERT INTO packingliststock VALUES("1","2023-09-01","M3333","NY","975B2","BF747");
INSERT INTO packingliststock VALUES("3","2023-09-08","B133","NY","975T2","LJ734");
INSERT INTO packingliststock VALUES("4","2023-09-10","w12121","DAKA","97P31","AJ733");



DROP TABLE packingliststockinfo;

CREATE TABLE `packingliststockinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `commondity_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `packingkgperbox` int(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `totalnetweight` int(11) NOT NULL,
  `totalgrossweight` varchar(11) NOT NULL,
  `usd` varchar(11) NOT NULL,
  `total_usd` varchar(11) NOT NULL,
  `infoid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

INSERT INTO packingliststockinfo VALUES("18","HG184","2up","20","10","200","210","","","1");
INSERT INTO packingliststockinfo VALUES("19","HG184","3up","15","10","150","160","","","1");
INSERT INTO packingliststockinfo VALUES("20","HL123","3up","20","10","200","210","","","3");
INSERT INTO packingliststockinfo VALUES("21","UT216","2up","20","10","200","210","","","3");
INSERT INTO packingliststockinfo VALUES("22","HL123","2up","21","5","105","110","","","3");
INSERT INTO packingliststockinfo VALUES("23","HL123","3up","21","5","105","110","","","3");



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
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
INSERT INTO payable VALUES("71","DK123","1009","250000","0000-00-00","","0","250000","32");
INSERT INTO payable VALUES("72","DK123","2009","1047000","0000-00-00","","0","1297000","33");
INSERT INTO payable VALUES("73","DK123","","0","0000-00-00","","0","1297000","34");
INSERT INTO payable VALUES("74","DG214","2009","1047000","0000-00-00","","0","2344000","35");
INSERT INTO payable VALUES("75","NS123","2009","1047000","0000-00-00","","0","3391000","36");
INSERT INTO payable VALUES("76","NS123","2009","1047000","0000-00-00","","0","4438000","37");
INSERT INTO payable VALUES("77","NS123","2009","143000","0000-00-00","","0","4581000","38");
INSERT INTO payable VALUES("78","NS123","2009","100000","0000-00-00","","0","4681000","39");
INSERT INTO payable VALUES("79","NS123","2009","500000","0000-00-00","","0","5181000","40");
INSERT INTO payable VALUES("80","NS123","2009","45000","0000-00-00","","0","5226000","41");
INSERT INTO payable VALUES("81","HE132","2010","240000","0000-00-00","","0","5466000","42");
INSERT INTO payable VALUES("82","JH123","2011","110000","0000-00-00","","0","5576000","43");
INSERT INTO payable VALUES("83","JK909","2011","75000","0000-00-00","","0","5651000","44");
INSERT INTO payable VALUES("84","JK909","2012","110000","0000-00-00","","0","5761000","45");
INSERT INTO payable VALUES("85","NS123","2012","150000","0000-00-00","","0","5911000","46");



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
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO processing VALUES("79","2023-09-05","2023-09-10","4","50","50","150","150","270","40500","40500");
INSERT INTO processing VALUES("81","2023-09-02","2023-09-06","4","100","150","300","450","270","81000","121500");
INSERT INTO processing VALUES("82","2023-09-04","2023-09-07","11","50","50","150","150","470","70500","70500");
INSERT INTO processing VALUES("83","2023-09-01","2023-09-05","4","50","200","150","600","270","40500","162000");
INSERT INTO processing VALUES("84","2023-09-02","2023-09-06","11","100","100","300","300","350","105000","105000");



DROP TABLE purchase;

CREATE TABLE `purchase` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `voucher_no` int(11) NOT NULL,
  `supplier_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `tclfrozen` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `commodity` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `viss` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `pcs` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO purchase VALUES("25","2023-08-26","2001","DK123","frozen","HL123","10","200","0","4000","800000");
INSERT INTO purchase VALUES("26","2023-08-26","2001","DK123","frozen","HG184","10","100","0","30000","3000000");
INSERT INTO purchase VALUES("28","2023-08-26","2001","DK123","frozen","HG184","10","200","0","5000","1000000");
INSERT INTO purchase VALUES("29","2023-08-26","2002","NS123","frozen","BJ123","10","100","0","2000","200000");
INSERT INTO purchase VALUES("30","2023-08-26","2002","NS123","frozen","BJ123","10","100","0","9000","900000");
INSERT INTO purchase VALUES("31","2023-09-27","2008","KJ122","frozen","UT216","10","50","5","5000","250000");
INSERT INTO purchase VALUES("32","2023-09-06","1009","DK123","frozen","BJ123","1up","50","0","5000","250000");
INSERT INTO purchase VALUES("37","2023-09-06","2009","NS123","frozen","KJ243","3up","209.4","89","5000","1047000");
INSERT INTO purchase VALUES("38","2023-09-06","2009","NS123","frozen","KJ243","4up","357.5","79","400","143000");
INSERT INTO purchase VALUES("39","2023-09-06","2009","NS123","frozen","UT216","2up","200","50","500","100000");
INSERT INTO purchase VALUES("40","2023-09-06","2009","NS123","frozen","UT216","5up","100","100","5000","500000");
INSERT INTO purchase VALUES("41","2023-09-06","2009","NS123","frozen","HL123","1up","45","20","1000","45000");
INSERT INTO purchase VALUES("42","2023-09-07","2010","HE132","frozen","OJ247","3up","200","50","1200","240000");
INSERT INTO purchase VALUES("43","2023-09-07","2011","JH123","frozen","HG184","2up","100","0","1100","110000");
INSERT INTO purchase VALUES("44","2023-09-09","2011","JK909","frozen","HL123","4up","75","0","1000","75000");
INSERT INTO purchase VALUES("45","2023-09-09","2012","JK909","frozen","HL123","3up","100","0","1100","110000");
INSERT INTO purchase VALUES("46","2023-09-08","2012","NS123","frozen","HL123","6up","150","0","1000","150000");



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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO repacking VALUES("5","2023-09-05","15","45","15","45","0","0","4.5","202.5","202.5");



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
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4;

INSERT INTO total_charges VALUES("61","0000-00-00","4","3000","750","40500","0","0","44250","44250","0000-00-00","0","44250","0");
INSERT INTO total_charges VALUES("63","0000-00-00","4","9000","2250","121500","0","0","132750","177000","0000-00-00","0","177000","0");
INSERT INTO total_charges VALUES("64","0000-00-00","11","1800","750","70500","0","0","73050","250050","0000-00-00","0","250050","0");
INSERT INTO total_charges VALUES("65","0000-00-00","4","4800","3000","162000","10000","10000","199800","449850","0000-00-00","0","449850","0");
INSERT INTO total_charges VALUES("66","0000-00-00","0","0","0","0","0","0","0","0","2023-09-10","49850","400000","0");
INSERT INTO total_charges VALUES("67","0000-00-00","11","7800","2250","105000","0","50000","165050","565050","0000-00-00","0","565050","0");



