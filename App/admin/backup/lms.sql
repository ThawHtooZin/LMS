DROP TABLE accounts;

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO accounts VALUES("18","admin","admin","admin@gmail.com","1");
INSERT INTO accounts VALUES("20","Stock Control Person","scp","scp@gmail.com","2");
INSERT INTO accounts VALUES("21","Myat Thu","myatthu","mt@gmail.com","3");



DROP TABLE acname;

CREATE TABLE `acname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_no` varchar(255) NOT NULL,
  `ac_type` int(11) NOT NULL,
  `ac_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4;

INSERT INTO acname VALUES("10","FA-001","13","Car");
INSERT INTO acname VALUES("11","FA-002","13","Building");
INSERT INTO acname VALUES("12","FA-003","13","Furniture");
INSERT INTO acname VALUES("13","CA-001","11","Account Receivable ");
INSERT INTO acname VALUES("14","CA-002","11","Main Cash");
INSERT INTO acname VALUES("15","CA-003","11","AYA Bank");
INSERT INTO acname VALUES("16","CA-004","11","KBZ Bank");
INSERT INTO acname VALUES("17","CA-005","11","CB Bank");
INSERT INTO acname VALUES("18","CA-006","11","YOMA Bank");
INSERT INTO acname VALUES("19","C-001","14","Share");
INSERT INTO acname VALUES("20","C-002","14","Retain Earning");
INSERT INTO acname VALUES("21","CL-001","16","Account Payable");
INSERT INTO acname VALUES("22","R-001","10","Cash Sale");
INSERT INTO acname VALUES("23","R-002","10","Credit Sale");
INSERT INTO acname VALUES("24","OI-001","18","Rental Income");
INSERT INTO acname VALUES("25","OI-002","18","Bank Interest");
INSERT INTO acname VALUES("26","ADM-001","9","Administration");
INSERT INTO acname VALUES("27","EP-002","9","Selling and Distribution");
INSERT INTO acname VALUES("28","EP-003","9","Advertising and Marketting");
INSERT INTO acname VALUES("29","EP-004","9","Operating");
INSERT INTO acname VALUES("30","EP-005","9","Petrol");



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

INSERT INTO actualinvoice VALUES("11","HG184","2up","20","10","200","1.6","320","1");
INSERT INTO actualinvoice VALUES("12","HG184","3up","15","10","150","1.5","225","1");
INSERT INTO actualinvoice VALUES("13","HL123","3up","20","10","200","2.00","400","3");
INSERT INTO actualinvoice VALUES("14","UT216","2up","20","10","200","","","3");
INSERT INTO actualinvoice VALUES("15","HL123","2up","21","5","105","0","0","3");
INSERT INTO actualinvoice VALUES("16","HL123","3up","21","5","105","0","0","3");
INSERT INTO actualinvoice VALUES("17","HL123","3up","4","5","20","","","3");



DROP TABLE actype;

CREATE TABLE `actype` (
  `acid` int(11) NOT NULL AUTO_INCREMENT,
  `ac_type` varchar(255) NOT NULL,
  PRIMARY KEY (`acid`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

INSERT INTO actype VALUES("9","expanse");
INSERT INTO actype VALUES("10","Sale");
INSERT INTO actype VALUES("11","Current_Asset");
INSERT INTO actype VALUES("13","Fixed_Asset");
INSERT INTO actype VALUES("14","Capital");
INSERT INTO actype VALUES("15","Long_Term_Liability");
INSERT INTO actype VALUES("16","Current_Liability");
INSERT INTO actype VALUES("17","Cost_Of_Good_Sold");
INSERT INTO actype VALUES("18","Other_Income");



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

INSERT INTO bankdetail VALUES("2","1","HMS GLOBAL PTE LTD","111 North Bridge Road, #08-26A Peninsula Plaza, Singapore 179098","2.85","USD Current  Account","United Overseas Bank Ltd (UOB) , Singapore","UOVBSGSG","1 Coleman Street , #01-14 the Adelphi, Singapore 179803","Coleman Branch");
INSERT INTO bankdetail VALUES("3","3","HMS GLOBAL PTE LTD","111 North Bridge Road, #08-26A Peninsula Plaza, Singapore 179098","2.85","USD Current  Account","United Overseas Bank Ltd (UOB) , Singapore","UOVBSGSG","1 Coleman Street , #01-14 the Adelphi, Singapore 179803","");



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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO coldstore VALUES("79","2023-09-05","2023-09-10","4","50","50","140","140","6","4","3360","3360");
INSERT INTO coldstore VALUES("81","2023-09-02","2023-09-06","4","100","150","150","290","5","4","3000","6360");
INSERT INTO coldstore VALUES("82","2023-09-04","2023-09-07","4","50","200","150","440","4","4","2400","8760");
INSERT INTO coldstore VALUES("83","2023-09-01","2023-09-05","4","50","250","150","590","5","4","3000","11760");
INSERT INTO coldstore VALUES("84","2023-09-02","2023-09-06","4","100","350","300","890","5","4","6000","17760");
INSERT INTO coldstore VALUES("85","2023-09-02","2023-09-16","4","100","450","300","1190","15","1.5","4500","22260");
INSERT INTO coldstore VALUES("88","2023-09-16","2023-09-20","12","50","50","150","150","4","1.5","600","600");
INSERT INTO coldstore VALUES("89","2023-09-16","2023-09-20","12","50","100","150","300","5","1.5","750","1350");



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



DROP TABLE currency;

CREATE TABLE `currency` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dollar_rate` double NOT NULL,
  `debitorcredit` varchar(255) NOT NULL,
  `mmk_amount` bigint(25) NOT NULL,
  `usd_amount` bigint(25) NOT NULL,
  `voucher_no` varchar(36) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb4;

INSERT INTO currency VALUES("168","3000","credit","300000","100","AS264");
INSERT INTO currency VALUES("173","0","credit","50000","0","AS264");
INSERT INTO currency VALUES("180","3000","debit","600000","200","AS266");
INSERT INTO currency VALUES("181","3000","credit","600000","200","AS266");
INSERT INTO currency VALUES("182","0","debit","30000","0","BS0001");
INSERT INTO currency VALUES("183","0","credit","30000","0","BS0001");
INSERT INTO currency VALUES("184","3000","debit","150000000","50000","BS0002");
INSERT INTO currency VALUES("185","3000","credit","150000000","50000","BS0002");
INSERT INTO currency VALUES("188","3000","debit","300000","100","AS262");
INSERT INTO currency VALUES("189","3000","credit","150000","50","AS262");
INSERT INTO currency VALUES("190","0","debit","100000","0","AS23");
INSERT INTO currency VALUES("191","0","credit","100000","0","AS23");
INSERT INTO currency VALUES("194","3000","debit","300000","100","AS262");
INSERT INTO currency VALUES("195","3000","credit","150000","50","AS262");
INSERT INTO currency VALUES("198","3000","debit","300000","100","AS261");
INSERT INTO currency VALUES("199","3000","credit","300000","100","AS261");
INSERT INTO currency VALUES("200","3000","debit","300000","100","AS261");
INSERT INTO currency VALUES("201","3000","credit","300000","100","AS261");
INSERT INTO currency VALUES("202","3000","debit","300000","100","AS262");
INSERT INTO currency VALUES("203","3000","debit","300000","100","AS262");
INSERT INTO currency VALUES("204","3000","debit","300000","100","AS262");
INSERT INTO currency VALUES("205","3000","credit","300000","100","AS262");
INSERT INTO currency VALUES("206","3000","debit","300000","100","AS262");
INSERT INTO currency VALUES("212","0","debit","50000","0","AS261");
INSERT INTO currency VALUES("213","0","credit","50000","0","AS261");
INSERT INTO currency VALUES("214","3000","debit","300000","100","AS262");
INSERT INTO currency VALUES("215","3000","credit","300000","100","AS262");
INSERT INTO currency VALUES("219","3000","debit","300000","100","AS263");
INSERT INTO currency VALUES("220","3000","credit","300000","100","AS263");



DROP TABLE customers;

CREATE TABLE `customers` (
  `customer_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_phone` bigint(14) NOT NULL,
  `customer_address` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO customers VALUES("B133","U KoKo","92341546","mandalay");
INSERT INTO customers VALUES("M3333","MomboJumbo","344544","NY");
INSERT INTO customers VALUES("w12121","Mr.LPO","97854234","DAKA");



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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8mb4;




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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8mb4;

INSERT INTO form7stock VALUES("105","2023-10-10","KO962","KJ122","","frozen","3up","230","375.82","","0","94");



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
) ENGINE=InnoDB AUTO_INCREMENT=242 DEFAULT CHARSET=utf8mb4;

INSERT INTO general_ledger VALUES("236","2023-10-12","AS261","ep-005","50000","0","0","","","","0","9");
INSERT INTO general_ledger VALUES("237","2023-10-12","AS261","ca-002","0","50000","0","hubhhhjggshffdghjgfjgf","","","0","11");
INSERT INTO general_ledger VALUES("238","2023-10-12","AS262","ca-001","300000","0","0","hubhhhjggshffdghjgfjgf","SGRWFGR","US-23523","0","11");
INSERT INTO general_ledger VALUES("239","2023-10-12","AS262","r-002","0","300000","0","hubhhhjggshffdghjgfjgf","","","0","10");
INSERT INTO general_ledger VALUES("240","2023-10-12","AS263","ca-002","300000","0","0","asdfasdfasdf","","","50","11");
INSERT INTO general_ledger VALUES("241","2023-10-12","AS263","ca-001","0","300000","0","asdfasdfasdf","SGRWFGR","US-23523","0","11");



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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcdryfishcoldstore VALUES("38","2023-09-01","balance","","0","","0","0");
INSERT INTO gfcdryfishcoldstore VALUES("40","2023-09-01","import","300","300","1.6","480","480");
INSERT INTO gfcdryfishcoldstore VALUES("41","2023-09-01","export","150","150","1.6","0","0");
INSERT INTO gfcdryfishcoldstore VALUES("42","2023-09-01","takeout","40","110","1.6","0","0");
INSERT INTO gfcdryfishcoldstore VALUES("43","2023-09-01","takeout","10","100","1.6","0","0");
INSERT INTO gfcdryfishcoldstore VALUES("45","2023-09-02","import","300","400","1.6","640","1120");
INSERT INTO gfcdryfishcoldstore VALUES("46","2023-09-03","export","100","300","1.6","640","1760");
INSERT INTO gfcdryfishcoldstore VALUES("49","2023-09-04","takeout","130","170","1.6","0","0");
INSERT INTO gfcdryfishcoldstore VALUES("50","2023-09-04","takeout","20","150","1.6","480","2240");
INSERT INTO gfcdryfishcoldstore VALUES("51","2023-09-05","export","100","50","1.6","240","2480");



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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcdryfishlabour VALUES("28","2023-09-01","import","300","4","1200","1200");
INSERT INTO gfcdryfishlabour VALUES("29","2023-09-01","export","150","4","600","1800");
INSERT INTO gfcdryfishlabour VALUES("30","2023-09-01","takeout","40","4","160","1960");
INSERT INTO gfcdryfishlabour VALUES("32","2023-09-02","import","300","4","1200","3160");
INSERT INTO gfcdryfishlabour VALUES("33","2023-09-03","export","100","3","300","3460");
INSERT INTO gfcdryfishlabour VALUES("35","2023-09-04","takeout","130","4","520","3980");
INSERT INTO gfcdryfishlabour VALUES("36","2023-09-05","export","100","4","400","4380");



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
) ENGINE=InnoDB AUTO_INCREMENT=392 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcfishcoldstore VALUES("382","2023-09-01","balance","0","0","","0","","0","0");
INSERT INTO gfcfishcoldstore VALUES("383","2023-09-01","import","100","100","300","300","1.5","450","450");
INSERT INTO gfcfishcoldstore VALUES("384","2023-09-02","export","50","50","150","150","1.5","450","900");
INSERT INTO gfcfishcoldstore VALUES("385","2023-09-03","import","200","250","600","750","1.5","1125","2025");
INSERT INTO gfcfishcoldstore VALUES("386","2023-09-03","takeout","100","150","250","500","1.5","0","0");
INSERT INTO gfcfishcoldstore VALUES("387","2023-09-03","takeout","0","150","50","450","1.5","0","0");
INSERT INTO gfcfishcoldstore VALUES("388","2023-09-04","export","50","100","150","300","1.5","675","2700");
INSERT INTO gfcfishcoldstore VALUES("389","2023-09-05","takeout","50","50","150","150","1.5","450","3150");
INSERT INTO gfcfishcoldstore VALUES("390","2023-09-06","import","100","150","300","450","1.5","675","3825");
INSERT INTO gfcfishcoldstore VALUES("391","2023-09-06","export","50","100","150","300","1.5","0","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=291 DEFAULT CHARSET=utf8mb4;

INSERT INTO gfcfishlabour VALUES("283","2023-09-01","import","300","3","900","900");
INSERT INTO gfcfishlabour VALUES("284","2023-09-02","export","150","3","450","1350");
INSERT INTO gfcfishlabour VALUES("285","2023-09-03","import","600","3","1800","3150");
INSERT INTO gfcfishlabour VALUES("286","2023-09-03","takeout","250","3","750","3900");
INSERT INTO gfcfishlabour VALUES("287","2023-09-04","export","150","3","450","4350");
INSERT INTO gfcfishlabour VALUES("288","2023-09-05","takeout","150","3","450","4800");
INSERT INTO gfcfishlabour VALUES("289","2023-09-06","import","300","3","900","5700");
INSERT INTO gfcfishlabour VALUES("290","2023-09-06","export","150","3","450","6150");



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

INSERT INTO gfcmcstock VALUES("29","NY","HHK To GFC","2023-09-20","KO962","3up","21","5","5");
INSERT INTO gfcmcstock VALUES("30","NY","HHK To GFC","2023-09-20","KO962","2up","22","2","2");
INSERT INTO gfcmcstock VALUES("31","NY","Ship/78","2023-09-20","KO962","3up","21","5","0");



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

INSERT INTO hhkmcstock VALUES("143","NY","From From-10","2023-09-17","KO962","2up","21","5","5");
INSERT INTO hhkmcstock VALUES("144","NY","From From-10","2023-09-17","KO962","2up","22","3","3");
INSERT INTO hhkmcstock VALUES("145","NY","From From-10","2023-09-17","KO962","3up","21","10","10");
INSERT INTO hhkmcstock VALUES("146","NY","From From-10","2023-09-17","KO962","3up","22","200","200");
INSERT INTO hhkmcstock VALUES("147","NY","HHK To GFC","2023-09-20","KO962","3up","21","5","5");
INSERT INTO hhkmcstock VALUES("148","NY","HHK To GFC","2023-09-20","KO962","2up","22","2","1");
INSERT INTO hhkmcstock VALUES("149","Can","From From-10","2023-09-19","MR163","2up","150","5","5");
INSERT INTO hhkmcstock VALUES("150","DAKA","From TCL","2023-09-20","SB263","2up","327","14","14");



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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4;

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
INSERT INTO hhkstock VALUES("18","0000-00-00","2023-09-16","4","100","100","300","300","750");
INSERT INTO hhkstock VALUES("19","0000-00-00","0000-00-00","4","100","200","300","600","1350");
INSERT INTO hhkstock VALUES("20","2023-09-16","0000-00-00","12","100","100","300","300","300");
INSERT INTO hhkstock VALUES("22","0000-00-00","0000-00-00","12","50","50","150","150","150");
INSERT INTO hhkstock VALUES("23","0000-00-00","2023-09-20","12","50","0","150","0","150");
INSERT INTO hhkstock VALUES("24","0000-00-00","2023-09-20","12","50","-50","150","-150","300");



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

INSERT INTO invoice_costing VALUES("1","HG184","2up","20","1100","673.1946144","4.5","699.92","0.233","0.3","0.04","0.3","0.3","0.2","1.373","1.5","30","0.127","2.54","27.46","1");
INSERT INTO invoice_costing VALUES("2","HG184","3up","15","1200","734.3941248","-3.5","756.02","0.252","0.3","0.04","0.3","0.3","0.2","1.392","1.6","24","0.208","3.12","20.88","1");
INSERT INTO invoice_costing VALUES("3","HL123","3up","20","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","3");
INSERT INTO invoice_costing VALUES("4","UT216","2up","20","","","","","","","","","","","","","","","","","3");
INSERT INTO invoice_costing VALUES("5","HL123","2up","21","1100","1797.4","4.5","1720","0.573333333","0.3","0.04","0.3","0.3","0.2","1.713333333","2","42","0.286666667","6.020000007","35.98","3");
INSERT INTO invoice_costing VALUES("6","HL123","3up","21","","","","","","","","","","","","","","","","","3");
INSERT INTO invoice_costing VALUES("7","HL123","3up","4","","","","","","","","","","","","","","","","","3");



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
INSERT INTO item VALUES("KO962","4","Koral");
INSERT INTO item VALUES("MR163","4","Mrigal");
INSERT INTO item VALUES("OJ247","4","Puti");
INSERT INTO item VALUES("SB263","4","Star-Baim");
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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO labour VALUES("79","2023-09-05","2023-09-10","4","50","50","140","140","5","700","700");
INSERT INTO labour VALUES("81","2023-09-02","2023-09-06","4","100","150","150","290","5","750","1450");
INSERT INTO labour VALUES("82","2023-09-04","2023-09-07","4","50","200","150","440","5","750","2200");
INSERT INTO labour VALUES("83","2023-09-01","2023-09-05","4","50","250","150","590","5","750","2950");
INSERT INTO labour VALUES("84","2023-09-02","2023-09-06","4","100","350","300","890","5","1500","4450");
INSERT INTO labour VALUES("85","2023-09-02","2023-09-16","4","100","450","300","1190","3","900","5350");
INSERT INTO labour VALUES("88","2023-09-16","2023-09-20","12","50","50","150","150","3","450","450");
INSERT INTO labour VALUES("89","2023-09-16","2023-09-20","12","50","100","150","300","3","450","900");



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

INSERT INTO msl_total_charges VALUES("67","0000-00-00","BJ123","4800","36000","600","0","0","41400","41400","0000-00-00","0","41400","0");
INSERT INTO msl_total_charges VALUES("76","0000-00-00","HL123","1050","16800","280","0","0","18130","59530","0000-00-00","0","59530","0");
INSERT INTO msl_total_charges VALUES("77","0000-00-00","UT216","2250","36000","600","0","50000","88850","148380","0000-00-00","0","148380","0");
INSERT INTO msl_total_charges VALUES("78","0000-00-00","","0","0","0","0","0","0","0","2023-09-07","48380","100000","0");
INSERT INTO msl_total_charges VALUES("79","0000-00-00","MR163","1200","72000","1200","0","0","74400","174400","0000-00-00","0","174400","0");
INSERT INTO msl_total_charges VALUES("80","0000-00-00","MR163","2000","192000","3200","0","0","197200","371600","0000-00-00","0","371600","0");



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

INSERT INTO mslcoldstore VALUES("87","2023-09-02","2023-09-06","BJ123","50","50","150","150","4","3","1800","1800");
INSERT INTO mslcoldstore VALUES("101","2023-09-01","2023-09-06","HL123","20","20","60","60","5","3","900","900");
INSERT INTO mslcoldstore VALUES("102","2023-09-01","0000-00-00","HL123","30","50","10","70","5","3","150","1050");
INSERT INTO mslcoldstore VALUES("103","2023-09-01","2023-09-06","UT216","50","50","150","150","5","3","2250","2250");
INSERT INTO mslcoldstore VALUES("104","2023-09-16","2023-09-20","MR163","100","100","300","300","4","1.5","1200","1200");
INSERT INTO mslcoldstore VALUES("105","2023-09-17","2023-09-20","MR163","200","300","500","800","4","1.5","2000","2000");



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

INSERT INTO mslexportcharges VALUES("87","2023-09-02","2023-09-06","BJ123","50","50","150","150","4","600","600");
INSERT INTO mslexportcharges VALUES("101","2023-09-01","2023-09-06","HL123","20","20","60","60","4","240","240");
INSERT INTO mslexportcharges VALUES("102","2023-09-01","0000-00-00","HL123","30","50","10","60","70","40","280");
INSERT INTO mslexportcharges VALUES("103","2023-09-01","2023-09-06","UT216","50","50","150","150","4","600","600");
INSERT INTO mslexportcharges VALUES("104","2023-09-16","2023-09-20","MR163","100","100","300","300","4","1200","1200");
INSERT INTO mslexportcharges VALUES("105","2023-09-17","2023-09-20","MR163","200","300","500","800","4","2000","3200");



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

INSERT INTO mslfreezing VALUES("87","2023-09-02","2023-09-06","BJ123","50","50","150","150","240","36000","36000");
INSERT INTO mslfreezing VALUES("101","2023-09-01","2023-09-06","HL123","20","20","60","60","240","14400","14400");
INSERT INTO mslfreezing VALUES("102","2023-09-01","0000-00-00","HL123","30","50","10","60","70","2400","16800");
INSERT INTO mslfreezing VALUES("103","2023-09-01","2023-09-06","UT216","50","50","150","150","240","36000","36000");
INSERT INTO mslfreezing VALUES("104","2023-09-16","2023-09-20","MR163","100","100","300","300","240","72000","72000");
INSERT INTO mslfreezing VALUES("105","2023-09-17","2023-09-20","MR163","200","300","500","800","240","120000","192000");



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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4;

INSERT INTO mslstock VALUES("21","2023-09-01","0000-00-00","BJ123","100","100","300","300","300");
INSERT INTO mslstock VALUES("24","0000-00-00","2023-09-06","BJ123","50","50","150","150","150");
INSERT INTO mslstock VALUES("27","2023-09-01","0000-00-00","HL123","100","100","300","300","300");
INSERT INTO mslstock VALUES("28","2023-09-01","0000-00-00","UT216","150","150","450","450","450");
INSERT INTO mslstock VALUES("35","0000-00-00","2023-09-06","HL123","20","80","60","240","60");
INSERT INTO mslstock VALUES("36","0000-00-00","2023-09-06","UT216","50","100","150","300","");
INSERT INTO mslstock VALUES("37","2023-09-16","0000-00-00","MR163","100","100","300","300","300");
INSERT INTO mslstock VALUES("38","2023-09-17","0000-00-00","MR163","200","300","600","900","1200");
INSERT INTO mslstock VALUES("39","0000-00-00","2023-09-20","MR163","100","200","300","600","");
INSERT INTO mslstock VALUES("40","0000-00-00","2023-09-20","MR163","200","0","500","100","");



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

INSERT INTO packingliststock VALUES("1","2023-09-01","M3333","NY","975B2","BF747","","","");
INSERT INTO packingliststock VALUES("3","2023-09-08","B133","NY","975T2","LJ734","","","");



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

INSERT INTO packingliststockinfo VALUES("18","HG184","2up","20","10","200","210","","","1");
INSERT INTO packingliststockinfo VALUES("19","HG184","3up","15","10","150","160","","","1");
INSERT INTO packingliststockinfo VALUES("20","HL123","3up","20","10","200","210","","","3");
INSERT INTO packingliststockinfo VALUES("21","UT216","2up","20","10","200","210","","","3");
INSERT INTO packingliststockinfo VALUES("22","HL123","2up","21","5","105","110","","","3");
INSERT INTO packingliststockinfo VALUES("23","HL123","3up","21","5","105","110","","","3");
INSERT INTO packingliststockinfo VALUES("24","HL123","3up","4","5","20","25","","","3");



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
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO payable VALUES("133","KJ122","1438","230000","0000-00-00","","0","9802678","94");



DROP TABLE permission;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO permission VALUES("1","1","manage_accounts,manage_role,manage_sale,manage_purchase,manage_cashbook,manage_accountpayable,manage_accountreceivable,manage_transactionmanage_general_ledgermanage_ledger_record,manage_customers,manage_supplier,manage_category,manage_item,manage_actype,manage_acname,manage_unit,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,manage_packingmaterial,sale_report,purchase_report");
INSERT INTO permission VALUES("2","2",",manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport");
INSERT INTO permission VALUES("3","3","manage_accounts,manage_sale,manage_purchase,manage_cashbook,manage_accountpayable,manage_accountreceivablemanage_general_ledger,manage_customers");



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
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO processing VALUES("79","2023-09-05","2023-09-10","4","50","50","140","140","270","37800","37800");
INSERT INTO processing VALUES("81","2023-09-02","2023-09-06","4","100","150","150","290","270","40500","78300");
INSERT INTO processing VALUES("82","2023-09-04","2023-09-07","4","50","200","150","440","470","70500","148800");
INSERT INTO processing VALUES("83","2023-09-01","2023-09-05","4","50","250","150","590","270","40500","189300");
INSERT INTO processing VALUES("84","2023-09-02","2023-09-06","4","100","350","300","890","350","105000","294300");
INSERT INTO processing VALUES("85","2023-09-02","2023-09-16","4","100","450","300","1190","270","81000","375300");
INSERT INTO processing VALUES("88","2023-09-16","2023-09-20","12","50","50","150","150","","300000","300000");
INSERT INTO processing VALUES("89","2023-09-16","2023-09-20","12","50","100","150","300","","300000","600000");



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
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO purchase VALUES("91","2023-09-10","9493","AT263","frozen","KO962","3up","185.35","0","1000","185350");
INSERT INTO purchase VALUES("92","2023-09-11","52","AT268","frozen","BJ123","3up","150","0","1000","150000");
INSERT INTO purchase VALUES("93","2023-09-19","422","MK1625","tcl","SB263","2up","209.4","0","1000","209400");
INSERT INTO purchase VALUES("94","2023-10-10","1438","KJ122","frozen","KO962","3up","230","0","1000","230000");



DROP TABLE receivable;

CREATE TABLE `receivable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `container_no` varchar(25) NOT NULL,
  `invoice_amount` varchar(25) NOT NULL,
  `paid_date` date NOT NULL,
  `payment_no` varchar(25) NOT NULL,
  `particulars` varchar(255) NOT NULL,
  `paid_amount` int(11) NOT NULL,
  `balance` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8mb4;

INSERT INTO receivable VALUES("128","2023-10-12","SGRWFGR","US-23523","100","0000-00-00","","","0","100");
INSERT INTO receivable VALUES("129","2023-10-12","SGRWFGR","US-23523","100","0000-00-00","","","0","200");
INSERT INTO receivable VALUES("130","2023-10-12","SGRWFGR","US-23523","100","0000-00-00","","","0","300");
INSERT INTO receivable VALUES("131","2023-10-12","SGRWFGR","US-23523","100","0000-00-00","","","0","400");
INSERT INTO receivable VALUES("132","2023-10-12","SGRWFGR","US-23523","100","0000-00-00","","","0","500");



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




DROP TABLE role;

CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

INSERT INTO role VALUES("1","Admin");
INSERT INTO role VALUES("2","Stock");
INSERT INTO role VALUES("3","Purchase");



DROP TABLE supplier;

CREATE TABLE `supplier` (
  `supplier_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO supplier VALUES("AT263","A Thay Lay","09523423234","Yangon");
INSERT INTO supplier VALUES("MK1625","Market","","Kyi Myin Taing");
INSERT INTO supplier VALUES("AT268","Aung Htike","0953245678","Yangon");
INSERT INTO supplier VALUES("DK123","Naung Naung","09345235235","yangon");
INSERT INTO supplier VALUES("NS123","Tun Naing","09128787987","Mandalay");
INSERT INTO supplier VALUES("KJ122","Soe Naing","09987856461","Yangon");



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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

INSERT INTO tclmcstock VALUES("2","2023-09-19","SB263","2up","89","327","0","14","HHK","14","0","0","0");
INSERT INTO tclmcstock VALUES("4","2023-09-19","SB263","3up","89","327","0","15","","0","31","15","0");
INSERT INTO tclmcstock VALUES("5","2023-09-19","SB263","2up","90","372","0","20","","0","22","20","0");
INSERT INTO tclmcstock VALUES("6","2023-09-19","SB263","4up","84","150","0","15","","0","23","15","0");
INSERT INTO tclmcstock VALUES("7","2023-09-20","SB263","5up","89","327","0","15","","0","35","15","0");
INSERT INTO tclmcstock VALUES("8","2023-09-20","SB263","9up","100","400","0","50","HHK","25","36","25","0");



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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8mb4;

INSERT INTO total_charges VALUES("71","0000-00-00","12","600","450","300000","0","0","0","301050","301050","0000-00-00","0","301050","0");
INSERT INTO total_charges VALUES("72","0000-00-00","12","1350","900","600000","0","0","0","602250","903300","0000-00-00","0","903300","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=226 DEFAULT CHARSET=utf8mb4;

INSERT INTO transaction VALUES("217","2023-10-12","AS261","ep-005","","50000","0","mmk","","","0");
INSERT INTO transaction VALUES("218","2023-10-12","AS261","ca-002","hubhhhjggshffdghjgfjgf","0","50000","mmk","","","0");
INSERT INTO transaction VALUES("219","2023-10-12","AS262","ca-001","hubhhhjggshffdghjgfjgf","300000","0","usd","SGRWFGR","US-23523","0");
INSERT INTO transaction VALUES("220","2023-10-12","AS262","r-002","hubhhhjggshffdghjgfjgf","0","300000","usd","","","0");
INSERT INTO transaction VALUES("224","2023-10-12","AS263","ca-002","asdfasdfasdf","300000","0","usd","","","50");
INSERT INTO transaction VALUES("225","2023-10-12","AS263","ca-001","asdfasdfasdf","0","300000","usd","SGRWFGR","US-23523","0");



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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4;

INSERT INTO truckactualinvoice VALUES("28","MR163","2up","12","49","15","735","0","0","SH473");
INSERT INTO truckactualinvoice VALUES("29","MR163","3up","10","44","15","660","0","0","SH473");
INSERT INTO truckactualinvoice VALUES("30","MR163","2up","13","46","17","782","0","0","SH473");
INSERT INTO truckactualinvoice VALUES("31","MR163","3up","6","41","30","1230","0","0","SH473");
INSERT INTO truckactualinvoice VALUES("33","MR163","3up","23","47","25","1175","0","0","SH473");
INSERT INTO truckactualinvoice VALUES("34","MR163","2up","16","47","22","1034","0","0","SH473");
INSERT INTO truckactualinvoice VALUES("35","MR163","5up","22","46","27","1242","0","0","SH473");
INSERT INTO truckactualinvoice VALUES("36","KO962","2up","12","47","23","1081","0","0","SH473");
INSERT INTO truckactualinvoice VALUES("39","MR163","2up","29","49","39","1911","0","0","GW573");
INSERT INTO truckactualinvoice VALUES("40","MR163","3up","21","48","40","1920","0","0","GW573");
INSERT INTO truckactualinvoice VALUES("41","MR163","2up","24","47","32","1504","0","0","GW573");
INSERT INTO truckactualinvoice VALUES("42","KO962","2up","22","47","30","1410","0","0","GW573");



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
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4;

INSERT INTO truckdeclare VALUES("18","MR163","2up","12","0","15","0","SH473");
INSERT INTO truckdeclare VALUES("19","MR163","3up","10","0","15","0","SH473");
INSERT INTO truckdeclare VALUES("20","MR163","2up","13","0","17","0","SH473");
INSERT INTO truckdeclare VALUES("21","MR163","3up","6","0","30","0","SH473");
INSERT INTO truckdeclare VALUES("23","MR163","3up","23","0","25","0","SH473");
INSERT INTO truckdeclare VALUES("24","MR163","2up","16","0","22","0","SH473");
INSERT INTO truckdeclare VALUES("25","MR163","5up","22","0","27","0","SH473");
INSERT INTO truckdeclare VALUES("26","KO962","2up","12","0","23","0","SH473");
INSERT INTO truckdeclare VALUES("29","MR163","2up","29","0","39","0","GW573");
INSERT INTO truckdeclare VALUES("30","MR163","3up","21","0","40","0","GW573");
INSERT INTO truckdeclare VALUES("31","MR163","2up","24","0","32","0","GW573");
INSERT INTO truckdeclare VALUES("32","KO962","2up","22","0","30","0","GW573");



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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4;

INSERT INTO truckfoambox VALUES("22","MR163","2up","12","49","15","735","1,2,3,4,5","5","SH473");
INSERT INTO truckfoambox VALUES("23","MR163","3up","10","44","15","660","","","SH473");
INSERT INTO truckfoambox VALUES("24","MR163","2up","13","46","17","782","","","SH473");
INSERT INTO truckfoambox VALUES("25","MR163","3up","6","41","30","1230","","","SH473");
INSERT INTO truckfoambox VALUES("27","MR163","3up","23","47","25","1175","","","SH473");
INSERT INTO truckfoambox VALUES("28","MR163","2up","16","47","22","1034","","","SH473");
INSERT INTO truckfoambox VALUES("29","MR163","5up","22","46","27","1242","","","SH473");
INSERT INTO truckfoambox VALUES("30","KO962","2up","12","47","23","1081","","","SH473");
INSERT INTO truckfoambox VALUES("33","MR163","2up","29","49","39","1911","","","GW573");
INSERT INTO truckfoambox VALUES("34","MR163","3up","21","48","40","1920","","","GW573");
INSERT INTO truckfoambox VALUES("35","MR163","2up","24","47","32","1504","","","GW573");
INSERT INTO truckfoambox VALUES("36","KO962","2up","22","47","30","1410","","","GW573");



DROP TABLE truckpackingliststock;

CREATE TABLE `truckpackingliststock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `invoice_no` varchar(11) NOT NULL,
  `truck_no` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

INSERT INTO truckpackingliststock VALUES("5","2023-09-01","SH473","31");
INSERT INTO truckpackingliststock VALUES("6","2023-09-02","GW573","32");



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
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

INSERT INTO truckpackingliststockinfo VALUES("29","MR163","2up","12","49","15","735","900","SH473");
INSERT INTO truckpackingliststockinfo VALUES("30","MR163","3up","10","44","15","660","900","SH473");
INSERT INTO truckpackingliststockinfo VALUES("31","MR163","2up","13","46","17","782","1020","SH473");
INSERT INTO truckpackingliststockinfo VALUES("32","MR163","3up","6","41","30","1230","1800","SH473");
INSERT INTO truckpackingliststockinfo VALUES("34","MR163","3up","23","47","25","1175","1500","SH473");
INSERT INTO truckpackingliststockinfo VALUES("35","MR163","2up","16","47","22","1034","1320","SH473");
INSERT INTO truckpackingliststockinfo VALUES("36","MR163","5up","22","46","27","1242","1620","SH473");
INSERT INTO truckpackingliststockinfo VALUES("37","KO962","2up","12","47","23","1081","1380","SH473");
INSERT INTO truckpackingliststockinfo VALUES("40","MR163","2up","29","49","39","1911","2340","GW573");
INSERT INTO truckpackingliststockinfo VALUES("41","MR163","3up","21","48","40","1920","2400","GW573");
INSERT INTO truckpackingliststockinfo VALUES("42","MR163","2up","24","47","32","1504","1920","GW573");
INSERT INTO truckpackingliststockinfo VALUES("43","KO962","2up","22","47","30","1410","1800","GW573");



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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

INSERT INTO truckpackingmaterial VALUES("15","2023-09-01","Hilsa Marical","495000","30000","273500","1925000","327750","3051250","0","8441","361.48","SH473");



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
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4;

INSERT INTO trucktotalcosting VALUES("15","0000-00-00","MR163","2up","49","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","SH473");
INSERT INTO trucktotalcosting VALUES("16","0000-00-00","MR163","3up","44","1100","673.195","686.933","362","8992","7133","100","16587","0","0","0","0","0","0","0","0","0","SH473");
INSERT INTO trucktotalcosting VALUES("17","0000-00-00","MR163","2up","46","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","SH473");
INSERT INTO trucktotalcosting VALUES("18","0000-00-00","MR163","3up","41","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","SH473");
INSERT INTO trucktotalcosting VALUES("20","0000-00-00","MR163","3up","47","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","SH473");
INSERT INTO trucktotalcosting VALUES("21","0000-00-00","MR163","2up","47","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","SH473");
INSERT INTO trucktotalcosting VALUES("22","0000-00-00","MR163","5up","46","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","SH473");
INSERT INTO trucktotalcosting VALUES("23","0000-00-00","KO962","2up","47","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","SH473");
INSERT INTO trucktotalcosting VALUES("26","0000-00-00","MR163","2up","49","1100","673.195","686.933","362","395","313","100","1170","0","0","0","0","0","0","0","0","0","GW573");
INSERT INTO trucktotalcosting VALUES("27","0000-00-00","MR163","3up","48","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","GW573");
INSERT INTO trucktotalcosting VALUES("28","0000-00-00","MR163","2up","47","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","GW573");
INSERT INTO trucktotalcosting VALUES("29","0000-00-00","KO962","2up","47","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","0","GW573");



DROP TABLE userlogs;

CREATE TABLE `userlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_time` time(6) NOT NULL,
  `login_date` date NOT NULL,
  `login_username` varchar(125) NOT NULL,
  `login_password` varchar(125) NOT NULL,
  `status` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

INSERT INTO userlogs VALUES("1","10:26:18.000000","2023-09-18","admin","admin","Login Success");
INSERT INTO userlogs VALUES("2","10:31:25.000000","2023-09-18","admin","admin","Login Success");
INSERT INTO userlogs VALUES("3","09:34:51.000000","2023-09-19","admin","admin","Login Success");
INSERT INTO userlogs VALUES("4","05:49:07.000000","2023-09-19","admin","","Logout");
INSERT INTO userlogs VALUES("5","10:19:14.000000","2023-09-19","admin","admin","Login Success");
INSERT INTO userlogs VALUES("6","05:49:31.000000","2023-09-19","admin","","Logout");
INSERT INTO userlogs VALUES("7","10:19:36.000000","2023-09-19","asdf","yyyy","Login Failed");
INSERT INTO userlogs VALUES("8","10:19:39.000000","2023-09-19","admin","admin","Login Success");
INSERT INTO userlogs VALUES("9","10:10:48.000000","2023-09-20","admin","admin","Login Success");
INSERT INTO userlogs VALUES("10","11:03:45.000000","2023-09-21","admin","admin","Login Success");
INSERT INTO userlogs VALUES("11","11:03:47.000000","2023-09-21","admin","admin","Login Success");
INSERT INTO userlogs VALUES("12","11:20:31.000000","2023-09-21","admin","admin","Login Success");
INSERT INTO userlogs VALUES("13","11:21:06.000000","2023-09-21","admin","admin","Login Success");
INSERT INTO userlogs VALUES("14","11:27:45.000000","2023-09-21","ADMIN","ADMIN","Login Password Invalid");
INSERT INTO userlogs VALUES("15","11:27:53.000000","2023-09-21","admin","admin","Login Success");
INSERT INTO userlogs VALUES("16","10:47:33.000000","2023-09-22","admin","admin","Login Success");
INSERT INTO userlogs VALUES("17","10:51:57.000000","2023-09-22","sdamin","admin","Login Failed");
INSERT INTO userlogs VALUES("18","10:52:01.000000","2023-09-22","admin","admin","Login Success");
INSERT INTO userlogs VALUES("19","10:52:45.000000","2023-09-22","admin","admin","Login Success");
INSERT INTO userlogs VALUES("20","10:55:31.000000","2023-09-22","admin","admin","Login Success");
INSERT INTO userlogs VALUES("21","09:24:47.000000","2023-09-23","admin","admin","Login Success");
INSERT INTO userlogs VALUES("22","10:33:14.000000","2023-09-25","admin","admin","Login Success");
INSERT INTO userlogs VALUES("23","10:04:05.000000","2023-09-26","admin","admin","Login Success");
INSERT INTO userlogs VALUES("24","10:31:52.000000","2023-09-27","admin","admin","Login Success");
INSERT INTO userlogs VALUES("25","06:07:40.000000","2023-09-27","admin","admin","Login Success");
INSERT INTO userlogs VALUES("26","10:05:20.000000","2023-09-28","admin","admin","Login Success");
INSERT INTO userlogs VALUES("27","03:53:51.000000","2023-10-03","admin","admin","Login Success");
INSERT INTO userlogs VALUES("28","04:16:27.000000","2023-10-03","admin","admin","Login Success");
INSERT INTO userlogs VALUES("29","06:03:09.000000","2023-10-03","admin","admin","Login Success");
INSERT INTO userlogs VALUES("30","11:02:48.000000","2023-10-04","admin","admin","Login Success");
INSERT INTO userlogs VALUES("31","02:09:44.000000","2023-10-05","admin","admin","Login Success");
INSERT INTO userlogs VALUES("32","10:11:56.000000","2023-10-05","admin","admin","Login Success");
INSERT INTO userlogs VALUES("33","09:34:52.000000","2023-10-06","admin","admin","Login Success");
INSERT INTO userlogs VALUES("34","06:24:13.000000","2023-10-06","admin","admin","Login Success");
INSERT INTO userlogs VALUES("35","11:08:11.000000","2023-10-07","admin","admin","Login Success");
INSERT INTO userlogs VALUES("36","11:54:45.000000","2023-10-07","Myat Thu","mt","Login Failed");
INSERT INTO userlogs VALUES("37","11:54:53.000000","2023-10-07","Myat Thu","myatthu","Login Failed");
INSERT INTO userlogs VALUES("38","11:55:02.000000","2023-10-07","Myat Thu","myatthu","Login Failed");
INSERT INTO userlogs VALUES("39","11:55:08.000000","2023-10-07","admin","admin","Login Success");
INSERT INTO userlogs VALUES("40","11:56:23.000000","2023-10-07","Myat Thu","myatthu","Login Success");
INSERT INTO userlogs VALUES("41","11:56:37.000000","2023-10-07","Myat Thu","myatthu","Login Success");
INSERT INTO userlogs VALUES("42","11:58:28.000000","2023-10-07","admin","admin","Login Success");
INSERT INTO userlogs VALUES("43","11:31:45.000000","2023-10-09","admin","admin","Login Success");
INSERT INTO userlogs VALUES("44","03:35:06.000000","2023-10-09","admin","admin","Login Success");
INSERT INTO userlogs VALUES("45","03:50:17.000000","2023-10-09","admin","admin","Login Success");
INSERT INTO userlogs VALUES("46","06:27:31.000000","2023-10-09","admin","admin","Login Success");
INSERT INTO userlogs VALUES("47","06:32:04.000000","2023-10-09","admin","admin","Login Success");
INSERT INTO userlogs VALUES("48","10:52:06.000000","2023-10-10","admin","admin","Login Success");
INSERT INTO userlogs VALUES("49","06:36:10.000000","2023-10-10","admin","admin","Login Success");
INSERT INTO userlogs VALUES("50","09:04:38.000000","2023-10-11","admin","admin","Login Success");
INSERT INTO userlogs VALUES("51","11:58:11.000000","2023-10-11","admin","admin","Login Success");
INSERT INTO userlogs VALUES("52","09:33:13.000000","2023-10-12","admin","admin","Login Success");



