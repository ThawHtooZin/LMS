DROP TABLE accounts;

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO accounts VALUES("18","admin","admin","admin@gmail.com","1");



DROP TABLE acname;

CREATE TABLE `acname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_no` varchar(19) NOT NULL,
  `ac_type` int(11) NOT NULL,
  `ac_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_no` (`code_no`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;




DROP TABLE actype;

CREATE TABLE `actype` (
  `acid` int(11) NOT NULL AUTO_INCREMENT,
  `ac_type` varchar(255) NOT NULL,
  PRIMARY KEY (`acid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;




DROP TABLE cashbook;

CREATE TABLE `cashbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `sr_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `ac_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `particular` text COLLATE utf8_unicode_ci NOT NULL,
  `debit` bigint(20) DEFAULT NULL,
  `credit` bigint(20) DEFAULT NULL,
  `balance` bigint(25) NOT NULL,
  `voucher_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=148 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO cashbook VALUES("146","2023-10-26","","3600/001","aslkdfjasldkfjlaskdfjalskdjlasdfx","0","50000","-50000","A0001");
INSERT INTO cashbook VALUES("147","2023-10-26","","3600/002","aslkdfjasldkfjlaskdfjalskdjlasdfx","0","50000","-50000","A0001");



DROP TABLE category;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` varchar(22) COLLATE utf8_unicode_ci NOT NULL,
  `category_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO category VALUES("8","1000/B01","Block");
INSERT INTO category VALUES("9","1000/F01","Fish");



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
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




DROP TABLE container;

CREATE TABLE `container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_no` int(11) NOT NULL,
  `country` varchar(20) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;




DROP TABLE currency;

CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dollar_rate` double NOT NULL,
  `debitorcredit` varchar(255) NOT NULL,
  `mmk_amount` bigint(25) NOT NULL,
  `usd_amount` bigint(25) NOT NULL,
  `voucher_no` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=316 DEFAULT CHARSET=utf8mb4;

INSERT INTO currency VALUES("314","5000","debit","50000","10","A0001");
INSERT INTO currency VALUES("315","5000","credit","50000","10","A0001");



DROP TABLE customers;

CREATE TABLE `customers` (
  `customer_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_phone` bigint(14) NOT NULL,
  `customer_address` text COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4;

INSERT INTO form10stock VALUES("70","2023-11-01","1000/H01","4000/A01","NY","frozen","4up","19","20","21","19","","0","","0","21","");
INSERT INTO form10stock VALUES("71","2023-11-01","1000/K02","4000/B01","DAKA","tcl","2up","25","20","351","21","20","4","","0","371","");
INSERT INTO form10stock VALUES("73","2023-11-02","1000/W01","4000/S01","DAKA","tcl","3up","22","21","400","19","1","3","","0","401","");



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
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4;

INSERT INTO form7stock VALUES("160","2023-11-01","1000/H01","4000/A01","NY","frozen","4up","210","343.14","","21","151");
INSERT INTO form7stock VALUES("161","2023-11-01","1000/H01","4000/S01","NY","frozen","3up","329","537.586","","19","152");
INSERT INTO form7stock VALUES("162","2023-11-01","1000/K02","4000/B01","DAKA","tcl","2up","215","351.31","","17","153");



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
) ENGINE=InnoDB AUTO_INCREMENT=698 DEFAULT CHARSET=utf8mb4;

INSERT INTO general_ledger VALUES("692","2023-10-26","A0001","9100/P01","50000","0","50000","Diesel & Petrol STUPID THING","","","0","25");
INSERT INTO general_ledger VALUES("693","2023-10-26","A0001","3600/M01","0","50000","-50000","aslkdfjasldkfjlaskdfjalskdjlasdfx","","","0","24");
INSERT INTO general_ledger VALUES("694","2023-10-26","A0001","9100/P01","50000","0","100000","Diesel & Petrol STUPID THING","","","0","25");
INSERT INTO general_ledger VALUES("695","2023-10-26","A0001","3600/001","0","50000","-50000","aslkdfjasldkfjlaskdfjalskdjlasdfx","","","0","24");
INSERT INTO general_ledger VALUES("696","2023-10-26","A0001","9100/P01","50000","0","150000","Diesel & Petrol STUPID THING","","","0","25");
INSERT INTO general_ledger VALUES("697","2023-10-26","A0001","3600/002","0","50000","-50000","aslkdfjasldkfjlaskdfjalskdjlasdfx","","","0","24");



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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;




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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4;




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
) ENGINE=InnoDB AUTO_INCREMENT=448 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcfishcoldstore VALUES("442","2023-10-30","import","100","100","900","900","3","2700","2700","");
INSERT INTO gfcfishcoldstore VALUES("443","2023-10-30","export","50","150","450","1350","3","0","0","");
INSERT INTO gfcfishcoldstore VALUES("444","2023-11-01","import","100","250","900","2250","3","6750","6750","");
INSERT INTO gfcfishcoldstore VALUES("446","2023-11-02","import","20","270","90","2340","1.5","3510","10260","");
INSERT INTO gfcfishcoldstore VALUES("447","2023-11-02","export","10","280","90","2430","1.5","0","0","");



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
) ENGINE=InnoDB AUTO_INCREMENT=343 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcfishlabour VALUES("337","2023-10-30","import","900","4","3600","3600","");
INSERT INTO gfcfishlabour VALUES("338","2023-10-30","export","450","4","1800","5400","");
INSERT INTO gfcfishlabour VALUES("339","2023-11-01","import","900","4","3600","3600","");
INSERT INTO gfcfishlabour VALUES("341","2023-11-02","import","90","4","360","3960","");
INSERT INTO gfcfishlabour VALUES("342","2023-11-02","export","90","4","360","4320","");



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
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4;




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
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;




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
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4;




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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4;

INSERT INTO hhkstock VALUES("54","2023-10-01","0000-00-00","1000/F01","100","100","900","900","900","0");
INSERT INTO hhkstock VALUES("66","2023-10-25","0000-00-00","1000/B01","100","100","800","800","800","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;




DROP TABLE item;

CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(22) COLLATE utf8_unicode_ci NOT NULL,
  `item_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
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
  `commondity_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `mc` int(11) NOT NULL,
  `total_mc` int(11) NOT NULL,
  `kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `total_kg` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `rate` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `charges` int(11) NOT NULL,
  `total_charges` bigint(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4;




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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;




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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;




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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;




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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;




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




DROP TABLE payable;

CREATE TABLE `payable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `supplier_id` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_voucher_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `purchase_amount` bigint(19) NOT NULL,
  `paid_date` date NOT NULL,
  `paid_voucher` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `remark` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `paid_amount` bigint(25) NOT NULL,
  `balance` bigint(25) NOT NULL,
  `link_id` int(11) NOT NULL,
  `closing_balance` int(11) NOT NULL,
  `report_date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=243 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO payable VALUES("239","2023-11-01","4000/A02","1882","630000","0000-00-00","","","0","630000","151","0","0000-00-00");
INSERT INTO payable VALUES("240","2023-11-01","4000/S01","8197","1118600","0000-00-00","","","0","1118600","152","0","0000-00-00");
INSERT INTO payable VALUES("241","2023-11-01","4000/k02","9603","860000","0000-00-00","","","0","860000","153","0","0000-00-00");
INSERT INTO payable VALUES("242","2023-11-01","4000/S01","571","1195000","0000-00-00","","","0","2313600","154","0","0000-00-00");



DROP TABLE permission;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO permission VALUES("1","1","manage_accounts,manage_role,manage_sale,manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transactionmanage_general_ledger,manage_customers,manage_supplier,manage_coldstoreitem,manage_item,manage_actype,manage_acname,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,manage_packingmaterial,purchase_report,payable_report");



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
) ENGINE=InnoDB AUTO_INCREMENT=139 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO purchase VALUES("151","2023-11-01","1882","4000/K01","frozen","1000/H01","4up","210","0","3000","630000");
INSERT INTO purchase VALUES("152","2023-11-01","8197","4000/S01","frozen","1000/H01","3up","329","0","3400","1118600");
INSERT INTO purchase VALUES("153","2023-11-01","9603","4000/B01","tcl","1000/K02","2up","215","0","4000","860000");
INSERT INTO purchase VALUES("154","2023-11-01","571","4000/S01","tcl","1000/W01","3up","239","0","5000","1195000");



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
) ENGINE=InnoDB AUTO_INCREMENT=231 DEFAULT CHARSET=utf8mb4;




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




DROP TABLE role;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO role VALUES("1","Admin");



DROP TABLE supplier;

CREATE TABLE `supplier` (
  `supplier_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4;




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
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb4;

INSERT INTO transaction VALUES("329","2023-10-26","A0001","9100/P01","Diesel & Petrol STUPID THING","50000","0","usd","","","0");
INSERT INTO transaction VALUES("330","2023-10-26","A0001","3600/002","aslkdfjasldkfjlaskdfjalskdjlasdfx","0","50000","usd","","","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4;

INSERT INTO truckactualinvoice VALUES("56","1000/K02","2up","21","20","25","500","0","0","MOP001");



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
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4;

INSERT INTO truckdeclare VALUES("46","1000/K02","2up","21","0","25","0","MOP001");



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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

INSERT INTO truckfoambox VALUES("50","1000/K02","2up","21","20","25","500","","","MOP001");



DROP TABLE truckpackingliststock;

CREATE TABLE `truckpackingliststock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `invoice_no` varchar(11) NOT NULL,
  `truck_no` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4;

INSERT INTO truckpackingliststockinfo VALUES("57","1000/K02","2up","21","20","25","500","1500","MOP001");



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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

INSERT INTO trucktotalcosting VALUES("43","0000-00-00","1000/K02","2up","20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");



DROP TABLE userlogs;

CREATE TABLE `userlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_time` time(6) NOT NULL,
  `login_date` date NOT NULL,
  `login_username` varchar(125) NOT NULL,
  `login_password` varchar(125) NOT NULL,
  `status` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO userlogs VALUES("98","02:11:30.000000","2023-11-02","admin","admin","Login Success");



