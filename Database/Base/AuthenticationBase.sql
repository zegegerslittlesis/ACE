-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: ace_auth
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `ace_auth`
--

/*!40000 DROP DATABASE IF EXISTS `ace_auth`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ace_auth` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ace_auth`;

--
-- Table structure for table `accesslevel`
--

DROP TABLE IF EXISTS `accesslevel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `accesslevel` (
  `level` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL,
  `prefix` varchar(45) DEFAULT '',
  PRIMARY KEY (`level`),
  UNIQUE KEY `level` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `account` (
  `accountId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `accountName` varchar(50) NOT NULL,
  `passwordHash` char(60) NOT NULL COMMENT 'BCrypt revision 2y will always result in a 60 character string.',
  `accessLevel` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`accountId`),
  UNIQUE KEY `accountName_uidx` (`accountName`),
  KEY `accesslevel_idx` (`accessLevel`),
  CONSTRAINT `fk_accesslevel` FOREIGN KEY (`accessLevel`) REFERENCES `accesslevel` (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-23 14:43:29
 
/*
-- Query: SELECT * FROM ace_auth.accesslevel
-- Date: 2018-02-14 13:19
*/
INSERT INTO `accesslevel` (`level`,`name`,`prefix`) VALUES (0,'Player','');
INSERT INTO `accesslevel` (`level`,`name`,`prefix`) VALUES (1,'Advocate','');
INSERT INTO `accesslevel` (`level`,`name`,`prefix`) VALUES (2,'Sentinel','Sentinel');
INSERT INTO `accesslevel` (`level`,`name`,`prefix`) VALUES (3,'Envoy','Envoy');
INSERT INTO `accesslevel` (`level`,`name`,`prefix`) VALUES (4,'Developer','');
INSERT INTO `accesslevel` (`level`,`name`,`prefix`) VALUES (5,'Admin','Admin');
