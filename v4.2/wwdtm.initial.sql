-- -*- coding: utf-8 -*-
-- Copyright (c) 2018-2023 Linh Pham
-- wwdtm_database is released under the terms of the Apache License 2.0

-- Wait Wait... Don't Tell Me! Stats Page Version 4
-- Initial Database Structure for Version 4.2

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
-- Table structure for table `ww_guests`
--

DROP TABLE IF EXISTS `ww_guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_guests` (
  `guestid` int NOT NULL AUTO_INCREMENT,
  `guest` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `guestslug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`guestid`),
  KEY `guest` (`guest`),
  KEY `guestslug` (`guestslug`)
) ENGINE=InnoDB AUTO_INCREMENT=1069 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_hosts`
--

DROP TABLE IF EXISTS `ww_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_hosts` (
  `hostid` int NOT NULL AUTO_INCREMENT,
  `host` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `hostgender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostslug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`hostid`),
  KEY `host` (`host`),
  KEY `hostslug` (`hostslug`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_locations`
--

DROP TABLE IF EXISTS `ww_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_locations` (
  `locationid` int NOT NULL AUTO_INCREMENT,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venue` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locationslug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`locationid`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_panelists`
--

DROP TABLE IF EXISTS `ww_panelists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_panelists` (
  `panelistid` int NOT NULL AUTO_INCREMENT,
  `panelist` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `panelistgender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `panelistslug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`panelistid`),
  KEY `panelist` (`panelist`),
  KEY `panelistslug` (`panelistslug`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_scorekeepers`
--

DROP TABLE IF EXISTS `ww_scorekeepers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_scorekeepers` (
  `scorekeeperid` int NOT NULL AUTO_INCREMENT,
  `scorekeeper` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `scorekeepergender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scorekeeperslug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`scorekeeperid`),
  KEY `scorekeeper` (`scorekeeper`),
  KEY `scorekeeperslug` (`scorekeeperslug`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showbluffmap`
--

DROP TABLE IF EXISTS `ww_showbluffmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showbluffmap` (
  `showbluffmapid` int NOT NULL AUTO_INCREMENT,
  `showid` int NOT NULL,
  `chosenbluffpnlid` int DEFAULT NULL,
  `correctbluffpnlid` int DEFAULT NULL,
  PRIMARY KEY (`showbluffmapid`),
  KEY `wwshowbluffmap_wwshows_showid` (`showid`),
  KEY `wwshowbluffmap_correctbluffpnlid_wwpanelists_panelistid` (`correctbluffpnlid`),
  KEY `wwshowbluffmap_chosenbluffpnlid_wwpanelists_panelistid` (`chosenbluffpnlid`),
  CONSTRAINT `wwshowbluffmap_chosenbluffpnlid_wwpanelists_panelistid` FOREIGN KEY (`chosenbluffpnlid`) REFERENCES `ww_panelists` (`panelistid`),
  CONSTRAINT `wwshowbluffmap_correctbluffpnlid_wwpanelists_panelistid` FOREIGN KEY (`correctbluffpnlid`) REFERENCES `ww_panelists` (`panelistid`),
  CONSTRAINT `wwshowbluffmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=1347 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showdescriptions`
--

DROP TABLE IF EXISTS `ww_showdescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showdescriptions` (
  `showid` int NOT NULL,
  `showdescription` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`showid`),
  CONSTRAINT `wwshowdescriptions_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showguestmap`
--

DROP TABLE IF EXISTS `ww_showguestmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showguestmap` (
  `showguestmapid` int NOT NULL AUTO_INCREMENT,
  `showid` int NOT NULL,
  `guestid` int NOT NULL,
  `guestscore` int DEFAULT NULL,
  `exception` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`showguestmapid`),
  KEY `wwshowguestmap_wwshows_showid` (`showid`),
  KEY `wwshowguestmap_wwguests_guestid` (`guestid`),
  CONSTRAINT `wwshowguestmap_wwguests_guestid` FOREIGN KEY (`guestid`) REFERENCES `ww_guests` (`guestid`),
  CONSTRAINT `wwshowguestmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=1756 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showhostmap`
--

DROP TABLE IF EXISTS `ww_showhostmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showhostmap` (
  `showhostmapid` int NOT NULL AUTO_INCREMENT,
  `showid` int NOT NULL,
  `hostid` int NOT NULL DEFAULT '6',
  `guest` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`showhostmapid`),
  KEY `wwshowhostmap_wwshows_showid` (`showid`),
  KEY `wwshowhostmap_wwhosts_hostid` (`hostid`),
  CONSTRAINT `wwshowhostmap_wwhosts_hostid` FOREIGN KEY (`hostid`) REFERENCES `ww_hosts` (`hostid`),
  CONSTRAINT `wwshowhostmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=1339 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showlocationmap`
--

DROP TABLE IF EXISTS `ww_showlocationmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showlocationmap` (
  `showlocationmapid` int NOT NULL AUTO_INCREMENT,
  `showid` int NOT NULL,
  `locationid` int NOT NULL DEFAULT '3',
  PRIMARY KEY (`showlocationmapid`),
  KEY `ww_showlocationmap_showid` (`showid`),
  KEY `ww_showlocationmap_locationid` (`locationid`),
  CONSTRAINT `ww_showlocationmap_locationid` FOREIGN KEY (`locationid`) REFERENCES `ww_locations` (`locationid`),
  CONSTRAINT `ww_showlocationmap_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=1336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_shownotes`
--

DROP TABLE IF EXISTS `ww_shownotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_shownotes` (
  `showid` int NOT NULL,
  `shownotes` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`showid`),
  CONSTRAINT `wwshownotes_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showpnlmap`
--

DROP TABLE IF EXISTS `ww_showpnlmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showpnlmap` (
  `showpnlmapid` int NOT NULL AUTO_INCREMENT,
  `showid` int NOT NULL,
  `panelistid` int NOT NULL,
  `panelistlrndstart` int DEFAULT NULL,
  `panelistlrndcorrect` int DEFAULT NULL,
  `panelistscore` int DEFAULT NULL,
  `showpnlrank` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '',
  `panelistscore_decimal` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`showpnlmapid`),
  KEY `wwshowpnlmap_wwshows_showid` (`showid`),
  KEY `wwshowpnlmap_wwpanelists_panelistid` (`panelistid`),
  CONSTRAINT `wwshowpnlmap_wwpanelists_panelistid` FOREIGN KEY (`panelistid`) REFERENCES `ww_panelists` (`panelistid`),
  CONSTRAINT `wwshowpnlmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=5228 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_shows`
--

DROP TABLE IF EXISTS `ww_shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_shows` (
  `showid` int NOT NULL AUTO_INCREMENT,
  `showdate` date NOT NULL,
  `repeatshowid` int DEFAULT NULL,
  `bestof` tinyint(1) NOT NULL DEFAULT '0',
  `bestofuniquebluff` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`showid`),
  KEY `wwshows_repeatshowid_showid` (`repeatshowid`),
  CONSTRAINT `wwshows_repeatshowid_showid` FOREIGN KEY (`repeatshowid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=1338 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showskmap`
--

DROP TABLE IF EXISTS `ww_showskmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showskmap` (
  `showskmapid` int NOT NULL AUTO_INCREMENT,
  `showid` int NOT NULL,
  `scorekeeperid` int NOT NULL DEFAULT '8',
  `guest` tinyint(1) NOT NULL DEFAULT '0',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`showskmapid`),
  KEY `wwshowskmap_wwshows_showid` (`showid`),
  KEY `wwshowskmap_wwscorekeepers_scorekeeperid` (`scorekeeperid`),
  CONSTRAINT `wwshowskmap_wwscorekeepers_scorekeeperid` FOREIGN KEY (`scorekeeperid`) REFERENCES `ww_scorekeepers` (`scorekeeperid`),
  CONSTRAINT `wwshowskmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=1336 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
