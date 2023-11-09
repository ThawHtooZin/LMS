DROP TABLE accounts;

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO accounts VALUES("18","admin","admin","admin@gmail.com","1");



DROP TABLE acname;

CREATE TABLE `acname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_no` varchar(255) NOT NULL,
  `ac_type` int(11) NOT NULL,
  `ac_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO acname VALUES("77","4000/T01","28","Thaing Gi");
INSERT INTO acname VALUES("78","4000/B01","28","Bo Bo Lwin");
INSERT INTO acname VALUES("79","4000/A01","28","Aung Aung ");
INSERT INTO acname VALUES("80","4000/K01","28","Kyi Sing");
INSERT INTO acname VALUES("81","4000/P01","28","Parti");
INSERT INTO acname VALUES("82","3300/001","29","USA");
INSERT INTO acname VALUES("83","3300/002","29","CANADA");
INSERT INTO acname VALUES("84","3300/003","29","DAKA");
INSERT INTO acname VALUES("85","3300/004","29","BRUNAI");
INSERT INTO acname VALUES("86","3300/005","29","JAPAN");
INSERT INTO acname VALUES("87","9100/000","31","Administration ");
INSERT INTO acname VALUES("88","9100/001","31","Staff Salary");
INSERT INTO acname VALUES("89","9100/002","31","Transportation");
INSERT INTO acname VALUES("90","9100/003","31","Diesel & Petrol ");
INSERT INTO acname VALUES("91","9100/004","31","Food & Refreshment");
INSERT INTO acname VALUES("92","3600/001","29","Main Cash");
INSERT INTO acname VALUES("93","5000/001","30","Revenue");



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
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO actype VALUES("28","Current Liability");
INSERT INTO actype VALUES("29","Current Asset");
INSERT INTO actype VALUES("30","Sale");
INSERT INTO actype VALUES("31","Expense");
INSERT INTO actype VALUES("32","Capital");
INSERT INTO actype VALUES("33","Long Term Liability");



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
) ENGINE=InnoDB AUTO_INCREMENT=146 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO cashbook VALUES("143","2023-11-09","","3600/001","asdfasdf","0","100000","-100000","A0001");
INSERT INTO cashbook VALUES("145","2023-11-09","","3600/001","GET PAID BABY","270000","0","170000","A0005");



DROP TABLE category;

CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` varchar(22) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO category VALUES("7","1","Fish");
INSERT INTO category VALUES("8","2","IQF");
INSERT INTO category VALUES("9","3","Block");
INSERT INTO category VALUES("10","4","Pujanut");



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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO coldstore VALUES("98","2023-11-01","2023-11-05","1","10","10","90","90","5","3","1350","1350");
INSERT INTO coldstore VALUES("99","2023-11-01","2023-11-05","2","10","10","90","90","5","3","1350","1350");
INSERT INTO coldstore VALUES("100","2023-11-01","2023-11-05","1","15","25","135","225","5","3","2025","3375");
INSERT INTO coldstore VALUES("101","2023-11-01","2023-11-05","1","50","75","450","675","5","3","6750","10125");



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
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO currency VALUES("311","0","debit","100000","0","A0001");
INSERT INTO currency VALUES("312","0","credit","100000","0","A0001");
INSERT INTO currency VALUES("313","3000","debit","300000","100","A0002");
INSERT INTO currency VALUES("314","3000","credit","300000","100","A0002");
INSERT INTO currency VALUES("317","3000","debit","300000","100","A0005");
INSERT INTO currency VALUES("318","3000","credit","300000","100","A0005");



DROP TABLE customers;

CREATE TABLE `customers` (
  `customer_id` varchar(100) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_phone` bigint(14) NOT NULL,
  `customer_address` text NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO customers VALUES("3300/001","USA","0","");
INSERT INTO customers VALUES("3300/002","CANADA","0","");
INSERT INTO customers VALUES("3300/003","DAKA","0","");
INSERT INTO customers VALUES("3300/004","BRUNAI","0","");
INSERT INTO customers VALUES("3300/005","JAPAN","0","");



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
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO form10stock VALUES("70","2023-11-09","1","4000/A01","DAKA","tcl","2up","100","100","900","100","","0","","0","900","");
INSERT INTO form10stock VALUES("71","2023-11-09","2","4000/A01","DAKA","tcl","4up","100","100","900","100","","0","","0","900","");
INSERT INTO form10stock VALUES("72","2023-11-01","1","4000/P01","NY","frozen","2up","19","20","60","18","3","1","","0","63","");
INSERT INTO form10stock VALUES("73","2023-11-01","1","4000/P01","NY","frozen","1up","5","20","120","5","","0","","0","120","");
INSERT INTO form10stock VALUES("74","2023-11-01","1","4000/P01","NY","frozen","3up","4","6","12","4","","0","","0","12","");



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
) ENGINE=InnoDB AUTO_INCREMENT=170 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO form7stock VALUES("161","2023-11-01","3","4000/T01","NY","frozen","2up","100","163.4","","50","152");
INSERT INTO form7stock VALUES("162","2023-11-01","2","4000/T01","","frozen","3up","100","163.4","","0","153");
INSERT INTO form7stock VALUES("163","2023-11-01","4","4000/T01","","frozen","4up","50","81.7","","0","154");
INSERT INTO form7stock VALUES("164","2023-11-01","5","4000/P01","","frozen","2up","50","81.7","","0","155");
INSERT INTO form7stock VALUES("165","2023-11-01","1","4000/P01","NY","frozen","2up","100","163.4","","10","156");
INSERT INTO form7stock VALUES("166","0000-00-00","3","4000/T01","NY","frozen","3up","","","","11","152");
INSERT INTO form7stock VALUES("167","0000-00-00","3","4000/T01","NY","frozen","4up","","","","11","152");
INSERT INTO form7stock VALUES("168","0000-00-00","1","4000/P01","NY","frozen","1up","","","","5","156");
INSERT INTO form7stock VALUES("169","0000-00-00","1","4000/P01","NY","frozen","3up","","","","2","156");



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
) ENGINE=InnoDB AUTO_INCREMENT=700 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO general_ledger VALUES("688","2023-11-09","1284","4000/A01","0","100000","-100000","","","","0","0");
INSERT INTO general_ledger VALUES("689","2023-11-09","4381","4000/A01","0","100000","-100000","","","","0","0");
INSERT INTO general_ledger VALUES("690","2023-11-01","178","4000/T01","0","250000","-350000","","","","0","0");
INSERT INTO general_ledger VALUES("691","2023-11-01","2581","4000/P01","0","200000","-550000","","","","0","0");
INSERT INTO general_ledger VALUES("692","2023-11-09","A0001","4000/P01","100000","0","-450000","IDK","","","0","28");
INSERT INTO general_ledger VALUES("693","2023-11-09","A0001","3600/001","0","100000","-100000","asdfasdf","","","0","29");
INSERT INTO general_ledger VALUES("694","2023-11-09","A0002","3300/001","300000","0","300000","SALEE","uuoop","ac-321","0","29");
INSERT INTO general_ledger VALUES("695","2023-11-09","A0002","5000/001","0","300000","-300000","SALEE","","","0","30");
INSERT INTO general_ledger VALUES("698","2023-11-09","A0005","3600/001","270000","0","170000","GET PAID BABY","","","10","29");
INSERT INTO general_ledger VALUES("699","2023-11-09","A0005","3300/001","0","300000","0","PAID U ","hehe","ac-323","0","29");



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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=395 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO gfcfishcoldstore VALUES("392","2023-10-31","import","100","100","900","900","1.5","1350","1350","");
INSERT INTO gfcfishcoldstore VALUES("394","2023-11-01","balance","0","100","","900","1.5","1350","2700","");



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
) ENGINE=InnoDB AUTO_INCREMENT=292 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO gfcfishlabour VALUES("291","2023-10-31","import","900","3","2700","2700","");



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
  `remark` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO hhkstock VALUES("25","2023-11-01","0000-00-00","1","100","100","900","900","900","0");
INSERT INTO hhkstock VALUES("26","2023-11-01","0000-00-00","2","200","200","1800","1800","900","0");
INSERT INTO hhkstock VALUES("34","0000-00-00","2023-11-05","1","10","90","90","810","90","98");
INSERT INTO hhkstock VALUES("35","0000-00-00","2023-11-05","2","10","190","90","1710","-810","99");
INSERT INTO hhkstock VALUES("36","0000-00-00","2023-11-05","1","15","75","135","675","-630","100");
INSERT INTO hhkstock VALUES("37","0000-00-00","2023-11-05","1","50","25","450","225","-810","101");



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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO item VALUES("14","1","Hilsa");
INSERT INTO item VALUES("15","2","D Puti");
INSERT INTO item VALUES("16","3","Rohu");
INSERT INTO item VALUES("17","4","Koral");
INSERT INTO item VALUES("18","5","Baby Koral");
INSERT INTO item VALUES("19","6","Puti");



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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO labour VALUES("98","2023-11-01","2023-11-05","1","10","10","90","90","4","360","360");
INSERT INTO labour VALUES("99","2023-11-01","2023-11-05","2","10","10","90","90","4","360","360");
INSERT INTO labour VALUES("100","2023-11-01","2023-11-05","1","15","25","135","225","4","540","900");
INSERT INTO labour VALUES("101","2023-11-01","2023-11-05","1","50","75","450","675","4","1800","2700");



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
) ENGINE=InnoDB AUTO_INCREMENT=246 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO payable VALUES("240","2023-11-01","4000/T01","178","100000","0000-00-00","","","0","100000","152","0","0000-00-00");
INSERT INTO payable VALUES("241","2023-11-01","4000/T01","178","50000","0000-00-00","","","0","150000","153","0","0000-00-00");
INSERT INTO payable VALUES("242","2023-11-01","4000/T01","178","100000","0000-00-00","","","0","250000","154","0","0000-00-00");
INSERT INTO payable VALUES("243","2023-11-01","4000/P01","2581","100000","0000-00-00","","","0","100000","155","0","0000-00-00");
INSERT INTO payable VALUES("244","2023-11-01","4000/P01","2581","100000","0000-00-00","","","0","200000","156","0","0000-00-00");
INSERT INTO payable VALUES("245","0000-00-00","4000/P01","","0","2023-11-09","A0001","IDK","100000","100000","0","0","0000-00-00");



DROP TABLE permission;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO permission VALUES("1","1","manage_accounts,manage_role,manage_sale,manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transactionmanage_general_ledger,manage_customers,manage_supplier,manage_coldstoreitem,manage_item,manage_actype,manage_acname,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,manage_packingmaterial,purchase_report,payable_report");



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
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO processing VALUES("98","2023-11-01","2023-11-05","1","10","10","90","90","270","24300","24300");
INSERT INTO processing VALUES("99","2023-11-01","2023-11-05","2","10","10","90","90","470","42300","42300");
INSERT INTO processing VALUES("100","2023-11-01","2023-11-05","1","15","25","135","225","270","36450","60750");
INSERT INTO processing VALUES("101","2023-11-01","2023-11-05","1","50","75","450","675","270","121500","182250");



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
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO purchase VALUES("152","2023-11-01","178","4000/T01","frozen","3","2up","100","0","1000","100000");
INSERT INTO purchase VALUES("153","2023-11-01","178","4000/T01","frozen","2","3up","100","0","500","50000");
INSERT INTO purchase VALUES("154","2023-11-01","178","4000/T01","frozen","4","4up","50","0","2000","100000");
INSERT INTO purchase VALUES("155","2023-11-01","2581","4000/P01","frozen","5","2up","50","0","2000","100000");
INSERT INTO purchase VALUES("156","2023-11-01","2581","4000/P01","frozen","1","2up","100","0","1000","100000");



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
) ENGINE=InnoDB AUTO_INCREMENT=238 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO receivable VALUES("231","2023-11-09","3300/001","uuoop","ac-321","100","0000-00-00","","","0","100");
INSERT INTO receivable VALUES("235","2023-11-09","3300/001","uuoop","ac-321","100","0000-00-00","","","0","100");
INSERT INTO receivable VALUES("236","0000-00-00","3300/001","","","","2023-11-09","A0005","PAID U ","100","0");
INSERT INTO receivable VALUES("237","0000-00-00","3300/001","","","","2023-11-09","A0005","PAID U ","100","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO role VALUES("1","Admin");



DROP TABLE supplier;

CREATE TABLE `supplier` (
  `supplier_name` varchar(255) NOT NULL,
  `supplier_phone` varchar(255) NOT NULL,
  `supplier_address` varchar(255) NOT NULL,
  `supplier_id` varchar(25) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO supplier VALUES("Aung Aung ","","","4000/A01");
INSERT INTO supplier VALUES("Bo Bo Lwin","","","4000/B01");
INSERT INTO supplier VALUES("Kyi Sing","","","4000/K01");
INSERT INTO supplier VALUES("Parti","","","4000/P01");
INSERT INTO supplier VALUES("Thaing Gi","","","4000/T01");



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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
  `ot_charges` bigint(22) NOT NULL,
  `total_charges` bigint(19) NOT NULL,
  `grand_total_charges` bigint(19) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` bigint(19) NOT NULL,
  `balance_amount` bigint(19) NOT NULL,
  `remark` bigint(19) NOT NULL,
  `link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO total_charges VALUES("80","2023-11-05","1","1350","360","24300","0","0","0","26010","26010","0000-00-00","0","26010","0","98");
INSERT INTO total_charges VALUES("81","2023-11-05","2","1350","360","42300","0","0","0","44010","70020","0000-00-00","0","70020","0","99");
INSERT INTO total_charges VALUES("82","2023-11-05","1","2025","540","36450","0","0","0","39015","109035","0000-00-00","0","109035","0","100");
INSERT INTO total_charges VALUES("83","2023-11-05","1","6750","1800","121500","0","0","0","130050","239085","0000-00-00","0","239085","0","101");



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
) ENGINE=InnoDB AUTO_INCREMENT=334 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO transaction VALUES("326","2023-11-09","A0001","4000/P01","IDK","100000","0","mmk","","","0");
INSERT INTO transaction VALUES("327","2023-11-09","A0001","3600/001","asdfasdf","0","100000","mmk","","","0");
INSERT INTO transaction VALUES("328","2023-11-09","A0002","3300/001","SALEE","300000","0","usd","uuoop","ac-321","0");
INSERT INTO transaction VALUES("329","2023-11-09","A0002","5000/001","SALEE","0","300000","usd","","","0");
INSERT INTO transaction VALUES("332","2023-11-09","A0005","3600/001","GET PAID BABY","300000","0","usd","","","10");
INSERT INTO transaction VALUES("333","2023-11-09","A0005","3300/001","PAID U ","0","300000","usd","hehe","ac-323","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO truckactualinvoice VALUES("43","1","2up","10","90","10","900","0","0","MOP001");
INSERT INTO truckactualinvoice VALUES("44","1","3up","10","90","100","9000","0","0","MOP001");
INSERT INTO truckactualinvoice VALUES("45","1","2up","10","90","100","9000","0","0","MOP001");
INSERT INTO truckactualinvoice VALUES("46","1","3up","10","10","100","1000","0","0","MOP001");
INSERT INTO truckactualinvoice VALUES("47","1","2up","10","10","90","900","0","0","MOP001");
INSERT INTO truckactualinvoice VALUES("48","2","2up","10","10","10","100","0","0","MOP001");
INSERT INTO truckactualinvoice VALUES("49","1","2up","10","10","100","1000","0","0","MOP001");
INSERT INTO truckactualinvoice VALUES("50","1","3up","10","10","100","1000","0","0","MOP001");
INSERT INTO truckactualinvoice VALUES("51","2","3up","10","10","100","1000","0","0","MOP001");
INSERT INTO truckactualinvoice VALUES("52","2","2up","10","10","100","1000","0","0","MOP001");
INSERT INTO truckactualinvoice VALUES("53","2","3up","10","10","100","1000","0","0","MOP001");
INSERT INTO truckactualinvoice VALUES("54","1","4up","10","10","100","1000","0","0","MOP001");
INSERT INTO truckactualinvoice VALUES("55","2","4up","10","10","100","1000","0","0","MOP001");



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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO truckdeclare VALUES("33","1","2up","10","0","10","0","MOP001");
INSERT INTO truckdeclare VALUES("34","1","3up","10","0","100","0","MOP001");
INSERT INTO truckdeclare VALUES("35","1","2up","10","0","100","0","MOP001");
INSERT INTO truckdeclare VALUES("36","1","3up","10","0","100","0","MOP001");
INSERT INTO truckdeclare VALUES("37","1","2up","10","0","90","0","MOP001");
INSERT INTO truckdeclare VALUES("38","2","2up","10","0","10","0","MOP001");
INSERT INTO truckdeclare VALUES("39","1","2up","10","0","100","0","MOP001");
INSERT INTO truckdeclare VALUES("40","1","3up","10","0","100","0","MOP001");
INSERT INTO truckdeclare VALUES("41","2","3up","10","0","100","0","MOP001");
INSERT INTO truckdeclare VALUES("42","2","2up","10","0","100","0","MOP001");
INSERT INTO truckdeclare VALUES("43","2","3up","10","0","100","0","MOP001");
INSERT INTO truckdeclare VALUES("44","1","4up","10","0","100","0","MOP001");
INSERT INTO truckdeclare VALUES("45","2","4up","10","0","100","0","MOP001");



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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO truckfoambox VALUES("37","1","2up","10","90","10","900","","","MOP001");
INSERT INTO truckfoambox VALUES("38","1","3up","10","90","100","9000","","","MOP001");
INSERT INTO truckfoambox VALUES("39","1","2up","10","90","100","9000","","","MOP001");
INSERT INTO truckfoambox VALUES("40","1","3up","10","10","100","1000","","","MOP001");
INSERT INTO truckfoambox VALUES("41","1","2up","10","10","90","900","","","MOP001");
INSERT INTO truckfoambox VALUES("42","2","2up","10","10","10","100","","","MOP001");
INSERT INTO truckfoambox VALUES("43","1","2up","10","10","100","1000","","","MOP001");
INSERT INTO truckfoambox VALUES("44","1","3up","10","10","100","1000","","","MOP001");
INSERT INTO truckfoambox VALUES("45","2","3up","10","10","100","1000","","","MOP001");
INSERT INTO truckfoambox VALUES("46","2","2up","10","10","100","1000","","","MOP001");
INSERT INTO truckfoambox VALUES("47","2","3up","10","10","100","1000","","","MOP001");
INSERT INTO truckfoambox VALUES("48","1","4up","10","10","100","1000","","","MOP001");
INSERT INTO truckfoambox VALUES("49","2","4up","10","10","100","1000","","","MOP001");



DROP TABLE truckpackingliststock;

CREATE TABLE `truckpackingliststock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `invoice_no` varchar(11) NOT NULL,
  `truck_no` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO truckpackingliststock VALUES("7","2023-11-09","MOP001","31");



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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO truckpackingliststockinfo VALUES("44","1","2up","10","90","10","900","600","MOP001");
INSERT INTO truckpackingliststockinfo VALUES("45","1","3up","10","90","100","9000","6000","MOP001");
INSERT INTO truckpackingliststockinfo VALUES("46","1","2up","10","90","100","9000","6000","MOP001");
INSERT INTO truckpackingliststockinfo VALUES("47","1","3up","10","10","100","1000","6000","MOP001");
INSERT INTO truckpackingliststockinfo VALUES("48","1","2up","10","10","90","900","5400","MOP001");
INSERT INTO truckpackingliststockinfo VALUES("49","2","2up","10","10","10","100","600","MOP001");
INSERT INTO truckpackingliststockinfo VALUES("50","1","2up","10","10","100","1000","6000","MOP001");
INSERT INTO truckpackingliststockinfo VALUES("51","1","3up","10","10","100","1000","6000","MOP001");
INSERT INTO truckpackingliststockinfo VALUES("52","2","3up","10","10","100","1000","6000","MOP001");
INSERT INTO truckpackingliststockinfo VALUES("53","2","2up","10","10","100","1000","6000","MOP001");
INSERT INTO truckpackingliststockinfo VALUES("54","2","3up","10","10","100","1000","6000","MOP001");
INSERT INTO truckpackingliststockinfo VALUES("55","1","4up","10","10","100","1000","6000","MOP001");
INSERT INTO truckpackingliststockinfo VALUES("56","2","4up","10","10","100","1000","6000","MOP001");



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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;




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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO trucktotalcosting VALUES("30","0000-00-00","1","2up","90","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");
INSERT INTO trucktotalcosting VALUES("31","0000-00-00","1","3up","90","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");
INSERT INTO trucktotalcosting VALUES("32","0000-00-00","1","2up","90","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");
INSERT INTO trucktotalcosting VALUES("33","0000-00-00","1","3up","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");
INSERT INTO trucktotalcosting VALUES("34","0000-00-00","1","2up","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");
INSERT INTO trucktotalcosting VALUES("35","0000-00-00","2","2up","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");
INSERT INTO trucktotalcosting VALUES("36","0000-00-00","1","2up","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");
INSERT INTO trucktotalcosting VALUES("37","0000-00-00","1","3up","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");
INSERT INTO trucktotalcosting VALUES("38","0000-00-00","2","3up","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");
INSERT INTO trucktotalcosting VALUES("39","0000-00-00","2","2up","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");
INSERT INTO trucktotalcosting VALUES("40","0000-00-00","2","3up","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");
INSERT INTO trucktotalcosting VALUES("41","0000-00-00","1","4up","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");
INSERT INTO trucktotalcosting VALUES("42","0000-00-00","2","4up","10","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","MOP001");



DROP TABLE userlogs;

CREATE TABLE `userlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_time` time(6) NOT NULL,
  `login_date` date NOT NULL,
  `login_username` varchar(125) NOT NULL,
  `login_password` varchar(125) NOT NULL,
  `status` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

INSERT INTO userlogs VALUES("73","10:25:28.000000","2023-11-09","admin","admin","Login Success");
INSERT INTO userlogs VALUES("74","10:44:09.000000","2023-11-09","admin","admin","Login Success");
INSERT INTO userlogs VALUES("75","10:49:53.000000","2023-11-09","admin","admin","Login Success");
INSERT INTO userlogs VALUES("76","12:10:03.000000","2023-11-09","admin","admin","Login Success");
INSERT INTO userlogs VALUES("77","12:14:41.000000","2023-11-09","admin","admin","Login Success");



