-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: wechat
-- ------------------------------------------------------
-- Server version	8.0.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item` (
  `itemid` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'主机'),(2,'显示器'),(3,'键盘'),(4,'鼠标'),(5,'投影仪'),(6,'笔记本'),(7,'显卡'),(8,'硬盘'),(9,'U盘'),(10,'单片机'),(11,'手环');
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_borrow_records`
--

DROP TABLE IF EXISTS `item_borrow_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `item_borrow_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) NOT NULL,
  `itemid` int(11) NOT NULL,
  `subItemId` int(11) NOT NULL,
  `borrowTime` datetime DEFAULT NULL,
  `returnTime` datetime DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `borrowerName` varchar(20) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT '0',
  `reason` varchar(200) DEFAULT NULL,
  `returned` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`,`openid`,`itemid`,`subItemId`),
  KEY `itemid` (`itemid`),
  KEY `subItemId` (`subItemId`),
  KEY `openid` (`openid`),
  CONSTRAINT `item_borrow_records_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`),
  CONSTRAINT `item_borrow_records_ibfk_2` FOREIGN KEY (`subItemId`) REFERENCES `subitem` (`subitemid`),
  CONSTRAINT `item_borrow_records_ibfk_3` FOREIGN KEY (`openid`) REFERENCES `user` (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_borrow_records`
--

LOCK TABLES `item_borrow_records` WRITE;
/*!40000 ALTER TABLE `item_borrow_records` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_borrow_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subitem`
--

DROP TABLE IF EXISTS `subitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `subitem` (
  `subItemId` int(11) NOT NULL AUTO_INCREMENT,
  `itemid` int(11) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `assertId` varchar(30) DEFAULT NULL,
  `remaining` int(11) DEFAULT NULL,
  PRIMARY KEY (`subItemId`,`itemid`),
  KEY `itemId` (`itemid`),
  CONSTRAINT `subitem_ibfk_1` FOREIGN KEY (`itemid`) REFERENCES `item` (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subitem`
--

LOCK TABLES `subitem` WRITE;
/*!40000 ALTER TABLE `subitem` DISABLE KEYS */;
INSERT INTO `subitem` VALUES (1,6,'联想',4,'',4),(2,6,'戴尔',6,'',4),(3,6,'惠普',3,'',4),(4,6,'宏碁',2,'',4),(5,6,'苹果',5,'',4),(6,11,'小米',10,'',5),(7,11,'华为',15,'',8),(8,8,'机械',10,'',8),(9,8,'固态',5,'',3);
/*!40000 ALTER TABLE `subitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `teacher` (
  `openid` varchar(50) NOT NULL,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teacher`
--

LOCK TABLES `teacher` WRITE;
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` VALUES ('0','李向阳'),('1','张燕咏'),('2','张兰'),('3','杨盘隆'),('4','丁虎'),('5','华蓓'),('6','张昱'),('7','周颢'),('8','谈海生'),('9','闫宇博');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `openid` varchar(50) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  `supervisor` varchar(10) DEFAULT NULL,
  `groupName` varchar(10) DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL,
  `home` varchar(40) DEFAULT NULL,
  `sno` varchar(15) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(35) DEFAULT NULL,
  `emergencyContactName` varchar(8) DEFAULT NULL,
  `emergencyContactPhone` varchar(15) DEFAULT NULL,
  `emergencyContactHome` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('aaaa','hfut','zhanglan','无线组','博一','北京市东城区',NULL,NULL,NULL,NULL,NULL,NULL),('oYm215Mjlon4sjOlYCdmRv5lCpBk','檀俊滔1','张兰','数据组','大四','安徽省安庆市迎江区','11111','18856964375','iamtanjuntao@qq.com','王海霞','06655574243','安徽省,安庆市,迎江区'),('xxxx','tanjuntao','张兰','数据组','大四','安徽省安庆市望江县',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-08 12:29:26
