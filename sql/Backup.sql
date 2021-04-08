-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: task
-- ------------------------------------------------------
-- Server version	5.5.5-10.3.9-MariaDB

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no1` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no2` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_client_name_index` (`client_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `device` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `address2` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zip` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `device_name_index` (`name`),
  KEY `device_alias_index` (`alias`),
  KEY `device_city_index` (`city`),
  KEY `device_client_id_foreign` (`client_id`),
  CONSTRAINT `device_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emails`
--

DROP TABLE IF EXISTS `emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emails` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emails_email_index` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emails`
--

LOCK TABLES `emails` WRITE;
/*!40000 ALTER TABLE `emails` DISABLE KEYS */;
INSERT INTO `emails` VALUES (1,'Anna','harutyunarevyan@mail.ru',NULL,NULL),(2,'test','arevyan246@gmail.com',NULL,NULL),(3,'test2','ssurani@mvixusa.com',NULL,NULL);
/*!40000 ALTER TABLE `emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emailtemps`
--

DROP TABLE IF EXISTS `emailtemps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emailtemps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_tamps` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emailtemps`
--

LOCK TABLES `emailtemps` WRITE;
/*!40000 ALTER TABLE `emailtemps` DISABLE KEYS */;
INSERT INTO `emailtemps` VALUES (1,'Temp_1',NULL,NULL);
/*!40000 ALTER TABLE `emailtemps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feature`
--

DROP TABLE IF EXISTS `feature`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `feature` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `feature_name_index` (`name`),
  KEY `feature_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feature`
--

LOCK TABLES `feature` WRITE;
/*!40000 ALTER TABLE `feature` DISABLE KEYS */;
/*!40000 ALTER TABLE `feature` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `frome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `job` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `tamp` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logjobs`
--

DROP TABLE IF EXISTS `logjobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logjobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logjobs`
--

LOCK TABLES `logjobs` WRITE;
/*!40000 ALTER TABLE `logjobs` DISABLE KEYS */;
INSERT INTO `logjobs` VALUES (1,'anna@gmail.com','anna@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"harut\",\"job\":\"and\",\"sentto\":\"anna@gmail.com\",\"sentfrom\":\"anna@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"arevyan\",\"job\":\"and\",\"sentto\":\"anna@gmail.com\",\"sentfrom\":\"anna@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"contains\",\"value\":\"harutyun\",\"job\":\"and\",\"sentto\":\"anna@gmail.com\",\"sentfrom\":\"anna@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 04:50:44','2021-04-06 04:50:44'),(2,'anna@gmail.com','anna@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"harut\",\"job\":\"and\",\"sentto\":\"anna@gmail.com\",\"sentfrom\":\"anna@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"arevyan\",\"job\":\"and\",\"sentto\":\"anna@gmail.com\",\"sentfrom\":\"anna@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"contains\",\"value\":\"harutyun\",\"job\":\"and\",\"sentto\":\"anna@gmail.com\",\"sentfrom\":\"anna@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','send good','2021-04-06 04:51:57','2021-04-06 04:51:57'),(3,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','send good','2021-04-06 06:21:42','2021-04-06 06:21:42'),(4,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','send good','2021-04-06 06:22:24','2021-04-06 06:22:24'),(5,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:11:30','2021-04-06 07:11:30'),(6,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:11:30','2021-04-06 07:11:30'),(7,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:11:30','2021-04-06 07:11:30'),(8,'arevyan246@gmail.com','$array[0][\"sentto\"]','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','send good','2021-04-06 07:11:33','2021-04-06 07:11:33'),(9,'arevyan246@gmail.com','$array[0][\"sentto\"]','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','send good','2021-04-06 07:11:34','2021-04-06 07:11:34'),(10,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:14:00','2021-04-06 07:14:00'),(11,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:14:00','2021-04-06 07:14:00'),(12,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:14:00','2021-04-06 07:14:00'),(13,'arevyan246@gmail.com','$array[0][\"sentto\"]','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','send good','2021-04-06 07:14:02','2021-04-06 07:14:02'),(14,'arevyan246@gmail.com','$array[0][\"sentto\"]','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','send good','2021-04-06 07:14:03','2021-04-06 07:14:03'),(15,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:26:19','2021-04-06 07:26:19'),(16,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:26:19','2021-04-06 07:26:19'),(17,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:26:19','2021-04-06 07:26:19'),(18,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:29:58','2021-04-06 07:29:58'),(19,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:29:58','2021-04-06 07:29:58'),(20,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:29:58','2021-04-06 07:29:58'),(21,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:40:36','2021-04-06 07:40:36'),(22,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:40:36','2021-04-06 07:40:36'),(23,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:40:36','2021-04-06 07:40:36'),(24,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:45:10','2021-04-06 07:45:10'),(25,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:45:10','2021-04-06 07:45:10'),(26,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:45:10','2021-04-06 07:45:10'),(27,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:48:02','2021-04-06 07:48:02'),(28,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:48:02','2021-04-06 07:48:02'),(29,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:48:02','2021-04-06 07:48:02'),(30,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:48:38','2021-04-06 07:48:38'),(31,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:48:38','2021-04-06 07:48:38'),(32,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:48:38','2021-04-06 07:48:38'),(33,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:49:31','2021-04-06 07:49:31'),(34,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:49:31','2021-04-06 07:49:31'),(35,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:49:31','2021-04-06 07:49:31'),(36,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:49:38','2021-04-06 07:49:38'),(37,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:49:38','2021-04-06 07:49:38'),(38,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:49:38','2021-04-06 07:49:38'),(39,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:49:48','2021-04-06 07:49:48'),(40,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:49:48','2021-04-06 07:49:48'),(41,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:49:48','2021-04-06 07:49:48'),(42,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:55:16','2021-04-06 07:55:16'),(43,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:55:16','2021-04-06 07:55:16'),(44,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 07:55:16','2021-04-06 07:55:16'),(45,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 08:12:05','2021-04-06 08:12:05'),(46,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 08:12:05','2021-04-06 08:12:05'),(47,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 08:12:05','2021-04-06 08:12:05'),(48,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 08:28:05','2021-04-06 08:28:05'),(49,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 08:28:05','2021-04-06 08:28:05'),(50,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 08:28:05','2021-04-06 08:28:05'),(51,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:05:36','2021-04-06 10:05:36'),(52,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:05:36','2021-04-06 10:05:36'),(53,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:05:36','2021-04-06 10:05:36'),(54,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"contains\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"tomT\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:05:36','2021-04-06 10:05:36'),(55,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"contains\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"tomT\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:05:36','2021-04-06 10:05:36'),(56,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"contains\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"tomT\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:05:36','2021-04-06 10:05:36'),(57,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:08:00','2021-04-06 10:08:00'),(58,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:08:00','2021-04-06 10:08:00'),(59,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Harutyun\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"created_at\",\"options\":\"today\",\"value\":\"\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"Arevyan\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:08:00','2021-04-06 10:08:00'),(60,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"contains\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"tomT\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:08:00','2021-04-06 10:08:00'),(61,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"contains\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"tomT\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:08:00','2021-04-06 10:08:00'),(62,'arevyan246@gmail.com','arevyan246@gmail.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"contains\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"tomT\",\"job\":\"and\",\"sentto\":\"arevyan246@gmail.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:08:00','2021-04-06 10:08:00'),(63,'arevyan246@gmail.com','ssurani@mvixusa.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tomtom\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:08:00','2021-04-06 10:08:00'),(64,'arevyan246@gmail.com','ssurani@mvixusa.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tomtom\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:08:00','2021-04-06 10:08:00'),(65,'arevyan246@gmail.com','ssurani@mvixusa.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tomtom\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:08:00','2021-04-06 10:08:00'),(66,'arevyan246@gmail.com','ssurani@mvixusa.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tomtom\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:08:55','2021-04-06 10:08:55'),(67,'arevyan246@gmail.com','ssurani@mvixusa.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tomtom\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:08:55','2021-04-06 10:08:55'),(68,'arevyan246@gmail.com','ssurani@mvixusa.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tomtom\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-06 10:08:55','2021-04-06 10:08:55'),(69,'arevyan246@gmail.com','ssurani@mvixusa.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tomtom\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-07 01:59:59','2021-04-07 01:59:59'),(70,'arevyan246@gmail.com','ssurani@mvixusa.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tomtom\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-07 01:59:59','2021-04-07 01:59:59'),(71,'arevyan246@gmail.com','ssurani@mvixusa.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tomtom\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-07 02:00:00','2021-04-07 02:00:00'),(72,'from','ssurani@mvixusa.com','Temp_1','send good','2021-04-07 02:00:05','2021-04-07 02:00:05'),(73,'from','ssurani@mvixusa.com','Temp_1','send good','2021-04-07 02:00:07','2021-04-07 02:00:07'),(74,'arevyan246@gmail.com','ssurani@mvixusa.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tomtom\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-07 02:20:18','2021-04-07 02:20:18'),(75,'arevyan246@gmail.com','ssurani@mvixusa.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tomtom\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-07 02:20:18','2021-04-07 02:20:18'),(76,'arevyan246@gmail.com','ssurani@mvixusa.com','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tom\",\"job\":\"and\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is not\",\"value\":\"anna\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tomtom\",\"job\":\"or\",\"sentto\":\"ssurani@mvixusa.com\",\"sentfrom\":\"arevyan246@gmail.com\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-07 02:20:18','2021-04-07 02:20:18'),(77,'harutyunarevyan@mail.ru','harutyunarevyan@mail.ru','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"harutyun\",\"job\":\"and\",\"sentto\":\"harutyunarevyan@mail.ru\",\"sentfrom\":\"harutyunarevyan@mail.ru\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"asasasa\",\"job\":\"or\",\"sentto\":\"harutyunarevyan@mail.ru\",\"sentfrom\":\"harutyunarevyan@mail.ru\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tryrtyrtyrt\",\"job\":\"or\",\"sentto\":\"harutyunarevyan@mail.ru\",\"sentfrom\":\"harutyunarevyan@mail.ru\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-07 02:20:18','2021-04-07 02:20:18'),(78,'harutyunarevyan@mail.ru','harutyunarevyan@mail.ru','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"harutyun\",\"job\":\"and\",\"sentto\":\"harutyunarevyan@mail.ru\",\"sentfrom\":\"harutyunarevyan@mail.ru\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"asasasa\",\"job\":\"or\",\"sentto\":\"harutyunarevyan@mail.ru\",\"sentfrom\":\"harutyunarevyan@mail.ru\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tryrtyrtyrt\",\"job\":\"or\",\"sentto\":\"harutyunarevyan@mail.ru\",\"sentfrom\":\"harutyunarevyan@mail.ru\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-07 02:20:18','2021-04-07 02:20:18'),(79,'harutyunarevyan@mail.ru','harutyunarevyan@mail.ru','[{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"harutyun\",\"job\":\"and\",\"sentto\":\"harutyunarevyan@mail.ru\",\"sentfrom\":\"harutyunarevyan@mail.ru\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"asasasa\",\"job\":\"or\",\"sentto\":\"harutyunarevyan@mail.ru\",\"sentfrom\":\"harutyunarevyan@mail.ru\",\"tamp\":\"Temp_1\",\"status\":\"active\"},{\"db\":\"client\",\"dbname\":\"client_name\",\"options\":\"is\",\"value\":\"tryrtyrtyrt\",\"job\":\"or\",\"sentto\":\"harutyunarevyan@mail.ru\",\"sentfrom\":\"harutyunarevyan@mail.ru\",\"tamp\":\"Temp_1\",\"status\":\"active\"}]','start good','2021-04-07 02:20:18','2021-04-07 02:20:18'),(80,'from','harutyunarevyan@mail.ru','Temp_1','send good','2021-04-07 02:20:20','2021-04-07 02:20:20'),(81,'from','harutyunarevyan@mail.ru','Temp_1','send good','2021-04-07 02:20:21','2021-04-07 02:20:21'),(82,'from','harutyunarevyan@mail.ru','Temp_1','send good','2021-04-07 02:20:23','2021-04-07 02:20:23');
/*!40000 ALTER TABLE `logjobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned DEFAULT NULL,
  `feature_id` int(10) unsigned NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` decimal(11,3) NOT NULL DEFAULT 0.000,
  `file_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `activation_date` date DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT 1,
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_client_id_index` (`client_id`),
  KEY `media_title_index` (`title`),
  KEY `media_feature_id_foreign` (`feature_id`),
  CONSTRAINT `media_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `media_feature_id_foreign` FOREIGN KEY (`feature_id`) REFERENCES `feature` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_03_15_073143_create_tamps_table',1),(6,'2021_03_16_114759_create_types_table',1),(7,'2021_03_20_130750_create_emails_table',1),(9,'2021_03_22_035728_create_emailtemps_table',1),(14,'2021_03_15_113324_create_tables_table',3),(15,'2021_03_20_131750_create_operators_table',4),(16,'2021_03_22_143143_create_jobs_table',5),(18,'2021_03_30_025339_create_logjobs_table',6);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operators`
--

DROP TABLE IF EXISTS `operators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operators` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `operator` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operators`
--

LOCK TABLES `operators` WRITE;
/*!40000 ALTER TABLE `operators` DISABLE KEYS */;
INSERT INTO `operators` VALUES (1,'text','is',NULL,NULL),(2,'text','is not',NULL,NULL),(3,'text','contains',NULL,NULL),(4,'text','does not contain',NULL,NULL),(5,'text','start with',NULL,NULL),(6,'text','ends with',NULL,NULL),(7,'text','is empty',NULL,NULL),(8,'text','is not empty',NULL,NULL),(9,'date','today',NULL,NULL),(10,'date','tomorrow',NULL,NULL),(11,'date','yesterday',NULL,NULL),(12,'date','last week',NULL,NULL),(13,'date','current week',NULL,NULL),(14,'date','last 7 days',NULL,NULL),(15,'date','next 7 days',NULL,NULL),(16,'date','last month',NULL,NULL),(17,'date','this month',NULL,NULL),(18,'numeric','>',NULL,NULL),(19,'numeric','=',NULL,NULL),(20,'numeric','>=',NULL,NULL),(21,'numeric','<=',NULL,NULL),(22,'numeric','!=',NULL,NULL),(23,'numeric','is empty',NULL,NULL),(24,'numeric','is notempty',NULL,NULL);
/*!40000 ALTER TABLE `operators` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `org_user`
--

DROP TABLE IF EXISTS `org_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `org_user` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(256) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  `profile_uri` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_password_reset` timestamp NULL DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Active',
  `created_by` bigint(20) unsigned NOT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `org_user_email_unique` (`email`),
  KEY `org_user_client_id_foreign` (`client_id`),
  KEY `org_user_first_name_index` (`first_name`),
  KEY `org_user_last_name_index` (`last_name`),
  KEY `org_user_role_id_foreign` (`role_id`),
  CONSTRAINT `org_user_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
  CONSTRAINT `org_user_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `org_user`
--

LOCK TABLES `org_user` WRITE;
/*!40000 ALTER TABLE `org_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `org_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('Active','Inactive') COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` bigint(20) unsigned DEFAULT NULL,
  `updated_by` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `roles_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tables`
--

DROP TABLE IF EXISTS `tables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tables` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `table` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tablefild` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tables`
--

LOCK TABLES `tables` WRITE;
/*!40000 ALTER TABLE `tables` DISABLE KEYS */;
INSERT INTO `tables` VALUES (1,'client','client_name','text',NULL,NULL),(2,'client','created_at','date',NULL,NULL);
/*!40000 ALTER TABLE `tables` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tamps`
--

DROP TABLE IF EXISTS `tamps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tamps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tamps`
--

LOCK TABLES `tamps` WRITE;
/*!40000 ALTER TABLE `tamps` DISABLE KEYS */;
/*!40000 ALTER TABLE `tamps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `front` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `after` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'task'
--

--
-- Dumping routines for database 'task'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-07 10:38:56
