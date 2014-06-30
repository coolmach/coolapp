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
-- Current Database: `cbuddydb`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cbuddydb` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cbuddydb`;

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
  `CORP_ID` decimal(10,0)
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
  `CREATED_ON` datetime,
  `CREATED_BY` varchar(32),
  `MODIFIED_ON` datetime,
  `MODIFIED_BY` varchar(32)
) */;

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
INSERT INTO `post_details_automobile` VALUES ('80','1','CHE',NULL,'MAR','M1','Pearl Gray','2007','0','P','10000','0','0.000',NULL,'N',NULL,NULL,NULL,'2014-06-19 02:43:11','500','2014-06-19 02:43:11','500'),('81','1','CHE','C70','MAR','M1','Pearl Gray','2007','0',NULL,'10000','0','30000.000',NULL,NULL,NULL,NULL,NULL,'2014-06-19 02:48:53','500','2014-06-19 02:48:53','500'),('82','2','BLR','48','BAJ','M1','Pearl Gray','2007','0',NULL,'10000','0','30000.000',NULL,'N',NULL,NULL,NULL,'2014-06-19 03:06:51','500','2014-06-19 03:06:51','500'),('83','2','BLR','21','BAJ','M1','Pearl Gray','2007','0',NULL,'10000','0','40000.000',NULL,'N',NULL,NULL,NULL,'2014-06-19 03:09:39','500','2014-06-19 03:09:39','500'),('105','2','BLR','71','HON','M4','Red','2007','0',NULL,'10000','0','25000.000',NULL,NULL,NULL,NULL,NULL,'2014-06-26 00:42:46','3','2014-06-26 00:42:46','3'),('106','1','BLR','46','HYU','M1','Pearl Gray','2007','0',NULL,'10000','0','450000.000',NULL,NULL,NULL,NULL,NULL,'2014-06-26 01:04:25','3','2014-06-26 01:04:25','3'),('107','2','BLR','46','BAJ','M1','Pearl Gray','2007','1',NULL,'10000','0','30000.000',NULL,NULL,NULL,NULL,NULL,'2014-06-26 01:41:06','3','2014-06-26 01:41:06','3'),('108','2','CHE','C80','BAJ','M1','Pearl Gray','2007','1',NULL,'10000','0','30000.000',NULL,'Y',NULL,NULL,NULL,'2014-06-26 01:42:59','3','2014-06-26 01:42:59','3'),('109','1','CHE','C2','MAR','M1','Pearl Gray','2007','1','D','10000','0','150000.000',NULL,NULL,NULL,NULL,NULL,'2014-06-26 01:59:30','3','2014-06-26 01:59:30','3');
/*!40000 ALTER TABLE `post_details_automobile` ENABLE KEYS */;
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
INSERT INTO `post_details_real_estate` VALUES ('33','1',NULL,'N','N','9-May-2014','1200','50','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-08 12:14:03','500','2014-06-08 12:14:03','500',NULL,NULL,NULL),('34','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-08 12:28:21','500','2014-06-08 12:28:21','500',NULL,NULL,NULL),('35','1',NULL,'R','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','2','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-08 12:28:47','500','2014-06-08 12:28:47','500',NULL,NULL,NULL),('36','1',NULL,'N','Y','','1200','30','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-08 12:29:43','500','2014-06-08 12:29:43','500',NULL,NULL,NULL),('37','1',NULL,'N','Y','','1200','20','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-08 12:44:38','500','2014-06-08 12:44:38','500',NULL,NULL,NULL),('38','1',NULL,'N','Y','','800','30','BLR','2100000.00','INR','E',NULL,NULL,NULL,'4','0','YEARS',NULL,'2','0.00','BDA','MGR',NULL,NULL,'0','Y',NULL,NULL,NULL,'Y','Y','2014-06-08 16:04:47','500','2014-06-08 16:04:47','500',NULL,NULL,NULL),('39','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,'Y',NULL,'Y','2014-06-08 16:07:29','500','2014-06-08 16:07:29','500',NULL,NULL,NULL),('40','1',NULL,'N','Y','','1200','19','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'2','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,'Y','Y','2014-06-10 01:36:09','500','2014-06-10 01:36:09','500','Y',NULL,NULL),('41','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 01:50:00','500','2014-06-10 01:50:00','500',NULL,NULL,NULL),('42','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 02:12:32','500','2014-06-10 02:12:32','500',NULL,NULL,NULL),('43','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 02:16:58','500','2014-06-10 02:16:58','500',NULL,NULL,NULL),('44','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 02:38:39','500','2014-06-10 02:38:39','500',NULL,NULL,NULL),('45','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0','Y',NULL,NULL,NULL,'Y',NULL,'2014-06-10 22:28:16','500','2014-06-10 22:28:16','500',NULL,NULL,NULL),('46','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:43:47','500','2014-06-10 22:43:47','500',NULL,NULL,NULL),('47','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:44:24','500','2014-06-10 22:44:24','500',NULL,NULL,NULL),('48','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:44:31','500','2014-06-10 22:44:31','500',NULL,NULL,NULL),('49','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:44:35','500','2014-06-10 22:44:35','500',NULL,NULL,NULL),('50','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:45:59','500','2014-06-10 22:45:59','500',NULL,NULL,NULL),('51','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:46:14','500','2014-06-10 22:46:14','500',NULL,NULL,NULL),('52','1',NULL,'R','Y','','2400','46','BLR','1200000.00','INR','N',NULL,NULL,NULL,'1','3','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:48:17','500','2014-06-10 22:48:17','500',NULL,NULL,NULL),('53','1',NULL,'R','Y','','2400','46','BLR','1200000.00','INR','N',NULL,NULL,NULL,'1','3','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:49:07','500','2014-06-10 22:49:07','500',NULL,NULL,NULL),('54','1',NULL,'R','Y','','2400','46','BLR','1200000.00','INR','N',NULL,NULL,NULL,'1','3','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-10 22:49:20','500','2014-06-10 22:49:20','500',NULL,NULL,NULL),('55','1',NULL,'N','Y','','1200','12','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0','Y',NULL,NULL,NULL,NULL,NULL,'2014-06-11 22:38:43','500','2014-06-11 22:38:43','500',NULL,NULL,NULL),('56','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-11 23:22:36','500','2014-06-11 23:22:36','500',NULL,NULL,NULL),('57','2',NULL,NULL,NULL,NULL,'1200','43','BLR','3000000.00','INR','N, ',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,'Y',NULL,'2014-06-11 23:25:35','500','2014-06-11 23:25:35','500','Y',NULL,NULL),('59','2',NULL,NULL,NULL,NULL,'1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-11 23:30:47','500','2014-06-11 23:30:47','500',NULL,NULL,NULL),('60','1',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-11 23:48:41','500','2014-06-11 23:48:41','500',NULL,NULL,NULL),('61','3',NULL,'N','Y','','1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-11 23:50:59','500','2014-06-11 23:50:59','500',NULL,NULL,NULL),('62','4',NULL,NULL,NULL,NULL,'1200','46','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0','Y',NULL,NULL,NULL,NULL,NULL,'2014-06-12 00:04:39','500','2014-06-12 00:04:39','500',NULL,NULL,NULL),('63','2',NULL,NULL,NULL,NULL,'0','46','BLR','3000000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,'G','0.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-12 00:45:21','500','2014-06-12 00:45:21','500',NULL,NULL,NULL),('64','5',NULL,NULL,NULL,NULL,'0','46','BLR','3000000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,'G','0.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-12 00:45:59','500','2014-06-12 00:45:59','500',NULL,NULL,NULL),('65','6',NULL,NULL,NULL,NULL,'1200','46','BLR','3000000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,NULL,'0.00','BDA',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-12 00:51:57','500','2014-06-12 00:51:57','500',NULL,NULL,NULL),('66','5',NULL,NULL,NULL,NULL,'0','46','BLR','2000.00','INR',NULL,NULL,NULL,'No Preference','0','0','YEARS',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-12 00:59:43','500','2014-06-12 00:59:43','500',NULL,'Y',NULL),('67','7',NULL,NULL,NULL,NULL,'0','46','BLR','3000.00','INR',NULL,NULL,NULL,'No Preference','0','0','YEARS',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-12 01:00:40','500','2014-06-12 01:00:40','500',NULL,NULL,NULL),('68','7',NULL,NULL,NULL,NULL,'1200','46','BLR','1300.00','INR',NULL,NULL,NULL,'T','3','0','YEARS',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-12 01:03:06','500','2014-06-12 01:03:06','500',NULL,NULL,NULL),('71','2',NULL,NULL,NULL,NULL,'1300','21','BLR','12000.00','INR','E','F',NULL,NULL,'2','0','YEARS','S','G','1500.00',NULL,NULL,NULL,NULL,'0','Y',NULL,NULL,'Y','Y','Y','2014-06-12 02:10:43','500','2014-06-12 02:10:43','500','Y',NULL,NULL),('72','1',NULL,'N','Y','','1200',NULL,'BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-17 00:59:39','500','2014-06-17 00:59:39','500',NULL,NULL,NULL),('73','1',NULL,'N','Y','','1200','7','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-17 01:03:33','500','2014-06-17 01:03:33','500',NULL,NULL,NULL),('74','2',NULL,NULL,NULL,NULL,'1200','46','BLR','3000000.00','INR','N','F',NULL,NULL,'2','0','YEARS','F','G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-17 01:46:55','500','2014-06-17 01:46:55','500',NULL,NULL,NULL),('75','1',NULL,'N','Y','','1200','100','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-17 21:10:46','500','2014-06-17 21:10:46','500',NULL,NULL,NULL),('84','2',NULL,NULL,NULL,NULL,'1200','','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-20 23:56:02','500','2014-06-20 23:56:02','500',NULL,NULL,NULL),('85','2',NULL,NULL,NULL,NULL,'1200','','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 00:20:51','500','2014-06-21 00:20:51','500',NULL,NULL,NULL),('86','2',NULL,NULL,NULL,NULL,'0','','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 00:32:44','500','2014-06-21 00:32:44','500',NULL,NULL,NULL),('87','2',NULL,NULL,NULL,NULL,'0','','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 00:33:35','500','2014-06-21 00:33:35','500',NULL,NULL,NULL),('88','2',NULL,NULL,NULL,NULL,'1200','67','BLR','20000.00','INR','N',NULL,NULL,NULL,'3','0','YEARS','F','G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 00:48:13','500','2014-06-21 00:48:13','500',NULL,NULL,NULL),('89','2',NULL,NULL,NULL,NULL,'1200','46','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 00:58:52','500','2014-06-21 00:58:52','500',NULL,NULL,NULL),('90','2',NULL,NULL,NULL,NULL,'1200','46','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 08:21:47','500','2014-06-21 08:21:47','500',NULL,NULL,NULL),('91','2',NULL,NULL,NULL,NULL,'1200','46','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 08:23:08','500','2014-06-21 08:23:08','500',NULL,NULL,NULL),('92','2',NULL,NULL,NULL,NULL,'1200','46','CHE','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 08:23:36','500','2014-06-21 08:23:36','500',NULL,NULL,NULL),('93','2',NULL,NULL,NULL,NULL,'1200','46','CHE','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 08:47:28','500','2014-06-21 08:47:28','500',NULL,NULL,NULL),('94','2',NULL,NULL,NULL,NULL,'1200','46','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 08:55:31','500','2014-06-21 08:55:31','500',NULL,NULL,NULL),('95','1',NULL,'N','Y','','1200','72','BLR','3000000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','0.00','BDA','MGR',NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 09:15:59','500','2014-06-21 09:15:59','500',NULL,NULL,NULL),('96','4',NULL,NULL,NULL,NULL,'1200','C2','CHE','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 09:37:24','500','2014-06-21 09:37:24','500',NULL,NULL,NULL),('97','5',NULL,NULL,NULL,NULL,'0','68','BLR','20000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,'G','0.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 10:45:24','500','2014-06-21 10:45:24','500',NULL,NULL,NULL),('98','4',NULL,NULL,NULL,NULL,'1200','46','BLR','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 17:20:28','500','2014-06-21 17:20:28','500',NULL,NULL,NULL),('99','6',NULL,NULL,NULL,NULL,'2400','46','BLR','3000000.00','INR',NULL,NULL,NULL,NULL,'0','0','YEARS',NULL,NULL,'0.00','BDA',NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 22:50:08','500','2014-06-21 22:50:08','500',NULL,NULL,NULL),('100','7',NULL,NULL,NULL,NULL,'1200','53','BLR','20000.00','INR',NULL,NULL,NULL,'No Preference','2','0','YEARS',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 22:55:30','500','2014-06-21 22:55:30','500',NULL,NULL,NULL),('101','7',NULL,NULL,NULL,NULL,'1200','53','BLR','20000.00','INR',NULL,NULL,NULL,'No Preference','2','0','YEARS',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 22:55:57','500','2014-06-21 22:55:57','500',NULL,NULL,NULL),('102','7',NULL,NULL,NULL,NULL,'1200','71','BLR','20000.00','INR',NULL,NULL,NULL,'No Preference','2','0','YEARS',NULL,NULL,'0.00',NULL,NULL,NULL,NULL,'3',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 22:56:16','500','2014-06-21 22:56:16','500',NULL,NULL,NULL),('103','2',NULL,NULL,NULL,NULL,'1200','C80','CHE','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-21 22:57:32','500','2014-06-21 22:57:32','500',NULL,NULL,NULL),('104','2',NULL,NULL,NULL,NULL,'1200','C11','CHE','20000.00','INR','N',NULL,NULL,NULL,'2','0','YEARS',NULL,'G','1500.00',NULL,NULL,NULL,NULL,'0',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-22 11:50:56','3','2014-06-22 11:50:56','3',NULL,NULL,NULL);
/*!40000 ALTER TABLE `post_details_real_estate` ENABLE KEYS */;
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
  `CREATED_ON` datetime default NULL,
  `CREATED_BY` varchar(32) default NULL,
  `MODIFIED_ON` datetime default NULL,
  `MODIFIED_BY` varchar(32) default NULL,
  PRIMARY KEY  (`POST_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `post_index_table`
--

LOCK TABLES `post_index_table` WRITE;
/*!40000 ALTER TABLE `post_index_table` DISABLE KEYS */;
INSERT INTO `post_index_table` VALUES (1,'REAL',NULL,'9.00',NULL,'lkjlkjl',NULL,NULL,'','kjlj','BLR','Lighthouse.jpg',NULL,NULL,NULL,'Shiva','123','0','2014-05-22 18:46:27','500','2014-05-22 18:46:27','500'),(2,'REAL',NULL,'767.00',NULL,'khsgkdfhk',NULL,NULL,'768768','jhkj','BLR','Desert.jpg',NULL,NULL,NULL,'Shiva','123','0','2014-05-22 20:23:33','500','2014-05-22 20:23:33','500'),(3,'REAL',NULL,'0.00',NULL,'',NULL,NULL,'','','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-05-23 04:01:37','500','2014-05-23 04:01:37','500'),(4,'REAL',NULL,'0.00',NULL,'',NULL,NULL,'','','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-05-24 06:34:45','500','2014-05-24 06:34:45','500'),(5,'REAL',NULL,'230000.00',NULL,'2 BHK apartment for rent',NULL,NULL,'klkjlkj','S','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-03 23:09:30','500','2014-06-03 23:09:30','500'),(6,'REAL',NULL,'230000.00',NULL,'2 BHK apartment for rent',NULL,NULL,'klkjlkj','S','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-03 23:09:58','500','2014-06-03 23:09:58','500'),(7,'REAL',NULL,'111111.00',NULL,'2 BHK apartment for rent',NULL,NULL,'','S','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-03 23:16:09','500','2014-06-03 23:16:09','500'),(8,'REAL',NULL,'111111.00',NULL,'2 BHK apartment for rent',NULL,NULL,'','S','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-03 23:16:23','500','2014-06-03 23:16:23','500'),(9,'REAL',NULL,'1200000.00',NULL,'2 BHK apartment for rent',NULL,NULL,'sdfsdf sdf sdf sdf sdf sdf','S','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-03 23:29:19','500','2014-06-03 23:29:19','500'),(15,'REAL',NULL,'230000.00',NULL,'2 BHK apartment for rent',NULL,NULL,'','S','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-04 00:04:47','500','2014-06-04 00:04:47','500'),(16,'REAL',NULL,'3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-04 00:09:01','500','2014-06-04 00:09:01','500'),(17,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-04 21:20:18','500','2014-06-04 21:20:18','500'),(18,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-04 21:27:30','500','2014-06-04 21:27:30','500'),(19,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-04 21:28:56','500','2014-06-04 21:28:56','500'),(20,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-04 21:31:19','500','2014-06-04 21:31:19','500'),(21,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-04 21:42:09','500','2014-06-04 21:42:09','500'),(22,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-04 21:43:44','500','2014-06-04 21:43:44','500'),(23,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR',NULL,NULL,NULL,NULL,'Shiva','123','0','2014-06-04 21:44:36','500','2014-06-04 21:44:36','500'),(24,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR','1401899660618.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-04 22:04:20','500','2014-06-04 22:04:20','500'),(25,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR','1401992625279.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-05 23:53:45','500','2014-06-05 23:53:45','500'),(26,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','HSR','BLR','1402170725476.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-08 01:22:05','500','2014-06-08 01:22:05','500'),(27,'REAL','1','3000000.00',NULL,'2BHK For Sale',NULL,NULL,'Hello tHis is description','46','BLR','1402175633686.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-08 02:43:53','500','2014-06-08 02:43:53','500'),(28,'REAL','1','2500000.00',NULL,'2BHK For Sale','77777766666','Ajay','Hello tHis is description','31','BLR','1402197309472.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-08 08:45:09','500','2014-06-08 08:45:09','500'),(29,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','John','Hello tHis is description','46','BLR','1402197380916.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-08 08:46:20','500','2014-06-08 08:46:20','500'),(30,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402199992464.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-08 09:29:52','500','2014-06-08 09:29:52','500'),(31,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','John','Hello tHis is description','46','BLR','1402209500015.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-08 12:08:20','500','2014-06-08 12:08:20','500'),(32,'REAL',NULL,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1402209511253.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-08 12:08:31','500','2014-06-08 12:08:31','500'),(33,'REAL','1','3000000.00',NULL,'Ready to Occupy apartment for sale','77777766666','MGR','Hello tHis is description','50','BLR','1402209843847.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-08 12:14:03','500','2014-06-08 12:14:03','500'),(34,'REAL','1','3000000.00',NULL,'2BHK Apartment at Electronics City','77777766666','MGR','Hello tHis is description','46','BLR','1402210701416.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-08 12:28:21','500','2014-06-08 12:28:21','500'),(35,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402210727376.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-08 12:28:47','500','2014-06-08 12:28:47','500'),(36,'REAL','1','3000000.00',NULL,'3BHK newly finished house for sale','77777766666','MGR','Hello tHis is description','30','BLR','1402210783860.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-08 12:29:43','500','2014-06-08 12:29:43','500'),(37,'REAL','1','3000000.00',NULL,'Studio apartment for sale in Marathalli','77777766666','MGR','Hello tHis is description','20','BLR','1402211678720.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-08 12:44:38','500','2014-06-08 12:44:38','500'),(38,'REAL','1','2100000.00',NULL,'Brand new apartment - Mantri ','1234512345','Jackson','Hello tHis is description','30','BLR','1402223687963.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-08 16:04:47','500','2014-06-08 16:04:47','500'),(39,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402223849840.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-08 16:07:29','500','2014-06-08 16:07:29','500'),(40,'REAL','1','3000000.00',NULL,'Newly constructed flat for sale in Electronics City','77777766666','MGR','Hello tHis is description','19','BLR','1402344369754.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-10 01:36:09','500','2014-06-10 01:36:09','500'),(41,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402345200408.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-10 01:50:00','500','2014-06-10 01:50:00','500'),(42,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402346552473.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-10 02:12:32','500','2014-06-10 02:12:32','500'),(43,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402346818133.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-10 02:16:58','500','2014-06-10 02:16:58','500'),(44,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402348119512.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-10 02:38:39','500','2014-06-10 02:38:39','500'),(45,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402419496542.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-10 22:28:16','500','2014-06-10 22:28:16','500'),(46,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402420427999.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-10 22:43:47','500','2014-06-10 22:43:47','500'),(47,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402420464573.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-10 22:44:24','500','2014-06-10 22:44:24','500'),(48,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402420471090.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-10 22:44:31','500','2014-06-10 22:44:31','500'),(49,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402420475018.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-10 22:44:35','500','2014-06-10 22:44:35','500'),(50,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402420559211.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-10 22:45:59','500','2014-06-10 22:45:59','500'),(51,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402420574986.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-10 22:46:14','500','2014-06-10 22:46:14','500'),(52,'REAL','1','1200000.00',NULL,'1 BHK for resale','77777766666','MGR','Hello tHis is description','46','BLR','1402420697059.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-10 22:48:17','500','2014-06-10 22:48:17','500'),(53,'REAL','1','1200000.00',NULL,'1 BHK for resale','77777766666','MGR','Hello tHis is description','46','BLR','1402420747048.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-10 22:49:07','500','2014-06-10 22:49:07','500'),(54,'REAL','1','1200000.00',NULL,'1 BHK for resale','77777766666','MGR','Hello tHis is description','46','BLR','1402420760714.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-10 22:49:20','500','2014-06-10 22:49:20','500'),(55,'REAL','1','3000000.00',NULL,'Fully furnished 1 BHK','77777766666','MGR','Hello tHis is description','12','BLR','1402506523738.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-11 22:38:43','500','2014-06-11 22:38:43','500'),(56,'REAL','1','3000000.00',NULL,'2BHK For Rent with 24 hours water','77777766666','MGR','Hello tHis is description','46','BLR','1402509156804.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-11 23:22:36','500','2014-06-11 23:22:36','500'),(59,'REAL','2','3000000.00',NULL,'2 BHK available for immediate occupation','77777766666','MGR','Hello tHis is description','46','BLR','1402509647459.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-11 23:30:47','500','2014-06-11 23:30:47','500'),(60,'REAL','1','3000000.00',NULL,'Individual House for sale','77777766666','MGR','Hello tHis is description','46','BLR','1402510721125.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-11 23:48:41','500','2014-06-11 23:48:41','500'),(61,'REAL','3','3000000.00',NULL,'1BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402510859647.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-11 23:50:59','500','2014-06-11 23:50:59','500'),(62,'REAL','4','3000000.00',NULL,'Individual House for Rent','77777766666','MGR','Hello tHis is description','46','BLR','1402511679460.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-12 00:04:39','500','2014-06-12 00:04:39','500'),(63,'REAL','2','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402514121568.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-12 00:45:21','500','2014-06-12 00:45:21','500'),(64,'REAL','5','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402514159017.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-12 00:45:59','500','2014-06-12 00:45:59','500'),(65,'REAL','6','3000000.00',NULL,'Agricultural Land for Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402514517517.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-12 00:51:57','500','2014-06-12 00:51:57','500'),(66,'REAL','5','2000.00',NULL,'Looking for a roommate working in Infosys','77777766666','MGR','Hello tHis is description','46','BLR','1402514983201.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-12 00:59:43','500','2014-06-12 00:59:43','500'),(67,'REAL','7','3000.00',NULL,'Looking for a roommate working in Infosys','77777766666','MGR','Hello tHis is description','46','BLR','1402515040355.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-12 01:00:40','500','2014-06-12 01:00:40','500'),(68,'REAL','7','1300.00',NULL,'North Indian roommate required','77777766666','MGR','Hello tHis is description','46','BLR','1402515186839.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-12 01:03:06','500','2014-06-12 01:03:06','500'),(71,'REAL','2','12000.00',NULL,'2BHK available in Somadevpura','77777766666','MGR','Hello tHis is description','21','BLR','1402519243375.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-12 02:10:43','500','2014-06-12 02:10:43','500'),(72,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','7','BLR','1402946979743.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-17 00:59:39','500','2014-06-17 00:59:39','500'),(73,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','7','BLR','1402947213285.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-17 01:03:33','500','2014-06-17 01:03:33','500'),(74,'REAL','2','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1402949815965.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-17 01:46:55','500','2014-06-17 01:46:55','500'),(75,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','100','BLR','1403019646267.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-17 21:10:46','500','2014-06-17 21:10:46','500'),(80,'AUTO','1','0.00',NULL,'Maruti Swift (TN Registration) available for Sale immediately','77777766666','MGR','Hello tHis is description','C80','CHE','1403125991736.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-19 02:43:11','500','2014-06-19 02:43:11','500'),(81,'AUTO','1','30000.00',NULL,'Maruti Swift (TN Registration) available for Sale immediately','77777766666','MGR','Hello tHis is description','C70','CHE','1403126333641.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-19 02:48:53','500','2014-06-19 02:48:53','500'),(82,'AUTO','2','30000.00',NULL,'Maruti Swift (TN Registration) available for Sale immediately','77777766666','MGR','Hello tHis is description','48','BLR','1403127411595.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-19 03:06:51','500','2014-06-19 03:06:51','500'),(83,'AUTO','2','40000.00',NULL,'Maruti Swift (TN Registration) available for Sale immediately','77777766666','MGR','Hello tHis is description','21','BLR','1403127579698.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-19 03:09:39','500','2014-06-19 03:09:39','500'),(84,'REAL','2','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','','BLR','1403288762735.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-20 23:56:02','500','2014-06-20 23:56:02','500'),(85,'REAL','2','20000.00',NULL,'h','77777766666','MGR','Hello tHis is description','','BLR','1403290251349.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 00:20:51','500','2014-06-21 00:20:51','500'),(86,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','','BLR','1403290964583.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 00:32:44','500','2014-06-21 00:32:44','500'),(87,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','','BLR','1403291015800.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 00:33:35','500','2014-06-21 00:33:35','500'),(88,'REAL','2','20000.00',NULL,'hhhh','77777766666','MGR','Hello tHis is description','67','BLR','1403291893605.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 00:48:13','500','2014-06-21 00:48:13','500'),(89,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1403292532096.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 00:58:52','500','2014-06-21 00:58:52','500'),(90,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1403319107048.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 08:21:47','500','2014-06-21 08:21:47','500'),(91,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1403319188926.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 08:23:08','500','2014-06-21 08:23:08','500'),(92,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','CHE','1403319216606.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 08:23:36','500','2014-06-21 08:23:36','500'),(93,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','CHE','1403320648575.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 08:47:28','500','2014-06-21 08:47:28','500'),(94,'REAL','2','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1403321131394.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 08:55:31','500','2014-06-21 08:55:31','500'),(95,'REAL','1','3000000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','72','BLR','1403322359964.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 09:15:59','500','2014-06-21 09:15:59','500'),(96,'REAL','4','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','C2','CHE','1403323644232.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 09:37:24','500','2014-06-21 09:37:24','500'),(97,'REAL','5','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','68','BLR','1403327724562.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 10:45:24','500','2014-06-21 10:45:24','500'),(98,'REAL','4','20000.00',NULL,'2BHK For Sale','77777766666','MGR','Hello tHis is description','46','BLR','1403351428038.jpeg','jpeg',NULL,NULL,'Shiva','123','0','2014-06-21 17:20:28','500','2014-06-21 17:20:28','500'),(99,'REAL','6','3000000.00',NULL,'Land for sale in Bangalore','77777766666','MGR','Hello tHis is description','46','BLR','1403371208160.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 22:50:08','500','2014-06-21 22:50:08','500'),(100,'REAL','7','20000.00',NULL,'Apartment 2BHK For Rent','77777766666','MGR','Hello this is description','53','BLR','1403371530128.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 22:55:30','500','2014-06-21 22:55:30','500'),(101,'REAL','7','20000.00',NULL,'Apartment 2BHK For Rent','77777766666','MGR','Hello this is description','53','BLR','1403371557505.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 22:55:57','500','2014-06-21 22:55:57','500'),(102,'REAL','7','20000.00',NULL,'Apartment 2BHK For Rent','77777766666','MGR','Hello this is description','71','BLR','1403371576087.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 22:56:16','500','2014-06-21 22:56:16','500'),(103,'REAL','2','20000.00',NULL,'Apartment 2BHK For Rent','77777766666','MGR','Hello tHis is description','C80','CHE','1403371652924.null',NULL,NULL,NULL,'Shiva','123','0','2014-06-21 22:57:32','500','2014-06-21 22:57:32','500'),(104,'REAL','2','20000.00',NULL,'Apartment 2BHK For Rent','77777766666','MGR','Hello tHis is description','C11','CHE','1403418056623.jpeg','jpeg',NULL,NULL,'Yoganand','101','0','2014-06-22 11:50:56','3','2014-06-22 11:50:56','3'),(105,'AUTO','2','25000.00',NULL,'Honda Activa available for sale','9999933333','Jothi','Hello tHis is description','71','BLR','1403723566326.null',NULL,NULL,NULL,'Yoganand','101','0','2014-06-26 00:42:46','3','2014-06-26 00:42:46','3'),(106,'AUTO','1','450000.00',NULL,'Honda Amaze available for Sale immediately','77777766666','MGR','Hello tHis is description','46','BLR','1403724865967.jpeg','jpeg',NULL,NULL,'Yoganand','101','0','2014-06-26 01:04:25','3','2014-06-26 01:04:25','3'),(107,'AUTO','2','30000.00',NULL,'Honda Shine available for Sale','77777766666','MGR','Hello tHis is description','46','BLR','1403727066622.null',NULL,NULL,NULL,'Yoganand','101','0','2014-06-26 01:41:06','3','2014-06-26 01:41:06','3'),(108,'AUTO','2','30000.00',NULL,'Bajaj bike with insurance','77777766666','MGR','Hello tHis is description','C80','CHE','1403727179072.jpeg','jpeg',NULL,NULL,'Yoganand','101','0','2014-06-26 01:42:59','3','2014-06-26 01:42:59','3'),(109,'AUTO','1','150000.00',NULL,'Maruti Swift (TN Registration) available for Sale immediately','77777766666','MGR','Hello tHis is description','C2','CHE','1403728170073.null',NULL,NULL,NULL,'Yoganand','101','0','2014-06-26 01:59:30','3','2014-06-26 01:59:30','3');
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
  `CORP_ID` decimal(10,0)
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
SET character_set_client = @saved_cs_client;

--
-- Dumping data for table `user_credentials`
--

LOCK TABLES `user_credentials` WRITE;
/*!40000 ALTER TABLE `user_credentials` DISABLE KEYS */;
INSERT INTO `user_credentials` VALUES ('0',1,'shiva@infosys.com','test23','9999999999','0',NULL,NULL,'2014-06-22 11:09:22','SYSTEM','2014-06-22 11:09:22','SYSTEM'),('0',2,'sachin@corporate.com','test','9999977777','0',NULL,NULL,'2014-06-22 11:41:50','SYSTEM','2014-06-22 11:41:50','SYSTEM'),('0',3,'yoganand@cts.com','test123','9999911111','0','2014-06-26 01:57:50',NULL,'2014-06-22 11:46:44','SYSTEM','2014-06-26 01:57:50','3'),('0',4,'iiii@gmail.ccom','test','1231221232','0',NULL,NULL,'2014-06-22 13:48:03','SYSTEM','2014-06-22 13:48:03','SYSTEM');
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
INSERT INTO `user_profile` VALUES ('1','123','Shiva',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-22 11:09:22','SYSTEM','2014-06-22 11:09:22','SYSTEM',NULL),('2','100','Sachin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-22 11:41:50','SYSTEM','2014-06-22 11:41:50','SYSTEM',NULL),('3','101','Yoganand',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9999911111',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-22 11:46:44','SYSTEM','2014-06-22 11:46:44','SYSTEM',NULL),('4','101','kjkjh',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'1231221232',NULL,NULL,NULL,NULL,NULL,NULL,'2014-06-22 13:48:03','SYSTEM','2014-06-22 13:48:03','SYSTEM',NULL),('500','123','Shiva','Kumar','M','1984-06-05','23, 1st street, Bellandur, Bangalore','560103','BLR','shiva@gmail.com','9535322140','','GOLD','ACTIVE','1','PEN','PEN','2014-05-18 13:25:42','SYSTEM','2014-05-18 13:25:42','SYSTEM','HSR');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Current Database: `cbuddydb`
--

USE `cbuddydb`;

--
-- Final view structure for view `automobile_posts`
--

/*!50001 DROP TABLE `automobile_posts`*/;
/*!50001 DROP VIEW IF EXISTS `automobile_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `automobile_posts` AS select `pdau`.`POST_ID` AS `POST_ID`,`pdau`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`pdau`.`CITY` AS `CITY`,`pdau`.`LOCATION` AS `LOCATION`,`pdau`.`MAKE` AS `MAKE`,`pdau`.`MODEL` AS `MODEL`,`pdau`.`COLOR` AS `COLOR`,`pdau`.`YEAR` AS `YEAR`,`pdau`.`NO_OF_OWNERS` AS `NO_OF_OWNERS`,`pdau`.`FUEL_TYPE` AS `FUEL_TYPE`,`pdau`.`KMS_DONE` AS `KMS_DONE`,`pdau`.`MILEAGE` AS `MILEAGE`,`pdau`.`PRICE` AS `PRICE`,`pdau`.`PRICE_NEGOTIABLE` AS `PRICE_NEGOTIABLE`,`pdau`.`INSURANCE_AVAILABLE` AS `INSURANCE_AVAILABLE`,`pdau`.`REG_NO` AS `REG_NO`,`pdau`.`REG_CITY` AS `REG_CITY`,`pdau`.`REG_STATE` AS `REG_STATE`,`pdau`.`CREATED_ON` AS `CREATED_ON`,`pdau`.`CREATED_BY` AS `CREATED_BY`,`pdau`.`MODIFIED_ON` AS `MODIFIED_ON`,`pdau`.`MODIFIED_BY` AS `MODIFIED_BY`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID` from (`pdau` join `poit`) where (`poit`.`POST_ID` = `pdau`.`POST_ID`) */;

--
-- Final view structure for view `city`
--

/*!50001 DROP TABLE `city`*/;
/*!50001 DROP VIEW IF EXISTS `city`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `city` AS select `city_master`.`STATE_CODE` AS `STATE_CODE`,`city_master`.`CITY_CODE` AS `CITY_CODE`,`city_master`.`CITY_NAME` AS `CITY_NAME`,`city_master`.`created_on` AS `created_on`,`city_master`.`created_by` AS `created_by`,`city_master`.`modified_on` AS `modified_on`,`city_master`.`modified_by` AS `modified_by` from `city_master` */;

--
-- Final view structure for view `corp`
--

/*!50001 DROP TABLE `corp`*/;
/*!50001 DROP VIEW IF EXISTS `corp`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `corp` AS select `corporate_master`.`CORP_ID` AS `CORP_ID`,`corporate_master`.`CORP_NAME` AS `CORP_NAME`,`corporate_master`.`CORP_SHORT_NAME` AS `CORP_SHORT_NAME`,`corporate_master`.`ADDRESS` AS `ADDRESS`,`corporate_master`.`CITY` AS `CITY`,`corporate_master`.`STATE` AS `STATE`,`corporate_master`.`SIZE` AS `SIZE`,`corporate_master`.`CREATED_ON` AS `CREATED_ON`,`corporate_master`.`CREATED_BY` AS `CREATED_BY`,`corporate_master`.`MODIFIED_ON` AS `MODIFIED_ON`,`corporate_master`.`MODIFIED_BY` AS `MODIFIED_BY` from `corporate_master` */;

--
-- Final view structure for view `location`
--

/*!50001 DROP TABLE `location`*/;
/*!50001 DROP VIEW IF EXISTS `location`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `location` AS select `location_master`.`STATE_CODE` AS `STATE_CODE`,`location_master`.`CITY_CODE` AS `CITY_CODE`,`location_master`.`LOC_CODE` AS `LOC_CODE`,`location_master`.`LOC_NAME` AS `LOC_NAME`,`location_master`.`created_on` AS `created_on`,`location_master`.`created_by` AS `created_by`,`location_master`.`modified_on` AS `modified_on`,`location_master`.`modified_by` AS `modified_by` from `location_master` */;

--
-- Final view structure for view `neighborhood`
--

/*!50001 DROP TABLE `neighborhood`*/;
/*!50001 DROP VIEW IF EXISTS `neighborhood`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `neighborhood` AS select `neighborhood_details_table`.`ID` AS `ID`,`neighborhood_details_table`.`LOC_CODE` AS `LOC_CODE`,`neighborhood_details_table`.`NEIGHBOR_LOC_CODE` AS `NEIGHBOR_LOC_CODE`,`neighborhood_details_table`.`NEIGHBOR_LOC_NAME` AS `NEIGHBOR_LOC_NAME`,`neighborhood_details_table`.`DISTANCE` AS `DISTANCE` from `neighborhood_details_table` */;

--
-- Final view structure for view `pdau`
--

/*!50001 DROP TABLE `pdau`*/;
/*!50001 DROP VIEW IF EXISTS `pdau`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pdau` AS select `post_details_automobile`.`POST_ID` AS `POST_ID`,`post_details_automobile`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`post_details_automobile`.`CITY` AS `CITY`,`post_details_automobile`.`LOCATION` AS `LOCATION`,`post_details_automobile`.`MAKE` AS `MAKE`,`post_details_automobile`.`MODEL` AS `MODEL`,`post_details_automobile`.`COLOR` AS `COLOR`,`post_details_automobile`.`YEAR` AS `YEAR`,`post_details_automobile`.`NO_OF_OWNERS` AS `NO_OF_OWNERS`,`post_details_automobile`.`FUEL_TYPE` AS `FUEL_TYPE`,`post_details_automobile`.`KMS_DONE` AS `KMS_DONE`,`post_details_automobile`.`MILEAGE` AS `MILEAGE`,`post_details_automobile`.`PRICE` AS `PRICE`,`post_details_automobile`.`PRICE_NEGOTIABLE` AS `PRICE_NEGOTIABLE`,`post_details_automobile`.`INSURANCE_AVAILABLE` AS `INSURANCE_AVAILABLE`,`post_details_automobile`.`REG_NO` AS `REG_NO`,`post_details_automobile`.`REG_CITY` AS `REG_CITY`,`post_details_automobile`.`REG_STATE` AS `REG_STATE`,`post_details_automobile`.`CREATED_ON` AS `CREATED_ON`,`post_details_automobile`.`CREATED_BY` AS `CREATED_BY`,`post_details_automobile`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_details_automobile`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_details_automobile` */;

--
-- Final view structure for view `pdre`
--

/*!50001 DROP TABLE `pdre`*/;
/*!50001 DROP VIEW IF EXISTS `pdre`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pdre` AS select `post_details_real_estate`.`POST_ID` AS `POST_ID`,`post_details_real_estate`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`post_details_real_estate`.`RENT_OR_SALE` AS `RENT_OR_SALE`,`post_details_real_estate`.`NEW_OR_RESALE` AS `NEW_OR_RESALE`,`post_details_real_estate`.`READY_TO_OCCUPY` AS `READY_TO_OCCUPY`,`post_details_real_estate`.`EXPECTED_COMPLETION_DATE` AS `EXPECTED_COMPLETION_DATE`,`post_details_real_estate`.`AREA` AS `AREA`,`post_details_real_estate`.`LOCATION` AS `LOCATION`,`post_details_real_estate`.`CITY` AS `CITY`,`post_details_real_estate`.`PRICE_VALUE` AS `PRICE_VALUE`,`post_details_real_estate`.`PRICE_UNIT` AS `PRICE_UNIT`,`post_details_real_estate`.`FACING_DIRECTION` AS `FACING_DIRECTION`,`post_details_real_estate`.`MARITAL_PREFERENCE` AS `MARITAL_PREFERENCE`,`post_details_real_estate`.`FOOD_PREFERENCE` AS `FOOD_PREFERENCE`,`post_details_real_estate`.`REGIONAL_PREFERENCE` AS `REGIONAL_PREFERENCE`,`post_details_real_estate`.`BEDROOMS` AS `BEDROOMS`,`post_details_real_estate`.`AGE_VALUE` AS `AGE_VALUE`,`post_details_real_estate`.`AGE_UNIT` AS `AGE_UNIT`,`post_details_real_estate`.`FURNISHED` AS `FURNISHED`,`post_details_real_estate`.`FLOOR_NUMBER` AS `FLOOR_NUMBER`,`post_details_real_estate`.`MAINTENANCE` AS `MAINTENANCE`,`post_details_real_estate`.`APPROVAL_AUTHORITY` AS `APPROVAL_AUTHORITY`,`post_details_real_estate`.`BUILDER_NAME` AS `BUILDER_NAME`,`post_details_real_estate`.`SHARING` AS `SHARING`,`post_details_real_estate`.`GENDER` AS `GENDER`,`post_details_real_estate`.`NO_OF_ROOMMATES` AS `NO_OF_ROOMMATES`,`post_details_real_estate`.`CAR_PARKING` AS `CAR_PARKING`,`post_details_real_estate`.`FOOD` AS `FOOD`,`post_details_real_estate`.`WIFI` AS `WIFI`,`post_details_real_estate`.`GYM` AS `GYM`,`post_details_real_estate`.`CHILDREN_PLAY_AREA` AS `CHILDREN_PLAY_AREA`,`post_details_real_estate`.`SWIMMING_POOL` AS `SWIMMING_POOL`,`post_details_real_estate`.`CREATED_ON` AS `CREATED_ON`,`post_details_real_estate`.`CREATED_BY` AS `CREATED_BY`,`post_details_real_estate`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_details_real_estate`.`MODIFIED_BY` AS `MODIFIED_BY`,`post_details_real_estate`.`CLUB_HOUSE` AS `CLUB_HOUSE`,`post_details_real_estate`.`TV` AS `TV`,`post_details_real_estate`.`POWER_BACKUP` AS `POWER_BACKUP` from `post_details_real_estate` */;

--
-- Final view structure for view `poit`
--

/*!50001 DROP TABLE `poit`*/;
/*!50001 DROP VIEW IF EXISTS `poit`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `poit` AS select `post_index_table`.`POST_ID` AS `POST_ID`,`post_index_table`.`CATEGORY` AS `CATEGORY`,`post_index_table`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`post_index_table`.`PRICE` AS `PRICE`,`post_index_table`.`NEGOTIABLE` AS `NEGOTIABLE`,`post_index_table`.`TITLE` AS `TITLE`,`post_index_table`.`CONTACT_NO` AS `CONTACT_NO`,`post_index_table`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`post_index_table`.`DESCRIPTION` AS `DESCRIPTION`,`post_index_table`.`LOCATION` AS `LOCATION`,`post_index_table`.`CITY` AS `CITY`,`post_index_table`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`post_index_table`.`IMAGE_TYPE` AS `IMAGE_TYPE`,`post_index_table`.`THUMBNAIL_NAME` AS `THUMBNAIL_NAME`,`post_index_table`.`THUMBNAIL_TYPE` AS `THUMBNAIL_TYPE`,`post_index_table`.`USER_FIRST_NAME` AS `USER_FIRST_NAME`,`post_index_table`.`CORP_ID` AS `CORP_ID`,`post_index_table`.`RATING` AS `RATING`,`post_index_table`.`CREATED_ON` AS `CREATED_ON`,`post_index_table`.`CREATED_BY` AS `CREATED_BY`,`post_index_table`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_index_table`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_index_table` */;

--
-- Final view structure for view `ppic`
--

/*!50001 DROP TABLE `ppic`*/;
/*!50001 DROP VIEW IF EXISTS `ppic`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `ppic` AS select `post_picture`.`PIC_ID` AS `PIC_ID`,`post_picture`.`POST_ID` AS `POST_ID`,`post_picture`.`S_NO` AS `S_NO`,`post_picture`.`MAIN_PIC` AS `MAIN_PIC`,`post_picture`.`THUMBNAIL_PIC` AS `THUMBNAIL_PIC`,`post_picture`.`PIC_TYPE` AS `PIC_TYPE`,`post_picture`.`CREATED_ON` AS `CREATED_ON`,`post_picture`.`CREATED_BY` AS `CREATED_BY`,`post_picture`.`MODIFIED_ON` AS `MODIFIED_ON`,`post_picture`.`MODIFIED_BY` AS `MODIFIED_BY` from `post_picture` */;

--
-- Final view structure for view `real_estate_posts`
--

/*!50001 DROP TABLE `real_estate_posts`*/;
/*!50001 DROP VIEW IF EXISTS `real_estate_posts`*/;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`shiva`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `real_estate_posts` AS select `pdre`.`POST_ID` AS `POST_ID`,`pdre`.`SUB_CATEGORY` AS `SUB_CATEGORY`,`pdre`.`RENT_OR_SALE` AS `RENT_OR_SALE`,`pdre`.`NEW_OR_RESALE` AS `NEW_OR_RESALE`,`pdre`.`READY_TO_OCCUPY` AS `READY_TO_OCCUPY`,`pdre`.`EXPECTED_COMPLETION_DATE` AS `EXPECTED_COMPLETION_DATE`,`pdre`.`AREA` AS `AREA`,`pdre`.`LOCATION` AS `LOCATION`,`pdre`.`CITY` AS `CITY`,`pdre`.`PRICE_VALUE` AS `PRICE_VALUE`,`pdre`.`PRICE_UNIT` AS `PRICE_UNIT`,`pdre`.`FACING_DIRECTION` AS `FACING_DIRECTION`,`pdre`.`MARITAL_PREFERENCE` AS `MARITAL_PREFERENCE`,`pdre`.`FOOD_PREFERENCE` AS `FOOD_PREFERENCE`,`pdre`.`REGIONAL_PREFERENCE` AS `REGIONAL_PREFERENCE`,`pdre`.`BEDROOMS` AS `BEDROOMS`,`pdre`.`AGE_VALUE` AS `AGE_VALUE`,`pdre`.`AGE_UNIT` AS `AGE_UNIT`,`pdre`.`FURNISHED` AS `FURNISHED`,`pdre`.`FLOOR_NUMBER` AS `FLOOR_NUMBER`,`pdre`.`MAINTENANCE` AS `MAINTENANCE`,`pdre`.`APPROVAL_AUTHORITY` AS `APPROVAL_AUTHORITY`,`pdre`.`BUILDER_NAME` AS `BUILDER_NAME`,`pdre`.`SHARING` AS `SHARING`,`pdre`.`GENDER` AS `GENDER`,`pdre`.`NO_OF_ROOMMATES` AS `NO_OF_ROOMMATES`,`pdre`.`CAR_PARKING` AS `CAR_PARKING`,`pdre`.`FOOD` AS `FOOD`,`pdre`.`WIFI` AS `WIFI`,`pdre`.`GYM` AS `GYM`,`pdre`.`CHILDREN_PLAY_AREA` AS `CHILDREN_PLAY_AREA`,`pdre`.`SWIMMING_POOL` AS `SWIMMING_POOL`,`pdre`.`CREATED_ON` AS `CREATED_ON`,`pdre`.`CREATED_BY` AS `CREATED_BY`,`pdre`.`MODIFIED_ON` AS `MODIFIED_ON`,`pdre`.`MODIFIED_BY` AS `MODIFIED_BY`,`pdre`.`CLUB_HOUSE` AS `CLUB_HOUSE`,`pdre`.`TV` AS `TV`,`pdre`.`POWER_BACKUP` AS `POWER_BACKUP`,`poit`.`TITLE` AS `TITLE`,`poit`.`CONTACT_NO` AS `CONTACT_NO`,`poit`.`CONTACT_PERSON_NAME` AS `CONTACT_PERSON_NAME`,`poit`.`DESCRIPTION` AS `DESCRIPTION`,`poit`.`IMAGE_FILE_NAME` AS `IMAGE_FILE_NAME`,`poit`.`CORP_ID` AS `CORP_ID` from (`pdre` join `poit`) where (`poit`.`POST_ID` = `pdre`.`POST_ID`) */;

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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-06-25 20:43:28
