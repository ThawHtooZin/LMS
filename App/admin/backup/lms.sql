DROP TABLE accounts;

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO accounts VALUES("18","admin","admin","admin@gmail.com","1");
INSERT INTO accounts VALUES("20","Stock Control Person","scp","scp@gmail.com","2");
INSERT INTO accounts VALUES("21","Myat Thu","myatthu","mt@gmail.com","3");
INSERT INTO accounts VALUES("22","account","account","account@gmail.com","4");



DROP TABLE acname;

CREATE TABLE `acname` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code_no` varchar(255) NOT NULL,
  `ac_type` int(11) NOT NULL,
  `ac_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4;

INSERT INTO acname VALUES("10","FA-001","13","Car");
INSERT INTO acname VALUES("11","FA-002","13","Building");
INSERT INTO acname VALUES("12","FA-003","13","Furniture");
INSERT INTO acname VALUES("13","3300/000","11","Account Receivable ");
INSERT INTO acname VALUES("14","3600/001","11","Main Cash ( Ks )");
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
INSERT INTO acname VALUES("26","9100/000","9","Administration");
INSERT INTO acname VALUES("27","EP-002","9","Selling and Distribution");
INSERT INTO acname VALUES("28","EP-003","9","Advertising and Marketting");
INSERT INTO acname VALUES("29","EP-004","9","Operating");
INSERT INTO acname VALUES("30","9100/003","9","Diesel & Petrol");
INSERT INTO acname VALUES("36","3300/M01","21","MomboJumbo");
INSERT INTO acname VALUES("37","3600/002","11","Main Cash ( usd )");
INSERT INTO acname VALUES("38","9100/001","9","Staff Salary");
INSERT INTO acname VALUES("39","9100/002","9","Transportation");
INSERT INTO acname VALUES("40","9100/004","9","Food & Refreshment");
INSERT INTO acname VALUES("41","1200/000","16","Purchase");
INSERT INTO acname VALUES("54","4000/A01","16","A Thay Lay");
INSERT INTO acname VALUES("55","4000/B01","16","Bar Bu Lay");
INSERT INTO acname VALUES("56","4000/P01","16","Poe Zaw");
INSERT INTO acname VALUES("57","4000/P02","16","Phyo Lay");
INSERT INTO acname VALUES("58","4000/S01","16","Soe Naing");
INSERT INTO acname VALUES("59","4000/S02","16","Soe Thain");
INSERT INTO acname VALUES("60","4000/S03","16","Soe Myint");
INSERT INTO acname VALUES("61","4000/T01","16","Tun Naing");
INSERT INTO acname VALUES("62","4000/T02","16","Thaung Htun");
INSERT INTO acname VALUES("63","4000/T03","16","Thar Hla");
INSERT INTO acname VALUES("64","4000/K01","16","Ko Myo ");
INSERT INTO acname VALUES("65","4000/K02","16","Kyi Sin");
INSERT INTO acname VALUES("66","3300/001","11","USA");
INSERT INTO acname VALUES("67","3300/002","11","Canada");



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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;

INSERT INTO actype VALUES("9","Expanse");
INSERT INTO actype VALUES("10","Sale");
INSERT INTO actype VALUES("11","Current_Asset");
INSERT INTO actype VALUES("13","Fixed_Asset");
INSERT INTO actype VALUES("14","Capital");
INSERT INTO actype VALUES("15","Long_Term_Liability");
INSERT INTO actype VALUES("16","Current_Liability");
INSERT INTO actype VALUES("17","Cost_Of_Good_Sold");
INSERT INTO actype VALUES("18","Other_Income");
INSERT INTO actype VALUES("21","Customer");



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
  `sr_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `ac_name` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  `particular` text COLLATE utf8_unicode_ci NOT NULL,
  `debit` bigint(20) DEFAULT NULL,
  `credit` bigint(20) DEFAULT NULL,
  `balance` bigint(25) NOT NULL,
  `voucher_no` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO cashbook VALUES("120","2023-10-18","","3600/001","Spend Stuff","0","40000","-40000","AS265");



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
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8mb4;

INSERT INTO currency VALUES("293","0","debit","40000","0","AS265");
INSERT INTO currency VALUES("294","0","credit","40000","0","AS265");



DROP TABLE customers;

CREATE TABLE `customers` (
  `customer_id` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `customer_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `customer_phone` bigint(14) NOT NULL,
  `customer_address` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO customers VALUES("3300/001","USA","0","NY");
INSERT INTO customers VALUES("3300/002","Canada","0","");



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
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=utf8mb4;

INSERT INTO form7stock VALUES("157","2023-10-18","BJ123","4000/B01","","frozen","2up","315","514.71","","0","148");
INSERT INTO form7stock VALUES("158","2023-10-18","HL123","4000/K02","","frozen","5UP","218","356.212","","0","149");



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
) ENGINE=InnoDB AUTO_INCREMENT=636 DEFAULT CHARSET=utf8mb4;

INSERT INTO general_ledger VALUES("626","2023-10-18","AS261","4000/B01","50500","0","50500","paid to burbulay Hehe thank you","","","0","16");
INSERT INTO general_ledger VALUES("627","2023-10-18","AS261","3600/001","0","50500","0","paid to burbulay Hehe thank you","","","0","11");
INSERT INTO general_ledger VALUES("628","2023-10-18","AS262","3300/001","750000","0","750000","HehEH USA","SGRWFGR","US-23523","0","11");
INSERT INTO general_ledger VALUES("629","2023-10-18","AS262","1200/000","0","750000","0","Hehehhe USA","","","0","16");
INSERT INTO general_ledger VALUES("630","2023-10-18","AS263","3600/002","629990","0","629990","Money Received from USA (190 * 3150)","","","10","11");
INSERT INTO general_ledger VALUES("634","2023-10-18","AS265","9100/003","40000","0","669990","Spend on useless stuff","","","0","9");
INSERT INTO general_ledger VALUES("635","2023-10-18","AS265","3600/001","0","40000","629990","Spend Stuff","","","0","11");



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

INSERT INTO packingliststock VALUES("1","2023-09-01","300/M01","NY","975B2","BF747","","","");
INSERT INTO packingliststock VALUES("3","2023-09-08","300/M01","NY","975T2","LJ734","","","");



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
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO payable VALUES("232","2023-10-18","4000/B01","3811","850500","2023-10-18","AS261","paid to burbulay Hehe thank you","50500","800000","148","0","0000-00-00");
INSERT INTO payable VALUES("233","2023-10-18","4000/K02","8032","937400","0000-00-00","","","0","937400","149","0","0000-00-00");



DROP TABLE permission;

CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO permission VALUES("1","1","manage_accounts,manage_role,manage_sale,manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transactionmanage_general_ledger,manage_customers,manage_supplier,manage_category,manage_item,manage_actype,manage_acname,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,manage_packingmaterial,purchase_report,payable_report");
INSERT INTO permission VALUES("2","2",",manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport");
INSERT INTO permission VALUES("3","3","manage_accounts,manage_sale,manage_purchase,manage_cashbook,manage_accountpayable,manage_accountreceivablemanage_general_ledger,manage_customers");
INSERT INTO permission VALUES("4","4",",manage_purchase,manage_cashbook,manage_accountpayable,manage_accountreceivable,manage_transactionmanage_general_ledger,manage_actype,manage_acname,purchase_report,payable_report");
INSERT INTO permission VALUES("5","5",",manage_customers,manage_supplier,manage_category,manage_item,manage_unit,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,manage_packingmaterial");



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
) ENGINE=InnoDB AUTO_INCREMENT=150 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO purchase VALUES("148","2023-10-18","3811","4000/B01","frozen","BJ123","2up","315","0","2700","850500");
INSERT INTO purchase VALUES("149","2023-10-18","8032","4000/K02","frozen","HL123","5UP","218","0","4300","937400");



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
) ENGINE=InnoDB AUTO_INCREMENT=222 DEFAULT CHARSET=utf8mb4;

INSERT INTO receivable VALUES("219","2023-10-18","3300/001","SGRWFGR","US-23523","250","0000-00-00","","","0","250");
INSERT INTO receivable VALUES("220","0000-00-00","3300/001","","","","2023-10-18","AS263","Money Received From USA (190 *3150)","200","50");



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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

INSERT INTO role VALUES("1","Admin");
INSERT INTO role VALUES("2","Stock");
INSERT INTO role VALUES("3","Purchase");
INSERT INTO role VALUES("4","Accountant");
INSERT INTO role VALUES("5","Factory");



DROP TABLE supplier;

CREATE TABLE `supplier` (
  `supplier_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `supplier_id` varchar(25) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO supplier VALUES("A Thay Lay","09252534534","Yangon","4000/A01");
INSERT INTO supplier VALUES("Bar Bu Lay","09234523452","Mandalay","4000/B01");
INSERT INTO supplier VALUES("Ko Myo ","098345243465","Min Galar Done","4000/K01");
INSERT INTO supplier VALUES("Kyi Sin","092346555343","Nay Pyi Daw","4000/K02");
INSERT INTO supplier VALUES("Poe Zaw","09452335235235","Inn Lay","4000/P01");
INSERT INTO supplier VALUES("Phyo Lay","09235323545","Pago","4000/P02");
INSERT INTO supplier VALUES("Soe Naing","09345245135","Bagan","4000/S01");
INSERT INTO supplier VALUES("Soe Thain","0952342345","Nay Pyi Daw","4000/S02");
INSERT INTO supplier VALUES("Soe Myint","09346464345","Sakaing","4000/S03");
INSERT INTO supplier VALUES("Tun Naing","09345234","Taung Gyi","4000/T01");
INSERT INTO supplier VALUES("Thaung Htun","095462341","Tagone","4000/T02");
INSERT INTO supplier VALUES("Thar Hla","0945425346","Pyi Gyi Nar","4000/T03");



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
) ENGINE=InnoDB AUTO_INCREMENT=300 DEFAULT CHARSET=utf8mb4;

INSERT INTO transaction VALUES("298","2023-10-18","AS265","9100/003","Spend on useless stuff","40000","0","mmk","","","0");
INSERT INTO transaction VALUES("299","2023-10-18","AS265","3600/001","Spend Stuff","0","40000","mmk","","","0");



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




DROP TABLE userlogs;

CREATE TABLE `userlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_time` time(6) NOT NULL,
  `login_date` date NOT NULL,
  `login_username` varchar(125) NOT NULL,
  `login_password` varchar(125) NOT NULL,
  `status` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;

INSERT INTO userlogs VALUES("1","10:26:18.000000","2023-09-18","admin","admin","Login Success");
INSERT INTO userlogs VALUES("53","10:53:04.000000","2023-10-12","admin","admin","Login Success");
INSERT INTO userlogs VALUES("54","02:03:41.000000","2023-10-14","admin","admin","Login Success");
INSERT INTO userlogs VALUES("55","10:35:13.000000","2023-10-16","admin","admin","Login Success");
INSERT INTO userlogs VALUES("56","11:55:57.000000","2023-10-16","admin","admin","Login Success");
INSERT INTO userlogs VALUES("57","11:56:44.000000","2023-10-16","account","account","Login Success");
INSERT INTO userlogs VALUES("58","11:57:17.000000","2023-10-16","admin","admin","Login Success");
INSERT INTO userlogs VALUES("59","11:58:19.000000","2023-10-16","account","account","Login Success");
INSERT INTO userlogs VALUES("60","01:22:11.000000","2023-10-16","admin","admin","Login Success");
INSERT INTO userlogs VALUES("61","09:39:58.000000","2023-10-17","admin","admin","Login Success");
INSERT INTO userlogs VALUES("62","09:47:46.000000","2023-10-18","admin","admin","Login Success");
INSERT INTO userlogs VALUES("63","10:55:18.000000","2023-10-18","admin","admin","Login Success");



