-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: mysql    Database: freight
-- ------------------------------------------------------
-- Server version	9.0.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `freight_contract`
--

DROP TABLE IF EXISTS `freight_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freight_contract` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `logistics_id` bigint NOT NULL,
  `secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creator_id` bigint DEFAULT NULL,
  `creator_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modifier_id` bigint DEFAULT NULL,
  `modifier_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT NULL,
  `invalid` tinyint NOT NULL DEFAULT '0',
  `priority` int NOT NULL DEFAULT '1000',
  `account` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `begin_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `end_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `warehouse_id` int NOT NULL DEFAULT '0',
  `quota` int DEFAULT NULL,
  `shop_id` bigint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freight_contract`
--

LOCK TABLES `freight_contract` WRITE;
/*!40000 ALTER TABLE `freight_contract` DISABLE KEYS */;
INSERT INTO `freight_contract` VALUES (31,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,3,'1111','2022-12-02 13:57:43','2034-12-02 10:34:03',25,NULL,16),(32,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,3,'1111','2022-12-02 13:57:43','2034-12-02 10:34:03',24,NULL,15),(33,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,3,'1111','2022-12-02 13:57:43','2034-12-02 10:34:03',21,NULL,13),(34,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,3,'1111','2022-12-02 13:57:43','2034-12-02 10:34:03',20,NULL,12),(35,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,3,'1111','2022-12-02 13:57:43','2034-12-02 10:34:03',19,NULL,11),(36,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,3,'1111','2022-12-02 13:57:43','2034-12-02 10:34:03',18,NULL,29),(37,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,3,'1111','2022-12-02 13:57:43','2034-12-02 10:34:03',16,NULL,27),(38,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,3,'1111','2022-12-02 13:57:43','2034-12-02 10:34:03',14,NULL,5),(39,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,3,'1111','2022-12-02 13:57:43','2034-12-02 10:34:03',12,NULL,24),(40,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,3,'1111','2022-12-02 13:57:43','2034-12-02 10:34:03',10,NULL,21),(41,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,3,'1111','2022-12-02 13:57:43','2034-12-02 10:34:03',1,NULL,1),(42,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,113,'2222','2022-12-02 13:57:43','2034-12-02 10:34:03',25,NULL,16),(43,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,113,'2222','2022-12-02 13:57:43','2034-12-02 10:34:03',24,NULL,15),(44,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,113,'2222','2022-12-02 13:57:43','2034-12-02 10:34:03',21,NULL,13),(45,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,113,'2222','2022-12-02 13:57:43','2034-12-02 10:34:03',20,NULL,12),(46,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,113,'2222','2022-12-02 13:57:43','2034-12-02 10:34:03',19,NULL,11),(47,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,113,'2222','2022-12-02 13:57:43','2034-12-02 10:34:03',18,NULL,29),(48,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,113,'2222','2022-12-02 13:57:43','2034-12-02 10:34:03',16,NULL,27),(49,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,113,'2222','2022-12-02 13:57:43','2034-12-02 10:34:03',14,NULL,5),(50,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,113,'2222','2022-12-02 13:57:43','2034-12-02 10:34:03',12,NULL,24),(51,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,113,'2222','2022-12-02 13:57:43','2034-12-02 10:34:03',10,NULL,21),(52,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,0,113,'2222','2022-12-02 13:57:43','2034-12-02 10:34:03',1,NULL,1),(53,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,1,2,'33333','2022-12-02 13:57:43','2034-12-02 10:34:03',25,NULL,16),(54,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,1,2,'33333','2022-12-02 13:57:43','2034-12-02 10:34:03',24,NULL,15),(55,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,1,2,'33333','2022-12-02 13:57:43','2034-12-02 10:34:03',21,NULL,13),(56,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,1,2,'33333','2022-12-02 13:57:43','2034-12-02 10:34:03',20,NULL,12),(57,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,1,2,'33333','2022-12-02 13:57:43','2034-12-02 10:34:03',19,NULL,11),(58,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,1,2,'33333','2022-12-02 13:57:43','2034-12-02 10:34:03',18,NULL,29),(59,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,1,2,'33333','2022-12-02 13:57:43','2034-12-02 10:34:03',16,NULL,27),(60,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,1,2,'33333','2022-12-02 13:57:43','2034-12-02 10:34:03',14,NULL,5),(61,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,1,2,'33333','2022-12-02 13:57:43','2034-12-02 10:34:03',12,NULL,24),(62,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,1,2,'33333','2022-12-02 13:57:43','2034-12-02 10:34:03',10,NULL,21),(63,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:32:34',NULL,1,2,'33333','2022-12-02 13:57:43','2034-12-02 10:34:03',1,NULL,1),(64,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:09',NULL,0,3,'444444','2022-12-02 13:57:58','2034-12-02 10:34:03',17,NULL,28),(65,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:09',NULL,0,3,'444444','2022-12-02 13:57:58','2034-12-02 10:34:03',15,NULL,26),(66,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:09',NULL,0,3,'444444','2022-12-02 13:57:58','2034-12-02 10:34:03',13,NULL,22),(67,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:09',NULL,0,3,'444444','2022-12-02 13:57:58','2034-12-02 10:34:03',2,NULL,2),(68,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:09',NULL,0,5,'555555','2022-12-02 13:57:58','2034-12-02 10:34:03',17,NULL,28),(69,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:09',NULL,0,5,'555555','2022-12-02 13:57:58','2034-12-02 10:34:03',15,NULL,26),(70,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:09',NULL,0,5,'555555','2022-12-02 13:57:58','2034-12-02 10:34:03',13,NULL,22),(71,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:09',NULL,0,5,'555555','2022-12-02 13:57:58','2034-12-02 10:34:03',2,NULL,2),(72,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:16',NULL,0,3,'666666','2022-12-02 13:58:09','2034-12-02 10:34:03',23,NULL,14),(73,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:16',NULL,0,3,'666666','2022-12-02 13:58:09','2034-12-02 10:34:03',9,NULL,23),(74,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:16',NULL,0,3,'666666','2022-12-02 13:58:09','2034-12-02 10:34:03',3,NULL,3),(75,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:33:16',NULL,0,4,'77777','2022-12-02 13:58:09','2034-12-02 10:34:03',23,NULL,14),(76,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:33:16',NULL,0,4,'77777','2022-12-02 13:58:09','2034-12-02 10:34:03',9,NULL,23),(77,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:33:16',NULL,0,4,'77777','2022-12-02 13:58:09','2034-12-02 10:34:03',3,NULL,3),(78,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:16',NULL,0,5,'88888','2022-12-02 13:58:09','2034-12-02 10:34:03',23,NULL,14),(79,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:16',NULL,0,5,'88888','2022-12-02 13:58:09','2034-12-02 10:34:03',9,NULL,23),(80,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:16',NULL,0,5,'88888','2022-12-02 13:58:09','2034-12-02 10:34:03',3,NULL,3),(81,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:22',NULL,0,3,'99999','2022-12-02 13:58:16','2034-12-02 10:34:03',4,NULL,4),(82,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:33:22',NULL,0,4,'00000','2022-12-02 13:58:16','2034-12-02 10:34:03',4,NULL,4),(83,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:22',NULL,0,5,'122222','2022-12-02 13:58:16','2034-12-02 10:34:03',4,NULL,4),(84,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:28',NULL,0,3,'33333','2022-12-02 13:58:22','2034-12-02 10:34:03',5,NULL,25),(85,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:33:28',NULL,0,4,'44','2022-12-02 13:58:22','2034-12-02 10:34:03',5,NULL,25),(86,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:28',NULL,0,123,'erwerw','2022-12-02 13:58:22','2034-12-02 10:34:03',5,NULL,25),(87,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:34',NULL,1,3,'2222','2022-12-02 13:58:29','2034-12-02 10:34:03',6,NULL,6),(88,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:33:34',NULL,0,4,'fdsdfsdf','2022-12-02 13:58:29','2034-12-02 10:34:03',6,NULL,6),(89,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:34',NULL,0,3,'dsgadfgsdfg','2022-12-02 13:58:29','2034-12-02 10:34:03',6,NULL,6),(90,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:40',NULL,0,35,'qweqweSFsad','2022-12-02 13:58:37','2034-12-02 10:34:03',7,NULL,7),(91,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:33:40',NULL,0,44,'dfgdsfnghgfh','2022-12-02 13:58:37','2034-12-02 10:34:03',7,NULL,7),(92,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:40',NULL,0,5,'dsfgsgdg','2022-12-02 13:58:37','2034-12-02 10:34:03',7,NULL,7),(93,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:46',NULL,0,23,'etrwertfgsfdb','2022-12-02 13:58:43','2034-12-02 10:34:03',8,NULL,8),(94,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:33:46',NULL,0,4,'zcxbgreert','2022-12-02 13:58:43','2034-12-02 10:34:03',8,NULL,8),(95,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:46',NULL,1,10,'23wq5rwefsw','2022-12-02 13:58:43','2034-12-02 10:34:03',8,NULL,8),(96,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:52',NULL,0,3,'sdfwetwret','2022-12-02 13:58:50','2034-12-02 10:34:03',11,NULL,9),(97,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:33:52',NULL,0,4,'shyery','2022-12-02 13:58:50','2034-12-02 10:34:03',11,NULL,9),(98,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:52',NULL,0,5,'afhddfsh','2022-12-02 13:58:50','2034-12-02 10:34:03',11,NULL,9),(99,1,'secret1',1,'admin',NULL,NULL,'2022-12-02 11:33:57',NULL,0,5,'werWEGFDS','2022-12-02 13:58:56','2034-12-02 10:34:03',22,NULL,10),(100,2,'secret2',1,'admin',NULL,NULL,'2022-12-02 11:33:57',NULL,0,4,'DFAHAET','2022-12-02 13:58:56','2034-12-02 10:34:03',22,NULL,10),(101,3,'secret3',1,'admin',NULL,NULL,'2022-12-02 11:33:57',NULL,0,22,'AWERWAERAR','2022-12-02 13:58:56','2034-12-02 10:34:03',22,NULL,10);
/*!40000 ALTER TABLE `freight_contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freight_logistics`
--

DROP TABLE IF EXISTS `freight_logistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freight_logistics` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creator_id` bigint DEFAULT NULL,
  `creator_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modifier_id` bigint DEFAULT NULL,
  `modifier_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT NULL,
  `sn_pattern` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `secret` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `logistics_class` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `app_account` varchar(128) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freight_logistics`
--

LOCK TABLES `freight_logistics` WRITE;
/*!40000 ALTER TABLE `freight_logistics` DISABLE KEYS */;
INSERT INTO `freight_logistics` VALUES (1,'顺丰快递','SF1001',1,'admin',NULL,NULL,'2022-12-02 18:59:35',NULL,'^SF[A-Za-z0-9-]{4,35}$','sadfsdf','sFAdaptor','sadfsfsdf'),(2,'中通快递','ZTO0002',1,'admin',NULL,NULL,'2022-12-02 19:07:09',NULL,'^ZTO[0-9]{12}$','asfwERWER','zTOAdaptor','fdagdfgsafgafsdf'),(3,'极兔速递','JT11122',1,'admin',NULL,NULL,'2022-12-02 19:09:32',NULL,'^JT[0-9]{13}$','SDAGSDGWER','jTAdaptor','sadtwetrwrewer');
/*!40000 ALTER TABLE `freight_logistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freight_undeliverable`
--

DROP TABLE IF EXISTS `freight_undeliverable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freight_undeliverable` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `region_id` bigint NOT NULL,
  `begin_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `creator_id` bigint DEFAULT NULL,
  `creator_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modifier_id` bigint DEFAULT NULL,
  `modifier_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT NULL,
  `logistics_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freight_undeliverable`
--

LOCK TABLES `freight_undeliverable` WRITE;
/*!40000 ALTER TABLE `freight_undeliverable` DISABLE KEYS */;
INSERT INTO `freight_undeliverable` VALUES (1,483250,'2022-12-02 22:28:43','2023-12-02 22:28:49',1,'admin',NULL,NULL,'2022-12-02 14:29:21',NULL,1);
/*!40000 ALTER TABLE `freight_undeliverable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freight_warehouse`
--

DROP TABLE IF EXISTS `freight_warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freight_warehouse` (
  `address` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `shop_id` bigint NOT NULL,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `sender_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `creator_id` bigint DEFAULT NULL,
  `creator_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modifier_id` bigint DEFAULT NULL,
  `modifier_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT NULL,
  `region_id` bigint NOT NULL,
  `sender_mobile` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `invalid` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freight_warehouse`
--

LOCK TABLES `freight_warehouse` WRITE;
/*!40000 ALTER TABLE `freight_warehouse` DISABLE KEYS */;
INSERT INTO `freight_warehouse` VALUES ('北京,朝阳,东坝,朝阳新城第二曙光路14号',1,1,'朝阳新城第二仓库','阮杰',1,'admin',NULL,NULL,'2022-12-02 11:55:26',NULL,1043,'139542562579',0),('北京,朝阳,黑庄户,黑庄户曙光路14号',2,2,'黑庄户仓库','刘雨堡',1,'admin',NULL,NULL,'2022-12-02 11:56:07',NULL,1068,'139630558019',0),('北京,丰台,长辛店,朱家坟西山坡曙光路14号',3,3,'朱家坟西山坡仓库','隋问',1,'admin',NULL,NULL,'2022-12-02 11:56:39',NULL,1362,'139206174517',0),('北京,朝阳,小红门,牌坊曙光路14号',4,4,'牌坊仓库','张三',1,'admin',NULL,NULL,'2022-12-02 11:56:41',NULL,797,'139266427223',0),('北京,丰台,方庄,芳城园一区曙光路14号',5,25,'芳城园一区仓库','张三',1,'admin',NULL,NULL,'2022-12-02 11:56:41',NULL,1396,'139144166588',0),('北京,西城,天桥,香厂路曙光路14号',6,6,'香厂路仓库','张三',1,'admin',NULL,NULL,'2022-12-02 11:56:42',NULL,374,'139282650380',0),('天津,静海,唐官屯,长张屯曙光路14号',7,7,'长张屯仓库','张三',1,'admin',NULL,NULL,'2022-12-02 11:57:23',NULL,11881,'139936103327',0),('北京,房山,长阳,水碾屯一曙光路14号',8,8,'水碾屯一仓库','张三',1,'admin',NULL,NULL,'2022-12-02 11:58:19',NULL,3048,'13937159674',0),('内蒙古,包头,固阳,兴顺西,佘太和村委曙光路14号',9,23,'佘太和村委仓库','下官云',1,'admin',NULL,NULL,'2022-12-02 11:58:51',NULL,101672,'139251493531',0),('湖北,潜江,渔洋,苏湖林场曙光路14号',10,21,'苏湖林场仓库','钱峰',1,'admin',NULL,NULL,'2022-12-02 11:59:51',NULL,450826,'13948733198',0),('河北,张家口,康保,康保,道北村曙光路14号',11,9,'道北村仓库','张三',1,'admin',NULL,NULL,'2022-12-02 12:00:06',NULL,46047,'139429301542',0),('广东,梅州,兴宁,大坪,吴田曙光路14号',12,24,'吴田仓库','邹宇',1,'admin',NULL,NULL,'2022-12-02 12:00:16',NULL,501765,'139464827803',0),('浙江,温州,苍南,灵溪,徐溪曙光路14号',13,22,'徐溪仓库','汪天',1,'admin',NULL,NULL,'2022-12-02 12:00:23',NULL,200397,'139703721355',0),('浙江,湖州,吴兴,飞英,墙壕里曙光路14号',14,5,'墙壕里仓库','钱王',1,'admin',NULL,NULL,'2022-12-02 12:00:40',NULL,205140,'139844014684',0),('山东,东营,东营,龙居,大张曙光路14号',15,26,'大张仓库','刘玉',1,'admin',NULL,NULL,'2022-12-02 12:00:47',NULL,304646,'13942544704',0),('河南,商丘,宁陵,阳驿,汤林王曙光路14号',16,27,'汤林王仓库','刘曼娜',1,'admin',NULL,NULL,'2022-12-02 12:01:15',NULL,405443,'139891799202',0),('内蒙古,通辽,科尔沁,庆和,五家子曙光路14号',17,28,'五家子仓库','吴国强',1,'admin',NULL,NULL,'2022-12-02 12:01:24',NULL,104859,'139979882074',0),('内蒙古,锡林郭勒,正蓝旗,桑根达来,塔安图嘎查村曙光路14号',18,29,'塔安图嘎查村仓库','王天然',1,'admin',NULL,NULL,'2022-12-02 12:01:47',NULL,114759,'139465529695',0),('辽宁,营口,老边,柳树,西柳曙光路14号',19,11,'西柳仓库','邹强',1,'admin',NULL,NULL,'2022-12-02 12:01:52',NULL,125484,'139801990328',0),('吉林,长春,榆树,太安,发展曙光路14号',20,12,'发展仓库','刘宏',1,'admin',NULL,NULL,'2022-12-02 12:01:57',NULL,134975,'139323756249',0),('湖北,荆门,钟祥,双河,石龙曙光路14号',21,13,'石龙仓库','赵四',1,'admin',NULL,NULL,'2022-12-02 12:02:02',NULL,434154,'139410853107',0),('河北,保定,涿州,林家屯,小庄村曙光路14号',22,10,'小庄村仓库','张三',1,'admin',NULL,NULL,'2022-12-02 12:02:10',NULL,43810,'139268281627',0),('河北,沧州,盐山,边务,东王庄曙光路14号',23,14,'东王庄仓库','张三',1,'admin',NULL,NULL,'2022-12-02 12:02:15',NULL,54099,'139155752960',0),('福建,漳州,漳浦,官浔,康庄曙光路14号',24,15,'康庄仓库','王五',1,'admin',NULL,NULL,'2022-12-02 12:04:47',NULL,254544,'13996693776',0),('山东,聊城,东阿,新城,西王集曙光路14号',25,16,'西王集仓库','张三',1,'admin',NULL,NULL,'2022-12-02 12:04:58',NULL,353427,'13933202143',0),('北京,东城,安定门,花园,安定北路14号',26,30,'花园仓库','小玉',1,'admin',NULL,NULL,'2020-12-01 00:00:00',NULL,43,'17331111111',0);
/*!40000 ALTER TABLE `freight_warehouse` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `freight_warehouse_region`
--

DROP TABLE IF EXISTS `freight_warehouse_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `freight_warehouse_region` (
  `warehouse_id` bigint NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `region_id` bigint NOT NULL,
  `begin_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `creator_id` bigint DEFAULT NULL,
  `creator_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `modifier_id` bigint DEFAULT NULL,
  `modifier_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `freight_warehouse_region`
--

LOCK TABLES `freight_warehouse_region` WRITE;
/*!40000 ALTER TABLE `freight_warehouse_region` DISABLE KEYS */;
INSERT INTO `freight_warehouse_region` VALUES (1,1,1,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,NULL,NULL,NULL,'2022-12-02 14:20:05',NULL),(2,2,1,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(3,3,1,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(4,4,1,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(5,5,1,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(6,6,1,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(7,7,7362,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(8,8,1,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(9,9,99537,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(10,10,420824,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(11,11,13267,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(12,12,483250,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(13,13,191019,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(14,14,191019,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(15,15,285860,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(16,16,367395,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(17,17,99537,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(18,18,99537,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(19,19,115224,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(20,20,133208,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(21,21,420824,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(22,22,13267,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(23,23,13267,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(24,24,244377,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(25,25,285860,'2022-12-02 14:20:05','2023-04-02 14:20:05',1,'admin',NULL,NULL,'2022-12-02 14:20:05',NULL),(24,32,483250,'2022-12-02 22:25:49','2023-12-02 22:25:52',1,'admin',NULL,NULL,'2022-12-02 14:26:54',NULL);
/*!40000 ALTER TABLE `freight_warehouse_region` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-21 12:01:49
