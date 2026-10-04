-- -*- coding: utf-8 -*-
-- Copyright (c) 2018-2024 Linh Pham
-- wwdtm_database is released under the terms of the Apache License 2.0
-- SPDX-License-Identifier: Apache-2.0

-- Wait Wait... Don't Tell Me! Stats Page Version 4
-- Initial Database Structure for Version 4.8

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `__metadata`
--

DROP TABLE IF EXISTS `__metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `__metadata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyname` varchar(128) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_guests`
--

DROP TABLE IF EXISTS `ww_guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_guests` (
  `guestid` int(11) NOT NULL AUTO_INCREMENT,
  `guest` varchar(255) NOT NULL,
  `guestslug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guestid`),
  KEY `guest` (`guest`),
  KEY `guestslug` (`guestslug`)
) ENGINE=InnoDB AUTO_INCREMENT=1198 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_hostpronounsmap`
--

DROP TABLE IF EXISTS `ww_hostpronounsmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_hostpronounsmap` (
  `hostpronounsmapid` int(11) NOT NULL AUTO_INCREMENT,
  `hostid` int(11) NOT NULL,
  `pronounsid` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`hostpronounsmapid`),
  KEY `wwhostpronounsmap_hostid_wwhosts_hostid` (`hostid`),
  KEY `wwhostpronounsmap_pronounsid_wwpronouns_pronounsid` (`pronounsid`),
  CONSTRAINT `wwhostpronounsmap_hostid_wwhosts_hostid` FOREIGN KEY (`hostid`) REFERENCES `ww_hosts` (`hostid`),
  CONSTRAINT `wwhostpronounsmap_pronounsid_wwpronouns_pronounsid` FOREIGN KEY (`pronounsid`) REFERENCES `ww_pronouns` (`pronounsid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_hosts`
--

DROP TABLE IF EXISTS `ww_hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_hosts` (
  `hostid` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `hostgender` char(1) DEFAULT NULL,
  `hostslug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hostid`),
  KEY `host` (`host`),
  KEY `hostslug` (`hostslug`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_hostsocialmap`
--

DROP TABLE IF EXISTS `ww_hostsocialmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_hostsocialmap` (
  `hostsocialmapid` int(11) NOT NULL AUTO_INCREMENT,
  `hostid` int(11) NOT NULL,
  `socialmediaid` int(11) NOT NULL,
  `account` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`hostsocialmapid`),
  KEY `wwhostsocialmap_hostid_wwhosts_hostid` (`hostid`),
  KEY `wwhostsocialmap_socialmediaid_wwsocialmedia_soecialmediaid` (`socialmediaid`),
  CONSTRAINT `wwhostsocialmap_hostid_wwhosts_hostid` FOREIGN KEY (`hostid`) REFERENCES `ww_hosts` (`hostid`),
  CONSTRAINT `wwhostsocialmap_socialmediaid_wwsocialmedia_soecialmediaid` FOREIGN KEY (`socialmediaid`) REFERENCES `ww_social_media` (`socialmediaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_locations`
--

DROP TABLE IF EXISTS `ww_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_locations` (
  `locationid` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(3) DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL,
  `locationslug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`locationid`)
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_panelistpronounsmap`
--

DROP TABLE IF EXISTS `ww_panelistpronounsmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_panelistpronounsmap` (
  `panelistpronounsmapid` int(11) NOT NULL AUTO_INCREMENT,
  `panelistid` int(11) NOT NULL,
  `pronounsid` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`panelistpronounsmapid`),
  KEY `wwpanelistpronounsmap_panelistid_wwpanelists_panelistid` (`panelistid`),
  KEY `wwpanelistpronounsmap_pronounsid_wwpronouns_pronounsid` (`pronounsid`),
  CONSTRAINT `wwpanelistpronounsmap_panelistid_wwpanelists_panelistid` FOREIGN KEY (`panelistid`) REFERENCES `ww_panelists` (`panelistid`),
  CONSTRAINT `wwpanelistpronounsmap_pronounsid_wwpronouns_pronounsid` FOREIGN KEY (`pronounsid`) REFERENCES `ww_pronouns` (`pronounsid`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_panelists`
--

DROP TABLE IF EXISTS `ww_panelists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_panelists` (
  `panelistid` int(11) NOT NULL AUTO_INCREMENT,
  `panelist` varchar(255) NOT NULL,
  `panelistgender` char(1) DEFAULT NULL,
  `panelistslug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`panelistid`),
  KEY `panelist` (`panelist`),
  KEY `panelistslug` (`panelistslug`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_panelistsocialmap`
--

DROP TABLE IF EXISTS `ww_panelistsocialmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_panelistsocialmap` (
  `panelistsocialmapid` int(11) NOT NULL AUTO_INCREMENT,
  `panelistid` int(11) NOT NULL,
  `socialmediaid` int(11) NOT NULL,
  `account` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`panelistsocialmapid`),
  KEY `wwpanelistsocialmap_panelistid_wwpanelists_panelistid` (`panelistid`),
  KEY `wwpanelistsocialmap_socialmediaid_wwsocialmedia_soecialmediaid` (`socialmediaid`),
  CONSTRAINT `wwpanelistsocialmap_panelistid_wwpanelists_panelistid` FOREIGN KEY (`panelistid`) REFERENCES `ww_panelists` (`panelistid`),
  CONSTRAINT `wwpanelistsocialmap_socialmediaid_wwsocialmedia_soecialmediaid` FOREIGN KEY (`socialmediaid`) REFERENCES `ww_social_media` (`socialmediaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_postal_abbreviations`
--

DROP TABLE IF EXISTS `ww_postal_abbreviations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_postal_abbreviations` (
  `postal_abbreviation` varchar(3) NOT NULL,
  `name` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  PRIMARY KEY (`postal_abbreviation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_pronouns`
--

DROP TABLE IF EXISTS `ww_pronouns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_pronouns` (
  `pronounsid` int(11) NOT NULL AUTO_INCREMENT,
  `pronouns` varchar(255) NOT NULL,
  PRIMARY KEY (`pronounsid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_scorekeepers`
--

DROP TABLE IF EXISTS `ww_scorekeepers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_scorekeepers` (
  `scorekeeperid` int(11) NOT NULL AUTO_INCREMENT,
  `scorekeeper` varchar(255) NOT NULL,
  `scorekeepergender` char(1) DEFAULT NULL,
  `scorekeeperslug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scorekeeperid`),
  KEY `scorekeeper` (`scorekeeper`),
  KEY `scorekeeperslug` (`scorekeeperslug`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showbluffmap`
--

DROP TABLE IF EXISTS `ww_showbluffmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showbluffmap` (
  `showbluffmapid` int(11) NOT NULL AUTO_INCREMENT,
  `showid` int(11) NOT NULL,
  `segment` int(11) NOT NULL DEFAULT 1,
  `chosenbluffpnlid` int(11) DEFAULT NULL,
  `correctbluffpnlid` int(11) DEFAULT NULL,
  PRIMARY KEY (`showbluffmapid`),
  KEY `wwshowbluffmap_wwshows_showid` (`showid`),
  KEY `wwshowbluffmap_correctbluffpnlid_wwpanelists_panelistid` (`correctbluffpnlid`),
  KEY `wwshowbluffmap_chosenbluffpnlid_wwpanelists_panelistid` (`chosenbluffpnlid`),
  CONSTRAINT `wwshowbluffmap_chosenbluffpnlid_wwpanelists_panelistid` FOREIGN KEY (`chosenbluffpnlid`) REFERENCES `ww_panelists` (`panelistid`),
  CONSTRAINT `wwshowbluffmap_correctbluffpnlid_wwpanelists_panelistid` FOREIGN KEY (`correctbluffpnlid`) REFERENCES `ww_panelists` (`panelistid`),
  CONSTRAINT `wwshowbluffmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=1562 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showdescriptions`
--

DROP TABLE IF EXISTS `ww_showdescriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showdescriptions` (
  `showid` int(11) NOT NULL,
  `showdescription` text DEFAULT NULL,
  PRIMARY KEY (`showid`),
  CONSTRAINT `wwshowdescriptions_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showguestmap`
--

DROP TABLE IF EXISTS `ww_showguestmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showguestmap` (
  `showguestmapid` int(11) NOT NULL AUTO_INCREMENT,
  `showid` int(11) NOT NULL,
  `guestid` int(11) NOT NULL,
  `guestscore` int(11) DEFAULT NULL,
  `exception` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`showguestmapid`),
  KEY `wwshowguestmap_wwshows_showid` (`showid`),
  KEY `wwshowguestmap_wwguests_guestid` (`guestid`),
  CONSTRAINT `wwshowguestmap_wwguests_guestid` FOREIGN KEY (`guestid`) REFERENCES `ww_guests` (`guestid`),
  CONSTRAINT `wwshowguestmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=2038 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showhostmap`
--

DROP TABLE IF EXISTS `ww_showhostmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showhostmap` (
  `showhostmapid` int(11) NOT NULL AUTO_INCREMENT,
  `showid` int(11) NOT NULL,
  `hostid` int(11) NOT NULL DEFAULT 6,
  `guest` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`showhostmapid`),
  KEY `wwshowhostmap_wwshows_showid` (`showid`),
  KEY `wwshowhostmap_wwhosts_hostid` (`hostid`),
  CONSTRAINT `wwshowhostmap_wwhosts_hostid` FOREIGN KEY (`hostid`) REFERENCES `ww_hosts` (`hostid`),
  CONSTRAINT `wwshowhostmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=1505 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showlocationmap`
--

DROP TABLE IF EXISTS `ww_showlocationmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showlocationmap` (
  `showlocationmapid` int(11) NOT NULL AUTO_INCREMENT,
  `showid` int(11) NOT NULL,
  `locationid` int(11) NOT NULL DEFAULT 3,
  PRIMARY KEY (`showlocationmapid`),
  KEY `ww_showlocationmap_showid` (`showid`),
  KEY `ww_showlocationmap_locationid` (`locationid`),
  CONSTRAINT `ww_showlocationmap_locationid` FOREIGN KEY (`locationid`) REFERENCES `ww_locations` (`locationid`),
  CONSTRAINT `ww_showlocationmap_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=1501 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_shownotes`
--

DROP TABLE IF EXISTS `ww_shownotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_shownotes` (
  `showid` int(11) NOT NULL,
  `shownotes` text DEFAULT NULL,
  PRIMARY KEY (`showid`),
  CONSTRAINT `wwshownotes_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showpnlmap`
--

DROP TABLE IF EXISTS `ww_showpnlmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showpnlmap` (
  `showpnlmapid` int(11) NOT NULL AUTO_INCREMENT,
  `showid` int(11) NOT NULL,
  `panelistid` int(11) NOT NULL,
  `panelistlrndstart` int(11) DEFAULT NULL,
  `panelistlrndstart_decimal` decimal(10,2) DEFAULT NULL,
  `panelistlrndcorrect` int(11) DEFAULT NULL,
  `panelistlrndcorrect_decimal` decimal(10,2) DEFAULT NULL,
  `panelistscore` int(11) DEFAULT NULL,
  `panelistscore_decimal` decimal(10,2) DEFAULT NULL,
  `showpnlrank` char(2) DEFAULT '',
  PRIMARY KEY (`showpnlmapid`),
  KEY `wwshowpnlmap_wwshows_showid` (`showid`),
  KEY `wwshowpnlmap_wwpanelists_panelistid` (`panelistid`),
  CONSTRAINT `wwshowpnlmap_wwpanelists_panelistid` FOREIGN KEY (`panelistid`) REFERENCES `ww_panelists` (`panelistid`),
  CONSTRAINT `wwshowpnlmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=6186 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_shows`
--

DROP TABLE IF EXISTS `ww_shows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_shows` (
  `showid` int(11) NOT NULL AUTO_INCREMENT,
  `showdate` date NOT NULL,
  `repeatshowid` int(11) DEFAULT NULL,
  `bestof` tinyint(1) NOT NULL DEFAULT 0,
  `bestofuniquebluff` tinyint(1) NOT NULL DEFAULT 0,
  `showurl` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`showid`),
  KEY `wwshows_repeatshowid_showid` (`repeatshowid`),
  CONSTRAINT `wwshows_repeatshowid_showid` FOREIGN KEY (`repeatshowid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=1503 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_showskmap`
--

DROP TABLE IF EXISTS `ww_showskmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_showskmap` (
  `showskmapid` int(11) NOT NULL AUTO_INCREMENT,
  `showid` int(11) NOT NULL,
  `scorekeeperid` int(11) NOT NULL DEFAULT 8,
  `guest` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`showskmapid`),
  KEY `wwshowskmap_wwshows_showid` (`showid`),
  KEY `wwshowskmap_wwscorekeepers_scorekeeperid` (`scorekeeperid`),
  CONSTRAINT `wwshowskmap_wwscorekeepers_scorekeeperid` FOREIGN KEY (`scorekeeperid`) REFERENCES `ww_scorekeepers` (`scorekeeperid`),
  CONSTRAINT `wwshowskmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB AUTO_INCREMENT=1500 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_skpronounsmap`
--

DROP TABLE IF EXISTS `ww_skpronounsmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_skpronounsmap` (
  `skpronounsmapid` int(11) NOT NULL AUTO_INCREMENT,
  `scorekeeperid` int(11) NOT NULL,
  `pronounsid` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`skpronounsmapid`),
  KEY `wwskpronounsmap_scorekeeperid_wwscorekeepers_scorekeeperid` (`scorekeeperid`),
  KEY `wwskpronounsmap_pronounsid_wwpronouns_pronounsid` (`pronounsid`),
  CONSTRAINT `wwskpronounsmap_pronounsid_wwpronouns_pronounsid` FOREIGN KEY (`pronounsid`) REFERENCES `ww_pronouns` (`pronounsid`),
  CONSTRAINT `wwskpronounsmap_scorekeeperid_wwscorekeepers_scorekeeperid` FOREIGN KEY (`scorekeeperid`) REFERENCES `ww_scorekeepers` (`scorekeeperid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_sksocialmap`
--

DROP TABLE IF EXISTS `ww_sksocialmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_sksocialmap` (
  `sksocialmapid` int(11) NOT NULL AUTO_INCREMENT,
  `scorekeeperid` int(11) NOT NULL,
  `socialmediaid` int(11) NOT NULL,
  `account` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  PRIMARY KEY (`sksocialmapid`),
  KEY `wwsksocialmap_scorekeeperid_wwscorekeeperss_scorekeeperid` (`scorekeeperid`),
  KEY `wwsksocialmap_socialmediaid_wwsocialmedia_soecialmediaid` (`socialmediaid`),
  CONSTRAINT `wwsksocialmap_scorekeeperid_wwscorekeepers_scorekeeperid` FOREIGN KEY (`scorekeeperid`) REFERENCES `ww_scorekeepers` (`scorekeeperid`),
  CONSTRAINT `wwsksocialmap_socialmediaid_wwsocialmedia_soecialmediaid` FOREIGN KEY (`socialmediaid`) REFERENCES `ww_social_media` (`socialmediaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ww_social_media`
--

DROP TABLE IF EXISTS `ww_social_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ww_social_media` (
  `socialmediaid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`socialmediaid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;
