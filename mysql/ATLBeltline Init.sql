-- MySQL dump 10.13  Distrib 8.0.13, for macos10.14 (x86_64)
--
-- Host: localhost    Database: ATLBeltline
-- ------------------------------------------------------
-- Server version	8.0.15
CREATE DATABASE  IF NOT EXISTS `ATLBeltline` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `ATLBeltline`;

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
-- Table structure for table `ADMINISTRATOR`
--

DROP TABLE IF EXISTS `ADMINISTRATOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ADMINISTRATOR` (
  `Username` varchar(20) NOT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `AdminUsernameFK` FOREIGN KEY (`Username`) REFERENCES `employee` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMINISTRATOR`
--

LOCK TABLES `ADMINISTRATOR` WRITE;
/*!40000 ALTER TABLE `ADMINISTRATOR` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMINISTRATOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSIGN_TO`
--

DROP TABLE IF EXISTS `ASSIGN_TO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ASSIGN_TO` (
  `Username` varchar(20) NOT NULL,
  `SiteName` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `StartDate` date NOT NULL,
  PRIMARY KEY (`Username`,`SiteName`,`Name`,`StartDate`),
  KEY `AssignToSiteName_idx` (`SiteName`,`Name`,`StartDate`),
  CONSTRAINT `AssignToEventFK` FOREIGN KEY (`SiteName`, `Name`, `StartDate`) REFERENCES `event` (`Host`, `Name`, `StartDate`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSIGN_TO`
--

LOCK TABLES `ASSIGN_TO` WRITE;
/*!40000 ALTER TABLE `ASSIGN_TO` DISABLE KEYS */;
INSERT INTO `ASSIGN_TO` VALUES ('staff1','Atlanta BeltLine Center','Official Atlanta BeltLine Bike Tour','2019-02-09'),('michael.smith','Historic Fourth Ward Park','Eastside Trail','2019-02-13'),('staff3','Inman Park','Arboretum Walking Tour','2019-02-08'),('michael.smith','Inman Park','Bus Tour','2019-02-01'),('staff2','Inman Park','Bus Tour','2019-02-01'),('michael.smith','Inman Park','Bus Tour','2019-02-08'),('robert.smith','Inman Park','Bus Tour','2019-02-08'),('robert.smith','Inman Park','Eastside Trail','2019-02-04'),('staff2','Inman Park','Eastside Trail','2019-02-04'),('staff1','Inman Park','Eastside Trail','2019-03-01'),('robert.smith','Inman Park','Private Bus Tour','2019-02-01'),('michael.smith','Piedmont Park','Eastside Trail','2019-02-04'),('staff1','Piedmont Park','Eastside Trail','2019-02-04'),('staff1','Westview Cemetery','Westside Trail','2019-02-18'),('staff3','Westview Cemetery','Westside Trail','2019-02-18');
/*!40000 ALTER TABLE `ASSIGN_TO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONNECT`
--

DROP TABLE IF EXISTS `CONNECT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `CONNECT` (
  `SiteName` varchar(50) NOT NULL,
  `Route` varchar(15) NOT NULL,
  `TransportType` varchar(15) NOT NULL,
  PRIMARY KEY (`SiteName`,`Route`,`TransportType`),
  KEY `ConnectTransitFK_idx` (`Route`,`TransportType`),
  CONSTRAINT `ConnectSiteNameFK` FOREIGN KEY (`SiteName`) REFERENCES `site` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ConnectTransitFK` FOREIGN KEY (`Route`, `TransportType`) REFERENCES `transit` (`Route`, `TransportType`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONNECT`
--

LOCK TABLES `CONNECT` WRITE;
/*!40000 ALTER TABLE `CONNECT` DISABLE KEYS */;
INSERT INTO `CONNECT` VALUES ('Historic Fourth Ward Park','152','Bus'),('Inman Park','152','Bus'),('Piedmont Park','152','Bus'),('Historic Fourth Ward Park','Blue','MARTA'),('Inman Park','Blue','MARTA'),('Piedmont Park','Blue','MARTA'),('Westview Cemetery','Blue','MARTA'),('Historic Fourth Ward Park','Relay','Bike'),('Piedmont Park','Relay','Bike');
/*!40000 ALTER TABLE `CONNECT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEE`
--

DROP TABLE IF EXISTS `EMPLOYEE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EMPLOYEE` (
  `Username` varchar(20) NOT NULL,
  `EmployeeID` int(9) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Phone` char(10) NOT NULL,
  `Address` varchar(45) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` char(5) NOT NULL,
  `Zipcode` char(5) NOT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `Phone_UNIQUE` (`Phone`),
  UNIQUE KEY `EmployeeID_UNIQUE` (`EmployeeID`),
  CONSTRAINT `EmployeeUsernameFK` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEE`
--

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;
INSERT INTO `EMPLOYEE` VALUES ('david.smith',000000005,'5124776435','350 Ferst Drive','Atlanta','GA','30332'),('james.smith',000000001,'4043721234','123 East Main Street','Rochester','NY','14604'),('manager1',000000006,'8045126767','123 East Main Street','Rochester','NY','14604'),('manager2',000000007,'9876543210','123 East Main Street','Rochester','NY','14604'),('manager3',000000008,'5432167890','350 Ferst Drive','Atlanta','GA','30332'),('manager4',000000009,'8053467565','123 East Main Street','Columbus','OH','43215'),('manager5',000000010,'8031446782','801 Atlantic Drive','Atlanta','GA','30332'),('maria.garcia',000000004,'7890123456','123 East Main Street','Richland','PA','17987'),('michael.smith',000000002,'4043726789','350 Ferst Drive','Atlanta','GA','30332'),('robert.smith',000000003,'1234567890','123 East Main Street','Columbus','OH','43215'),('staff1',000000011,'8024456765','266 Ferst Drive Northwest','Atlanta','GA','30332'),('staff2',000000012,'8888888888','266 Ferst Drive Northwest','Atlanta','GA','30332'),('staff3',000000013,'3333333333','801 Atlantic Drive','Atlanta','GA','30332');
/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT`
--

DROP TABLE IF EXISTS `EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `EVENT` (
  `Host` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `StartDate` date NOT NULL,
  `EndDate` date NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  `Capacity` int(10) unsigned NOT NULL,
  `MinStaffReq` int(10) unsigned NOT NULL,
  `Description` varchar(1000) NOT NULL,
  PRIMARY KEY (`Host`,`Name`,`StartDate`),
  CONSTRAINT `SiteNameFK` FOREIGN KEY (`Host`) REFERENCES `site` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT`
--

LOCK TABLES `EVENT` WRITE;
/*!40000 ALTER TABLE `EVENT` DISABLE KEYS */;
INSERT INTO `EVENT` VALUES ('Atlanta BeltLine Center','Official Atlanta BeltLine Bike Tour','2019-02-09','2019-02-14',5.00,5,1,'These tours will include rest stops highlighting assets and points of interest along the Atlanta BeltLine. Staff will lead the rides, and each group will have a ride sweep to help with any unexpected mechanical difficulties.'),('Historic Fourth Ward Park','Eastside Trail','2019-02-13','2019-02-14',0.00,99999,1,'A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/'),('Inman Park','Arboretum Walking Tour','2019-02-08','2019-02-11',5.00,5,1,'Official Atlanta BeltLine Arboretum Walking Tours provide an up-close view of the Westside Trail and the Atlanta BeltLine Arboretum led by Trees Atlanta Docents. The one and a half hour tours step off at at 10am (Oct thru May), and 9am (June thru September). Departure for all tours is from Rose Circle Park near Brown Middle School. More details at: https://beltline.org/visit/atlanta-beltline-tours/#arboretum-walking'),('Inman Park','Bus Tour','2019-02-01','2019-02-02',25.00,6,2,'The Atlanta BeltLine Partnership’s tour program operates with a natural gas-powered, ADA accessible tour bus funded through contributions from 10th & Monroe, LLC, SunTrust Bank Trusteed Foundations – Florence C. and Harry L. English Memorial Fund and Thomas Guy Woolford Charitable Trust, and AGL Resources'),('Inman Park','Bus Tour','2019-02-08','2019-02-10',25.00,6,2,'The Atlanta BeltLine Partnership’s tour program operates with a natural gas-powered, ADA accessible tour bus funded through contributions from 10th & Monroe, LLC, SunTrust Bank Trusteed Foundations – Florence C. and Harry L. English Memorial Fund and Thomas Guy Woolford Charitable Trust, and AGL Resources'),('Inman Park','Eastside Trail','2019-02-04','2019-02-05',0.00,99999,1,'A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/'),('Inman Park','Eastside Trail','2019-03-01','2019-03-02',0.00,99999,1,'A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/'),('Inman Park','Private Bus Tour','2019-02-01','2019-02-02',40.00,4,1,'Private tours are available most days, pending bus and tour guide availability. Private tours can accommodate up to 4 guests per tour, and are subject to a tour fee (nonprofit rates are available). As a nonprofit organization with limited resources, we are unable to offer free private tours. We thank you for your support and your understanding as we try to provide as many private group tours as possible. The Atlanta BeltLine Partnership’s tour program operates with a natural gas-powered, ADA accessible tour bus funded through contributions from 10th & Monroe, LLC, SunTrust Bank Trusteed Foundations – Florence C. and Harry L. English Memorial Fund and Thomas Guy Woolford Charitable Trust, and AGL Resources'),('Piedmont Park','Eastside Trail','2019-02-04','2019-02-05',0.00,99999,1,'A combination of multi-use trail and linear greenspace, the Eastside Trail was the first finished section of the Atlanta BeltLine trail in the old rail corridor. The Eastside Trail, which was funded by a combination of public and private philanthropic sources, runs from the tip of Piedmont Park to Reynoldstown. More details at https://beltline.org/explore-atlanta-beltline-trails/eastside-trail/'),('Westview Cemetery','Westside Trail','2019-02-18','2019-02-21',0.00,99999,1,'The Westside Trail is a free amenity that offers a bicycle and pedestrian-safe corridor with a 14-foot-wide multi-use trail surrounded by mature trees and grasses thanks to Trees Atlanta’s Arboretum. With 16 points of entry, 14 of which will be ADA-accessible with ramp and stair systems, the trail provides numerous access points for people of all abilities. More details at: https://beltline.org/explore-atlanta-beltline-trails/westside-trail/');
/*!40000 ALTER TABLE `EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANAGER`
--

DROP TABLE IF EXISTS `MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `MANAGER` (
  `Username` varchar(20) NOT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `ManagerUsernameFK` FOREIGN KEY (`Username`) REFERENCES `employee` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANAGER`
--

LOCK TABLES `MANAGER` WRITE;
/*!40000 ALTER TABLE `MANAGER` DISABLE KEYS */;
INSERT INTO `MANAGER` VALUES ('david.smith'),('manager1'),('manager2'),('manager3'),('manager4'),('manager5'),('maria.garcia');
/*!40000 ALTER TABLE `MANAGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SITE`
--

DROP TABLE IF EXISTS `SITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `SITE` (
  `Name` varchar(50) NOT NULL,
  `Address` varchar(50) DEFAULT NULL,
  `Zipcode` char(5) NOT NULL,
  `OpenEveryDay` char(3) NOT NULL,
  `Manager` varchar(20) NOT NULL,
  PRIMARY KEY (`Name`),
  KEY `SiteManagerFK_idx` (`Manager`),
  CONSTRAINT `SiteManagerFK` FOREIGN KEY (`Manager`) REFERENCES `manager` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SITE`
--

LOCK TABLES `SITE` WRITE;
/*!40000 ALTER TABLE `SITE` DISABLE KEYS */;
INSERT INTO `SITE` VALUES ('Atlanta Beltline Center','112 Krog Street Northeast','30307','No','manager3'),('Historic Fourth Ward Park','680 Dallas Street Northeast','30308','Yes','manager4'),('Inman Park','','30307','Yes','david.smith'),('Piedmont Park','400 Park Drive Northeast','30306','Yes','manager2'),('Westview Cemetery','1680 Westview Drive Southwest','30310','No','manager5');
/*!40000 ALTER TABLE `SITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAFF`
--

DROP TABLE IF EXISTS `STAFF`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `STAFF` (
  `Username` varchar(20) NOT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `StaffUsernameFK` FOREIGN KEY (`Username`) REFERENCES `employee` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAFF`
--

LOCK TABLES `STAFF` WRITE;
/*!40000 ALTER TABLE `STAFF` DISABLE KEYS */;
INSERT INTO `STAFF` VALUES ('michael.smith'),('robert.smith'),('staff1'),('staff2'),('staff3');
/*!40000 ALTER TABLE `STAFF` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TAKE`
--

DROP TABLE IF EXISTS `TAKE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TAKE` (
  `Username` varchar(20) NOT NULL,
  `Route` varchar(15) NOT NULL,
  `TransportType` varchar(15) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Username`,`Route`,`TransportType`,`Date`),
  KEY `TakeTransitFK_idx` (`Route`,`TransportType`),
  CONSTRAINT `TakeTransitFK` FOREIGN KEY (`Route`, `TransportType`) REFERENCES `transit` (`Route`, `TransportType`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `TakeUsernameFK` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TAKE`
--

LOCK TABLES `TAKE` WRITE;
/*!40000 ALTER TABLE `TAKE` DISABLE KEYS */;
INSERT INTO `TAKE` VALUES ('manager2','152','Bus','2019-03-20'),('maria.hernandez','152','Bus','2019-03-20'),('maria.hernandez','152','Bus','2019-03-22'),('manager2','Blue','MARTA','2019-03-20'),('manager2','Blue','MARTA','2019-03-21'),('manager2','Blue','MARTA','2019-03-22'),('visitor1','Blue','MARTA','2019-03-21'),('manager3','Relay','Bike','2019-03-20'),('maria.hernandez','Relay','Bike','2019-03-20'),('mary.smith','Relay','Bike','2019-03-23');
/*!40000 ALTER TABLE `TAKE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TRANSIT`
--

DROP TABLE IF EXISTS `TRANSIT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `TRANSIT` (
  `Route` varchar(15) NOT NULL,
  `TransportType` varchar(15) NOT NULL,
  `Price` decimal(10,2) unsigned NOT NULL,
  PRIMARY KEY (`Route`,`TransportType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TRANSIT`
--

LOCK TABLES `TRANSIT` WRITE;
/*!40000 ALTER TABLE `TRANSIT` DISABLE KEYS */;
INSERT INTO `TRANSIT` VALUES ('152','Bus',2.00),('Blue','MARTA',2.00),('Relay','Bike',1.00);
/*!40000 ALTER TABLE `TRANSIT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `USER` (
  `Username` varchar(20) NOT NULL,
  `Password` char(60) NOT NULL,
  `Firstname` varchar(20) NOT NULL,
  `Lastname` varchar(20) NOT NULL,
  `Status` char(10) NOT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES ('david.smith','$2b$10$GKOAidf1Fd5EQ0Bqut7//egRijqGM2pvt0yOiyKy341nc0SIiqszK','David','Smith','Approved'),('james.smith','$2b$10$i3uVTZdXQ1NxfFANi0CJy.SDQnN9a4c68GfNl.uorl2gW5QRt316a','James','Smith','Approved'),('manager1','$2b$10$pXBleTPyQWIYPvvMbR.6Re44teSvhvsDFahrIF/FpR/Eh.W9tOW6C','Manager','One','Pending'),('manager2','$2b$10$gsti.bzlgzyBlHHn9WHmvOBAOzlZxdisKPR5exT9LUkH858jDfgQm','Manager','Two','Approved'),('manager3','$2b$10$aN39KgUqBkMFmuwdG.cfueyJQyy2gI5NUVvgOHAVp8i8Fpos7ZXA6','Manager','Three','Approved'),('manager4','$2b$10$PpnL/pCnjh35IQ.tkC0P2.HsHWLowXSfGdT6PRAjzHXTS4r4gBhYu','Manager','Four','Approved'),('manager5','$2b$10$XiGTy8B2s/4/8tDFXmUMQ.amwA58rpFBAbLCVIL.9f7F9M./kLAJO','Manager','Five','Approved'),('maria.garcia','$2b$10$FOQzg1n4rxqocrSvQGfb5e8OwmUdehMqoOP0WyjeQbwwjeBW5knB6','Maria','Garcia','Approved'),('maria.hernandez','$2b$10$yXUEyt3Rf9k.fXvhihSsWe5LFPiWZoju.24NlYixZV6ttbbZUwnK2','Maria','Hernandez','Approved'),('maria.rodriguez','$2b$10$.et2jD3.trsr8Dq4VxnImeo/rCzDICrh32Ej.KmAaETp1Vy3UsNES','Maria','Rodriguez','Declined'),('mary.smith','$2b$10$otJX25MadKvZEk8Ihy.XKunUhYLmqEE4o2O99T4ZgfNoLs/I1p9WS','Mary','Smith','Approved'),('michael.smith','$2b$10$f6BqxXQa.fEMQxhd3zqZ6.VjiIu57NK6IQkCZtYQgT78fiGTsXnr2','Michael','Smith','Approved'),('robert.smith','$2b$10$yIbBmUzf2TowuKNxVhUJDuKjYW97g9r1Ca7KPcnTvWmPfaLXXzJWW','Robert ','Smith','Approved'),('staff1','$2b$10$BeahLIUMoik0hYb/n4bbzemgUqX2XhQkg8PmJMDE2oGgC6bKs9yCW','Staff','One','Approved'),('staff2','$2b$10$Z0uXcKLbHJ4J3xJsYn24LOa5F1/NiUpntaJ9mG8HuKtLPBN/E.4cu','Staff','Two','Approved'),('staff3','$2b$10$JUfiUPfmYpBp.6OoA.iUUu4Snj4noDoIjuQMETnNx8pov.amzRYFC','Staff','Three','Approved'),('test1','$2b$10$wWMwjv8CNnsIuh79jKYYeeB6BaDXyy6kd8S5VaasW0G3iplrDhZ0e','first11','last11','Decline'),('test2','$2b$10$Lvs56cdQ0xQ9gnGIOazSfeV8VasCQ9qJ4/iJG1oKe9phe32BXigwO','first2','last2','Pending'),('test3','$2b$10$NjlvMndlPLHCvg7d9pgrDu7y16qv4tqyG4INVFz.M9m2/NsdiUSXK','first3','last3','Decline'),('test4','$2b$10$tWkETcwMxgfVeuqMmHOhDOVlal9TvWtsR2ukOaZX3aI66qwx0DlOm','first4','last4','Approved'),('user1','$2b$10$V./yhPRKkodh0tvj4KP1Z.vwDhBppugjM4lPesUl2CGRAKtXzo3tO','User','One','Pending'),('visitor1','$2b$10$jzHlgv4SKFmK2yVCQvWlvugZm9eAioXM5NwebPwlpAcZQMFaIqjm.','Visitor','One','Approved');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_EMAIL`
--

DROP TABLE IF EXISTS `USER_EMAIL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `USER_EMAIL` (
  `Username` varchar(20) NOT NULL,
  `Email` varchar(45) NOT NULL,
  PRIMARY KEY (`Email`),
  KEY `EmailUsernameFK_idx` (`Username`),
  CONSTRAINT `EmailUsernameFK` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_EMAIL`
--

LOCK TABLES `USER_EMAIL` WRITE;
/*!40000 ALTER TABLE `USER_EMAIL` DISABLE KEYS */;
INSERT INTO `USER_EMAIL` VALUES ('david.smith','dsmith@outlook.com'),('james.smith','jsmith@gatech.edu'),('james.smith','jsmith@gmail.com'),('james.smith','jsmith@hotmail.com'),('james.smith','jsmith@outlook.com'),('manager1','m1@beltline.com'),('manager2','m2@beltline.com'),('manager3','m3@beltline.com'),('manager4','m4@beltline.com'),('manager5','m5@beltline.com'),('maria.garcia','mgarcia@gatech.edu'),('maria.garcia','mgarcia@yahoo.com'),('maria.hernandez','mh@gatech.edu'),('maria.hernandez','mh123@gmail.com'),('maria.rodriguez','mrodriguez@gmail.com'),('mary.smith','mary@outlook.com'),('michael.smith','msmith@gmail.com'),('robert.smith','rsmith@hotmail.com'),('staff1','s1@beltline.com'),('staff2','s2@beltline.com'),('staff3','s3@beltline.com'),('user1','u1@beltline.com'),('visitor1','v1@beltline.com');
/*!40000 ALTER TABLE `USER_EMAIL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VISIT_EVENT`
--

DROP TABLE IF EXISTS `VISIT_EVENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `VISIT_EVENT` (
  `Username` varchar(20) NOT NULL,
  `SiteName` varchar(50) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `StartDate` date NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Username`,`SiteName`,`Name`,`StartDate`,`Date`),
  KEY `VisitEventFK_idx` (`SiteName`,`Name`,`StartDate`),
  CONSTRAINT `VisitEventFK` FOREIGN KEY (`SiteName`, `Name`, `StartDate`) REFERENCES `event` (`Host`, `Name`, `StartDate`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VisitEventUsernameFK` FOREIGN KEY (`Username`) REFERENCES `visitor` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VISIT_EVENT`
--

LOCK TABLES `VISIT_EVENT` WRITE;
/*!40000 ALTER TABLE `VISIT_EVENT` DISABLE KEYS */;
INSERT INTO `VISIT_EVENT` VALUES ('mary.smith','Atlanta BeltLine Center','Official Atlanta BeltLine Bike Tour','2019-02-09','2019-02-10'),('visitor1','Atlanta BeltLine Center','Official Atlanta BeltLine Bike Tour','2019-02-09','2019-02-10'),('mary.smith','Historic Fourth Ward Park','Eastside Trail','2019-02-13','2019-02-13'),('mary.smith','Historic Fourth Ward Park','Eastside Trail','2019-02-13','2019-02-14'),('visitor1','Historic Fourth Ward Park','Eastside Trail','2019-02-13','2019-02-14'),('mary.smith','Inman Park','Arboretum Walking Tour','2019-02-08','2019-02-10'),('manager2','Inman Park','Bus Tour','2019-02-01','2019-02-02'),('manager4','Inman Park','Bus Tour','2019-02-01','2019-02-01'),('manager5','Inman Park','Bus Tour','2019-02-01','2019-02-02'),('maria.garcia','Inman Park','Bus Tour','2019-02-01','2019-02-02'),('mary.smith','Inman Park','Bus Tour','2019-02-01','2019-02-01'),('staff2','Inman Park','Bus Tour','2019-02-01','2019-02-02'),('mary.smith','Inman Park','Private Bus Tour','2019-02-01','2019-02-01'),('mary.smith','Inman Park','Private Bus Tour','2019-02-01','2019-02-02'),('mary.smith','Piedmont Park','Eastside Trail','2019-02-04','2019-02-04'),('mary.smith','Westview Cemetery','Westside Trail','2019-02-18','2019-02-19'),('visitor1','Westview Cemetery','Westside Trail','2019-02-18','2019-02-19');
/*!40000 ALTER TABLE `VISIT_EVENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VISIT_SITE`
--

DROP TABLE IF EXISTS `VISIT_SITE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `VISIT_SITE` (
  `Username` varchar(20) NOT NULL,
  `SiteName` varchar(50) NOT NULL,
  `Date` date NOT NULL,
  PRIMARY KEY (`Username`,`SiteName`,`Date`),
  KEY `VisitSiteSiteNameFK_idx` (`SiteName`),
  CONSTRAINT `VisitSiteSiteNameFK` FOREIGN KEY (`SiteName`) REFERENCES `site` (`Name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `VisitSiteUsernameFK` FOREIGN KEY (`Username`) REFERENCES `visitor` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VISIT_SITE`
--

LOCK TABLES `VISIT_SITE` WRITE;
/*!40000 ALTER TABLE `VISIT_SITE` DISABLE KEYS */;
INSERT INTO `VISIT_SITE` VALUES ('mary.smith','Atlanta Beltline Center','2019-02-01'),('mary.smith','Atlanta Beltline Center','2019-02-10'),('visitor1','Atlanta Beltline Center','2019-02-09'),('visitor1','Atlanta Beltline Center','2019-02-13'),('mary.smith','Historic Fourth Ward Park','2019-02-02'),('visitor1','Historic Fourth Ward Park','2019-02-11'),('mary.smith','Inman Park','2019-02-01'),('mary.smith','Inman Park','2019-02-02'),('mary.smith','Inman Park','2019-02-03'),('visitor1','Inman Park','2019-02-01'),('mary.smith','Piedmont Park','2019-02-02'),('visitor1','Piedmont Park','2019-02-01'),('visitor1','Piedmont Park','2019-02-11'),('visitor1','Westview Cemetery','2019-02-06');
/*!40000 ALTER TABLE `VISIT_SITE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `VISITOR`
--

DROP TABLE IF EXISTS `VISITOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `VISITOR` (
  `Username` varchar(20) NOT NULL,
  PRIMARY KEY (`Username`),
  CONSTRAINT `VisitorUsernameFK` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VISITOR`
--

LOCK TABLES `VISITOR` WRITE;
/*!40000 ALTER TABLE `VISITOR` DISABLE KEYS */;
INSERT INTO `VISITOR` VALUES ('manager2'),('manager4'),('manager5'),('maria.garcia'),('maria.rodriguez'),('mary.smith'),('michael.smith'),('staff2'),('staff3'),('visitor1');
/*!40000 ALTER TABLE `VISITOR` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-14 12:19:17
