-- MySQL dump 10.13  Distrib 5.5.53, for Win32 (AMD64)
--
-- Host: localhost    Database: wazyb
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
-- Table structure for table `admin_article`
--

DROP TABLE IF EXISTS `admin_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '这个数据表没什么用，是模板自带的',
  `abstract` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `author` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `del` int(1) DEFAULT '0' COMMENT '0代表正常，1代表删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_article`
--

LOCK TABLES `admin_article` WRITE;
/*!40000 ALTER TABLE `admin_article` DISABLE KEYS */;
INSERT INTO `admin_article` VALUES (1,'大家好','呵呵哒，还斩妖','2017-01-12 16:55:55','admin','阿萨飒飒飒飒飒飒撒飒飒飒飒飒飒飒飒飒飒飒飒飒飒所所所所所所所所',0),(2,'12','12','2017-01-13 11:36:33','admin','12',0),(3,'这是我的新文章嘿嘿','你想看吗','2017-01-13 15:00:59','admin','你是谁？',0),(4,'有时间了！1','你看','2017-01-13 14:47:16','admin','上看看',0),(5,'你好','怎么好','2017-01-13 11:36:16','admin','我也不知道',0),(6,'阿萨德','在线','2017-01-13 11:40:34','admin','121212啊',0),(7,'12','12','2017-01-13 14:47:27','admin','12',1),(8,'12','12','2017-01-13 14:47:35','admin','12',1),(9,'12','12','2017-01-13 11:44:34','admin','12',0),(10,'12','12','2017-01-13 11:49:50','admin','12',0),(11,'可以吗','assassin','2017-01-13 11:51:23','admin','好吧',0),(12,'是','2','2017-01-13 11:52:10','admin','场',0),(13,'撒','手','2017-01-13 11:52:44','admin','吧',0),(14,'阿萨','在学校','2017-01-13 11:53:36','admin','撒啊飒飒',0),(15,'1必须好啊！','2','2017-01-13 14:50:28','admin','3',0),(16,'这分页真好用','你知道吗','2017-01-13 13:34:22','admin','哈哈哈',1),(17,'我来看看','还不错','2017-01-13 15:36:03','test','就你了！怎么用',0),(18,'测试','11','2017-01-13 16:07:29','admin','啊啊',0),(19,'在','啊啊','2017-01-13 16:07:42','admin','啊啊',0),(20,'31','13','2017-01-13 16:08:35','admin','13',0),(21,'11','11','2017-01-13 16:08:41','admin','11',0),(22,'zzz','zzz','2017-01-13 16:42:41','admin','zzz',1),(23,'Ccc','ccc','2017-01-13 16:42:38','admin','ccc',1),(24,'vvv','vvv','2017-01-13 16:42:35','admin','vvv',1),(25,'12','31','2017-01-13 16:42:28','admin','13',1),(26,'xc','xc','2017-01-13 16:42:25','admin','xc',1),(27,'','','2017-01-13 17:26:48','admin','',1),(28,'','','2017-01-13 17:26:44','admin','',1),(29,'ssss','ssss','2017-01-13 17:26:21','admin','sss',0),(30,'21','12','2017-01-13 17:26:29','admin','12',0),(31,'','','2017-01-13 17:26:40','admin','',1),(32,'asasd','asdd','2017-01-13 17:49:13','test','asdadsad',0),(33,'11111111111','11111111','2017-01-13 17:49:21','test','1111111111111',0),(34,'1asd','1asdasd','2019-03-15 20:55:23','admin','1asdas',0),(35,'1212','1212','2017-01-13 18:00:25','admin','121212',0),(36,'12','12','2017-01-13 18:00:56','admin','12',0),(37,'12121212121212121212','121212121212121212','2017-01-13 18:04:20','admin','12121',0),(38,'好开心啊啊','好开心啊啊','2017-01-13 18:05:42','admin','好开心啊啊',0),(39,'qw','qw','2017-01-13 18:09:07','admin','qw',0),(40,'22','22','2017-01-13 18:09:12','admin','22',0),(41,'442','2424','2017-01-13 18:09:18','admin','24224',0),(42,'qwqw1','qqwqw','2017-01-17 22:18:26','test','qwqwqqw',1),(43,'12','13','2017-01-17 18:01:09','test','14',1),(44,'asdlkfjaksld','aslkdjflkasfj','2019-03-15 15:30:28','admin','askldjfklasjdflkasjdfasdf',0),(45,'hainenma','haimenma','2019-03-15 20:54:41','admin','jlaksjdkflaskdfasdf',0);
/*!40000 ALTER TABLE `admin_article` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `admin_auth_group` VALUES (1,'SUPER',1,'163,200'),(2,'管理员',1,'1,19,143,144,6,3,15,16,17,18,4,20,21,181,152,156,157,193,194,161,165,164,166,167,168,169,182,185,186,201,206,183,187,188,203,184,204,205,162,170,171,172,173,174,175,176,177,202,179,178,180,200,197,198,199'),(4,'高级用户',1,'1,19,143,144,161,165,164,167,168,169,182,185,186,201,206,183,187,188,203,184,204,205,162,170,171,172,173,174,175,176,177,202,179,178,180,200,197,199'),(15,'一般用户',1,'1,19,143,144,161,164,167,168,169,182,185,186,201,206,183,187,188,203,184,204,205,162,170,171,172,173,174,175,176,177,202,179,178,180,197,198,199'),(21,'开发者',1,'1,19,143,144,6,2,7,8,9,3,15,16,17,18,4,20,21,181,152,156,157,193,194,161,165,164,166,167,168,169,182,185,186,183,187,188,184,189,190,162,170,171,172,173,174,175,176,177,179,178,180,200,197,198,199'),(19,'LINK管理员',1,'1,19,143,144,193,194'),(20,'网站文件管理员',1,'1,19,143,144,197,198,199'),(22,'能删除项目',1,'166');
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
INSERT INTO `admin_auth_group_access` VALUES (88,1),(88,2),(88,19),(88,20),(89,4),(89,22),(93,1),(93,4),(93,19),(103,15),(104,15);
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
INSERT INTO `admin_auth_rule` VALUES (16,3,'Admin/Rule/add_group','添加角色',1,1,''),(17,3,'Admin/Rule/edit_group','修改角色',1,1,''),(18,3,'Admin/Rule/delete_group','删除角色',1,1,''),(199,197,'Admin/listfile/batch_file_download','文件批量下载',1,1,''),(20,4,'Admin/User/add_user','添加用户',1,1,''),(7,2,'Admin/Rule/add','添加权限',1,1,''),(1,0,'Admin/Index/index','控制台',1,1,''),(200,163,'Great/great/great','可以作为课题项目管理员',1,1,''),(157,181,'Admin/Listfile/download_file','下载文件',1,1,''),(4,6,'Admin/User/index','用户管理',1,1,''),(19,1,'Admin/Index/logout','退出登录',1,1,''),(6,0,'Admin/Rule/nothing','高级权限',1,1,''),(3,6,'Admin/Rule/rule_group','角色管理',1,1,''),(8,2,'Admin/Rule/edit','修改权限',1,1,''),(9,2,'Admin/Rule/delete','删除权限',1,1,''),(2,6,'Admin/Rule/rule_list','权限管理',1,1,''),(15,3,'Admin/Rule/rule_distribution','角色分配权限',1,1,''),(21,4,'Admin/User/edit_user','修改用户',1,1,''),(143,1,'Admin/User/my_center','个人中心',1,1,''),(144,143,'Admin/User/change_msg','修改个人资料',1,1,''),(156,181,'Admin/Listfile/del_file','删除文件',1,1,''),(152,181,'Admin/Listfile/add_file','新增文件',1,1,''),(162,0,'Admin/Research/index','课题列表',1,1,''),(161,0,'Admin/Project/index','项目列表',1,1,''),(163,0,'Super/super/super','超级英雄',1,1,''),(164,165,'Admin/Project/project_edit','项目编辑',1,1,''),(165,161,'Admin/Project/project_add','项目添加',1,1,''),(166,165,'Admin/Project/project_del','项目删除',1,1,''),(167,161,'Admin/Project/research_add','课题添加',1,1,''),(168,167,'Admin/Project/research_modify','课题修改',1,1,''),(169,167,'Admin/Project/research_del','课题删除',1,1,''),(170,162,'admin/Research/research_dominate','课题管理',1,1,''),(171,170,'admin/Research/research_rename','课题修改',1,1,''),(172,162,'admin/Research/conference_add','会议添加',1,1,''),(173,172,'admin/Research/conference_modify','会议修改',1,1,''),(174,172,'admin/Research/conference_del','会议删除',1,1,''),(175,162,'admin/Research/request_add','要求添加',1,1,''),(176,175,'admin/Research/request_add_file','要求满足',1,1,''),(177,175,'admin/Research/request_dominate','要求管理',1,1,''),(178,179,'Admin/Research/del_file','文件删除',1,1,''),(179,162,'Admin/Research/download_file','文件下载',1,1,''),(180,179,'Admin/Research/add_file','文件上传',1,1,''),(181,6,'Admin/Listfile/index','文件管理',1,1,''),(182,161,'admin/Project/conference_add','会议添加',1,1,''),(183,161,'admin/Project/request_add','要求添加',1,1,''),(184,203,'Admin/Project/batchFileCtrl','文件批量管理',1,1,''),(185,182,'admin/Project/conference_modify','会议修改',1,1,''),(186,182,'admin/Project/conference_del','会议删除',1,1,''),(187,183,'admin/Project/request_add_file','要求满足',1,1,''),(188,183,'admin/Project/request_dominate','要求管理',1,1,''),(201,182,'Admin/Project/pjt_conf_push','会议推送',1,1,''),(202,175,'admin/Research/push_request_add_file','为推送的会议上传文件',1,1,''),(193,6,'Admin/Link/index','LINK',1,1,''),(194,193,'Admin/Link/submit','LINK提交',1,1,''),(198,197,'Admin/listfile/batch_file_list_admin','文件批量管理(高级)',1,1,''),(197,0,'Admin/listfile/batch_file_list_person','文件批量管理',1,1,''),(203,161,'Admin/Project/download_file','文件下载',1,1,''),(204,203,'Admin/Project/del_file','文件删除',1,1,''),(205,203,'Admin/Project/add_file','文件上传',1,1,''),(206,182,'Admin/Project/pjt_conf_broadcast','会议广播',1,1,'');
/*!40000 ALTER TABLE `admin_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_conference`
--

DROP TABLE IF EXISTS `admin_conference`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_conference` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(31) NOT NULL DEFAULT '空白会议' COMMENT '会议名称',
  `research_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '会议所属课题编号',
  `status` varchar(31) DEFAULT '未开始' COMMENT '（其实暂时没用）当前会议状态(未开始,已开始,已结束)',
  `files_count` int(11) NOT NULL DEFAULT '0' COMMENT '会议中文件速度，理论上是非负整数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=179 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_conference`
--

LOCK TABLES `admin_conference` WRITE;
/*!40000 ALTER TABLE `admin_conference` DISABLE KEYS */;
INSERT INTO `admin_conference` VALUES (15,'项目启动会',37,'未开始',0),(12,'年度工作总结会',37,'未开始',4),(13,'中期检查会',37,'未开始',8),(14,'验收管理会',37,'未开始',0),(48,'中期会议',38,'未开始',0),(39,'年中终结',35,'未开始',3),(38,'项目开题会议',35,'未开始',2),(37,'空白会议',37,'未开始',0),(36,'空白会议',34,'未开始',0),(35,'空白会议',34,'未开始',2),(46,'开题报告',38,'未开始',3),(45,'年末报告',35,'未开始',0),(61,'结题会议',38,'未开始',3),(64,'2018.(7-12)',47,'未开始',3),(65,'任务书签署',49,'未开始',2),(68,'2019.(7-12)',47,'未开始',0),(66,'2019.(1-6)',47,'未开始',0),(69,'2020.(1-6)',47,'未开始',0),(70,'中期考核',47,'未开始',1),(71,'2020.(7-12)',47,'未开始',0),(72,'2021.(1-6)',47,'未开始',0),(73,'2021.(7-12)',47,'未开始',0),(74,'2022.(1-6)',47,'未开始',0),(75,'课题 验收',47,'未开始',1),(170,'空白会议',84,'未开始',0),(178,'空白会议',83,'未开始',1),(166,'空白会议',83,'未开始',1),(165,'课题测试',47,'未开始',1),(126,'新测试会议',64,'未开始',2),(135,'空白会议',64,'未开始',1),(133,'新测试会议',64,'未开始',2),(134,'新测试会议',64,'未开始',2),(132,'课题的某个会议',66,'未开始',1);
/*!40000 ALTER TABLE `admin_conference` ENABLE KEYS */;
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
  `label` varchar(31) DEFAULT 'normal' COMMENT '特殊标记,某些程序中使用',
  PRIMARY KEY (`id`),
  UNIQUE KEY `一条记录对应一个文件` (`path`)
) ENGINE=MyISAM AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COMMENT='这里是用来存储文件的数据库';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_files`
--

LOCK TABLES `admin_files` WRITE;
/*!40000 ALTER TABLE `admin_files` DISABLE KEYS */;
INSERT INTO `admin_files` VALUES (1,'2018年工作方案','request:22','20190325\\ef7ae451bee4ceeb7737f8617fc9ed5f.txt','2019-03-25 19:11:30','admin','','21',''),(2,'会议通知文档','request:19','20190325\\ac6203e3fb496e20af39664eed1d09b0.txt','2019-03-25 19:12:06','admin','','21',''),(3,'汇报PPT','request:20','20190325\\e932f3e916f3837bb0807f2136376401.txt','2019-03-25 19:12:15','admin','','21',''),(4,'资料一','research:37','20190325\\f3a674dd6d0a81166e1a4c71891970f9.txt','2019-03-25 19:12:48','admin','','21',''),(5,'课题文档二','research:37','20190325\\a1fa49906929f3c1eb153e79ddfbcaae.txt','2019-03-25 19:14:20','admin','','21',''),(6,'中期检查报告','request:29','20190325\\bfc45aab14bab2d26d5d86e06b742148.txt','2019-03-25 19:19:35','admin','','21',''),(7,'会议纪要','request:21','20190326\\8d09172ff9c8f80569ce43fa1c3316ac.txt','2019-03-26 10:34:27','admin2','','0',''),(8,'课题资料1','research:34','20190326\\33b13b62dfd42a1786ec80da4c23f80c.txt','2019-03-26 15:02:56','ABerror','','21',''),(9,'财务汇报PPT','request:25','20190326\\2a0af939c4441865316ff73953ca6a0c.txt','2019-03-26 16:13:19','ABerror','','21',''),(10,'template','request:19','20190328\\5962f8cb00cbfa6047da6fa713d43cf0.txt','2019-03-28 19:55:34','admin','','0',''),(11,'template','request:20','20190328\\dcfa3ba77449b3ebe9af4db74cbd71c7.txt','2019-03-28 19:56:35','admin','','74',''),(12,'template','request:51','20190328\\7a7f3130776ed7f0906bb6490963ca4c.txt','2019-03-28 20:00:00','admin','','0',''),(13,'template','request:52','20190328\\81ea79eaa9d4a97ea1389f3a262a2f97.md','2019-03-28 20:00:41','admin','','364',''),(14,'template','request:52','20190328\\c8e9e8bee4088c7ea4afc68c22800a04.md','2019-03-28 20:00:49','admin','','364',''),(20,'template','request:54','20190329\\dffd9c0474b8bc16540d77d23fcbdc7e.txt','2019-03-29 12:09:59','admin','','74',''),(22,'课题资料1','research:35','20190329\\823e12ea6c0504209bf4709d16684201.md','2019-03-29 12:12:46','admin','','364',''),(21,'template','request:54','20190329\\1dbff3b0fc96f9c6db4c8deb1a1f4e9e.txt','2019-03-29 12:10:13','admin','','74',''),(41,'template','request:60','20190405\\8cde2d175693a0ba7ebc5cda666195b0.md','2019-04-05 21:24:13','admin','','1933',''),(34,'课题资料3','research:37','20190403\\db7419bb4a6d380f42db326bbe780368.txt','2019-04-03 15:25:38','admin','','21',''),(42,'新会议材料Ver3.0','request:61#conference_request','20190405\\4e7b68cdfe1f66751e437baca8e785fb.md','2019-04-05 21:25:24','admin','','1933',''),(40,'新会议材料Ver2.0','request:61#conference_request','20190405\\653b3563826af3cecfa1685fb33af530.md','2019-04-05 21:22:41','admin','','1933',''),(28,'公开文件','public','20190329\\07eb897706c4125d04d3b874d602bb97.txt','2019-03-29 14:29:22','admin','','74',''),(29,'项目申请书','research:35','20190401\\350d861e233b2b450b01703ae76dc26e.txt','2019-04-01 19:00:13','admin','','145',''),(30,'文档模板','request:59','20190401\\21f2df94b45457d5198a43c601dcdeae.txt','2019-04-01 19:02:01','admin','','145',''),(31,'文件','request:59','20190401\\ebc040ae03061b282056d038d4572d7c.txt','2019-04-01 19:05:52','admin','','145',''),(45,'边缘云系统的实现资料1','research:38','20190406\\12eee0c963df351142717f59155b4a1a.md','2019-04-06 15:01:27','admin','','1933',''),(37,'测试批量下载3','request:66','20190404\\fe02231e425fea9d2fd066029faa5079.md','2019-04-04 15:36:34','admin','','1078',''),(38,'测试批量下载4','request:66','20190404\\2e6c4c759339f3b48db37e36980d8a1a.md','2019-04-04 15:36:45','admin','','1078',''),(39,'测试批量下载5','request:66','20190404\\e07b120cf2c1af1270468b7982a6b5a8.md','2019-04-04 15:36:55','admin','','1078',''),(44,'template','request:68','20190406\\83139afa6963b998191f44781b21bb69.md','2019-04-06 13:33:52','admin','','1933',''),(46,'边缘云系统的实现资料2','research:38','20190406\\f079147e41320a923872d505b61077a2.txt','2019-04-06 15:01:39','admin','','151',''),(47,'课题申报书','request:66','20190406\\f26dd7edadd05bb2da19d03b1031dcc0.md','2019-04-06 15:02:13','admin','','1933',''),(48,'template','request:74','20190406\\7e929658cf3a930b3c92473bf465483d.md','2019-04-06 15:05:53','admin','','1933',''),(49,'课题结题报告','request:74','20190406\\8d8f96cdb985bb3f881c9f2657d7da1e.md','2019-04-06 15:06:04','admin','','1933',''),(50,'template','request:76','20190406\\927df33e3b9f9fe79b8411b7ec088f3c.md','2019-04-06 16:51:00','admin','','1933',''),(51,'template','request:73','20190406\\8b162a60aae4db24489f965b50f7c89d.md','2019-04-06 17:24:56','admin','','1933',''),(58,'国家重点研发计划 课题任务书','research:47#research_files','20190414\\61d977c3d657b7fd676964ccca8935e5.pdf','2019-04-14 14:45:31','admin','适应智慧城市与物联网安全目标的安全架构和应用示范','5176575',''),(61,'国家重点研发计划 课题任务书','research:49','20190414\\da19ae22cf83a6812143c17c35bd644c.pdf','2019-04-14 14:52:29','ABerror','适应智慧城市与物联网安全目标的安全架构和应用示 范','5176575',''),(60,'国家重点研发计划 课题任务书','research:47','20190414\\3c9140a88bcbe8b6c4773b6a45bf419d.pdf','2019-04-14 14:48:13','admin','物联网与智慧城市安全保障关键技术研究','17612315',''),(63,'国家重点研发计划 课题组织实施协议','research:49','20190414\\9661cbce5fac1ef4daa3377706f40fb4.txt','2019-04-14 15:01:29','ABerror','乙方： 中移物联网有限公司','151',''),(64,'国家重点研发计划 课题组织实施协议','research:49','20190414\\ea2774c98c71ecfc58adf42f08561c4b.txt','2019-04-14 15:02:40','ABerror','乙方： 北京奇安信科技有限公司','49',''),(65,'国家重点研发计划 课题组织实施协议','research:49','20190414\\fc92b225d62183f9e0a513a67ee7d175.txt','2019-04-14 15:03:30','ABerror','乙方： 北京泰豪智能工程有限公司','151',''),(66,'国家重点研发计划 课题组织实施协议','research:49','20190414\\a61c5288629ba20a946478d6cdefbcbb.txt','2019-04-14 15:04:02','ABerror','乙方： 国家信息中心','151',''),(67,'template','request:82','20190414\\5bd46dbc80f2743b391a4e760b06c4df.txt','2019-04-14 15:04:46','ABerror','','151',''),(68,'签字后任务书','request:82','20190414\\06c1c703062b8ad2ca947e0353ea870f.pdf','2019-04-14 15:05:20','ABerror','','5176575',''),(71,'用来测试新UI的文件','research:35','20190419\\57c389e8baf4213ed1b056b05d1bc3cf.txt','2019-04-19 19:48:09','admin','测试新UI','34',''),(131,'template','request:189','20190420\\4c3bed2754ab041a4ab19f1404afa001.txt','2019-04-20 20:29:00','admin','','0',''),(75,'国家重点研发计划 课题任务书','request:86','20190420\\70eeccc998116c58cd5492ba2e601356.txt','2019-04-20 20:27:56','admin','','34',''),(76,'template','request:86','20190420\\9e664f80bcf510c5ce8bdab87820920b.txt','2019-04-20 20:29:00','admin','','0',''),(77,'[75]','request:86','20190420\\3b8345f24053c4b6ccb0c8c757cfa348.md','2019-04-20 21:06:36','ABerror','','712',''),(79,'kk','request:86','20190421\\7135828c469fc5e6f3d9c8f1cd17bf27.md','2019-04-21 14:59:45','admin2','','712',''),(142,'原始文件','request:201','20190510\\97d224cf6b3e365288a315db415d2430.txt','2019-05-10 21:48:30','admin','','34',''),(143,'template','request:201','20190510\\e0becf27e513a135eff1c8dfa99c3a91.txt','2019-05-10 21:48:36','admin','','34',''),(134,'原始文件','request:190','20190510\\0bf4d1be24d509cff83f3f60ed0e3fa4.txt','2019-05-10 21:48:30','admin','','34',''),(135,'template','request:190','20190510\\eb4143b5aa6f5129966c06879800add8.txt','2019-05-10 21:48:36','admin','','34',''),(91,'文件历史1','request:86','20190426\\a176f7eb932f3886877ef51c0874b665.txt','2019-04-26 20:01:54','admin','','151',''),(92,'文件历史2','request:86','20190426\\0380abb10bbfffb182de740e307cae2f.txt','2019-04-26 20:02:05','admin','','151',''),(93,'历史A1','request:106','20190426\\1db0208bd2ed4fa6c77c7f1317875357.txt','2019-04-26 21:05:14','admin','','151',''),(94,'历史A2','request:106','20190426\\6aee7bf794281e017cdb7a2520912aa0.txt','2019-04-26 21:05:26','admin','','151',''),(95,'历史B1','request:82','20190426\\e5c95d87d80bd0c4bf2f212b69d9c1a8.txt','2019-04-26 21:05:37','admin','','151',''),(96,'历史B2','request:82','20190426\\10ff85cdce5fd356b30d6feffb0f26b8.txt','2019-04-26 21:05:46','admin','','151',''),(128,'文件Ver1.5','request:137','20190429\\854e6d4843fff89f76013f1534fd01b8.docx','2019-04-29 14:45:11','admin2','','163975',''),(129,'文件Ver2.0','request:137','20190429\\87e34eeb41f12b8311e61ea6c69cca95.docx','2019-04-29 14:45:20','admin2','','163975',''),(130,'文件历史2','request:189','20190426\\383c2218c910cbb019f3d65ddfbb82f1.txt','2019-04-26 20:02:05','admin','','151',''),(107,'国家重点研发计划 课题任务书','research:64','20190428\\1b7a6a1b58291ef4aebee7cc98643f0d.md','2019-04-28 16:02:43','admin2','','27834',''),(108,'template','research:64','20190428\\1c6f075abae9ea55bebbd5c3eea6588e.txt','2019-04-28 16:02:51','admin2','','151',''),(109,'会议要求1文件1','request:123','20190428\\b427b204e268f3ed72909beaf48d247e.md','2019-04-28 16:04:22','admin2','','83',''),(110,'会议要求1template','request:123','20190428\\838c30a5f442f3444ba057ff6388c5a4.md','2019-04-28 16:04:34','admin2','','83',''),(127,'文件Ver1.1','request:137','20190429\\dd00c4dc7585f17949800307fa8c0b1f.docx','2019-04-29 14:45:03','admin2','','163975',''),(122,'会议要求1文件1','request:134','20190428\\68f3aab1194b70249fdd1d4583b04c8c.md','2019-04-28 16:04:22','admin2','','83',''),(123,'会议要求1template','request:134','20190428\\50ea7d13f123ca26aa112cd78048b992.md','2019-04-28 16:04:34','admin2','','83',''),(124,'会议要求1文件1','request:136','20190428\\d10d8d933f122fe4203806cf46c8a304.md','2019-04-28 16:04:22','admin2','','83',''),(125,'会议要求1template','request:136','20190428\\b9a042d838ac8785f927a0fb004967c5.md','2019-04-28 16:04:34','admin2','','83',''),(126,'文件Ver1.0','request:137','20190429\\29f34e53666096e4bada8748c46fca77.txt','2019-04-29 14:44:55','admin2','','34',''),(120,'国家重点研发计划 课题任务书','request:132','20190428\\177b97688a3622f24a7098d5ef97cd9d.md','2019-04-28 16:18:06','admin2','','83','');
/*!40000 ALTER TABLE `admin_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_pjtpushconf`
--

DROP TABLE IF EXISTS `admin_pjtpushconf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_pjtpushconf` (
  `project_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目编号',
  `conference_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目推送的会议编号',
  `research_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目pid给课题rid推送了会议cid',
  `origin_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`project_id`,`conference_id`),
  KEY `research_id` (`research_id`),
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_pjtpushconf`
--

LOCK TABLES `admin_pjtpushconf` WRITE;
/*!40000 ALTER TABLE `admin_pjtpushconf` DISABLE KEYS */;
INSERT INTO `admin_pjtpushconf` VALUES (32,178,85,166);
/*!40000 ALTER TABLE `admin_pjtpushconf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_pjtpushfile`
--

DROP TABLE IF EXISTS `admin_pjtpushfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_pjtpushfile` (
  `project_id` int(11) NOT NULL DEFAULT '0' COMMENT '项目编号',
  `file_id` int(11) NOT NULL DEFAULT '0' COMMENT '文件编号',
  PRIMARY KEY (`project_id`,`file_id`) COMMENT '项目pjt推送的file',
  KEY `project_id` (`project_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_pjtpushfile`
--

LOCK TABLES `admin_pjtpushfile` WRITE;
/*!40000 ALTER TABLE `admin_pjtpushfile` DISABLE KEYS */;
INSERT INTO `admin_pjtpushfile` VALUES (18,69),(18,74),(22,107),(22,108);
/*!40000 ALTER TABLE `admin_pjtpushfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_project`
--

DROP TABLE IF EXISTS `admin_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `principal` text NOT NULL COMMENT '管理员，用'',''分开',
  `research` text COMMENT '项目所拥有的课题，用‘，’分开',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '名称',
  `time` datetime DEFAULT '0000-00-00 00:00:00' COMMENT '时间',
  `constant_id` int(11) DEFAULT NULL COMMENT '项目的常数课题,包含了项目所拥有的资料和会议',
  `teammate` text COMMENT '组员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_project`
--

LOCK TABLES `admin_project` WRITE;
/*!40000 ALTER TABLE `admin_project` DISABLE KEYS */;
INSERT INTO `admin_project` VALUES (13,'ADMIN','34,36,37,38','LINK团队云计算中心','2019-04-18 20:14:16',35,'ABerror,WMR,chenhuan,chenhuan3'),(16,'admin','49','物联网与智慧城市安全保障关键技术研究','2019-04-18 19:43:59',47,'admin2'),(22,'admin2','65,66','新测试项目，测试新版课题和项目','2019-04-28 16:02:00',64,'admin'),(31,'admin2',NULL,'空项目','2019-05-08 20:16:22',82,NULL),(32,'admin','84,85','空项目','2019-05-09 19:58:23',83,NULL);
/*!40000 ALTER TABLE `admin_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_request`
--

DROP TABLE IF EXISTS `admin_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_request` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `abstract` varchar(255) DEFAULT '尚未填写描述' COMMENT '对于request的描述',
  `file_id` int(11) DEFAULT NULL COMMENT 'request对应的文件的编号',
  `upload` binary(1) NOT NULL DEFAULT '1' COMMENT '文件是否可以上传',
  `conference_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'request所属的会议的编号',
  `template_id` int(11) DEFAULT NULL COMMENT '模板文件编号',
  `history` text COMMENT '记录文件的历史',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=202 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_request`
--

LOCK TABLES `admin_request` WRITE;
/*!40000 ALTER TABLE `admin_request` DISABLE KEYS */;
INSERT INTO `admin_request` VALUES (26,'任务汇报PPT',NULL,'1',13,NULL,NULL),(25,'财务汇报PPT',9,'1',13,NULL,NULL),(29,'中期检查报告',6,'0',13,NULL,NULL),(19,'会议通知',2,'1',12,10,NULL),(20,'汇报PPT',3,'1',12,11,NULL),(21,'会议纪要',7,'1',12,NULL,NULL),(22,'实施工作方案',1,'0',12,NULL,NULL),(23,'科技成果清单',NULL,'1',13,NULL,NULL),(24,'中期检查财务资料清单',NULL,'1',13,NULL,NULL),(27,'中期检查整改方案',NULL,'1',13,NULL,NULL),(28,'中期检查整改报告',NULL,'1',13,NULL,NULL),(50,'这家伙很懒,什么也没写',NULL,'1',13,NULL,NULL),(49,'这家伙很懒,什么也没写',NULL,'1',35,NULL,NULL),(48,'这家伙很懒,什么也没写',NULL,'1',35,NULL,NULL),(76,'新增的会议通知',NULL,'1',46,50,NULL),(54,'要求1',21,'0',38,20,NULL),(72,'展示PPT',NULL,'1',61,NULL,NULL),(58,'PPT',NULL,'1',39,NULL,NULL),(59,'文档',31,'1',39,30,NULL),(60,'会议材料',NULL,'1',39,41,NULL),(73,'经费实际使用表',51,'1',61,NULL,NULL),(68,'这家伙很懒,什么也没写',NULL,'1',38,44,NULL),(74,'课题结题报告',49,'1',61,48,NULL),(66,'课题申报书',47,'1',46,37,NULL),(71,'预算表',NULL,'1',46,NULL,NULL),(81,'论文报告',NULL,'1',64,NULL,NULL),(82,'签字之后的任务书',96,'1',65,67,'95,96'),(83,'专利报告',NULL,'1',64,NULL,NULL),(84,'设计方案报告',NULL,'1',64,NULL,NULL),(85,'中期执行情况报告',NULL,'1',70,NULL,NULL),(86,'结题验收情况报告',92,'1',75,76,'91,92'),(106,'尚未填写描述',94,'1',65,NULL,'93,94'),(201,'某种描述',142,'1',178,143,'142'),(189,'结题验收情况报告',130,'1',165,131,'130'),(190,'某种描述',134,'1',166,135,'134'),(135,'会议要求2',NULL,'1',134,NULL,NULL),(122,'会议要求2',NULL,'1',126,NULL,NULL),(123,'会议要求1',109,'1',126,110,'109'),(134,'会议要求1',122,'1',133,123,'122'),(133,'会议要求2',NULL,'1',133,NULL,NULL),(136,'会议要求1',124,'1',134,125,'124'),(137,'通知文件',129,'1',135,NULL,'126,127,128,129'),(132,'某个要求',120,'1',132,NULL,'120');
/*!40000 ALTER TABLE `admin_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_research`
--

DROP TABLE IF EXISTS `admin_research`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_research` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `principal` text COMMENT '管理员',
  `name` varchar(31) NOT NULL DEFAULT '' COMMENT '名称',
  `time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT 'time',
  `project_id` int(11) DEFAULT NULL COMMENT '所属项目',
  `teammate` text COMMENT '组员',
  `description` text COMMENT '对项目的描述,由Email类的Description相关方法创建',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_research`
--

LOCK TABLES `admin_research` WRITE;
/*!40000 ALTER TABLE `admin_research` DISABLE KEYS */;
INSERT INTO `admin_research` VALUES (35,'','LINK团队云计算中心','0000-00-00 00:00:00',13,NULL,'&gt课题文件<br>&nbsp&nbsp&nbsp&times课题资料1<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*Author___admin<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*Datetime_2019-03-29 12:12:46<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*Abstract_(No abstract)<br>&nbsp&nbsp&nbsp&times项目申请书<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*Author___admin<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*Datetime_2019-04-01 19:00:13<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*Abstract_(No abstract)<br>&gt年中终结<br>&nbsp&nbsp&nbsp&timesPPT<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求文件__(文件尚未上传)<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求状态__(无模板)(可上传)<br>&nbsp&nbsp&nbsp&times文档<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求文件__文件<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求状态__(有模板)(可上传)<br>&nbsp&nbsp&nbsp&times会议材料<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求文件__(文件尚未上传)<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求状态__(有模板)(可上传)<br>&gt项目开题会议<br>&nbsp&nbsp&nbsp&timesaaaaaa<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求文件__template<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求状态__(有模板)(不可上传)<br>&nbsp&nbsp&nbsp&times这家伙很懒,什么也没写<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求文件__(文件尚未上传)<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求状态__(有模板)(可上传)<br>&gt年末报告<br>&nbsp&nbsp&nbsp&times(该会议为空会议)<br>&gt空白会议<br>&nbsp&nbsp&nbsp&times(该会议为空会议)'),(38,'admin,admin2','边缘云系统的实现','2019-03-25 19:41:44',13,'','&gt课题文件<br>&nbsp&nbsp&nbsp&times边缘云系统的实现资料1<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*Author___admin<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*Datetime_2019-04-06 15:01:27<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*Abstract_(No abstract)<br>&nbsp&nbsp&nbsp&times边缘云系统的实现资料2<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*Author___admin<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*Datetime_2019-04-06 15:01:39<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*Abstract_(No abstract)<br>&gt中期会议<br>&nbsp&nbsp&nbsp&times(该会议为空会议)<br>&gt开题报告<br>&nbsp&nbsp&nbsp&times课题申报书<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求文件__课题申报书<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求状态__(有模板)(可上传)<br>&nbsp&nbsp&nbsp&times预算表<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求文件__(文件尚未上传)<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求状态__(无模板)(可上传)<br>&gt结题会议<br>&nbsp&nbsp&nbsp&times展示PPT<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求文件__(文件尚未上传)<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求状态__(无模板)(可上传)<br>&nbsp&nbsp&nbsp&times经费实际使用表<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求文件__(文件尚未上传)<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求状态__(无模板)(可上传)<br>&nbsp&nbsp&nbsp&times课题结题报告<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求文件__课题结题报告<br>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp*要求状态__(有模板)(可上传)'),(37,'admin','边缘计算中的安全性问题','2019-03-25 19:07:08',13,'admin2,ABerror,WMR',NULL),(34,'ABerror,WMR,lls','边缘计算中的配置问题','2019-03-25 19:07:04',13,'',NULL),(36,'admin2','边缘计算在边缘云上的调度','2019-03-25 19:07:07',13,NULL,NULL),(47,NULL,'物联网与智慧城市安全保障关键技术研究','2019-04-14 14:27:28',16,NULL,NULL),(49,'admin,ABERROR,WMR,lls','适应智慧城市与物联网安全目标的安全架构和应用示范','2019-04-14 14:28:52',16,'',NULL),(84,'admin','空课题2','2019-05-09 20:03:28',32,NULL,NULL),(85,'admin','空课题1','2019-05-09 20:03:30',32,NULL,NULL),(64,NULL,'新测试项目，测试新版课题和项目','2019-04-28 16:01:24',22,NULL,NULL),(65,'aberror','新测试课题2','2019-04-28 16:02:02',22,NULL,NULL),(66,'wmr','新测试课题1','2019-04-28 16:02:04',22,'aberror',NULL),(83,NULL,'空项目','2019-05-09 19:58:23',32,NULL,NULL),(82,NULL,'空项目','2019-05-08 20:16:22',31,NULL,NULL);
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
) ENGINE=MyISAM AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_users`
--

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;
INSERT INTO `admin_users` VALUES (88,'admin','e10adc3949ba59abbe56e057f20f883e','/Upload/avatar/user1.jpg','784031469@qq.com','',13719739866,1,1449199996,'',0),(89,'admin2','e10adc3949ba59abbe56e057f20f883e','/Upload/avatar/user2.jpg','784031469@qq.com','',13719739866,1,1449199996,'',0),(93,'ABerror','e10adc3949ba59abbe56e057f20f883e','','784031469@qq.com',NULL,13719739866,1,0,'',0),(94,'WMR','4d86e76e2eed37454af10cdbe74b6160','','66666@qq.com',NULL,666666666,1,0,'',0),(102,'chenhuan','e10adc3949ba59abbe56e057f20f883e','','784031469@qq.com',NULL,13719739866,2,0,'',0),(103,'chenhuan2','e10adc3949ba59abbe56e057f20f883e','','784031469@qq.com',NULL,13719739866,2,0,'',0),(104,'chenhuan3','4d86e76e2eed37454af10cdbe74b6160','','784031469@qq.com',NULL,13719739866,2,0,'',0);
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

-- Dump completed on 2019-09-03 19:32:05
