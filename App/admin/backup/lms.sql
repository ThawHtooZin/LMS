DROP TABLE accounts;

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO accounts VALUES("18","admin","admin","admin@gmail.com","1");
INSERT INTO accounts VALUES("24","Mg Mg","mgmg","mgmg@gmail.com","6");



DROP TABLE acname;

CREATE TABLE `acname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_no` varchar(19) NOT NULL,
  `ac_type` int(11) NOT NULL,
  `ac_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_no` (`code_no`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO acname VALUES("76","4000/K01","24","Kyi Sin");
INSERT INTO acname VALUES("77","9100/003","25","Diesel & Petrol ");
INSERT INTO acname VALUES("78","3600/001","24","Main Cash (MMK)");
INSERT INTO acname VALUES("79","3600.002","24","Main Cash (USD)");
INSERT INTO acname VALUES("80","4000/A01","24","A Thay Lay");
INSERT INTO acname VALUES("81","4000/B01","24","Bur Bu lay");
INSERT INTO acname VALUES("82","4000/S01","24","Soe Naing");
INSERT INTO acname VALUES("86","3300/001","31","USA");
INSERT INTO acname VALUES("88","3300/002","31","CANADA");



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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE actype;

CREATE TABLE `actype` (
  `acid` int(11) NOT NULL AUTO_INCREMENT,
  `ac_type` varchar(255) NOT NULL,
  PRIMARY KEY (`acid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO actype VALUES("24","Current Liability");
INSERT INTO actype VALUES("25","Expense");
INSERT INTO actype VALUES("31","Current Asset");



DROP TABLE bankdetail;

CREATE TABLE `bankdetail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `infoid` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_address` varchar(255) NOT NULL,
  `usd` varchar(200) NOT NULL,
  `account_type` varchar(255) NOT NULL,
  `bank_name` varchar(255) NOT NULL,
  `swift_code` varchar(200) NOT NULL,
  `bank_branch_address` varchar(200) NOT NULL,
  `branch_name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE cashbook;

CREATE TABLE `cashbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `ac_name` varchar(25) NOT NULL,
  `particular` text NOT NULL,
  `debit` bigint(20) DEFAULT NULL,
  `credit` bigint(20) DEFAULT NULL,
  `balance` bigint(25) NOT NULL,
  `voucher_no` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO cashbook VALUES("149","2023-11-03","","3600/001","Sale ","300000","0","300000","B001");



DROP TABLE category;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` varchar(22) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO category VALUES("8","1000/B01","Block");
INSERT INTO category VALUES("9","1000/F01","Fish");
INSERT INTO category VALUES("10","3","IQF");
INSERT INTO category VALUES("11","4","Jujanut");



DROP TABLE coldstore;

CREATE TABLE `coldstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(12) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `day` int(11) NOT NULL,
  `rate` varchar(12) NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO coldstore VALUES("144","2023-11-03","2023-11-05","1000/B01","10","10","90","90","3","3","810","810");
INSERT INTO coldstore VALUES("145","2023-11-03","2023-11-05","1000/B01","10","20","90","180","3","3","810","1620");
INSERT INTO coldstore VALUES("146","2023-11-03","2023-11-05","1000/B01","10","30","90","270","3","3","810","2430");
INSERT INTO coldstore VALUES("147","2023-11-03","2023-11-05","1000/B01","10","40","90","360","3","3","810","3240");
INSERT INTO coldstore VALUES("148","2023-11-03","2023-11-05","1000/F01","10","10","90","90","3","3","810","810");
INSERT INTO coldstore VALUES("149","2023-11-03","2023-11-05","1000/F01","10","20","90","180","3","3","810","1620");
INSERT INTO coldstore VALUES("150","2023-11-03","2023-11-05","1000/F01","10","30","90","270","3","3","810","2430");
INSERT INTO coldstore VALUES("151","2023-11-03","2023-11-05","1000/F01","10","40","90","360","3","3","810","3240");
INSERT INTO coldstore VALUES("152","2023-11-03","2023-11-03","3","50","50","450","450","1","3","1350","1350");



DROP TABLE container;

CREATE TABLE `container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_no` int(11) NOT NULL,
  `country` varchar(20) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE currency;

CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dollar_rate` double NOT NULL,
  `debitorcredit` varchar(255) NOT NULL,
  `mmk_amount` bigint(25) NOT NULL,
  `usd_amount` bigint(25) NOT NULL,
  `voucher_no` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=320 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO currency VALUES("318","3000","debit","300000","100","B001");
INSERT INTO currency VALUES("319","3000","credit","300000","100","B001");



DROP TABLE customers;

CREATE TABLE `customers` (
  `customer_id` varchar(100) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_phone` bigint(14) NOT NULL,
  `customer_address` text NOT NULL,
  PRIMARY KEY (`customer_id`),
  UNIQUE KEY `customer_name` (`customer_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO customers VALUES("3300/001","USA","0","");
INSERT INTO customers VALUES("3300/002","CANADA","0","");



DROP TABLE form10stock;

CREATE TABLE `form10stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `supplier_id` varchar(20) NOT NULL,
  `country` varchar(11) NOT NULL,
  `type` varchar(255) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO form10stock VALUES("70","2023-11-01","1000/H01","4000/A01","NY","frozen","4up","19","20","21","19","","0","","0","21","");
INSERT INTO form10stock VALUES("71","2023-11-01","1000/K02","4000/B01","DAKA","tcl","2up","25","20","351","21","20","4","","0","371","");



DROP TABLE form7stock;

CREATE TABLE `form7stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
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
  `link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=165 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO form7stock VALUES("164","2023-11-03","1000/H01","4000/K01","NY","frozen","2up","100","163.4","","20","155");



DROP TABLE general_ledger;

CREATE TABLE `general_ledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `voucherno` varchar(25) NOT NULL,
  `ac_code` varchar(25) NOT NULL,
  `debit` int(11) NOT NULL,
  `credit` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  `narration` text NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `container_no` varchar(25) NOT NULL,
  `bank_charges` float NOT NULL,
  `acid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=702 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO general_ledger VALUES("698","2023-11-03","A0001","4000/K01","50000","0","50000","Paid to Supplier","","","0","24");
INSERT INTO general_ledger VALUES("699","2023-11-03","A0001","3600/001","0","50000","-100000","Paid to Supplier","","","0","24");
INSERT INTO general_ledger VALUES("700","2023-11-03","B001","3600/001","300000","0","200000","Sale ","","","0","24");
INSERT INTO general_ledger VALUES("701","2023-11-03","B001","3300/001","0","300000","-300000","sale","uuoop","ac-321","0","31");



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
  `remark` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE gfcdryfishlabour;

CREATE TABLE `gfcdryfishlabour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `ite` varchar(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
  `remark` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=450 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO gfcfishcoldstore VALUES("442","2023-10-30","import","100","100","900","900","3","2700","2700","");
INSERT INTO gfcfishcoldstore VALUES("443","2023-10-30","export","50","150","450","1350","3","0","0","");
INSERT INTO gfcfishcoldstore VALUES("444","2023-11-01","import","100","250","900","2250","3","6750","6750","");
INSERT INTO gfcfishcoldstore VALUES("446","2023-11-02","import","20","270","90","2340","1.5","3510","10260","");
INSERT INTO gfcfishcoldstore VALUES("447","2023-11-02","export","10","280","90","2430","1.5","0","0","");
INSERT INTO gfcfishcoldstore VALUES("448","2023-11-03","import","100","380","900","3330","1.5","4995","15255","");
INSERT INTO gfcfishcoldstore VALUES("449","2023-11-03","export","100","480","900","4230","1.5","0","0","");



DROP TABLE gfcfishlabour;

CREATE TABLE `gfcfishlabour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `ite` varchar(12) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  `remark` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=345 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO gfcfishlabour VALUES("337","2023-10-30","import","900","4","3600","3600","");
INSERT INTO gfcfishlabour VALUES("338","2023-10-30","export","450","4","1800","5400","");
INSERT INTO gfcfishlabour VALUES("339","2023-11-01","import","900","4","3600","3600","");
INSERT INTO gfcfishlabour VALUES("341","2023-11-02","import","90","4","360","3960","");
INSERT INTO gfcfishlabour VALUES("342","2023-11-02","export","90","4","360","4320","");
INSERT INTO gfcfishlabour VALUES("343","2023-11-03","import","900","3","2700","7020","");
INSERT INTO gfcfishlabour VALUES("344","2023-11-03","export","900","3","2700","9720","");



DROP TABLE gfcmcstock;

CREATE TABLE `gfcmcstock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(19) NOT NULL,
  `particular` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `balance_mc` bigint(17) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO gfctotal VALUES("31","2023-11-03","15255","7020","0","0","0","100","22375","0000-00-00","0","22375");
INSERT INTO gfctotal VALUES("32","0000-00-00","0","0","0","0","0","0","0","2023-11-03","2375","20000");



DROP TABLE hhkmcstock;

CREATE TABLE `hhkmcstock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country` varchar(19) NOT NULL,
  `particular` varchar(255) NOT NULL,
  `date` date NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `balance_mc` bigint(17) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
  `link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO hhkstock VALUES("92","2023-11-03","0000-00-00","1000/B01","100","100","900","900","90","0");
INSERT INTO hhkstock VALUES("93","2023-11-03","0000-00-00","1000/B01","100","100","900","900","270","0");
INSERT INTO hhkstock VALUES("94","0000-00-00","2023-11-05","1000/B01","10","90","90","810","-540","144");
INSERT INTO hhkstock VALUES("95","0000-00-00","2023-11-05","1000/B01","10","80","90","720","-1260","145");
INSERT INTO hhkstock VALUES("96","0000-00-00","2023-11-05","1000/B01","10","70","90","630","-1890","146");
INSERT INTO hhkstock VALUES("97","0000-00-00","2023-11-05","1000/B01","10","60","90","540","-2430","147");
INSERT INTO hhkstock VALUES("98","2023-11-03","0000-00-00","1000/F01","100","100","900","900","900","0");
INSERT INTO hhkstock VALUES("99","0000-00-00","2023-11-05","1000/F01","10","90","90","810","90","148");
INSERT INTO hhkstock VALUES("100","0000-00-00","2023-11-05","1000/F01","10","80","90","720","-630","149");
INSERT INTO hhkstock VALUES("101","0000-00-00","2023-11-05","1000/F01","10","70","90","630","-1260","150");
INSERT INTO hhkstock VALUES("102","0000-00-00","2023-11-05","1000/F01","10","60","90","540","-1800","151");
INSERT INTO hhkstock VALUES("103","2023-11-03","0000-00-00","3","100","100","900","900","900","0");
INSERT INTO hhkstock VALUES("104","0000-00-00","2023-11-03","3","50","50","450","450","450","152");



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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE item;

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(22) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO item VALUES("2","1000/H01","Hilsa");
INSERT INTO item VALUES("3","1000/K01","Koral");
INSERT INTO item VALUES("4","1000/D01","D-puti");
INSERT INTO item VALUES("5","1000/B01","Batashi");
INSERT INTO item VALUES("6","1000/B02","Baby Koral");
INSERT INTO item VALUES("8","1000/C01","Chondana");
INSERT INTO item VALUES("9","1000/B03","Boal");
INSERT INTO item VALUES("11","1000/P01","Poa");
INSERT INTO item VALUES("13","1000/T01","Taposhi");
INSERT INTO item VALUES("14","1000/W01","WP");
INSERT INTO item VALUES("15","1000/K02","Katla");



DROP TABLE labour;

CREATE TABLE `labour` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO labour VALUES("144","2023-11-03","2023-11-05","1000/B01","10","10","90","90","4","360","360");
INSERT INTO labour VALUES("145","2023-11-03","2023-11-05","1000/B01","10","20","90","180","4","360","720");
INSERT INTO labour VALUES("146","2023-11-03","2023-11-05","1000/B01","10","30","90","270","4","360","1080");
INSERT INTO labour VALUES("147","2023-11-03","2023-11-05","1000/B01","10","40","90","360","4","360","1440");
INSERT INTO labour VALUES("148","2023-11-03","2023-11-05","1000/F01","10","10","90","90","4","360","360");
INSERT INTO labour VALUES("149","2023-11-03","2023-11-05","1000/F01","10","20","90","180","4","360","720");
INSERT INTO labour VALUES("150","2023-11-03","2023-11-05","1000/F01","10","30","90","270","4","360","1080");
INSERT INTO labour VALUES("151","2023-11-03","2023-11-05","1000/F01","10","40","90","360","4","360","1440");
INSERT INTO labour VALUES("152","2023-11-03","2023-11-03","3","50","50","450","450","4","1800","1800");



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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE mslcoldstore;

CREATE TABLE `mslcoldstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(12) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `day` int(11) NOT NULL,
  `rate` varchar(12) NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE mslexportcharges;

CREATE TABLE `mslexportcharges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(15) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `rate` varchar(15) NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE mslfreezing;

CREATE TABLE `mslfreezing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE packingliststock;

CREATE TABLE `packingliststock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `customer_id` varchar(11) NOT NULL,
  `country` varchar(11) NOT NULL,
  `invoiceno` varchar(11) NOT NULL,
  `containerno` varchar(11) NOT NULL,
  `vessel_name` varchar(33) NOT NULL,
  `voyname` varchar(55) NOT NULL,
  `fda` varchar(56) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE payable;

CREATE TABLE `payable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `supplier_id` varchar(15) NOT NULL,
  `purchase_voucher_no` varchar(25) NOT NULL,
  `purchase_amount` bigint(19) NOT NULL,
  `paid_date` date NOT NULL,
  `paid_voucher` varchar(25) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `paid_amount` bigint(25) NOT NULL,
  `balance` bigint(25) NOT NULL,
  `link_id` int(11) NOT NULL,
  `closing_balance` int(11) NOT NULL,
  `report_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=244 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO payable VALUES("243","2023-11-03","4000/K01","4045","100000","2023-11-03","A0001","Paid to Supplier","50000","50000","155","0","0000-00-00");



DROP TABLE permission;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO permission VALUES("1","1","manage_accounts,manage_role,manage_sale,manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transactionmanage_general_ledger,manage_customers,manage_supplier,manage_coldstoreitem,manage_item,manage_actype,manage_acname,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,manage_packingmaterial,purchase_report,payable_report");
INSERT INTO permission VALUES("6","6",",manage_sale,manage_purchase,manage_cashbook,manage_accountpayable,manage_acpayable,manage_accountreceivablemanage_general_ledger");



DROP TABLE processing;

CREATE TABLE `processing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `indate` date NOT NULL,
  `outdate` date NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(15) NOT NULL,
  `total_kg` varchar(11) NOT NULL,
  `rate` varchar(15) NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO processing VALUES("144","2023-11-03","2023-11-05","1000/B01","10","10","90","90","","10000","10000");
INSERT INTO processing VALUES("145","2023-11-03","2023-11-05","1000/B01","10","20","90","180","","10000","20000");
INSERT INTO processing VALUES("146","2023-11-03","2023-11-05","1000/B01","10","30","90","270","","10000","30000");
INSERT INTO processing VALUES("147","2023-11-03","2023-11-05","1000/B01","10","40","90","360","","10000","40000");
INSERT INTO processing VALUES("148","2023-11-03","2023-11-05","1000/F01","10","10","90","90","270","24300","24300");
INSERT INTO processing VALUES("149","2023-11-03","2023-11-05","1000/F01","10","20","90","180","270","24300","48600");
INSERT INTO processing VALUES("150","2023-11-03","2023-11-05","1000/F01","10","30","90","270","270","24300","72900");
INSERT INTO processing VALUES("151","2023-11-03","2023-11-05","1000/F01","10","40","90","360","270","24300","97200");
INSERT INTO processing VALUES("152","2023-11-03","2023-11-03","3","50","50","450","450","470","211500","211500");



DROP TABLE purchase;

CREATE TABLE `purchase` (
  `no` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `voucher_no` int(11) NOT NULL,
  `supplier_id` varchar(255) NOT NULL,
  `tclfrozen` varchar(255) NOT NULL,
  `commodity` varchar(255) NOT NULL,
  `size` varchar(11) NOT NULL,
  `viss` varchar(11) NOT NULL,
  `pcs` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO purchase VALUES("155","2023-11-03","4045","4000/K01","frozen","1000/H01","2up","100","0","1000","100000");



DROP TABLE receivable;

CREATE TABLE `receivable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `ac_code` varchar(25) NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `container_no` varchar(25) NOT NULL,
  `invoice_amount` varchar(25) NOT NULL,
  `paid_date` date NOT NULL,
  `payment_no` varchar(25) NOT NULL,
  `particulars` varchar(255) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `balance` bigint(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO receivable VALUES("231","0000-00-00","3300/001","","","","2023-11-03","B001","sale","100","-300000");



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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE repackingout;

CREATE TABLE `repackingout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `outkg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




DROP TABLE role;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO role VALUES("1","Admin");
INSERT INTO role VALUES("6","Stock");



DROP TABLE supplier;

CREATE TABLE `supplier` (
  `supplier_name` varchar(255) NOT NULL,
  `supplier_phone` varchar(255) NOT NULL,
  `supplier_address` varchar(255) NOT NULL,
  `supplier_id` varchar(25) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO supplier VALUES("A Thay Lay","092344565766","Yangon","4000/A02");
INSERT INTO supplier VALUES("Bur Bu lay","092686868678","Mandalay","4000/B01");
INSERT INTO supplier VALUES("Kyi Sin","","","4000/K01");
INSERT INTO supplier VALUES("Soe Naing","09731936197","Nay Pyi Taw","4000/S01");



DROP TABLE tclmcstock;

CREATE TABLE `tclmcstock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `item_id` varchar(9) NOT NULL,
  `size` varchar(9) NOT NULL,
  `pcs` int(9) NOT NULL,
  `kg` float NOT NULL,
  `opening_mc` int(11) NOT NULL,
  `form10mc` int(11) NOT NULL,
  `transfer_to_where` varchar(11) NOT NULL,
  `transfer_mc` int(11) NOT NULL,
  `loading_no` int(11) NOT NULL,
  `loading_mc` int(11) NOT NULL,
  `grandtotal_mc` bigint(77) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO tclmcstock VALUES("9","2023-11-01","1000/K02","2up","21","30","0","20","HHK","10","31","10","0");



DROP TABLE total_charges;

CREATE TABLE `total_charges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `commondity_id` varchar(11) NOT NULL,
  `total_coldstore_charges` bigint(19) NOT NULL,
  `total_labour_charges` bigint(19) NOT NULL,
  `total_processing_charges` bigint(19) NOT NULL,
  `repacking_charges` bigint(19) NOT NULL,
  `ice_charges` bigint(19) NOT NULL,
  `ot_charges` bigint(22) NOT NULL,
  `total_charges` bigint(19) NOT NULL,
  `grand_total_charges` bigint(19) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` bigint(19) NOT NULL,
  `balance_amount` bigint(19) NOT NULL,
  `remark` bigint(19) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO total_charges VALUES("132","2023-11-05","1000/B01","810","360","10000","0","0","0","11170","11170","0000-00-00","0","11170","0");
INSERT INTO total_charges VALUES("133","2023-11-05","1000/B01","1620","720","20000","0","0","0","22340","33510","0000-00-00","0","33510","0");
INSERT INTO total_charges VALUES("134","2023-11-05","1000/B01","2430","1080","30000","0","0","0","33510","67020","0000-00-00","0","67020","0");
INSERT INTO total_charges VALUES("135","2023-11-05","1000/B01","3240","1440","40000","0","0","0","44680","111700","0000-00-00","0","111700","0");
INSERT INTO total_charges VALUES("136","2023-11-05","1000/F01","810","360","24300","0","0","0","25470","137170","0000-00-00","0","137170","0");
INSERT INTO total_charges VALUES("137","2023-11-05","1000/F01","1620","720","48600","0","0","0","50940","188110","0000-00-00","0","188110","0");
INSERT INTO total_charges VALUES("138","2023-11-05","1000/F01","2430","1080","72900","0","0","0","76410","264520","0000-00-00","0","264520","0");
INSERT INTO total_charges VALUES("139","2023-11-05","1000/F01","3240","1440","97200","0","0","0","101880","366400","0000-00-00","0","366400","0");
INSERT INTO total_charges VALUES("140","2023-11-03","3","1350","1800","211500","100","100","100","214950","581350","0000-00-00","0","581350","0");
INSERT INTO total_charges VALUES("141","0000-00-00","","0","0","0","0","0","0","0","0","2023-11-03","81350","500000","0");



DROP TABLE transaction;

CREATE TABLE `transaction` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `voucher_no` varchar(44) NOT NULL,
  `ac_code` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `debit` double NOT NULL,
  `credit` double NOT NULL,
  `currency` varchar(20) NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `container_no` varchar(25) NOT NULL,
  `bank_charges` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=335 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO transaction VALUES("329","2023-10-26","A0001","9100/P01","Diesel & Petrol STUPID THING","50000","0","usd","","","0");
INSERT INTO transaction VALUES("330","2023-10-26","A0001","3600/002","aslkdfjasldkfjlaskdfjalskdjlasdfx","0","50000","usd","","","0");
INSERT INTO transaction VALUES("333","2023-11-03","B001","3600/001","Sale ","300000","0","usd","","","0");
INSERT INTO transaction VALUES("334","2023-11-03","B001","3300/001","sale","0","300000","usd","uuoop","ac-321","0");



DROP TABLE truckactualinvoice;

CREATE TABLE `truckactualinvoice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(24) NOT NULL,
  `size` varchar(24) NOT NULL,
  `pcsperbox` bigint(20) NOT NULL,
  `kgperbox` float NOT NULL,
  `mc` bigint(20) NOT NULL,
  `netweight` float NOT NULL,
  `usd` float NOT NULL,
  `total_usd` float NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO truckactualinvoice VALUES("56","1000/H01","3up","21","30","50","1500","210","315000","MOP001");



DROP TABLE truckdeclare;

CREATE TABLE `truckdeclare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(24) NOT NULL,
  `size` varchar(24) NOT NULL,
  `pcsperbox` bigint(20) NOT NULL,
  `kgperbox` float NOT NULL,
  `mc` bigint(20) NOT NULL,
  `netweight` float NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO truckdeclare VALUES("46","1000/H01","3up","21","28","50","1400","MOP001");



DROP TABLE truckfoambox;

CREATE TABLE `truckfoambox` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(24) NOT NULL,
  `size` varchar(24) NOT NULL,
  `pcsperbox` bigint(20) NOT NULL,
  `kgperbox` float NOT NULL,
  `mc` bigint(20) NOT NULL,
  `netweight` float NOT NULL,
  `foambox_no` varchar(225) NOT NULL,
  `total_foambox_no` varchar(255) NOT NULL,
  `invoice_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO truckfoambox VALUES("50","1000/H01","3up","21","30","50","1500","1,2,3,4,5","5","MOP001");



DROP TABLE truckpackingliststock;

CREATE TABLE `truckpackingliststock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `invoice_no` varchar(11) NOT NULL,
  `truck_no` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO truckpackingliststock VALUES("7","2023-11-01","MOP001","31");



DROP TABLE truckpackingliststockinfo;

CREATE TABLE `truckpackingliststockinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `pcsperbox` int(11) NOT NULL,
  `kgperbox` float NOT NULL,
  `mc` int(11) NOT NULL,
  `netweight` float NOT NULL,
  `totalgrossweight` float NOT NULL,
  `invoice_no` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO truckpackingliststockinfo VALUES("57","1000/H01","3up","21","30","50","1500","3000","MOP001");



DROP TABLE truckpackingmaterial;

CREATE TABLE `truckpackingmaterial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `remark` varchar(255) NOT NULL,
  `ice` int(11) NOT NULL,
  `miscellous` bigint(17) NOT NULL,
  `tape` bigint(19) NOT NULL,
  `foam_box` bigint(19) NOT NULL,
  `plastic` bigint(19) NOT NULL,
  `total_charges` bigint(19) NOT NULL,
  `total_viss` bigint(19) NOT NULL,
  `form10kg` float NOT NULL,
  `costperkg` float NOT NULL,
  `invoice_no` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO truckpackingmaterial VALUES("16","2023-11-01","","495000","30000","273500","1925000","327750","3051250","0","8441","361.48","MOP001");



DROP TABLE trucktotalcosting;

CREATE TABLE `trucktotalcosting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `item_id` varchar(11) NOT NULL,
  `size` varchar(11) NOT NULL,
  `total_kg` float NOT NULL,
  `priceperviss` float NOT NULL,
  `priceperkg` float NOT NULL,
  `percentage` float NOT NULL,
  `packing_charges` int(11) NOT NULL,
  `ygntomt_charges` int(11) NOT NULL,
  `mttotechnck_charges` int(11) NOT NULL,
  `labour_charges` int(11) NOT NULL,
  `packingandtransport` int(11) NOT NULL,
  `total` float NOT NULL,
  `grand_total` float NOT NULL,
  `rate` int(11) NOT NULL,
  `costing_usd` float NOT NULL,
  `selling_rate` int(11) NOT NULL,
  `profitperkg` float NOT NULL,
  `original_cost` float NOT NULL,
  `selling_amount` float NOT NULL,
  `profit` float NOT NULL,
  `invoice_no` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO trucktotalcosting VALUES("43","0000-00-00","1000/H01","3up","30","35000","21419.8","22082.3","361","200000","200000","200000","600361","601361","623443","3000","207.814","210","2.186","6234.42","6300","65.58","MOP001");



DROP TABLE userlogs;

CREATE TABLE `userlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_time` time(6) NOT NULL,
  `login_date` date NOT NULL,
  `login_username` varchar(125) NOT NULL,
  `login_password` varchar(125) NOT NULL,
  `status` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO userlogs VALUES("73","09:24:09.000000","2023-10-25","admin","admin","Login Success");
INSERT INTO userlogs VALUES("74","01:09:50.000000","2023-10-25","admin","admin","Login Success");
INSERT INTO userlogs VALUES("75","02:51:07.000000","2023-10-25","admin","admin","Login Success");
INSERT INTO userlogs VALUES("76","06:01:42.000000","2023-10-25","admin","admin","Login Success");
INSERT INTO userlogs VALUES("77","08:49:25.000000","2023-10-25","admin","admin","Login Success");
INSERT INTO userlogs VALUES("78","08:49:55.000000","2023-10-25","admin","admin","Login Success");
INSERT INTO userlogs VALUES("79","09:05:07.000000","2023-10-26","admin","ADMIN","Login Password Invalid");
INSERT INTO userlogs VALUES("80","09:05:30.000000","2023-10-26","admin","admin","Login Success");
INSERT INTO userlogs VALUES("81","09:52:53.000000","2023-10-26","admin","admin","Login Success");
INSERT INTO userlogs VALUES("82","09:54:59.000000","2023-10-26","admin","admin","Login Success");
INSERT INTO userlogs VALUES("83","09:55:46.000000","2023-10-26","admin","admin","Login Success");
INSERT INTO userlogs VALUES("84","09:55:49.000000","2023-10-26","admin","admin","Login Success");
INSERT INTO userlogs VALUES("85","09:57:32.000000","2023-10-26","admin","admin","Login Success");
INSERT INTO userlogs VALUES("86","11:23:27.000000","2023-10-26","admin","admin","Login Success");
INSERT INTO userlogs VALUES("87","02:31:27.000000","2023-10-26","admin","admin","Login Success");
INSERT INTO userlogs VALUES("88","05:09:58.000000","2023-10-26","admin","admin","Login Success");
INSERT INTO userlogs VALUES("89","05:35:04.000000","2023-10-26","admin","admin","Login Success");
INSERT INTO userlogs VALUES("90","07:02:47.000000","2023-10-26","admin","admin","Login Success");
INSERT INTO userlogs VALUES("91","08:47:07.000000","2023-10-27","admin","admin","Login Success");
INSERT INTO userlogs VALUES("92","09:03:43.000000","2023-10-27","admin","admin","Login Success");
INSERT INTO userlogs VALUES("93","09:20:42.000000","2023-10-31","admin","admin","Login Success");
INSERT INTO userlogs VALUES("94","10:13:59.000000","2023-10-31","admin","admin","Login Success");
INSERT INTO userlogs VALUES("95","01:58:26.000000","2023-10-31","admin","admin","Login Success");
INSERT INTO userlogs VALUES("96","10:39:06.000000","2023-11-01","admin","admin","Login Success");
INSERT INTO userlogs VALUES("97","02:03:58.000000","2023-11-01","admin","admin","Login Success");
INSERT INTO userlogs VALUES("98","09:43:44.000000","2023-11-03","admin","admin","Login Success");
INSERT INTO userlogs VALUES("101","10:04:55.000000","2023-11-03","admin","","Logout Success");
INSERT INTO userlogs VALUES("102","10:04:58.000000","2023-11-03","admin","admin","Login Success");
INSERT INTO userlogs VALUES("103","02:44:44.000000","2023-11-03","admin","","Logout Success");
INSERT INTO userlogs VALUES("104","02:44:49.000000","2023-11-03","admin","admin","Login Success");
INSERT INTO userlogs VALUES("105","03:55:39.000000","2023-11-03","admin","","Logout Success");
INSERT INTO userlogs VALUES("106","03:55:44.000000","2023-11-03","Mg Mg","mgmg","Login Success");
INSERT INTO userlogs VALUES("107","03:55:58.000000","2023-11-03","Mg Mg","","Logout Success");
INSERT INTO userlogs VALUES("108","03:56:08.000000","2023-11-03","admin","admin","Login Success");
INSERT INTO userlogs VALUES("109","03:56:33.000000","2023-11-03","admin","","Logout Success");
INSERT INTO userlogs VALUES("110","03:56:39.000000","2023-11-03","Mg Mg","mgmg","Login Success");
INSERT INTO userlogs VALUES("111","03:56:55.000000","2023-11-03","Mg Mg","","Logout Success");
INSERT INTO userlogs VALUES("112","03:57:03.000000","2023-11-03","admin","admin","Login Success");



