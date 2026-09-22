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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accodes`
--

LOCK TABLES `accodes` WRITE;
/*!40000 ALTER TABLE `accodes` DISABLE KEYS */;
INSERT INTO `accodes` VALUES (1,'1501','Main Cash Kyats','Current Asset','ASSETS','Primary cash on hand','main_cash'),(2,'2000','Accounts Payable','Current Liability','LIABILITIES','Master control account for all unpaid bills','accounts_payable'),(3,'5000','Fish Purchases','Direct Costs','EXPENSES','Raw fish inventory purchases',NULL),(4,'5010','Packing Materials','Direct Costs','EXPENSES','Cartons, foam boxes, tapes, etc.',NULL),(5,'200','Sales','Revenue','REVENUE','Income from any normal business activity',NULL),(6,'260','Other Revenue','Revenue','REVENUE','Any other income that does not relate to normal business activities and is not recurring',NULL),(7,'270','Interest Income','Revenue','REVENUE','Interest income',NULL),(8,'310','Cost of Goods Sold','Direct Costs','EXPENSES','Cost of goods sold by the business',NULL),(9,'400','Advertising','Expense','EXPENSES','Expenses incurred for advertising while trying to increase sales',NULL),(10,'404','Bank Fees','Expense','EXPENSES','Fees charged by your bank for transactions regarding your bank account(s).',NULL),(11,'408','Cleaning','Expense','EXPENSES','Expenses incurred for cleaning  business property.',NULL),(12,'412','Consulting & Accounting','Expense','EXPENSES','Expenses related to paying consultants',NULL),(13,'416','Depreciation','Expense','EXPENSES','The amount of the asset\'s cost (based on the useful life) that was consumed during the period',NULL),(14,'420','Entertainment','Expense','EXPENSES','Expenses paid by company for the business but are not deductable for income tax purposes.',NULL),(15,'425','Freight & Courier','Expense','EXPENSES','Expenses incurred on courier & freight costs',NULL),(16,'429','General Expenses','Expense','EXPENSES','Any other expenses incurred that does not relate to normal business activities and is not recurring',NULL),(17,'433','Insurance','Expense','EXPENSES','Expenses incurred for insurance of business assets',NULL),(18,'437','Interest Expense','Expense','EXPENSES','Interest to be paid on money borrowed by the business',NULL),(19,'441','Legal expenses','Expense','EXPENSES','Expenses related to paying lawyers',NULL),(20,'445','Light, Power, Heating','Expense','EXPENSES','Expenses incurred for electricity and heating.',NULL),(21,'449','Motor Vehicle Expenses','Expense','EXPENSES','Expenses incurred for Motor Vehicles',NULL),(22,'453','Office Expenses','Expense','EXPENSES','Expenses incurred for office equipment.',NULL),(23,'461','Printing & Stationery','Expense','EXPENSES','Expenses incurred for printing & stationery',NULL),(24,'469','Rent','Expense','EXPENSES','Expenses incurred for renting business property.',NULL),(25,'473','Repairs and Maintenance','Expense','EXPENSES','Expenses incurred for Repair and Maintanence of business assets',NULL),(26,'477','Wages and Salaries','Expense','EXPENSES','Wages & Salaries',NULL),(27,'485','Subscriptions','Expense','EXPENSES','Expenses incurred for subscriptions.',NULL),(28,'489','Telephone & Internet','Expense','EXPENSES','Expenses incurred for telephone and internet.',NULL),(29,'493','Travel - National','Expense','EXPENSES','Expenses incurred for National Travel.',NULL),(30,'497','Travel - International','Expense','EXPENSES','Expenses incurred for International Travel.',NULL),(31,'498','Unrealized Currency Gains','Unrealized Currency Gains','REVENUE','Unrealized Currency Gains',NULL),(32,'499','Realized Currency Gains','Realized Currency Gains','REVENUE','Realized Currency Gains',NULL),(33,'500','Costs of Capital','Expense','EXPENSES','Cost of Capital',NULL),(34,'600','Accounts Receivable','Accounts Receivable','ASSETS','Outstanding balances for sales made to customers',NULL),(35,'610','Accounts Receivable (Import)','Accounts Receivable','ASSETS','Outstanding balances for sales made to customers',NULL),(36,'611','Prepayments','Current Asset','ASSETS','Prepayments',NULL),(37,'630','Inventory','Inventory','ASSETS','The value of the inventory on hand',NULL),(38,'710','Office Equipment','Fixed Asset','ASSETS','The value of the Office Equipment',NULL),(39,'711','Less Accumulated Depreciation on Office Equipment','Fixed Asset','ASSETS','The depreciation of the Office Equipment',NULL),(40,'720','Computer Equipment','Fixed Asset','ASSETS','The value of the Computer Equipment',NULL),(41,'721','Less Accumulated Depreciation on Computer Equipment','Fixed Asset','ASSETS','The depreciation of the Computer Equipment',NULL),(42,'730','Motor Vehicles','Fixed Asset','ASSETS','The value of the Motor Vehicles',NULL),(43,'731','Less Accumulated Depreciation on Motor Vehicles','Fixed Asset','ASSETS','The depreciation of the Motor Vehicles',NULL),(44,'800','Accounts Payable','Accounts Payable','LIABILITIES','Outstanding balances for bills from suppliers',NULL),(45,'801','Unpaid Expense Claims','Unpaid Expense Claims','LIABILITIES','Unpaid Expense Claims',NULL),(46,'804','Wages Payable','Wages Payable','LIABILITIES','Wages Payable',NULL),(47,'820','Sales Tax','Sales Tax','LIABILITIES','The balance of the sales tax owing to the Tax Authority',NULL),(48,'825','Historical Adjustment','Historical Adjustment','EQUITY','Historical Adjustment',NULL),(49,'826','Rounding','Rounding','EQUITY','Rounding',NULL),(50,'830','Income Tax Payable','Current Liability','LIABILITIES','The balance of the income tax owing to the Tax Authority',NULL),(51,'840','Historical Adjustment (Import)','Historical Adjustment','EQUITY','Historical Adjustment',NULL),(52,'850','Suspense','Current Liability','LIABILITIES','Suspense',NULL),(53,'860','Rounding (Import)','Rounding','EQUITY','Rounding',NULL),(54,'880','Owner A Drawings','Current Liability','LIABILITIES','Withdrawals by the owners',NULL),(55,'881','Owner A Funds Introduced','Current Liability','LIABILITIES','Funds contributed by the owner',NULL),(56,'900','Loan','Non-current Liability','LIABILITIES','Money that has been borrowed from a creditor',NULL),(57,'960','Retained Earnings','Retained Earnings','EQUITY','Do not Use',NULL),(58,'970','Owner A Share Capital','Equity','EQUITY','The value of shares purchased by the shareholders',NULL),(59,'5001','Material Purchase','Direct Costs','Expenses','MC packaging materials',NULL),(60,'1503','UAB Bank','Current Asset','ASSETS','System Bank Account',NULL);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actualinvoice`
--

LOCK TABLES `actualinvoice` WRITE;
/*!40000 ALTER TABLE `actualinvoice` DISABLE KEYS */;
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
  `account_code` varchar(50) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `usd` varchar(200) DEFAULT NULL,
  `account_type` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `swift_code` varchar(200) DEFAULT NULL,
  `bank_branch_address` varchar(200) DEFAULT NULL,
  `branch_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bankdetail`
--

LOCK TABLES `bankdetail` WRITE;
/*!40000 ALTER TABLE `bankdetail` DISABLE KEYS */;
INSERT INTO `bankdetail` VALUES (3,'1502','Link Mark','Yangon','acacacac','usd','KBZ Bank','abcd','yangon',''),(4,'1503','','','','USD','UAB Bank','','','');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coldstore`
--

LOCK TABLES `coldstore` WRITE;
/*!40000 ALTER TABLE `coldstore` DISABLE KEYS */;
/*!40000 ALTER TABLE `coldstore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_coldstore`
--

DROP TABLE IF EXISTS `config_coldstore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_coldstore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_coldstore`
--

LOCK TABLES `config_coldstore` WRITE;
/*!40000 ALTER TABLE `config_coldstore` DISABLE KEYS */;
INSERT INTO `config_coldstore` VALUES (1,'HHK'),(2,'GFC');
/*!40000 ALTER TABLE `config_coldstore` ENABLE KEYS */;
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
  `details` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,'Ko Ko','Fish Supplier','','','',1,0,''),(2,'4 Zaw','Fish Supplier',NULL,NULL,NULL,1,0,''),(3,'4 Zaw (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(4,'AK','Fish Supplier',NULL,NULL,NULL,1,0,''),(5,'Arr Kae','Fish Supplier',NULL,NULL,NULL,1,0,''),(6,'Aung Naing Oo','Fish Supplier',NULL,NULL,NULL,1,0,''),(7,'Bar Bu lay','Fish Supplier',NULL,NULL,NULL,1,0,''),(8,'Chit Oo (D51)','Fish Supplier',NULL,NULL,NULL,1,0,''),(9,'Htet Aung Lin','Fish Supplier',NULL,NULL,NULL,1,0,''),(10,'Htay Win','Fish Supplier',NULL,NULL,NULL,1,0,''),(11,'Kyaw Zay Ya (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(12,'Kyaw Zin','Fish Supplier',NULL,NULL,NULL,1,0,''),(13,'KTO','Fish Supplier',NULL,NULL,NULL,1,0,''),(14,'Kaung Myat','Fish Supplier',NULL,NULL,NULL,1,0,''),(15,'Lie Chit','Fish Supplier',NULL,NULL,NULL,1,0,''),(16,'M.A','Fish Supplier',NULL,NULL,NULL,1,0,''),(17,'Maung Soe','Fish Supplier',NULL,NULL,NULL,1,0,''),(18,'Mg Mg Nyunt','Fish Supplier',NULL,NULL,NULL,1,0,''),(19,'Nanda','Fish Supplier',NULL,NULL,NULL,1,0,''),(20,'Naing Win','Fish Supplier',NULL,NULL,NULL,1,0,''),(21,'Phone Naing','Fish Supplier',NULL,NULL,NULL,1,0,''),(22,'Shwe Late','Fish Supplier',NULL,NULL,NULL,1,0,''),(23,'Shwe Late (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(24,'Soe Min','Fish Supplier',NULL,NULL,NULL,1,0,''),(25,'Si Thu (22)','Fish Supplier',NULL,NULL,NULL,1,0,''),(26,'Si Thu (22) (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(27,'Soe Thein','Fish Supplier',NULL,NULL,NULL,1,0,''),(28,'Soe Thein (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(29,'Soe Naing','Fish Supplier',NULL,NULL,NULL,1,0,''),(30,'Soe Naing (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(31,'Thet Paing','Fish Supplier',NULL,NULL,NULL,1,0,''),(32,'Thein Htay','Fish Supplier',NULL,NULL,NULL,1,0,''),(33,'Thin Thin Yee','Fish Supplier',NULL,NULL,NULL,1,0,''),(34,'Thin Thin Yee (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(35,'Thet Oo','Fish Supplier',NULL,NULL,NULL,1,0,''),(36,'Thar Hla','Fish Supplier',NULL,NULL,NULL,1,0,''),(37,'Thaung Tun','Fish Supplier',NULL,NULL,NULL,1,0,''),(38,'Than Than Myint (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(39,'Tun Zaw Min (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(40,'Win Bo','Fish Supplier',NULL,NULL,NULL,1,0,''),(41,'Win Bo (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(42,'Ye Yint','Fish Supplier',NULL,NULL,NULL,1,0,''),(43,'Zaw Zaw Latt','Fish Supplier',NULL,NULL,NULL,1,0,''),(44,'Zaw Zaw Latt (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(45,'Shwe Myay','Fish Supplier',NULL,NULL,NULL,1,0,''),(46,'Carton Box (Myo Myint Mo Oo)','Fish Supplier',NULL,NULL,NULL,1,0,''),(47,'Carton Box (Myanmar HJ)','Fish Supplier',NULL,NULL,NULL,1,0,''),(48,'Carton Box( Syan Pyae)','Fish Supplier',NULL,NULL,NULL,1,0,''),(49,'Hlaing Htake Khaung','Fish Supplier',NULL,NULL,NULL,1,0,''),(50,'GFC','Fish Supplier',NULL,NULL,NULL,1,0,''),(51,'Aung Kyaw Moe','Fish Supplier',NULL,NULL,NULL,1,0,''),(52,'Aung Myo Min','Fish Supplier',NULL,NULL,NULL,1,0,''),(53,'Aung Zaw Oo','Fish Supplier',NULL,NULL,NULL,1,0,''),(54,'A Thay Lay','Fish Supplier',NULL,NULL,NULL,1,0,''),(55,'Cho Mg','Fish Supplier',NULL,NULL,NULL,1,0,''),(56,'Kyaw Zay Ya','Fish Supplier',NULL,NULL,NULL,1,0,''),(57,'Ka Yin Lay','Fish Supplier',NULL,NULL,NULL,1,0,''),(58,'Khin Mg Myint','Fish Supplier',NULL,NULL,NULL,1,0,''),(59,'Mg Mg Soe','Fish Supplier',NULL,NULL,NULL,1,0,''),(60,'Moe Kyaw','Fish Supplier',NULL,NULL,NULL,1,0,''),(61,'Parami (Balachaung)','Fish Supplier',NULL,NULL,NULL,1,0,''),(62,'Tun Zaw Min','Fish Supplier',NULL,NULL,NULL,1,0,''),(63,'Zaw Myat Thu','Fish Supplier',NULL,NULL,NULL,1,0,''),(64,'Ko Ma Noe','Fish Supplier',NULL,NULL,NULL,1,0,''),(65,'Dry Fish (Shwe Hinn Thar)','Fish Supplier',NULL,NULL,NULL,1,0,''),(66,'Dry Fish (Myo Thant)','Fish Supplier',NULL,NULL,NULL,1,0,''),(67,'Kyaw Thein Than','Fish Supplier',NULL,NULL,NULL,1,0,''),(68,'GM','Fish Supplier',NULL,NULL,NULL,1,0,''),(69,'Dry Fish (Zabu Thein)','Fish Supplier',NULL,NULL,NULL,1,0,''),(70,'Ko Myo','Fish Supplier',NULL,NULL,NULL,1,0,''),(71,'Market By','Fish Supplier',NULL,NULL,NULL,1,0,''),(72,'Tun Tun','Fish Supplier',NULL,NULL,NULL,1,0,''),(73,'Min Lwin','Fish Supplier',NULL,NULL,NULL,1,0,''),(74,'Khaing Lay','Fish Supplier',NULL,NULL,NULL,1,0,''),(75,'Thet Lwin','Fish Supplier',NULL,NULL,NULL,1,0,''),(76,'Nay Lin','Fish Supplier',NULL,NULL,NULL,1,0,''),(77,'Tun Naing','Fish Supplier',NULL,NULL,NULL,1,0,''),(78,'Ko Pan','Fish Supplier',NULL,NULL,NULL,1,0,''),(79,'Aye Ko','Fish Supplier',NULL,NULL,NULL,1,0,''),(80,'Nyan Tun','Fish Supplier',NULL,NULL,NULL,1,0,''),(81,'Thet Oo (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(82,'Aung Zaw Oo (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(83,'Aye Htike Ko','Fish Supplier',NULL,NULL,NULL,1,0,''),(84,'Mg Mg Nyunt (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(85,'Arr Kae (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(86,'Thiha','Fish Supplier',NULL,NULL,NULL,1,0,''),(87,'Ko Hlawn','Fish Supplier',NULL,NULL,NULL,1,0,''),(88,'Aung Kyaw Moe (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(89,'Aye Htike Ko (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(90,'Kaung Myat Tun','Fish Supplier',NULL,NULL,NULL,1,0,''),(91,'Than Soe','Fish Supplier',NULL,NULL,NULL,1,0,''),(92,'Than Than Myint','Fish Supplier',NULL,NULL,NULL,1,0,''),(93,'San San Yee','Fish Supplier',NULL,NULL,NULL,1,0,''),(94,'Tun Kyaw','Fish Supplier',NULL,NULL,NULL,1,0,''),(95,'Tommy','Fish Supplier',NULL,'09977221152','Yangon',1,0,''),(96,'Carton Box (Pan Thazin)','Fish Supplier',NULL,NULL,NULL,1,0,''),(97,'Dalian Ice','Fish Supplier',NULL,NULL,NULL,1,0,''),(98,'Plastic (Golden Fish)','Fish Supplier',NULL,NULL,NULL,1,0,''),(99,'Ko Ka Lar','Fish Supplier',NULL,NULL,NULL,1,0,''),(100,'Ar Kar','Fish Supplier',NULL,NULL,NULL,1,0,''),(101,'Win Aye','Fish Supplier',NULL,NULL,NULL,1,0,''),(102,'Bar Bu Lay (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(103,'Promise (Inner Box)','Fish Supplier',NULL,NULL,NULL,1,0,''),(104,'Kyaw Min Lat','Fish Supplier',NULL,NULL,NULL,1,0,''),(105,'Kyaw Lin Tun','Fish Supplier',NULL,NULL,NULL,1,0,''),(106,'Kyi Lwin','Fish Supplier',NULL,NULL,NULL,1,0,''),(107,'Golden Bag','Fish Supplier',NULL,NULL,NULL,1,0,''),(108,'Chit Ko','Fish Supplier',NULL,NULL,NULL,1,0,''),(109,'O.D.A','Fish Supplier',NULL,NULL,NULL,1,0,''),(110,'Tin Hlaing','Fish Supplier',NULL,NULL,NULL,1,0,''),(111,'Ko Min','Fish Supplier',NULL,NULL,NULL,1,0,''),(112,'Aung Kyaw','Fish Supplier',NULL,NULL,NULL,1,0,''),(113,'Zaw Win Naing','Fish Supplier',NULL,NULL,NULL,1,0,''),(114,'Zay Yar Lin','Fish Supplier',NULL,NULL,NULL,1,0,''),(115,'Thein Linn Oo','Fish Supplier',NULL,NULL,NULL,1,0,''),(116,'Soe Min (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(117,'Carton Box (Win Pyae)','Fish Supplier',NULL,NULL,NULL,1,0,''),(118,'Kyaw Min Latt (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(119,'Aung Kyaw (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(120,'Tin Hlaing (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(121,'A Nge Lay','Fish Supplier',NULL,NULL,NULL,1,0,''),(122,'A.K (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(123,'Ye Yint (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(124,'Zaw Win Naing (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(125,'Phoe Zaw','Fish Supplier',NULL,NULL,NULL,1,0,''),(126,'Carton Box (May Kha San)','Fish Supplier',NULL,NULL,NULL,1,0,''),(127,'Aye Aye Maw','Fish Supplier',NULL,NULL,NULL,1,0,''),(128,'Aung Tun','Fish Supplier',NULL,NULL,NULL,1,0,''),(129,'Win Thein','Fish Supplier',NULL,NULL,NULL,1,0,''),(130,'Thet Paing (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(131,'Aung Naing Oo (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(132,'A Nge Lay (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(133,'Phoe Zaw (TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(134,'Peter','Fish Supplier',NULL,NULL,NULL,1,0,''),(135,'Ye Ko','Fish Supplier',NULL,NULL,NULL,1,0,''),(136,'Aung Kyaw Thant','Fish Supplier',NULL,NULL,NULL,1,0,''),(137,'Kyaw Zin Phyo','Fish Supplier',NULL,NULL,NULL,1,0,''),(138,'Hman Kyi','Fish Supplier',NULL,NULL,NULL,1,0,''),(139,'Oak Kar','Fish Supplier',NULL,NULL,NULL,1,0,''),(140,'Hla Hla Win','Fish Supplier',NULL,NULL,NULL,1,0,''),(141,'Thin Zar','Fish Supplier',NULL,NULL,NULL,1,0,''),(142,'ACE (Myanmar) USD A/C','Fish Supplier',NULL,NULL,NULL,1,0,''),(143,'Cho Mg(TCL)','Fish Supplier',NULL,NULL,NULL,1,0,''),(145,'Other Receivable-Best Brand A/C','Export Customer','','','',0,1,''),(146,'South Asia Food-USA A/C','Export Customer','','','56-27/56-56th Drive Maspath, NY 11378',0,1,'Importer & Wholesaler of Dry & Frozen Foods'),(147,'Jamuna Food-Canada A/C','Export Customer','','6786876','5070 Sixth Line, Milton.Onl9p0w7, Toronto, Canada',0,1,'Importer & Wholesaler of Dry & Frozen Foods'),(148,'ITALY','Export Customer',NULL,NULL,'',0,1,''),(149,'Western Trader (Kolkata)','Export Customer',NULL,NULL,'',0,1,''),(150,'Bangladesh (Frozen)','Export Customer',NULL,NULL,'',0,1,''),(151,'Bangladesh (Chill/Technak)','Export Customer',NULL,NULL,'',0,1,''),(152,'BRUNEI A/C','Export Customer',NULL,NULL,'',0,1,''),(153,'SC Fruit A/C - Mango A/C','Export Customer',NULL,NULL,'',0,1,''),(154,'SC Fruit A/C - Apple A/C','Export Customer',NULL,NULL,'',0,1,''),(155,'H - Trader A/C','Export Customer',NULL,NULL,'',0,1,''),(156,'Link Mark Impex','Export Customer',NULL,NULL,'',0,1,''),(157,'Customer B','Export Customer','','','',0,1,'this is testing details');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exchange_rates`
--

LOCK TABLES `exchange_rates` WRITE;
/*!40000 ALTER TABLE `exchange_rates` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form10stock`
--

LOCK TABLES `form10stock` WRITE;
/*!40000 ALTER TABLE `form10stock` DISABLE KEYS */;
INSERT INTO `form10stock` VALUES (1,'2026-09-18','4','2','can','frozen','1.5up',0,5,'70',0,'',0,'',0,'70','','G'),(2,'2026-09-18','4','2','can','frozen','2up',0,12,'20',0,'',0,'',0,'20','','G');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form10stocktcl`
--

LOCK TABLES `form10stocktcl` WRITE;
/*!40000 ALTER TABLE `form10stocktcl` DISABLE KEYS */;
INSERT INTO `form10stocktcl` VALUES (1,'2026-09-18','25','','daka','TCL','5up',0,10,'160',0,'',0,'',0,0,0,0,0,0,0,0,0,0,0,'160','');
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form7stock`
--

LOCK TABLES `form7stock` WRITE;
/*!40000 ALTER TABLE `form7stock` DISABLE KEYS */;
INSERT INTO `form7stock` VALUES (3,'2026-09-17','2','4 Zaw','Can','Frozen','2up','78','127.452','0',0,4,0,'G'),(4,'2026-09-17','2','4 Zaw','Can','Frozen','3up','80','130.72','0',0,5,0,'G'),(5,'2026-09-17','4','4 Zaw','Can','Frozen','1.5up','50','81.7','0',0,6,0,'G'),(6,'2026-09-17','4','4 Zaw','Can','Frozen','2up','','','',2,6,0,'G');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `form7stocktcl`
--

LOCK TABLES `form7stocktcl` WRITE;
/*!40000 ALTER TABLE `form7stocktcl` DISABLE KEYS */;
INSERT INTO `form7stocktcl` VALUES (1,'2026-09-17','25','A Nge Lay (TCL)','Daka','TCl','5up','100','163.4','0',0,7);
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `general_ledger`
--

LOCK TABLES `general_ledger` WRITE;
/*!40000 ALTER TABLE `general_ledger` DISABLE KEYS */;
INSERT INTO `general_ledger` VALUES (4,'2026-09-17','89898','5000','1131000','0','Purchase Line Item','PR-1789629564'),(5,'2026-09-17','89898','5000','1200000','0','Purchase Line Item','PR-1789629564'),(6,'2026-09-17','89898','2000','0','2331000','Total Bill - 4 Zaw','PR-1789629564'),(7,'2026-09-17','122','5000','1000000','0','Purchase Line Item','PR-1789629846'),(8,'2026-09-17','122','2000','0','1000000','Total Bill - 4 Zaw','PR-1789629846'),(9,'2026-09-17','11','2000','1000000','0','Payment to 4 Zaw - Ref: 11','PAY-1789629868'),(10,'2026-09-17','11','1501','0','1000000','Payment to 4 Zaw - Ref: 11','PAY-1789629868'),(11,'2026-09-17','12287','5000','2100000','0','Purchase Line Item','PR-1789633476'),(12,'2026-09-17','12287','2000','0','2100000','Total Bill - A Nge Lay (TCL)','PR-1789633476'),(13,'2026-09-17','67','5001','50600','0','Purchase Line Item','PR-1789641216'),(14,'2026-09-17','67','2000','0','50600','Total Bill - Shwe Myay','PR-1789641216'),(15,'2026-09-21','INV-001','200','0','12000000','Sale Revenue (Cont: C-001)','SL-1789973310'),(16,'2026-09-21','INV-001','200','0','15000000','Sale Revenue (Cont: C-002)','SL-1789973310'),(17,'2026-09-21','INV-001','600','27000000','0','Total Invoice - Western Trader (Kolkata)','SL-1789973310');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gfcfishcoldstore`
--

LOCK TABLES `gfcfishcoldstore` WRITE;
/*!40000 ALTER TABLE `gfcfishcoldstore` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gfcfishlabour`
--

LOCK TABLES `gfcfishlabour` WRITE;
/*!40000 ALTER TABLE `gfcfishlabour` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gfcmcstock`
--

LOCK TABLES `gfcmcstock` WRITE;
/*!40000 ALTER TABLE `gfcmcstock` DISABLE KEYS */;
INSERT INTO `gfcmcstock` VALUES (1,'can','hhktogfc','2026-09-17','4','3up','22',10,10,'G','','','','','','','',9),(2,'Can','Balance','2026-09-17','4','3up','23',22,22,'G','','','','','','','',0),(3,'can','Ship/','2026-09-17','4','3up','22',2,8,'G','','','','','','','',0),(4,'NY','Balance','2026-09-20','10','3up','25',30,30,'G','','','','','','','',0);
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hhkmcstock`
--

LOCK TABLES `hhkmcstock` WRITE;
/*!40000 ALTER TABLE `hhkmcstock` DISABLE KEYS */;
INSERT INTO `hhkmcstock` VALUES (1,'can','balance','2026-09-17','2','2up','21',67,67,'','',0,'','',0,'','G'),(2,'can','balance','2026-09-17','4','3up','22',20,20,'','',0,'','',0,'','G'),(3,'can','balance','2026-09-17','2','2up','22',10,10,'','',0,'','',0,'','G'),(4,'can','balance','2026-09-17','4','3up','23',16,16,'','',0,'','',0,'','G'),(5,'can','fromform10','2026-09-17','4','3up','22',5,25,'','',0,'','',0,'','G'),(6,'can','fromform10','2026-09-17','4','3up','23',3,19,'','',0,'','',0,'','G'),(7,'can','fromform10','2026-09-17','4','3up','20',2,2,'','',0,'','',0,'','G'),(8,'can','repackingout','2026-09-17','4','3up','22',2,23,'','',0,'','',0,'','G'),(9,'can','hhktogfc','2026-09-17','4','3up','22',10,13,'','',0,'','',0,'','G'),(10,'can','balance','2026-09-21','10','5up','23',10,10,'','',0,'','',0,'','G'),(11,'can','balance','2026-09-21','11','5up','20',10,10,'','',0,'','',0,'','G'),(12,'can','balance','2026-09-21','16','5up','25',5,5,'','',0,'','',0,'','G'),(13,'NY','balance','2026-09-21','39','5up','20',10,10,'','',0,'','',0,'','G'),(14,'can','fromform10','2026-09-21','4','15up','20',10,10,'','',0,'','',0,'','G');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hhkstock`
--

LOCK TABLES `hhkstock` WRITE;
/*!40000 ALTER TABLE `hhkstock` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice_costing`
--

LOCK TABLES `invoice_costing` WRITE;
/*!40000 ALTER TABLE `invoice_costing` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material_store_house`
--

LOCK TABLES `material_store_house` WRITE;
/*!40000 ALTER TABLE `material_store_house` DISABLE KEYS */;
INSERT INTO `material_store_house` VALUES (1,'2026-09-17','17:03:36','67','','45',65,22,NULL,NULL,''),(2,'2026-09-17','17:04:13','434','','45',65,NULL,5,3,''),(3,'2026-09-17','17:05:03','23','','45',65,NULL,5,4,'');
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
  `bank_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packingliststock`
--

LOCK TABLES `packingliststock` WRITE;
/*!40000 ALTER TABLE `packingliststock` DISABLE KEYS */;
INSERT INTO `packingliststock` VALUES (1,'2026-09-21','146','United Stat','112222','12411','Jarvis','ToooNY','1231',3);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packingliststockinfo`
--

LOCK TABLES `packingliststockinfo` WRITE;
/*!40000 ALTER TABLE `packingliststockinfo` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packingmaterial`
--

LOCK TABLES `packingmaterial` WRITE;
/*!40000 ALTER TABLE `packingmaterial` DISABLE KEYS */;
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
INSERT INTO `permission` VALUES (1,1,'manage_accounts,manage_role,manage_sale,manage_purchase,manage_acpayable,manage_acreceivable,manage_general_ledger,manage_contacts,manage_products,manage_product_types,manage_currency,manage_coa,manage_coldstoreitem,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,sale_report,purchase_report,payable_report,manage_mcreport,manage_tclmcstock,manage_generalledger,material_store_house,material_gatepass,configuration_coldstore,packing_material_report,profit_loss_report,manage_manual_journals,manage_bank'),(2,2,',manage_products,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_mcreport,manage_tclmcstock'),(3,3,',manage_coldstoreitem,manage_coldstorecharges,manage_shippmentexport,manage_truckexport'),(4,4,',manage_purchase,manage_cashbook,manage_acpayable,manage_accountreceivable,manage_transaction,manage_general_ledger,manage_contacts,manage_coldstoreitem,manage_products,manage_coa,manage_unit,manage_coldstorecharges,manage_form7,manage_form10,manage_hhkmcstock,manage_gfcmcstock,manage_stockreport,manage_shippmentexport,manage_truckexport,manage_packingmaterial,sale_report,purchase_report,payable_report,manage_mcreport,manage_tclmcstock,profit_loss_report,manage_manual_journals'),(5,5,',manage_coldstoreitem,manage_coldstorecharges'),(6,6,',manage_stockreport,sale_report,purchase_report,payable_report,manage_mcreport,manage_generalledger,packing_material_report,profit_loss_report');
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
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (2,'A001','Ayer',NULL,1,NULL,1,'5000',0,NULL),(3,'B001','Boal',NULL,1,NULL,1,'5000',0,NULL),(4,'B002','Bata',NULL,1,NULL,1,'5000',0,NULL),(5,'B003','Baila',NULL,1,NULL,1,'5000',0,NULL),(6,'B004','Batashi',NULL,1,NULL,1,'5000',0,NULL),(7,'B005','Balachaung',NULL,1,NULL,1,'5000',0,NULL),(8,'B006','Black Pomfret',NULL,1,NULL,1,'5000',0,NULL),(9,'C001','Chitol',NULL,1,NULL,1,'5000',0,NULL),(10,'C002','CP',NULL,1,NULL,1,'5000',0,NULL),(11,'D001','D Puti',NULL,1,NULL,1,'5000',0,NULL),(12,'D002','Dry Anchovy',NULL,1,NULL,1,'5000',0,NULL),(13,'D003','Dry Lotia',NULL,1,NULL,1,'5000',0,NULL),(14,'D004','Dry Shoil',NULL,1,NULL,1,'5000',0,NULL),(15,'G001','Grouper',NULL,1,NULL,1,'5000',0,NULL),(16,'H001','Hilsa',NULL,1,NULL,1,'5000',0,NULL),(17,'K001','Kalibouse',NULL,1,NULL,1,'5000',0,NULL),(18,'K002','Katla',NULL,1,NULL,1,'5000',0,NULL),(19,'K003','Keski',NULL,1,NULL,1,'5000',0,NULL),(20,'K004','Koi',NULL,1,NULL,1,'5000',0,NULL),(21,'K005','Koral',NULL,1,NULL,1,'5000',0,NULL),(22,'L001','Lakka',NULL,1,NULL,1,'5000',0,NULL),(23,'L002','Lotia',NULL,1,NULL,1,'5000',0,NULL),(24,'M001','Mrigal',NULL,1,NULL,1,'5000',0,NULL),(25,'P001','Pangush',NULL,1,NULL,1,'5000',0,NULL),(26,'P002','Pujanut',NULL,1,NULL,1,'5000',0,NULL),(27,'P003','Puti',NULL,1,NULL,1,'5000',0,NULL),(28,'R001','Red Snapper',NULL,1,NULL,1,'5000',0,NULL),(29,'R002','Ribbon Fish',NULL,1,NULL,1,'5000',0,NULL),(30,'R003','Rita',NULL,1,NULL,1,'5000',0,NULL),(31,'S001','Shoil',NULL,1,NULL,1,'5000',0,NULL),(32,'R004','Rohu',NULL,1,NULL,1,'5000',0,NULL),(33,'S002','Spanish Mackreal',NULL,1,NULL,1,'5000',0,NULL),(34,'S003','Star Baim',NULL,1,NULL,1,'5000',0,NULL),(35,'T001','Taposhi',NULL,1,NULL,1,'5000',0,NULL),(36,'T002','Tengra',NULL,1,NULL,1,'5000',0,NULL),(37,'T003','Tilapia',NULL,1,NULL,1,'5000',0,NULL),(38,'W001','WP',NULL,1,NULL,1,'5000',0,NULL),(39,'P004','PPP',NULL,1,NULL,1,'5000',0,NULL),(40,'P005','Puti (G)',NULL,1,NULL,1,'5000',0,NULL),(41,'G002','Grass Carp',NULL,1,NULL,1,'5000',0,NULL),(42,'P006','Poa',NULL,1,NULL,1,'5000',0,NULL),(43,'M002','Moila',NULL,1,NULL,1,'5000',0,NULL),(44,'B007','Baga Ayer',NULL,1,NULL,1,'5000',0,NULL),(45,'T004','Taki',NULL,1,NULL,1,'5000',0,NULL),(46,'R005','Rohu Scaless',NULL,1,NULL,1,'5000',0,NULL),(47,'H002','Haluwa',NULL,1,NULL,1,'5000',0,NULL),(48,'B008','Baby Koral',NULL,1,NULL,1,'5000',0,NULL),(49,'R006','River Pangush',NULL,1,NULL,1,'5000',0,NULL),(50,'B009','Basa',NULL,1,NULL,1,'5000',0,NULL),(61,'PKG001','Carton Box (Master)',NULL,2,NULL,1,'5001',0,NULL),(62,'PKG002','Inner Box',NULL,2,NULL,1,'5001',0,NULL),(63,'PKG003','Plastic Bag (Polybag)',NULL,2,NULL,1,'5001',0,NULL),(64,'PKG004','Golden Bag',NULL,2,NULL,1,'5001',0,NULL),(65,'PKG005','Strapping Tape',NULL,2,NULL,1,'5001',0,NULL),(66,'PKG006','Adhesive Tape',NULL,2,NULL,1,'5001',0,NULL),(67,'PKG007','Bubble Wrap',NULL,2,NULL,1,'5001',0,NULL),(68,'PKG008','Styrofoam Box',NULL,2,NULL,1,'5001',0,NULL),(69,'PKG009','Label Sticker',NULL,2,NULL,1,'5001',0,NULL),(70,'PKG010','Vacuum Pouch',NULL,2,NULL,1,'5001',0,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_lines`
--

LOCK TABLES `purchase_lines` WRITE;
/*!40000 ALTER TABLE `purchase_lines` DISABLE KEYS */;
INSERT INTO `purchase_lines` VALUES (4,1,2,5000,'','2up',78.00,0,14500.00,1131000.00),(5,1,2,5000,'','3up',80.00,0,15000.00,1200000.00),(6,2,4,5000,'','1.5up',50.00,0,20000.00,1000000.00),(7,3,25,5000,'','5up',100.00,0,21000.00,2100000.00),(8,4,65,5001,'','',0.00,22,2300.00,50600.00);
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
  `reference` varchar(100) NOT NULL,
  `check_number` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `fk_purchase_payment_id` (`purchase_id`),
  KEY `fk_purchase_payment_account` (`payment_account`)
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchases`
--

LOCK TABLES `purchases` WRITE;
/*!40000 ALTER TABLE `purchases` DISABLE KEYS */;
INSERT INTO `purchases` VALUES (1,'89898',2,'2026-09-17','Frozen',NULL,'MMK',1.0000,'AWAITING_PAYMENT',2331000.00,2331000.00,1000000.00,'2026-09-17 07:17:03'),(2,'122',2,'2026-09-17','Frozen',NULL,'MMK',1.0000,'AWAITING_PAYMENT',1000000.00,1000000.00,0.00,'2026-09-17 07:18:41'),(3,'12287',132,'2026-09-17','tcl',NULL,'MMK',1.0000,'AWAITING_PAYMENT',2100000.00,2100000.00,0.00,'2026-09-17 08:24:36'),(4,'67',45,'2026-09-17','Material',NULL,'MMK',1.0000,'AWAITING_PAYMENT',50600.00,50600.00,0.00,'2026-09-17 10:33:36');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
-- Table structure for table `sale_lines`
--

DROP TABLE IF EXISTS `sale_lines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_lines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `container_no` varchar(100) DEFAULT NULL,
  `account_id` varchar(50) DEFAULT NULL,
  `line_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `fk_sale_id` (`sale_id`),
  KEY `fk_account_id` (`account_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_lines`
--

LOCK TABLES `sale_lines` WRITE;
/*!40000 ALTER TABLE `sale_lines` DISABLE KEYS */;
INSERT INTO `sale_lines` VALUES (1,1,'C-001','200',12000000.00),(2,1,'C-002','200',15000000.00);
/*!40000 ALTER TABLE `sale_lines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale_payments`
--

DROP TABLE IF EXISTS `sale_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sale_payments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_account` varchar(50) NOT NULL,
  `reference` varchar(100) NOT NULL,
  `check_number` varchar(50) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`id`),
  KEY `fk_sale_payment_id` (`sale_id`),
  KEY `fk_sale_payment_account` (`payment_account`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale_payments`
--

LOCK TABLES `sale_payments` WRITE;
/*!40000 ALTER TABLE `sale_payments` DISABLE KEYS */;
INSERT INTO `sale_payments` VALUES (1,1,'2026-09-21','1501','56556','','Noteee',20000000.00);
/*!40000 ALTER TABLE `sale_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `contact_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `due_date` date DEFAULT NULL,
  `voucher_no` varchar(100) NOT NULL,
  `currency` varchar(20) DEFAULT NULL,
  `exchange_rate` decimal(15,4) NOT NULL DEFAULT 1.0000,
  `grand_total` decimal(15,2) NOT NULL DEFAULT 0.00,
  `paid_amount` decimal(15,2) NOT NULL DEFAULT 0.00,
  `status` varchar(50) NOT NULL DEFAULT 'DRAFT',
  PRIMARY KEY (`id`),
  KEY `fk_contact_id` (`contact_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,149,'2026-09-21',NULL,'INV-001','USD',1.0000,27000000.00,20000000.00,'AWAITING_PAYMENT');
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
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
  `description` varchar(255) DEFAULT NULL,
  `group_name` text DEFAULT NULL,
  `material_id` varchar(255) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_output_group`
--

LOCK TABLES `stock_output_group` WRITE;
/*!40000 ALTER TABLE `stock_output_group` DISABLE KEYS */;
INSERT INTO `stock_output_group` VALUES (3,'2026-09-17','17:04:13','HHK',434,NULL,NULL,'65',5),(4,'2026-09-17','17:05:03','GFC',23,NULL,NULL,'65',5);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tclmcstock`
--

LOCK TABLES `tclmcstock` WRITE;
/*!40000 ALTER TABLE `tclmcstock` DISABLE KEYS */;
INSERT INTO `tclmcstock` VALUES (1,'2026-09-17','25','5up',80,200,0,45,'',0,'31',15,0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `total_charges`
--

LOCK TABLES `total_charges` WRITE;
/*!40000 ALTER TABLE `total_charges` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truckactualinvoice`
--

LOCK TABLES `truckactualinvoice` WRITE;
/*!40000 ALTER TABLE `truckactualinvoice` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truckpackingliststock`
--

LOCK TABLES `truckpackingliststock` WRITE;
/*!40000 ALTER TABLE `truckpackingliststock` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truckpackingliststockinfo`
--

LOCK TABLES `truckpackingliststockinfo` WRITE;
/*!40000 ALTER TABLE `truckpackingliststockinfo` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=918 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userlogs`
--

LOCK TABLES `userlogs` WRITE;
/*!40000 ALTER TABLE `userlogs` DISABLE KEYS */;
INSERT INTO `userlogs` VALUES (870,'10:40:59.000000','2026-06-22','admin@gmail.com','protechadmin','Login Failed'),(871,'10:41:02.000000','2026-06-22','admin@gmail.com','password','Login Failed'),(872,'10:41:15.000000','2026-06-22','admin@gmail.com','protechadmin','Login Failed'),(873,'10:41:23.000000','2026-06-22','Administrator','protechadmin2024***','Login Success'),(874,'08:48:10.000000','2026-06-25','Administrator','','Logout Success'),(875,'12:57:23.000000','2026-06-29','Administrator','protechadmin2024***','Login Success'),(876,'03:30:48.000000','2026-07-02','Administrator','','Logout Success'),(877,'03:30:56.000000','2026-07-02','UMyoWinSwe','password','Login Success'),(878,'03:31:05.000000','2026-07-02','UMyoWinSwe','','Logout Success'),(879,'03:31:06.000000','2026-07-02','Administrator','protechadmin2024***','Login Success'),(880,'03:31:39.000000','2026-07-02','Administrator','','Logout Success'),(881,'03:31:46.000000','2026-07-02','Administrator','protechadmin2024***','Login Success'),(882,'03:31:57.000000','2026-07-02','Administrator','','Logout Success'),(883,'03:32:04.000000','2026-07-02','UMyoWinSwe','password','Login Success'),(884,'03:35:52.000000','2026-07-02','UMyoWinSwe','','Logout Success'),(885,'03:35:53.000000','2026-07-02','Administrator','protechadmin2024***','Login Success'),(886,'02:02:45.000000','2026-08-11','Administrator','','Logout Success'),(887,'02:02:49.000000','2026-08-11','Administrator','protechadmin2024***','Login Success'),(888,'05:26:32.000000','2026-08-24','Administrator','','Logout Success'),(889,'05:26:49.000000','2026-08-24','UMyoWinSwe','password','Login Success'),(890,'05:27:06.000000','2026-08-24','UMyoWinSwe','','Logout Success'),(891,'05:27:08.000000','2026-08-24','Administrator','protechadmin2024***','Login Success'),(892,'10:00:01.000000','2026-09-03','Administrator','','Logout Success'),(893,'10:00:32.000000','2026-09-03','Administrator','protechadmin2024***','Login Success'),(894,'10:33:05.000000','2026-09-03','Administrator','','Logout Success'),(895,'10:33:07.000000','2026-09-03','admin@gmail.com','admin','Login Failed'),(896,'10:33:11.000000','2026-09-03','Administrator','protechadmin2024***','Login Success'),(897,'10:33:50.000000','2026-09-03','Administrator','','Logout Success'),(898,'10:33:55.000000','2026-09-03','Administrator','protechadmin2024***','Login Success'),(899,'11:21:29.000000','2026-09-03','Administrator','','Logout Success'),(900,'11:23:55.000000','2026-09-03','admin@gmail.com','admin','Login Failed'),(901,'11:23:56.000000','2026-09-03','admin@gmail.com','admin','Login Failed'),(902,'11:23:59.000000','2026-09-03','Administrator','protechadmin2024***','Login Success'),(903,'11:24:01.000000','2026-09-03','Administrator','','Logout Success'),(904,'11:24:04.000000','2026-09-03','admin@gmail.com','admin','Login Failed'),(905,'11:24:04.000000','2026-09-03','admin@gmail.com','admin','Login Failed'),(906,'11:24:12.000000','2026-09-03','Administrator','protechadmin2','Login Password Invalid'),(907,'11:24:13.000000','2026-09-03','admin@gmail.com','admin','Login Failed'),(908,'11:24:26.000000','2026-09-03','Administrator','protechadmin2024***','Login Success'),(909,'11:51:41.000000','2026-09-03','Administrator','','Logout Success'),(910,'11:51:42.000000','2026-09-03','Administrator','protechadmin2024***','Login Success'),(911,'11:01:58.000000','2026-09-15','Administrator','protechadmin2024***','Login Success'),(912,'10:51:07.000000','2026-09-17','Administrator','protechadmin2024***','Login Success'),(913,'04:56:14.000000','2026-09-18','Administrator','protechadmin2024***','Login Success'),(914,'10:01:29.000000','2026-09-21','Administrator','protechadmin2024***','Login Success'),(915,'10:08:58.000000','2026-09-21','Administrator','','Logout Success'),(916,'10:09:02.000000','2026-09-21','Administrator','protechadmin2024***','Login Success'),(917,'09:57:52.000000','2026-09-22','Administrator','protechadmin2024***','Login Success');
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

-- Dump completed on 2026-09-22 14:40:46
