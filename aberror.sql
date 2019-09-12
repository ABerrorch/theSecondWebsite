-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: aberror
-- ------------------------------------------------------
-- Server version	5.5.53

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
-- Table structure for table `admin_auth_group`
--

DROP TABLE IF EXISTS `admin_auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_auth_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '这个表标识哪个用户组有什么权限',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '用户组名称',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` text COMMENT '规则id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='用户组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_auth_group`
--

LOCK TABLES `admin_auth_group` WRITE;
/*!40000 ALTER TABLE `admin_auth_group` DISABLE KEYS */;
INSERT INTO `admin_auth_group` VALUES (1,'SUPER',1,'163,200'),(2,'管理员',1,'1,19,143,144,6,3,15,16,17,18,4,20,21,181,152,156,157,193,194,161,165,164,166,167,168,169,182,185,186,201,206,183,187,188,203,184,204,205,162,170,171,172,173,174,175,176,177,202,179,178,180,200,197,198,199'),(4,'高级用户',1,'1,19,143,144,162,170,179,178,180'),(15,'一般用户',1,'1,19,143,144,161,164,167,168,169,182,185,186,201,206,183,187,188,203,184,204,205,162,170,171,172,173,174,175,176,177,202,179,178,180,197,198,199'),(21,'开发者',1,'1,19,143,144,6,2,7,8,9,3,15,16,17,18,4,20,21,181,152,156,157,193,194,161,165,164,166,167,168,169,182,185,186,183,187,188,184,189,190,162,170,171,172,173,174,175,176,177,179,178,180,200,197,198,199');
/*!40000 ALTER TABLE `admin_auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_auth_group_access`
--

DROP TABLE IF EXISTS `admin_auth_group_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_auth_group_access` (
  `uid` int(11) unsigned NOT NULL COMMENT '用户id',
  `group_id` int(11) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) COMMENT '这个表标识哪个用户在哪个用户组',
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户组明细表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_auth_group_access`
--

LOCK TABLES `admin_auth_group_access` WRITE;
/*!40000 ALTER TABLE `admin_auth_group_access` DISABLE KEYS */;
INSERT INTO `admin_auth_group_access` VALUES (88,1),(88,2),(89,4),(89,22),(93,1),(93,4),(93,19),(103,15),(104,15),(105,4),(106,4),(107,4),(108,4),(109,4),(110,4);
/*!40000 ALTER TABLE `admin_auth_group_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_auth_rule`
--

DROP TABLE IF EXISTS `admin_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_auth_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '这个表是保存网页所有权限的表',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `name` char(80) NOT NULL DEFAULT '' COMMENT '规则唯一标识',
  `title` char(20) NOT NULL DEFAULT '' COMMENT '规则中文名称',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态：为1正常，为0禁用',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '' COMMENT '规则表达式，为空表示存在就验证，不为空表示按照条件验证',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=207 DEFAULT CHARSET=utf8 COMMENT='规则表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_auth_rule`
--

LOCK TABLES `admin_auth_rule` WRITE;
/*!40000 ALTER TABLE `admin_auth_rule` DISABLE KEYS */;
INSERT INTO `admin_auth_rule` VALUES (16,3,'Admin/Rule/add_group','添加角色',1,1,''),(17,3,'Admin/Rule/edit_group','修改角色',1,1,''),(18,3,'Admin/Rule/delete_group','删除角色',1,1,''),(199,197,'Admin/listfile/batch_file_download','文件批量下载',1,1,''),(20,4,'Admin/User/add_user','添加用户',1,1,''),(7,2,'Admin/Rule/add','添加权限',1,1,''),(1,0,'Admin/Index/index','控制台',1,1,''),(200,163,'Great/great/great','可以作为课题项目管理员',1,1,''),(157,181,'Admin/Listfile/download_file','下载文件',1,1,''),(4,6,'Admin/User/index','用户管理',1,1,''),(19,1,'Admin/Index/logout','退出登录',1,1,''),(6,0,'Admin/Rule/nothing','高级权限',1,1,''),(3,6,'Admin/Rule/rule_group','角色管理',1,1,''),(8,2,'Admin/Rule/edit','修改权限',1,1,''),(9,2,'Admin/Rule/delete','删除权限',1,1,''),(2,6,'Admin/Rule/rule_list','权限管理',1,1,''),(15,3,'Admin/Rule/rule_distribution','角色分配权限',1,1,''),(21,4,'Admin/User/edit_user','修改用户',1,1,''),(143,1,'Admin/User/my_center','个人中心',1,1,''),(144,143,'Admin/User/change_msg','修改个人资料',1,1,''),(156,181,'Admin/Listfile/del_file','删除文件',1,1,''),(152,181,'Admin/Listfile/add_file','新增文件',1,1,''),(162,0,'Admin/Research/index','课题列表',1,1,''),(163,0,'Super/super/super','超级英雄',1,1,''),(170,162,'admin/Research/research_dominate','课题管理',1,1,''),(178,162,'Admin/Research/batch_file_delete','文件删除',1,1,''),(179,162,'Admin/Research/batch_file_download','文件下载',1,1,''),(180,162,'Admin/Research/add_file','文件上传',1,1,''),(181,6,'Admin/Listfile/index','文件管理',1,1,''),(198,197,'Admin/listfile/batch_file_list_admin','文件批量管理(高级)',1,1,''),(197,0,'Admin/listfile/batch_file_list_person','文件批量管理',1,1,'');
/*!40000 ALTER TABLE `admin_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_files`
--

DROP TABLE IF EXISTS `admin_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(31) NOT NULL DEFAULT '非空,不大于31字符' COMMENT '非空,不大于31字符,是文件标题',
  `type` varchar(31) NOT NULL DEFAULT '31字符以内' COMMENT '准备把所有文件都存到这里,所以用类型来区分不同种类的文件',
  `path` varchar(63) NOT NULL DEFAULT '' COMMENT '文件的实际路径和名称',
  `datetime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '添加时间',
  `author` varchar(31) NOT NULL DEFAULT 'admin' COMMENT '文件的所有者',
  `abstract` varchar(255) DEFAULT NULL COMMENT '对资料的简介',
  `size` varchar(31) DEFAULT NULL COMMENT '文件大小，单位字节',
  `label` varchar(31) DEFAULT 'normal' COMMENT '标记该文件所属与某个项目或课题',
  PRIMARY KEY (`id`),
  UNIQUE KEY `一条记录对应一个文件` (`path`)
) ENGINE=MyISAM AUTO_INCREMENT=174 DEFAULT CHARSET=utf8 COMMENT='这里是用来存储文件的数据库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_files`
--

LOCK TABLES `admin_files` WRITE;
/*!40000 ALTER TABLE `admin_files` DISABLE KEYS */;
INSERT INTO `admin_files` VALUES (172,'这个文件名','组织管理文件','20190912\\ea25021d6d25cf2525efef1ca50514cb.txt','2019-09-12 16:56:48','lixiangyang','','24','0,0'),(173,'某个文件','50万元以下设备','20190912\\d84610c1b3619fb8a557d5a5e8112320.txt','2019-09-12 17:01:45','lixiangyang','金额多少多少','24','1,4,0,0'),(171,'2018年项目组声响','2018年','20190906\\f05e0ae34fa56e7c34f093cbd7875740.txt','2019-09-06 18:03:32','lixiangyang','','24','0,4,0'),(167,'2018年组会会议','会议通知','20190906\\075fc468806e11cf4b5fa9348c324d9f.txt','2019-09-06 15:07:45','xuke05','','4093','5,2,0,0'),(166,'国家重点研发计划 课题任务书','课题任务书','20190906\\84acb9b737240d8cb151aaeb82a5aad9.txt','2019-09-06 15:04:10','xuke05','','24','5,1,0,0'),(165,'课题任务书','课题任务书','20190906\\7a38a01b0f9683fd33314dd60bf9ffa5.txt','2019-09-06 15:03:56','xuke05','这里是课题任务书的简介','24','5,1,0,0'),(164,'汇报PPT','汇报PPT','20190906\\43348e2f815508971e4086ed422c566d.txt','2019-09-06 14:23:33','admin','汇报PPT','24','0,3,0,0'),(162,'会议通知','会议通知','20190906\\719d6b84d8bbdc7eca305670cb7b6a0f.txt','2019-09-06 14:22:43','admin','会议通知','24','0,3,0,0'),(163,'会议签到表','会议签到表','20190906\\341472bfa4fd2b9b5617818733fb0d18.txt','2019-09-06 14:22:59','admin','会议签到表','4093','0,3,0,0'),(159,'工作计划和总结','工作计划和总结','20190906\\5e03249d80802219fbe5930a7572faf4.txt','2019-09-06 10:29:44','admin','工作计划和总结','24','0,2,1,0'),(160,'研究数据/报告/实验记录等技术文档','研究数据/报告/实验记录等技术文档','20190906\\c21dbce59aec6491fe26371c76425322.txt','2019-09-06 10:29:57','admin','研究数据/报告/实验记录等技术文档','24','0,2,1,1'),(156,'2022年组内会议','组内会议','20190905\\0d86372a0d193e114fb6499d1fceb6f6.txt','2019-09-05 21:28:05','admin','2022年组内会议','24','0,3,4,0'),(155,'2021年组内会议','组内会议','20190905\\503dbb06a2337c8af43ab43eca402cde.txt','2019-09-05 21:27:45','admin','2021年组内会议','24','0,3,3,0'),(154,'2020年组内会议','组内会议','20190905\\d7199f5e3a655887dc89f9cac0faadbb.txt','2019-09-05 21:27:30','admin','2020年组内会议','24','0,3,2,0'),(153,'2019年组内会议','组内会议','20190905\\e0141a222f65f7ca3c6ef83436476b70.txt','2019-09-05 21:27:10','admin','2019年组内会议','24','0,3,1,0'),(152,'技术合同','技术合同','20190905\\d33cb0522bdf3329a0e8617fafeca968.txt','2019-09-05 21:02:53','admin','技术合同','24','0,2,0,2'),(151,'课题任务书','课题任务书','20190905\\5c2ab7496f83764067074bf3db59a200.txt','2019-09-05 21:02:32','admin','课题任务书','24','0,2,0,0'),(150,'组织管理文件','组织管理文件','20190905\\23b18e04a8ca1ab48f9447ea83b86327.txt','2019-09-05 14:43:15','admin','组织管理文件','24','0,0'),(149,'文件1','组内会议','20190905\\1d24352b8b8ca394d8754258833477e0.txt','2019-09-05 13:49:23','admin','测试ReadOnly','151','0,3,0,0'),(148,'国家重点研发计划 课题任务书','实施协议','20190905\\f1666de6b3ac6923957b441edcc84fdd.txt','2019-09-05 13:30:48','admin','','24','0,2,0,1'),(147,'国家重点研发计划 课题任务书','$nowPath.name','20190905\\5e914b8a70fbd3754d0e280548afe641.txt','2019-09-05 13:28:21','admin','','24',''),(146,'国家重点研发计划 课题任务书','0,2,0,1','20190905\\0778f1826551cc938445522884727a9f.txt','2019-09-05 13:27:47','admin','','151',''),(145,'国家重点研发计划 课题任务书','0,2,0,1','20190905\\2bc87d08cae9f1b88ef81d5dc2b75952.jpg','2019-09-05 12:58:45','admin','','390121',''),(144,'文件1','0,2,0,1','20190905\\94cd6b6ecb5d5f52d57f6bf15a273031.txt','2019-09-05 10:52:15','admin','测试文件1','151','');
/*!40000 ALTER TABLE `admin_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_research`
--

DROP TABLE IF EXISTS `admin_research`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_research` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `principal` text COMMENT '管理员(们),谁对其可见',
  `name` varchar(31) NOT NULL DEFAULT '' COMMENT '名称',
  `project_id` int(11) DEFAULT NULL COMMENT '所属项目',
  `isPjt` int(1) NOT NULL DEFAULT '0' COMMENT '是否是pjt',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_research`
--

LOCK TABLES `admin_research` WRITE;
/*!40000 ALTER TABLE `admin_research` DISABLE KEYS */;
INSERT INTO `admin_research` VALUES (0,'admin,lixiangyang','项目名称',0,1),(1,'admin,lixiangyang01','课题名称1',0,0),(2,'admin,jiangjianguo02\n','课题名称2',0,0),(3,'xiaofu03','课题名称3',0,0),(4,'yangming04','课题名称4',0,0),(5,'xuke05','课题名称5',0,0);
/*!40000 ALTER TABLE `admin_research` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_test`
--

DROP TABLE IF EXISTS `admin_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_test` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `seg1` varchar(255) DEFAULT NULL COMMENT '该表格完全没用，只是用来测试',
  `seg2` varchar(255) DEFAULT NULL,
  `seg3` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_test`
--

LOCK TABLES `admin_test` WRITE;
/*!40000 ALTER TABLE `admin_test` DISABLE KEYS */;
INSERT INTO `admin_test` VALUES (1,'1','2',NULL),(2,'1','2',NULL),(3,'1','2',NULL),(4,'1','2',NULL),(5,'1','2',NULL),(6,'1','2',NULL),(7,'1','2',NULL);
/*!40000 ALTER TABLE `admin_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_users`
--

DROP TABLE IF EXISTS `admin_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；mb_password加密',
  `avatar` varchar(255) NOT NULL DEFAULT '' COMMENT '用户头像，相对于upload/avatar目录',
  `email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `email_code` varchar(60) DEFAULT NULL COMMENT '激活码',
  `phone` bigint(11) unsigned DEFAULT NULL COMMENT '手机号',
  `status` tinyint(1) NOT NULL DEFAULT '2' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `register_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
  `last_login_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '最后登录ip',
  `last_login_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_login_key` (`username`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=111 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (88,'admin','e10adc3949ba59abbe56e057f20f883e','/Upload/avatar/user1.jpg','784031469@qq.com','',13719739866,1,1449199996,'',0),(105,'lixiangyang','670b14728ad9902aecba32e22fa4f6bd','','null',NULL,0,1,0,'',0),(106,'lixiangyang01','e10adc3949ba59abbe56e057f20f883e','','null',NULL,0,1,0,'',0),(107,'jiangjianguo02','e10adc3949ba59abbe56e057f20f883e','','null',NULL,0,1,0,'',0),(108,'xiaofu03','e10adc3949ba59abbe56e057f20f883e','','null',NULL,0,1,0,'',0),(109,'yangming04','e10adc3949ba59abbe56e057f20f883e','','null',NULL,0,1,0,'',0),(110,'xuke05','e10adc3949ba59abbe56e057f20f883e','','null',NULL,0,1,0,'',0);
/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-09-12 20:07:58
