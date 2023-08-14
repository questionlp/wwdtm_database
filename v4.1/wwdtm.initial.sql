-- -*- coding: utf-8 -*-
-- Copyright (c) 2018-2023 Linh Pham
-- wwdtm_database is released under the terms of the Apache License 2.0

-- Wait Wait... Don't Tell Me! Stats Page Version 4
-- Initial Database Structure for Version 4.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Table structure for table `ww_guests`
-- ------------------------------------------------------------

CREATE TABLE `ww_guests` (
  `guestid` int(11) NOT NULL AUTO_INCREMENT,
  `guest` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guestslug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`guestid`),
  KEY `guest` (`guest`),
  KEY `guestslug` (`guestslug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- Table structure for table `ww_hosts`
-- ------------------------------------------------------------

CREATE TABLE `ww_hosts` (
  `hostid` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hostgender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hostslug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`hostid`),
  KEY `host` (`host`),
  KEY `hostslug` (`hostslug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Table structure for table `ww_locations`
-- ------------------------------------------------------------

CREATE TABLE `ww_locations` (
  `locationid` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(3) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `venue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `locationslug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`locationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Table structure for table `ww_panelists`
-- ------------------------------------------------------------

CREATE TABLE `ww_panelists` (
  `panelistid` int(11) NOT NULL AUTO_INCREMENT,
  `panelist` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `panelistgender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `panelistslug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`panelistid`),
  KEY `panelist` (`panelist`),
  KEY `panelistslug` (`panelistslug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Table structure for table `ww_scorekeepers`
-- ------------------------------------------------------------

CREATE TABLE `ww_scorekeepers` (
  `scorekeeperid` int(11) NOT NULL AUTO_INCREMENT,
  `scorekeeper` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scorekeepergender` char(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scorekeeperslug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`scorekeeperid`),
  KEY `scorekeeper` (`scorekeeper`),
  KEY `scorekeeperslug` (`scorekeeperslug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Table structure for table `ww_showbluffmap`
-- ------------------------------------------------------------

CREATE TABLE `ww_showbluffmap` (
  `showbluffmapid` int(11) NOT NULL AUTO_INCREMENT,
  `showid` int(11) NOT NULL,
  `chosenbluffpnlid` int(11) DEFAULT NULL,
  `correctbluffpnlid` int(11) DEFAULT NULL,
  PRIMARY KEY (`showbluffmapid`),
  KEY `wwshowbluffmap_wwshows_showid` (`showid`),
  KEY `wwshowbluffmap_correctbluffpnlid_wwpanelists_panelistid` (`correctbluffpnlid`),
  KEY `wwshowbluffmap_chosenbluffpnlid_wwpanelists_panelistid` (`chosenbluffpnlid`),
  CONSTRAINT `wwshowbluffmap_chosenbluffpnlid_wwpanelists_panelistid` FOREIGN KEY (`chosenbluffpnlid`) REFERENCES `ww_panelists` (`panelistid`),
  CONSTRAINT `wwshowbluffmap_correctbluffpnlid_wwpanelists_panelistid` FOREIGN KEY (`correctbluffpnlid`) REFERENCES `ww_panelists` (`panelistid`),
  CONSTRAINT `wwshowbluffmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Table structure for table `ww_showdescriptions`
-- ------------------------------------------------------------

CREATE TABLE `ww_showdescriptions` (
  `showid` int(11) NOT NULL,
  `showdescription` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`showid`),
  CONSTRAINT `wwshowdescriptions_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Table structure for table `ww_showguestmap`
-- ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Table structure for table `ww_showhostmap`
-- ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Table structure for table `ww_showlocationmap`
-- ------------------------------------------------------------

CREATE TABLE `ww_showlocationmap` (
  `showlocationmapid` int(11) NOT NULL AUTO_INCREMENT,
  `showid` int(11) NOT NULL,
  `locationid` int(11) NOT NULL DEFAULT 3,
  PRIMARY KEY (`showlocationmapid`),
  KEY `ww_showlocationmap_showid` (`showid`),
  KEY `ww_showlocationmap_locationid` (`locationid`),
  CONSTRAINT `ww_showlocationmap_locationid` FOREIGN KEY (`locationid`) REFERENCES `ww_locations` (`locationid`),
  CONSTRAINT `ww_showlocationmap_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Table structure for table `ww_shownotes`
-- ------------------------------------------------------------

CREATE TABLE `ww_shownotes` (
  `showid` int(11) NOT NULL,
  `shownotes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`showid`),
  CONSTRAINT `wwshownotes_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Table structure for table `ww_showpnlmap`
-- ------------------------------------------------------------

CREATE TABLE `ww_showpnlmap` (
  `showpnlmapid` int(11) NOT NULL AUTO_INCREMENT,
  `showid` int(11) NOT NULL,
  `panelistid` int(11) NOT NULL,
  `panelistlrndstart` int(11) DEFAULT NULL,
  `panelistlrndcorrect` int(11) DEFAULT NULL,
  `panelistscore` int(11) DEFAULT NULL,
  `showpnlrank` char(2) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`showpnlmapid`),
  KEY `wwshowpnlmap_wwshows_showid` (`showid`),
  KEY `wwshowpnlmap_wwpanelists_panelistid` (`panelistid`),
  CONSTRAINT `wwshowpnlmap_wwpanelists_panelistid` FOREIGN KEY (`panelistid`) REFERENCES `ww_panelists` (`panelistid`),
  CONSTRAINT `wwshowpnlmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Table structure for table `ww_shows`
-- ------------------------------------------------------------

CREATE TABLE `ww_shows` (
  `showid` int(11) NOT NULL AUTO_INCREMENT,
  `showdate` date NOT NULL,
  `repeatshowid` int(11) DEFAULT NULL,
  `bestof` tinyint(1) NOT NULL DEFAULT 0,
  `bestofuniquebluff` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`showid`),
  KEY `wwshows_repeatshowid_showid` (`repeatshowid`),
  CONSTRAINT `wwshows_repeatshowid_showid` FOREIGN KEY (`repeatshowid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;


-- Table structure for table `ww_showskmap`
-- ------------------------------------------------------------

CREATE TABLE `ww_showskmap` (
  `showskmapid` int(11) NOT NULL AUTO_INCREMENT,
  `showid` int(11) NOT NULL,
  `scorekeeperid` int(11) NOT NULL DEFAULT 8,
  `guest` tinyint(1) NOT NULL DEFAULT 0,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`showskmapid`),
  KEY `wwshowskmap_wwshows_showid` (`showid`),
  KEY `wwshowskmap_wwscorekeepers_scorekeeperid` (`scorekeeperid`),
  CONSTRAINT `wwshowskmap_wwscorekeepers_scorekeeperid` FOREIGN KEY (`scorekeeperid`) REFERENCES `ww_scorekeepers` (`scorekeeperid`),
  CONSTRAINT `wwshowskmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE utf8mb4_unicode_ci;


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
