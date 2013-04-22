CREATE DATABASE  IF NOT EXISTS `sthu` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `sthu`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: sthu
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `t_activity_apply`
--

DROP TABLE IF EXISTS `t_activity_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_activity_apply` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LEDContent` varchar(1024) DEFAULT NULL,
  `activityContent` varchar(4000) DEFAULT NULL,
  `activityLocation` varchar(256) DEFAULT NULL,
  `activityMaterial` varchar(4000) DEFAULT NULL,
  `activityName` varchar(64) DEFAULT NULL,
  `applicatantCell` varchar(32) DEFAULT NULL,
  `applicatantEmail` varchar(255) DEFAULT NULL,
  `applicatantName` varchar(32) DEFAULT NULL,
  `applicatantType` varchar(128) DEFAULT NULL,
  `applyDate` datetime DEFAULT NULL,
  `applyPath` int(11) NOT NULL,
  `applyStatus` int(11) NOT NULL,
  `applyType` int(11) NOT NULL,
  `applyUserID` int(11) NOT NULL,
  `confirmDate` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `identityComment` varchar(1024) DEFAULT NULL,
  `identityCommentNickname` varchar(32) DEFAULT NULL,
  `identityCommentUserid` int(11) NOT NULL,
  `identityDate` datetime DEFAULT NULL,
  `identityStatus` int(11) NOT NULL,
  `identityType` int(11) NOT NULL,
  `organizerName` varchar(128) DEFAULT NULL,
  `resourceComment` varchar(1024) DEFAULT NULL,
  `resourceCommentNickname` varchar(32) DEFAULT NULL,
  `resourceCommentUserid` int(11) NOT NULL,
  `resourceDate` datetime DEFAULT NULL,
  `resourceStatus` int(11) NOT NULL,
  `resourceType` int(11) NOT NULL,
  `startTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `applyDateIndex` (`applyDate`),
  KEY `applyStatusIndex` (`applyStatus`),
  KEY `applyTypeIndex` (`applyType`),
  KEY `applyUserIDIndex` (`applyUserID`),
  KEY `confirmDateIndex` (`confirmDate`),
  KEY `identityDateIndex` (`identityDate`),
  KEY `identityStatusIndex` (`identityStatus`),
  KEY `identityTypeIndex` (`identityType`),
  KEY `resourceDateIndex` (`resourceDate`),
  KEY `resourceTypeStatusIndex` (`resourceStatus`),
  KEY `resourceTypeIndex` (`resourceType`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_activity_apply`
--

LOCK TABLES `t_activity_apply` WRITE;
/*!40000 ALTER TABLE `t_activity_apply` DISABLE KEYS */;
INSERT INTO `t_activity_apply` VALUES (1,'XX','<p>****dcfvghbjnkml,</p>',NULL,NULL,'LINANGRAN','1111','3232@111.com','d3eed3','myself','2013-03-13 15:04:55',78,2,1,2012310670,'2013-03-13 15:05:11','2013-03-20 15:04:00',NULL,NULL,0,NULL,1,78,'WOZIJI ',NULL,NULL,0,NULL,0,2,'2013-03-15 15:04:00'),(2,'sdffdsdffsd','<p>fsd说明活动的主要内容，如内容较多请使用上传附件功能。</p>',NULL,NULL,'dsf','d','dsa','dsf','sd','2013-03-14 16:54:25',1,1,1,1,NULL,'2013-03-14 10:41:00',NULL,NULL,0,NULL,0,1,'sdfss',NULL,NULL,0,NULL,0,2,'2013-03-14 16:41:00'),(3,NULL,'<p>fd说明活动的主要内容，如内容较多请使用上传附件功能。</p>','sfdfsd','<p>请使用上传附件功能上传活动材料，例如：室外活动展板内容、分发的传单内容等</p>','sdffdssdf','fds','fds','sdffdssdf','fds','2013-03-14 16:54:11',1,1,2,1,NULL,'2013-03-14 16:42:00',NULL,NULL,0,NULL,0,1,'sdfsdf',NULL,NULL,0,NULL,0,3,'2013-03-14 16:42:00'),(4,'123','<p>说明活动的主要内容，如内容较多请使用上传附件功能。</p>',NULL,NULL,'123','123','213','林盎然','123','2013-04-13 23:47:40',1,2,1,2009013197,'2013-04-13 23:49:38','2013-04-13 23:23:00',NULL,NULL,0,NULL,1,1,'123',NULL,NULL,0,NULL,0,2,'2013-04-13 23:23:00'),(5,NULL,'<p>q说明活动的主要内容，如内容较多请使用上传附件功能。</p>','sdf','<p>请使用上传附件功能上传活动材料sdf，例如：室外活动展板内容等</p>','w','sdf3','sdf4','林盎然','sdf2','2013-04-13 23:49:24',1,2,2,2009013197,'2013-04-13 23:49:46','2013-04-13 23:48:00',NULL,NULL,0,NULL,1,1,'sfd1',NULL,NULL,0,NULL,0,3,'2013-04-13 23:48:00'),(6,NULL,'<p>fsd说明活动的主要内容，如内容较多请使用上传附件功能。</p>','fsd','<p>请使用上传附件功能上传活动材料，例如：室外活动展板内容等</p>','dfs','sfd','fsd','林盎然','sfd','2013-04-14 00:37:07',1,2,2,2009013197,'2013-04-14 00:37:38','2013-04-14 00:16:00',NULL,NULL,0,NULL,1,1,'sfd',NULL,NULL,0,NULL,0,3,'2013-04-14 00:16:00'),(7,'123','<p>213说明活动的主要内容，如内容较多请使用上传附件功能。</p>',NULL,NULL,'213','123aaaaa123','321','林盎然','132','2013-04-14 00:37:00',1,1,1,2009013197,NULL,'2013-04-14 00:32:00',NULL,NULL,0,NULL,0,1,'123',NULL,NULL,0,NULL,0,2,'2013-04-14 00:32:00');
/*!40000 ALTER TABLE `t_activity_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_apply_comment`
--

DROP TABLE IF EXISTS `t_apply_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_apply_comment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `applyId` int(11) NOT NULL,
  `comment` varchar(5000) DEFAULT NULL,
  `commentStatus` int(11) NOT NULL,
  `commentType` int(11) NOT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `pubDate` datetime DEFAULT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `applyIdIndex` (`applyId`),
  KEY `pubDateIndex` (`pubDate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_apply_comment`
--

LOCK TABLES `t_apply_comment` WRITE;
/*!40000 ALTER TABLE `t_apply_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_apply_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_auth`
--

DROP TABLE IF EXISTS `t_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_auth` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `opAllocateCode` int(11) NOT NULL,
  `opArticle` int(11) NOT NULL,
  `opIdentityCode` int(11) NOT NULL,
  `opResourceCode` int(11) NOT NULL,
  `userrole` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_auth`
--

LOCK TABLES `t_auth` WRITE;
/*!40000 ALTER TABLE `t_auth` DISABLE KEYS */;
INSERT INTO `t_auth` VALUES (1,-1,-1,-1,-1,1),(2,-1,-1,-1,-1,2),(3,-1,-1,-1,-1,1),(4,-1,-1,-1,1,2),(5,-1,-1,-1,1,2),(6,-1,-1,-1,3,2),(7,-1,-1,-1,4,2),(8,-1,-1,1,-1,2),(9,-1,-1,2,-1,2),(10,-1,-1,3,-1,2),(11,-1,-1,4,-1,2),(12,-1,-1,5,-1,2),(13,-1,-1,6,-1,2),(14,-1,-1,7,-1,2),(15,-1,-1,8,-1,2),(16,-1,-1,9,-1,2),(17,-1,-1,1,-1,2),(18,-1,-1,2,-1,2),(19,-1,-1,3,-1,2),(20,-1,-1,4,-1,2),(21,-1,-1,5,-1,2),(22,-1,-1,6,-1,2),(23,-1,-1,7,-1,2),(24,-1,-1,8,-1,2),(25,-1,-1,9,-1,2),(26,-1,-1,10,-1,2),(27,-1,-1,11,-1,2),(28,-1,-1,12,-1,2),(29,-1,-1,13,-1,2),(30,-1,-1,14,-1,2),(31,-1,-1,15,-1,2),(32,-1,-1,16,-1,2),(33,-1,-1,17,-1,2),(34,-1,-1,18,-1,2),(35,-1,-1,19,-1,2),(36,-1,-1,20,-1,2),(37,-1,-1,21,-1,2),(38,-1,-1,22,-1,2),(39,-1,-1,23,-1,2),(40,-1,-1,24,-1,2),(41,-1,-1,25,-1,2),(42,-1,-1,26,-1,2),(43,-1,-1,27,-1,2),(44,-1,-1,28,-1,2),(45,-1,-1,29,-1,2),(46,-1,-1,30,-1,2),(47,-1,-1,31,-1,2),(48,-1,-1,32,-1,2),(49,-1,-1,33,-1,2),(50,-1,-1,34,-1,2),(51,-1,-1,35,-1,2),(52,-1,-1,36,-1,2),(53,-1,-1,37,-1,2),(54,-1,-1,38,-1,2),(55,-1,-1,39,-1,2),(56,-1,-1,40,-1,2),(57,-1,-1,41,-1,2),(58,-1,-1,42,-1,2),(59,-1,-1,43,-1,2),(60,-1,-1,44,-1,2),(61,-1,-1,45,-1,2),(62,-1,-1,46,-1,2),(63,-1,-1,47,-1,2),(64,-1,-1,48,-1,2),(65,-1,-1,49,-1,2),(66,-1,-1,50,-1,2),(67,-1,-1,51,-1,2),(68,-1,-1,52,-1,2),(69,-1,-1,53,-1,2),(70,-1,-1,54,-1,2),(71,-1,-1,55,-1,2),(72,-1,-1,56,-1,2),(73,-1,-1,57,-1,2),(74,-1,-1,58,-1,2),(75,-1,-1,59,-1,2),(76,-1,-1,60,-1,2),(77,-1,-1,61,-1,2),(78,-1,-1,62,-1,2),(79,-1,-1,63,-1,2),(80,-1,-1,64,-1,2),(81,-1,-1,65,-1,2),(82,-1,-1,66,-1,2),(83,-1,-1,67,-1,2),(84,-1,-1,68,-1,2),(85,-1,-1,69,1,2),(86,-1,-1,70,2,2),(87,-1,-1,71,3,2),(88,-1,-1,72,4,2),(89,1,-1,73,-1,2),(90,2,-1,74,-1,2),(91,3,-1,75,-1,2),(200,-1,-1,-1,-1,1),(201,-1,-1,76,-1,2),(202,-1,-1,77,-1,2),(203,-1,-1,78,-1,2),(204,-1,-1,79,-1,2),(205,-1,-1,80,-1,2),(206,-1,-1,81,-1,2),(207,-1,-1,-1,1,2),(208,-1,-1,-1,2,2),(209,-1,-1,-1,3,2),(210,-1,-1,-1,4,2),(211,1,-1,-1,-1,2),(212,2,-1,-1,-1,2),(213,3,-1,-1,-1,2);
/*!40000 ALTER TABLE `t_auth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_column`
--

DROP TABLE IF EXISTS `t_column`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_column` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(1024) DEFAULT NULL,
  `isFixedInHomePage` tinyint(1) NOT NULL,
  `isVisibleForUser` tinyint(1) NOT NULL,
  `name` varchar(32) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_column`
--

LOCK TABLES `t_column` WRITE;
/*!40000 ALTER TABLE `t_column` DISABLE KEYS */;
INSERT INTO `t_column` VALUES (1,'这是通知公告',1,1,'通知公告'),(2,'这是综合新闻',1,1,'综合新闻'),(3,'这是院系新闻',1,1,'院系新闻'),(4,'这是活动预告',1,1,'活动预告'),(5,'没有',0,0,'隐藏栏目'),(6,'这是生活信息栏目',0,1,'生活信息'),(7,'这是活动资讯栏目',0,1,'活动资讯'),(8,'这是专题栏目',0,1,'专题栏目');
/*!40000 ALTER TABLE `t_column` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_croom_apply`
--

DROP TABLE IF EXISTS `t_croom_apply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_croom_apply` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `allocateDate` datetime DEFAULT NULL,
  `allocateStatus` int(11) NOT NULL,
  `allocateType` int(11) NOT NULL,
  `applyDate` datetime DEFAULT NULL,
  `applyStatus` int(11) NOT NULL,
  `applyType` int(11) NOT NULL,
  `applyUserid` int(11) NOT NULL,
  `borrowDate` date DEFAULT NULL,
  `borrower` varchar(255) DEFAULT NULL,
  `borrowerCell` varchar(255) DEFAULT NULL,
  `classUsage` int(11) NOT NULL,
  `confirmDate` datetime DEFAULT NULL,
  `content` varchar(5000) DEFAULT NULL,
  `croomtype` int(11) NOT NULL,
  `identityDate` datetime DEFAULT NULL,
  `identityStatus` int(11) NOT NULL,
  `identityType` int(11) NOT NULL,
  `manager` varchar(255) DEFAULT NULL,
  `managerCell` varchar(255) DEFAULT NULL,
  `number` int(11) NOT NULL,
  `organizer` varchar(255) DEFAULT NULL,
  `resourceDate` datetime DEFAULT NULL,
  `resourceStatus` int(11) NOT NULL,
  `resourceType` int(11) NOT NULL,
  `timePeriod` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `usageComment` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `allocateDateIndex` (`allocateDate`),
  KEY `allocateStatusIndex` (`allocateStatus`),
  KEY `allocateTypeIndex` (`allocateType`),
  KEY `applyDateIndex` (`applyDate`),
  KEY `applyStatusIndex` (`applyStatus`),
  KEY `applyUseridIndex` (`applyUserid`),
  KEY `confirmDateIndex` (`confirmDate`),
  KEY `identityDateIndex` (`identityDate`),
  KEY `identityStatusIndex` (`identityStatus`),
  KEY `identityTypeIndex` (`identityType`),
  KEY `resourceDateIndex` (`resourceDate`),
  KEY `resourceStatusIndex` (`resourceStatus`),
  KEY `resourceTypeIndex` (`resourceType`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_croom_apply`
--

LOCK TABLES `t_croom_apply` WRITE;
/*!40000 ALTER TABLE `t_croom_apply` DISABLE KEYS */;
INSERT INTO `t_croom_apply` VALUES (1,NULL,0,1,'2013-03-08 15:24:37',1,1,1,'2013-03-09','林盎然','13888888888',2,NULL,'<p>   <strong>\n    <span style=\"color: rgb(198,217,240);\">如内容较多请使用上传附件功能上传说明文档。  </span></strong></p>',2,NULL,0,1,'林盎然','13888888888',100,'&lt;script&gt;alert(&#x27;hello&#x27;);&lt;&#x2F;script&gt;',NULL,0,1,'例：11:00-13:00','学生清华讲座','党团活动'),(2,NULL,0,3,'2013-03-14 16:54:51',1,1,1,'2013-03-15','我','13888888888',1,NULL,'<p>如内容较多请使用上传附件功能上传说明文档。</p>',3,NULL,0,1,'ds','13888888888',123,'软院学生会',NULL,0,1,'例：11:00-13:00','sdfsdf','校园比赛'),(3,NULL,0,1,'2013-04-14 00:15:00',1,2,2009013197,'2013-04-20','林盎然','213',4,NULL,'<p>231能上传说明文档。</p>',2,NULL,0,2,'123','231',213,'123',NULL,0,1,'11：30-12：30','213','123'),(4,NULL,0,3,'2013-04-14 00:37:47',1,1,2009013197,'2013-04-23','林盎然','sd',4,NULL,'<p>231如内容较多请使用上传附件功能上传说明文档。</p>',4,NULL,0,1,'fds','sfd',231,'sdf',NULL,0,1,'11:00-13:00','213','请在此填写213321');
/*!40000 ALTER TABLE `t_croom_apply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_index_setting_entity`
--

DROP TABLE IF EXISTS `t_index_setting_entity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_index_setting_entity` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `link` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_index_setting_entity`
--

LOCK TABLES `t_index_setting_entity` WRITE;
/*!40000 ALTER TABLE `t_index_setting_entity` DISABLE KEYS */;
INSERT INTO `t_index_setting_entity` VALUES (1,1,'/upload/20130302/43351362158529166.jpg','/new/new.do?id=2','你好1'),(2,1,'/upload/20130302/44511362158534561.jpg','#','你好2'),(3,1,'/upload/20130302/4851362158541558.jpg','#','你好3'),(4,1,'/upload/20130302/93481362158548208.jpg','#','你好4'),(5,0,'','','');
/*!40000 ALTER TABLE `t_index_setting_entity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_new`
--

DROP TABLE IF EXISTS `t_new`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_new` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(16) DEFAULT NULL,
  `browseNumber` int(11) DEFAULT NULL,
  `content` longtext,
  `isPlacedInColumnTop` tinyint(1) DEFAULT NULL,
  `newAbstract` varchar(250) DEFAULT NULL,
  `redirectURL` varchar(255) DEFAULT NULL,
  `title` varchar(64) NOT NULL,
  `updatetime` datetime DEFAULT NULL,
  `columnBelong_ID` int(11) DEFAULT NULL,
  `allowComment` tinyint(1) DEFAULT NULL,
  `allowForward` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK68F7F5592B550AB` (`columnBelong_ID`),
  KEY `authorIndex` (`author`),
  KEY `columnBelongIndex` (`columnBelong_ID`),
  KEY `titleIndex` (`title`),
  KEY `updatetimeIndex` (`updatetime`),
  CONSTRAINT `FK68F7F5592B550AB` FOREIGN KEY (`columnBelong_ID`) REFERENCES `t_column` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_new`
--

LOCK TABLES `t_new` WRITE;
/*!40000 ALTER TABLE `t_new` DISABLE KEYS */;
INSERT INTO `t_new` VALUES (1,'科研院',10,'<p><strong style=\"color:#303030;font-family:simsun;font-size:14px;line-height:21px;text-align:left;background-color:#ffffff;\"> &nbsp; &nbsp;清华新闻网1月18日电</strong><span style=\"color:#303030;font-family:simsun;font-size:14px;line-height:21px;text-align:left;background-color:#ffffff;\">（通讯员 </span><strong style=\"color:#303030;font-family:simsun;font-size:14px;line-height:21px;text-align:left;background-color:#ffffff;\">王燕 孟宪飞</strong><span style=\"color:#303030;font-family:simsun;font-size:14px;line-height:21px;text-align:left;background-color:#ffffff;\">）1月18日上午，2012年度国家科学技术奖励大会在北京人民大会堂隆重举行。清华大学自动化系戴琼海教授等完成的“立体视频重建与显示技术及装置”项目和土木系聂建国教授等完成的“大跨建筑钢-混凝土组合结构新技术及其应用”项目同时获得2012年度国家技术发明奖一等奖。</span></p><p style=\"text-align:center;\"><span style=\"color:#303030;font-family:simsun;font-size:14px;line-height:21px;text-align:left;background-color:#ffffff;\"><img src=\"/upload/20130301/55011362152265348.jpg\" title=\"xianchang.jpg\" /></span></p><p style=\"text-align:center;\"><span style=\"color:#303030;font-family:楷体, 楷体_gb2312;font-size:14px;line-height:21px;text-align:center;background-color:#ffffff;\">图为国家科学技术奖励大会现场。图片来源：新华社</span><span style=\"color:#303030;font-family:simsun;font-size:14px;line-height:21px;text-align:left;background-color:#ffffff;\"></span></p><div id=\"datalist_detail\" style=\"width:auto;height:auto;text-align:left;line-height:21px;list-style-type:none;font-size:14px;color:#303030;font-family:simsun;background-color:#ffffff;padding:0px;margin:15px;\"><p>党和国家领导人胡锦涛、习近平、温家宝、李克强、刘云山等出席大会并为获奖代表颁奖。温家宝代表党中央、国务院在大会上讲话，李克强宣读了《国务院关于2012年度国家科学技术奖励的决定》。</p><p>　　清华此次共有17项优秀科技成果获得2012年度国家科学技术三大奖，居全国高校首位。其中，国家自然科学奖3项，国家技术发明奖7项，国家科学技术进步奖7项。清华大学作为第一单位或第一完成人所在单位获奖数量再攀新高，达到11项。</p><p>　　除获得2项技术发明一等奖外，电子系陆建华教授等完成的“无线多媒体协同通信模型及性能优化”项目，自动化系周东华教授等完成的“控制系统实时故障检测、分离与估计理论和方法”项目，以及材料学院潘峰教授等完成的“氧化锌薄膜微结构与性能调控中的若干基础问题”项目获国家自然科学奖二等奖；化工系骆广生教授等完成的“微结构化工传质设备及其工业应用”项目，电机系王祥珩教授等完成的“交流电机系统的多回路分析技术及应用”项目，信研院尹浩教授等完成的“面向海量用户的新型视频分发网络”项目，精仪系尤政教授等完成的“先进空间光学姿态敏感器技术”项目，以及电子系罗毅教授等完成的“高速分布反馈半导体激光器及其与电吸收调制器单片集成光源”项目获国家技术发明奖二等奖；水利系张楚汉院士等完成的“高坝动静力超载破损机理与安全评价方法”项目获国家科学技术进步奖二等奖。</p><p>　　2010年至2012年3年内，清华大学作为第一单位或第一完成人所在单位共有5项科技成果获得国家科技奖一等奖，其中国家技术发明奖一等奖4项，国家科技进步奖一等奖1项。截止到2012年度，清华大学累计获国家科学技术奖励456项，其中：国家最高科技奖获奖者1人，国家自然科学奖52项，国家技术发明奖131项，国家科学技术进步奖272项。</p><p style=\"text-align:right;\">供稿：科研院 编辑：襄桦</p><p><br /></p></div><div id=\"source1\" style=\"width:auto;height:auto;line-height:16px;list-style-type:none;font-size:14px;color:#434343;text-align:left;vertical-align:top;font-family:simsun;background-color:#ffffff;padding:0px;margin:10px 50px;\">（http://news.tsinghua.edu.cn）</div><p style=\"text-align:left;\"><span style=\"color:#303030;font-family:simsun;font-size:14px;line-height:21px;text-align:left;background-color:#ffffff;\"><br /></span><br /></p>',1,'1月18日上午，2012年度国家科学技术奖励大会在北京人民大会堂隆重举行。清华大学自动化系戴琼海教授等完成的“立体视频重建与显示技术及装置”项目和土木系聂建国教授等完成的“大跨建筑钢-混凝土组合结构新技术及其应用”项目同时获得2012年度国家技术发明奖一等奖。','','2012年度国家科技奖揭晓 清华同时获2项技术发明奖一等奖','2013-03-01 23:38:23',1,NULL,NULL),(7,'施一公',42,'<div id=\"datalist_detail\" style=\"width:auto;height:auto;text-align:left;line-height:21px;list-style-type:none;font-size:14px;color:#303030;font-family:simsun;background-color:#ffffff;padding:0px;margin:15px;\"><p><strong>清华新闻网12月21日电</strong> 12月19日，清华大学生命科学学院教授施一公带领其研究组在《自然》杂志以研究长文（Research Article）的形式发表了题为《早老素家族天冬氨酸膜整合蛋白酶的结构》（<strong><em>Structure of a presenilin family intramembrane aspartate protease</em></strong>）的研究论文，首次报道了人的早老素蛋白（presenilin) 在古细菌Methanoculleus marisnigri JR1中同源蛋白PSH的晶体结构。清华生命科学学院博士研究生李晓淳和党尚宇为文章的共同第一作者，生命科学学院王佳伟博士参与合作。</p><p style=\"text-align:center;\"><img width=\"425\" height=\"306\" src=\"/upload/1362153190914.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为早老素同源蛋白PSH的晶体结构。</span></p><p>　　阿兹海默症（Alzheimer disease，AD），又称老年痴呆症，是一种致死性神经退行性疾病。该病多发于65岁以上的老人，然而也有少见的早发性阿兹海默症（Early-onset AD）病患会提早发病。随着人口的老龄化，AD的发病率逐年上升，在2006年，全世界约有两千六百万AD病患，到2050年时估计全球每85人就有1人罹患该病。阿兹海默症患者临床表现为逐渐严重的认知障碍，对患者及家庭都会造成严重的影响。在发达国家中，阿兹海默症是社会中花费最高的疾病之一，而对于该病，现在仍没有较好的治疗方法。目前研究认为，阿兹海默症是由于<span lang=\"EN-US\" style=\"font-family:symbol;\">g</span>-secretase活性中心蛋白早老素（presenilin）发生突变，从而导致其对底物淀粉样前体蛋白（APP）的酶切位点发生改变，形成更容易在大脑中沉积的<span lang=\"EN-US\" style=\"font-family:symbol;\">b</span>淀粉样蛋白（A<span lang=\"EN-US\" style=\"font-family:symbol;\">b</span>）导致的。因此，对<span lang=\"EN-US\" style=\"font-family:symbol;\">g</span>-secretase活性中心蛋白早老素的晶体学研究，能够帮助人们更清楚地了解阿兹海默症的发病机理，进而为治愈阿兹海默症提供理论依据。</p><p>　　施一公教授领导的研究组一直以来将<span lang=\"EN-US\" style=\"font-family:symbol;\">g</span>-secretase及其同源蛋白的结构与功能作为主要研究方向。经过多年努力，他们今年获得了早老素在古细菌中同源蛋白PSH的结构。PSH与人源早老素蛋白有着高达50%的序列相似性，进化上高度保守。PSH蛋白三维晶体结构呈现出全新的“presenilin fold<span style=\"font-family:宋体;\">”</span>折叠方式。该蛋白由9个跨膜螺旋组成，穿膜螺旋1-6形成N端结构域（NTD），7-9形成C端结构域(CTD)；两个催化残基天冬氨酸（D162和D220）分别位于穿膜螺旋6和7上，并且包埋在膜内。通过结构分析，并且结合之前相关的生化研究结果，研究组提出了底物以及水分子进入PSH的通道模型。之后，研究组又基于序列的高度保守性，利用计算机同源建模，搭建了人源早老素蛋白的三维结构。根据该模型，进一步对引发阿兹海默症相关早老素突变残基进行了生化研究。</p><p> &nbsp; &nbsp; &nbsp; 这一研究是施一公教授继2006年和2007年在《自然－结构与分子生物学》（<em>Nature Structural &amp; Molecular Biology</em>）和《科学》（<em>Science</em>）分别发表Rhomboid和Site-2 protease两个家族的膜整合蛋白酶的晶体结构之后，对最后一个家族，天冬氨酸膜整合蛋白酶的重要结构生物学研究成果，推近了人们对阿兹海默症致病机理的认识和理解，也为之后基于晶体结构的药物设计和筛选打下了良好的基础。</p><p style=\"text-align:right;\">供稿：生命学院 &nbsp;编辑：范 丽</p><p><br /></p></div><div id=\"source1\" style=\"width:auto;height:auto;line-height:16px;list-style-type:none;font-size:14px;color:#434343;text-align:left;vertical-align:top;font-family:simsun;background-color:#ffffff;padding:0px;margin:10px 50px;\">（http://news.tsinghua.edu.cn）</div><p><br /></p>',0,'12月19日，清华大学生命科学学院教授施一公带领其研究组在《自然》杂志以研究长文（Research Article）的形式发表了题为《早老素家族天冬氨酸膜整合蛋白酶的结构》（Structure of a presenilin family intramembrane aspartate protease）的研究论文，首次报道了人的早老素蛋白（presenilin) 在古细菌Methanoculleus marisnigri JR1中同源蛋白PSH的晶体结构。','','清华施一公教授研究组在《自然》发表论文报道阿兹海默症相关蛋白晶体结构','2013-03-01 23:53:13',1,NULL,NULL),(8,'热能系',5,'<div id=\"datalist_detail\" style=\"width:auto;height:auto;text-align:left;line-height:21px;list-style-type:none;font-size:14px;color:#303030;font-family:simsun;background-color:#ffffff;padding:0px;margin:15px;\"><p><strong>清华新闻网3月1日电</strong> 2月23日，以清华大学为第一承担单位、清华大学热能系教授姚强为首席科学家的国家重点基础研究发展计划（973计划）项目“化石燃料燃烧排放PM2.5源头控制技术的基础研究”在清华大学召开启动会。</p><p>　　姚强介绍了项目总体情况，6位课题负责人做开题报告，分别就课题与项目总体目标和关键科学问题的关系、主要研究目标和内容、研究方案、年度计划、研究队伍和经费预算等内容进行汇报。</p><p style=\"text-align:center;\"><img height=\"283\" width=\"425\" src=\"/upload/1362153231455.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为启动会与会专家学者合影。</span></p><p>　　与会专家与项目组学术骨干进行了充分的讨论交流，对项目实施提出了期望和建设性的意见。</p><p>　　专家组一致肯定了项目立项启动的重要意义，同时指出该项目针对我国在能源环保领域的重大需求，意义重大；项目有深厚的研究基础、优越的研究条件，研究团队有延续性，科学问题明确，研究思路清晰，研究对象是公众热切关注的问题，希望项目能抓住机遇，在研究过程中及时提炼成果，为行政部门提供管理依据，为产业部门提供技术支持；同时希望项目能够加强科普宣传，引导公众正确认识PM2.5污染问题。</p><p>　　973项目顾问专家组、咨询专家组责任专家、科技部、教育部和清华大学科研院及热能工程系相关负责人、项目专家组成员、各课题负责人以及项目学术骨干等50余人参加了启动会。</p><p style=\"text-align:right;\">　　供稿：热能系 编辑：范 丽</p><p><br /></p><p><br /></p><p><br /></p></div><div id=\"source1\" style=\"width:auto;height:auto;line-height:16px;list-style-type:none;font-size:14px;color:#434343;text-align:left;vertical-align:top;font-family:simsun;background-color:#ffffff;padding:0px;margin:10px 50px;\">（http://news.tsinghua.edu.cn）</div><p><br /></p>',1,'2月23日，以清华大学为第一承担单位、清华大学热能系教授姚强为首席科学家的国家重点基础研究发展计划（973计划）项目“化石燃料燃烧排放PM2.5源头控制技术的基础研究”在清华大学召开启动会。','','“化石燃料燃烧排放PM2.5源头控制技术的基础研究”973计划项目启动会召开','2013-03-01 23:53:54',2,NULL,NULL),(9,'计算机系',4,'<div id=\"datalist_detail\" style=\"width:auto;height:auto;text-align:left;line-height:21px;list-style-type:none;font-size:14px;color:#303030;font-family:simsun;background-color:#ffffff;padding:0px;margin:15px;\"><p><strong>清华新闻网3月1日电 </strong>日前，在中国黄山举办的第19届多媒体建模（Multimedia Modeling）国际会议上，清华大学计算机系博士生刘少伟与教师崔鹏、朱文武、杨士强联合发表的论文《社会-视觉信息感知的图像搜索排序》（Social Visual Image Ranking for Web Image Search）获得大会唯一的“最佳论文奖”。</p><p>　　论文创造性地将社会媒体与图像搜索引擎技术相结合，有效地解决了目前图像搜索存在的“用户意图鸿沟”难题，并在社交网络与多媒体的融合性研究方面引领了新的方向。</p><p>　　多媒体建模国际会议是多媒体领域的主流会议。自1994年举办至今，受到国际学术界的广泛重视。</p><p style=\"text-align:right;\">供稿：计算机系 编辑：襄桦</p><p><br /></p></div><div id=\"source1\" style=\"width:auto;height:auto;line-height:16px;list-style-type:none;font-size:14px;color:#434343;text-align:left;vertical-align:top;font-family:simsun;background-color:#ffffff;padding:0px;margin:10px 50px;\">（http://news.tsinghua.edu.cn）</div><p><br /></p>',0,'','','计算机系师生在多媒体建模国际会议上获最佳论文奖 ','2013-03-01 23:54:28',2,NULL,NULL),(11,'欣 研',6,'<p>在这里编辑文章的内容</p>',1,'','http://news.tsinghua.edu.cn/publish/news/4205/2013/20130228090338389651770/20130228090338389651770_.html','清华大学召开全国“两会”代表委员座谈会','2013-03-01 23:55:41',2,NULL,NULL),(12,'图书馆',2,'<div id=\"datalist_detail\" style=\"width:auto;height:auto;text-align:left;line-height:21px;list-style-type:none;font-size:14px;color:#303030;font-family:simsun;background-color:#ffffff;padding:0px;margin:15px;\"><p><strong>清华新闻网2月27日电</strong> （通讯员<strong> 晏凌</strong>）<span style=\"color:#303030;font-family:simsun;font-size:14px;line-height:21px;text-align:left;background-color:#ffffff;\">2月25日上午，清华图书馆第7个专业分馆——金融图书馆开馆。</span></p><p>　　当日清晨，校图书馆馆长邓景康，总务部、系统部等几位老师一早就来到金融图书馆，查看开馆前的各项准备工作；工作人员也都早早到达岗位，准备好迎接读者。8点整，金融图书馆迎来了第一位读者，随后，读者们陆续进馆。</p><p style=\"text-align:center;\"><img width=\"425\" height=\"283\" src=\"/upload/1362153390113.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为金融图书馆迎来第一位读者。<strong>孟新民</strong> 摄</span></p><p>　　金融图书馆的前身是成立于1981年的人民银行研究生部图书馆（以下简称“人行图书馆”）。2011年11月7日召开的校图书馆馆务会决定：成立五道口金融学院图书馆接收工作小组（简称“筹备组”），筹备组于2012年3月与原人行图书馆进行了工作交接，全面负责开馆前的各项事宜。</p><p style=\"text-align:center;\"><img width=\"425\" height=\"283\" src=\"/upload/1362153390642.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为金融图书馆借还书工作台。<strong>孟新民</strong> 摄</span></p><p>　　金融图书馆馆藏以经济、金融类为主，总量约8万7千余册，包括：中文图书32299种（61758册），西文图书（含俄文）5084种（6646册），日文图书779种（894册），中文合订期刊810种（7265册），西文合订期刊147种（4028册），日文合订期刊12种（205册），五道口金融学院博士论文513册，五道口金融学院硕士论文5712册，每年订购纸本中外文报刊200种左右。另外，还藏有珍贵的国际金融组织资料（IMF、ADB、WB等）2万余件。</p><p style=\"text-align:center;\"><img width=\"425\" height=\"283\" src=\"/upload/1362153391178.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为金融图书馆。<strong>孟新民</strong> 摄</span></p><p>　　金融图书馆与经管图书馆、建筑图书馆、法律图书馆、人文社科图书馆、美术图书馆、医学图书馆一起共同构成清华大学的7个专业图书馆。金融图书馆隶属清华大学图书馆，其管理、文献资料、设备、人员以及运行经费等由校图书馆提供；馆舍由清华大学五道口金融学院提供。</p><p>　 &nbsp; 金融图书馆致力于金融学专业相关的文献资源建设和收藏，为清华金融学学科发展提供积极有力的文献保障和深度的学科服务。金融图书馆面向清华大学全校师生和金融学院校友开放，提供覆盖全馆的有线网络和无线网络，设置随手可得的电话咨询系统，布置随处可见的公共信息发布系统，配备足够数量的计算机和辅助设备。读者可以在金融图书馆获得所需要的全部图书馆服务和信息。</p><p style=\"text-align:right;\">供稿：图书馆 编辑：范 丽　　</p><p><br /></p><p><br /></p></div><div id=\"source1\" style=\"width:auto;height:auto;line-height:16px;list-style-type:none;font-size:14px;color:#434343;text-align:left;vertical-align:top;font-family:simsun;background-color:#ffffff;padding:0px;margin:10px 50px;\">（http://news.tsinghua.edu.cn）</div><p><br /></p>',0,'2月25日上午，清华图书馆第7个专业分馆——金融图书馆开馆。','','清华大学金融图书馆开馆','2013-03-01 23:56:42',3,NULL,NULL),(13,'范蠡',6,'<div id=\"datalist_detail\" style=\"width:auto;height:auto;text-align:left;line-height:21px;list-style-type:none;font-size:14px;color:#303030;font-family:simsun;background-color:#ffffff;padding:0px;margin:15px;\"><p><strong>清华新闻网2月26日电</strong>（记者 <strong>刘蔚如</strong>）2月21日起，清华大学正式启用专门设计的新式防伪成绩单，并将原成绩单办公室撤销并入注册中心，由注册中心统一为在校学生及校友提供一站式成绩单相关服务。</p><p>　　此前，清华在校学生和毕业校友因就业、出国等需要办理成绩单时，需由注册中心提供成绩单原件，再由成绩单办公室办理复印件。同时，原有的成绩单不是防伪的，与近年来国际上通行的防伪成绩单相比，技术手段较为落后。每年，都会有一些国内外机构要求向学校核实成绩单的真伪。</p><p style=\"text-align:center;\"><img width=\"425\" height=\"312\" src=\"/upload/1362153439160.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为清华大学新式的防伪成绩单。</span></p><p>　　据清华大学注册中心主任唐子龙介绍，新式的中、英文两种版本的防伪成绩单采用了防复印底纹、清华水印纸、版画防伪技术等多重防伪手段，极大地提高了成绩单伪造的难度和成本，同时也更加美观。其中，防复印底纹满版“隐藏”了“COPY”字样，正常情况下肉眼不可察觉，而一旦经过复印机的复印，“COPY”字样则会浮现出来。清华水印纸则是特别定制的防伪专用纸张，透光观察时，能看到纸张中蕴含的“清华大学”中文题字。防伪成绩单还运用了以清华大学标志性建筑二校门为图案生成的版画效果防伪元素，在增强防伪能力的同时增加了艺术观赏性。同时，在新式的防伪成绩单右下角，还有一串包含了学生成绩单信息等内容的密码符。</p><p>　　今后，在校学生在网上核查成绩单电子版无误后，可持经院系盖章的办理成绩单申请表到注册中心办理成绩单，立等可取。毕业生可持本人有效证件（身份证或护照）到注册中心办理成绩单。1994年以后入学的本科生或1998年以后入学的研究生办理成绩单立等可取，其余更早期的毕业生因历史原因没有电子版成绩数据，无法办理新式的防伪成绩单，注册中心将继续提供原有方式的成绩单办理。</p><p>　　据统计，清华每年为在校学生和毕业校友办理成绩单约达15万张，采用新的防伪成绩单和简化成绩单办理流程后，将为学生和校友提供更加便捷、优质的服务。</p><p style=\"text-align:right;\">　　编辑：范 丽</p><p><br /></p><p><br /></p></div><div id=\"source1\" style=\"width:auto;height:auto;line-height:16px;list-style-type:none;font-size:14px;color:#434343;text-align:left;vertical-align:top;font-family:simsun;background-color:#ffffff;padding:0px;margin:10px 50px;\">（http://news.tsinghua.edu.cn）</div><p><br /></p>',0,'撤并成绩单办公室 提供一站式服务','','清华大学启用新式防伪成绩单','2013-03-01 23:57:21',3,NULL,NULL),(14,'高原',1,'<div id=\"datalist_detail\" style=\"width:auto;height:auto;text-align:left;line-height:21px;list-style-type:none;font-size:14px;color:#303030;font-family:simsun;background-color:#ffffff;padding:0px;margin:15px;\"><p><strong>清华新闻网7月11日电</strong> （实习记者 <strong>高原</strong> 记者 <strong>程曦</strong>） 7月8日，中共中央政治局原常委、国务院原副总理李岚清来到清华大学视察指导工作。清华大学校长顾秉林、党委书记胡和平陪同视察。</p><p>　　李岚清首先来到清华大学校史馆，参观了清华大学发展史图片展。从建校初期那一张张珍贵的历史照片，到风雨如晦的战争时期清华师生百折不挠与国家民族人民同呼吸、共命运的历史资料，再到新中国成立后清华焕发出的崭新生命力……李岚清一边观看展览，一边听取介绍。在学校精心保存的由叶企孙批改的李政道满分考卷和杨振宁、李政道先生的学籍卡前，李岚清驻足细看，对清华完整地保存了这些珍贵历史档案表示赞赏。</p><p style=\"text-align:center;\"><img height=\"283\" width=\"425\" src=\"/upload/1362153487052.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为李岚清参观清华校史馆。记者 <strong>崔 凯</strong> 摄</span></p><p>　　对清华历史上的名师，李岚清非常熟悉，如数家珍。他特别回忆起清华老校长蒋南翔：“他是一名优秀的共产主义教育家，影响很深远。”参观中，李岚清充分肯定了清华大学百年来的办学成就，为国家、人民作出的突出贡献和建设世界一流大学取得的重要成绩，对清华大学百年校庆表示祝贺。</p><p style=\"text-align:center;\"><img height=\"283\" width=\"425\" src=\"/upload/1362153487586.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为李岚清参观清华校史馆。记者 <strong>崔 凯</strong> 摄</span></p><p>　　离开校史馆，李岚清来到美术学院参观。在美院教师造型艺术作品展上，李岚清饶有兴致地观赏着一幅幅美院教师的精美画作，不时点头称赞。从版画作品到传统水墨山水图，再到后现代艺术作品，他都流露出浓厚的兴趣。在纤维艺术实验室，李岚清仔细听取了林乐成教授对纤维艺术的介绍，这种将传统手工技术与现代生活方式、审美方式相融合的艺术形式深深地吸引了他。当得知美院师生的纤维艺术作品在海外多国展出获得很好反响时，李岚清点头称赞，并欣然在一把传统纸伞的伞面上写下自己的名字。</p><p style=\"text-align:center;\"><img height=\"283\" width=\"425\" src=\"/upload/1362153488054.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为李岚清与清华美院师生亲切交流。记者 <strong>崔 凯</strong> 摄</span></p><p>　　李岚清向正在实验室进行创作的美院学生亲切询问他们的学习情况，勉励他们以充沛的激情投身艺术事业。他还特别讲到由李政道与吴冠中先生倡导的艺术与科学国际作品展暨学术研讨会，希望清华进一步发挥综合性学科优势，继续为艺术与科学的融合作出贡献。</p><p style=\"text-align:center;\"><img height=\"283\" width=\"425\" src=\"/upload/1362153488584.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为李岚清参观美院师生作品。记者 <strong>崔 凯</strong> 摄</span></p><p>　　随后，李岚清与美院教师亲切座谈，畅谈艺术教育。他从自己自小对艺术的喜爱和退休后自学篆刻、素描的亲身经历出发，强调艺术家不应把自己关在象牙塔里，而是必须想办法让艺术走向大众，使老百姓看得懂、感兴趣，最终做到雅俗共赏。作为艺术教育工作者，尤其要努力培养青年人对艺术的兴趣和热爱。</p><p>　　座谈会上，李岚清向清华大学捐赠了他的篆刻作品集《大众篆刻——李岚清篆刻书法艺术作品集》，以及他手抄的108首来自自己家乡的诗词《诗情画意写镇江》。他在宣纸上素描出的美院老院长张仃先生的肖像，更是赢得了全场热烈的掌声。</p><p>　　科技部党组成员、纪检组长郭向远，校党委副书记史宗恺陪同视察。</p><p style=\"text-align:right;\">编辑：欣研</p><p><br /></p></div><div id=\"source1\" style=\"width:auto;height:auto;line-height:16px;list-style-type:none;font-size:14px;color:#434343;text-align:left;vertical-align:top;font-family:simsun;background-color:#ffffff;padding:0px;margin:10px 50px;\">（http://news.tsinghua.edu.cn）</div><p><br /></p>',1,'7月8日，中共中央政治局原常委、国务院原副总理李岚清来到清华大学视察指导工作。清华大学校长顾秉林、党委书记胡和平陪同视察。','','李岚清视察清华大学','2013-03-01 23:58:10',4,NULL,NULL),(17,'吴汉钊',1,'<div style=\"text-align:left;widows:2;text-transform:none;background-color:#ffffff;list-style-type:none;text-indent:0px;margin:15px;width:auto;letter-spacing:normal;font:14px/21px simsun;orphans:2;height:auto;color:#303030;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;padding:0px;\" id=\"datalist_detail\"><p style=\"text-align:center\"><span style=\"font-size:16px\"><strong>清华大学兼职教授聘任仪式同期举行</strong></span></p><p>　&nbsp;&nbsp;&nbsp;<span class=\"Apple-converted-space\"></span><strong>清华新闻网2月28日电</strong><span class=\"Apple-converted-space\"></span>2月26日下午，清华大学与解放军总医院“深化合作备忘录”签字仪式暨清华大学兼职教授聘任仪式在解放军总医院国际会议中心举行。清华大学校长陈吉宁、副校长姜胜耀，解放军总医院政委阮炳黎、院长李书章、副院长韩进等出席签字仪式。陈吉宁与李书章代表双方签署了深化合作备忘录。解放军总医院副院长高长青主持签字仪式。</p><p style=\"text-align:center\"><img src=\"/upload/1362239129147.jpg\" width=\"425\" height=\"283\" /></p><p style=\"text-align:center\"><span style=\"font-family:楷体, 楷体_gb2312\">图为陈吉宁与李书章代表双方签署深化合作备忘录。</span></p><p>　&nbsp;&nbsp;&nbsp;&nbsp;根据备忘录，清华大学与解放军总医院将建立双方合作的长效机制。共同筹建国家转化医学中心；在人才培养、学科建设、师资交流、培训协作等领域开展深化合作，以达到优势互补、资源共享，推进科研成果向临床应用的转化；双方将建立学术年会制度，旨在搭建双方信息交流的平台，展示最新成果，了解双方需求以推进深入合作。</p><p style=\"text-align:center\"><img src=\"/upload/1362239129921.jpg\" width=\"425\" height=\"283\" /></p><p style=\"text-align:center\"><span style=\"font-family:楷体, 楷体_gb2312\">图为陈吉宁致辞。</span></p><p>　&nbsp;&nbsp;&nbsp;&nbsp;陈吉宁在致辞中回顾了清华大学与解放军总医院自2000年以来的合作历史，感谢解放军总医院为清华大学医学生培养和附属医院的建设，以及为知名学者的医疗保健提供的大力支持和帮助。他表示，在全球新一轮的科技革命和产业变革中，生命科学和医学被认为是最活跃、最有希望孕育突破性成果的学科。生命科学与医学和生物技术的开发互为一体，已成为新时期高新技术产业的重要支柱。以人类重大健康问题为导向，充分发挥多学科交叉融合优势，建设高水平的生命科学和医学学科，是国家现代化建设的重大战略需要，也是清华大学新百年发展的必为之举。希望以《合作备忘录》的签署为新的起点，双方本着实干、创新、共赢的精神，通过全方位、深层次的合作，实现优势互补、共同提高，谱写双方合作发展的新篇章，共同为我国医学事业的发展做出更大的贡献。</p><p style=\"text-align:center\"><img src=\"/upload/1362239130494.jpg\" width=\"425\" height=\"283\" /></p><p style=\"text-align:center\"><span style=\"font-family:楷体, 楷体_gb2312\">图为阮炳黎致辞。</span></p><p>　&nbsp;&nbsp;&nbsp;&nbsp;阮炳黎表示，清华大学是享有盛誉的高等学府，希望解放军总医院充分学习和借鉴清华大学优良的教学体系、先进的科研理念、良好的教学设施、雄厚的师资力量以及富有特色的校园文化不断提高医院的发展质量和水平。阮炳黎指出，希望通过双方的共同努力，把此次的深化合作打造成教育、科技和医疗卫生事业发展的战略工程，打造成军民融合的共建工程和实现互利共赢的示范工程，为实现强国梦、强军梦作出更大的贡献。</p><p style=\"text-align:center\"><img src=\"/upload/1362239130934.jpg\" width=\"425\" height=\"283\" /></p><p style=\"text-align:center\"><span style=\"font-family:楷体, 楷体_gb2312\">图为解放军总医院—清华大学2012年度学术年会现场。</span></p><p>　&nbsp;&nbsp;&nbsp;&nbsp;签字仪式后，清华大学医学中心主任、医学院副院长吴清玉宣读了清华大学聘任兼职教授的决定。姜胜耀为全军烧伤研究所所长柴家科教授、全军肝胆外科研究所所长董家鸿教授、解放军肾脏病研究所所长陈香美院士等30名兼职教授颁发了聘书。</p><p>　&nbsp;&nbsp;&nbsp;&nbsp;聘任仪式后，解放军总医院—清华大学2012年度学术年会召开。</p><p>　&nbsp;&nbsp;&nbsp;&nbsp;高长青，柴家科，全军中医研究所所长杨明会教授，董家鸿，陈香美，全军创伤修复重点实验室主任付小兵院士，清华大学医学院程京院士、常智杰教授，清华大学航天航空学院航空宇航系主任李路明9位知名专家在疾病治疗、科技研发、大型科研项目申报及团队建设、医学转化等领域作了专题报告。</p><p>　&nbsp;&nbsp;&nbsp;&nbsp;来自解放军总医院，清华大学医学中心、清华大学第一附属医院、第二附属医院、北京清华医院等单位的专家、医师300余人参加了签字仪式及学术年会，学术年会由解放军总医院主办，陈香美和付小兵共同主持。</p><p style=\"text-align:right\">　供稿：医学中心&nbsp;&nbsp;编辑：范&nbsp;丽</p><p>&nbsp;</p><p>&nbsp;</p></div><div style=\"text-align:left;widows:2;text-transform:none;background-color:#ffffff;list-style-type:none;text-indent:0px;margin:10px 50px;width:auto;letter-spacing:normal;font:14px/16px simsun;orphans:2;height:auto;color:#434343;vertical-align:top;word-spacing:0px;-webkit-text-size-adjust:auto;-webkit-text-stroke-width:0px;padding:0px;\" id=\"source1\">（http://news.tsinghua.edu.cn）</div><p>&nbsp;</p>',1,'2月26日下午，清华大学与解放军总医院“深化合作备忘录”签字仪式暨清华大学兼职教授聘任仪式在解放军总医院国际会议中心举行。清华大学校长陈吉宁、副校长姜胜耀，解放军总医院政委阮炳黎、院长李书章、副院长韩进等出席签字仪式。陈吉宁与李书章代表双方签署了深化合作备忘录。解放军总医院副院长高长青主持签字仪式。','','清华大学与解放军总医院签署“深化合作备忘录”','2013-03-02 23:45:33',5,NULL,NULL),(18,'范 丽',2,'<div id=\"datalist_detail\" style=\"width:auto;height:auto;text-align:left;line-height:21px;list-style-type:none;font-size:14px;color:#303030;font-family:simsun;background-color:#ffffff;padding:0px;margin:15px;\"><p><strong>清华新闻网2月25日电</strong> 2月23至24日，马克思主义学院召开学科建设专题研讨会，校党委副书记、马克思主义学院党委书记邓卫主持会议，学院常务副院长艾四林做主题发言。</p><p>　　邓卫在讲话中表示，在不久前结束的全国第三轮一级学科评估中，清华大学马克思主义理论学科首次参评并取得本学科第二名的成绩。马克思主义学院取得的这一成绩是学校高度重视并大力支持马克思主义理论学科发展的结果，是我校几代马克思主义理论学者长期积累的成果，也是学院成立5年来全体教师齐心协力共同奋斗努力的结果。邓卫希望全体老师通过本次评估，在总结本学科发展优势基础上，充分认识到目前存在的不足，并提出了马克思主义学院下一步学科建设的目标。</p><p>　　艾四林详细介绍了清华马克思主义理论一级学科参加教育部第三轮学科评估的情况，并对比全国马克思主义理论学科整体情况，深入分析了本学科在各项评估指标体系中的特色、优势和不足。</p><p>　　在分组讨论中，学院教师们纷纷围绕队伍建设、科学研究和人才培养等方面，对如何进一步推进马克思主义理论学科建设积极建言献策。</p><p style=\"text-align:right;\">　　　　供稿：马克思主义学院 &nbsp;编辑：范 丽</p><p><br /></p><p><br /></p></div><div id=\"source1\" style=\"width:auto;height:auto;line-height:16px;list-style-type:none;font-size:14px;color:#434343;text-align:left;vertical-align:top;font-family:simsun;background-color:#ffffff;padding:0px;margin:10px 50px;\">（http://news.tsinghua.edu.cn）</div><p><br /></p>',1,'2月23至24日，马克思主义学院召开学科建设专题研讨会，校党委副书记、马克思主义学院党委书记邓卫主持会议，学院常务副院长艾四林做主题发言。','','马克思主义学院召开学科建设研讨会','2013-03-03 21:58:02',8,NULL,NULL),(19,'孔令环',1,'<div id=\"datalist_detail\" style=\"width:auto;height:auto;text-align:left;line-height:21px;list-style-type:none;font-size:14px;color:#303030;font-family:simsun;background-color:#ffffff;padding:0px;margin:15px;\"><p>吴宓不仅是一位著名的学者，而且还写得一手好旧体诗。在他学诗的道路上，有四位良师诤友对他诗艺的日益精进起着十分重要的作用。</p><p>　　对吴宓诗歌创作影响最大的是陈伯澜，陈伯澜是吴宓的姑丈，有《审安斋诗集》，崇尚唐诗，尤尊杜甫。康有为赞其诗曰：“伯澜诗之雄健学少陵，绵丽学玉溪，而神似遗山，遇合亦同之。”吴宓也说：“姑丈为诗，取法盛唐，直学工部，参以玉溪。生平雅不喜宋诗，晚年偶为之，仍不类。”吴宓十几岁时开始从陈伯澜学诗，深受姑丈影响，崇唐诗，不喜宋诗：“宓夙不喜江西派之宋诗”，“步曾主宋诗，身隶江西派。而予则尚唐诗，去取另有标准，异乎步曾。”其一生酷爱杜诗，作诗多借鉴杜甫，也与陈伯澜的教诲有直接关系。吴宓早期诗歌直白无隐，缺乏余味，陈伯澜力纠其弊。</p><p>　　1914年6月27日的吴宓日记记载其写了一首诗让陈伯澜评阅，曰：“思想甚发达，然诗则幼稚。宜以多读为是。”又曰：“诗以多注则始佳，贵含蓄而忌直说。”吴宓虽然当时由于年龄关系，并不服气，在日记中发牢骚：“嗟乎，余之诗，意在发抒情感，非以诗学诗也。”但也承认：“余学疏力短，正犯此病。……后当更力勉之。”后来随着学识渐长，阅历渐丰，对于用典更服膺于陈，说：“于是经义史事，遂与我今时今地之事实感情，融合为一，然后入之辞藻，见于诗章。是故典故之来，由于情志之自然，非待掇拾寻扯，故典不累诗而有裨补于诗。”陈伯澜点评吴宓诗歌，一贯从严。如吴宓早期诗作《秋夜吟》，词藻华美，意境凄丽，似仿《红楼梦》中林黛玉的《秋窗风雨夕》，颇费了一番心思，陈伯澜评云：“语多辛酸，殊非所宜。”又谓其为无病呻吟。兜头一盆凉水，泼醒了吴宓，吴宓以后的诗作幼稚有之，不合诗律有之，却都出自真性情，不再有这类矫揉造作之作了。对于整体尚不错的诗作，陈伯澜也尽量指出其不足：“作者古体，直摅胸臆，无格格不吐之弊。但下笔太轻易，即不免浮冗空滑。须敛才就范，勿但贪多好胜。”对于写得非常出色的也不吝于赞美之词，如评吴宓的《石鼓歌》曰：“此首当为古体诸作之冠。”</p><p>　　饶麓樵于吴宓有更多鼓励之词。如评其《论诗绝句》云：“清炼工腴，情韵不匮。加以深造，定当树帜骚坛。”评《喜雪》云：“胸襟气息，自尔不凡。”这些鼓励对于青年吴宓而言，弥足珍贵，增强了他在学诗道路上勇攀高峰的信心。饶麓樵也不时指出吴宓诗歌的不足之处，如评《清华园词》：“规模壮阔，步骤井然。但造句炼字微嫌未合，想系急就之故。”他还多次提醒吴宓要细心揣摩前人诗歌的优长之处，加以学习。评《九月九日》一诗曰：“杜公善用拗，放翁学之，尚能得其仿佛。君诗好用拗，宜细味此二家。再君之诗多倔强语，宜学涪翁也。”对吴宓诗集总评时说：“选诗中如颜谢，唐人诗如杜陵，可多读，益当深造有得。”</p><p>　　吴芳吉是吴宓的同学，与吴宓并称“两吴生”。吴宓自谦自己的诗歌不如吴芳吉。吴芳吉总是直言不讳地指出吴宓诗歌的弊病，在《读雨僧诗稿答书》中说：“如‘未能入世先遗世，岂必触机始悟机’与子美‘戎马不如归马逸，千家今有百家存’、‘桃花细逐杨花落，黄鸟时兼百鸟飞’之句相似。但此类句法，最易生涩，不可取。又如子美《咏鸡》‘纪德命标五，初鸣度必三’之句，故意强合，皆宜弃之”，“引用典故，宜含浑自如，不可牵强。《甲寅杂诗》三十首中，典故最多。如‘兔死鸟飞剩只鸿’、‘俗薄公输羞智巧’、‘人以亲疏为去取，党分洛蜀自惊猜’诸句，皆不免牵强凑成。如‘胡骑惊传飞海峤，汉廷竟议弃珠崖’。此类经营，斯上上矣。玉溪昌谷之诗，最喜用典，其隐僻不可探测，不似子美明贵。玉溪辈若以引典为作诗原料，子美仅以之点缀而已。”吴宓后来诗歌学杜能取其神而遗其貌，得吴芳吉之助。</p><p>　　陈寅恪与吴宓是挚友，他们贯穿一生的深厚友情被传为文坛佳话。吴宓对陈寅恪的学问十分佩服，以师视之：“陈君中西学问皆甚渊博，又识力精到，议论透彻，宓倾佩至极。古人‘闻君一夕话，胜读十年书’信非虚语。”陈寅恪曾说：在中国近世诗人中，最佩爱郑苏堪之诗，以其意思明显，句句可译成英文也。吴宓深记在心，后来“多读各家之诗，以真挚明显（即清切）为标准，乃深是寅恪此言”。吴宓一生作诗以真挚明显为准则，正是源于陈寅恪的指点。陈寅恪认为吴宓诗歌多性情而少理趣，在深度上有所欠缺，虽然知道吴宓厌恶宋诗，仍多次提醒吴宓要多读书以固本，吸取宋诗之长：“欲作诗，则非多读不可，凭空杂凑，殊非所宜”，“大概作诗能免滑字最难。若欲矫此病，宋人诗不可不留意。因宋人学唐，与吾人学昔人诗，均同一经验，故有可取法之处。”多年的交往使陈寅恪对吴宓有深沉的同情与理解，吴宓的《忏情诗》，最为人所诟病，有的说格调不高，有的说难以达诂，陈寅恪则说：“直抒胸臆，自成一家。自忏，即所以自解，正不必别求解人也。”可谓知己之论。陈对于诗歌最看重真性情，评《清华园即事》云：“理想不高而感情真挚，固为可取。”</p><p>　　师不在多，在于识见高远且善于教诲；友不在多，在于知心并敢于指责其失，吴宓能拥有这样几位良师诤友，实为大幸也。</p><p><span style=\"font-family:楷体, 楷体_gb2312;\"><span style=\"font-size:15px;\"></span>　吴宓（1894—1978），陕西省泾阳县人。字雨僧、玉衡，笔名余生，中国现代著名西洋文学家、国学大师、诗人。清华大学国学院创办人之一，学贯中西，融通古今，被称为中国比较文学之父，与陈寅恪、汤用彤并称“哈佛三杰”。著作有《吴宓诗集》、《文学与人生》、《吴宓日记》等。</span></p><p><span style=\"font-family:楷体, 楷体_gb2312;\">　　来源：中国社会科学报 2013年2月26日</span></p><p><span style=\"font-family:楷体, 楷体_gb2312;\"><span style=\"font-size:15px;\"></span></span></p><p><br /></p></div><div id=\"source1\" style=\"width:auto;height:auto;line-height:16px;list-style-type:none;font-size:14px;color:#434343;text-align:left;vertical-align:top;font-family:simsun;background-color:#ffffff;padding:0px;margin:10px 50px;\">（http://news.tsinghua.edu.cn）</div><p><br /></p>',0,'吴宓不仅是一位著名的学者，而且还写得一手好旧体诗。在他学诗的道路上，有四位良师诤友对他诗艺的日益精进起着十分重要的作用。','','吴宓的四位良师诤友','2013-03-03 21:58:43',8,NULL,NULL),(20,'解红岩',1,'<div id=\"datalist_detail\" style=\"width:auto;height:auto;text-align:left;line-height:21px;list-style-type:none;font-size:14px;color:#303030;font-family:simsun;background-color:#ffffff;padding:0px;margin:15px;\"><p><strong>清华新闻网</strong><strong>6</strong><strong>月</strong><strong>28</strong><strong>日西安电</strong> （通讯员 <strong>解红岩</strong>）6月25日上午，“西安清华校友庆祝母校百年华诞大会”在西安建筑科技大学举行。来自西安各行各业的300余位校友齐聚一堂，共同庆祝清华母校百年的辉煌。清华大学校务委员会副主任岑章志一行专程赶来和校友们共同庆祝母校百岁生日。清华校友、陕西省技术监督局局长伍西居（1978化工）学长宣读了顾秉林校长的校庆贺词。</p><p style=\"text-align:center;\"><img width=\"425\" height=\"283\" src=\"/upload/1362319162542.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为大会会场。通讯员 <strong>解红岩 </strong>摄</span></p><p>　　西安建筑科技大学党委副书记田东平首先致辞，他代表学校3万名师生向清华百年华诞表示热烈的祝贺。西安市常务副市长岳华峰在讲话中感谢清华人在西安的经济发展中所作出的重要贡献，他表示，西安市政府将拓展与清华的合作，同时欢迎更多的清华毕业生来西安建功立业。</p><p style=\"text-align:center;\"><img width=\"340\" height=\"321\" src=\"/upload/1362319162880.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为校务委员会副主任岑章志讲话。通讯员 <strong>解红岩 </strong>摄</span></p><p>　　岑章志向与会校友介绍了百年校庆的主要活动，使校友们深受鼓舞。他说，中央对清华新百年的发展提出了新的要求，任务会更加艰巨，更具挑战性。因此需要广大校友更多的支持与关心，帮助母校早日实现建设世界一流大学的宏伟目标。</p><p>　　西安校友会会长王俊仁（1966无线电）在讲话中感谢母校清华大学、西安市政府以及西安建筑科技大学对本次会议的大力支持。他简要介绍多年来清华校友对陕西省、西安市经济、社会发展所作的贡献，以建筑设计大师张锦秋学长为代表，清华人为母校赢得了荣誉。王俊仁学长介绍，西安校友中有28人出席了清华百年庆典，百余人返校参加了各种校庆活动。</p><p style=\"text-align:center;\"><img width=\"425\" height=\"283\" src=\"/upload/1362319163159.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为岑章志接受绳顺民学长为祝贺母校百年校庆撰写的书法作品“百年清华，校运昌隆”。通讯员 <strong>解红岩 </strong>摄</span></p><p>　　会上还举行了西安校友向母校赠送书法作品仪式，岑章志副主任接受了绳顺民学长（1974水利）为祝贺母校百年校庆撰写的书法作品“百年清华，校运昌隆”。</p><p>　　毕业60周年的电机系1951届老学长钱家骧介绍了回母校参加校庆活动，与同学朱镕基学长相聚的场面，受到与会校友热烈欢迎。年轻校友安小毅（2005法学）介绍了自己6年前回西安工作以来的发展和心理历程。</p><div></div><div align=\"right\">供稿：校友总会 编辑：襄 桦</div><div></div><p><br /></p><p><br /></p></div><div id=\"source1\" style=\"width:auto;height:auto;line-height:16px;list-style-type:none;font-size:14px;color:#434343;text-align:left;vertical-align:top;font-family:simsun;background-color:#ffffff;padding:0px;margin:10px 50px;\">（http://news.tsinghua.edu.cn）</div><p><br /></p>',0,'6月25日上午，“西安清华校友庆祝母校百年华诞大会”在西安建筑科技大学举行。来自西安各行各业的300余位校友齐聚一堂，共同庆祝清华母校百年的辉煌。清华大学校务委员会副主任岑章志一行专程赶来和校友们共同庆祝母校百岁生日。清华校友、陕西省技术监督局局长伍西居（1978化工）学长宣读了顾秉林校长的校庆贺词。','','西安校友隆重庆祝母校百年华诞','2013-03-03 21:59:24',7,NULL,NULL),(21,'新华网',3,'<div id=\"datalist_detail\" style=\"width:auto;height:auto;text-align:left;line-height:21px;list-style-type:none;font-size:14px;color:#303030;font-family:simsun;background-color:#ffffff;padding:0px;margin:15px;\"><p>周大福慈善基金28日在港宣布，捐款人民币1亿元予清华大学法学院，成立“清华大学郑裕彤法学发展基金”，支持清华大学法学院建设世界一流的教师队伍，培养高素质法律人才。</p><p>　　“清华大学郑裕彤法学发展基金”签约仪式28日在香港会议展览中心举行，周大福慈善基金名誉理事长郑家纯在签约仪式上表示，法治是社会繁荣与稳定的基石，要令社会得以平衡发展，法治和法学教育尤为重要。</p><p>　　郑家纯说，面对国家对高端法律人才需求殷切，而清华大学对国家法治建设和优秀法律人才培养已经取得成果，周大福慈善基金本次捐款成立此发展基金，旨在支持清华大学法学院建设世界一流的教师队伍，培养国家急需的高质素的法律人才。</p><p>　　当日活动中，清华大学法学院与香港大学法律学院还举行了合作交流备忘录签字仪式。合作计划包括学生和教师交流、合作研究、在职培训、资源共享等，清华法学院学生也有更多机会来香港学习交流，增强对普通法的认识了解。</p><p>　　郑家纯表示，香港大学法律学院和清华大学法学院已存在长期良好合作关系；此次合办“香港大学法律学院与清华大学法学院合作交流”项目，更有助于推动国家法治发展及培养内地精英法律人才，为国家的繁荣发展作出贡献。</p><p><br /></p></div><div id=\"source1\" style=\"width:auto;height:auto;line-height:16px;list-style-type:none;font-size:14px;color:#434343;text-align:left;vertical-align:top;font-family:simsun;background-color:#ffffff;padding:0px;margin:10px 50px;\">（http://news.tsinghua.edu.cn）</div><p><br /></p>',1,'','','周大福慈善基金捐赠人民币1亿元予清华大学法学院','2013-03-03 21:59:55',7,NULL,NULL),(22,'张 玲',3,'<div id=\"datalist_detail\" style=\"width:auto;height:auto;text-align:left;line-height:21px;list-style-type:none;font-size:14px;color:#303030;font-family:simsun;background-color:#ffffff;padding:0px;margin:15px;\"><p style=\"text-align:center;\"><strong><span style=\"font-family:楷体, 楷体_gb2312;\"><img height=\"283\" width=\"425\" src=\"/upload/1362319236986.jpg\" /></span></strong></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为陈熹近照。</span></p><p><span style=\"font-family:楷体, 楷体_gb2312;\">陈熹，女，山东潍坊人，清华大学环境学院2006级本科生，2010级硕士生，师从长江学者、清华环境学院黄霞教授，研究方向为微生物脱盐电池技术。自研究生入学以来，已在《环境科学与技术》（<em>Environmental Science &amp; Technology</em>），《生物资源技术》（<em>Bioresource Technology</em>）等国际权威期刊发表第一作者论文2篇。荣获陶氏化学可持续发展创新奖（<em>The Dow Sustainability Innovation Student Challenge Award</em>）一等奖，清华大学综合一等奖学金、科技创新一等奖学金等，清华大学优秀学生干部、优秀志愿者及百年校庆突出贡献个人等称号，首都高校秋季田径运动会冠军2项，清华大学马杯运动会各类冠军共23项。2012年获得清华大学特等奖学金。</span></p><p>　　作为今年的特等奖学金获得者，陈熹略显羞涩，“受宠若惊”与“向师兄师姐学习”是她说得最多的几句话。性格开朗的她热爱体育活动，热爱与人交流，但讲起话来却自有一种沉稳成熟的风格。她说，她是用一件件平凡的事情，去书写略带惊喜的青春。</p><p style=\"text-align:center;\"><strong>赛场重拾拼搏梦</strong></p><p>　　在小学低年级的时候，陈熹曾是一名以100米与200米短跑为主项的半专业小运动员。</p><p>　　“我坐在电视机前收看体育节目时，总是盼望着有一天自己也能站上领奖台，为国争光。”她微笑着说。</p><p>　　然而，儿时怀揣梦想的她却被突如其来的伤病遏住了脚步。由于脚踝骨折造成的关节活动范围受限，她的专业运动员梦想破灭了。但令她没有想到的是，中断了多年的运动梦想，竟然得以在清华园的跑道上重圆。本科时，她受师兄师姐的鼓励，抱着试一试的心态加入了环境学院的女篮队和田径队，经过短时间的恢复训练，很快一跃成为比赛中的明星队员，屡屡夺冠。</p><p>　　“这种感觉十分神奇，我曾经以为自己再也不能在运动场上奔跑了，我很失落，不敢再尝试。然而，这么多年后，重新走上赛场，我却发现自己并没有失去拼搏的能力，身体也没有想象中那样软弱无力，”她说，“清华园的跑道让我找回了信心，也让我明白，不论困难和失败多么来势汹汹，只要再试一次，总有机会走向成功。”</p><p>　　从那以后，陈熹就再也没有放弃在体育赛场上的拼搏。从本科入学至今，她连续6年蝉联马杯三项全能和4×100接力冠军，分别带领环境学院女篮与女足队登上全校总冠军的奖台。在研究生阶段，她的运动成绩进一步提高，在首都高校秋季田径运动动会上最终摘得女子跳高与4×100接力的双料冠军，为清华挣足了光。她获得的马杯冠军已有23个之多，怪不得有人戏称她为“环境学院体育女超人”。而最为难能可贵的是，参加比赛，她从不考虑个人得失，经常需要在集体项目足球、篮球、羽毛球与个人田径项目等比赛间来回穿梭，有时她强忍伤病咬牙坚持，但只要是为了集体而战，她从来没有说过一个“不”字。</p><p style=\"text-align:center;\"><strong>沉醉科研 痛并快乐着</strong></p><p>　　在运动场上找到自信的她，带着强烈的好奇心进入了科研领域。她从大三开始了实验室生活，学习基本的实验操作，逐渐了解了研究的魅力。</p><p>　　她是一个大胆求教，敢于犯错的学生，常常把师兄师姐缠得头疼，又经常凭自己的新点子和好数据获得称赞。她连连获得“挑战杯”课外科创竞赛、能源动力设计大赛和环境友好科技竞赛一等奖等荣誉，又在毕业设计中获得清华大学优秀本科毕业论文的称号。受到这些成绩的鼓舞，她在研究生学习期间再接再厉，一年级时即以第一作者身份在环境工程领域最权威的期刊<strong><em>Environmental Science &amp; Technology</em></strong>上发表论文，成为环境学院第一个以硕士生身份实现这一目标的学生。她积极参与国际会议并发表学术报告，对专业领域建立起了较为系统深入的了解。她沉醉于科研，常驻实验室而放弃假期休息，为的只是能尽早得到实验结果，更严谨地探究真相。迄今她已发表高水平SCI论文2篇，国际会议论文1篇，尚有1篇SCI论文在投，科研成果较为扎实。</p><p>　　说起做科研工作的心情，她这样讲：“实验室是一个既给我痛苦又给我惊喜的地方，当我做预实验10个月都不能成功的时候，我的心情真的糟糕透了，然而当我突然之间解决了问题，并且获得了几个对比组间非常清晰的关系时，我睁开眼睛看到的全是微笑的鲜花。这些丰富的感受只有沉浸在科研中才能找到。” &nbsp;</p><p>　　于她而言，科研与体育比赛很相似，未知问题间错综复杂的联系就像是体育赛场上的金牌，而艰苦的思索与繁重的实验工作就是体育赛场上漫长的赛程，当她带着既兴奋又疲惫的心情，跨越众多障碍，最终抓住规律掌握新知时，就像在赛场上冲过终点时那样快乐与欣慰。她说，只有受得住艰苦，不吝啬付出，才有资格盼望成功。</p><p>　　目前，陈熹已经申请在环境学院继续攻读博士学位。谈起日后的打算，她这样说：“我的导师黄老师跟我说，‘清华博士生的科研水平就代表着清华的科研水平，你要明白博士的责任。’所以我想，我日后的科研工作一定是更为艰苦，却更有意义的。对真理最朴实的向往，对过程最正直的追求，以及对结果最客观的态度，或许是促成科研成果的要素吧。我希望能够不辱清华学子之名，用自己的科研成果去造福世人。”</p><p style=\"text-align:center;\"><strong>奉献社工 回报母校</strong></p><p>　　陈熹一直认为，自己这辈年轻人吃苦太少，每每想到前辈的埋头奉献，都让她“自觉惭愧”。她本着为周围同学排忧解难的初衷，本科阶段就参与了学院的学生工作中，为大家的学习生活贡献自己的力量。</p><p>　　从研一时起，陈熹开始担任环境学院“双肩挑”辅导员的工作。先是在新生军训期间临危受命，协助完成大一年级的带班工作，又在2011年清华迎来百年校庆的特殊时期承担起环境学院团委书记一职，把全院上下的学生工作安排得井然有序。之后她开始担任“因材施教”计划辅导员的工作，用自己的成长经历影响和带动学生，帮助计划内的数名同学联系国际交流，让大家获得了许多扩展视野的机会。</p><p>　　“这些社会工作对我来讲算是对母校和学院的初步回报吧，”她说，“希望日后能为母校做更多的事情。但是感恩是不能等、不能靠的，我在清华生活了这么多年，清华给了我太多，我必须随时随地以实际行动去回报，多做一点算一点，日积月累，一定可以给周围人带去温暖和力量。”</p><p>　　陈熹谈起社会工作的话题显得很满足，她表示，担任辅导员是一件责任重大的事情，她要为每一名学生负责，引导他们学会独立解决问题，也希望能更多的学生拥有更坚强的意志，拥有奉献精神。</p><p style=\"text-align:center;\"><strong>梦想尚在远方 迫不及待继续前行</strong></p><p>　　陈熹表示，她的为人处世态度深受自己的导师黄霞教授的影响。早在进入课题组之初，黄老师就对她提出了一个要求，那就是“如果要做一件事情，那就力所能及做到最好。”这句话现如今成了她的座右铭。正是凭着这样的决心与毅力，她才能够在科研、体育与社会工作中都取得如今的成绩，成为一个全面发展的学生，并在学院的师生中享有广泛赞誉。</p><p>　　她对自己的期望是：成长为一个博大且厚重的清华人，能够“不轻言放弃”、“淡泊名利”、“心怀感恩”并“敢于承担”。</p><p>　　她说：“获得今天的荣誉我很荣幸，不过明天的生活不会因此而变化，因为我的梦想尚在远方，我迫不及待地继续前行。”</p><p style=\"text-align:right;\">　　供稿：环境学院 编辑：范 丽</p><p><br /></p><p><br /></p></div><div id=\"source1\" style=\"width:auto;height:auto;line-height:16px;list-style-type:none;font-size:14px;color:#434343;text-align:left;vertical-align:top;font-family:simsun;background-color:#ffffff;padding:0px;margin:10px 50px;\">（http://news.tsinghua.edu.cn）</div><p><br /></p>',1,'访2012年清华大学特等奖学金获得者陈熹','','我的梦想尚在远方 我迫不及待地继续前行','2013-03-03 22:00:40',4,NULL,NULL),(23,'吕厦敏',4,'<p>在这里编辑文章的内容</p>',1,'1月21日上午，第十六届量子信息处理国际会议（Quantum Information Processing 2013, QIP2013）在清华大学召开。来自中国、美国、瑞士等多国的300余位学者参加此次为期5天的会议。会议由清华大学交叉信息院主办，清华大学原校长、高等研究院院长顾秉林院士出席开幕式，清华大学交叉信息研究院院长、大会主席姚期智院士致开幕辞。清华大学交叉信息研究院副教授、QIP2013组织委员会主席Giulio Chiribella主持开幕式。\r\n','http://news.tsinghua.edu.cn/publish/news/4209/2013/20130123173420888538055/20130123173420888538055_.html','清华大学交叉信息院主办第十六届量子信息处理国际会议','2013-03-03 22:01:16',4,NULL,NULL),(24,'李 含',1,'<div id=\"datalist_detail\" style=\"width:auto;height:auto;text-align:left;line-height:21px;list-style-type:none;font-size:14px;color:#303030;font-family:simsun;background-color:#ffffff;padding:0px;margin:15px;\"><p><strong>清华新闻网1月7日电</strong> （记者 <strong>李 含</strong>）1月4日，韩国高等教育财团（KFAS）事务总长朴仁国先生访问清华大学，校长陈吉宁会见了朴仁国先生一行。</p><p style=\"text-align:center;\"><img height=\"283\" width=\"425\" src=\"/upload/1362319438630.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为陈校长与朴仁国先生（左）进行会谈。记者<strong> 苑洁</strong> 摄</span></p><p>　　在会谈中，陈吉宁对朴仁国先生再次到访表示欢迎，并介绍了清华在学科发展、英文课程设置、科研和国际交流合作等领域的最新发展。朴仁国先生介绍了韩国高等教育财团支持亚洲高校建立“亚洲研究中心”的合作情况。双方就学生国际培养和大学发展问题交换了意见，并表示，希望在未来进一步加强合作，推动学术研究发展和中韩两国年轻学子的学术文化交流。</p><p style=\"text-align:center;\"><img height=\"283\" width=\"425\" src=\"/upload/1362319439044.jpg\" /></p><p style=\"text-align:center;\"><span style=\"font-family:楷体, 楷体_gb2312;\">图为会谈现场。记者 <strong>苑洁</strong> 摄</span></p><p>　　清华大学亚洲研究中心、国际处相关负责人参加了会谈。</p><p>　　韩国高等教育财团(The Korea Foundation for Advanced Studies) 成立于1974年，是由韩国教育部许可并登记注册的非营利性公益法人，宗旨是通过自主和培养人才，促进学术发展。清华大学亚洲研究中心是根据清华大学与韩国高等教育财团的合作协议于2002年12月成立的学术研究机构，致力于支持清华大学教师、研究人员以及研究机构的学术研究和学术交流，为亚洲学术发展和增进相互理解以及共同繁荣做出贡献。中心成立近10年来获得韩国高等教育财团的持续支持。</p><p style=\"text-align:right;\"> 编辑：襄桦</p><p><br /></p></div><div id=\"source1\" style=\"width:auto;height:auto;line-height:16px;list-style-type:none;font-size:14px;color:#434343;text-align:left;vertical-align:top;font-family:simsun;background-color:#ffffff;padding:0px;margin:10px 50px;\">（http://news.tsinghua.edu.cn）</div><p><br /></p>',0,'1月4日，韩国高等教育财团（KFAS）事务总长朴仁国先生访问清华大学，校长陈吉宁会见了朴仁国先生一行。','','韩国高等教育财团事务总长访问清华','2013-03-03 22:04:00',6,NULL,NULL);
/*!40000 ALTER TABLE `t_new` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `lastloginip` varchar(20) DEFAULT NULL,
  `lastlogintime` datetime DEFAULT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `password` varchar(64) DEFAULT NULL,
  `username` varchar(32) DEFAULT NULL,
  `auth_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FKCB63CCB6766A4E4A` (`auth_ID`),
  KEY `usernameIndex` (`username`),
  CONSTRAINT `FKCB63CCB6766A4E4A` FOREIGN KEY (`auth_ID`) REFERENCES `t_auth` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,NULL,'2013-03-15 10:52:38','bob.lin','c93169f1eb9be7246f99690b5e66b2d','bob',1),(2,NULL,'2013-04-15 00:49:01','林盎然','54497198b6b1f33e890e1f9742bb34','lar',2),(3,NULL,'2013-03-02 17:06:48','测试','98f6bcd4621d373cade4e832627b4f6','test',3),(5,NULL,'2013-03-12 17:26:59','校团委','c4ca4238a0b92382dcc509a6f75849b','1',5),(6,NULL,'2013-03-03 15:47:26','室外审批员之很长的用户昵称','c81e728d9d4c2f636f67f89cc14862c','2',6),(7,NULL,'2013-03-04 20:24:58','3','eccbc87e4b5ce2fe28308fd9f2a7baf3','3',7),(8,NULL,NULL,'校团委社团协会部','2d2d2c251a5aee47fe2d048e9581','admin1',8),(9,NULL,NULL,'建筑[本]','d46ae2a89a8b204353359217cba9c595','admin2',9),(10,NULL,NULL,'土木[本]','145cacaa253a1df3f7de1ace562313b0','admin3',10),(11,NULL,NULL,'水利[本]','98342ee519753e173145ffb123b63','admin4',11),(12,NULL,NULL,'环境学院[本]','72e14c185656778f1ff79c7562c065','admin5',12),(13,NULL,NULL,'机械[本]','cf79ea318380ec8da7287aa151d231e','admin6',13),(14,NULL,NULL,'精仪[本]','23b7af69f1c8c5b6c9be351ed9be7d','admin7',14),(15,NULL,NULL,'热能[本]','882c2c84e3b4194afd4caf2de3e4f97','admin8',15),(16,NULL,NULL,'汽车[本]','2c783093c8b1cf79afa24312585869d','admin9',16),(17,NULL,NULL,'校团委社团协会部','f41fe731c866fc7d6be3aa38f6b0b3','admin10',17),(18,NULL,NULL,'建筑[本]','e32fa4ac8d356a95e968364ce50154f','admin11',18),(19,NULL,NULL,'土木[本]','14fdb79a9cb2853b4bbd32b843e4e12f','admin12',19),(20,NULL,NULL,'水利[本]','4d78761932a61a78bbfeff66eeea8f1d','admin13',20),(21,NULL,NULL,'环境学院[本]','3b52c6a81cc2425ec3b9d2ff7c52bc','admin14',21),(22,NULL,NULL,'机械[本]','64ad17329dc91fa687debb8b9c32da8','admin15',22),(23,NULL,NULL,'精仪[本]','772c1524c35683375b178894b836327','admin16',23),(24,NULL,NULL,'热能[本]','6e43b089a5788659a4bad1d0df61a559','admin17',24),(25,NULL,NULL,'汽车[本]','8376f8890a3684f262e5b35077be56','admin18',25),(26,NULL,NULL,'工业工程[本]','d8745dfef79fba671eb445e38fc4647a','admin19',26),(27,NULL,NULL,'电机[本]','b7157946b424928608d7cef14e2a98f','admin20',27),(28,NULL,NULL,'电子[本]','c2af726e5d33b4c04f337b841195edf','admin21',28),(29,NULL,NULL,'计算机[本]','4dfc35f28fff245f62d5e62e47f8b','admin22',29),(30,NULL,NULL,'自动化[本]','d1f8ac7d5ec318a67092d855a8271ba9','admin23',30),(31,NULL,NULL,'工物[本]','8986c73b8e6dcb6c14c9e3d6f02b24c1','admin24',31),(32,NULL,NULL,'航院[本]','5f5bd3cebaa83e5b189f0acfd6588c','admin25',32),(33,NULL,NULL,'化工[本]','d146918c6d4c3f192a8f79c7311b9e2b','admin26',33),(34,NULL,NULL,'材料[本]','1786f49245d75ab7c3a8e784e217e79','admin27',34),(35,NULL,NULL,'数学[本]','262341dc8a8a43d883b2b66472f7d0','admin28',35),(36,NULL,NULL,'物理[本]','ada7876b17a55d31c3647e3957977e57','admin29',36),(37,NULL,NULL,'化学[本]','b4f61e4c30bc6557d94030138355b3b4','admin30',37),(38,NULL,NULL,'生命学院[本]','467928561853168bb371afdb1fb6ef4f','admin31',38),(39,NULL,NULL,'经管[本]','e7f1a22224216afd61755624874a69','admin32',39),(40,NULL,NULL,'人文社科[本]','f728e42547fec09ec4136ae84a2d6939','admin33',40),(41,NULL,NULL,'法学[本]','f5e622d7e975950dfb1f9542c80af3d','admin34',41),(42,NULL,NULL,'美院[本]','59df9abc8a34deeb7fedc5a7723f95','admin35',42),(43,NULL,NULL,'医学院[本]','92d9f81ff8e95f141c4296d0dffb70fa','admin36',43),(44,NULL,NULL,'软件[本]','a887f51aaf620ec981767f950d9d65e','admin37',44),(45,NULL,NULL,'新闻[本]','e97135834ef1fc8a52dd4b436631126','admin38',45),(46,NULL,NULL,'微电子所[本]','1b9e3510bfe21537c0f116a925ad1012','admin39',46),(47,NULL,NULL,'建筑[研]','b88057e6710167df0d845822ac7abb5','admin40',47),(48,NULL,NULL,'土木[研]','fd6cb372f812b56aa74d6b1be86772','admin41',48),(49,NULL,NULL,'水利[研]','7d991076d27c41ddbd509ef6d7bc534c','admin42',49),(50,NULL,NULL,'环境学院[研]','47f58d5aa7afd1aa4e0fde45c1f5a51','admin43',50),(51,NULL,NULL,'机械[研]','8982addae6c51b9f2699c309770d426','admin44',51),(52,NULL,NULL,'精仪[研]','5817d0b3516df8ddd797496034eeff1a','admin45',52),(53,NULL,NULL,'热能[研]','8615d0ca73efacad6c215cb7e1237a1','admin46',53),(54,NULL,NULL,'汽车[研]','3591d0663fd2b1e63cac75838b7a4e1f','admin47',54),(55,NULL,NULL,'电机[研]','e810d28cffa989c455a5b43895d2e5','admin48',55),(56,NULL,NULL,'电子[研]','2290807cc0b8e08ef75b7122e3d24967','admin49',56),(57,NULL,NULL,'计算机[研]','eec81e45e71434ed1a538fc1be81ee','admin50',57),(58,NULL,NULL,'自动化[研]','f3d596f51ad8a51b78e5aab02ebcf7c4','admin51',58),(59,NULL,NULL,'工物[研]','7c9ab0d3eaeefd23cdf1211f062d4db','admin52',59),(60,NULL,NULL,'航院[研]','838717b82edce8c9a11ed53cbb69f416','admin53',60),(61,NULL,NULL,'化工[研]','85b55ad469cc78c716f30d0951ca663','admin54',61),(62,NULL,NULL,'材料[研]','f35144fb372fbe9ffef433bcdab1854','admin55',62),(63,NULL,NULL,'数学[研]','6595a1beec9cf1d3e8734c32d5e391a','admin56',63),(64,NULL,NULL,'物理[研]','d53b1b6d7580c16ae9f60b49563251','admin57',64),(65,NULL,NULL,'化学[研]','9dd026cd48332b36aac85bbf95ab713','admin58',65),(66,NULL,NULL,'生命学院[研]','98f0acf5921026b97b602b8b76348ef','admin59',66),(67,NULL,NULL,'经管[研]','9d98252593df5046e5981750d6fc39bf','admin60',67),(68,NULL,NULL,'公管[研]','ec83c8135c88fd54e03b3f5e1fb088','admin61',68),(69,NULL,NULL,'人文社科[研]','261ea219bc7f39c68b6ef2fafbfc2fa','admin62',69),(70,NULL,NULL,'法学[研]','b820d6b44933b23b85dc4c679a442318','admin63',70),(71,NULL,NULL,'美院[研]','d06215f46d85db9349a85165d5f969b','admin64',71),(72,NULL,NULL,'核研院[研]','bc8692c8eb1f7369bb5b9e62fd2f351b','admin65',72),(73,NULL,NULL,'微电子所[研]','be2c467cd3ab87fd91d2930b839ebb6','admin66',73),(74,NULL,NULL,'工业工程[研]','723dd98e817ae0a199d77c9191ed29','admin67',74),(75,NULL,NULL,'医学院[研]','b197a9a74bee16c3e0e5bb35249d62','admin68',75),(76,NULL,NULL,'软件[研]','c04253c7b21146aca5635a6d23b7f3e','admin69',76),(77,NULL,NULL,'新闻[研]','23dcdb66a67c0635fd672ccbdc761','admin70',77),(78,NULL,NULL,'马院[研]','2b73599b7c29b16fa5ba3bd05392b3','admin71',78),(79,NULL,NULL,'教研院[研]','83c97d756ff2d05baa7148be88d7551a','admin72',79),(80,NULL,NULL,'交叉信息学院[研]','3b8778470ae41f821898a2bbbb753','admin73',80),(81,NULL,NULL,'地学中心[研]','218eaecfb68c33a480319df15477d7b2','admin74',81),(82,NULL,NULL,'金融学院[研]','6fa9a92a967f96e8d4dbf1a2ac738d8f','admin75',82),(83,NULL,NULL,'高等研究院[研]','3b73a24a83ad57fe17836e8c48a39c6f','admin76',83),(84,NULL,NULL,'校团委组织部','186d4ebc4854625b2c73e1e4c3c818c','admin77',84),(85,NULL,NULL,'校团委宣传部','b5e0fd5392d63a1b9c4f47d59a6117','admin78',85),(86,NULL,NULL,'校团委实践部','a61c3f5a74702f3896a119a11ce1e712','admin79',86),(87,NULL,NULL,'校团委文体部','bfa21ddbae71b3555ea04697528ba10','admin80',87),(88,NULL,NULL,'校团委素质拓展中心','f15c8347757171f8868bf35c833cbbe','admin81',88),(89,NULL,NULL,'校团委科技创新中心','432788e5823a3516a7f2caceda1b99cd','admin82',89),(90,NULL,NULL,'校团委成才信息中心','8bd2e3c521842520a25cb1b3aa69ec','admin83',90),(91,NULL,NULL,'校团委青年工作研究中心','194bc199739b66e4c286f6170186fff','admin84',91),(95,NULL,'2013-03-12 17:46:08','测试用户0','c4ca4238a0b92382dcc509a6f75849b','test0',200),(96,NULL,NULL,'校团委志愿服务中心','f6ed67c2a66241d953be2f19c41aee75','admin85',201),(97,NULL,NULL,'校团委创业指导中心','711bc1f999c4fd53ecfa81e615215','admin86',202),(98,NULL,NULL,'校学生会','4295dcf4ca34de3f35badb59aa10a9','admin87',203),(99,NULL,NULL,'代表队','7c6bfa6111f010b61d9b528ae44ab9','admin88',204),(100,NULL,NULL,'艺术团','dd4d42a0b2e640ffa030564fd1e8d0d6','admin89',205),(101,NULL,NULL,'研团研会','285af0ac42fb68d7d92e0619f4b1e6d','admin90',206),(102,NULL,NULL,'校团委','909e5f7dc59a6d41d755c8396eda9698','admin91',207),(103,NULL,NULL,'电子屏审批','427f01824aa3c1924cd12efcef2dd32','admin92',208),(104,NULL,NULL,'室外活动审批','41ac98c5b7dfe2c65f57e11b4fd210','admin93',209),(105,NULL,NULL,'展板审批','7998b0844bf99d1414cdbb524ac35b','admin94',210),(106,NULL,NULL,'注册中心','4ac44d235def4ee2f4aab93874747ec','admin95',211),(107,NULL,NULL,'物业中心','059e9c5904838197673aab6d26d4062','admin96',212),(108,NULL,NULL,'C楼','1a74793ef1f458d09f8f22ff0c85952','admin97',213);
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-22 13:28:28
