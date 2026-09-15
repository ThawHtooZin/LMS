-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: lms
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accodes`
--

DROP TABLE IF EXISTS `accodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `class` varchar(50) NOT NULL,
  `description` text DEFAULT NULL,
  `system_tag` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accodes`
--

LOCK TABLES `accodes` WRITE;
/*!40000 ALTER TABLE `accodes` DISABLE KEYS */;
INSERT INTO `accodes` VALUES (1,'1501','Main Cash Kyats','Current Asset','ASSETS','Primary cash on hand','main_cash'),(2,'2000','Accounts Payable','Current Liability','LIABILITIES','Master control account for all unpaid bills','accounts_payable'),(3,'5000','Fish Purchases','Direct Costs','EXPENSES','Raw fish inventory purchases',NULL),(4,'5010','Packing Materials','Direct Costs','EXPENSES','Cartons, foam boxes, tapes, etc.',NULL),(5,'200','Sales','Revenue','REVENUE','Income from any normal business activity',NULL),(6,'260','Other Revenue','Revenue','REVENUE','Any other income that does not relate to normal business activities and is not recurring',NULL),(7,'270','Interest Income','Revenue','REVENUE','Interest income',NULL),(8,'310','Cost of Goods Sold','Direct Costs','EXPENSES','Cost of goods sold by the business',NULL),(9,'400','Advertising','Expense','EXPENSES','Expenses incurred for advertising while trying to increase sales',NULL),(10,'404','Bank Fees','Expense','EXPENSES','Fees charged by your bank for transactions regarding your bank account(s).',NULL),(11,'408','Cleaning','Expense','EXPENSES','Expenses incurred for cleaning  business property.',NULL),(12,'412','Consulting & Accounting','Expense','EXPENSES','Expenses related to paying consultants',NULL),(13,'416','Depreciation','Expense','EXPENSES','The amount of the asset\'s cost (based on the useful life) that was consumed during the period',NULL),(14,'420','Entertainment','Expense','EXPENSES','Expenses paid by company for the business but are not deductable for income tax purposes.',NULL),(15,'425','Freight & Courier','Expense','EXPENSES','Expenses incurred on courier & freight costs',NULL),(16,'429','General Expenses','Expense','EXPENSES','Any other expenses incurred that does not relate to normal business activities and is not recurring',NULL),(17,'433','Insurance','Expense','EXPENSES','Expenses incurred for insurance of business assets',NULL),(18,'437','Interest Expense','Expense','EXPENSES','Interest to be paid on money borrowed by the business',NULL),(19,'441','Legal expenses','Expense','EXPENSES','Expenses related to paying lawyers',NULL),(20,'445','Light, Power, Heating','Expense','EXPENSES','Expenses incurred for electricity and heating.',NULL),(21,'449','Motor Vehicle Expenses','Expense','EXPENSES','Expenses incurred for Motor Vehicles',NULL),(22,'453','Office Expenses','Expense','EXPENSES','Expenses incurred for office equipment.',NULL),(23,'461','Printing & Stationery','Expense','EXPENSES','Expenses incurred for printing & stationery',NULL),(24,'469','Rent','Expense','EXPENSES','Expenses incurred for renting business property.',NULL),(25,'473','Repairs and Maintenance','Expense','EXPENSES','Expenses incurred for Repair and Maintanence of business assets',NULL),(26,'477','Wages and Salaries','Expense','EXPENSES','Wages & Salaries',NULL),(27,'485','Subscriptions','Expense','EXPENSES','Expenses incurred for subscriptions.',NULL),(28,'489','Telephone & Internet','Expense','EXPENSES','Expenses incurred for telephone and internet.',NULL),(29,'493','Travel - National','Expense','EXPENSES','Expenses incurred for National Travel.',NULL),(30,'497','Travel - International','Expense','EXPENSES','Expenses incurred for International Travel.',NULL),(31,'498','Unrealized Currency Gains','Unrealized Currency Gains','REVENUE','Unrealized Currency Gains',NULL),(32,'499','Realized Currency Gains','Realized Currency Gains','REVENUE','Realized Currency Gains',NULL),(33,'500','Costs of Capital','Expense','EXPENSES','Cost of Capital',NULL),(34,'600','Accounts Receivable','Accounts Receivable','ASSETS','Outstanding balances for sales made to customers',NULL),(35,'610','Accounts Receivable (Import)','Accounts Receivable','ASSETS','Outstanding balances for sales made to customers',NULL),(36,'611','Prepayments','Current Asset','ASSETS','Prepayments',NULL),(37,'630','Inventory','Inventory','ASSETS','The value of the inventory on hand',NULL),(38,'710','Office Equipment','Fixed Asset','ASSETS','The value of the Office Equipment',NULL),(39,'711','Less Accumulated Depreciation on Office Equipment','Fixed Asset','ASSETS','The depreciation of the Office Equipment',NULL),(40,'720','Computer Equipment','Fixed Asset','ASSETS','The value of the Computer Equipment',NULL),(41,'721','Less Accumulated Depreciation on Computer Equipment','Fixed Asset','ASSETS','The depreciation of the Computer Equipment',NULL),(42,'730','Motor Vehicles','Fixed Asset','ASSETS','The value of the Motor Vehicles',NULL),(43,'731','Less Accumulated Depreciation on Motor Vehicles','Fixed Asset','ASSETS','The depreciation of the Motor Vehicles',NULL),(44,'800','Accounts Payable','Accounts Payable','LIABILITIES','Outstanding balances for bills from suppliers',NULL),(45,'801','Unpaid Expense Claims','Unpaid Expense Claims','LIABILITIES','Unpaid Expense Claims',NULL),(46,'804','Wages Payable','Wages Payable','LIABILITIES','Wages Payable',NULL),(47,'820','Sales Tax','Sales Tax','LIABILITIES','The balance of the sales tax owing to the Tax Authority',NULL),(48,'825','Historical Adjustment','Historical Adjustment','EQUITY','Historical Adjustment',NULL),(49,'826','Rounding','Rounding','EQUITY','Rounding',NULL),(50,'830','Income Tax Payable','Current Liability','LIABILITIES','The balance of the income tax owing to the Tax Authority',NULL),(51,'840','Historical Adjustment (Import)','Historical Adjustment','EQUITY','Historical Adjustment',NULL),(52,'850','Suspense','Current Liability','LIABILITIES','Suspense',NULL),(53,'860','Rounding (Import)','Rounding','EQUITY','Rounding',NULL),(54,'880','Owner A Drawings','Current Liability','LIABILITIES','Withdrawals by the owners',NULL),(55,'881','Owner A Funds Introduced','Current Liability','LIABILITIES','Funds contributed by the owner',NULL),(56,'900','Loan','Non-current Liability','LIABILITIES','Money that has been borrowed from a creditor',NULL),(57,'960','Retained Earnings','Retained Earnings','EQUITY','Do not Use',NULL),(58,'970','Owner A Share Capital','Equity','EQUITY','The value of shares purchased by the shareholders',NULL),(59,'5001','Material Purchase','Direct Costs','Expenses','MC packaging materials',NULL);
/*!40000 ALTER TABLE `accodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `role` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` VALUES (1,'Administrator','protechadmin2024***','admin@gmail.com',1),(2,'Ma Sandar Aung','12341234','sandaraung@gmail.com',1),(3,'Ma Soe Soe Khaing','stockstock','masoesoekhaing@gmail.com',2),(4,'Lwin Mi Khaing','shippment','lwinmikhaing@gmail.com',3),(6,'Lin Lin Naing','coldstore','linlinnaing@gmail.com',5),(7,'Su Thiri Kyaw','su122333','suthirikyaw@gmail.com',4),(8,'UMyoWinSwe','password','testing@gmail.com',6);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `actualinvoice`
--

DROP TABLE IF EXISTS `actualinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actualinvoice`
--

LOCK TABLES `actualinvoice` WRITE;
/*!40000 ALTER TABLE `actualinvoice` DISABLE KEYS */;
INSERT INTO `actualinvoice` VALUES (3,'3','2up','21',10,'210','','',3,4),(4,'3','3up','23',10,'230','','',3,5),(5,'2','6up','25',20,'500','','',3,6),(6,'2','7up','23',8,'184','','',3,7);
/*!40000 ALTER TABLE `actualinvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bankdetail`
--

DROP TABLE IF EXISTS `bankdetail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankdetail`
--

LOCK TABLES `bankdetail` WRITE;
/*!40000 ALTER TABLE `bankdetail` DISABLE KEYS */;
/*!40000 ALTER TABLE `bankdetail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cashbook`
--

DROP TABLE IF EXISTS `cashbook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cashbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `ac_name` varchar(25) NOT NULL,
  `particular` text DEFAULT NULL,
  `debit` text NOT NULL,
  `credit` text NOT NULL,
  `balance` text NOT NULL,
  `voucher_no` varchar(25) DEFAULT NULL,
  `crossac_name` varchar(25) DEFAULT NULL,
  `transactionid` int(11) NOT NULL,
  `interfacerowid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashbook`
--

LOCK TABLES `cashbook` WRITE;
/*!40000 ALTER TABLE `cashbook` DISABLE KEYS */;
/*!40000 ALTER TABLE `cashbook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` varchar(22) NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `rate` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coldstore`
--

DROP TABLE IF EXISTS `coldstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coldstore`
--

LOCK TABLES `coldstore` WRITE;
/*!40000 ALTER TABLE `coldstore` DISABLE KEYS */;
INSERT INTO `coldstore` VALUES (1,'2026-09-01','2026-09-03','3',20,20,'60','60',3,'3',540,540);
/*!40000 ALTER TABLE `coldstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `contact_type` varchar(50) NOT NULL DEFAULT 'Fish Supplier',
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `is_supplier` tinyint(1) NOT NULL DEFAULT 0,
  `is_customer` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (2,'Tommy','Fish Supplier','','0987654321','',1,0),(3,'Ko Myo','Fish Supplier','','234567890324567','',1,0),(4,'Ko Myo Naing','Fish Supplier','','123456543234','',1,0),(5,'Ko Aung Naing','Fish Supplier','','67766754565','',1,0),(6,'Shwe Myay','Material Supplier','','','',1,0),(7,'Tommy','Fish Supplier','','','',0,1),(8,'ThawHtooZin','Fish Supplier','','','',1,0),(9,'Mg Mg (TCL)','Fish Supplier','','','',1,0),(10,'Han','Fish Supplier','','09966424398','',1,0);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `container`
--

DROP TABLE IF EXISTS `container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `container` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `container_no` int(11) NOT NULL,
  `country` varchar(20) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
/*!40000 ALTER TABLE `container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exchange_rates`
--

DROP TABLE IF EXISTS `exchange_rates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exchange_rates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_code` varchar(10) NOT NULL,
  `rate` decimal(15,4) NOT NULL,
  `effective_date` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_rate_date` (`currency_code`,`effective_date`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_rates`
--

LOCK TABLES `exchange_rates` WRITE;
/*!40000 ALTER TABLE `exchange_rates` DISABLE KEYS */;
INSERT INTO `exchange_rates` VALUES (1,'USD',4500.0000,'2026-07-27'),(2,'USD',4000.0000,'2026-08-07'),(3,'USD',4500.0000,'2026-08-01'),(4,'USD',4300.0000,'2026-08-24'),(5,'USD',4500.0000,'2026-08-23'),(6,'USD',4600.0000,'2026-09-08');
/*!40000 ALTER TABLE `exchange_rates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form10stock`
--

DROP TABLE IF EXISTS `form10stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `fish_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form10stock`
--

LOCK TABLES `form10stock` WRITE;
/*!40000 ALTER TABLE `form10stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `form10stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form10stocktcl`
--

DROP TABLE IF EXISTS `form10stocktcl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form10stocktcl` (
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
  `cc_pcs` int(11) DEFAULT NULL,
  `cc_kg` float DEFAULT NULL,
  `msl_pcs` int(11) DEFAULT NULL,
  `msl_kg` float DEFAULT NULL,
  `hhk_pcs` int(11) DEFAULT NULL,
  `hhk_kg` float DEFAULT NULL,
  `lanfish_pcs` int(11) DEFAULT NULL,
  `lanfish_kg` float DEFAULT NULL,
  `cutpiece_pcs` int(11) DEFAULT NULL,
  `cutpiece_kg` float DEFAULT NULL,
  `total_kg` varchar(11) NOT NULL,
  `percentage` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form10stocktcl`
--

LOCK TABLES `form10stocktcl` WRITE;
/*!40000 ALTER TABLE `form10stocktcl` DISABLE KEYS */;
/*!40000 ALTER TABLE `form10stocktcl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form7stock`
--

DROP TABLE IF EXISTS `form7stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `water_kg` int(11) NOT NULL,
  `fish_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form7stock`
--

LOCK TABLES `form7stock` WRITE;
/*!40000 ALTER TABLE `form7stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `form7stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `form7stocktcl`
--

DROP TABLE IF EXISTS `form7stocktcl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `form7stocktcl` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form7stocktcl`
--

LOCK TABLES `form7stocktcl` WRITE;
/*!40000 ALTER TABLE `form7stocktcl` DISABLE KEYS */;
/*!40000 ALTER TABLE `form7stocktcl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `general_ledger`
--

DROP TABLE IF EXISTS `general_ledger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `general_ledger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `voucherno` varchar(255) NOT NULL,
  `ac_code` varchar(25) NOT NULL,
  `debit` text NOT NULL,
  `credit` text NOT NULL,
  `narration` text NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_ledger`
--

LOCK TABLES `general_ledger` WRITE;
/*!40000 ALTER TABLE `general_ledger` DISABLE KEYS */;
/*!40000 ALTER TABLE `general_ledger` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gfcdryfishcoldstore`
--

DROP TABLE IF EXISTS `gfcdryfishcoldstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gfcdryfishcoldstore`
--

LOCK TABLES `gfcdryfishcoldstore` WRITE;
/*!40000 ALTER TABLE `gfcdryfishcoldstore` DISABLE KEYS */;
/*!40000 ALTER TABLE `gfcdryfishcoldstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gfcdryfishlabour`
--

DROP TABLE IF EXISTS `gfcdryfishlabour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gfcdryfishlabour`
--

LOCK TABLES `gfcdryfishlabour` WRITE;
/*!40000 ALTER TABLE `gfcdryfishlabour` DISABLE KEYS */;
/*!40000 ALTER TABLE `gfcdryfishlabour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gfcfishcoldstore`
--

DROP TABLE IF EXISTS `gfcfishcoldstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gfcfishcoldstore`
--

LOCK TABLES `gfcfishcoldstore` WRITE;
/*!40000 ALTER TABLE `gfcfishcoldstore` DISABLE KEYS */;
INSERT INTO `gfcfishcoldstore` VALUES (5,'2026-09-01','balance',100,100,'21','21','3',63,63,''),(6,'2026-09-02','import',20,120,'21','42','3',126,0,''),(7,'2026-09-02','import',0,120,'2','44','3',132,195,''),(8,'2026-09-02','takeout',10,110,'21','23','3',0,0,''),(12,'2026-09-03','import',20,130,'50','73','3',219,0,''),(13,'2026-09-03','export',30,100,'20','53','3',0,0,''),(14,'2026-09-03','import',10,110,'10','63','3',189,384,'');
/*!40000 ALTER TABLE `gfcfishcoldstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gfcfishlabour`
--

DROP TABLE IF EXISTS `gfcfishlabour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gfcfishlabour`
--

LOCK TABLES `gfcfishlabour` WRITE;
/*!40000 ALTER TABLE `gfcfishlabour` DISABLE KEYS */;
INSERT INTO `gfcfishlabour` VALUES (3,'2026-09-02','import','21','5',105,105,''),(4,'2026-09-02','takeout','21','5',105,210,''),(8,'2026-09-03','import','50','5',250,460,''),(9,'2026-09-03','export','20','5',100,560,''),(10,'2026-09-03','import','10','5',50,610,'');
/*!40000 ALTER TABLE `gfcfishlabour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gfcmcstock`
--

DROP TABLE IF EXISTS `gfcmcstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `fish_type` varchar(255) NOT NULL,
  `loosein_size` varchar(20) NOT NULL,
  `loosein_kg` varchar(20) NOT NULL,
  `loosein_pcs` varchar(20) NOT NULL,
  `looseout_size` varchar(20) NOT NULL,
  `looseout_kg` varchar(20) NOT NULL,
  `looseout_pcs` varchar(20) NOT NULL,
  `remark` text NOT NULL,
  `hhk_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gfcmcstock`
--

LOCK TABLES `gfcmcstock` WRITE;
/*!40000 ALTER TABLE `gfcmcstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `gfcmcstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gfctotal`
--

DROP TABLE IF EXISTS `gfctotal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gfctotal`
--

LOCK TABLES `gfctotal` WRITE;
/*!40000 ALTER TABLE `gfctotal` DISABLE KEYS */;
/*!40000 ALTER TABLE `gfctotal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hhkmcstock`
--

DROP TABLE IF EXISTS `hhkmcstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `loosein_size` varchar(20) NOT NULL,
  `loosein_kg` varchar(20) NOT NULL,
  `loosein_pcs` bigint(15) NOT NULL,
  `looseout_size` varchar(20) NOT NULL,
  `looseout_kg` varchar(20) NOT NULL,
  `looseout_pcs` bigint(15) NOT NULL,
  `remark` text NOT NULL,
  `fish_type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hhkmcstock`
--

LOCK TABLES `hhkmcstock` WRITE;
/*!40000 ALTER TABLE `hhkmcstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `hhkmcstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hhkstock`
--

DROP TABLE IF EXISTS `hhkstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `balance_kg` varchar(11) NOT NULL,
  `balance_mc` int(11) DEFAULT NULL,
  `link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hhkstock`
--

LOCK TABLES `hhkstock` WRITE;
/*!40000 ALTER TABLE `hhkstock` DISABLE KEYS */;
INSERT INTO `hhkstock` VALUES (2,'2026-09-01','0000-00-00','3',150,150,'350','350','300','360',120,0),(3,'2026-09-01','2026-09-03','3',20,130,'60','290','60','',NULL,1);
/*!40000 ALTER TABLE `hhkstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoice_costing`
--

DROP TABLE IF EXISTS `invoice_costing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_costing`
--

LOCK TABLES `invoice_costing` WRITE;
/*!40000 ALTER TABLE `invoice_costing` DISABLE KEYS */;
INSERT INTO `invoice_costing` VALUES (3,'3','2up','21','12000','7343.941248','20','6119.951040','1.359989120','0.22','1200','1200','1200','1200','4801.579989','','','','','100833.1797',3,4),(4,'3','3up','23','','','','','','','','','','','','','','','','',3,5),(5,'2','6up','25','','','','','','','','','','','','','','','','',3,6),(6,'2','7up','23','','','','','','','','','','','','','','','','',3,7);
/*!40000 ALTER TABLE `invoice_costing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `labour`
--

DROP TABLE IF EXISTS `labour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `labour`
--

LOCK TABLES `labour` WRITE;
/*!40000 ALTER TABLE `labour` DISABLE KEYS */;
/*!40000 ALTER TABLE `labour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual_journal_lines`
--

DROP TABLE IF EXISTS `manual_journal_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manual_journal_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_id` int(11) NOT NULL,
  `account_code` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `debit` decimal(15,2) DEFAULT 0.00,
  `credit` decimal(15,2) DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `journal_id` (`journal_id`),
  CONSTRAINT `fk_journal_lines` FOREIGN KEY (`journal_id`) REFERENCES `manual_journals` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_journal_lines`
--

LOCK TABLES `manual_journal_lines` WRITE;
/*!40000 ALTER TABLE `manual_journal_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `manual_journal_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manual_journals`
--

DROP TABLE IF EXISTS `manual_journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manual_journals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `journal_date` date NOT NULL,
  `narration` varchar(255) NOT NULL,
  `status` enum('DRAFT','POSTED','VOIDED') DEFAULT 'DRAFT',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manual_journals`
--

LOCK TABLES `manual_journals` WRITE;
/*!40000 ALTER TABLE `manual_journals` DISABLE KEYS */;
/*!40000 ALTER TABLE `manual_journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_purchase`
--

DROP TABLE IF EXISTS `material_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_purchase` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `voucher_no` int(11) NOT NULL,
  `supplier_id` varchar(255) DEFAULT NULL,
  `material_id` text DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_purchase`
--

LOCK TABLES `material_purchase` WRITE;
/*!40000 ALTER TABLE `material_purchase` DISABLE KEYS */;
/*!40000 ALTER TABLE `material_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material_store_house`
--

DROP TABLE IF EXISTS `material_store_house`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material_store_house` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `time` time DEFAULT current_timestamp(),
  `voucher_no` text NOT NULL,
  `description` varchar(255) NOT NULL,
  `supplier_id` text NOT NULL,
  `material_id` int(11) NOT NULL,
  `in_quantity` int(11) DEFAULT NULL,
  `out_quantity` int(11) DEFAULT NULL,
  `output_group` int(11) DEFAULT NULL,
  `action` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_store_house`
--

LOCK TABLES `material_store_house` WRITE;
/*!40000 ALTER TABLE `material_store_house` DISABLE KEYS */;
INSERT INTO `material_store_house` VALUES (1,'2026-08-08','10:27:20','Dr 24/Feb111','','2',4,20,NULL,NULL,''),(2,'2026-08-08','10:32:56','SV-001','','2',4,20,NULL,NULL,''),(5,'2026-08-10','12:30:52','123123','','6',4,20,NULL,NULL,'');
/*!40000 ALTER TABLE `material_store_house` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msl_total_charges`
--

DROP TABLE IF EXISTS `msl_total_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msl_total_charges`
--

LOCK TABLES `msl_total_charges` WRITE;
/*!40000 ALTER TABLE `msl_total_charges` DISABLE KEYS */;
/*!40000 ALTER TABLE `msl_total_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mslcoldstore`
--

DROP TABLE IF EXISTS `mslcoldstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mslcoldstore`
--

LOCK TABLES `mslcoldstore` WRITE;
/*!40000 ALTER TABLE `mslcoldstore` DISABLE KEYS */;
/*!40000 ALTER TABLE `mslcoldstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mslexportcharges`
--

DROP TABLE IF EXISTS `mslexportcharges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mslexportcharges`
--

LOCK TABLES `mslexportcharges` WRITE;
/*!40000 ALTER TABLE `mslexportcharges` DISABLE KEYS */;
/*!40000 ALTER TABLE `mslexportcharges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mslfreezing`
--

DROP TABLE IF EXISTS `mslfreezing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mslfreezing`
--

LOCK TABLES `mslfreezing` WRITE;
/*!40000 ALTER TABLE `mslfreezing` DISABLE KEYS */;
/*!40000 ALTER TABLE `mslfreezing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mslrepacking`
--

DROP TABLE IF EXISTS `mslrepacking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mslrepacking`
--

LOCK TABLES `mslrepacking` WRITE;
/*!40000 ALTER TABLE `mslrepacking` DISABLE KEYS */;
/*!40000 ALTER TABLE `mslrepacking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mslstock`
--

DROP TABLE IF EXISTS `mslstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mslstock`
--

LOCK TABLES `mslstock` WRITE;
/*!40000 ALTER TABLE `mslstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `mslstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packingliststock`
--

DROP TABLE IF EXISTS `packingliststock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packingliststock`
--

LOCK TABLES `packingliststock` WRITE;
/*!40000 ALTER TABLE `packingliststock` DISABLE KEYS */;
INSERT INTO `packingliststock` VALUES (3,'2026-09-01','7','Can','2026001','PPN001','Blank','Test','09420494');
/*!40000 ALTER TABLE `packingliststock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packingliststockinfo`
--

DROP TABLE IF EXISTS `packingliststockinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packingliststockinfo`
--

LOCK TABLES `packingliststockinfo` WRITE;
/*!40000 ALTER TABLE `packingliststockinfo` DISABLE KEYS */;
INSERT INTO `packingliststockinfo` VALUES (2,'1','1up',100,2,200,'202','','',2),(3,'1','5up',20,8,160,'168','','',2),(4,'3','2up',21,10,210,'220','','',3),(5,'3','3up',23,10,230,'240','','',3),(6,'2','6up',25,20,500,'520','','',3),(7,'2','7up',23,8,184,'192','','',3);
/*!40000 ALTER TABLE `packingliststockinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packingmaterial`
--

DROP TABLE IF EXISTS `packingmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `link_id` int(11) NOT NULL,
  `infoid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packingmaterial`
--

LOCK TABLES `packingmaterial` WRITE;
/*!40000 ALTER TABLE `packingmaterial` DISABLE KEYS */;
INSERT INTO `packingmaterial` VALUES (4,'3','2up','5','66.66666666','100','500','1','5',0,5,5,'0.071428571',100,100,888,'0.22','100',100,100,4,3),(5,'3','3up','5','75','100','600','1','6',0,6,5,'0.072857142',120,120,1038,'0.23','12',120,120,5,3),(6,'2','6up','','','','','','',0,0,0,'',0,0,0,'','',0,0,6,3),(7,'2','7up','','','','','','',0,0,0,'',0,0,0,'','',0,0,7,3);
/*!40000 ALTER TABLE `packingmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NOT NULL,
  `permission` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (1,1,'manage_accounts,manage_role,manage_sale,manage_purchase,manage_acpayable,manage_accountreceivable,manage_general_ledger,manage_contacts,manage_products,manage_product_types,manage_currency,manage_coa,manage_coldstoreitem,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,sale_report,purchase_report,payable_report,manage_mcreport,manage_tclmcstock,manage_generalledger,manage_material_purchase,material_store_house,material_gatepass,configuration_coldstore,packing_material_report,temp_pm_stock,profit_loss_report,manage_manual_journals'),(2,2,',manage_products,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_mcreport,manage_tclmcstock'),(3,3,',manage_coldstoreitem,manage_coldstorecharges,manage_shippmentexport,manage_truckexport'),(4,4,',manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transaction,manage_general_ledger,manage_contacts,manage_coldstoreitem,manage_products,manage_coa,manage_unit,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,manage_packingmaterial,sale_report,purchase_report,payable_report,manage_mcreport,manage_tclmcstock,profit_loss_report,manage_manual_journals'),(5,5,',manage_coldstoreitem,manage_coldstorecharges'),(6,6,',manage_stockreport,sale_report,purchase_report,payable_report,manage_mcreport,manage_generalledger,packing_material_report,profit_loss_report');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processing`
--

DROP TABLE IF EXISTS `processing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processing`
--

LOCK TABLES `processing` WRITE;
/*!40000 ALTER TABLE `processing` DISABLE KEYS */;
INSERT INTO `processing` VALUES (1,'2026-09-01','2026-09-03','3',20,20,'60','60','',0,0);
/*!40000 ALTER TABLE `processing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_types`
--

DROP TABLE IF EXISTS `product_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rate` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_types`
--

LOCK TABLES `product_types` WRITE;
/*!40000 ALTER TABLE `product_types` DISABLE KEYS */;
INSERT INTO `product_types` VALUES (1,'Fish',3),(2,'Packing Material',0);
/*!40000 ALTER TABLE `product_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `type_id` int(11) NOT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `is_purchased` tinyint(1) NOT NULL DEFAULT 0,
  `purchase_account` varchar(50) DEFAULT NULL,
  `is_sold` tinyint(1) NOT NULL DEFAULT 0,
  `sales_account` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_product_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'h001','HILSA','Fish here can be tested anytime',1,'',1,'5000',1,'200'),(2,'r001','rohu','This fish is rly good taste ngl',1,'',1,'5000',1,'200'),(3,'bbb01','Boal','',1,'',1,'',0,NULL),(4,'MT001','Cotton Box','Cotton box for packaging MC',2,'',1,'5001',1,'200'),(5,'M001','Marigal','',1,'',1,'',1,'');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_lines`
--

DROP TABLE IF EXISTS `purchase_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `account_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `size` varchar(50) NOT NULL,
  `viss` decimal(10,2) NOT NULL DEFAULT 0.00,
  `pcs` int(11) NOT NULL DEFAULT 0,
  `unit_price` decimal(15,2) NOT NULL DEFAULT 0.00,
  `line_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `fk_pl_purchase` (`purchase_id`),
  KEY `fk_pl_product` (`product_id`),
  KEY `fk_pl_account` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_lines`
--

LOCK TABLES `purchase_lines` WRITE;
/*!40000 ALTER TABLE `purchase_lines` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_payments`
--

DROP TABLE IF EXISTS `purchase_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchase_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `purchase_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_account` varchar(50) NOT NULL,
  `reference` varchar(255) NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `fk_payment_purchase` (`purchase_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_payments`
--

LOCK TABLES `purchase_payments` WRITE;
/*!40000 ALTER TABLE `purchase_payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchases`
--

DROP TABLE IF EXISTS `purchases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `purchases` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_no` varchar(255) NOT NULL,
  `contact_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `tclfrozen` varchar(20) NOT NULL DEFAULT 'Frozen',
  `due_date` date DEFAULT NULL,
  `currency` varchar(10) NOT NULL DEFAULT 'MMK',
  `exchange_rate` decimal(15,4) NOT NULL DEFAULT 1.0000,
  `status` enum('DRAFT','AWAITING_APPROVAL','AWAITING_PAYMENT','PAID','VOIDED') DEFAULT 'DRAFT',
  `subtotal` decimal(15,2) NOT NULL DEFAULT 0.00,
  `grand_total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_voucher` (`voucher_no`),
  KEY `fk_purchases_contact` (`contact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receivable`
--

DROP TABLE IF EXISTS `receivable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `receivable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `ac_code` varchar(25) NOT NULL,
  `sr_no` varchar(25) NOT NULL,
  `container_no` varchar(25) NOT NULL,
  `invoice_amount` text NOT NULL,
  `paid_date` date NOT NULL,
  `payment_no` varchar(25) NOT NULL,
  `particulars` varchar(255) NOT NULL,
  `paid_amount` text NOT NULL,
  `balance` text NOT NULL,
  `transactionid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receivable`
--

LOCK TABLES `receivable` WRITE;
/*!40000 ALTER TABLE `receivable` DISABLE KEYS */;
/*!40000 ALTER TABLE `receivable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repacking`
--

DROP TABLE IF EXISTS `repacking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repacking`
--

LOCK TABLES `repacking` WRITE;
/*!40000 ALTER TABLE `repacking` DISABLE KEYS */;
/*!40000 ALTER TABLE `repacking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repackingout`
--

DROP TABLE IF EXISTS `repackingout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repackingout` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `outkg` varchar(11) NOT NULL,
  `rate` varchar(11) NOT NULL,
  `charges` bigint(15) NOT NULL,
  `total_charges` bigint(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repackingout`
--

LOCK TABLES `repackingout` WRITE;
/*!40000 ALTER TABLE `repackingout` DISABLE KEYS */;
/*!40000 ALTER TABLE `repackingout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Admin'),(2,'Stock'),(3,'Shippment'),(4,'TCL'),(5,'Coldstore'),(6,'Visitor');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_output_group`
--

DROP TABLE IF EXISTS `stock_output_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_output_group` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT current_timestamp(),
  `time` time DEFAULT current_timestamp(),
  `stock_to` varchar(255) DEFAULT NULL,
  `voucher_no` int(11) DEFAULT NULL,
  `description` varchar(255) NOT NULL,
  `group_name` text DEFAULT NULL,
  `material_id` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_output_group`
--

LOCK TABLES `stock_output_group` WRITE;
/*!40000 ALTER TABLE `stock_output_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_output_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_currencies`
--

DROP TABLE IF EXISTS `system_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_currencies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) NOT NULL,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_currency_code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_currencies`
--

LOCK TABLES `system_currencies` WRITE;
/*!40000 ALTER TABLE `system_currencies` DISABLE KEYS */;
INSERT INTO `system_currencies` VALUES (1,'USD','US Dollar');
/*!40000 ALTER TABLE `system_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tclmcstock`
--

DROP TABLE IF EXISTS `tclmcstock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `loading_no` text NOT NULL,
  `loading_mc` int(11) NOT NULL,
  `grandtotal_mc` bigint(77) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tclmcstock`
--

LOCK TABLES `tclmcstock` WRITE;
/*!40000 ALTER TABLE `tclmcstock` DISABLE KEYS */;
/*!40000 ALTER TABLE `tclmcstock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `total_charges`
--

DROP TABLE IF EXISTS `total_charges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `extra_charges` bigint(20) NOT NULL,
  `total_charges` bigint(19) NOT NULL,
  `grand_total_charges` bigint(19) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_amount` bigint(19) NOT NULL,
  `balance_amount` bigint(19) NOT NULL,
  `remark` text NOT NULL,
  `link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_charges`
--

LOCK TABLES `total_charges` WRITE;
/*!40000 ALTER TABLE `total_charges` DISABLE KEYS */;
INSERT INTO `total_charges` VALUES (1,'2026-09-03',3,540,0,0,0,0,0,0,540,540,'0000-00-00',0,540,'',1);
/*!40000 ALTER TABLE `total_charges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truckactualinvoice`
--

DROP TABLE IF EXISTS `truckactualinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truckactualinvoice`
--

LOCK TABLES `truckactualinvoice` WRITE;
/*!40000 ALTER TABLE `truckactualinvoice` DISABLE KEYS */;
INSERT INTO `truckactualinvoice` VALUES (2,'2','2up',20,26,20,520,0,0,'221',2);
/*!40000 ALTER TABLE `truckactualinvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truckdeclare`
--

DROP TABLE IF EXISTS `truckdeclare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `truckdeclare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` varchar(24) NOT NULL,
  `size` varchar(24) NOT NULL,
  `pcsperbox` bigint(20) NOT NULL,
  `kgperbox` float NOT NULL,
  `mc` bigint(20) NOT NULL,
  `netweight` float NOT NULL,
  `invoice_no` varchar(15) NOT NULL,
  `link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truckdeclare`
--

LOCK TABLES `truckdeclare` WRITE;
/*!40000 ALTER TABLE `truckdeclare` DISABLE KEYS */;
INSERT INTO `truckdeclare` VALUES (2,'2','2up',20,0,20,0,'221',2);
/*!40000 ALTER TABLE `truckdeclare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truckfoambox`
--

DROP TABLE IF EXISTS `truckfoambox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `link_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truckfoambox`
--

LOCK TABLES `truckfoambox` WRITE;
/*!40000 ALTER TABLE `truckfoambox` DISABLE KEYS */;
INSERT INTO `truckfoambox` VALUES (2,'2','2up',20,26,20,520,'','','221',2);
/*!40000 ALTER TABLE `truckfoambox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truckpackingliststock`
--

DROP TABLE IF EXISTS `truckpackingliststock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `truckpackingliststock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `invoice_no` varchar(11) NOT NULL,
  `truck_no` varchar(16) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truckpackingliststock`
--

LOCK TABLES `truckpackingliststock` WRITE;
/*!40000 ALTER TABLE `truckpackingliststock` DISABLE KEYS */;
INSERT INTO `truckpackingliststock` VALUES (1,'2026-09-01','221','22231');
/*!40000 ALTER TABLE `truckpackingliststock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truckpackingliststockinfo`
--

DROP TABLE IF EXISTS `truckpackingliststockinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truckpackingliststockinfo`
--

LOCK TABLES `truckpackingliststockinfo` WRITE;
/*!40000 ALTER TABLE `truckpackingliststockinfo` DISABLE KEYS */;
INSERT INTO `truckpackingliststockinfo` VALUES (2,'2','2up',20,26,20,520,1200,'221');
/*!40000 ALTER TABLE `truckpackingliststockinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truckpackingmaterial`
--

DROP TABLE IF EXISTS `truckpackingmaterial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truckpackingmaterial`
--

LOCK TABLES `truckpackingmaterial` WRITE;
/*!40000 ALTER TABLE `truckpackingmaterial` DISABLE KEYS */;
/*!40000 ALTER TABLE `truckpackingmaterial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trucktotalcosting`
--

DROP TABLE IF EXISTS `trucktotalcosting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `mtorst` varchar(11) NOT NULL,
  `ygntomtorst_charges` int(11) NOT NULL,
  `mtorsttotechnck_charges` int(11) NOT NULL,
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
  `link_id` int(11) NOT NULL,
  `infoid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trucktotalcosting`
--

LOCK TABLES `trucktotalcosting` WRITE;
/*!40000 ALTER TABLE `trucktotalcosting` DISABLE KEYS */;
INSERT INTO `trucktotalcosting` VALUES (1,'0000-00-00','','2up',210,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,'221',1,1),(2,'0000-00-00','','2up',520,0,0,0,0,'',0,0,0,0,0,0,0,0,0,0,0,0,0,'221',2,1);
/*!40000 ALTER TABLE `trucktotalcosting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userlogs`
--

DROP TABLE IF EXISTS `userlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_time` time(6) NOT NULL,
  `login_date` date NOT NULL,
  `login_username` varchar(125) NOT NULL,
  `login_password` varchar(125) NOT NULL,
  `status` varchar(55) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=922 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogs`
--

LOCK TABLES `userlogs` WRITE;
/*!40000 ALTER TABLE `userlogs` DISABLE KEYS */;
INSERT INTO `userlogs` VALUES (870,'10:40:59.000000','2026-06-22','admin@gmail.com','protechadmin','Login Failed'),(871,'10:41:02.000000','2026-06-22','admin@gmail.com','password','Login Failed'),(872,'10:41:15.000000','2026-06-22','admin@gmail.com','protechadmin','Login Failed'),(873,'10:41:23.000000','2026-06-22','Administrator','protechadmin2024***','Login Success'),(874,'08:48:10.000000','2026-06-25','Administrator','','Logout Success'),(875,'12:57:23.000000','2026-06-29','Administrator','protechadmin2024***','Login Success'),(876,'03:30:48.000000','2026-07-02','Administrator','','Logout Success'),(877,'03:30:56.000000','2026-07-02','UMyoWinSwe','password','Login Success'),(878,'03:31:05.000000','2026-07-02','UMyoWinSwe','','Logout Success'),(879,'03:31:06.000000','2026-07-02','Administrator','protechadmin2024***','Login Success'),(880,'03:31:39.000000','2026-07-02','Administrator','','Logout Success'),(881,'03:31:46.000000','2026-07-02','Administrator','protechadmin2024***','Login Success'),(882,'03:31:57.000000','2026-07-02','Administrator','','Logout Success'),(883,'03:32:04.000000','2026-07-02','UMyoWinSwe','password','Login Success'),(884,'03:35:52.000000','2026-07-02','UMyoWinSwe','','Logout Success'),(885,'03:35:53.000000','2026-07-02','Administrator','protechadmin2024***','Login Success'),(886,'02:02:45.000000','2026-08-11','Administrator','','Logout Success'),(887,'02:02:49.000000','2026-08-11','Administrator','protechadmin2024***','Login Success'),(888,'05:26:32.000000','2026-08-24','Administrator','','Logout Success'),(889,'05:26:49.000000','2026-08-24','UMyoWinSwe','password','Login Success'),(890,'05:27:06.000000','2026-08-24','UMyoWinSwe','','Logout Success'),(891,'05:27:08.000000','2026-08-24','Administrator','protechadmin2024***','Login Success'),(892,'10:00:01.000000','2026-09-03','Administrator','','Logout Success'),(893,'10:00:32.000000','2026-09-03','Administrator','protechadmin2024***','Login Success'),(894,'10:33:05.000000','2026-09-03','Administrator','','Logout Success'),(895,'10:33:07.000000','2026-09-03','admin@gmail.com','admin','Login Failed'),(896,'10:33:11.000000','2026-09-03','Administrator','protechadmin2024***','Login Success'),(897,'10:33:50.000000','2026-09-03','Administrator','','Logout Success'),(898,'10:33:55.000000','2026-09-03','Administrator','protechadmin2024***','Login Success'),(899,'11:21:29.000000','2026-09-03','Administrator','','Logout Success'),(900,'11:23:55.000000','2026-09-03','admin@gmail.com','admin','Login Failed'),(901,'11:23:56.000000','2026-09-03','admin@gmail.com','admin','Login Failed'),(902,'11:23:59.000000','2026-09-03','Administrator','protechadmin2024***','Login Success'),(903,'11:24:01.000000','2026-09-03','Administrator','','Logout Success'),(904,'11:24:04.000000','2026-09-03','admin@gmail.com','admin','Login Failed'),(905,'11:24:04.000000','2026-09-03','admin@gmail.com','admin','Login Failed'),(906,'11:24:12.000000','2026-09-03','Administrator','protechadmin2','Login Password Invalid'),(907,'11:24:13.000000','2026-09-03','admin@gmail.com','admin','Login Failed'),(908,'11:24:26.000000','2026-09-03','Administrator','protechadmin2024***','Login Success'),(909,'11:59:28.000000','2026-09-03','Administrator','','Logout Success'),(910,'11:59:29.000000','2026-09-03','admin@gmail.com','admin','Login Failed'),(911,'11:59:34.000000','2026-09-03','Administrator','protechadmin2024***','Login Success'),(912,'11:59:52.000000','2026-09-03','Administrator','','Logout Success'),(913,'11:59:56.000000','2026-09-03','Administrator','protechadmin2024***','Login Success'),(914,'09:41:03.000000','2026-09-04','Administrator','protechadmin2024***','Login Success'),(915,'09:28:59.000000','2026-09-08','Administrator','protechadmin2024***','Login Success'),(916,'10:36:09.000000','2026-09-08','Administrator','','Logout Success'),(917,'10:36:52.000000','2026-09-08','Ma Soe Soe Khaing','stockstock','Login Success'),(918,'10:37:33.000000','2026-09-08','Ma Soe Soe Khaing','','Logout Success'),(919,'10:38:00.000000','2026-09-08','Administrator','protechadmin2024***','Login Success'),(920,'01:34:05.000000','2026-09-12','Administrator','protechadmin2024***','Login Success'),(921,'11:16:16.000000','2026-09-15','Administrator','protechadmin2024***','Login Success');
/*!40000 ALTER TABLE `userlogs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-15 15:02:59
