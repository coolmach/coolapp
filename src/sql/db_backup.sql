-- MySQL dump 10.11
--
-- Host: localhost    Database: cbuddydb
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt-log

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
-- Temporary table structure for view `aircooler_posts`
--

DROP TABLE IF EXISTS `aircooler_posts`;
/*!50001 DROP VIEW IF EXISTS `aircooler_posts`*/;
/*!50001 CREATE TABLE `aircooler_posts` (
  `POST_ID` int(11),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `TONNAGE` double,
  `AC_TYPE` varchar(8),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32),
  `TITLE` varchar(256),
  `CONTACT_NO` varchar(16),
  `CONTACT_PERSON_NAME` varchar(32),
  `DESCRIPTION` varchar(512),
  `IMAGE_FILE_NAME` varchar(64),
  `CORP_ID` decimal(10,0),
  `post_status` varchar(8)
) */;

--
-- Temporary table structure for view `automobile_posts`
--

DROP TABLE IF EXISTS `automobile_posts`;
/*!50001 DROP VIEW IF EXISTS `automobile_posts`*/;
/*!50001 CREATE TABLE `automobile_posts` (
  `POST_ID` decimal(10,0),
  `SUB_CATEGORY` varchar(8),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `MAKE` varchar(32),
  `MODEL` varchar(32),
  `COLOR` varchar(16),
  `YEAR` decimal(4,0),
  `NO_OF_OWNERS` decimal(2,0),
  `FUEL_TYPE` varchar(1),
  `KMS_DONE` decimal(9,0),
  `MILEAGE` decimal(4,0),
  `PRICE` decimal(9,3),
  `PRICE_NEGOTIABLE` varchar(1),
  `INSURANCE_AVAILABLE` varchar(1),
  `REG_NO` varchar(32),
  `REG_CITY` varchar(8),
  `REG_STATE` varchar(8),
  `CREATED_ON` datetime,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` datetime,
  `MODIFIED_BY` varchar(32),
  `TITLE` varchar(256),
  `CONTACT_NO` varchar(16),
  `CONTACT_PERSON_NAME` varchar(32),
  `DESCRIPTION` varchar(512),
  `IMAGE_FILE_NAME` varchar(64),
  `CORP_ID` decimal(10,0),
  `post_status` varchar(8)
) */;

--
-- Temporary table structure for view `camera_posts`
--

DROP TABLE IF EXISTS `camera_posts`;
/*!50001 DROP VIEW IF EXISTS `camera_posts`*/;
/*!50001 CREATE TABLE `camera_posts` (
  `POST_ID` int(11),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `RESOLUTION` varchar(8),
  `ZOOM` varchar(8),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32),
  `TITLE` varchar(256),
  `CONTACT_NO` varchar(16),
  `CONTACT_PERSON_NAME` varchar(32),
  `DESCRIPTION` varchar(512),
  `IMAGE_FILE_NAME` varchar(64),
  `CORP_ID` decimal(10,0),
  `post_status` varchar(8)
) */;

--
-- Temporary table structure for view `city`
--

DROP TABLE IF EXISTS `city`;
/*!50001 DROP VIEW IF EXISTS `city`*/;
/*!50001 CREATE TABLE `city` (
  `STATE_CODE` varchar(8),
  `CITY_CODE` varchar(8),
  `CITY_NAME` varchar(32),
  `created_on` datetime,
  `created_by` varchar(32),
  `modified_on` datetime,
  `modified_by` varchar(32)
) */;

--
-- Table structure for table `city_master`
--

DROP TABLE IF EXISTS `city_master`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `city_master` (
  `STATE_CODE` varchar(8) NOT NULL default '',
  `CITY_CODE` varchar(8) NOT NULL default '',
  `CITY_NAME` varchar(32) default NULL,
  `created_on` datetime default NULL,
  `created_by` varchar(32) default NULL,
  `modified_on` datetime default NULL,
  `modified_by` varchar(32) default NULL,
  PRIMARY KEY  (`CITY_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `city_master`
--

LOCK TABLES `city_master` WRITE;
/*!40000 ALTER TABLE `city_master` DISABLE KEYS */;
INSERT INTO `city_master` VALUES ('UP','AGRA','Agra','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('GJ','AHMD','Ahmedabad','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('MP','BHOP','Bhopal','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('KA','BLR','Bangalore','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('OR','BUBH','Bhubaneswar','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('TN','CBE','Coimbatore','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('TN','CHE','Chennai','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('DL','DEL','New Delhi','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('HR','GURG','Gurgaon','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('AP','HYD','Hyderabad','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('MN','IMPH','Imphal','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('MP','INDO','Indore','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('RJ','JAIP','Jaipur','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('RJ','JODH','Jodhpur','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('WB','KOL','Kolkata','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('UP','LUCK','Lucknow','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('MH','MUM','Mumbai','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('KA','MYS','Mysore','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('MH','NAG','Nagpur','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('UP','NOI','Noida','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('GA','PAN','Panaji','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('MH','PUN','Pune','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('CH','RAIP','Raipur','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('HP','SHIM','Shimla','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('KL','TVM','Thiruvananthapuram','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('AP','VIJ','Vijayawada','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM'),('AP','VIZ','Visakhapatnam','2014-06-08 02:05:08','SYSTEM','2014-06-08 02:05:08','SYSTEM');
/*!40000 ALTER TABLE `city_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cocd`
--

DROP TABLE IF EXISTS `cocd`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `cocd` (
  `DB_TS` decimal(9,0) default NULL,
  `BANK_ID` varchar(8) default NULL,
  `CODE_TYPE` varchar(16) default NULL,
  `CM_CODE` varchar(16) default NULL,
  `CD_DESC` varchar(256) default NULL,
  `DEL_FLG` char(1) default NULL,
  `R_CRE_ID` varchar(32) default NULL,
  `R_CRE_TIME` datetime default NULL,
  `R_MOD_ID` varchar(32) default NULL,
  `R_MOD_TIME` datetime default NULL,
  `LANG_ID` varchar(8) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `cocd`
--

LOCK TABLES `cocd` WRITE;
/*!40000 ALTER TABLE `cocd` DISABLE KEYS */;
INSERT INTO `cocd` VALUES ('1','XYZ','NEGOTIABILITY','N','Non-Negotiable','N','MANUAL','2013-07-21 14:50:29','MANUAL','2013-07-21 14:50:29',''),('1','XYZ','NEGOTIABILITY','Y','Negotiable','N','MANUAL','2013-07-21 14:50:40','MANUAL','2013-07-21 14:50:40',''),('1','XYZ','YESORNO','Y','Yes','N','MANUAL','2013-07-21 14:51:08','MANUAL','2013-07-21 14:51:08',''),('1','XYZ','YESORNO','N','No','N','MANUAL','2013-07-21 14:51:08','MANUAL','2013-07-21 14:51:08',''),('1','XYZ','RENTORSALE','R','RENT','N','MANUAL','2013-08-10 14:50:45','MANUAL','2013-08-10 14:50:45',''),('1','XYZ','RENTORSALE','S','SALE','N','MANUAL','2013-08-10 14:50:53','MANUAL','2013-08-10 14:50:53','');
/*!40000 ALTER TABLE `cocd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `computers_posts`
--

DROP TABLE IF EXISTS `computers_posts`;
/*!50001 DROP VIEW IF EXISTS `computers_posts`*/;
/*!50001 CREATE TABLE `computers_posts` (
  `post_id` decimal(10,0),
  `sub_category` varchar(8),
  `city` varchar(8),
  `location` varchar(8),
  `make` varchar(16),
  `model` varchar(32),
  `year` int(11),
  `processor_size` int(11),
  `hdd_size` int(11),
  `price` decimal(9,3),
  `created_on` datetime,
  `created_by` varchar(32),
  `modified_on` datetime,
  `modified_by` varchar(32),
  `TITLE` varchar(256),
  `CONTACT_NO` varchar(16),
  `CONTACT_PERSON_NAME` varchar(32),
  `DESCRIPTION` varchar(512),
  `IMAGE_FILE_NAME` varchar(64),
  `CORP_ID` decimal(10,0),
  `post_status` varchar(8)
) */;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `contacts` (
  `ID` int(11) NOT NULL auto_increment,
  `FIRSTNAME` varchar(30) default NULL,
  `LASTNAME` varchar(30) default NULL,
  `TELEPHONE` varchar(15) default NULL,
  `EMAIL` varchar(30) default NULL,
  `CREATED` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (2,'Shiva','Kumar','98098098098','shivaRocksAnytime@gmail.com','2013-03-06 18:52:42'),(3,'Arun','Prabhu','113131313','ciscoemp@ciscom.com','2013-03-06 18:53:07'),(4,'Prasanna','Kumar','3434343434','don@don.com','2013-03-06 18:53:19'),(6,'Karthik','S','1234123','tsk@gmail.com','2013-03-09 03:33:47'),(12,'','','','','2013-03-10 04:24:55');
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `corp`
--

DROP TABLE IF EXISTS `corp`;
/*!50001 DROP VIEW IF EXISTS `corp`*/;
/*!50001 CREATE TABLE `corp` (
  `CORP_ID` decimal(5,0),
  `CORP_NAME` varchar(256),
  `CORP_SHORT_NAME` varchar(32),
  `ADDRESS` varchar(32),
  `CITY` varchar(16),
  `STATE` varchar(8),
  `SIZE` char(1),
  `CREATED_ON` datetime,
  `CREATED_BY` varchar(12),
  `MODIFIED_ON` datetime,
  `MODIFIED_BY` varchar(12)
) */;

--
-- Table structure for table `corporate_master`
--

DROP TABLE IF EXISTS `corporate_master`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `corporate_master` (
  `CORP_ID` decimal(5,0) NOT NULL,
  `CORP_NAME` varchar(256) default NULL,
  `CORP_SHORT_NAME` varchar(32) default NULL,
  `ADDRESS` varchar(32) default NULL,
  `CITY` varchar(16) default NULL,
  `STATE` varchar(8) default NULL,
  `SIZE` char(1) default NULL,
  `CREATED_ON` datetime default NULL,
  `CREATED_BY` varchar(12) default NULL,
  `MODIFIED_ON` datetime default NULL,
  `MODIFIED_BY` varchar(12) default NULL,
  PRIMARY KEY  (`CORP_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `corporate_master`
--

LOCK TABLES `corporate_master` WRITE;
/*!40000 ALTER TABLE `corporate_master` DISABLE KEYS */;
INSERT INTO `corporate_master` VALUES ('100','Wipro Technologies Limited','Wipro','24, Electronics City','BLR','KA','L','2014-06-22 06:04:38','SYSTEM','2014-06-22 06:04:38','SYSTEM'),('101','Cognizant Technologies Limited','CTS','25, Electronics City','BLR','KA','L','2014-06-22 06:04:38','SYSTEM','2014-06-22 06:04:38','SYSTEM'),('102','Tata Consultancy Services','TCS','26, Electronics City','BLR','KA','L','2014-06-22 06:04:38','SYSTEM','2014-06-22 06:04:38','SYSTEM'),('103','Cisco Video Technologies Limited','Cisco','27, Electronics City','BLR','KA','L','2014-06-22 06:04:38','SYSTEM','2014-06-22 06:04:38','SYSTEM'),('123','Infosys Technologies Limited','Infosys','23, Electronics City','BLR','KA','L','2014-06-22 06:03:16','SYSTEM','2014-06-22 06:03:16','SYSTEM');
/*!40000 ALTER TABLE `corporate_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain_master`
--

DROP TABLE IF EXISTS `domain_master`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `domain_master` (
  `record_id` int(11) NOT NULL auto_increment,
  `corp_id` decimal(5,0) default NULL,
  `domain_id` varchar(64) default NULL,
  PRIMARY KEY  (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `domain_master`
--

LOCK TABLES `domain_master` WRITE;
/*!40000 ALTER TABLE `domain_master` DISABLE KEYS */;
INSERT INTO `domain_master` VALUES (1,'100','wipro.com'),(2,'100','wipro.in'),(3,'101','cts.com'),(4,'102','tcs.com'),(5,'103','cisco.com'),(6,'123','infosys.com');
/*!40000 ALTER TABLE `domain_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `dvd_posts`
--

DROP TABLE IF EXISTS `dvd_posts`;
/*!50001 DROP VIEW IF EXISTS `dvd_posts`*/;
/*!50001 CREATE TABLE `dvd_posts` (
  `POST_ID` int(11),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `PLAYER_TYPE` varchar(8),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32),
  `TITLE` varchar(256),
  `CONTACT_NO` varchar(16),
  `CONTACT_PERSON_NAME` varchar(32),
  `DESCRIPTION` varchar(512),
  `IMAGE_FILE_NAME` varchar(64),
  `CORP_ID` decimal(10,0),
  `post_status` varchar(8)
) */;

--
-- Table structure for table `errt`
--

DROP TABLE IF EXISTS `errt`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `errt` (
  `DB_TS` decimal(9,0) default NULL,
  `BANK_ID` varchar(8) NOT NULL default '',
  `CHANNEL_ID` varchar(8) default NULL,
  `MODULE_ID` varchar(8) default NULL,
  `ERR_CODE` decimal(9,0) NOT NULL default '0',
  `LANG_ID` varchar(3) NOT NULL default '',
  `ERR_TYPE` varchar(16) default NULL,
  `ERR_DESC` varchar(512) default NULL,
  `DEL_FLG` varchar(1) default NULL,
  `R_CRE_TIME` datetime default NULL,
  `R_CRE_ID` varchar(12) default NULL,
  `R_MOD_TIME` datetime default NULL,
  `R_MOD_ID` varchar(12) default NULL,
  PRIMARY KEY  (`ERR_CODE`,`LANG_ID`,`BANK_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `errt`
--

LOCK TABLES `errt` WRITE;
/*!40000 ALTER TABLE `errt` DISABLE KEYS */;
INSERT INTO `errt` VALUES ('1','XYY','','','11205','','','Please fill in $FIELD$','N','2013-07-24 10:40:13','SYSTEM','2013-07-24 10:40:13','SYSTEM'),('1','XYY','','','11210','','','Invalid $FIELD$','N','2013-07-24 10:39:14','SYSTEM','2013-07-24 10:39:14','SYSTEM'),('1','XYZ','','','11212','','','Post Deleted Successfully','N','2013-07-24 22:01:19','MANUAL','2013-07-24 22:01:19','MANUAL'),('1','XYZ','','','11213','','','Post Created Successfully','N','2013-07-24 22:01:27','MANUAL','2013-07-24 22:01:27','MANUAL'),('1','XYZ','','','11214','','','Post Modified Successfully','N','2013-07-24 22:01:38','MANUAL','2013-07-24 22:01:38','MANUAL');
/*!40000 ALTER TABLE `errt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `fridge_posts`
--

DROP TABLE IF EXISTS `fridge_posts`;
/*!50001 DROP VIEW IF EXISTS `fridge_posts`*/;
/*!50001 CREATE TABLE `fridge_posts` (
  `POST_ID` int(11),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `COLOR` varchar(8),
  `CAPACITY` double,
  `DOUBLE_DOOR` char(1),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32),
  `TITLE` varchar(256),
  `CONTACT_NO` varchar(16),
  `CONTACT_PERSON_NAME` varchar(32),
  `DESCRIPTION` varchar(512),
  `IMAGE_FILE_NAME` varchar(64),
  `CORP_ID` decimal(10,0),
  `post_status` varchar(8)
) */;

--
-- Temporary table structure for view `furniture_posts`
--

DROP TABLE IF EXISTS `furniture_posts`;
/*!50001 DROP VIEW IF EXISTS `furniture_posts`*/;
/*!50001 CREATE TABLE `furniture_posts` (
  `POST_ID` int(11),
  `SUB_CATEGORY` varchar(8),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `TYPE` varchar(16),
  `YEAR` int(11),
  `PRICE` double,
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32),
  `TITLE` varchar(256),
  `CONTACT_NO` varchar(16),
  `CONTACT_PERSON_NAME` varchar(32),
  `DESCRIPTION` varchar(512),
  `IMAGE_FILE_NAME` varchar(64),
  `CORP_ID` decimal(10,0),
  `post_status` varchar(8)
) */;

--
-- Table structure for table `imgt`
--

DROP TABLE IF EXISTS `imgt`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `imgt` (
  `POST_ID` decimal(9,0) default NULL,
  `S_NO` decimal(2,0) default NULL,
  `IMAGE_ID` decimal(9,0) NOT NULL default '0',
  `IMAGE_TYPE` varchar(8) default NULL,
  `IMAGE_FILE_NAME` varchar(256) default NULL,
  `IMAGE_DATA` longblob,
  `IMAGE_SIZE` decimal(9,0) default NULL,
  `THUMBNAIL_FILE_NAME` varchar(256) default NULL,
  `THUMBNAIL_DATA` longblob,
  `THUMBNAIL_SIZE` decimal(9,0) default NULL,
  `R_CRE_TIME` datetime default NULL,
  `R_CRE_ID` varchar(12) default NULL,
  `R_MOD_TIME` datetime default NULL,
  `R_MOD_ID` varchar(12) default NULL,
  PRIMARY KEY  (`IMAGE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `imgt`
--

LOCK TABLES `imgt` WRITE;
/*!40000 ALTER TABLE `imgt` DISABLE KEYS */;
INSERT INTO `imgt` VALUES ('106','0','102',NULL,'1378321057577.jpg','','6008','1378321057577-t.jpg','','2036',NULL,NULL,NULL,NULL),('111','0','103',NULL,'1378323959415.jpg','','6008','1378323959415-t.jpg','','2036','2013-09-05 01:15:59','1000','2013-09-05 01:15:59','1000'),('112','0','104',NULL,'1378406447957.jpg','','879394','1378406447957-t.jpg','','78546','2013-09-06 00:10:49','1000','2013-09-06 00:10:49','1000'),('113','0','105',NULL,'1378484280034.jpg','','845941','1378484280034-t.jpg','','78811','2013-09-06 21:48:01','1000','2013-09-06 21:48:01','1000'),('114','0','106',NULL,'1378484366461.jpg','','561276','1378484366461-t.jpg','','61219','2013-09-06 21:49:26','1000','2013-09-06 21:49:26','1000'),('115','0','107',NULL,'1378585465494.jpg','','775702','1378585465494-t.jpg','','40888','2013-09-08 01:54:26','1000','2013-09-08 01:54:26','1000'),('116','0','108',NULL,'1378586037107.jpg','','561276','1378586037107-t.jpg','','61219','2013-09-08 02:03:57','1000','2013-09-08 02:03:57','1000'),('117','0','109',NULL,'1378586228494.jpg','','780831','1378586228494-t.jpg','','95579','2013-09-08 02:07:08','1000','2013-09-08 02:07:08','1000'),('118','0','110',NULL,'1378589765729.jpg','','780831','1378589765729-t.jpg','','95579','2013-09-08 03:06:06','1000','2013-09-08 03:06:06','1000'),('119','0','111',NULL,'1378609897358.jpg','','879394','1378609897358-t.jpg','','78546','2013-09-08 08:41:37','1000','2013-09-08 08:41:37','1000'),('120','0','112',NULL,'1378609968170.jpg','','845941','1378609968170-t.jpg','','78811','2013-09-08 08:42:48','1000','2013-09-08 08:42:48','1000');
/*!40000 ALTER TABLE `imgt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lgin`
--

DROP TABLE IF EXISTS `lgin`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `lgin` (
  `USER_ID` varchar(12) NOT NULL default '',
  `SESSION_ID` varchar(64) default NULL,
  `CHANNEL` varchar(5) default NULL,
  `R_CRE_TIME` datetime default NULL,
  PRIMARY KEY  (`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `lgin`
--

LOCK TABLES `lgin` WRITE;
/*!40000 ALTER TABLE `lgin` DISABLE KEYS */;
INSERT INTO `lgin` VALUES ('1000','FAA0DB805AAEB25A201BD7194A0C19A5',NULL,NULL),('null.DUMMY','C9786B72906F16A4F26F833316722885',NULL,NULL),('null.PUBLIC','A5CD989BF07AED47DCF2D965DB29AC68',NULL,NULL);
/*!40000 ALTER TABLE `lgin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `location`
--

DROP TABLE IF EXISTS `location`;
/*!50001 DROP VIEW IF EXISTS `location`*/;
/*!50001 CREATE TABLE `location` (
  `STATE_CODE` varchar(8),
  `CITY_CODE` varchar(8),
  `LOC_CODE` varchar(8),
  `LOC_NAME` varchar(32),
  `created_on` datetime,
  `created_by` varchar(32),
  `modified_on` datetime,
  `modified_by` varchar(32)
) */;

--
-- Table structure for table `location_master`
--

DROP TABLE IF EXISTS `location_master`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `location_master` (
  `STATE_CODE` varchar(8) NOT NULL default '',
  `CITY_CODE` varchar(8) NOT NULL default '',
  `LOC_CODE` varchar(8) NOT NULL default '',
  `LOC_NAME` varchar(32) default NULL,
  `created_on` datetime default NULL,
  `created_by` varchar(32) default NULL,
  `modified_on` datetime default NULL,
  `modified_by` varchar(32) default NULL,
  PRIMARY KEY  (`LOC_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `location_master`
--

LOCK TABLES `location_master` WRITE;
/*!40000 ALTER TABLE `location_master` DISABLE KEYS */;
INSERT INTO `location_master` VALUES ('KA','BLR','1','Agara','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','10','BP Wadia Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','100','Mahatma Gandhi Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','101','Majestic','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','102','Malleswaram','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','103','Marathahalli','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','104','Mathikere','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','105','Milk Colony','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','106','Millers Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','107','Minerva Circle','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','108','Mysore Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','109','Nagavara','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','11','Banasavadi','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','110','Nagvarpalya Main Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','111','Nandi Durg Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','112','Old Airport Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','113','Outer Ring Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','114','Padmanabhanagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','115','Palace Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','116','Peenya','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','117','RT Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','118','Race Course Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','119','Raj Bhavan Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','12','Banashankari','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','120','Raja Rajeshwari Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','121','RajajiNagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','122','Rajvi Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','123','Ram Krishna Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','124','Ramamurthy Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','125','Residency Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','126','Richmond Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','127','RMV Extension','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','128','SR Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','129','Sadahalli','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','13','Bannerghatta Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','130','Sadashiv Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','131','Sahakara Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','132','Sampangirama Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','133','Sanjay Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','134','Sankey Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','135','Sarakki Main Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','136','Sarjapur','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','137','Sarjapur Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','138','Seshadri Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','139','Seshadripuram','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','14','Bapuji Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','140','Shampura','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','141','Shrirampuram','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','142','Siddapura Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','143','Silk Board','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','144','Sivan Chetty Gardens','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','145','Sompura Gate','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','146','Sri Ram Puram','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','147','St. Mark\'s Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','148','Teacher\'s Colony','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','149','Thaverekere Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','15','Basavanagudi','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','150','Tumkur Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','151','Ulsoor','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','152','Uttarahalli Main Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','153','VV Mahal','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','154','Varthur','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','155','Vasanth Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','156','Vidyaranyapura','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','157','Vijayanagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','158','Vittal Mallya Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','159','Vivek Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','16','Basaveshwara Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','160','Whitefield','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','161','Wilson Garden','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','162','Yelahanaka','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','17','Bashyam Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','18','Bellandur','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','19','Benson Town','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','2','Airport','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','20','Bidadi','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','21','Bommanahalli','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','22','Brigade Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','23','Brookefield','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','24','Btm Layout','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','25','CV Raman Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','26','Carmelaram Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','27','Central Bengaluru','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','28','Chamrajpet','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','29','Channasandra','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','3','Anand Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','30','Chikkabanavara Lake','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','31','Church Street','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','32','City Centre','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','33','Cooke Town','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','34','Cottonpet','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','35','Cox Town','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','36','Crescent Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','37','Cunningham Road, City','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','38','Dasarahalli','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','39','Devanahalli','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','4','Anepalya','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','40','Devasandra Lake','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','41','Diamond District','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','42','Dickenson Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','43','DLF Township','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','44','Doddaballapur Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','45','Domlur','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','46','Electronic City','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','47','Gandhi Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','48','Ganga Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','49','Govindapura','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','5','Ashok Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','50','Guttahalli','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','51','HBR Layout','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','52','HSR Layout','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','53','HAL 2nd Stage','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','54','Hanumanth Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','55','Hebbal','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','56','Hennur Main Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','57','Hessarghatta Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','58','High Grounds','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','59','Hormavu','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','6','Attiguppe','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','60','Hoskote','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','61','Hosur Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','62','Hunsur Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','63','Indiranagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','64','Indlawadi Pura','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','65','Infantry Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','66','Isro Layout','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','67','JP Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','68','Jalahalli','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','69','Jayamahal Extn','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','7','Austin Town','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','70','Jayamahal Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','71','Jayanagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','72','Jaylakshmi Puram','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','73','Jogapalya','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','74','KR Puram','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','75','KG Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','76','KD Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','77','Kalkere','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','78','Kalyan Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','79','Kammanahalli','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','8','Avenue Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','80','Kanakapura Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','81','Kasavanahalli','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','82','Kasturi Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','83','Kempapur Agrahara','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','84','Kempe Gowda Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','85','Koramangala','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','86','Kudlu Gate','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','87','Kumaraswamy Layout','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','88','Kundalahalli','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','89','Lakkasandra','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','9','Ayappa Garden','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','90','Lalbagh Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','91','Langford Town','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','92','Lavelle Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','93','LB Shastri Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','94','Lottegollahalli','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','95','MG Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','96','Madivala','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','97','Magrath Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','98','Mahadevpura','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','99','Mahalakshmipuram','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('KA','BLR','BTM','BTM Layout','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C1','Abhiramapuram','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C10','Arumbakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C11','Ashok Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C12','Ayanavaram','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C13','Besant Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C14','Broadway','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C15','Cathedral Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C16','Chepauk','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C17','Chetpet','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C18','Chintadripet','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C19','Chrompet','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C2','Adambakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C20','CP Ramaswami Rd','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C21','Dr.Radhakrishnan Salai','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C22','East Coast Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C23','Egmore','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C24','Ekkatuthangal','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C25','Erukkancheri','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C26','Fort St.George','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C27','Gandhi Irwin Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C28','Gandhi Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C29','George Town','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C3','Adyar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C30','Gopalapuram','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C31','Greams Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C32','Guindy','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C33','Indira Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C34','Injambakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C35','Jawahar Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C36','Kasturba Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C37','Kilpauk','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C38','Kodambakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C39','Korukkupet','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C4','Alandur','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C40','Kovilambakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C41','Koyambedu','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C42','Madhavaram','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C43','Madipakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C44','Mahalingapuram','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C45','Mambalam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C46','Manapakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C47','Mandaveli Rd.','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C48','Medavakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C49','Meenambakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C5','Alwarpet','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C50','MMDA Colony','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C51','Moolakadai','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C52','Mylapore','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C53','Nanganallur','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C54','New Washermenpet','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C55','Nungambakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C56','Nungambakkam High Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C57','Okkiyam Thuraipakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C58','Old Mahabalipuram Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C59','Padi','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C6','Ambattur','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C60','Palavakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C61','Pallikaranai','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C62','Park Town','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C63','Perambur','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C64','Poonamallee','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C65','Porur','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C66','Purasawakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C67','Royapettah','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C68','Royapuram','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C69','Rukmani Lakshmipathi Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C7','Aminjikarai','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C70','Saidapet','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C71','Santhome','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C72','Shastri Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C73','Shenoy Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C74','St. Thomas Mount','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C75','Tambaram Sanatorium','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C76','Teynampet','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C77','Thiruninravur','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C78','Thiruvanmiyur','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C79','Thousand Lights','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C8','Anna Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C80','Thyagaraya Nagar','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C81','Tiruvottiyur','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C82','Tondiarpet','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C83','Triplicane','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C84','Vadapalani','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C85','Velachery','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C86','Vepery','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C87','Villivakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C88','Virugambakkam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C89','Vysarpadi','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C9','Anna Salai','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C90','West Mambalam','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM'),('TN','CHE','C91','Whannels Road','2014-06-08 02:08:32','SYSTEM','2014-06-08 02:08:32','SYSTEM');
/*!40000 ALTER TABLE `location_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mobile_master`
--

DROP TABLE IF EXISTS `mobile_master`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `mobile_master` (
  `record_id` varchar(8) NOT NULL,
  `brand` varchar(16) default NULL,
  `model` varchar(32) default NULL,
  `model_name` varchar(32) default NULL,
  `smart_phone` char(1) default NULL,
  `touch_screen` char(1) default NULL,
  `screen_size` double default NULL,
  `camera_resolution` double default NULL,
  `operating_system` varchar(32) default NULL,
  `wi_fi` char(1) default NULL,
  `front_camera` char(1) default NULL,
  `fm_radio` char(1) default NULL,
  `processor_speed` varchar(8) default NULL,
  `memory_size` varchar(8) default NULL,
  `created_on` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `created_by` varchar(32) default NULL,
  `modified_on` timestamp NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(32) default NULL,
  PRIMARY KEY  (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `mobile_master`
--

LOCK TABLES `mobile_master` WRITE;
/*!40000 ALTER TABLE `mobile_master` DISABLE KEYS */;
INSERT INTO `mobile_master` VALUES ('101','Blackberry ','8830','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('102','Blackberry ','Bold 9000','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('103','Blackberry ','Bold 9200','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('104','Blackberry ','Bold 9220','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('105','Blackberry ','Bold 9650','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('106','Blackberry ','Bold 9700','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('107','Blackberry ','Bold 9780','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('108','Blackberry ','Bold 9790','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('109','Blackberry ','Bold 9900','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('110','Blackberry ','Curve 8320','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('111','Blackberry ','Curve 8520','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('112','Blackberry ','Curve 8530','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('113','Blackberry ','Curve 8900','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('114','Blackberry ','Curve 9300','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('115','Blackberry ','Curve 9320','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('116','Blackberry ','Curve 9320','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('117','Blackberry ','Curve 9360','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('118','Blackberry ','Curve 9380','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('119','Blackberry ','Curve 9830','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('120','Blackberry ','Pearl 9100','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('121','Blackberry ','Q10','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('122','Blackberry ','Q5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('123','Blackberry ','Storm 9530','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('124','Blackberry ','Storm2 9520','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('125','Blackberry ','Storm2 9550','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('126','Blackberry ','Torch 9800','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('127','Blackberry ','Torch 9810','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('128','Blackberry ','Torch 9860','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('129','Blackberry ','Z10','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('130','Blackberry ','Z30','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('131','Tata ','Huawei 7300','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('132','Tata ','Huawei C2206','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('133','Tata ','Huawei C2806','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('134','Tata ','Huawei C2809','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('135','Micromax ','A47','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('136','Micromax ','A70','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('137','Micromax ','Androa60','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('138','Micromax ','Bling','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('139','Micromax ','Bling 3','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('140','Micromax ','Bolt','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('141','Micromax ','C2I','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('142','Micromax ','Canvas','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('143','Micromax ','Canvas 2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('144','Micromax ','Canvas 3D','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('145','Micromax ','Canvas 4','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('146','Micromax ','Canvas Blaze','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('147','Micromax ','Canvas Doodle','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('148','Micromax ','Canvas Doodle 2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('149','Micromax ','Canvas Fun','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('150','Micromax ','Canvas HD','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('151','Micromax ','Canvas Juice','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('152','Micromax ','Canvas Lite','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('153','Micromax ','Canvas Music','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('154','Micromax ','Canvas Power','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('155','Micromax ','Canvas Turbo','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('156','Micromax ','Canvas Turbo Mini','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('157','Micromax ','Canvas Viva','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('158','Micromax ','Canvas XL','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('159','Micromax ','M2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('160','Micromax ','Modu','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('161','Micromax ','Ninja 2 A56','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('162','Micromax ','Ninja 3','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('163','Micromax ','Ninja A89','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('164','Micromax ','Punk','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('165','Micromax ','Q1','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('166','Micromax ','Q2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('167','Micromax ','Q3','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('168','Micromax ','Q35','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('169','Micromax ','Q36','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('170','Micromax ','Q5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('171','Micromax ','Q50','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('172','Micromax ','Q55','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('173','Micromax ','Q55Bling','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('174','Micromax ','Q6','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('175','Micromax ','Q66','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('176','Micromax ','Q7','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('177','Micromax ','Q75','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('178','Micromax ','Q76','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('179','Micromax ','Q80','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('180','Micromax ','Q95','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('181','Micromax ','A84','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('182','Micromax ','A85','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('183','Micromax ','Superfone Pixel','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('184','Micromax ','X111','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('185','Micromax ','X1I','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('186','Micromax ','X222','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('187','Micromax ','X265','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('188','Micromax ','X330','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('189','Micromax ','X360','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('190','Micromax ','X450','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('191','Micromax ','X505','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('192','Micromax ','X510','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('193','Micromax ','X550','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('194','Micromax ','X560','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('195','Micromax ','X600','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('196','Acer ','Allegro','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('197','Acer ','beTouch E100','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('198','Acer ','beTouch E101','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('199','Acer ','beTouch E130','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('200','Acer ','beTouch E210','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('201','Acer ','DX650','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('202','Acer ','E110','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('203','Acer ','F900','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('204','Acer ','Iconia Smart','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('205','Acer ','Iconia Tab','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('206','Acer ','Iconia Tab A500','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('207','Acer ','Liquid e','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('208','Acer ','Liquid E Ferrari','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('209','Acer ','Liquid Metal','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('210','Acer ','Liquid Mini','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('211','Spice ','D 6666','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('212','Spice ','D 88','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('213','Spice ','M 4242','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('214','Spice ','M 4580','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('215','Spice ','M 5005','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('216','Spice ','M 5151','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('217','Spice ','M 5180','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('218','Spice ','M 5206','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('219','Spice ','M 5252','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('220','Spice ','M 5252N','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('221','Spice ','M 5260','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('222','Spice ','M 5364','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('223','Spice ','M 5364','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('224','Spice ','M 5365','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('225','Spice ','M 5399','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('226','Spice ','M 5454','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('227','Spice ','M 5500','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('228','Spice ','M 5610','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('229','Spice ','M 5700','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('230','Spice ','M 5750','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('231','Spice ','M 5900','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('232','Spice ','M 6700','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('233','Spice ','M 6800 Flo','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('234','Spice ','M 6869','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('235','Spice ','M 6900','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('236','Spice ','M 9000','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('237','Spice ','M 940N','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('238','Spice ','M-4250','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('239','Spice ','M-5025','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('240','Spice ','M-5100','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('241','Spice ','M-5161n','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('242','Spice ','M-5262','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('243','Spice ','M-6200','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('244','Spice ','M-6363','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('245','Spice ','M-6400','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('246','Spice ','Mi 270','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('247','Spice ','Mi 280','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('248','Spice ','Mi 310','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('249','Spice ','Mi 349','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('250','Spice ','Mi 350','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('251','Spice ','Mi 355','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('252','Spice ','Mi 410','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('253','Spice ','Mi 422','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('254','Spice ','Mi 436','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('255','Spice ','Mi 450','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('256','Spice ','Mi 450','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('257','Spice ','Mi 491','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('258','Spice ','Mi 502','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('259','Spice ','Mi 504','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('260','Spice ','Mi 505','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('261','Spice ','Mi 510','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('262','Spice ','Mi 535','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('263','Spice ','Mi 720','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('264','Spice ','Mi-349','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('265','Spice ','Mi-502n','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('266','Spice ','Qt 44','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('267','Spice ','Qt 50','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('268','Spice ','Qt 52','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('269','Spice ','QT 53','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('270','Spice ','Qt 55','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('271','Spice ','Qt 58','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('272','Spice ','Qt 58 Mini','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('273','Spice ','Qt 60','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('274','Spice ','Qt 61','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('275','Spice ','Qt 66','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('276','Spice ','Qt 68','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('277','Spice ','Qt 95','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('278','iBall ','Andi 3n','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('279','iBall ','Andi 4.5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('280','iBall ','Andi 4Di','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('281','iBall ','Andi 4V','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('282','iBall ','Andi 5h','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('283','iBall ','Andi 5Li','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('284','iBall ','Aspire QE45','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('285','iBall ','Aura V36','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('286','iBall ','S 306','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('287','iBall ','Slide','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('288','iBall ','Thin','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('289','iBall ','Vibe','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('290','iBall ','Vibe Wi-Fi','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('291','HTC ','7 Mozart','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('292','HTC ','7 Surround','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('293','HTC ','Chacha','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('294','HTC ','Desire 310','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('295','HTC ','Desire 500','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('296','HTC ','Desire 601','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('297','HTC ','Desire C','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('298','HTC ','Desire Hd','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('299','HTC ','Desire S','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('300','HTC ','Desire V','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('301','HTC ','Desire X','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('302','HTC ','Desire Z','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('303','HTC ','Evo 3D','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('304','HTC ','Evo 4G','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('305','HTC ','Explorer','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('306','HTC ','Google Nexus','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('307','HTC ','HD Mini','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('308','HTC ','Hd2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('309','HTC ','Hd7','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('310','HTC ','Hero','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('311','HTC ','Incredible S','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('312','HTC ','Inspire 4G','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('313','HTC ','Legend','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('314','HTC ','Magic','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('315','HTC ','Nexus One','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('316','HTC ','One','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('317','HTC ','One Max','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('318','HTC ','One Mini','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('319','HTC ','One S','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('320','HTC ','One V','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('321','HTC ','One X','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('322','HTC ','P3400','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('323','HTC ','P3452','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('324','HTC ','Radar','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('325','HTC ','Rhyme','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('326','HTC ','Salsa','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('327','HTC ','Sensation','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('328','HTC ','Sensation 4G','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('329','HTC ','Sensation Xe','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('330','HTC ','Sensation XE','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('331','HTC ','Sensation XL','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('332','HTC ','Smart','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('333','HTC ','Titan','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('334','HTC ','Titan 2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('335','HTC ','Touch Diamond','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('336','HTC ','Touch Pro2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('337','HTC ','Touch Viva','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('338','HTC ','Touch2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('339','HTC ','Wildfire','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('340','HTC ','Wildfire S','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('341','Xolo ','A1000','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('342','Xolo ','A500','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('343','Xolo ','A500 S','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('344','Xolo ','A600','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('345','Xolo ','A700','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('346','Xolo ','A800','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('347','Xolo ','Q1000','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('348','Xolo ','Q2000','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('349','Xolo ','Q3000','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('350','Xolo ','Q500','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('351','Xolo ','Q600','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('352','Xolo ','Q700','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('353','Xolo ','Q800','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('354','Xolo ','Q900','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('355','Xolo ','X1000','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('356','Xolo ','X500','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('357','Xolo ','X900','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('358','Lenovo ','A390','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('359','Lenovo ','A706','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('360','Lenovo ','K900','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('361','Lenovo ','P700i','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('362','Lenovo ','P770','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('363','Lenovo ','P780','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('364','Lenovo ','S720','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('365','Lenovo ','S880','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('366','Lenovo ','S920','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('367','Karbonn ','A1','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('368','Karbonn ','A1+','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('369','Karbonn ','A10','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('370','Karbonn ','A11','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('371','Karbonn ','A111','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('372','Karbonn ','A12','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('373','Karbonn ','A15','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('374','Karbonn ','A16','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('375','Karbonn ','A18','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('376','Karbonn ','A2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('377','Karbonn ','A21','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('378','Karbonn ','A25','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('379','Karbonn ','A26','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('380','Karbonn ','A27+','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('381','Karbonn ','A29','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('382','Karbonn ','A3','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('383','Karbonn ','A30','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('384','Karbonn ','A35','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('385','Karbonn ','A4','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('386','Karbonn ','A5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('387','Karbonn ','A50','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('388','Karbonn ','A51','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('389','Karbonn ','A52','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('390','Karbonn ','A6','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('391','Karbonn ','A7','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('392','Karbonn ','A8','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('393','Karbonn ','A9','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('394','Karbonn ','A90','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('395','Karbonn ','A91','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('396','Karbonn ','K1','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('397','Karbonn ','K10','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('398','Karbonn ','K1414','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('399','Karbonn ','K1616','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('400','Karbonn ','K25','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('401','Karbonn ','K30','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('402','Karbonn ','K446','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('403','Karbonn ','K451','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('404','Karbonn ','K46','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('405','Karbonn ','K550','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('406','Karbonn ','K570','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('407','Karbonn ','K661','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('408','Karbonn ','K73','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('409','Karbonn ','K75','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('410','Karbonn ','K77','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('411','Karbonn ','K81','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('412','Karbonn ','K9 Jumbo','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('413','Karbonn ','K99 Star','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('414','Karbonn ','KC110','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('415','Karbonn ','Kc470','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('416','Karbonn ','KC520','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('417','Karbonn ','KT82','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('418','Karbonn ','Sound Wave K451+','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('419','Karbonn ','SPY K595','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('420','Karbonn ','Titanium S1','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('421','Karbonn ','Titanium S2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('422','Karbonn ','Titanium S4','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('423','Karbonn ','Titanium S5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('424','Karbonn ','Titanium S7','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('425','Karbonn ','Titanium S9','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('426','Karbonn ','Titanium X','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('427','Intex ','Aqua','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('428','Intex ','Aqua HD','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('429','Intex ','Aqua I5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('430','Intex ','Cloud X1','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('431','Intex ','In 2010','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('432','Intex ','In 2022 Nano','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('433','Intex ','In 2060','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('434','Intex ','In 4420','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('435','Intex ','In 4455','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('436','Intex ','In 4470','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('437','Intex ','In 4470N','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('438','Intex ','In 4477','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('439','Intex ','In 50','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('440','Intex ','In 5030','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('441','Intex ','In 6633','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('442','Intex ','Ismart','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('443','Intex ','N2060','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('444','Intex ','V10','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('445','Intex ','Yuvi','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('446','Fly ','B405','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('447','Fly ','B430Ds','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('448','Fly ','B450','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('449','Fly ','B470','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('450','Fly ','E105','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('451','Fly ','E145','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('452','Fly ','Mc160','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('453','Sony ','Aino','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('454','Sony ','Aspen','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('455','Sony ','C510','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('456','Sony ','Cedar','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('457','Sony ','Hazel','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('458','Sony ','K530I','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('459','Sony ','Mix Walkman','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('460','Sony ','Naite','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('461','Sony ','Satio','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('462','Sony ','Txt Pro','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('463','Sony ','Vivaz','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('464','Sony ','Vivaz Pro','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('465','Sony ','W20','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('466','Sony ','W200I','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('467','Sony ','W580I','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('468','Sony ','W8','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('469','Sony ','W810I','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('470','Sony ','W910I','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('471','Sony ','X2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('472','Sony ','Xperia','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('473','Sony ','XPERIA Active','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('474','Sony ','Xperia Arc','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('475','Sony ','Xperia Arc Hd','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('476','Sony ','Xperia C','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('477','Sony ','Xperia E','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('478','Sony ','Xperia J','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('479','Sony ','Xperia L','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('480','Sony ','Xperia M','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('481','Sony ','XPERIA Mini','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('482','Sony ','Xperia Neo','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('483','Sony ','Xperia Play','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('484','Sony ','Xperia Pro','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('485','Sony ','Xperia Ray','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('486','Sony ','Xperia Tipo','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('487','Sony ','XPERIA X1','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('488','Sony ','Xperia X10','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('489','Sony ','XPERIA X10 Mini','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('490','Sony ','XPERIA X2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('491','Sony ','Xperia X8','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('492','Sony ','Xperia Z','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('493','Sony ','Yari','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('494','Sony ','Yendo','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('495','Sony ','Zylo ','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('496','Nokia ','100','','N','N',1.8,0,'Symbian','N','N','Y','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('497','Nokia ','110','','N','N',1.8,0,'Symbian','N','N','Y','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('498','Nokia ','500','','N','Y',3.2,5,'Symbian','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('499','Nokia ','1100','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('500','Nokia ','1101','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('501','Nokia ','1108','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('502','Nokia ','1110','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('503','Nokia ','1200','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('504','Nokia ','1201','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('505','Nokia ','1202','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('506','Nokia ','1203','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('507','Nokia ','1208','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('508','Nokia ','1209','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('509','Nokia ','1210','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('510','Nokia ','2300','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('511','Nokia ','2301','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('512','Nokia ','2310','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('513','Nokia ','2330','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('514','Nokia ','2500','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('515','Nokia ','2600','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('516','Nokia ','2610','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('517','Nokia ','2630','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('518','Nokia ','2660','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('519','Nokia ','2690','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('520','Nokia ','2700','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('521','Nokia ','3100','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('522','Nokia ','3110','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('523','Nokia ','5030','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('524','Nokia ','5220','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('525','Nokia ','5230','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('526','Nokia ','5233','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('527','Nokia ','5320','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('528','Nokia ','5530','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('529','Nokia ','7210','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('530','Nokia ','7310','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('531','Nokia ','7610','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('532','Nokia ','9300','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('533','Nokia ','101','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('534','Nokia ','103','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('535','Nokia ','105','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('536','Nokia ','106','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('537','Nokia ','107','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('538','Nokia ','108','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('539','Nokia ','109','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('540','Nokia ','110','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('541','Nokia ','111','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('542','Nokia ','112','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('543','Nokia ','113','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('544','Nokia ','114','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('545','Nokia ','1280','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('546','Nokia ','1616','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('547','Nokia ','1650','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('548','Nokia ','1661','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('549','Nokia ','1662','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('550','Nokia ','1680','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('551','Nokia ','1800','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('552','Nokia ','206','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('553','Nokia ','208','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('554','Nokia ','2680','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('555','Nokia ','2690','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('556','Nokia ','2700','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('557','Nokia ','2710','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('558','Nokia ','2720','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('559','Nokia ','2730','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('560','Nokia ','301','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('561','Nokia ','3120','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('562','Nokia ','3600','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('563','Nokia ','5130 XpressMusic','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('564','Nokia ','515','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('565','Nokia ','5250','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('566','Nokia ','5330','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('567','Nokia ','5800 XpressMusic','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('568','Nokia ','603','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('569','Nokia ','6122','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('570','Nokia ','6210','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('571','Nokia ','6220','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('572','Nokia ','6260','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('573','Nokia ','6263','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('574','Nokia ','6300i','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('575','Nokia ','6303','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('576','Nokia ','6350','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('577','Nokia ','6600','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('578','Nokia ','6650','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('579','Nokia ','6700','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('580','Nokia ','700','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('581','Nokia ','701','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('582','Nokia ','7230','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('583','Nokia ','808','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('584','Nokia ','Asha 200','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('585','Nokia ','Asha 201','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('586','Nokia ','Asha 202','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('587','Nokia ','Asha 205','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('588','Nokia ','Asha 206','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('589','Nokia ','Asha 210','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('590','Nokia ','Asha 300','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('591','Nokia ','Asha 301','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('592','Nokia ','Asha 302','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('593','Nokia ','Asha 303','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('594','Nokia ','Asha 305','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('595','Nokia ','Asha 306','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('596','Nokia ','Asha 308','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('597','Nokia ','Asha 309','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('598','Nokia ','Asha 310','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('599','Nokia ','Asha 311','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('600','Nokia ','Asha 500','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('601','Nokia ','Asha 501','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('602','Nokia ','Asha 502','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('603','Nokia ','Asha 503','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('604','Nokia ','C1-01','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('605','Nokia ','C2-00','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('606','Nokia ','C2-01','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('607','Nokia ','C2-02','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('608','Nokia ','C2-03','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('609','Nokia ','C3','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('610','Nokia ','C3-01','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('611','Nokia ','C5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('612','Nokia ','C5-03','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('613','Nokia ','C6','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('614','Nokia ','C6-01','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('615','Nokia ','C7','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('616','Nokia ','E5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('617','Nokia ','E52','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('618','Nokia ','E6','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('619','Nokia ','E61','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('620','Nokia ','E63','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('621','Nokia ','E65','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('622','Nokia ','E66','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('623','Nokia ','E7','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('624','Nokia ','E71','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('625','Nokia ','E72','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('626','Nokia ','E73','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('627','Nokia ','E75','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('628','Nokia ','Lumia 1020','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('629','Nokia ','Lumia 1520','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('630','Nokia ','Lumia 320','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('631','Nokia ','Lumia 505','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('632','Nokia ','Lumia 510','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('633','Nokia ','Lumia 520','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('634','Nokia ','Lumia 525','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('635','Nokia ','Lumia 603','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('636','Nokia ','Lumia 610','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('637','Nokia ','Lumia 620','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('638','Nokia ','Lumia 625','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('639','Nokia ','Lumia 710','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('640','Nokia ','Lumia 720','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('641','Nokia ','Lumia 800','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('642','Nokia ','Lumia 810','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('643','Nokia ','Lumia 820','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('644','Nokia ','Lumia 822','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('645','Nokia ','Lumia 900','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('646','Nokia ','Lumia 920','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('647','Nokia ','Lumia 925','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('648','Nokia ','N101','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('649','Nokia ','N110','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('650','Nokia ','N70','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('651','Nokia ','N72','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('652','Nokia ','N73','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('653','Nokia ','N78','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('654','Nokia ','N79','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('655','Nokia ','N8','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('656','Nokia ','N85','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('657','Nokia ','N86','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('658','Nokia ','N9','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('659','Nokia ','N900','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('660','Nokia ','N95','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('661','Nokia ','N96','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('662','Nokia ','N97','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('663','Nokia ','N97 Mini','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('664','Nokia ','X1','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('665','Nokia ','X2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('666','Nokia ','X2-01','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('667','Nokia ','X2-02','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('668','Nokia ','X3','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('669','Nokia ','X3-02','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('670','Nokia ','X5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('671','Nokia ','X6','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('672','Nokia ','X7','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('673','Lemon ','B 229','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('674','Lemon ','B 649','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('675','Lemon ','D 222','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('676','Lemon ','D305','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('677','Lemon ','iQ 707','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('678','Lemon ','T 29','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('679','Lemon ','W100 3G','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('680','Samsung ','1232','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('681','Samsung ','1280','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('682','Samsung ','2202','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('683','Samsung ','B3410','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('684','Samsung ','B5722','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('685','Samsung ','B7722','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('686','Samsung ','Boss','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('687','Samsung ','C3010','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('688','Samsung ','C3011','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('689','Samsung ','C3110','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('690','Samsung ','C3200','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('691','Samsung ','C3322','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('692','Samsung ','C5212','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('693','Samsung ','Champ','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('694','Samsung ','Champ 35G','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('695','Samsung ','Champ Deluxe','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('696','Samsung ','Champ Neo','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('697','Samsung ','Chat 322','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('698','Samsung ','Chat 333','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('699','Samsung ','Chat A222','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('700','Samsung ','Chat C3222','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('701','Samsung ','Corby 2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('702','Samsung ','Corby S3650','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('703','Samsung ','Corby TXT','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('704','Samsung ','E1085T','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('705','Samsung ','E1282','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('706','Samsung ','E2152','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('707','Samsung ','E2152','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('708','Samsung ','E2652 Champ Duos','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('709','Samsung ','Galaxy S5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('710','Samsung ','Galaxy Grand 2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('711','Samsung ','Galaxy Note 3','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('712','Samsung ','Galaxy S Duos 2 S7582','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('713','Samsung ','Galaxy S5 mini','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('714','Samsung ','Galaxy S Duos S7562','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('715','Samsung ','Galaxy Core I8260','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('716','Samsung ','Galaxy Grand Neo','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('717','Samsung ','Galaxy Note II N7100','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('718','Samsung ','Galaxy Star Pro S7260','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('719','Samsung ','Galaxy Note 3 Neo','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('720','Samsung ','Galaxy Grand I9082','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('721','Samsung ','Galaxy K zoom','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('722','Samsung ','Galaxy Core II','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('723','Samsung ','Galaxy Ace 3','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('724','Samsung ','Galaxy Note 4','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('725','Samsung ','Galaxy F','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('726','Samsung ','Galaxy Note N7000','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('727','Samsung ','Galaxy Tab 3 7.0','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('728','Samsung ','Galaxy Win I8550','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('729','Samsung ','Galaxy Ace S5830','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('730','Samsung ','Galaxy Trend II Duos S7572','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('731','Samsung ','Galaxy Y S5360','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('732','Samsung ','Galaxy Mega 6.3 I9200','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('733','Samsung ','Galaxy Young S6310','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('734','Samsung ','Galaxy Star S5280','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('735','Samsung ','Galaxy Mega 5.8 I9150','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('736','Samsung ','Galaxy S5 Sport','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('737','Samsung ','Galaxy Fame S6810','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('738','Samsung ','Galaxy Ace 4 LTE','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('739','Samsung ','Galaxy Ace 4','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('740','Samsung ','Galaxy Tab 2 7.0 P3100','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('741','Samsung ','Galaxy Tab S 8.4 LTE','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('742','Samsung ','Galaxy Y Duos S6102','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('743','Samsung ','Galaxy S5 LTE-A','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('744','Samsung ','Galaxy Tab 3 Lite 7.0','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('745','Samsung ','Galaxy Young 2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('746','Samsung ','Galaxy Ace 2 I8160','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('747','Samsung ','Galaxy Note 3 Neo Duos','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('748','Samsung ','Galaxy Tab 3 8.0','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('749','Samsung ','Galaxy S4 zoom','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('750','Samsung ','Galaxy Tab 4 7.0','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('751','Samsung ','Galaxy Tab 4 8.0 LTE','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('752','Samsung ','Galaxy Grand I9080','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('753','Samsung ','Galaxy Mini S5570','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('754','Samsung ','Galaxy S5 Active','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('755','Samsung ','Galaxy Core Plus','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('756','Samsung ','Galaxy Nexus I9250','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('757','Samsung ','Galaxy Tab S 10.5 LTE','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('758','Samsung ','Galaxy Note 10.1 (2014 Edition)','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('759','Samsung ','Galaxy Pocket S5300','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('760','Samsung ','Galaxy S5 (octa-core)','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('761','Samsung ','Galaxy W I8150','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('762','Samsung ','Galaxy Ace Duos S6802','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('763','Samsung ','Galaxy Fresh S7390','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('764','Samsung ','Galaxy Star 2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('765','Samsung ','Galaxy Ace Plus S7500','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('766','Samsung ','Grand','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('767','Samsung ','Grand Duos','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('768','Samsung ','Grand Quattro','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('769','Samsung ','GT 3770','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('770','Samsung ','GTE 1200T','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('771','Samsung ','Guru','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('772','Samsung ','Hero Music','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('773','Samsung ','Metro','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('774','Samsung ','Nexus S','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('775','Samsung ','P310','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('776','Samsung ','Rex','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('777','Samsung ','S5233T','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('778','Samsung ','S5620 Monte','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('779','Samsung ','S608','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('780','Samsung ','S6102','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('781','Samsung ','S6312','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('782','Samsung ','Star 2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('783','Samsung ','Star 3','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('784','Samsung ','Star Ii Duos','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('785','Samsung ','Star Nxt','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('786','Samsung ','Star S5233','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('787','Samsung ','Wave 2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('788','Samsung ','Wave 502','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('789','Samsung ','Wave 525','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('790','Samsung ','Wave Y','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('791','Videocon ','250','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('792','Videocon ','527','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('793','Videocon ','A 53','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('794','Videocon ','V 1544','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('795','LG ','510','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('796','LG ','BL-40 Chocolate','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('797','LG ','Cookie','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('798','LG ','Ego T 500','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('799','LG ','Fathom','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('800','LG ','GD-510','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('801','LG ','GD-510 Pop','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('802','LG ','GM-200','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('803','LG ','GS-190','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('804','LG ','GT-350I','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('805','LG ','GT-540','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('806','LG ','GU 220','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('807','LG ','GU-220','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('808','LG ','GW-300','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('809','LG ','GX-300','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('810','LG ','KP-500 Cookie','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('811','LG ','KU-990 Viewty','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('812','LG ','L3','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('813','LG ','L4','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('814','LG ','L5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('815','LG ','L72','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('816','LG ','LG G Pro E988','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('817','LG ','Nexus 4','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('818','LG ','Nexus 5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('819','LG ','Optimus 2X','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('820','LG ','Optimus 3D','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('821','LG ','Optimus Black','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('822','LG ','Optimus L3','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('823','LG ','Optimus L5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('824','LG ','Optimus Me','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('825','LG ','Optimus One','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('826','LG ','Optimus P500','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('827','LG ','Optimus Pro','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('828','LG ','P 350','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('829','LG ','P 715','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('830','LG ','P-500','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('831','LG ','Q 2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('832','Lava ','458 Q','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('833','Lava ','A10','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('834','Lava ','A9','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('835','Lava ','ARC','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('836','Lava ','Arc 01','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('837','Lava ','Arc 02','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('838','Lava ','Arc03','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('839','Lava ','B2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('840','Lava ','B5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('841','Lava ','B8','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('842','Lava ','C11 ','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('843','Lava ','C21','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('844','Lava ','C31','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('845','Lava ','Discover','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('846','Lava ','Iris','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('847','Lava ','Kk t11','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('848','Lava ','Kkt 22','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('849','Lava ','Kkt 24','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('850','Lava ','Kkt 25','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('851','Lava ','Kkt 30','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('852','Lava ','Kkt 31','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('853','Lava ','Kkt 35','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('854','Lava ','M30','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('855','Lava ','Spark','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('856','Maxx ','AX5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('857','Maxx ','AX8','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('858','Maxx ','Gc1000','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('859','Maxx ','M2020','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('860','Maxx ','Mq340','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('861','Maxx ','Mq430','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('862','Maxx ','Mx128','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('863','Maxx ','Mx463','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('864','Apple ','iPhone 1st Gen','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('865','Apple ','iPhone 3G','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('866','Apple ','iPhone 3GS','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('867','Apple ','iPhone 4','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('868','Apple ','iPhone 4S','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('869','Apple ','iPhone 5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('870','Apple ','iPhone 5C','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('871','Apple ','iPhone 5S','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('872','Motorola ','A1200','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('873','Motorola ','A810','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('874','Motorola ','Atrix','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('875','Motorola ','Atrix 4G','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('876','Motorola ','Backflip','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('877','Motorola ','C168I','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('878','Motorola ','Charm','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('879','Motorola ','Defy','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('880','Motorola ','Droid','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('881','Motorola ','Droid2','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('882','Motorola ','EX 119','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('883','Motorola ','Ex115','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('884','Motorola ','Ex128','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('885','Motorola ','Fire','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('886','Motorola ','Flipout','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('887','Motorola ','L6','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('888','Motorola ','L7','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('889','Motorola ','Milestone','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('890','Motorola ','Milestone Xt720','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('891','Motorola ','Moto G','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('892','Motorola ','Motorokr E6','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('893','Motorola ','Motorokr E8','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('894','Motorola ','Photon 4G','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('895','Motorola ','Quench Xt5','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('896','Motorola ','Razr V3','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('897','Motorola ','Razr V3I','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('898','Motorola ','V3I','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('899','Motorola ','V8','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('900','Motorola ','W220','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('901','Motorola ','W270','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('902','Motorola ','Xoom','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('903','Motorola ','Xt800','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('904','MTS ','M60','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44',''),('905','MTS ','S100','','','',0,0,'','','','','','','2014-07-11 15:23:44','','2014-07-11 15:23:44','');
/*!40000 ALTER TABLE `mobile_master` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `mobile_posts`
--

DROP TABLE IF EXISTS `mobile_posts`;
/*!50001 DROP VIEW IF EXISTS `mobile_posts`*/;
/*!50001 CREATE TABLE `mobile_posts` (
  `post_id` decimal(10,0),
  `sub_category` varchar(8),
  `city` varchar(8),
  `location` varchar(8),
  `brand` varchar(16),
  `model` varchar(32),
  `smart_phone` char(1),
  `price` double,
  `year` int(11),
  `touch_screen` char(1),
  `dual_sim` char(1),
  `screen_size` double,
  `camera_resolution` double,
  `color` varchar(16),
  `operating_system` varchar(32),
  `wi_fi` char(1),
  `front_camera` char(1),
  `fm_radio` char(1),
  `processor_speed` varchar(8),
  `memory_size` varchar(8),
  `created_on` timestamp,
  `created_by` varchar(32),
  `modified_on` timestamp,
  `modified_by` varchar(32),
  `TITLE` varchar(256),
  `CONTACT_NO` varchar(16),
  `CONTACT_PERSON_NAME` varchar(32),
  `DESCRIPTION` varchar(512),
  `IMAGE_FILE_NAME` varchar(64),
  `CORP_ID` decimal(10,0),
  `post_status` varchar(8)
) */;

--
-- Temporary table structure for view `mobmast`
--

DROP TABLE IF EXISTS `mobmast`;
/*!50001 DROP VIEW IF EXISTS `mobmast`*/;
/*!50001 CREATE TABLE `mobmast` (
  `record_id` varchar(8),
  `brand` varchar(16),
  `model` varchar(32),
  `model_name` varchar(32),
  `smart_phone` char(1),
  `touch_screen` char(1),
  `screen_size` double,
  `camera_resolution` double,
  `operating_system` varchar(32),
  `wi_fi` char(1),
  `front_camera` char(1),
  `fm_radio` char(1),
  `processor_speed` varchar(8),
  `memory_size` varchar(8),
  `created_on` timestamp,
  `created_by` varchar(32),
  `modified_on` timestamp,
  `modified_by` varchar(32)
) */;

--
-- Temporary table structure for view `neighborhood`
--

DROP TABLE IF EXISTS `neighborhood`;
/*!50001 DROP VIEW IF EXISTS `neighborhood`*/;
/*!50001 CREATE TABLE `neighborhood` (
  `ID` int(11),
  `LOC_CODE` varchar(8),
  `NEIGHBOR_LOC_CODE` varchar(8),
  `NEIGHBOR_LOC_NAME` varchar(32),
  `DISTANCE` int(11)
) */;

--
-- Table structure for table `neighborhood_details_table`
--

DROP TABLE IF EXISTS `neighborhood_details_table`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `neighborhood_details_table` (
  `ID` int(11) NOT NULL default '0',
  `LOC_CODE` varchar(8) NOT NULL default '',
  `NEIGHBOR_LOC_CODE` varchar(8) NOT NULL default '',
  `NEIGHBOR_LOC_NAME` varchar(32) default NULL,
  `DISTANCE` int(11) default NULL,
  PRIMARY KEY  (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `neighborhood_details_table`
--

LOCK TABLES `neighborhood_details_table` WRITE;
/*!40000 ALTER TABLE `neighborhood_details_table` DISABLE KEYS */;
INSERT INTO `neighborhood_details_table` VALUES (1,'100','104','Mathikere',2),(2,'100','23','Brookefield',2),(3,'100','25','CV Raman Nagar',2),(4,'100','86','Kudlu Gate',2),(5,'100','9','Malleswaram',2),(6,'26','103','Marathalli',2),(7,'26','24','Btm Layout',2),(8,'26','25','CV Raman Nagar',2),(9,'26','27','Central Bengaluru',2),(10,'26','45','Domlur',2);
/*!40000 ALTER TABLE `neighborhood_details_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nxt_image_id`
--

DROP TABLE IF EXISTS `nxt_image_id`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `nxt_image_id` (
  `NEXT_SEQ_NO` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`NEXT_SEQ_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `nxt_image_id`
--

LOCK TABLES `nxt_image_id` WRITE;
/*!40000 ALTER TABLE `nxt_image_id` DISABLE KEYS */;
INSERT INTO `nxt_image_id` VALUES (70),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(92),(93),(95),(96),(97),(102),(103),(104),(105),(106),(107),(108),(109),(110),(111),(112);
/*!40000 ALTER TABLE `nxt_image_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nxt_post_id`
--

DROP TABLE IF EXISTS `nxt_post_id`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `nxt_post_id` (
  `NEXT_SEQ_NO` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`NEXT_SEQ_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `nxt_post_id`
--

LOCK TABLES `nxt_post_id` WRITE;
/*!40000 ALTER TABLE `nxt_post_id` DISABLE KEYS */;
INSERT INTO `nxt_post_id` VALUES (1),(3),(4),(5),(6),(14),(15),(16),(18),(19),(20),(21),(23),(24),(25),(26),(29),(30),(31),(32),(33),(34),(36),(37),(38),(39),(40),(41),(42),(45),(46),(48),(49),(50),(51),(52),(54),(55),(56),(57),(58),(59),(60),(61),(62),(70),(77),(78),(79),(80),(81),(82),(83),(84),(85),(86),(87),(88),(89),(90),(92),(93),(95),(96),(97),(100),(106),(111),(112),(113),(114),(115),(116),(117),(118),(119),(120);
/*!40000 ALTER TABLE `nxt_post_id` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `other_posts`
--

DROP TABLE IF EXISTS `other_posts`;
/*!50001 DROP VIEW IF EXISTS `other_posts`*/;
/*!50001 CREATE TABLE `other_posts` (
  `POST_ID` int(11),
  `CATEGORY` varchar(8),
  `SUB_CATEGORY` varchar(8),
  `PRODUCT_TYPE` varchar(16),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32),
  `TITLE` varchar(256),
  `CONTACT_NO` varchar(16),
  `CONTACT_PERSON_NAME` varchar(32),
  `DESCRIPTION` varchar(512),
  `IMAGE_FILE_NAME` varchar(64),
  `CORP_ID` decimal(10,0)
) */;

--
-- Temporary table structure for view `pact`
--

DROP TABLE IF EXISTS `pact`;
/*!50001 DROP VIEW IF EXISTS `pact`*/;
/*!50001 CREATE TABLE `pact` (
  `record_id` varchar(8),
  `activation_code` varchar(16),
  `user_id` int(11),
  `post_id` int(11),
  `activation_date` timestamp,
  `activation_status` varchar(8),
  `no_of_attempts` int(11),
  `last_attempt_ip` varchar(32),
  `created_on` timestamp
) */;

--
-- Temporary table structure for view `paircooler`
--

DROP TABLE IF EXISTS `paircooler`;
/*!50001 DROP VIEW IF EXISTS `paircooler`*/;
/*!50001 CREATE TABLE `paircooler` (
  `POST_ID` int(11),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `TONNAGE` double,
  `AC_TYPE` varchar(8),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32)
) */;

--
-- Temporary table structure for view `pcamera`
--

DROP TABLE IF EXISTS `pcamera`;
/*!50001 DROP VIEW IF EXISTS `pcamera`*/;
/*!50001 CREATE TABLE `pcamera` (
  `POST_ID` int(11),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `RESOLUTION` varchar(8),
  `ZOOM` varchar(8),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32)
) */;

--
-- Temporary table structure for view `pcomp`
--

DROP TABLE IF EXISTS `pcomp`;
/*!50001 DROP VIEW IF EXISTS `pcomp`*/;
/*!50001 CREATE TABLE `pcomp` (
  `post_id` decimal(10,0),
  `sub_category` varchar(8),
  `city` varchar(8),
  `location` varchar(8),
  `make` varchar(16),
  `model` varchar(32),
  `year` int(11),
  `processor_size` int(11),
  `hdd_size` int(11),
  `price` decimal(9,3),
  `created_on` datetime,
  `created_by` varchar(32),
  `modified_on` datetime,
  `modified_by` varchar(32)
) */;

--
-- Temporary table structure for view `pdau`
--

DROP TABLE IF EXISTS `pdau`;
/*!50001 DROP VIEW IF EXISTS `pdau`*/;
/*!50001 CREATE TABLE `pdau` (
  `POST_ID` decimal(10,0),
  `SUB_CATEGORY` varchar(8),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `MAKE` varchar(32),
  `MODEL` varchar(32),
  `COLOR` varchar(16),
  `YEAR` decimal(4,0),
  `NO_OF_OWNERS` decimal(2,0),
  `FUEL_TYPE` varchar(1),
  `KMS_DONE` decimal(9,0),
  `MILEAGE` decimal(4,0),
  `PRICE` decimal(9,3),
  `PRICE_NEGOTIABLE` varchar(1),
  `INSURANCE_AVAILABLE` varchar(1),
  `REG_NO` varchar(32),
  `REG_CITY` varchar(8),
  `REG_STATE` varchar(8),
  `CREATED_ON` datetime,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` datetime,
  `MODIFIED_BY` varchar(32)
) */;

--
-- Table structure for table `pdcomp`
--

DROP TABLE IF EXISTS `pdcomp`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pdcomp` (
  `post_id` decimal(10,0) NOT NULL,
  `sub_category` varchar(8) default NULL,
  `city` varchar(8) default NULL,
  `location` varchar(8) default NULL,
  `make` varchar(16) default NULL,
  `age` int(11) default NULL,
  `processor_speed` int(11) default NULL,
  `hdd_size` int(11) default NULL,
  `price` decimal(9,3) default NULL,
  `created_on` datetime default NULL,
  `created_by` varchar(32) default NULL,
  `modified_on` datetime default NULL,
  `modified_by` varchar(32) default NULL,
  PRIMARY KEY  (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pdcomp`
--

LOCK TABLES `pdcomp` WRITE;
/*!40000 ALTER TABLE `pdcomp` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdcomp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pdec`
--

DROP TABLE IF EXISTS `pdec`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `pdec` (
  `POST_ID` decimal(9,0) NOT NULL default '0',
  `MAKE` varchar(32) default NULL,
  `TYPE` varchar(32) default NULL,
  `MODEL` varchar(32) default NULL,
  `COLOR` varchar(16) default NULL,
  `PRICE` decimal(9,3) default NULL,
  `PROCESSOR_CAPACITY` varchar(16) default NULL,
  `HDD_SIZE` varchar(16) default NULL,
  `DEL_FLG` varchar(1) default NULL,
  `R_CRE_TIME` datetime default NULL,
  `R_CRE_ID` varchar(12) default NULL,
  `R_MOD_TIME` datetime default NULL,
  `R_MOD_ID` varchar(12) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `pdec`
--

LOCK TABLES `pdec` WRITE;
/*!40000 ALTER TABLE `pdec` DISABLE KEYS */;
/*!40000 ALTER TABLE `pdec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `pdmo`
--

DROP TABLE IF EXISTS `pdmo`;
/*!50001 DROP VIEW IF EXISTS `pdmo`*/;
/*!50001 CREATE TABLE `pdmo` (
  `post_id` decimal(10,0),
  `sub_category` varchar(8),
  `city` varchar(8),
  `location` varchar(8),
  `brand` varchar(16),
  `model` varchar(32),
  `smart_phone` char(1),
  `price` double,
  `year` int(11),
  `touch_screen` char(1),
  `dual_sim` char(1),
  `screen_size` double,
  `camera_resolution` double,
  `color` varchar(16),
  `operating_system` varchar(32),
  `wi_fi` char(1),
  `front_camera` char(1),
  `fm_radio` char(1),
  `processor_speed` varchar(8),
  `memory_size` varchar(8),
  `created_on` timestamp,
  `created_by` varchar(32),
  `modified_on` timestamp,
  `modified_by` varchar(32)
) */;

--
-- Temporary table structure for view `pdre`
--

DROP TABLE IF EXISTS `pdre`;
/*!50001 DROP VIEW IF EXISTS `pdre`*/;
/*!50001 CREATE TABLE `pdre` (
  `POST_ID` decimal(10,0),
  `SUB_CATEGORY` varchar(8),
  `RENT_OR_SALE` varchar(1),
  `NEW_OR_RESALE` varchar(1),
  `READY_TO_OCCUPY` varchar(1),
  `EXPECTED_COMPLETION_DATE` varchar(12),
  `AREA` varchar(8),
  `LOCATION` varchar(8),
  `CITY` varchar(8),
  `PRICE_VALUE` decimal(12,2),
  `PRICE_UNIT` varchar(8),
  `FACING_DIRECTION` varchar(3),
  `MARITAL_PREFERENCE` varchar(3),
  `FOOD_PREFERENCE` varchar(3),
  `REGIONAL_PREFERENCE` varchar(16),
  `BEDROOMS` decimal(10,0),
  `AGE_VALUE` decimal(10,0),
  `AGE_UNIT` varchar(8),
  `FURNISHED` varchar(1),
  `FLOOR_NUMBER` varchar(2),
  `MAINTENANCE` decimal(8,2),
  `APPROVAL_AUTHORITY` varchar(8),
  `BUILDER_NAME` varchar(32),
  `SHARING` varchar(1),
  `GENDER` varchar(1),
  `NO_OF_ROOMMATES` decimal(10,0),
  `CAR_PARKING` varchar(1),
  `FOOD` varchar(1),
  `WIFI` varchar(1),
  `GYM` varchar(1),
  `CHILDREN_PLAY_AREA` varchar(1),
  `SWIMMING_POOL` varchar(1),
  `CREATED_ON` datetime,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` datetime,
  `MODIFIED_BY` varchar(32),
  `CLUB_HOUSE` char(1),
  `TV` char(1),
  `POWER_BACKUP` char(1)
) */;

--
-- Temporary table structure for view `pdvd`
--

DROP TABLE IF EXISTS `pdvd`;
/*!50001 DROP VIEW IF EXISTS `pdvd`*/;
/*!50001 CREATE TABLE `pdvd` (
  `POST_ID` int(11),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `PLAYER_TYPE` varchar(8),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32)
) */;

--
-- Temporary table structure for view `pfridge`
--

DROP TABLE IF EXISTS `pfridge`;
/*!50001 DROP VIEW IF EXISTS `pfridge`*/;
/*!50001 CREATE TABLE `pfridge` (
  `POST_ID` int(11),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `COLOR` varchar(8),
  `CAPACITY` double,
  `DOUBLE_DOOR` char(1),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32)
) */;

--
-- Temporary table structure for view `pfurniture`
--

DROP TABLE IF EXISTS `pfurniture`;
/*!50001 DROP VIEW IF EXISTS `pfurniture`*/;
/*!50001 CREATE TABLE `pfurniture` (
  `POST_ID` int(11),
  `SUB_CATEGORY` varchar(8),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `TYPE` varchar(16),
  `YEAR` int(11),
  `PRICE` double,
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32)
) */;

--
-- Temporary table structure for view `poit`
--

DROP TABLE IF EXISTS `poit`;
/*!50001 DROP VIEW IF EXISTS `poit`*/;
/*!50001 CREATE TABLE `poit` (
  `POST_ID` int(11),
  `CATEGORY` varchar(8),
  `SUB_CATEGORY` varchar(8),
  `PRICE` decimal(12,2),
  `NEGOTIABLE` varchar(1),
  `TITLE` varchar(256),
  `CONTACT_NO` varchar(16),
  `CONTACT_PERSON_NAME` varchar(32),
  `DESCRIPTION` varchar(512),
  `LOCATION` varchar(8),
  `CITY` varchar(8),
  `IMAGE_FILE_NAME` varchar(64),
  `IMAGE_TYPE` varchar(8),
  `THUMBNAIL_NAME` varchar(64),
  `THUMBNAIL_TYPE` varchar(8),
  `USER_FIRST_NAME` varchar(32),
  `CORP_ID` decimal(10,0),
  `RATING` decimal(3,0),
  `POST_STATUS` varchar(8),
  `CREATED_ON` datetime,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` datetime,
  `MODIFIED_BY` varchar(32)
) */;

--
-- Table structure for table `post_activation_table`
--

DROP TABLE IF EXISTS `post_activation_table`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_activation_table` (
  `record_id` varchar(8) NOT NULL,
  `activation_code` varchar(16) default NULL,
  `user_id` int(11) default NULL,
  `post_id` int(11) default NULL,
  `activation_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `activation_status` varchar(8) default NULL,
  `no_of_attempts` int(11) default NULL,
  `last_attempt_ip` varchar(32) default NULL,
  `created_on` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_activation_table`
--

LOCK TABLES `post_activation_table` WRITE;
/*!40000 ALTER TABLE `post_activation_table` DISABLE KEYS */;
INSERT INTO `post_activation_table` VALUES ('19','COFFEE@2990',0,0,'2014-08-07 21:22:52','PEN',0,NULL,'2014-08-07 21:22:52'),('20','BREEZE@6769',0,0,'2014-08-07 21:36:54','PEN',0,NULL,'2014-08-07 21:36:54'),('21','FLOWER@2638',21,193,'2014-08-07 21:52:38','ACT',0,NULL,'2014-08-07 21:45:34'),('22','GREEN@1970',22,195,'2014-08-07 22:11:04','PEN',0,NULL,'2014-08-07 22:11:04'),('23','CHIMNEY@1683',23,196,'2014-08-07 22:36:21','ACT',0,NULL,'2014-08-07 22:34:52'),('25','HILL@8270',25,197,'2014-08-07 22:48:17','PEN',0,NULL,'2014-08-07 22:48:17'),('26','BROOK@7452',26,198,'2014-08-07 23:16:22','PEN',0,NULL,'2014-08-07 23:16:22'),('28','JUNGLE@8010',28,199,'2014-08-07 23:32:13','ACT',0,NULL,'2014-08-07 23:31:14');
/*!40000 ALTER TABLE `post_activation_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_details_aircooler`
--

DROP TABLE IF EXISTS `post_details_aircooler`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_details_aircooler` (
  `POST_ID` int(11) NOT NULL,
  `CITY` varchar(8) default NULL,
  `LOCATION` varchar(8) default NULL,
  `BRAND` varchar(16) default NULL,
  `MODEL` varchar(32) default NULL,
  `YEAR` int(11) default NULL,
  `PRICE` double default NULL,
  `BILL_AVAILABLE` char(1) default NULL,
  `TONNAGE` double default NULL,
  `AC_TYPE` varchar(8) default NULL,
  `CREATED_ON` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` timestamp NOT NULL default '0000-00-00 00:00:00',
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_details_aircooler`
--

LOCK TABLES `post_details_aircooler` WRITE;
/*!40000 ALTER TABLE `post_details_aircooler` DISABLE KEYS */;
INSERT INTO `post_details_aircooler` VALUES (160,'BLR','46','Panasonic','25 TW',2007,30000,'Y',1.5,'Window','2014-07-15 20:46:13','6','2014-07-15 20:46:13','6');
/*!40000 ALTER TABLE `post_details_aircooler` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_details_automobile`
--

DROP TABLE IF EXISTS `post_details_automobile`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_details_automobile` (
  `POST_ID` decimal(10,0) NOT NULL,
  `SUB_CATEGORY` varchar(8) default NULL,
  `CITY` varchar(8) default NULL,
  `LOCATION` varchar(8) default NULL,
  `MAKE` varchar(32) default NULL,
  `MODEL` varchar(32) default NULL,
  `COLOR` varchar(16) default NULL,
  `YEAR` decimal(4,0) default NULL,
  `NO_OF_OWNERS` decimal(2,0) default NULL,
  `FUEL_TYPE` varchar(1) default NULL,
  `KMS_DONE` decimal(9,0) default NULL,
  `MILEAGE` decimal(4,0) default NULL,
  `PRICE` decimal(9,3) default NULL,
  `PRICE_NEGOTIABLE` varchar(1) default NULL,
  `INSURANCE_AVAILABLE` varchar(1) default NULL,
  `REG_NO` varchar(32) default NULL,
  `REG_CITY` varchar(8) default NULL,
  `REG_STATE` varchar(8) default NULL,
  `CREATED_ON` datetime default NULL,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` datetime default NULL,
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_details_automobile`
--

LOCK TABLES `post_details_automobile` WRITE;
/*!40000 ALTER TABLE `post_details_automobile` DISABLE KEYS */;
INSERT INTO `post_details_automobile` VALUES ('80','1','CHE',NULL,'MAR','M1','Pearl Gray','2007','0','P','10000','0','0.000',NULL,'N',NULL,NULL,NULL,'2014-06-19 02:43:11','500','2014-06-19 02:43:11','500'),('81','1','CHE','C70','MAR','M1','Pearl Gray','2007','0',NULL,'10000','0','30000.000',NULL,NULL,NULL,NULL,NULL,'2014-06-19 02:48:53','500','2014-06-19 02:48:53','500'),('82','2','BLR','48','BAJ','M1','Pearl Gray','2007','0',NULL,'10000','0','30000.000',NULL,'N',NULL,NULL,NULL,'2014-06-19 03:06:51','500','2014-06-19 03:06:51','500'),('83','2','BLR','21','BAJ','M1','Pearl Gray','2007','0',NULL,'10000','0','40000.000',NULL,'N',NULL,NULL,NULL,'2014-06-19 03:09:39','500','2014-06-19 03:09:39','500'),('105','2','BLR','71','HON','M4','Red','2007','0',NULL,'10000','0','25000.000',NULL,NULL,NULL,NULL,NULL,'2014-06-26 00:42:46','3','2014-06-26 00:42:46','3'),('106','1','BLR','46','HYU','M1','Pearl Gray','2007','0',NULL,'10000','0','450000.000',NULL,NULL,NULL,NULL,NULL,'2014-06-26 01:04:25','3','2014-06-26 01:04:25','3'),('107','2','BLR','46','BAJ','M1','Pearl Gray','2007','1',NULL,'10000','0','30000.000',NULL,NULL,NULL,NULL,NULL,'2014-06-26 01:41:06','3','2014-06-26 01:41:06','3'),('108','2','CHE','C80','BAJ','M1','Pearl Gray','2007','1',NULL,'10000','0','30000.000',NULL,'Y',NULL,NULL,NULL,'2014-06-26 01:42:59','3','2014-06-26 01:42:59','3'),('109','1','CHE','C2','MAR','M1','Pearl Gray','2007','1','D','10000','0','150000.000',NULL,NULL,NULL,NULL,NULL,'2014-06-26 01:59:30','3','2014-06-26 01:59:30','3'),('195','2','BLR','103','BAJ','M1','Pearl Gray','2005','1',NULL,'20000','0','25000.000',NULL,'Y',NULL,NULL,NULL,'2014-08-08 03:41:04','22','2014-08-08 03:41:04','22'),('196','1','BLR','66','MAR','M1','Pearl Gray','2007','1','P','10000','0','150000.000',NULL,NULL,NULL,NULL,NULL,'2014-08-08 04:04:46','23','2014-08-08 04:04:46','23');
/*!40000 ALTER TABLE `post_details_automobile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_details_camera`
--

DROP TABLE IF EXISTS `post_details_camera`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_details_camera` (
  `POST_ID` int(11) NOT NULL,
  `CITY` varchar(8) default NULL,
  `LOCATION` varchar(8) default NULL,
  `BRAND` varchar(16) default NULL,
  `MODEL` varchar(32) default NULL,
  `YEAR` int(11) default NULL,
  `PRICE` double default NULL,
  `BILL_AVAILABLE` char(1) default NULL,
  `RESOLUTION` varchar(8) default NULL,
  `ZOOM` varchar(8) default NULL,
  `CREATED_ON` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` timestamp NOT NULL default '0000-00-00 00:00:00',
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_details_camera`
--

LOCK TABLES `post_details_camera` WRITE;
/*!40000 ALTER TABLE `post_details_camera` DISABLE KEYS */;
INSERT INTO `post_details_camera` VALUES (156,'BLR','66','Sony','25 TW',2007,30000,'Y','3.2','3.2','2014-07-15 20:30:14','6','2014-07-15 20:30:14','6');
/*!40000 ALTER TABLE `post_details_camera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_details_computers`
--

DROP TABLE IF EXISTS `post_details_computers`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_details_computers` (
  `post_id` decimal(10,0) NOT NULL,
  `sub_category` varchar(8) default NULL,
  `city` varchar(8) default NULL,
  `location` varchar(8) default NULL,
  `make` varchar(16) default NULL,
  `model` varchar(32) default NULL,
  `year` int(11) default NULL,
  `processor_size` int(11) default NULL,
  `hdd_size` int(11) default NULL,
  `price` decimal(9,3) default NULL,
  `created_on` datetime default NULL,
  `created_by` varchar(32) default NULL,
  `modified_on` datetime default NULL,
  `modified_by` varchar(32) default NULL,
  PRIMARY KEY  (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_details_computers`
--

LOCK TABLES `post_details_computers` WRITE;
/*!40000 ALTER TABLE `post_details_computers` DISABLE KEYS */;
INSERT INTO `post_details_computers` VALUES ('0','2','BLR','27','SON',NULL,2007,2,60,'30000.000','2014-07-02 01:37:33','6','2014-07-02 01:37:33','6'),('114','2','BLR','67','SON',NULL,2007,2,60,'30000.000','2014-07-02 22:54:22','6','2014-07-02 22:54:22','6'),('115','2','BLR','67','SON',NULL,2007,2,60,'30000.000','2014-07-02 23:03:24','6','2014-07-02 23:03:24','6'),('116','2','BLR','12','SON',NULL,2007,2,60,'30000.000','2014-07-02 23:34:19','6','2014-07-02 23:34:19','6'),('117','2','BLR','79','WIP',NULL,2009,3,60,'10000.000','2014-07-03 20:20:51','6','2014-07-03 20:20:51','6'),('118','2','CHE','C46','SON',NULL,2007,2,60,'30000.000','2014-07-03 20:24:15','6','2014-07-03 20:24:15','6'),('119','2','BLR','39','SON',NULL,2007,2,60,'30000.000','2014-07-03 20:39:10','6','2014-07-03 20:39:10','6'),('120','1','BLR','46','SON','Compaq Presario',2007,2,60,'30000.000','2014-07-03 21:13:46','6','2014-07-03 21:13:46','6'),('121','2','CHE','C3','SON','Compaq Presario',2007,2,60,'30000.000','2014-07-03 21:14:40','6','2014-07-03 21:14:40','6'),('122','3','BLR','21','SON','Galaxy',2007,0,0,'30000.000','2014-07-03 21:57:05','6','2014-07-03 21:57:05','6'),('123','3','BLR','5','SON','Galaxy',2007,0,0,'30000.000','2014-07-03 22:01:40','6','2014-07-03 22:01:40','6'),('178','1','BLR','26','HP','Compaq Presario',2007,2,60,'30000.000','2014-07-24 00:00:23','6','2014-07-24 00:00:23','6'),('184','3','BLR','102','SON','Galaxy',2007,0,0,'30000.000','2014-08-08 00:37:58','14','2014-08-08 00:37:58','14');
/*!40000 ALTER TABLE `post_details_computers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_details_dvd`
--

DROP TABLE IF EXISTS `post_details_dvd`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_details_dvd` (
  `POST_ID` int(11) NOT NULL,
  `CITY` varchar(8) default NULL,
  `LOCATION` varchar(8) default NULL,
  `BRAND` varchar(16) default NULL,
  `MODEL` varchar(32) default NULL,
  `YEAR` int(11) default NULL,
  `PRICE` double default NULL,
  `BILL_AVAILABLE` char(1) default NULL,
  `PLAYER_TYPE` varchar(8) default NULL,
  `CREATED_ON` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` timestamp NOT NULL default '0000-00-00 00:00:00',
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_details_dvd`
--

LOCK TABLES `post_details_dvd` WRITE;
/*!40000 ALTER TABLE `post_details_dvd` DISABLE KEYS */;
INSERT INTO `post_details_dvd` VALUES (148,'BLR','54','Philips','',0,30000,'N',NULL,'2014-07-15 19:59:37','6','2014-07-15 19:59:37','6'),(149,'BLR','54','Philips','2010',0,30000,'Y',NULL,'2014-07-15 20:00:15','6','2014-07-15 20:00:15','6'),(150,'CHE','C80','Philips','MODEL',0,30000,'N',NULL,'2014-07-15 20:02:54','6','2014-07-15 20:02:54','6'),(151,'CHE','C80','Philips','INRT32',2010,35000,'Y',NULL,'2014-07-15 20:06:57','6','2014-07-15 20:06:57','6'),(161,'BLR','46','Samsung','sd',2007,30000,'N',NULL,'2014-07-16 18:01:39','6','2014-07-16 18:01:39','6'),(181,'BLR','7','Apple','',2007,30000,'Y','IPOD','2014-07-23 20:14:24','8','2014-07-23 20:14:24','8'),(198,'CHE','C39','Samsung','',2007,30000,'N','DVD','2014-08-07 23:16:22','26','2014-08-07 23:16:22','26');
/*!40000 ALTER TABLE `post_details_dvd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_details_fridge`
--

DROP TABLE IF EXISTS `post_details_fridge`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_details_fridge` (
  `POST_ID` int(11) NOT NULL,
  `CITY` varchar(8) default NULL,
  `LOCATION` varchar(8) default NULL,
  `BRAND` varchar(16) default NULL,
  `MODEL` varchar(32) default NULL,
  `YEAR` int(11) default NULL,
  `PRICE` double default NULL,
  `BILL_AVAILABLE` char(1) default NULL,
  `COLOR` varchar(8) default NULL,
  `CAPACITY` double default NULL,
  `DOUBLE_DOOR` char(1) default NULL,
  `CREATED_ON` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` timestamp NOT NULL default '0000-00-00 00:00:00',
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_details_fridge`
--

LOCK TABLES `post_details_fridge` WRITE;
/*!40000 ALTER TABLE `post_details_fridge` DISABLE KEYS */;
INSERT INTO `post_details_fridge` VALUES (157,'BLR','46','LG','25 TW',2007,30000,'Y','135',3.2,'Y','2014-07-15 20:32:00','6','2014-07-15 20:32:00','6'),(158,'BLR','46','LG','25 TW',2007,30000,'N','135',3.2,'N','2014-07-15 20:36:33','6','2014-07-15 20:36:33','6');
/*!40000 ALTER TABLE `post_details_fridge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_details_furniture`
--

DROP TABLE IF EXISTS `post_details_furniture`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_details_furniture` (
  `POST_ID` int(11) NOT NULL,
  `SUB_CATEGORY` varchar(8) default NULL,
  `CITY` varchar(8) default NULL,
  `LOCATION` varchar(8) default NULL,
  `TYPE` varchar(16) default NULL,
  `YEAR` int(11) default NULL,
  `PRICE` double default NULL,
  `CREATED_ON` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` timestamp NOT NULL default '0000-00-00 00:00:00',
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_details_furniture`
--

LOCK TABLES `post_details_furniture` WRITE;
/*!40000 ALTER TABLE `post_details_furniture` DISABLE KEYS */;
INSERT INTO `post_details_furniture` VALUES (163,'1','BLR','68','DINING',2007,15000,'2014-07-17 19:14:18','6','2014-07-17 19:14:18','6'),(164,'1','BLR','68','DINING',2007,15000,'2014-07-17 19:14:53','6','2014-07-17 19:14:53','6'),(165,'1','BLR','68','DINING',2007,15000,'2014-07-17 19:16:07','6','2014-07-17 19:16:07','6'),(166,'1','CHE','C53','TV',2007,15000,'2014-07-17 19:36:57','6','2014-07-17 19:36:57','6'),(188,'1','BLR','96','MATTRESS',2007,15000,'2014-08-07 20:14:15','17','2014-08-07 20:14:15','17'),(189,'1','BLR','96','MATTRESS',2007,15000,'2014-08-07 20:15:17','17','2014-08-07 20:15:17','17');
/*!40000 ALTER TABLE `post_details_furniture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_details_mobile`
--

DROP TABLE IF EXISTS `post_details_mobile`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_details_mobile` (
  `post_id` decimal(10,0) NOT NULL,
  `sub_category` varchar(8) default NULL,
  `city` varchar(8) default NULL,
  `location` varchar(8) default NULL,
  `brand` varchar(16) default NULL,
  `model` varchar(32) default NULL,
  `smart_phone` char(1) default NULL,
  `price` double default NULL,
  `year` int(11) default NULL,
  `touch_screen` char(1) default NULL,
  `dual_sim` char(1) default NULL,
  `screen_size` double default NULL,
  `camera_resolution` double default NULL,
  `color` varchar(16) default NULL,
  `operating_system` varchar(32) default NULL,
  `wi_fi` char(1) default NULL,
  `front_camera` char(1) default NULL,
  `fm_radio` char(1) default NULL,
  `processor_speed` varchar(8) default NULL,
  `memory_size` varchar(8) default NULL,
  `created_on` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `created_by` varchar(32) default NULL,
  `modified_on` timestamp NOT NULL default '0000-00-00 00:00:00',
  `modified_by` varchar(32) default NULL,
  PRIMARY KEY  (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_details_mobile`
--

LOCK TABLES `post_details_mobile` WRITE;
/*!40000 ALTER TABLE `post_details_mobile` DISABLE KEYS */;
INSERT INTO `post_details_mobile` VALUES ('125','1','BLR','46','NOK','L520',NULL,30000,2007,NULL,NULL,0,0,'Black',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-08 18:49:15','6','2014-07-08 18:49:15','6'),('126','1','BLR','46','NOK','L520',NULL,30000,2007,NULL,NULL,0,0,'Black',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-08 18:50:02','6','2014-07-08 18:50:02','6'),('127','1','BLR','C60','SON','L520',NULL,30000,2007,NULL,NULL,0,0,'Black',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-08 18:52:48','6','2014-07-08 18:52:48','6'),('128','1','CHE','C3','SAM','A1',NULL,30000,2007,NULL,NULL,0,0,'Black',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-08 19:06:39','6','2014-07-08 19:06:39','6'),('129','1','BLR','143','NOK','L520',NULL,30000,2007,NULL,NULL,0,0,'Black',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-08 19:15:32','6','2014-07-08 19:15:32','6'),('130','1','BLR','40','OTH','',NULL,30000,2007,NULL,NULL,0,0,'Black',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-08 19:21:31','6','2014-07-08 19:21:31','6'),('131','1','BLR','40','OTH','test',NULL,30000,2007,NULL,NULL,0,0,'Black',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-08 19:24:10','6','2014-07-08 19:24:10','6'),('132','1','BLR','84','NOK','L520',NULL,30000,2007,NULL,NULL,0,0,'Black',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-08 19:30:40','6','2014-07-08 19:30:40','6'),('133','1','BLR','84','SAM','A1',NULL,30000,2007,NULL,NULL,0,0,'Black',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-08 19:31:32','6','2014-07-08 19:31:32','6'),('134','1','BLR','84','Samsung','A1','Y',30000,2007,'Y',NULL,3.2,3,'Black','Android 3.2','Y','N','Y','2.1','4','2014-07-08 19:33:23','6','2014-07-08 19:33:23','6'),('135','1','BLR','83','Nokia','L520','Y',30000,2007,'Y',NULL,4.5,2,'Black','Windows 8.1','Y','N','Y','2.1','3','2014-07-08 19:56:36','6','2014-07-08 19:56:36','6'),('136','1','BLR','67','LG','BL-40 Chocolate',NULL,13000,2010,'Y','N',0,0,'Red',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-14 17:12:26','6','2014-07-14 17:12:26','6'),('137','1','CHE','C70','Karbonn','Sound Wave K451+',NULL,17000,2011,'Y','N',0,0,'White',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-14 17:25:29','6','2014-07-14 17:25:29','6'),('183','1','CHE','C80','Sony','Xperia Arc',NULL,30000,2007,'N','Y',0,0,'Black',NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-07 17:38:17','6','2014-08-07 17:38:17','6'),('197','1','BLR','7','Samsung','Galaxy S Duos 2 S7582',NULL,30000,2007,'Y','Y',0,0,'Black',NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-07 22:48:17','25','2014-08-07 22:48:17','25');
/*!40000 ALTER TABLE `post_details_mobile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_details_others`
--

DROP TABLE IF EXISTS `post_details_others`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_details_others` (
  `POST_ID` int(11) NOT NULL,
  `CATEGORY` varchar(8) default NULL,
  `SUB_CATEGORY` varchar(8) default NULL,
  `PRODUCT_TYPE` varchar(16) default NULL,
  `CITY` varchar(8) default NULL,
  `LOCATION` varchar(8) default NULL,
  `BRAND` varchar(16) default NULL,
  `MODEL` varchar(32) default NULL,
  `YEAR` int(11) default NULL,
  `PRICE` double default NULL,
  `BILL_AVAILABLE` char(1) default NULL,
  `CREATED_ON` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` timestamp NOT NULL default '0000-00-00 00:00:00',
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_details_others`
--

LOCK TABLES `post_details_others` WRITE;
/*!40000 ALTER TABLE `post_details_others` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_details_others` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_details_real_estate`
--

DROP TABLE IF EXISTS `post_details_real_estate`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_details_real_estate` (
  `POST_ID` decimal(10,0) NOT NULL default '0',
  `SUB_CATEGORY` varchar(8) default NULL,
  `RENT_OR_SALE` varchar(1) default NULL,
  `NEW_OR_RESALE` varchar(1) default NULL,
  `READY_TO_OCCUPY` varchar(1) default NULL,
  `EXPECTED_COMPLETION_DATE` varchar(12) default NULL,
  `AREA` varchar(8) default NULL,
  `LOCATION` varchar(8) default NULL,
  `CITY` varchar(8) default NULL,
  `PRICE_VALUE` decimal(12,2) default NULL,
  `PRICE_UNIT` varchar(8) default NULL,
  `FACING_DIRECTION` varchar(3) default NULL,
  `MARITAL_PREFERENCE` varchar(3) default NULL,
  `FOOD_PREFERENCE` varchar(3) default NULL,
  `REGIONAL_PREFERENCE` varchar(16) default NULL,
  `BEDROOMS` decimal(10,0) default NULL,
  `AGE_VALUE` decimal(10,0) default NULL,
  `AGE_UNIT` varchar(8) default NULL,
  `FURNISHED` varchar(1) default NULL,
  `FLOOR_NUMBER` varchar(2) default NULL,
  `MAINTENANCE` decimal(8,2) default NULL,
  `APPROVAL_AUTHORITY` varchar(8) default NULL,
  `BUILDER_NAME` varchar(32) default NULL,
  `SHARING` varchar(1) default NULL,
  `GENDER` varchar(1) default NULL,
  `NO_OF_ROOMMATES` decimal(10,0) default NULL,
  `CAR_PARKING` varchar(1) default NULL,
  `FOOD` varchar(1) default NULL,
  `WIFI` varchar(1) default NULL,
  `GYM` varchar(1) default NULL,
  `CHILDREN_PLAY_AREA` varchar(1) default NULL,
  `SWIMMING_POOL` varchar(1) default NULL,
  `CREATED_ON` datetime default NULL,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` datetime default NULL,
  `MODIFIED_BY` varchar(32) default NULL,
  `CLUB_HOUSE` char(1) default NULL,
  `TV` char(1) default NULL,
  `POWER_BACKUP` char(1) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_details_real_estate`
--

LOCK TABLES `post_details_real_estate` WRITE;
/*!40000 ALTER TABLE `post_details_real_estate` DISABLE KEYS */;
INSERT INTO `post_details_real_estate` VALUES ('33','1',NULL,'N','N','9-May-2014','1200','50','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-08 12:14:03','500','2014-06-08 12:14:03','500',NULL,NULL,NULL),('34','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-08 12:28:21','500','2014-06-08 12:28:21','500',NULL,NULL,NULL),('35','1',NULL,'R','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','2','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-08 12:28:47','500','2014-06-08 12:28:47','500',NULL,NULL,NULL),('36','1',NULL,'N','Y','','1200','30','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-08 12:29:43','500','2014-06-08 12:29:43','500',NULL,NULL,NULL),('37','1',NULL,'N','Y','','1200','20','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-08 12:44:38','500','2014-06-08 12:44:38','500',NULL,NULL,NULL),('38','1',NULL,'N','Y','','800','30','BLR','2100000.00','INR','E',NULL,NULL,NULL,'4','0','YEARS',NULL,'2','0.00','BDA','MGR',NULL,NULL,'0','Y',NULL,NULL,NULL,'Y','Y','2014-06-08 16:04:47','500','2014-06-08 16:04:47','500',NULL,NULL,NULL),('39','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,'Y',NULL,'Y','2014-06-08 16:07:29','500','2014-06-08 16:07:29','500',NULL,NULL,NULL),('40','1',NULL,'N','Y','','1200','19','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'2','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,'Y','Y','2014-06-10 01:36:09','500','2014-06-10 01:36:09','500','Y',NULL,NULL),('41','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 01:50:00','500','2014-06-10 01:50:00','500',NULL,NULL,NULL),('42','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 02:12:32','500','2014-06-10 02:12:32','500',NULL,NULL,NULL),('43','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 02:16:58','500','2014-06-10 02:16:58','500',NULL,NULL,NULL),('44','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 02:38:39','500','2014-06-10 02:38:39','500',NULL,NULL,NULL),('45','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0','Y',NULL,NULL,NULL,'Y',NULL,'2014-06-10 22:28:16','500','2014-06-10 22:28:16','500',NULL,NULL,NULL),('46','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:43:47','500','2014-06-10 22:43:47','500',NULL,NULL,NULL),('47','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:44:24','500','2014-06-10 22:44:24','500',NULL,NULL,NULL),('48','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:44:31','500','2014-06-10 22:44:31','500',NULL,NULL,NULL),('49','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:44:35','500','2014-06-10 22:44:35','500',NULL,NULL,NULL),('50','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:45:59','500','2014-06-10 22:45:59','500',NULL,NULL,NULL),('51','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:46:14','500','2014-06-10 22:46:14','500',NULL,NULL,NULL),('52','1',NULL,'R','Y','','2400','46','BLR','1200000.00','INR','N',NULL,NULL,NULL,'1','3','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:48:17','500','2014-06-10 22:48:17','500',NULL,NULL,NULL),('53','1',NULL,'R','Y','','2400','46','BLR','1200000.00','INR','N',NULL,NULL,NULL,'1','3','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:49:07','500','2014-06-10 22:49:07','500',NULL,NULL,NULL),('54','1',NULL,'R','Y','','2400','46','BLR','1200000.00','INR','N',NULL,NULL,NULL,'1','3','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:49:20','500','2014-06-10 22:49:20','500',NULL,NULL,NULL),('55','1',NULL,'N','Y','','1200','12','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0','Y',NULL,NULL,NULL,NULL,NULL,'2014-06-11 22:38:43','500','2014-06-11 22:38:43','500',NULL,NULL,NULL),('56','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-11 23:22:36','500','2014-06-11 23:22:36','500',NULL,NULL,NULL),('57','2',NULL,NULL,NULL,NULL,'1200','43','BLR','3000000.00','INR','N, ',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,'Y',NULL,'2014-06-11 23:25:35','500','2014-06-11 23:25:35','500','Y',NULL,NULL),('59','2',NULL,NULL,NULL,NULL,'1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-11 23:30:47','500','2014-06-11 23:30:47','500',NULL,NULL,NULL),('60','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-11 23:48:41','500','2014-06-11 23:48:41','500',NULL,NULL,NULL),('61','3',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-11 23:50:59','500','2014-06-11 23:50:59','500',NULL,NULL,NULL),('62','4',NULL,NULL,NULL,NULL,'1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0','Y',NULL,NULL,NULL,NULL,NULL,'2014-06-12 00:04:39','500','2014-06-12 00:04:39','500',NULL,NULL,NULL),('63','2',NULL,NULL,NULL,NULL,'0','46','BLR','3000000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,'G','0.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-12 00:45:21','500','2014-06-12 00:45:21','500',NULL,NULL,NULL),('64','5',NULL,NULL,NULL,NULL,'0','46','BLR','3000000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,'G','0.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-12 00:45:59','500','2014-06-12 00:45:59','500',NULL,NULL,NULL),('65','6',NULL,NULL,NULL,NULL,'1200','46','BLR','3000000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,NULL,'0.00','BDA',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-12 00:51:57','500','2014-06-12 00:51:57','500',NULL,NULL,NULL),('66','5',NULL,NULL,NULL,NULL,'0','46','BLR','2000.00','INR',NULL,NULL,NULL,'No Preference','0','0','YEARS',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-12 00:59:43','500','2014-06-12 00:59:43','500',NULL,'Y',NULL),('67','7',NULL,NULL,NULL,NULL,'0','46','BLR','3000.00','INR',NULL,NULL,NULL,'No Preference','0','0','YEARS',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-12 01:00:40','500','2014-06-12 01:00:40','500',NULL,NULL,NULL),('68','7',NULL,NULL,NULL,NULL,'1200','46','BLR','1300.00','INR',NULL,NULL,NULL,'T','3','0','YEARS',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-12 01:03:06','500','2014-06-12 01:03:06','500',NULL,NULL,NULL),('71','2',NULL,NULL,NULL,NULL,'1300','21','BLR','12000.00','INR','E','F',NULL,NULL,'2','0','YEARS','S','G','1500.00',NULL,NULL,NULL,NULL,'0','Y',NULL,NULL,'Y','Y','Y','2014-06-12 02:10:43','500','2014-06-12 02:10:43','500','Y',NULL,NULL),('72','1',NULL,'N','Y','','1200',NULL,'BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-17 00:59:39','500','2014-06-17 00:59:39','500',NULL,NULL,NULL),('73','1',NULL,'N','Y','','1200','7','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-17 01:03:33','500','2014-06-17 01:03:33','500',NULL,NULL,NULL),('74','2',NULL,NULL,NULL,NULL,'1200','46','BLR','3000000.00','INR','N','F',NULL,NULL,'2','0','YEARS','F','G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-17 01:46:55','500','2014-06-17 01:46:55','500',NULL,NULL,NULL),('75','1',NULL,'N','Y','','1200','100','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-17 21:10:46','500','2014-06-17 21:10:46','500',NULL,NULL,NULL),('84','2',NULL,NULL,NULL,NULL,'1200','','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-20 23:56:02','500','2014-06-20 23:56:02','500',NULL,NULL,NULL),('85','2',NULL,NULL,NULL,NULL,'1200','','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 00:20:51','500','2014-06-21 00:20:51','500',NULL,NULL,NULL),('86','2',NULL,NULL,NULL,NULL,'0','','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 00:32:44','500','2014-06-21 00:32:44','500',NULL,NULL,NULL),('87','2',NULL,NULL,NULL,NULL,'0','','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 00:33:35','500','2014-06-21 00:33:35','500',NULL,NULL,NULL),('88','2',NULL,NULL,NULL,NULL,'1200','67','BLR','20000.00','INR','N',NULL,NULL,NULL,'3','0','YEARS','F','G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 00:48:13','500','2014-06-21 00:48:13','500',NULL,NULL,NULL),('89','2',NULL,NULL,NULL,NULL,'1200','46','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 00:58:52','500','2014-06-21 00:58:52','500',NULL,NULL,NULL),('90','2',NULL,NULL,NULL,NULL,'1200','46','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 08:21:47','500','2014-06-21 08:21:47','500',NULL,NULL,NULL),('91','2',NULL,NULL,NULL,NULL,'1200','46','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 08:23:08','500','2014-06-21 08:23:08','500',NULL,NULL,NULL),('92','2',NULL,NULL,NULL,NULL,'1200','46','CHE','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 08:23:36','500','2014-06-21 08:23:36','500',NULL,NULL,NULL),('93','2',NULL,NULL,NULL,NULL,'1200','46','CHE','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 08:47:28','500','2014-06-21 08:47:28','500',NULL,NULL,NULL),('94','2',NULL,NULL,NULL,NULL,'1200','46','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 08:55:31','500','2014-06-21 08:55:31','500',NULL,NULL,NULL),('95','1',NULL,'N','Y','','1395','72','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 09:15:59','500','2014-06-21 09:15:59','500',NULL,NULL,NULL),('96','4',NULL,NULL,NULL,NULL,'1200','C2','CHE','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 09:37:24','500','2014-06-21 09:37:24','500',NULL,NULL,NULL),('97','5',NULL,NULL,NULL,NULL,'0','68','BLR','20000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,'G','0.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 10:45:24','500','2014-06-21 10:45:24','500',NULL,NULL,NULL),('98','4',NULL,NULL,NULL,NULL,'1200','46','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 17:20:28','500','2014-06-21 17:20:28','500',NULL,NULL,NULL),('99','6',NULL,NULL,NULL,NULL,'2400','46','BLR','3000000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,NULL,'0.00','BDA',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 22:50:08','500','2014-06-21 22:50:08','500',NULL,NULL,NULL),('100','7',NULL,NULL,NULL,NULL,'1200','53','BLR','20000.00','INR',NULL,NULL,NULL,'No Preference','2','0','YEARS',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 22:55:30','500','2014-06-21 22:55:30','500',NULL,NULL,NULL),('101','7',NULL,NULL,NULL,NULL,'1200','53','BLR','20000.00','INR',NULL,NULL,NULL,'No Preference','2','0','YEARS',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 22:55:57','500','2014-06-21 22:55:57','500',NULL,NULL,NULL),('102','7',NULL,NULL,NULL,NULL,'1200','71','BLR','20000.00','INR',NULL,NULL,NULL,'No Preference','2','0','YEARS',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 22:56:16','500','2014-06-21 22:56:16','500',NULL,NULL,NULL),('103','2',NULL,NULL,NULL,NULL,'1200','C80','CHE','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 22:57:32','500','2014-06-21 22:57:32','500',NULL,NULL,NULL),('104','2',NULL,NULL,NULL,NULL,'1200','C11','CHE','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-22 11:50:56','3','2014-06-22 11:50:56','3',NULL,NULL,NULL),('110','1',NULL,'N','Y','','23333','52','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-26 21:44:10','3','2014-06-26 21:44:10','3',NULL,NULL,NULL),('167','2',NULL,NULL,NULL,NULL,'1200','38','BLR','25000.00','INR','W','N',NULL,NULL,'2','0','YEARS','N','G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,'Y','2014-07-22 22:56:44','6','2014-07-22 22:56:44','6','Y',NULL,NULL),('168','2',NULL,NULL,NULL,NULL,'1200','C80','CHE','12000.00','INR','E','N',NULL,NULL,'2','0','YEARS','F','G','1000.00',NULL,NULL,NULL,NULL,'0','Y',NULL,NULL,NULL,'Y',NULL,'2014-07-22 23:06:12','7','2014-07-22 23:06:12','7','Y',NULL,NULL),('169','1',NULL,'R','Y','','4000','C3','CHE','20000000.00','INR','E',NULL,NULL,NULL,'4','5','YEARS',NULL,'2','0.00','','Prestige Alpha',NULL,NULL,'0','Y',NULL,NULL,'Y','Y','Y','2014-07-23 00:10:28','7','2014-07-23 00:10:28','7','Y',NULL,'Y'),('170','4',NULL,NULL,NULL,NULL,'1200','39','BLR','16000.00','INR','N','F',NULL,NULL,'2','0','YEARS','S','4','1000.00',NULL,NULL,NULL,NULL,'0','N',NULL,NULL,NULL,NULL,NULL,'2014-07-23 00:28:05','7','2014-07-23 00:28:05','7',NULL,NULL,NULL),('171','5',NULL,NULL,NULL,NULL,'0','C9','CHE','7000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,'G','0.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-23 00:42:20','7','2014-07-23 00:42:20','7',NULL,NULL,NULL),('172','5',NULL,NULL,NULL,NULL,'0','C9','CHE','7000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,'G','0.00',NULL,NULL,NULL,NULL,'0','Y',NULL,NULL,NULL,NULL,NULL,'2014-07-23 00:42:48','7','2014-07-23 00:42:48','7',NULL,'Y',NULL),('173','5',NULL,NULL,NULL,NULL,'0','C8','CHE','7000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,'G','0.00',NULL,NULL,NULL,'M','0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-23 00:45:13','7','2014-07-23 00:45:13','7',NULL,NULL,NULL),('174','5',NULL,NULL,NULL,NULL,'0','C8','CHE','6000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,'G','0.00',NULL,NULL,NULL,'M','0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-23 00:45:46','7','2014-07-23 00:45:46','7',NULL,NULL,NULL),('175','5',NULL,NULL,NULL,NULL,'0','C64','CHE','4000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,'G','0.00',NULL,NULL,NULL,'F','0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-23 00:58:16','6','2014-07-23 00:58:16','6',NULL,NULL,NULL),('176','5',NULL,NULL,NULL,NULL,'0','C64','CHE','8000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,'3','0.00',NULL,NULL,NULL,'M','0','Y','Y','Y',NULL,NULL,NULL,'2014-07-23 01:02:16','6','2014-07-23 01:02:16','6',NULL,'Y',NULL),('177','7',NULL,NULL,NULL,NULL,'1200','71','BLR','10000.00','INR',NULL,NULL,NULL,'Tamil','2','0','YEARS',NULL,NULL,'0.00',NULL,NULL,NULL,'F','4',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-23 01:16:51','6','2014-07-23 01:16:51','6',NULL,NULL,NULL),('185','1',NULL,'N','Y','','1200','102','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,'Y',NULL,'2014-08-08 00:42:48','15','2014-08-08 00:42:48','15','Y',NULL,NULL),('186','1',NULL,'N','Y','','1200','102','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,'Y',NULL,'2014-08-08 00:43:42','15','2014-08-08 00:43:42','15','Y',NULL,NULL),('187','2',NULL,NULL,NULL,NULL,'1200','C70','CHE','20000.00','INR','N','N',NULL,NULL,'2','0','YEARS','N','G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-08 00:47:28','16','2014-08-08 00:47:28','16',NULL,NULL,NULL),('190','1',NULL,'N','Y','','1200','71','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-08 01:53:40','18','2014-08-08 01:53:40','18',NULL,NULL,NULL),('191','6',NULL,NULL,NULL,NULL,'2400','BTM','BLR','1500000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,NULL,'0.00','BDA',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-08 02:52:47','19','2014-08-08 02:52:47','19',NULL,NULL,NULL),('192','2',NULL,NULL,NULL,NULL,'1200','26','BLR','20000.00','INR','N','N',NULL,NULL,'2','0','YEARS','N','G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-08 03:06:48','20','2014-08-08 03:06:48','20',NULL,NULL,NULL),('193','5',NULL,NULL,NULL,NULL,'0','71','BLR','7000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,'G','0.00',NULL,NULL,NULL,'F','0',NULL,'Y',NULL,NULL,NULL,NULL,'2014-08-08 03:15:34','21','2014-08-08 03:15:34','21',NULL,NULL,NULL),('194','1',NULL,'N','Y','','1200','62','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-08 03:36:09','21','2014-08-08 03:36:09','21',NULL,NULL,NULL);
/*!40000 ALTER TABLE `post_details_real_estate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_details_television`
--

DROP TABLE IF EXISTS `post_details_television`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_details_television` (
  `POST_ID` int(11) NOT NULL,
  `CITY` varchar(8) default NULL,
  `LOCATION` varchar(8) default NULL,
  `BRAND` varchar(16) default NULL,
  `MODEL` varchar(32) default NULL,
  `YEAR` int(11) default NULL,
  `PRICE` double default NULL,
  `BILL_AVAILABLE` char(1) default NULL,
  `SCREEN_TYPE` varchar(8) default NULL,
  `SCREEN_SIZE` varchar(3) default NULL,
  `STABILIZER` char(1) default NULL,
  `USB` char(1) default NULL,
  `HDMI` char(1) default NULL,
  `CREATED_ON` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` timestamp NOT NULL default '0000-00-00 00:00:00',
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_details_television`
--

LOCK TABLES `post_details_television` WRITE;
/*!40000 ALTER TABLE `post_details_television` DISABLE KEYS */;
INSERT INTO `post_details_television` VALUES (152,'BLR','46','Toshiba','25 TW',2007,10000,'N','CRT','20','N','Y','N','2014-07-15 20:08:07','6','2014-07-15 20:08:07','6'),(153,'BLR','46','Toshiba','25 TW',2007,30000,'N','LED','32',NULL,NULL,NULL,'2014-07-15 20:12:52','6','2014-07-15 20:12:52','6'),(154,'BLR','46','Toshiba','25 TW',2007,30000,'N','LED','32',NULL,NULL,NULL,'2014-07-15 20:18:36','6','2014-07-15 20:18:36','6'),(155,'BLR','46','Toshiba','25 TW',2007,30000,'N','LCD','32','Y','Y','Y','2014-07-15 20:21:23','6','2014-07-15 20:21:23','6'),(179,'BLR','71','Samsung','',2010,10000,'N','LCD','32','Y','N','Y','2014-07-23 19:57:34','8','2014-07-23 19:57:34','8'),(180,'BLR','71','Akai','',2010,10000,'Y','LCD','32','Y','N','Y','2014-07-23 20:00:47','8','2014-07-23 20:00:47','8');
/*!40000 ALTER TABLE `post_details_television` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_details_washingmachine`
--

DROP TABLE IF EXISTS `post_details_washingmachine`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_details_washingmachine` (
  `POST_ID` int(11) NOT NULL,
  `CITY` varchar(8) default NULL,
  `LOCATION` varchar(8) default NULL,
  `BRAND` varchar(16) default NULL,
  `MODEL` varchar(32) default NULL,
  `YEAR` int(11) default NULL,
  `PRICE` double default NULL,
  `BILL_AVAILABLE` char(1) default NULL,
  `CREATED_ON` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` timestamp NOT NULL default '0000-00-00 00:00:00',
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_details_washingmachine`
--

LOCK TABLES `post_details_washingmachine` WRITE;
/*!40000 ALTER TABLE `post_details_washingmachine` DISABLE KEYS */;
INSERT INTO `post_details_washingmachine` VALUES (159,'BLR','108','Onida','25 TW',2007,30000,'N','2014-07-15 20:37:26','6','2014-07-15 20:37:26','6'),(162,'CHE','C6','Onida','25 TW',2007,30000,'N','2014-07-16 18:24:10','6','2014-07-16 18:24:10','6'),(182,'CHE','C13','Onida','25 TW',2007,30000,'Y','2014-07-24 03:23:21','8','2014-07-24 03:23:21','8'),(199,'BLR','46','Onida','25 TW',2007,30000,'Y','2014-08-07 23:31:14','28','2014-08-07 23:31:14','28');
/*!40000 ALTER TABLE `post_details_washingmachine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_index_table`
--

DROP TABLE IF EXISTS `post_index_table`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_index_table` (
  `POST_ID` int(11) NOT NULL auto_increment,
  `CATEGORY` varchar(8) default NULL,
  `SUB_CATEGORY` varchar(8) default NULL,
  `PRICE` decimal(12,2) default NULL,
  `NEGOTIABLE` varchar(1) default NULL,
  `TITLE` varchar(256) default NULL,
  `CONTACT_NO` varchar(16) default NULL,
  `CONTACT_PERSON_NAME` varchar(32) default NULL,
  `DESCRIPTION` varchar(512) default NULL,
  `LOCATION` varchar(8) default NULL,
  `CITY` varchar(8) default NULL,
  `IMAGE_FILE_NAME` varchar(64) default NULL,
  `IMAGE_TYPE` varchar(8) default NULL,
  `THUMBNAIL_NAME` varchar(64) default NULL,
  `THUMBNAIL_TYPE` varchar(8) default NULL,
  `USER_FIRST_NAME` varchar(32) default NULL,
  `CORP_ID` decimal(10,0) default NULL,
  `RATING` decimal(3,0) default NULL,
  `POST_STATUS` varchar(8) default NULL,
  `CREATED_ON` datetime default NULL,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` datetime default NULL,
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=200 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_index_table`
--

LOCK TABLES `post_index_table` WRITE;
/*!40000 ALTER TABLE `post_index_table` DISABLE KEYS */;
INSERT INTO `post_index_table` VALUES (1,'REAL',NULL,'9.00',NULL,'lkjlkjl',NULL,NULL,'','kjlj','BLR','Lighthouse.jpg',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-05-22 18:46:27','500','2014-05-22 18:46:27','500'),(2,'REAL',NULL,'767.00',NULL,'khsgkdfhk',NULL,NULL,'768768','jhkj','BLR','Desert.jpg',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-05-22 20:23:33','500','2014-05-22 20:23:33','500'),(3,'REAL',NULL,'0.00',NULL,'',NULL,NULL,'','','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-05-23 04:01:37','500','2014-05-23 04:01:37','500'),(4,'REAL',NULL,'0.00',NULL,'',NULL,NULL,'','','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-05-24 06:34:45','500','2014-05-24 06:34:45','500'),(5,'REAL',NULL,'230000.00',NULL,'2 BHK apartment for rent',NULL,NULL,'klkjlkj','S','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-03 23:09:30','500','2014-06-03 23:09:30','500'),(6,'REAL',NULL,'230000.00',NULL,'2 BHK apartment for rent',NULL,NULL,'klkjlkj','S','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-03 23:09:58','500','2014-06-03 23:09:58','500'),(7,'REAL',NULL,'111111.00',NULL,'2 BHK apartment for rent',NULL,NULL,'','S','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-03 23:16:09','500','2014-06-03 23:16:09','500'),(8,'REAL',NULL,'111111.00',NULL,'2 BHK apartment for rent',NULL,NULL,'','S','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-03 23:16:23','500','2014-06-03 23:16:23','500'),(9,'REAL',NULL,'1200000.00',NULL,'2 BHK apartment for rent',NULL,NULL,'sdfsdf sdf sdf sdf sdf sdf','S','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-03 23:29:19','500','2014-06-03 23:29:19','500'),(15,'REAL',NULL,'230000.00',NULL,'2 BHK apartment for rent',NULL,NULL,'','S','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-04 00:04:47','500','2014-06-04 00:04:47','500'),(16,'REAL',NULL,'3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-04 00:09:01','500','2014-06-04 00:09:01','500'),(17,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-04 21:20:18','500','2014-06-04 21:20:18','500'),(18,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-04 21:27:30','500','2014-06-04 21:27:30','500'),(19,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-04 21:28:56','500','2014-06-04 21:28:56','500'),(20,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-04 21:31:19','500','2014-06-04 21:31:19','500'),(21,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-04 21:42:09','500','2014-06-04 21:42:09','500'),(22,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-04 21:43:44','500','2014-06-04 21:43:44','500'),(23,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-04 21:44:36','500','2014-06-04 21:44:36','500'),(24,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR','1401899660618.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-04 22:04:20','500','2014-06-04 22:04:20','500'),(25,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR','1401992625279.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-05 23:53:45','500','2014-06-05 23:53:45','500'),(26,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR','1402170725476.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 01:22:05','500','2014-06-08 01:22:05','500'),(27,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','46','BLR','1402175633686.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 02:43:53','500','2014-06-08 02:43:53','500'),(28,'REAL','1','2500000.00',NULL,'2BHK For Sale','77777766666','Ajay','Hello tHis is description','31','BLR','1402197309472.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 08:45:09','500','2014-06-08 08:45:09','500'),(29,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','John','Hello tHis is description','46','BLR','1402197380916.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 08:46:20','500','2014-06-08 08:46:20','500'),(30,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402199992464.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 09:29:52','500','2014-06-08 09:29:52','500'),(31,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','John','Hello tHis is description','46','BLR','1402209500015.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 12:08:20','500','2014-06-08 12:08:20','500'),(32,'REAL',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1402209511253.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 12:08:31','500','2014-06-08 12:08:31','500'),(33,'REAL','1','3000000.00',NULL,'Ready to Occupy apartment for sale','77777766666','MGR','Hello tHis is description','50','BLR','1402209843847.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 12:14:03','500','2014-06-08 12:14:03','500'),(34,'REAL','1','3000000.00',NULL,'2BHK Apartment at Electronics City','77777766666','MGR','Hello tHis is description','46','BLR','1402210701416.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 12:28:21','500','2014-06-08 12:28:21','500'),(35,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402210727376.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 12:28:47','500','2014-06-08 12:28:47','500'),(36,'REAL','1','3000000.00',NULL,'3BHK newly finished house for sale','77777766666','MGR','Hello tHis is description','30','BLR','1402210783860.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 12:29:43','500','2014-06-08 12:29:43','500'),(37,'REAL','1','3000000.00',NULL,'Studio apartment for sale in Marathalli','77777766666','MGR','Hello tHis is description','20','BLR','1402211678720.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 12:44:38','500','2014-06-08 12:44:38','500'),(38,'REAL','1','2100000.00',NULL,'Brand new apartment - Mantri ','1234512345','Jackson','Hello tHis is description','30','BLR','1402223687963.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 16:04:47','500','2014-06-08 16:04:47','500'),(39,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402223849840.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-08 16:07:29','500','2014-06-08 16:07:29','500'),(40,'REAL','1','3000000.00',NULL,'Newly constructed flat for sale in Electronics City','77777766666','MGR','Hello tHis is description','19','BLR','1402344369754.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 01:36:09','500','2014-06-10 01:36:09','500'),(41,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402345200408.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 01:50:00','500','2014-06-10 01:50:00','500'),(42,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402346552473.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 02:12:32','500','2014-06-10 02:12:32','500'),(43,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402346818133.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 02:16:58','500','2014-06-10 02:16:58','500'),(44,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402348119512.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 02:38:39','500','2014-06-10 02:38:39','500'),(45,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402419496542.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 22:28:16','500','2014-06-10 22:28:16','500'),(46,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402420427999.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 22:43:47','500','2014-06-10 22:43:47','500'),(47,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402420464573.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 22:44:24','500','2014-06-10 22:44:24','500'),(48,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402420471090.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 22:44:31','500','2014-06-10 22:44:31','500'),(49,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402420475018.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 22:44:35','500','2014-06-10 22:44:35','500'),(50,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402420559211.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 22:45:59','500','2014-06-10 22:45:59','500'),(51,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402420574986.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 22:46:14','500','2014-06-10 22:46:14','500'),(52,'REAL','1','1200000.00',NULL,'1 BHK for resale','77777766666','MGR','Hello tHis is description','46','BLR','1402420697059.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 22:48:17','500','2014-06-10 22:48:17','500'),(53,'REAL','1','1200000.00',NULL,'1 BHK for resale','77777766666','MGR','Hello tHis is description','46','BLR','1402420747048.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 22:49:07','500','2014-06-10 22:49:07','500'),(54,'REAL','1','1200000.00',NULL,'1 BHK for resale','77777766666','MGR','Hello tHis is description','46','BLR','1402420760714.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-10 22:49:20','500','2014-06-10 22:49:20','500'),(55,'REAL','1','3000000.00',NULL,'Fully furnished 1 BHK','77777766666','MGR','Hello tHis is description','12','BLR','1402506523738.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-11 22:38:43','500','2014-06-11 22:38:43','500'),(56,'REAL','1','3000000.00',NULL,'2BHK For Rent with 24 hours water','77777766666','MGR','Hello tHis is description','46','BLR','1402509156804.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-11 23:22:36','500','2014-06-11 23:22:36','500'),(59,'REAL','2','3000000.00',NULL,'2 BHK available for immediate occupation','77777766666','MGR','Hello tHis is description','46','BLR','1402509647459.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-11 23:30:47','500','2014-06-11 23:30:47','500'),(60,'REAL','1','3000000.00',NULL,'Individual House for sale','77777766666','MGR','Hello tHis is description','46','BLR','1402510721125.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-11 23:48:41','500','2014-06-11 23:48:41','500'),(61,'REAL','3','3000000.00',NULL,'1BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402510859647.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-11 23:50:59','500','2014-06-11 23:50:59','500'),(62,'REAL','4','3000000.00',NULL,'Individual House for Rent','77777766666','MGR','Hello tHis is description','46','BLR','1402511679460.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-12 00:04:39','500','2014-06-12 00:04:39','500'),(63,'REAL','2','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402514121568.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-12 00:45:21','500','2014-06-12 00:45:21','500'),(64,'REAL','5','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402514159017.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-12 00:45:59','500','2014-06-12 00:45:59','500'),(65,'REAL','6','3000000.00',NULL,'Agricultural Land for Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402514517517.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-12 00:51:57','500','2014-06-12 00:51:57','500'),(66,'REAL','5','2000.00',NULL,'Looking for a roommate working in Infosys','77777766666','MGR','Hello tHis is description','46','BLR','1402514983201.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-12 00:59:43','500','2014-06-12 00:59:43','500'),(67,'REAL','7','3000.00',NULL,'Looking for a roommate working in Infosys','77777766666','MGR','Hello tHis is description','46','BLR','1402515040355.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-12 01:00:40','500','2014-06-12 01:00:40','500'),(68,'REAL','7','1300.00',NULL,'North Indian roommate required','77777766666','MGR','Hello tHis is description','46','BLR','1402515186839.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-12 01:03:06','500','2014-06-12 01:03:06','500'),(71,'REAL','2','12000.00',NULL,'2BHK available in Somadevpura','77777766666','MGR','Hello tHis is description','21','BLR','1402519243375.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-12 02:10:43','500','2014-06-12 02:10:43','500'),(72,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','7','BLR','1402946979743.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-17 00:59:39','500','2014-06-17 00:59:39','500'),(73,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','7','BLR','1402947213285.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-17 01:03:33','500','2014-06-17 01:03:33','500'),(74,'REAL','2','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402949815965.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-17 01:46:55','500','2014-06-17 01:46:55','500'),(75,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','100','BLR','1403019646267.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-17 21:10:46','500','2014-06-17 21:10:46','500'),(80,'AUTO','1','0.00',NULL,'Maruti Swift (TN Registration) available for Sale immediately','77777766666','MGR','Hello tHis is description','C80','CHE','1403125991736.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-19 02:43:11','500','2014-06-19 02:43:11','500'),(81,'AUTO','1','30000.00',NULL,'Maruti Swift (TN Registration) available for Sale immediately','77777766666','MGR','Hello tHis is description','C70','CHE','1403126333641.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-19 02:48:53','500','2014-06-19 02:48:53','500'),(82,'AUTO','2','30000.00',NULL,'Maruti Swift (TN Registration) available for Sale immediately','77777766666','MGR','Hello tHis is description','48','BLR','1403127411595.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-19 03:06:51','500','2014-06-19 03:06:51','500'),(83,'AUTO','2','40000.00',NULL,'Maruti Swift (TN Registration) available for Sale immediately','77777766666','MGR','Hello tHis is description','21','BLR','1403127579698.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-19 03:09:39','500','2014-06-19 03:09:39','500'),(84,'REAL','2','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','','BLR','1403288762735.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-20 23:56:02','500','2014-06-20 23:56:02','500'),(85,'REAL','2','20000.00',NULL,'h','77777766666','MGR','Hello tHis is description','','BLR','1403290251349.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 00:20:51','500','2014-06-21 00:20:51','500'),(86,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','','BLR','1403290964583.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 00:32:44','500','2014-06-21 00:32:44','500'),(87,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','','BLR','1403291015800.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 00:33:35','500','2014-06-21 00:33:35','500'),(88,'REAL','2','20000.00',NULL,'hhhh','77777766666','MGR','Hello tHis is description','67','BLR','1403291893605.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 00:48:13','500','2014-06-21 00:48:13','500'),(89,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1403292532096.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 00:58:52','500','2014-06-21 00:58:52','500'),(90,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1403319107048.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 08:21:47','500','2014-06-21 08:21:47','500'),(91,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1403319188926.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 08:23:08','500','2014-06-21 08:23:08','500'),(92,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','CHE','1403319216606.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 08:23:36','500','2014-06-21 08:23:36','500'),(93,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','CHE','1403320648575.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 08:47:28','500','2014-06-21 08:47:28','500'),(94,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1403321131394.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 08:55:31','500','2014-06-21 08:55:31','500'),(95,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','72','BLR','1403322359964.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 09:15:59','500','2014-06-21 09:15:59','500'),(96,'REAL','4','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','C2','CHE','1403323644232.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 09:37:24','500','2014-06-21 09:37:24','500'),(97,'REAL','5','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','68','BLR','1403327724562.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 10:45:24','500','2014-06-21 10:45:24','500'),(98,'REAL','4','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1403351428038.jpeg','jpeg',NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 17:20:28','500','2014-06-21 17:20:28','500'),(99,'REAL','6','3000000.00',NULL,'Land for sale in Bangalore','77777766666','MGR','Hello tHis is description','46','BLR','1403371208160.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 22:50:08','500','2014-06-21 22:50:08','500'),(100,'REAL','7','20000.00',NULL,'Apartment 2BHK For Rent','77777766666','MGR','Hello this is description','53','BLR','1403371530128.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 22:55:30','500','2014-06-21 22:55:30','500'),(101,'REAL','7','20000.00',NULL,'Apartment 2BHK For Rent','77777766666','MGR','Hello this is description','53','BLR','1403371557505.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 22:55:57','500','2014-06-21 22:55:57','500'),(102,'REAL','7','20000.00',NULL,'Apartment 2BHK For Rent','77777766666','MGR','Hello this is description','71','BLR','1403371576087.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 22:56:16','500','2014-06-21 22:56:16','500'),(103,'REAL','2','20000.00',NULL,'Apartment 2BHK For Rent','77777766666','MGR','Hello tHis is description','C80','CHE','1403371652924.null',NULL,NULL,NULL,'Shiva','123','0',NULL,'2014-06-21 22:57:32','500','2014-06-21 22:57:32','500'),(104,'REAL','2','20000.00',NULL,'Apartment 2BHK For Rent','77777766666','MGR','Hello tHis is description','C11','CHE','1403418056623.jpeg','jpeg',NULL,NULL,'Yoganand','101','0',NULL,'2014-06-22 11:50:56','3','2014-06-22 11:50:56','3'),(105,'AUTO','2','25000.00',NULL,'Honda Activa available for sale','9999933333','Jothi','Hello tHis is description','71','BLR','1403723566326.null',NULL,NULL,NULL,'Yoganand','101','0',NULL,'2014-06-26 00:42:46','3','2014-06-26 00:42:46','3'),(106,'AUTO','1','450000.00',NULL,'Honda Amaze available for Sale immediately','77777766666','MGR','Hello tHis is description','46','BLR','1403724865967.jpeg','jpeg',NULL,NULL,'Yoganand','101','0',NULL,'2014-06-26 01:04:25','3','2014-06-26 01:04:25','3'),(107,'AUTO','2','30000.00',NULL,'Honda Shine available for Sale','77777766666','MGR','Hello tHis is description','46','BLR','1403727066622.null',NULL,NULL,NULL,'Yoganand','101','0',NULL,'2014-06-26 01:41:06','3','2014-06-26 01:41:06','3'),(108,'AUTO','2','30000.00',NULL,'Bajaj bike with insurance','77777766666','MGR','Hello tHis is description','C80','CHE','1403727179072.jpeg','jpeg',NULL,NULL,'Yoganand','101','0',NULL,'2014-06-26 01:42:59','3','2014-06-26 01:42:59','3'),(109,'AUTO','1','150000.00',NULL,'Maruti Swift (TN Registration) available for Sale immediately','77777766666','MGR','Hello tHis is description','C2','CHE','1403728170073.null',NULL,NULL,NULL,'Yoganand','101','0',NULL,'2014-06-26 01:59:30','3','2014-06-26 01:59:30','3'),(110,'REAL','1','3000000.00',NULL,'dkjhskdjfj','77777766666','MGR','Hello tHis is description','52','BLR','1403799250267.null',NULL,NULL,NULL,'Yoganand','101','0',NULL,'2014-06-26 21:44:10','3','2014-06-26 21:44:10','3'),(111,'AUTO','2','30000.00',NULL,'256MB RAM available for Sale','77777766666','MGR','Hello tHis is description','19','BLR','1404244812100.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-02 01:30:12','6','2014-07-02 01:30:12','6'),(112,'AUTO','2','30000.00',NULL,'256MB RAM available for Sale','77777766666','MGR','Hello tHis is description','27','BLR','1404245253741.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-02 01:37:33','6','2014-07-02 01:37:33','6'),(114,'AUTO','2','30000.00',NULL,'256MB RAM available for Sale','77777766666','MGR','Hello tHis is description','67','BLR','1404321862836.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-02 22:54:22','6','2014-07-02 22:54:22','6'),(125,'MOBILE','1','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','46','BLR','1404845355960.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-09 00:19:15','6','2014-07-09 00:19:15','6'),(126,'MOBILE','1','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','46','BLR','1404845402861.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-09 00:20:02','6','2014-07-09 00:20:02','6'),(127,'MOBILE','1','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','C60','BLR','1404845568693.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-09 00:22:48','6','2014-07-09 00:22:48','6'),(128,'MOBILE','1','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','C3','CHE','1404846399537.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-09 00:36:39','6','2014-07-09 00:36:39','6'),(129,'MOBILE','1','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','143','BLR','1404846932728.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-09 00:45:32','6','2014-07-09 00:45:32','6'),(130,'MOBILE','1','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','40','BLR','1404847291898.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-09 00:51:31','6','2014-07-09 00:51:31','6'),(131,'MOBILE','1','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','40','BLR','1404847450463.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-09 00:54:10','6','2014-07-09 00:54:10','6'),(132,'MOBILE','1','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','84','BLR','1404847840657.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-09 01:00:40','6','2014-07-09 01:00:40','6'),(133,'MOBILE','1','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','84','BLR','1404847892824.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-09 01:01:32','6','2014-07-09 01:01:32','6'),(134,'MOBILE','1','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','84','BLR','1404848003264.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-09 01:03:23','6','2014-07-09 01:03:23','6'),(135,'MOBILE','1','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','83','BLR','1404849396870.jpeg','jpeg',NULL,NULL,'Julies','101','0',NULL,'2014-07-09 01:26:36','6','2014-07-09 01:26:36','6'),(136,'MOBILE','1','13000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','67','BLR','1405357946643.jpeg','jpeg',NULL,NULL,'Julies','101','0',NULL,'2014-07-14 22:42:26','6','2014-07-14 22:42:26','6'),(137,'MOBILE','1','17000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','C70','CHE','1405358729774.jpeg','jpeg',NULL,NULL,'Julies','101','0',NULL,'2014-07-14 22:55:29','6','2014-07-14 22:55:29','6'),(148,'COMP','1','30000.00',NULL,'Philips Blue Ray DVD Player available for Sale in Marathalli','98431203943','Arunachalam','','54','BLR','1405454377456.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 01:29:37','6','2014-07-16 01:29:37','6'),(149,'ELEC','1','30000.00',NULL,'Philips Blue Ray DVD Player available for Sale in Marathalli','98431203943','Arunachalam','','54','BLR','1405454415011.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 01:30:15','6','2014-07-16 01:30:15','6'),(150,'ELEC','1','30000.00',NULL,'Philips Blue Ray DVD Player available for Sale in Marathalli','98431203943','Arunachalam','','C80','CHE','1405454574265.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 01:32:54','6','2014-07-16 01:32:54','6'),(151,'ELEC','1','35000.00',NULL,'Philips Blue Ray DVD Player available for Sale in Marathalli','98431203943','Arunachalam','','C80','CHE','1405454817414.jpeg','jpeg',NULL,NULL,'Julies','101','0',NULL,'2014-07-16 01:36:57','6','2014-07-16 01:36:57','6'),(152,'ELEC','1','10000.00',NULL,'Toshiba LCD TV available for sale','98431203943','Arunachalam','','46','BLR','1405454887547.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 01:38:07','6','2014-07-16 01:38:07','6'),(153,'ELEC','1','30000.00',NULL,'Toshiba LCD TV available for sale','98431203943','Arunachalam','','46','BLR','1405455172316.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 01:42:52','6','2014-07-16 01:42:52','6'),(154,'ELEC','1','30000.00',NULL,'Toshiba LCD TV available for sale','98431203943','Arunachalam','','46','BLR','1405455516959.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 01:48:36','6','2014-07-16 01:48:36','6'),(155,'ELEC','1','30000.00',NULL,'Toshiba LCD TV available for sale','98431203943','Arunachalam','','46','BLR','1405455683351.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 01:51:23','6','2014-07-16 01:51:23','6'),(156,'ELEC','1','30000.00',NULL,'Sony Digital Camera available for sale','98431203943','Arunachalam','','66','BLR','1405456214940.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 02:00:14','6','2014-07-16 02:00:14','6'),(157,'ELEC','1','30000.00',NULL,'LG Fridge (165 l) for sale','98431203943','Arunachalam','','46','BLR','1405456320148.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 02:02:00','6','2014-07-16 02:02:00','6'),(158,'ELEC','1','30000.00',NULL,'LG Fridge (165 l) for sale','98431203943','Arunachalam','','46','BLR','1405456593291.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 02:06:33','6','2014-07-16 02:06:33','6'),(159,'ELEC','1','30000.00',NULL,'Onida Washing Machine available for sale','98431203943','Arunachalam','','108','BLR','1405456646308.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 02:07:26','6','2014-07-16 02:07:26','6'),(160,'ELEC','1','30000.00',NULL,'Panasonic 1 Ton AC available for sale','98431203943','Arunachalam','','46','BLR','1405457173690.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 02:16:13','6','2014-07-16 02:16:13','6'),(161,'ELEC','1','30000.00',NULL,'Philips Blue Ray DVD Player available for Sale in Marathalli','98431203943','Arunachalam','','46','BLR','1405533699594.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 23:31:39','6','2014-07-16 23:31:39','6'),(162,'ELEC','1','30000.00',NULL,'Onida Washing Machine available for sale','98431203943','Arunachalam','A very good washing machine in mint condition available for immediate sale. Original bill not available.','C6','CHE','1405535050647.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-16 23:54:10','6','2014-07-16 23:54:10','6'),(163,'FURN','1','15000.00',NULL,'Used Dining Table For Sale','98431203943','Arunachalam','','68','BLR','1405624458066.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-18 00:44:18','6','2014-07-18 00:44:18','6'),(164,'FURN','1','15000.00',NULL,'Used Dining Table For Sale','98431203943','Arunachalam','','68','BLR','1405624493243.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-18 00:44:53','6','2014-07-18 00:44:53','6'),(165,'FURN','1','15000.00',NULL,'Used Dining Table For Sale','98431203943','Arunachalam','','68','BLR','1405624567532.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-18 00:46:07','6','2014-07-18 00:46:07','6'),(166,'FURN','1','15000.00',NULL,'New TV Stand in Nanganallur','98431203943','Arunachalam','','C53','CHE','1405625817390.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-18 01:06:57','6','2014-07-18 01:06:57','6'),(167,'REAL','2','25000.00',NULL,'Apartment 2BHK For Rent','9999988888','Dev','Hello tHis is description','38','BLR','1406050004640.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-22 22:56:44','6','2014-07-22 22:56:44','6'),(168,'REAL','2','12000.00',NULL,'New Apartment for Rent by Sachin','9903990940','John','New apartment. Owner stays outside. Decent locality.','C80','CHE','1406050572391.jpeg','jpeg',NULL,NULL,'Sachin','100','0',NULL,'2014-07-22 23:06:12','7','2014-07-22 23:06:12','7'),(169,'REAL','1','20000000.00',NULL,'3BHK available in Adayar for sale','77777766666','MGR','Hello tHis is description','C3','CHE','1406054428613.null',NULL,NULL,NULL,'Sachin','100','0',NULL,'2014-07-23 00:10:28','7','2014-07-23 00:10:28','7'),(170,'REAL','4','16000.00',NULL,'Individual House for Rent - 3BHK','77777766666','MGR','Hello tHis is description','39','BLR','1406055485563.null',NULL,NULL,NULL,'Sachin','100','0',NULL,'2014-07-23 00:28:05','7','2014-07-23 00:28:05','7'),(171,'REAL','5','7000.00',NULL,'PG accommodation for girls','77777766666','MGR','Hello tHis is description','C9','CHE','1406056340126.null',NULL,NULL,NULL,'Sachin','100','0',NULL,'2014-07-23 00:42:20','7','2014-07-23 00:42:20','7'),(172,'REAL','5','7000.00',NULL,'PG accommodation for girls','77777766666','MGR','Hello tHis is description','C9','CHE','1406056368093.null',NULL,NULL,NULL,'Sachin','100','0',NULL,'2014-07-23 00:42:48','7','2014-07-23 00:42:48','7'),(173,'REAL','5','7000.00',NULL,'PG accommodation for girls','77777766666','MGR','Hello tHis is description','C8','CHE','1406056513903.null',NULL,NULL,NULL,'Sachin','100','0',NULL,'2014-07-23 00:45:13','7','2014-07-23 00:45:13','7'),(174,'REAL','5','6000.00',NULL,'PG accommodation for girls','77777766666','MGR','Hello tHis is description','C8','CHE','1406056546735.null',NULL,NULL,NULL,'Sachin','100','0',NULL,'2014-07-23 00:45:46','7','2014-07-23 00:45:46','7'),(175,'REAL','5','4000.00',NULL,'PG accommodation for girls','77777766666','MGR','Hello tHis is description','C64','CHE','1406057296501.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-23 00:58:16','6','2014-07-23 00:58:16','6'),(176,'REAL','5','8000.00',NULL,'PG accommodation for boys','77777766666','MGR','PG Accommodation for Gents','C64','CHE','1406057536477.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-23 01:02:16','6','2014-07-23 01:02:16','6'),(177,'REAL','7','10000.00',NULL,'Looking for a roommate','77777766666','MGR','Hello this is description','71','BLR','1406058411572.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-23 01:16:51','6','2014-07-23 01:16:51','6'),(178,'COMP','1','30000.00',NULL,'Acer Desktop available for Sale','77777766666','MGR','','26','BLR','1406140223502.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-07-24 00:00:23','6','2014-07-24 00:00:23','6'),(179,'ELEC','1','10000.00',NULL,'Samsung 32\" LCD TV available for sale','98431203943','Arunachalam','TV for sale.','71','BLR','1406145454814.null',NULL,NULL,NULL,'Dhoni','123','0',NULL,'2014-07-24 01:27:34','8','2014-07-24 01:27:34','8'),(180,'ELEC','1','10000.00',NULL,'Akai CRT for sale','98431203943','Arunachalam','TV for sale.','71','BLR','1406145647496.null',NULL,NULL,NULL,'Dhoni','123','0',NULL,'2014-07-24 01:30:47','8','2014-07-24 01:30:47','8'),(181,'ELEC','2','30000.00',NULL,'iPod available for Sale','98431203943','Arunachalam','','7','BLR','1406146464779.null',NULL,NULL,NULL,'Dhoni','123','0',NULL,'2014-07-24 01:44:24','8','2014-07-24 01:44:24','8'),(182,'ELEC','5','30000.00',NULL,'Onida Washing Machine available for sale','98431203943','Arunachalam','','C13','CHE','1406172201497.null',NULL,NULL,NULL,'Dhoni','123','0',NULL,'2014-07-24 08:53:21','8','2014-07-24 08:53:21','8'),(183,'MOBILE','1','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','C80','CHE','1407433097841.null',NULL,NULL,NULL,'Julies','101','0',NULL,'2014-08-07 23:08:17','6','2014-08-07 23:08:17','6'),(184,'COMP','3','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','102','BLR','1407438478588.null',NULL,NULL,NULL,NULL,'0','0',NULL,'2014-08-08 00:37:58','14','2014-08-08 00:37:58','14'),(185,'REAL','1','3000000.00',NULL,'kklklkl','77777766666','MGR','Hello tHis is description','102','BLR','1407438768508.null',NULL,NULL,NULL,NULL,'0','0','PEN','2014-08-08 00:42:48','15','2014-08-08 00:42:48','15'),(186,'REAL','1','3000000.00',NULL,'kklklkl','77777766666','MGR','Hello tHis is description','102','BLR','1407438822844.jpeg','jpeg',NULL,NULL,NULL,'0','0','PEN','2014-08-08 00:43:42','15','2014-08-08 00:43:42','15'),(187,'REAL','2','20000.00',NULL,'Apartment 2BHK For Rent','77777766666','MGR','Hello tHis is description','C70','CHE','1407439048312.jpeg','jpeg',NULL,NULL,'indi','123','0','PEN','2014-08-08 00:47:28','16','2014-08-08 00:47:28','16'),(188,'FURN',NULL,'15000.00',NULL,'Used Dining Table For Sale','98431203943','Arunachalam','','96','BLR','1407442455872.jpeg','jpeg',NULL,NULL,'sulo','123','0',NULL,'2014-08-08 01:44:15','17','2014-08-08 01:44:15','17'),(189,'FURN',NULL,'15000.00',NULL,'Used Dining Table For Sale','98431203943','Arunachalam','','96','BLR','1407442517699.jpeg','jpeg',NULL,NULL,'sulo','123','0',NULL,'2014-08-08 01:45:17','17','2014-08-08 01:45:17','17'),(190,'REAL','1','3000000.00',NULL,'2bhk for sale','77777766666','MGR','Hello tHis is description','71','BLR','1407443020382.null',NULL,NULL,NULL,'queen','100','0','PEN','2014-08-08 01:53:40','18','2014-08-08 01:53:40','18'),(191,'REAL','6','1500000.00',NULL,'Land for sale in Bangalore','77777766666','MGR','Hello tHis is description','BTM','BLR','1407446567828.null',NULL,NULL,NULL,'cbuddy','100','0','PEN','2014-08-08 02:52:47','19','2014-08-08 02:52:47','19'),(192,'REAL','2','20000.00',NULL,'Apartment 2BHK For Rent','77777766666','MGR','Hello tHis is description','26','BLR','1407447408837.null',NULL,NULL,NULL,'jadeja','100','0','PEN','2014-08-08 03:06:48','20','2014-08-08 03:06:48','20'),(193,'REAL','5','7000.00',NULL,'PG accommodation for girls','77777766666','MGR','Hello tHis is description','71','BLR','1407447934725.null',NULL,NULL,NULL,'dravid','100','0','ACT','2014-08-08 03:15:34','21','2014-08-08 03:22:38','21'),(194,'REAL','1','3000000.00',NULL,'without ap','77777766666','MGR','Hello tHis is description','62','BLR','1407449169557.null',NULL,NULL,NULL,'dravid','100','0','ACT','2014-08-08 03:36:09','21','2014-08-08 03:36:09','21'),(195,'REAL','2','25000.00',NULL,'Pre approv - Honda Shine available for Sale','77777766666','MGR','Hello tHis is description','103','BLR','1407449464775.null',NULL,NULL,NULL,'kumar','103','0','PEN','2014-08-08 03:41:04','22','2014-08-08 03:41:04','22'),(196,'AUTO','1','150000.00',NULL,'Maruti Swift (TN Registration) available for Sale immediately','77777766666','MGR','Hello tHis is description','66','BLR','1407450886300.null',NULL,NULL,NULL,'jaishankar','100','0','ACT','2014-08-08 04:04:46','23','2014-08-08 04:06:21','23'),(197,'MOBILE','1','30000.00',NULL,'Samsung Galaxy available for sale','77777766666','MGR','','7','BLR','1407451697087.null',NULL,NULL,NULL,'pujar','100','0','PEN','2014-08-08 04:18:17','25','2014-08-08 04:18:17','25'),(198,'ELEC','2','30000.00',NULL,'Pre-approval','98431203943','Arunachalam','','C39','CHE','1407453382799.null',NULL,NULL,NULL,'apj','103','0','PEN','2014-08-08 04:46:22','26','2014-08-08 04:46:22','26'),(199,'ELEC','6','30000.00',NULL,'Onida Washing Machine available for sale','98431203943','Arunachalam','','46','BLR','1407454274532.null',NULL,NULL,NULL,'Shiva','100','0','ACT','2014-08-08 05:01:14','28','2014-08-08 05:02:13','28');
/*!40000 ALTER TABLE `post_index_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_picture`
--

DROP TABLE IF EXISTS `post_picture`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `post_picture` (
  `PIC_ID` decimal(10,0) NOT NULL default '0',
  `POST_ID` decimal(10,0) default NULL,
  `S_NO` varchar(64) default NULL,
  `MAIN_PIC` varchar(0) default NULL,
  `THUMBNAIL_PIC` varchar(0) default NULL,
  `PIC_TYPE` varchar(8) default NULL,
  `CREATED_ON` datetime default NULL,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` datetime default NULL,
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`PIC_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_picture`
--

LOCK TABLES `post_picture` WRITE;
/*!40000 ALTER TABLE `post_picture` DISABLE KEYS */;
/*!40000 ALTER TABLE `post_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `pothers`
--

DROP TABLE IF EXISTS `pothers`;
/*!50001 DROP VIEW IF EXISTS `pothers`*/;
/*!50001 CREATE TABLE `pothers` (
  `POST_ID` int(11),
  `CATEGORY` varchar(8),
  `SUB_CATEGORY` varchar(8),
  `PRODUCT_TYPE` varchar(16),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32)
) */;

--
-- Temporary table structure for view `ppic`
--

DROP TABLE IF EXISTS `ppic`;
/*!50001 DROP VIEW IF EXISTS `ppic`*/;
/*!50001 CREATE TABLE `ppic` (
  `PIC_ID` decimal(10,0),
  `POST_ID` decimal(10,0),
  `S_NO` varchar(64),
  `MAIN_PIC` varchar(0),
  `THUMBNAIL_PIC` varchar(0),
  `PIC_TYPE` varchar(8),
  `CREATED_ON` datetime,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` datetime,
  `MODIFIED_BY` varchar(32)
) */;

--
-- Temporary table structure for view `ptelevision`
--

DROP TABLE IF EXISTS `ptelevision`;
/*!50001 DROP VIEW IF EXISTS `ptelevision`*/;
/*!50001 CREATE TABLE `ptelevision` (
  `POST_ID` int(11),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `SCREEN_TYPE` varchar(8),
  `SCREEN_SIZE` varchar(3),
  `STABILIZER` char(1),
  `USB` char(1),
  `HDMI` char(1),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32)
) */;

--
-- Temporary table structure for view `ptv`
--

DROP TABLE IF EXISTS `ptv`;
/*!50001 DROP VIEW IF EXISTS `ptv`*/;
/*!50001 CREATE TABLE `ptv` (
  `POST_ID` int(11),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `SCREEN_TYPE` varchar(8),
  `SCREEN_SIZE` varchar(3),
  `STABILIZER` char(1),
  `USB` char(1),
  `HDMI` char(1),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32)
) */;

--
-- Temporary table structure for view `pwashingmachine`
--

DROP TABLE IF EXISTS `pwashingmachine`;
/*!50001 DROP VIEW IF EXISTS `pwashingmachine`*/;
/*!50001 CREATE TABLE `pwashingmachine` (
  `POST_ID` int(11),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32)
) */;

--
-- Temporary table structure for view `real_estate_posts`
--

DROP TABLE IF EXISTS `real_estate_posts`;
/*!50001 DROP VIEW IF EXISTS `real_estate_posts`*/;
/*!50001 CREATE TABLE `real_estate_posts` (
  `POST_ID` decimal(10,0),
  `SUB_CATEGORY` varchar(8),
  `RENT_OR_SALE` varchar(1),
  `NEW_OR_RESALE` varchar(1),
  `READY_TO_OCCUPY` varchar(1),
  `EXPECTED_COMPLETION_DATE` varchar(12),
  `AREA` varchar(8),
  `LOCATION` varchar(8),
  `CITY` varchar(8),
  `PRICE_VALUE` decimal(12,2),
  `PRICE_UNIT` varchar(8),
  `FACING_DIRECTION` varchar(3),
  `MARITAL_PREFERENCE` varchar(3),
  `FOOD_PREFERENCE` varchar(3),
  `REGIONAL_PREFERENCE` varchar(16),
  `BEDROOMS` decimal(10,0),
  `AGE_VALUE` decimal(10,0),
  `AGE_UNIT` varchar(8),
  `FURNISHED` varchar(1),
  `FLOOR_NUMBER` varchar(2),
  `MAINTENANCE` decimal(8,2),
  `APPROVAL_AUTHORITY` varchar(8),
  `BUILDER_NAME` varchar(32),
  `SHARING` varchar(1),
  `GENDER` varchar(1),
  `NO_OF_ROOMMATES` decimal(10,0),
  `CAR_PARKING` varchar(1),
  `FOOD` varchar(1),
  `WIFI` varchar(1),
  `GYM` varchar(1),
  `CHILDREN_PLAY_AREA` varchar(1),
  `SWIMMING_POOL` varchar(1),
  `CREATED_ON` datetime,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` datetime,
  `MODIFIED_BY` varchar(32),
  `CLUB_HOUSE` char(1),
  `TV` char(1),
  `POWER_BACKUP` char(1),
  `TITLE` varchar(256),
  `CONTACT_NO` varchar(16),
  `CONTACT_PERSON_NAME` varchar(32),
  `DESCRIPTION` varchar(512),
  `IMAGE_FILE_NAME` varchar(64),
  `CORP_ID` decimal(10,0),
  `post_status` varchar(8)
) */;

--
-- Table structure for table `sloct`
--

DROP TABLE IF EXISTS `sloct`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `sloct` (
  `STATE_CODE` varchar(8) NOT NULL default '',
  `CITY_CODE` varchar(8) NOT NULL default '',
  `LOC_CODE` varchar(8) NOT NULL default '',
  `SLOC_CODE` varchar(8) NOT NULL default '',
  `SLOC_NAME` varchar(32) default NULL,
  `DEL_FLG` varchar(1) default NULL,
  `R_CRE_TIME` datetime default NULL,
  `R_CRE_ID` varchar(12) default NULL,
  `R_MOD_TIME` datetime default NULL,
  `R_MOD_ID` varchar(12) default NULL,
  PRIMARY KEY  (`STATE_CODE`,`CITY_CODE`,`LOC_CODE`,`SLOC_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `sloct`
--

LOCK TABLES `sloct` WRITE;
/*!40000 ALTER TABLE `sloct` DISABLE KEYS */;
INSERT INTO `sloct` VALUES ('KA','BLR','HSR','S1','Sector 1','N','2013-08-15 07:01:16','MANUAL','2013-08-15 07:01:16','MANUAL'),('KA','BLR','HSR','S2','Sector 2','N','2013-08-15 07:01:16','MANUAL','2013-08-15 07:01:16','MANUAL'),('KA','BLR','HSR','S3','Sector 3','N','2013-08-15 07:01:16','MANUAL','2013-08-15 07:01:16','MANUAL'),('KA','BLR','HSR','S4','Sector 4','N','2013-08-15 07:01:16','MANUAL','2013-08-15 07:01:16','MANUAL'),('KA','BLR','HSR','S5','Sector 5','N','2013-08-15 07:01:16','MANUAL','2013-08-15 07:01:16','MANUAL'),('KA','BLR','HSR','S6','Sector 6','N','2013-08-15 07:01:16','MANUAL','2013-08-15 07:01:16','MANUAL'),('KA','BLR','HSR','S7','Sector 7','N','2013-08-15 07:01:16','MANUAL','2013-08-15 07:01:16','MANUAL'),('KA','BLR','JAYANGR','B1','Jayanagar 1st Block','N','2013-08-15 07:01:16','MANUAL','2013-08-15 07:01:16','MANUAL'),('KA','BLR','JAYANGR','B2','Jayanagar 2nd Block','N','2013-08-15 07:01:16','MANUAL','2013-08-15 07:01:16','MANUAL'),('KA','BLR','JAYANGR','B3','Jayanagar 3rd Block','N','2013-08-15 07:01:16','MANUAL','2013-08-15 07:01:16','MANUAL'),('KA','BLR','JAYANGR','B4','Jayanagar 4th Block','N','2013-08-15 07:01:16','MANUAL','2013-08-15 07:01:16','MANUAL');
/*!40000 ALTER TABLE `sloct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state`
--

DROP TABLE IF EXISTS `state`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `state` (
  `STATE_CODE` varchar(8) NOT NULL default '',
  `STATE_NAME` varchar(32) default NULL,
  `DEL_FLG` varchar(1) default NULL,
  `R_CRE_TIME` datetime default NULL,
  `R_CRE_ID` varchar(12) default NULL,
  `R_MOD_TIME` datetime default NULL,
  `R_MOD_ID` varchar(12) default NULL,
  PRIMARY KEY  (`STATE_CODE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `state`
--

LOCK TABLES `state` WRITE;
/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` VALUES ('KA','Karnataka','N','2013-08-15 06:47:35','MANUAL','2013-08-15 06:47:35','MANUAL'),('TN','Tamil Nadu','N','2013-08-15 06:47:34','MANUAL','2013-08-15 06:47:34','MANUAL');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `television_posts`
--

DROP TABLE IF EXISTS `television_posts`;
/*!50001 DROP VIEW IF EXISTS `television_posts`*/;
/*!50001 CREATE TABLE `television_posts` (
  `POST_ID` int(11),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `SCREEN_TYPE` varchar(8),
  `SCREEN_SIZE` varchar(3),
  `STABILIZER` char(1),
  `USB` char(1),
  `HDMI` char(1),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32),
  `TITLE` varchar(256),
  `CONTACT_NO` varchar(16),
  `CONTACT_PERSON_NAME` varchar(32),
  `DESCRIPTION` varchar(512),
  `IMAGE_FILE_NAME` varchar(64),
  `CORP_ID` decimal(10,0),
  `post_status` varchar(8)
) */;

--
-- Temporary table structure for view `uact`
--

DROP TABLE IF EXISTS `uact`;
/*!50001 DROP VIEW IF EXISTS `uact`*/;
/*!50001 CREATE TABLE `uact` (
  `record_id` varchar(8),
  `activation_code` varchar(16),
  `user_id` int(11),
  `activation_date` timestamp,
  `activation_status` varchar(8),
  `no_of_attempts` int(11),
  `last_attempt_ip` varchar(32),
  `created_on` timestamp
) */;

--
-- Temporary table structure for view `ucred`
--

DROP TABLE IF EXISTS `ucred`;
/*!50001 DROP VIEW IF EXISTS `ucred`*/;
/*!50001 CREATE TABLE `ucred` (
  `CORP_ID` decimal(5,0),
  `USER_ID` int(11),
  `CORP_EMAIL_ID` varchar(64),
  `PWD` varchar(16),
  `MOBILE_NO` varchar(12),
  `NO_OF_ATMPTS` decimal(10,0),
  `LAST_LOGIN_TIME` datetime,
  `PWD_EXPIRY_DATE` datetime,
  `CREATED_ON` datetime,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` datetime,
  `MODIFIED_BY` varchar(32)
) */;

--
-- Temporary table structure for view `uprof`
--

DROP TABLE IF EXISTS `uprof`;
/*!50001 DROP VIEW IF EXISTS `uprof`*/;
/*!50001 CREATE TABLE `uprof` (
  `USER_ID` decimal(16,0),
  `CORP_ID` decimal(8,0),
  `FIRST_NAME` varchar(32),
  `LAST_NAME` varchar(32),
  `GENDER` varchar(1),
  `DOB` varchar(12),
  `ADDRESS` varchar(64),
  `PINCODE` varchar(6),
  `CITY` varchar(8),
  `PERSONAL_EMAIL_ID` varchar(64),
  `MOBILE_NO` varchar(12),
  `ALTERNATE_NO` varchar(12),
  `USER_CATEGORY` varchar(8),
  `USER_STATUS` varchar(8),
  `USER_RATING` varchar(3),
  `EMAIL_VERIFICATION_STATUS` varchar(3),
  `MOBILE_VERIFICATION_STATUS` varchar(3),
  `CREATED_ON` datetime,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` datetime,
  `MODIFIED_BY` varchar(32),
  `location` varchar(8)
) */;

--
-- Table structure for table `user_activation_table`
--

DROP TABLE IF EXISTS `user_activation_table`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_activation_table` (
  `record_id` varchar(8) NOT NULL,
  `activation_code` varchar(16) default NULL,
  `user_id` int(11) default NULL,
  `activation_date` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `activation_status` varchar(8) default NULL,
  `no_of_attempts` int(11) default NULL,
  `last_attempt_ip` varchar(32) default NULL,
  `created_on` timestamp NOT NULL default '0000-00-00 00:00:00',
  PRIMARY KEY  (`record_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_activation_table`
--

LOCK TABLES `user_activation_table` WRITE;
/*!40000 ALTER TABLE `user_activation_table` DISABLE KEYS */;
INSERT INTO `user_activation_table` VALUES ('19','COFFEE@2990',19,'2014-08-07 21:22:25','PEN',0,NULL,'2014-08-07 21:22:25'),('20','BREEZE@6769',20,'2014-08-07 21:36:30','PEN',0,NULL,'2014-08-07 21:36:30'),('21','FLOWER@2638',21,'2014-08-07 21:52:38','ACT',0,NULL,'2014-08-07 21:45:13'),('22','GREEN@1970',22,'2014-08-07 22:10:13','PEN',0,NULL,'2014-08-07 22:10:13'),('23','CHIMNEY@1683',23,'2014-08-07 22:36:21','ACT',0,NULL,'2014-08-07 22:34:08'),('24','BREEZE@3959',24,'2014-08-07 22:42:29','PEN',0,NULL,'2014-08-07 22:42:29'),('25','HILL@8270',25,'2014-08-07 22:47:49','PEN',0,NULL,'2014-08-07 22:47:48'),('26','BROOK@7452',26,'2014-08-07 23:15:46','PEN',0,NULL,'2014-08-07 23:15:46'),('28','JUNGLE@8010',28,'2014-08-07 23:32:13','ACT',0,NULL,'2014-08-07 23:30:49'),('29','FOUNTAIN@8945',29,'2014-08-07 23:50:50','PEN',0,NULL,'2014-08-07 23:50:50'),('30','FOUNTAIN@4352',30,'2014-08-07 23:56:42','ACT',0,NULL,'2014-08-07 23:55:52');
/*!40000 ALTER TABLE `user_activation_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_credentials`
--

DROP TABLE IF EXISTS `user_credentials`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_credentials` (
  `CORP_ID` decimal(5,0) default NULL,
  `USER_ID` int(11) NOT NULL auto_increment,
  `CORP_EMAIL_ID` varchar(64) default NULL,
  `PWD` varchar(16) default NULL,
  `MOBILE_NO` varchar(12) default NULL,
  `NO_OF_ATMPTS` decimal(10,0) default NULL,
  `LAST_LOGIN_TIME` datetime default NULL,
  `PWD_EXPIRY_DATE` datetime default NULL,
  `CREATED_ON` datetime default NULL,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` datetime default NULL,
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`USER_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_credentials`
--

LOCK TABLES `user_credentials` WRITE;
/*!40000 ALTER TABLE `user_credentials` DISABLE KEYS */;
INSERT INTO `user_credentials` VALUES ('0',1,'shiva@infosys.com','test23','9999999999','0',NULL,NULL,'2014-06-22 11:09:22','SYSTEM','2014-06-22 11:09:22','SYSTEM'),('0',2,'sachin@corporate.com','test','9999977777','0',NULL,NULL,'2014-06-22 11:41:50','SYSTEM','2014-06-22 11:41:50','SYSTEM'),('0',3,'yoganand@cts.com','test123','9999911111','0','2014-06-26 21:40:54',NULL,'2014-06-22 11:46:44','SYSTEM','2014-06-26 21:40:54','3'),('0',4,'iiii@gmail.ccom','test','1231221232','0',NULL,NULL,'2014-06-22 13:48:03','SYSTEM','2014-06-22 13:48:03','SYSTEM'),('0',5,'gopi@tcs.com','test','9999944444','0',NULL,NULL,'2014-06-27 07:58:56','SYSTEM','2014-06-27 07:58:56','SYSTEM'),('0',6,'julies@cts.com','test','9999922222','0','2014-08-07 23:07:49',NULL,'2014-06-30 06:30:04','SYSTEM','2014-08-07 23:07:49','6'),('0',7,'sachin@wipro.com','test','8888877777','0','2014-07-23 23:34:33',NULL,'2014-07-22 23:04:06','SYSTEM','2014-07-23 23:34:33','7'),('0',8,'dhoni@infosys.com','test','8888838383','0','2014-07-24 08:52:49',NULL,'2014-07-24 00:16:32','SYSTEM','2014-07-24 08:52:49','8'),('0',9,'pujara@infosys.com','test','9888899999','0',NULL,NULL,'2014-08-08 00:22:34','SYSTEM','2014-08-08 00:22:34','SYSTEM'),('0',10,'chetan@infosys.com','test','9888899999','0',NULL,NULL,'2014-08-08 00:25:02','SYSTEM','2014-08-08 00:25:02','SYSTEM'),('0',11,'chetanf@infosys.com','test','9888899999','0',NULL,NULL,'2014-08-08 00:25:47','SYSTEM','2014-08-08 00:25:47','SYSTEM'),('0',12,'rohit@cts.com','test','2222233333','0',NULL,NULL,'2014-08-08 00:27:20','SYSTEM','2014-08-08 00:27:20','SYSTEM'),('0',13,'varun@wipro.com','test','9993939999','0',NULL,NULL,'2014-08-08 00:30:09','SYSTEM','2014-08-08 00:30:09','SYSTEM'),('0',14,'john@cts.com','john','2222233333','0',NULL,NULL,'2014-08-08 00:37:30','SYSTEM','2014-08-08 00:37:30','SYSTEM'),('0',15,'srini@wipro.com','test','2222233333','0',NULL,NULL,'2014-08-08 00:42:01','SYSTEM','2014-08-08 00:42:01','SYSTEM'),('0',16,'indi@infy.co','test','','0',NULL,NULL,'2014-08-08 00:46:46','SYSTEM','2014-08-08 00:46:46','SYSTEM'),('0',17,'sulo@infosys.com','test','1111133333','0',NULL,NULL,'2014-08-08 01:43:14','SYSTEM','2014-08-08 01:43:14','SYSTEM'),('0',18,'queen@wipro.com','test','288288823','0',NULL,NULL,'2014-08-08 01:53:10','SYSTEM','2014-08-08 01:53:10','SYSTEM'),('0',19,'cbuddy@wipro.com','test','8888844444','0',NULL,NULL,'2014-08-08 02:52:25','SYSTEM','2014-08-08 02:52:25','SYSTEM'),('0',20,'jadeja@wipro.com','test','3333344444','0',NULL,NULL,'2014-08-08 03:06:30','SYSTEM','2014-08-08 03:06:30','SYSTEM'),('0',21,'dravid@wipro.com','test','9999977777','0','2014-08-08 03:35:29',NULL,'2014-08-08 03:15:13','SYSTEM','2014-08-08 03:35:29','21'),('0',22,'kumar@cisco.com','test','3333322233','0',NULL,NULL,'2014-08-08 03:40:13','SYSTEM','2014-08-08 03:40:13','SYSTEM'),('0',23,'jaishankar@wipro.com','test','2222233333','0',NULL,NULL,'2014-08-08 04:04:08','SYSTEM','2014-08-08 04:04:08','SYSTEM'),('0',24,'pujara@cts.com','test','9999988888','0',NULL,NULL,'2014-08-08 04:12:29','SYSTEM','2014-08-08 04:12:29','SYSTEM'),('0',25,'pujara@wipro.com','test','9999988888','0',NULL,NULL,'2014-08-08 04:17:48','SYSTEM','2014-08-08 04:17:48','SYSTEM'),('0',26,'apj@cisco.com','test','9999977777','0',NULL,NULL,'2014-08-08 04:45:46','SYSTEM','2014-08-08 04:45:46','SYSTEM'),('0',28,'shiva@wipro.com','test','4444444444','0',NULL,NULL,'2014-08-08 05:00:49','SYSTEM','2014-08-08 05:00:49','SYSTEM'),('0',30,'powermockito@gmail.com','test','2222233333','0',NULL,NULL,'2014-08-08 05:25:52','SYSTEM','2014-08-08 05:25:52','SYSTEM');
/*!40000 ALTER TABLE `user_credentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
CREATE TABLE `user_profile` (
  `USER_ID` decimal(16,0) NOT NULL default '0',
  `CORP_ID` decimal(8,0) default NULL,
  `FIRST_NAME` varchar(32) default NULL,
  `LAST_NAME` varchar(32) default NULL,
  `GENDER` varchar(1) default NULL,
  `DOB` varchar(12) default NULL,
  `ADDRESS` varchar(64) default NULL,
  `PINCODE` varchar(6) default NULL,
  `CITY` varchar(8) default NULL,
  `PERSONAL_EMAIL_ID` varchar(64) default NULL,
  `MOBILE_NO` varchar(12) default NULL,
  `ALTERNATE_NO` varchar(12) default NULL,
  `USER_CATEGORY` varchar(8) default NULL,
  `USER_STATUS` varchar(8) default NULL,
  `USER_RATING` varchar(3) default NULL,
  `EMAIL_VERIFICATION_STATUS` varchar(3) default NULL,
  `MOBILE_VERIFICATION_STATUS` varchar(3) default NULL,
  `CREATED_ON` datetime default NULL,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` datetime default NULL,
  `MODIFIED_BY` varchar(32) default NULL,
  `location` varchar(8) default NULL,
  PRIMARY KEY  (`USER_ID`),
  UNIQUE KEY `PERSONAL_EMAIL_ID` (`PERSONAL_EMAIL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES ('1','123','Shiva',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-22 11:09:22','SYSTEM','2014-06-22 11:09:22','SYSTEM',NULL),('2','100','Sachin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-22 11:41:50','SYSTEM','2014-06-22 11:41:50','SYSTEM',NULL),('3','101','Yoganand',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9999911111',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-22 11:46:44','SYSTEM','2014-06-22 11:46:44','SYSTEM',NULL),('4','101','kjkjh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1231221232',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-22 13:48:03','SYSTEM','2014-06-22 13:48:03','SYSTEM',NULL),('5','102','gopi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9999944444',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-27 07:58:56','SYSTEM','2014-06-27 07:58:56','SYSTEM',NULL),('6','101','Julies',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9999922222',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-30 06:30:04','SYSTEM','2014-06-30 06:30:04','SYSTEM',NULL),('7','100','Sachin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8888877777',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-22 23:04:06','SYSTEM','2014-07-22 23:04:06','SYSTEM',NULL),('8','123','Dhoni',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8888838383',NULL,NULL,NULL,NULL,NULL,NULL,'2014-07-24 00:16:32','SYSTEM','2014-07-24 00:16:32','SYSTEM',NULL),('9','123','pujara',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9888899999',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 00:22:34','SYSTEM','2014-08-08 00:22:34','SYSTEM',NULL),('10','123','chetan pujara',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9888899999',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 00:25:02','SYSTEM','2014-08-08 00:25:02','SYSTEM',NULL),('11','123','chetan pujara',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9888899999',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 00:25:47','SYSTEM','2014-08-08 00:25:47','SYSTEM',NULL),('12','101','rohit',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2222233333',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 00:27:20','SYSTEM','2014-08-08 00:27:20','SYSTEM',NULL),('13','100','varun',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9993939999',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 00:30:09','SYSTEM','2014-08-08 00:30:09','SYSTEM',NULL),('14','101','john',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2222233333',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 00:37:30','SYSTEM','2014-08-08 00:37:30','SYSTEM',NULL),('15','100','srini',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2222233333',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 00:42:01','SYSTEM','2014-08-08 00:42:01','SYSTEM',NULL),('16','123','indi',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 00:46:46','SYSTEM','2014-08-08 00:46:46','SYSTEM',NULL),('17','123','sulo',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1111133333',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 01:43:14','SYSTEM','2014-08-08 01:43:14','SYSTEM',NULL),('18','100','queen',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'288288823',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 01:53:10','SYSTEM','2014-08-08 01:53:10','SYSTEM',NULL),('19','100','cbuddy',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'8888844444',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 02:52:25','SYSTEM','2014-08-08 02:52:25','SYSTEM',NULL),('20','100','jadeja',NULL,NULL,NULL,NULL,NULL,NULL,'jadeja@gmail.com','3333344444',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 03:06:30','SYSTEM','2014-08-08 03:06:30','SYSTEM',NULL),('21','100','dravid',NULL,NULL,NULL,NULL,NULL,NULL,'dravid@gmail.com','9999977777',NULL,NULL,'ACT',NULL,NULL,NULL,'2014-08-08 03:15:13','SYSTEM','2014-08-08 03:22:38','SYSTEM',NULL),('22','103','kumar',NULL,NULL,NULL,NULL,NULL,NULL,'kumar@gmail.com','3333322233',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 03:40:13','SYSTEM','2014-08-08 03:40:13','SYSTEM',NULL),('23','100','jaishankar',NULL,NULL,NULL,NULL,NULL,NULL,'kk@gmail.com','2222233333',NULL,NULL,'ACT',NULL,NULL,NULL,'2014-08-08 04:04:08','SYSTEM','2014-08-08 04:06:21','SYSTEM',NULL),('24','101','pujara',NULL,NULL,NULL,NULL,NULL,NULL,'pujara@gmail.com','9999988888',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 04:12:29','SYSTEM','2014-08-08 04:12:29','SYSTEM',NULL),('25','100','pujar',NULL,NULL,NULL,NULL,NULL,NULL,'pujar@gmail.co.in','9999988888',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 04:17:48','SYSTEM','2014-08-08 04:17:48','SYSTEM',NULL),('26','103','apj',NULL,NULL,NULL,NULL,NULL,NULL,'apj@gmail.com','9999977777',NULL,NULL,'PEN',NULL,NULL,NULL,'2014-08-08 04:45:46','SYSTEM','2014-08-08 04:45:46','SYSTEM',NULL),('28','100','Shiva',NULL,NULL,NULL,NULL,NULL,NULL,'shivaf@gmail.com','4444444444',NULL,NULL,'ACT',NULL,NULL,NULL,'2014-08-08 05:00:49','SYSTEM','2014-08-08 05:02:13','SYSTEM',NULL),('30','101','power',NULL,NULL,NULL,NULL,NULL,NULL,'powermockito@gmail.com','2222233333',NULL,NULL,'ACT',NULL,NULL,NULL,'2014-08-08 05:25:52','SYSTEM','2014-08-08 05:26:42','SYSTEM',NULL),('500','123','Shiva','Kumar','M','1984-06-05','23, 1st street, Bellandur, Bangalore','560103','BLR','shiva@gmail.com','9535322140','','GOLD','ACTIVE','1','PEN','PEN','2014-05-18 13:25:42','SYSTEM','2014-05-18 13:25:42','SYSTEM','HSR');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `washingmachine_posts`
--

DROP TABLE IF EXISTS `washingmachine_posts`;
/*!50001 DROP VIEW IF EXISTS `washingmachine_posts`*/;
/*!50001 CREATE TABLE `washingmachine_posts` (
  `POST_ID` int(11),
  `CITY` varchar(8),
  `LOCATION` varchar(8),
  `BRAND` varchar(16),
  `MODEL` varchar(32),
  `YEAR` int(11),
  `PRICE` double,
  `BILL_AVAILABLE` char(1),
  `CREATED_ON` timestamp,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` timestamp,
  `MODIFIED_BY` varchar(32),
  `TITLE` varchar(256),
  `CONTACT_NO` varchar(16),
  `CONTACT_PERSON_NAME` varchar(32),
  `DESCRIPTION` varchar(512),
  `IMAGE_FILE_NAME` varchar(64),
  `CORP_ID` decimal(10,0),
  `post_status` varchar(8)
) */;

--
-- Final view structure for view `aircooler_posts`
--

/*!50001 DROP TABLE `aircooler_posts`*/;
/*!50001 DROP VIEW IF EXISTS `aircooler_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `aircooler_posts` AS select `paircooler`.`POST_ID` AS `POST_ID`,`paircooler`.`CITY` AS `CITY`,`paircooler`.`LOCATION` AS `LOCATION`,`paircooler`.`BRAND` AS `BRAND`,`paircooler`.`MODEL` AS `MODEL`,`paircooler`.`YEAR` AS `YEAR`,`paircooler`.`PRICE` AS `PRICE`,`paircooler`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`paircooler`.`TONNAGE` AS `TONNAGE`,`paircooler`.`AC_TYPE` AS `AC_TYPE`,`paircooler`.`CREATED_ON` AS `CREATED_ON`,`paircooler`.`CREATED_BY` AS `CREATED_BY`,`paircooler`.`MODIFIED_ON` AS `MODIFIED_ON`,`paircooler`.`MODIFIED_BY` AS `MODIFIED_BY`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID`,`poit`.`POST_STATUS` AS `post_status` from (`paircooler` join `poit`) where (`poit`.`POST_ID` = `paircooler`.`POST_ID`) */;

--
-- Final view structure for view `automobile_posts`
--

/*!50001 DROP TABLE `automobile_posts`*/;
/*!50001 DROP VIEW IF EXISTS `automobile_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `automobile_posts` AS select `pdau`.`POST_ID` AS `POST_ID`,`pdau`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`pdau`.`CITY` AS `CITY`,`pdau`.`LOCATION` AS `LOCATION`,`pdau`.`MAKE` AS `MAKE`,`pdau`.`MODEL` AS `MODEL`,`pdau`.`COLOR` AS `COLOR`,`pdau`.`YEAR` AS `YEAR`,`pdau`.`NO_OF_OWNERS` AS `NO_OF_OWNERS`,`pdau`.`FUEL_TYPE` AS `FUEL_TYPE`,`pdau`.`KMS_DONE` AS `KMS_DONE`,`pdau`.`MILEAGE` AS `MILEAGE`,`pdau`.`PRICE` AS `PRICE`,`pdau`.`PRICE_NEGOTIABLE` AS `PRICE_NEGOTIABLE`,`pdau`.`INSURANCE_AVAILABLE` AS `INSURANCE_AVAILABLE`,`pdau`.`REG_NO` AS `REG_NO`,`pdau`.`REG_CITY` AS `REG_CITY`,`pdau`.`REG_STATE` AS `REG_STATE`,`pdau`.`CREATED_ON` AS `CREATED_ON`,`pdau`.`CREATED_BY` AS `CREATED_BY`,`pdau`.`MODIFIED_ON` AS `MODIFIED_ON`,`pdau`.`MODIFIED_BY` AS `MODIFIED_BY`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID`,`poit`.`POST_STATUS` AS `post_status` from (`pdau` join `poit`) where (`poit`.`POST_ID` = `pdau`.`POST_ID`) */;

--
-- Final view structure for view `camera_posts`
--

/*!50001 DROP TABLE `camera_posts`*/;
/*!50001 DROP VIEW IF EXISTS `camera_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `camera_posts` AS select `pcamera`.`POST_ID` AS `POST_ID`,`pcamera`.`CITY` AS `CITY`,`pcamera`.`LOCATION` AS `LOCATION`,`pcamera`.`BRAND` AS `BRAND`,`pcamera`.`MODEL` AS `MODEL`,`pcamera`.`YEAR` AS `YEAR`,`pcamera`.`PRICE` AS `PRICE`,`pcamera`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`pcamera`.`RESOLUTION` AS `RESOLUTION`,`pcamera`.`ZOOM` AS `ZOOM`,`pcamera`.`CREATED_ON` AS `CREATED_ON`,`pcamera`.`CREATED_BY` AS `CREATED_BY`,`pcamera`.`MODIFIED_ON` AS `MODIFIED_ON`,`pcamera`.`MODIFIED_BY` AS `MODIFIED_BY`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID`,`poit`.`POST_STATUS` AS `post_status` from (`pcamera` join `poit`) where (`poit`.`POST_ID` = `pcamera`.`POST_ID`) */;

--
-- Final view structure for view `city`
--

/*!50001 DROP TABLE `city`*/;
/*!50001 DROP VIEW IF EXISTS `city`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `city` AS select `city_master`.`STATE_CODE` AS `STATE_CODE`,`city_master`.`CITY_CODE` AS `CITY_CODE`,`city_master`.`CITY_NAME` AS `CITY_NAME`,`city_master`.`created_on` AS `created_on`,`city_master`.`created_by` AS `created_by`,`city_master`.`modified_on` AS `modified_on`,`city_master`.`modified_by` AS `modified_by` from `city_master` */;

--
-- Final view structure for view `computers_posts`
--

/*!50001 DROP TABLE `computers_posts`*/;
/*!50001 DROP VIEW IF EXISTS `computers_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `computers_posts` AS select `pcomp`.`post_id` AS `post_id`,`pcomp`.`sub_category` AS `sub_category`,`pcomp`.`city` AS `city`,`pcomp`.`location` AS `location`,`pcomp`.`make` AS `make`,`pcomp`.`model` AS `model`,`pcomp`.`year` AS `year`,`pcomp`.`processor_size` AS `processor_size`,`pcomp`.`hdd_size` AS `hdd_size`,`pcomp`.`price` AS `price`,`pcomp`.`created_on` AS `created_on`,`pcomp`.`created_by` AS `created_by`,`pcomp`.`modified_on` AS `modified_on`,`pcomp`.`modified_by` AS `modified_by`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID`,`poit`.`POST_STATUS` AS `post_status` from (`pcomp` join `poit`) where (`poit`.`POST_ID` = `pcomp`.`post_id`) */;

--
-- Final view structure for view `corp`
--

/*!50001 DROP TABLE `corp`*/;
/*!50001 DROP VIEW IF EXISTS `corp`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `corp` AS select `corporate_master`.`CORP_ID` AS `CORP_ID`,`corporate_master`.`CORP_NAME` AS `CORP_NAME`,`corporate_master`.`CORP_SHORT_NAME` AS `CORP_SHORT_NAME`,`corporate_master`.`ADDRESS` AS `ADDRESS`,`corporate_master`.`CITY` AS `CITY`,`corporate_master`.`STATE` AS `STATE`,`corporate_master`.`SIZE` AS `SIZE`,`corporate_master`.`CREATED_ON` AS `CREATED_ON`,`corporate_master`.`CREATED_BY` AS `CREATED_BY`,`corporate_master`.`MODIFIED_ON` AS `MODIFIED_ON`,`corporate_master`.`MODIFIED_BY` AS `MODIFIED_BY` from `corporate_master` */;

--
-- Final view structure for view `dvd_posts`
--

/*!50001 DROP TABLE `dvd_posts`*/;
/*!50001 DROP VIEW IF EXISTS `dvd_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `dvd_posts` AS select `pdvd`.`POST_ID` AS `POST_ID`,`pdvd`.`CITY` AS `CITY`,`pdvd`.`LOCATION` AS `LOCATION`,`pdvd`.`BRAND` AS `BRAND`,`pdvd`.`MODEL` AS `MODEL`,`pdvd`.`YEAR` AS `YEAR`,`pdvd`.`PRICE` AS `PRICE`,`pdvd`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`pdvd`.`PLAYER_TYPE` AS `PLAYER_TYPE`,`pdvd`.`CREATED_ON` AS `CREATED_ON`,`pdvd`.`CREATED_BY` AS `CREATED_BY`,`pdvd`.`MODIFIED_ON` AS `MODIFIED_ON`,`pdvd`.`MODIFIED_BY` AS `MODIFIED_BY`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID`,`poit`.`POST_STATUS` AS `post_status` from (`pdvd` join `poit`) where (`poit`.`POST_ID` = `pdvd`.`POST_ID`) */;

--
-- Final view structure for view `fridge_posts`
--

/*!50001 DROP TABLE `fridge_posts`*/;
/*!50001 DROP VIEW IF EXISTS `fridge_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fridge_posts` AS select `pfridge`.`POST_ID` AS `POST_ID`,`pfridge`.`CITY` AS `CITY`,`pfridge`.`LOCATION` AS `LOCATION`,`pfridge`.`BRAND` AS `BRAND`,`pfridge`.`MODEL` AS `MODEL`,`pfridge`.`YEAR` AS `YEAR`,`pfridge`.`PRICE` AS `PRICE`,`pfridge`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`pfridge`.`COLOR` AS `COLOR`,`pfridge`.`CAPACITY` AS `CAPACITY`,`pfridge`.`DOUBLE_DOOR` AS `DOUBLE_DOOR`,`pfridge`.`CREATED_ON` AS `CREATED_ON`,`pfridge`.`CREATED_BY` AS `CREATED_BY`,`pfridge`.`MODIFIED_ON` AS `MODIFIED_ON`,`pfridge`.`MODIFIED_BY` AS `MODIFIED_BY`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID`,`poit`.`POST_STATUS` AS `post_status` from (`pfridge` join `poit`) where (`poit`.`POST_ID` = `pfridge`.`POST_ID`) */;

--
-- Final view structure for view `furniture_posts`
--

/*!50001 DROP TABLE `furniture_posts`*/;
/*!50001 DROP VIEW IF EXISTS `furniture_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `furniture_posts` AS select `pfurniture`.`POST_ID` AS `POST_ID`,`pfurniture`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`pfurniture`.`CITY` AS `CITY`,`pfurniture`.`LOCATION` AS `LOCATION`,`pfurniture`.`TYPE` AS `TYPE`,`pfurniture`.`YEAR` AS `YEAR`,`pfurniture`.`PRICE` AS `PRICE`,`pfurniture`.`CREATED_ON` AS `CREATED_ON`,`pfurniture`.`CREATED_BY` AS `CREATED_BY`,`pfurniture`.`MODIFIED_ON` AS `MODIFIED_ON`,`pfurniture`.`MODIFIED_BY` AS `MODIFIED_BY`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID`,`poit`.`POST_STATUS` AS `post_status` from (`pfurniture` join `poit`) where (`poit`.`POST_ID` = `pfurniture`.`POST_ID`) */;

--
-- Final view structure for view `location`
--

/*!50001 DROP TABLE `location`*/;
/*!50001 DROP VIEW IF EXISTS `location`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `location` AS select `location_master`.`STATE_CODE` AS `STATE_CODE`,`location_master`.`CITY_CODE` AS `CITY_CODE`,`location_master`.`LOC_CODE` AS `LOC_CODE`,`location_master`.`LOC_NAME` AS `LOC_NAME`,`location_master`.`created_on` AS `created_on`,`location_master`.`created_by` AS `created_by`,`location_master`.`modified_on` AS `modified_on`,`location_master`.`modified_by` AS `modified_by` from `location_master` */;

--
-- Final view structure for view `mobile_posts`
--

/*!50001 DROP TABLE `mobile_posts`*/;
/*!50001 DROP VIEW IF EXISTS `mobile_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mobile_posts` AS select `pdmo`.`post_id` AS `post_id`,`pdmo`.`sub_category` AS `sub_category`,`pdmo`.`city` AS `city`,`pdmo`.`location` AS `location`,`pdmo`.`brand` AS `brand`,`pdmo`.`model` AS `model`,`pdmo`.`smart_phone` AS `smart_phone`,`pdmo`.`price` AS `price`,`pdmo`.`year` AS `year`,`pdmo`.`touch_screen` AS `touch_screen`,`pdmo`.`dual_sim` AS `dual_sim`,`pdmo`.`screen_size` AS `screen_size`,`pdmo`.`camera_resolution` AS `camera_resolution`,`pdmo`.`color` AS `color`,`pdmo`.`operating_system` AS `operating_system`,`pdmo`.`wi_fi` AS `wi_fi`,`pdmo`.`front_camera` AS `front_camera`,`pdmo`.`fm_radio` AS `fm_radio`,`pdmo`.`processor_speed` AS `processor_speed`,`pdmo`.`memory_size` AS `memory_size`,`pdmo`.`created_on` AS `created_on`,`pdmo`.`created_by` AS `created_by`,`pdmo`.`modified_on` AS `modified_on`,`pdmo`.`modified_by` AS `modified_by`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID`,`poit`.`POST_STATUS` AS `post_status` from (`pdmo` join `poit`) where (`poit`.`POST_ID` = `pdmo`.`post_id`) */;

--
-- Final view structure for view `mobmast`
--

/*!50001 DROP TABLE `mobmast`*/;
/*!50001 DROP VIEW IF EXISTS `mobmast`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `mobmast` AS select `mobile_master`.`record_id` AS `record_id`,`mobile_master`.`brand` AS `brand`,`mobile_master`.`model` AS `model`,`mobile_master`.`model_name` AS `model_name`,`mobile_master`.`smart_phone` AS `smart_phone`,`mobile_master`.`touch_screen` AS `touch_screen`,`mobile_master`.`screen_size` AS `screen_size`,`mobile_master`.`camera_resolution` AS `camera_resolution`,`mobile_master`.`operating_system` AS `operating_system`,`mobile_master`.`wi_fi` AS `wi_fi`,`mobile_master`.`front_camera` AS `front_camera`,`mobile_master`.`fm_radio` AS `fm_radio`,`mobile_master`.`processor_speed` AS `processor_speed`,`mobile_master`.`memory_size` AS `memory_size`,`mobile_master`.`created_on` AS `created_on`,`mobile_master`.`created_by` AS `created_by`,`mobile_master`.`modified_on` AS `modified_on`,`mobile_master`.`modified_by` AS `modified_by` from `mobile_master` */;

--
-- Final view structure for view `neighborhood`
--

/*!50001 DROP TABLE `neighborhood`*/;
/*!50001 DROP VIEW IF EXISTS `neighborhood`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `neighborhood` AS select `neighborhood_details_table`.`ID` AS `ID`,`neighborhood_details_table`.`LOC_CODE` AS `LOC_CODE`,`neighborhood_details_table`.`NEIGHBOR_LOC_CODE` AS `NEIGHBOR_LOC_CODE`,`neighborhood_details_table`.`NEIGHBOR_LOC_NAME` AS `NEIGHBOR_LOC_NAME`,`neighborhood_details_table`.`DISTANCE` AS `DISTANCE` from `neighborhood_details_table` */;

--
-- Final view structure for view `other_posts`
--

/*!50001 DROP TABLE `other_posts`*/;
/*!50001 DROP VIEW IF EXISTS `other_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `other_posts` AS select `pothers`.`POST_ID` AS `POST_ID`,`pothers`.`CATEGORY` AS `CATEGORY`,`pothers`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`pothers`.`PRODUCT_TYPE` AS `PRODUCT_TYPE`,`pothers`.`CITY` AS `CITY`,`pothers`.`LOCATION` AS `LOCATION`,`pothers`.`BRAND` AS `BRAND`,`pothers`.`MODEL` AS `MODEL`,`pothers`.`YEAR` AS `YEAR`,`pothers`.`PRICE` AS `PRICE`,`pothers`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`pothers`.`CREATED_ON` AS `CREATED_ON`,`pothers`.`CREATED_BY` AS `CREATED_BY`,`pothers`.`MODIFIED_ON` AS `MODIFIED_ON`,`pothers`.`MODIFIED_BY` AS `MODIFIED_BY`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID` from (`pothers` join `poit`) where (`poit`.`POST_ID` = `pothers`.`POST_ID`) */;

--
-- Final view structure for view `pact`
--

/*!50001 DROP TABLE `pact`*/;
/*!50001 DROP VIEW IF EXISTS `pact`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pact` AS select `post_activation_table`.`record_id` AS `record_id`,`post_activation_table`.`activation_code` AS `activation_code`,`post_activation_table`.`user_id` AS `user_id`,`post_activation_table`.`post_id` AS `post_id`,`post_activation_table`.`activation_date` AS `activation_date`,`post_activation_table`.`activation_status` AS `activation_status`,`post_activation_table`.`no_of_attempts` AS `no_of_attempts`,`post_activation_table`.`last_attempt_ip` AS `last_attempt_ip`,`post_activation_table`.`created_on` AS `created_on` from `post_activation_table` */;

--
-- Final view structure for view `paircooler`
--

/*!50001 DROP TABLE `paircooler`*/;
/*!50001 DROP VIEW IF EXISTS `paircooler`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `paircooler` AS select `post_details_aircooler`.`POST_ID` AS `POST_ID`,`post_details_aircooler`.`CITY` AS `CITY`,`post_details_aircooler`.`LOCATION` AS `LOCATION`,`post_details_aircooler`.`BRAND` AS `BRAND`,`post_details_aircooler`.`MODEL` AS `MODEL`,`post_details_aircooler`.`YEAR` AS `YEAR`,`post_details_aircooler`.`PRICE` AS `PRICE`,`post_details_aircooler`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`post_details_aircooler`.`TONNAGE` AS `TONNAGE`,`post_details_aircooler`.`AC_TYPE` AS `AC_TYPE`,`post_details_aircooler`.`CREATED_ON` AS `CREATED_ON`,`post_details_aircooler`.`CREATED_BY` AS `CREATED_BY`,`post_details_aircooler`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_details_aircooler`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_details_aircooler` */;

--
-- Final view structure for view `pcamera`
--

/*!50001 DROP TABLE `pcamera`*/;
/*!50001 DROP VIEW IF EXISTS `pcamera`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pcamera` AS select `post_details_camera`.`POST_ID` AS `POST_ID`,`post_details_camera`.`CITY` AS `CITY`,`post_details_camera`.`LOCATION` AS `LOCATION`,`post_details_camera`.`BRAND` AS `BRAND`,`post_details_camera`.`MODEL` AS `MODEL`,`post_details_camera`.`YEAR` AS `YEAR`,`post_details_camera`.`PRICE` AS `PRICE`,`post_details_camera`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`post_details_camera`.`RESOLUTION` AS `RESOLUTION`,`post_details_camera`.`ZOOM` AS `ZOOM`,`post_details_camera`.`CREATED_ON` AS `CREATED_ON`,`post_details_camera`.`CREATED_BY` AS `CREATED_BY`,`post_details_camera`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_details_camera`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_details_camera` */;

--
-- Final view structure for view `pcomp`
--

/*!50001 DROP TABLE `pcomp`*/;
/*!50001 DROP VIEW IF EXISTS `pcomp`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pcomp` AS select `post_details_computers`.`post_id` AS `post_id`,`post_details_computers`.`sub_category` AS `sub_category`,`post_details_computers`.`city` AS `city`,`post_details_computers`.`location` AS `location`,`post_details_computers`.`make` AS `make`,`post_details_computers`.`model` AS `model`,`post_details_computers`.`year` AS `year`,`post_details_computers`.`processor_size` AS `processor_size`,`post_details_computers`.`hdd_size` AS `hdd_size`,`post_details_computers`.`price` AS `price`,`post_details_computers`.`created_on` AS `created_on`,`post_details_computers`.`created_by` AS `created_by`,`post_details_computers`.`modified_on` AS `modified_on`,`post_details_computers`.`modified_by` AS `modified_by` from `post_details_computers` */;

--
-- Final view structure for view `pdau`
--

/*!50001 DROP TABLE `pdau`*/;
/*!50001 DROP VIEW IF EXISTS `pdau`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pdau` AS select `post_details_automobile`.`POST_ID` AS `POST_ID`,`post_details_automobile`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`post_details_automobile`.`CITY` AS `CITY`,`post_details_automobile`.`LOCATION` AS `LOCATION`,`post_details_automobile`.`MAKE` AS `MAKE`,`post_details_automobile`.`MODEL` AS `MODEL`,`post_details_automobile`.`COLOR` AS `COLOR`,`post_details_automobile`.`YEAR` AS `YEAR`,`post_details_automobile`.`NO_OF_OWNERS` AS `NO_OF_OWNERS`,`post_details_automobile`.`FUEL_TYPE` AS `FUEL_TYPE`,`post_details_automobile`.`KMS_DONE` AS `KMS_DONE`,`post_details_automobile`.`MILEAGE` AS `MILEAGE`,`post_details_automobile`.`PRICE` AS `PRICE`,`post_details_automobile`.`PRICE_NEGOTIABLE` AS `PRICE_NEGOTIABLE`,`post_details_automobile`.`INSURANCE_AVAILABLE` AS `INSURANCE_AVAILABLE`,`post_details_automobile`.`REG_NO` AS `REG_NO`,`post_details_automobile`.`REG_CITY` AS `REG_CITY`,`post_details_automobile`.`REG_STATE` AS `REG_STATE`,`post_details_automobile`.`CREATED_ON` AS `CREATED_ON`,`post_details_automobile`.`CREATED_BY` AS `CREATED_BY`,`post_details_automobile`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_details_automobile`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_details_automobile` */;

--
-- Final view structure for view `pdmo`
--

/*!50001 DROP TABLE `pdmo`*/;
/*!50001 DROP VIEW IF EXISTS `pdmo`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pdmo` AS select `post_details_mobile`.`post_id` AS `post_id`,`post_details_mobile`.`sub_category` AS `sub_category`,`post_details_mobile`.`city` AS `city`,`post_details_mobile`.`location` AS `location`,`post_details_mobile`.`brand` AS `brand`,`post_details_mobile`.`model` AS `model`,`post_details_mobile`.`smart_phone` AS `smart_phone`,`post_details_mobile`.`price` AS `price`,`post_details_mobile`.`year` AS `year`,`post_details_mobile`.`touch_screen` AS `touch_screen`,`post_details_mobile`.`dual_sim` AS `dual_sim`,`post_details_mobile`.`screen_size` AS `screen_size`,`post_details_mobile`.`camera_resolution` AS `camera_resolution`,`post_details_mobile`.`color` AS `color`,`post_details_mobile`.`operating_system` AS `operating_system`,`post_details_mobile`.`wi_fi` AS `wi_fi`,`post_details_mobile`.`front_camera` AS `front_camera`,`post_details_mobile`.`fm_radio` AS `fm_radio`,`post_details_mobile`.`processor_speed` AS `processor_speed`,`post_details_mobile`.`memory_size` AS `memory_size`,`post_details_mobile`.`created_on` AS `created_on`,`post_details_mobile`.`created_by` AS `created_by`,`post_details_mobile`.`modified_on` AS `modified_on`,`post_details_mobile`.`modified_by` AS `modified_by` from `post_details_mobile` */;

--
-- Final view structure for view `pdre`
--

/*!50001 DROP TABLE `pdre`*/;
/*!50001 DROP VIEW IF EXISTS `pdre`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pdre` AS select `post_details_real_estate`.`POST_ID` AS `POST_ID`,`post_details_real_estate`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`post_details_real_estate`.`RENT_OR_SALE` AS `RENT_OR_SALE`,`post_details_real_estate`.`NEW_OR_RESALE` AS `NEW_OR_RESALE`,`post_details_real_estate`.`READY_TO_OCCUPY` AS `READY_TO_OCCUPY`,`post_details_real_estate`.`EXPECTED_COMPLETION_DATE` AS `EXPECTED_COMPLETION_DATE`,`post_details_real_estate`.`AREA` AS `AREA`,`post_details_real_estate`.`LOCATION` AS `LOCATION`,`post_details_real_estate`.`CITY` AS `CITY`,`post_details_real_estate`.`PRICE_VALUE` AS `PRICE_VALUE`,`post_details_real_estate`.`PRICE_UNIT` AS `PRICE_UNIT`,`post_details_real_estate`.`FACING_DIRECTION` AS `FACING_DIRECTION`,`post_details_real_estate`.`MARITAL_PREFERENCE` AS `MARITAL_PREFERENCE`,`post_details_real_estate`.`FOOD_PREFERENCE` AS `FOOD_PREFERENCE`,`post_details_real_estate`.`REGIONAL_PREFERENCE` AS `REGIONAL_PREFERENCE`,`post_details_real_estate`.`BEDROOMS` AS `BEDROOMS`,`post_details_real_estate`.`AGE_VALUE` AS `AGE_VALUE`,`post_details_real_estate`.`AGE_UNIT` AS `AGE_UNIT`,`post_details_real_estate`.`FURNISHED` AS `FURNISHED`,`post_details_real_estate`.`FLOOR_NUMBER` AS `FLOOR_NUMBER`,`post_details_real_estate`.`MAINTENANCE` AS `MAINTENANCE`,`post_details_real_estate`.`APPROVAL_AUTHORITY` AS `APPROVAL_AUTHORITY`,`post_details_real_estate`.`BUILDER_NAME` AS `BUILDER_NAME`,`post_details_real_estate`.`SHARING` AS `SHARING`,`post_details_real_estate`.`GENDER` AS `GENDER`,`post_details_real_estate`.`NO_OF_ROOMMATES` AS `NO_OF_ROOMMATES`,`post_details_real_estate`.`CAR_PARKING` AS `CAR_PARKING`,`post_details_real_estate`.`FOOD` AS `FOOD`,`post_details_real_estate`.`WIFI` AS `WIFI`,`post_details_real_estate`.`GYM` AS `GYM`,`post_details_real_estate`.`CHILDREN_PLAY_AREA` AS `CHILDREN_PLAY_AREA`,`post_details_real_estate`.`SWIMMING_POOL` AS `SWIMMING_POOL`,`post_details_real_estate`.`CREATED_ON` AS `CREATED_ON`,`post_details_real_estate`.`CREATED_BY` AS `CREATED_BY`,`post_details_real_estate`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_details_real_estate`.`MODIFIED_BY` AS `MODIFIED_BY`,`post_details_real_estate`.`CLUB_HOUSE` AS `CLUB_HOUSE`,`post_details_real_estate`.`TV` AS `TV`,`post_details_real_estate`.`POWER_BACKUP` AS `POWER_BACKUP` from `post_details_real_estate` */;

--
-- Final view structure for view `pdvd`
--

/*!50001 DROP TABLE `pdvd`*/;
/*!50001 DROP VIEW IF EXISTS `pdvd`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pdvd` AS select `post_details_dvd`.`POST_ID` AS `POST_ID`,`post_details_dvd`.`CITY` AS `CITY`,`post_details_dvd`.`LOCATION` AS `LOCATION`,`post_details_dvd`.`BRAND` AS `BRAND`,`post_details_dvd`.`MODEL` AS `MODEL`,`post_details_dvd`.`YEAR` AS `YEAR`,`post_details_dvd`.`PRICE` AS `PRICE`,`post_details_dvd`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`post_details_dvd`.`PLAYER_TYPE` AS `PLAYER_TYPE`,`post_details_dvd`.`CREATED_ON` AS `CREATED_ON`,`post_details_dvd`.`CREATED_BY` AS `CREATED_BY`,`post_details_dvd`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_details_dvd`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_details_dvd` */;

--
-- Final view structure for view `pfridge`
--

/*!50001 DROP TABLE `pfridge`*/;
/*!50001 DROP VIEW IF EXISTS `pfridge`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pfridge` AS select `post_details_fridge`.`POST_ID` AS `POST_ID`,`post_details_fridge`.`CITY` AS `CITY`,`post_details_fridge`.`LOCATION` AS `LOCATION`,`post_details_fridge`.`BRAND` AS `BRAND`,`post_details_fridge`.`MODEL` AS `MODEL`,`post_details_fridge`.`YEAR` AS `YEAR`,`post_details_fridge`.`PRICE` AS `PRICE`,`post_details_fridge`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`post_details_fridge`.`COLOR` AS `COLOR`,`post_details_fridge`.`CAPACITY` AS `CAPACITY`,`post_details_fridge`.`DOUBLE_DOOR` AS `DOUBLE_DOOR`,`post_details_fridge`.`CREATED_ON` AS `CREATED_ON`,`post_details_fridge`.`CREATED_BY` AS `CREATED_BY`,`post_details_fridge`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_details_fridge`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_details_fridge` */;

--
-- Final view structure for view `pfurniture`
--

/*!50001 DROP TABLE `pfurniture`*/;
/*!50001 DROP VIEW IF EXISTS `pfurniture`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pfurniture` AS select `post_details_furniture`.`POST_ID` AS `POST_ID`,`post_details_furniture`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`post_details_furniture`.`CITY` AS `CITY`,`post_details_furniture`.`LOCATION` AS `LOCATION`,`post_details_furniture`.`TYPE` AS `TYPE`,`post_details_furniture`.`YEAR` AS `YEAR`,`post_details_furniture`.`PRICE` AS `PRICE`,`post_details_furniture`.`CREATED_ON` AS `CREATED_ON`,`post_details_furniture`.`CREATED_BY` AS `CREATED_BY`,`post_details_furniture`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_details_furniture`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_details_furniture` */;

--
-- Final view structure for view `poit`
--

/*!50001 DROP TABLE `poit`*/;
/*!50001 DROP VIEW IF EXISTS `poit`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `poit` AS select `post_index_table`.`POST_ID` AS `POST_ID`,`post_index_table`.`CATEGORY` AS `CATEGORY`,`post_index_table`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`post_index_table`.`PRICE` AS `PRICE`,`post_index_table`.`NEGOTIABLE` AS `NEGOTIABLE`,`post_index_table`.`TITLE` AS `TITLE`,`post_index_table`.`CONTACT_NO` AS `CONTACT_NO`,`post_index_table`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`post_index_table`.`DESCRIPTION` AS `DESCRIPTION`,`post_index_table`.`LOCATION` AS `LOCATION`,`post_index_table`.`CITY` AS `CITY`,`post_index_table`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`post_index_table`.`IMAGE_TYPE` AS `IMAGE_TYPE`,`post_index_table`.`THUMBNAIL_NAME` AS `THUMBNAIL_NAME`,`post_index_table`.`THUMBNAIL_TYPE` AS `THUMBNAIL_TYPE`,`post_index_table`.`USER_FIRST_NAME` AS `USER_FIRST_NAME`,`post_index_table`.`CORP_ID` AS `CORP_ID`,`post_index_table`.`RATING` AS `RATING`,`post_index_table`.`POST_STATUS` AS `POST_STATUS`,`post_index_table`.`CREATED_ON` AS `CREATED_ON`,`post_index_table`.`CREATED_BY` AS `CREATED_BY`,`post_index_table`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_index_table`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_index_table` */;

--
-- Final view structure for view `pothers`
--

/*!50001 DROP TABLE `pothers`*/;
/*!50001 DROP VIEW IF EXISTS `pothers`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pothers` AS select `post_details_others`.`POST_ID` AS `POST_ID`,`post_details_others`.`CATEGORY` AS `CATEGORY`,`post_details_others`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`post_details_others`.`PRODUCT_TYPE` AS `PRODUCT_TYPE`,`post_details_others`.`CITY` AS `CITY`,`post_details_others`.`LOCATION` AS `LOCATION`,`post_details_others`.`BRAND` AS `BRAND`,`post_details_others`.`MODEL` AS `MODEL`,`post_details_others`.`YEAR` AS `YEAR`,`post_details_others`.`PRICE` AS `PRICE`,`post_details_others`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`post_details_others`.`CREATED_ON` AS `CREATED_ON`,`post_details_others`.`CREATED_BY` AS `CREATED_BY`,`post_details_others`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_details_others`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_details_others` */;

--
-- Final view structure for view `ppic`
--

/*!50001 DROP TABLE `ppic`*/;
/*!50001 DROP VIEW IF EXISTS `ppic`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ppic` AS select `post_picture`.`PIC_ID` AS `PIC_ID`,`post_picture`.`POST_ID` AS `POST_ID`,`post_picture`.`S_NO` AS `S_NO`,`post_picture`.`MAIN_PIC` AS `MAIN_PIC`,`post_picture`.`THUMBNAIL_PIC` AS `THUMBNAIL_PIC`,`post_picture`.`PIC_TYPE` AS `PIC_TYPE`,`post_picture`.`CREATED_ON` AS `CREATED_ON`,`post_picture`.`CREATED_BY` AS `CREATED_BY`,`post_picture`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_picture`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_picture` */;

--
-- Final view structure for view `ptelevision`
--

/*!50001 DROP TABLE `ptelevision`*/;
/*!50001 DROP VIEW IF EXISTS `ptelevision`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ptelevision` AS select `post_details_television`.`POST_ID` AS `POST_ID`,`post_details_television`.`CITY` AS `CITY`,`post_details_television`.`LOCATION` AS `LOCATION`,`post_details_television`.`BRAND` AS `BRAND`,`post_details_television`.`MODEL` AS `MODEL`,`post_details_television`.`YEAR` AS `YEAR`,`post_details_television`.`PRICE` AS `PRICE`,`post_details_television`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`post_details_television`.`SCREEN_TYPE` AS `SCREEN_TYPE`,`post_details_television`.`SCREEN_SIZE` AS `SCREEN_SIZE`,`post_details_television`.`STABILIZER` AS `STABILIZER`,`post_details_television`.`USB` AS `USB`,`post_details_television`.`HDMI` AS `HDMI`,`post_details_television`.`CREATED_ON` AS `CREATED_ON`,`post_details_television`.`CREATED_BY` AS `CREATED_BY`,`post_details_television`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_details_television`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_details_television` */;

--
-- Final view structure for view `ptv`
--

/*!50001 DROP TABLE `ptv`*/;
/*!50001 DROP VIEW IF EXISTS `ptv`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ptv` AS select `post_details_television`.`POST_ID` AS `POST_ID`,`post_details_television`.`CITY` AS `CITY`,`post_details_television`.`LOCATION` AS `LOCATION`,`post_details_television`.`BRAND` AS `BRAND`,`post_details_television`.`MODEL` AS `MODEL`,`post_details_television`.`YEAR` AS `YEAR`,`post_details_television`.`PRICE` AS `PRICE`,`post_details_television`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`post_details_television`.`SCREEN_TYPE` AS `SCREEN_TYPE`,`post_details_television`.`SCREEN_SIZE` AS `SCREEN_SIZE`,`post_details_television`.`STABILIZER` AS `STABILIZER`,`post_details_television`.`USB` AS `USB`,`post_details_television`.`HDMI` AS `HDMI`,`post_details_television`.`CREATED_ON` AS `CREATED_ON`,`post_details_television`.`CREATED_BY` AS `CREATED_BY`,`post_details_television`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_details_television`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_details_television` */;

--
-- Final view structure for view `pwashingmachine`
--

/*!50001 DROP TABLE `pwashingmachine`*/;
/*!50001 DROP VIEW IF EXISTS `pwashingmachine`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pwashingmachine` AS select `post_details_washingmachine`.`POST_ID` AS `POST_ID`,`post_details_washingmachine`.`CITY` AS `CITY`,`post_details_washingmachine`.`LOCATION` AS `LOCATION`,`post_details_washingmachine`.`BRAND` AS `BRAND`,`post_details_washingmachine`.`MODEL` AS `MODEL`,`post_details_washingmachine`.`YEAR` AS `YEAR`,`post_details_washingmachine`.`PRICE` AS `PRICE`,`post_details_washingmachine`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`post_details_washingmachine`.`CREATED_ON` AS `CREATED_ON`,`post_details_washingmachine`.`CREATED_BY` AS `CREATED_BY`,`post_details_washingmachine`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_details_washingmachine`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_details_washingmachine` */;

--
-- Final view structure for view `real_estate_posts`
--

/*!50001 DROP TABLE `real_estate_posts`*/;
/*!50001 DROP VIEW IF EXISTS `real_estate_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `real_estate_posts` AS select `pdre`.`POST_ID` AS `POST_ID`,`pdre`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`pdre`.`RENT_OR_SALE` AS `RENT_OR_SALE`,`pdre`.`NEW_OR_RESALE` AS `NEW_OR_RESALE`,`pdre`.`READY_TO_OCCUPY` AS `READY_TO_OCCUPY`,`pdre`.`EXPECTED_COMPLETION_DATE` AS `EXPECTED_COMPLETION_DATE`,`pdre`.`AREA` AS `AREA`,`pdre`.`LOCATION` AS `LOCATION`,`pdre`.`CITY` AS `CITY`,`pdre`.`PRICE_VALUE` AS `PRICE_VALUE`,`pdre`.`PRICE_UNIT` AS `PRICE_UNIT`,`pdre`.`FACING_DIRECTION` AS `FACING_DIRECTION`,`pdre`.`MARITAL_PREFERENCE` AS `MARITAL_PREFERENCE`,`pdre`.`FOOD_PREFERENCE` AS `FOOD_PREFERENCE`,`pdre`.`REGIONAL_PREFERENCE` AS `REGIONAL_PREFERENCE`,`pdre`.`BEDROOMS` AS `BEDROOMS`,`pdre`.`AGE_VALUE` AS `AGE_VALUE`,`pdre`.`AGE_UNIT` AS `AGE_UNIT`,`pdre`.`FURNISHED` AS `FURNISHED`,`pdre`.`FLOOR_NUMBER` AS `FLOOR_NUMBER`,`pdre`.`MAINTENANCE` AS `MAINTENANCE`,`pdre`.`APPROVAL_AUTHORITY` AS `APPROVAL_AUTHORITY`,`pdre`.`BUILDER_NAME` AS `BUILDER_NAME`,`pdre`.`SHARING` AS `SHARING`,`pdre`.`GENDER` AS `GENDER`,`pdre`.`NO_OF_ROOMMATES` AS `NO_OF_ROOMMATES`,`pdre`.`CAR_PARKING` AS `CAR_PARKING`,`pdre`.`FOOD` AS `FOOD`,`pdre`.`WIFI` AS `WIFI`,`pdre`.`GYM` AS `GYM`,`pdre`.`CHILDREN_PLAY_AREA` AS `CHILDREN_PLAY_AREA`,`pdre`.`SWIMMING_POOL` AS `SWIMMING_POOL`,`pdre`.`CREATED_ON` AS `CREATED_ON`,`pdre`.`CREATED_BY` AS `CREATED_BY`,`pdre`.`MODIFIED_ON` AS `MODIFIED_ON`,`pdre`.`MODIFIED_BY` AS `MODIFIED_BY`,`pdre`.`CLUB_HOUSE` AS `CLUB_HOUSE`,`pdre`.`TV` AS `TV`,`pdre`.`POWER_BACKUP` AS `POWER_BACKUP`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID`,`poit`.`POST_STATUS` AS `post_status` from (`pdre` join `poit`) where (`poit`.`POST_ID` = `pdre`.`POST_ID`) */;

--
-- Final view structure for view `television_posts`
--

/*!50001 DROP TABLE `television_posts`*/;
/*!50001 DROP VIEW IF EXISTS `television_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `television_posts` AS select `ptelevision`.`POST_ID` AS `POST_ID`,`ptelevision`.`CITY` AS `CITY`,`ptelevision`.`LOCATION` AS `LOCATION`,`ptelevision`.`BRAND` AS `BRAND`,`ptelevision`.`MODEL` AS `MODEL`,`ptelevision`.`YEAR` AS `YEAR`,`ptelevision`.`PRICE` AS `PRICE`,`ptelevision`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`ptelevision`.`SCREEN_TYPE` AS `SCREEN_TYPE`,`ptelevision`.`SCREEN_SIZE` AS `SCREEN_SIZE`,`ptelevision`.`STABILIZER` AS `STABILIZER`,`ptelevision`.`USB` AS `USB`,`ptelevision`.`HDMI` AS `HDMI`,`ptelevision`.`CREATED_ON` AS `CREATED_ON`,`ptelevision`.`CREATED_BY` AS `CREATED_BY`,`ptelevision`.`MODIFIED_ON` AS `MODIFIED_ON`,`ptelevision`.`MODIFIED_BY` AS `MODIFIED_BY`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID`,`poit`.`POST_STATUS` AS `post_status` from (`ptelevision` join `poit`) where (`poit`.`POST_ID` = `ptelevision`.`POST_ID`) */;

--
-- Final view structure for view `uact`
--

/*!50001 DROP TABLE `uact`*/;
/*!50001 DROP VIEW IF EXISTS `uact`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `uact` AS select `user_activation_table`.`record_id` AS `record_id`,`user_activation_table`.`activation_code` AS `activation_code`,`user_activation_table`.`user_id` AS `user_id`,`user_activation_table`.`activation_date` AS `activation_date`,`user_activation_table`.`activation_status` AS `activation_status`,`user_activation_table`.`no_of_attempts` AS `no_of_attempts`,`user_activation_table`.`last_attempt_ip` AS `last_attempt_ip`,`user_activation_table`.`created_on` AS `created_on` from `user_activation_table` */;

--
-- Final view structure for view `ucred`
--

/*!50001 DROP TABLE `ucred`*/;
/*!50001 DROP VIEW IF EXISTS `ucred`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ucred` AS select `user_credentials`.`CORP_ID` AS `CORP_ID`,`user_credentials`.`USER_ID` AS `USER_ID`,`user_credentials`.`CORP_EMAIL_ID` AS `CORP_EMAIL_ID`,`user_credentials`.`PWD` AS `PWD`,`user_credentials`.`MOBILE_NO` AS `MOBILE_NO`,`user_credentials`.`NO_OF_ATMPTS` AS `NO_OF_ATMPTS`,`user_credentials`.`LAST_LOGIN_TIME` AS `LAST_LOGIN_TIME`,`user_credentials`.`PWD_EXPIRY_DATE` AS `PWD_EXPIRY_DATE`,`user_credentials`.`CREATED_ON` AS `CREATED_ON`,`user_credentials`.`CREATED_BY` AS `CREATED_BY`,`user_credentials`.`MODIFIED_ON` AS `MODIFIED_ON`,`user_credentials`.`MODIFIED_BY` AS `MODIFIED_BY` from `user_credentials` */;

--
-- Final view structure for view `uprof`
--

/*!50001 DROP TABLE `uprof`*/;
/*!50001 DROP VIEW IF EXISTS `uprof`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `uprof` AS select `user_profile`.`USER_ID` AS `USER_ID`,`user_profile`.`CORP_ID` AS `CORP_ID`,`user_profile`.`FIRST_NAME` AS `FIRST_NAME`,`user_profile`.`LAST_NAME` AS `LAST_NAME`,`user_profile`.`GENDER` AS `GENDER`,`user_profile`.`DOB` AS `DOB`,`user_profile`.`ADDRESS` AS `ADDRESS`,`user_profile`.`PINCODE` AS `PINCODE`,`user_profile`.`CITY` AS `CITY`,`user_profile`.`PERSONAL_EMAIL_ID` AS `PERSONAL_EMAIL_ID`,`user_profile`.`MOBILE_NO` AS `MOBILE_NO`,`user_profile`.`ALTERNATE_NO` AS `ALTERNATE_NO`,`user_profile`.`USER_CATEGORY` AS `USER_CATEGORY`,`user_profile`.`USER_STATUS` AS `USER_STATUS`,`user_profile`.`USER_RATING` AS `USER_RATING`,`user_profile`.`EMAIL_VERIFICATION_STATUS` AS `EMAIL_VERIFICATION_STATUS`,`user_profile`.`MOBILE_VERIFICATION_STATUS` AS `MOBILE_VERIFICATION_STATUS`,`user_profile`.`CREATED_ON` AS `CREATED_ON`,`user_profile`.`CREATED_BY` AS `CREATED_BY`,`user_profile`.`MODIFIED_ON` AS `MODIFIED_ON`,`user_profile`.`MODIFIED_BY` AS `MODIFIED_BY`,`user_profile`.`location` AS `location` from `user_profile` */;

--
-- Final view structure for view `washingmachine_posts`
--

/*!50001 DROP TABLE `washingmachine_posts`*/;
/*!50001 DROP VIEW IF EXISTS `washingmachine_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `washingmachine_posts` AS select `pwashingmachine`.`POST_ID` AS `POST_ID`,`pwashingmachine`.`CITY` AS `CITY`,`pwashingmachine`.`LOCATION` AS `LOCATION`,`pwashingmachine`.`BRAND` AS `BRAND`,`pwashingmachine`.`MODEL` AS `MODEL`,`pwashingmachine`.`YEAR` AS `YEAR`,`pwashingmachine`.`PRICE` AS `PRICE`,`pwashingmachine`.`BILL_AVAILABLE` AS `BILL_AVAILABLE`,`pwashingmachine`.`CREATED_ON` AS `CREATED_ON`,`pwashingmachine`.`CREATED_BY` AS `CREATED_BY`,`pwashingmachine`.`MODIFIED_ON` AS `MODIFIED_ON`,`pwashingmachine`.`MODIFIED_BY` AS `MODIFIED_BY`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID`,`poit`.`POST_STATUS` AS `post_status` from (`pwashingmachine` join `poit`) where (`poit`.`POST_ID` = `pwashingmachine`.`POST_ID`) */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-08  4:19:03
