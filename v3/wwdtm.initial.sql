-- -*- coding: utf-8 -*-
-- Copyright (c) 2018-2020 Linh Pham
-- wwdtm_database is relased under the terms of the Apache License 2.0

-- Wait Wait... Don't Tell Me! Stats Page Version 3
-- Initial Database Structure

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- View structure for view `v_ww_graphdata_minmaxscores`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_graphdata_minmaxscores` (
   `min` INT(11) NULL DEFAULT NULL,
   `max` INT(11) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_graphdata_panelistswithscore`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_graphdata_panelistswithscore` (
   `panelistid` INT(11) NOT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_guestdetails`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_guestdetails` (
   `showid` INT(11) NOT NULL,
   `guestid` INT(11) NOT NULL DEFAULT '0',
   `guest` VARCHAR(255) NOT NULL,
   `guestscore` INT(11) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_guestscores_bydate`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_guestscores_bydate` (
   `showdate` DATE NOT NULL,
   `guest` VARCHAR(255) NOT NULL,
   `guestscore` INT(11) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_hosts`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_hosts` (
   `showdate` DATE NOT NULL,
   `host` VARCHAR(255) NOT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelist_appearance_fl`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelist_appearance_fl` (
   `panelist` VARCHAR(255) NOT NULL,
   `first` DATE NULL DEFAULT NULL,
   `latest` DATE NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelist_distinct_scores`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelist_distinct_scores` (
   `showid` INT(11) NOT NULL DEFAULT '0',
   `showdate` DATE NOT NULL,
   `hostid` INT(11) NOT NULL DEFAULT '0',
   `host` VARCHAR(255) NOT NULL,
   `scorekeeperid` INT(11) NOT NULL DEFAULT '0',
   `scorekeeper` VARCHAR(255) NOT NULL,
   `distinct_start` BIGINT(21) NOT NULL DEFAULT '0',
   `scores` MEDIUMTEXT NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelistdetails`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelistdetails` (
   `showid` INT(11) NOT NULL,
   `panelist` VARCHAR(255) NOT NULL,
   `panelistscore` INT(11) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelistdetails_withdates`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelistdetails_withdates` (
   `showdate` DATE NOT NULL,
   `panelist` VARCHAR(255) NOT NULL,
   `panelistscore` INT(11) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelistranks`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelistranks` (
   `panelist` VARCHAR(255) NOT NULL,
   `showpnlrank` CHAR(2) NULL DEFAULT '',
   `showpnlrank_count` BIGINT(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelistranks_norepeats`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelistranks_norepeats` (
   `panelist` VARCHAR(255) NOT NULL,
   `showpnlrank` CHAR(2) NULL DEFAULT '',
   `showpnlrank_count` BIGINT(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelists_firstortied`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelists_firstortied` (
   `Panelist` VARCHAR(255) NOT NULL,
   `Show` DATE NULL DEFAULT NULL,
   `Score` INT(11) NULL DEFAULT NULL,
   `Position` CHAR(2) NULL DEFAULT ''
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelists_firstplace`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelists_firstplace` (
   `Panelist` VARCHAR(255) NOT NULL,
   `Show` DATE NULL DEFAULT NULL,
   `Score` INT(11) NULL DEFAULT NULL,
   `Position` CHAR(2) NULL DEFAULT ''
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelists_lrnd_threewaytie`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelists_lrnd_threewaytie` (
   `showdate` DATE NOT NULL,
   `host` VARCHAR(255) NOT NULL,
   `scorekeeper` VARCHAR(255) NOT NULL,
   `panelist` VARCHAR(255) NOT NULL,
   `panelistlrndstart` INT(11) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelistscore_basic`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelistscore_basic` (
   `panelist` VARCHAR(255) NOT NULL,
   `panelistscore` INT(11) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelistscore_breakdown`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelistscore_breakdown` (
   `panelist` VARCHAR(255) NOT NULL,
   `panelistscore` INT(11) NULL DEFAULT NULL,
   `panelistscorecount` BIGINT(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelistscore_detailed`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelistscore_detailed` (
   `showpnlmapid` INT(11) NOT NULL DEFAULT '0',
   `showid` INT(11) NOT NULL,
   `showdate` DATE NOT NULL,
   `panelist` VARCHAR(255) NOT NULL,
   `panelistscore` INT(11) NULL DEFAULT NULL,
   `showpnlrank` CHAR(2) NULL DEFAULT ''
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelistscore_detailed_norepeats`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelistscore_detailed_norepeats` (
   `showpnlmapid` INT(11) NOT NULL DEFAULT '0',
   `showid` INT(11) NOT NULL,
   `showdate` DATE NOT NULL,
   `panelist` VARCHAR(255) NOT NULL,
   `panelistscore` INT(11) NULL DEFAULT NULL,
   `showpnlrank` CHAR(2) NULL DEFAULT ''
) ENGINE=MyISAM;


-- View structure for view `v_ww_panelistscores_bydate`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_panelistscores_bydate` (
   `showdate` DATE NOT NULL,
   `panelist` VARCHAR(255) NOT NULL,
   `panelistscore` INT(11) NULL DEFAULT NULL,
   `showpnlrank` CHAR(2) NULL DEFAULT '',
   `panelistprelrndscore` INT(11) NULL DEFAULT NULL,
   `panelistlrndcorrect` INT(11) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_scorekeepers`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_scorekeepers` (
   `showdate` DATE NOT NULL,
   `scorekeeper` VARCHAR(255) NOT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_showdates`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_showdates` (
   `showdate` DATE NOT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_showdescriptions`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_showdescriptions` (
   `showdate` DATE NOT NULL,
   `showdescription` TEXT NULL DEFAULT NULL,
   `shownotes` TEXT NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_showdetails`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_showdetails` (
   `showid` INT(11) NOT NULL DEFAULT '0',
   `showdate` DATE NOT NULL,
   `showdescription` TEXT NULL DEFAULT NULL,
   `host` VARCHAR(255) NOT NULL,
   `scorekeeper` VARCHAR(255) NOT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_showinfo`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_showinfo` (
   `showdate` DATE NOT NULL,
   `showdescription` TEXT NULL DEFAULT NULL,
   `bestof` TINYINT(1) NOT NULL DEFAULT '0',
   `showrating` TINYINT(4) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_showinfo_withyear`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_showinfo_withyear` (
   `showyear` INT(4) NULL DEFAULT NULL,
   `showdate` DATE NOT NULL,
   `showdescription` TEXT NULL DEFAULT NULL,
   `shownotes` TEXT NULL DEFAULT NULL,
   `bestof` TINYINT(1) NOT NULL DEFAULT '0',
   `showrating` TINYINT(4) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_showyears`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_showyears` (
   `showyear` INT(4) NULL DEFAULT NULL
) ENGINE=MyISAM;


-- View structure for view `v_ww_winningscorespread`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_winningscorespread` (
   `score` INT(11) NULL DEFAULT NULL,
   `scorecount` BIGINT(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;


-- View structure for view `v_ww_winningscorespread_withties`
-- ------------------------------------------------------------

CREATE TABLE `v_ww_winningscorespread_withties` (
   `score` INT(11) NULL DEFAULT NULL,
   `scorecount` BIGINT(21) NOT NULL DEFAULT '0'
) ENGINE=MyISAM;


-- Table structure for table `ww_guests`
-- ------------------------------------------------------------

CREATE TABLE `ww_guests` (
  `guestid` int(11) NOT NULL AUTO_INCREMENT,
  `guest` varchar(255) NOT NULL,
  `guestslug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guestid`),
  KEY `guest` (`guest`),
  KEY `guestslug` (`guestslug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table structure for table `ww_hosts`
-- ------------------------------------------------------------

CREATE TABLE `ww_hosts` (
  `hostid` int(11) NOT NULL AUTO_INCREMENT,
  `host` varchar(255) NOT NULL,
  `hostgender` char(1) DEFAULT NULL,
  `hostslug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`hostid`),
  KEY `host` (`host`),
  KEY `hostslug` (`hostslug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table structure for table `ww_locations`
-- ------------------------------------------------------------

CREATE TABLE `ww_locations` (
  `locationid` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(3) DEFAULT NULL,
  `venue` varchar(255) DEFAULT NULL,
  `locationslug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`locationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table structure for table `ww_panelists`
-- ------------------------------------------------------------

CREATE TABLE `ww_panelists` (
  `panelistid` int(11) NOT NULL AUTO_INCREMENT,
  `panelist` varchar(255) NOT NULL,
  `panelistgender` char(1) DEFAULT NULL,
  `panelistslug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`panelistid`),
  KEY `panelist` (`panelist`),
  KEY `panelistslug` (`panelistslug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table structure for table `ww_scorekeepers`
-- ------------------------------------------------------------

CREATE TABLE `ww_scorekeepers` (
  `scorekeeperid` int(11) NOT NULL AUTO_INCREMENT,
  `scorekeeper` varchar(255) NOT NULL,
  `scorekeepergender` char(1) DEFAULT NULL,
  `scorekeeperslug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`scorekeeperid`),
  KEY `scorekeeper` (`scorekeeper`),
  KEY `scorekeeperslug` (`scorekeeperslug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table structure for table `ww_showdescriptions`
-- ------------------------------------------------------------

CREATE TABLE `ww_showdescriptions` (
  `showid` int(11) NOT NULL,
  `showdescription` text DEFAULT NULL,
  PRIMARY KEY (`showid`),
  CONSTRAINT `wwshowdescriptions_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table structure for table `ww_shownotes`
-- ------------------------------------------------------------

CREATE TABLE `ww_shownotes` (
  `showid` int(11) NOT NULL,
  `shownotes` text DEFAULT NULL,
  PRIMARY KEY (`showid`),
  CONSTRAINT `wwshownotes_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table structure for table `ww_showpnlmap`
-- ------------------------------------------------------------

CREATE TABLE `ww_showpnlmap` (
  `showpnlmapid` int(11) NOT NULL AUTO_INCREMENT,
  `showid` int(11) NOT NULL,
  `panelistid` int(11) NOT NULL,
  `panelistlrndstart` int(11) DEFAULT NULL,
  `panelistlrndcorrect` int(11) DEFAULT NULL,
  `panelistscore` int(11) DEFAULT NULL,
  `showpnlrank` char(2) DEFAULT '',
  PRIMARY KEY (`showpnlmapid`),
  KEY `wwshowpnlmap_wwshows_showid` (`showid`),
  KEY `wwshowpnlmap_wwpanelists_panelistid` (`panelistid`),
  CONSTRAINT `wwshowpnlmap_wwpanelists_panelistid` FOREIGN KEY (`panelistid`) REFERENCES `ww_panelists` (`panelistid`),
  CONSTRAINT `wwshowpnlmap_wwshows_showid` FOREIGN KEY (`showid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table structure for table `ww_shows`
-- ------------------------------------------------------------

CREATE TABLE `ww_shows` (
  `showid` int(11) NOT NULL AUTO_INCREMENT,
  `showdate` date NOT NULL,
  `repeatshowid` int(11) DEFAULT NULL,
  `showrating` tinyint(4) DEFAULT NULL,
  `bestof` tinyint(1) NOT NULL DEFAULT 0,
  `bestofuniquebluff` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`showid`),
  KEY `wwshows_repeatshowid_showid` (`repeatshowid`),
  CONSTRAINT `wwshows_repeatshowid_showid` FOREIGN KEY (`repeatshowid`) REFERENCES `ww_shows` (`showid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Table structure for table `ww_showskmap`
-- ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


-- Replace placeholder table for `v_ww_panelistdetails` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelistdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelistdetails`
AS SELECT
   `pm`.`showid` AS `showid`,
   `p`.`panelist` AS `panelist`,
   `pm`.`panelistscore` AS `panelistscore`
FROM (`ww_showpnlmap` `pm` join `ww_panelists` `p` on(`pm`.`panelistid` = `p`.`panelistid`)) order by `pm`.`panelistscore` desc,`pm`.`showpnlmapid`;


-- Replace placeholder table for `v_ww_showinfo_withyear` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_showinfo_withyear`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_showinfo_withyear`
AS SELECT
   year(`s`.`showdate`) AS `showyear`,
   `s`.`showdate` AS `showdate`,
   `sd`.`showdescription` AS `showdescription`,
   `sn`.`shownotes` AS `shownotes`,
   `s`.`bestof` AS `bestof`,
   `s`.`showrating` AS `showrating`
FROM ((`ww_shows` `s` join `ww_showdescriptions` `sd` on(`sd`.`showid` = `s`.`showid`)) join `ww_shownotes` `sn` on(`sn`.`showid` = `s`.`showid`)) order by `s`.`showdate`;


-- Replace placeholder table for `v_ww_winningscorespread` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_winningscorespread`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_winningscorespread`
AS SELECT
   `pm`.`panelistscore` AS `score`,count(`pm`.`panelistscore`) AS `scorecount`
FROM (`ww_showpnlmap` `pm` join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) where `pm`.`showpnlrank` = '1' and `s`.`repeatshowid` is null group by `pm`.`panelistscore` order by `pm`.`panelistscore`;


-- Replace placeholder table for `v_ww_panelist_appearance_fl` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelist_appearance_fl`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelist_appearance_fl`
AS SELECT
   `p`.`panelist` AS `panelist`,min(`s`.`showdate`) AS `first`,max(`s`.`showdate`) AS `latest`
FROM ((`ww_panelists` `p` join `ww_showpnlmap` `pm` on(`pm`.`panelistid` = `p`.`panelistid`)) join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) where `p`.`panelistid` <> 17 and `s`.`bestof` = 0 and `s`.`repeatshowid` is null group by `p`.`panelist` order by `p`.`panelist`;


-- Replace placeholder table for `v_ww_panelistranks` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelistranks`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelistranks`
AS SELECT
   `v_ww_panelistscore_detailed`.`panelist` AS `panelist`,
   `v_ww_panelistscore_detailed`.`showpnlrank` AS `showpnlrank`,count(`v_ww_panelistscore_detailed`.`showpnlrank`) AS `showpnlrank_count`
FROM `v_ww_panelistscore_detailed` group by `v_ww_panelistscore_detailed`.`showpnlrank`,`v_ww_panelistscore_detailed`.`panelist` order by `v_ww_panelistscore_detailed`.`panelist`,`v_ww_panelistscore_detailed`.`showpnlrank`;


-- Replace placeholder table for `v_ww_panelists_firstplace` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelists_firstplace`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelists_firstplace`
AS SELECT
   `p`.`panelist` AS `Panelist`,max(`s`.`showdate`) AS `Show`,
   `pm`.`panelistscore` AS `Score`,
   `pm`.`showpnlrank` AS `Position`
FROM ((`ww_showpnlmap` `pm` join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) join `ww_panelists` `p` on(`pm`.`panelistid` = `p`.`panelistid`)) where `pm`.`showpnlrank` = '1' and `s`.`bestof` = 0 and `s`.`repeatshowid` is null group by `p`.`panelist`;


-- Replace placeholder table for `v_ww_showdescriptions` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_showdescriptions`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_showdescriptions`
AS SELECT
   `s`.`showdate` AS `showdate`,
   `sd`.`showdescription` AS `showdescription`,
   `sn`.`shownotes` AS `shownotes`
FROM ((`ww_showdescriptions` `sd` join `ww_shows` `s` on(`sd`.`showid` = `s`.`showid`)) join `ww_shownotes` `sn` on(`sn`.`showid` = `s`.`showid`)) order by `s`.`showdate`;


-- Replace placeholder table for `v_ww_hosts with correct` view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_hosts`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_hosts`
AS SELECT
   `s`.`showdate` AS `showdate`,
   `h`.`host` AS `host`
FROM ((`ww_shows` `s` join `ww_showhostmap` `hm` on(`hm`.`showid` = `s`.`showid`)) join `ww_hosts` `h` on(`h`.`hostid` = `hm`.`hostid`)) order by `s`.`showdate`;


-- Replace placeholder table for `v_ww_panelistscore_detailed_norepeats` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelistscore_detailed_norepeats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelistscore_detailed_norepeats`
AS SELECT
   `pm`.`showpnlmapid` AS `showpnlmapid`,
   `pm`.`showid` AS `showid`,
   `s`.`showdate` AS `showdate`,
   `p`.`panelist` AS `panelist`,
   `pm`.`panelistscore` AS `panelistscore`,
   `pm`.`showpnlrank` AS `showpnlrank`
FROM ((`ww_showpnlmap` `pm` join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) join `ww_panelists` `p` on(`pm`.`panelistid` = `p`.`panelistid`)) where `pm`.`panelistscore` is not null and `s`.`repeatshowid` is null order by `s`.`showdate`,`pm`.`panelistscore` desc,`pm`.`showpnlmapid`;


-- Replace placeholder table for `v_ww_panelists_firstortied` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelists_firstortied`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelists_firstortied`
AS SELECT
   `p`.`panelist` AS `Panelist`,max(`s`.`showdate`) AS `Show`,
   `pm`.`panelistscore` AS `Score`,
   `pm`.`showpnlrank` AS `Position`
FROM ((`ww_showpnlmap` `pm` join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) join `ww_panelists` `p` on(`pm`.`panelistid` = `p`.`panelistid`)) where `pm`.`showpnlrank` in ('1','1t') and `s`.`bestof` = 0 and `s`.`repeatshowid` is null group by `p`.`panelist`;


-- Replace placeholder table for `v_ww_winningscorespread_withties` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_winningscorespread_withties`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_winningscorespread_withties`
AS SELECT
   `pm`.`panelistscore` AS `score`,count(`pm`.`panelistscore`) AS `scorecount`
FROM (`ww_showpnlmap` `pm` join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) where `pm`.`showpnlrank` in ('1','1t') and `s`.`repeatshowid` is null group by `pm`.`panelistscore` order by `pm`.`panelistscore`;


-- Replace placeholder table for `v_ww_panelistscore_detailed` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelistscore_detailed`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelistscore_detailed`
AS SELECT
   `pm`.`showpnlmapid` AS `showpnlmapid`,
   `pm`.`showid` AS `showid`,
   `s`.`showdate` AS `showdate`,
   `p`.`panelist` AS `panelist`,
   `pm`.`panelistscore` AS `panelistscore`,
   `pm`.`showpnlrank` AS `showpnlrank`
FROM ((`ww_showpnlmap` `pm` join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) join `ww_panelists` `p` on(`pm`.`panelistid` = `p`.`panelistid`)) where `pm`.`panelistscore` is not null order by `s`.`showdate`,`pm`.`panelistscore` desc,`pm`.`showpnlmapid`;


-- Replace placeholder table for `v_ww_guestdetails` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_guestdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_guestdetails`
AS SELECT
   `gm`.`showid` AS `showid`,
   `g`.`guestid` AS `guestid`,
   `g`.`guest` AS `guest`,
   `gm`.`guestscore` AS `guestscore`
FROM (`ww_showguestmap` `gm` join `ww_guests` `g` on(`gm`.`guestid` = `g`.`guestid`)) order by `gm`.`showguestmapid`;


-- Replace placeholder table for `v_ww_panelistscores_bydate` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelistscores_bydate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelistscores_bydate`
AS SELECT
   `s`.`showdate` AS `showdate`,
   `p`.`panelist` AS `panelist`,
   `pm`.`panelistscore` AS `panelistscore`,
   `pm`.`showpnlrank` AS `showpnlrank`,
   `pm`.`panelistlrndstart` AS `panelistprelrndscore`,
   `pm`.`panelistlrndcorrect` AS `panelistlrndcorrect`
FROM ((`ww_showpnlmap` `pm` join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) join `ww_panelists` `p` on(`pm`.`panelistid` = `p`.`panelistid`)) order by `s`.`showdate`,`pm`.`panelistscore` desc,`pm`.`showpnlmapid`;


-- Replace placeholder table for `v_ww_panelistscore_basic` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelistscore_basic`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelistscore_basic`
AS SELECT
   `p`.`panelist` AS `panelist`,
   `pm`.`panelistscore` AS `panelistscore`
FROM ((`ww_showpnlmap` `pm` join `ww_panelists` `p` on(`pm`.`panelistid` = `p`.`panelistid`)) join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) where `pm`.`panelistid` <> 17 and `s`.`bestof` <> 1 and `s`.`repeatshowid` is null and `pm`.`panelistscore` is not null order by `p`.`panelist`,`pm`.`panelistscore`;


-- Replace placeholder table for `v_ww_guestscores_bydate` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_guestscores_bydate`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_guestscores_bydate`
AS SELECT
   `s`.`showdate` AS `showdate`,
   `g`.`guest` AS `guest`,
   `gm`.`guestscore` AS `guestscore`
FROM ((`ww_showguestmap` `gm` join `ww_shows` `s` on(`gm`.`showid` = `s`.`showid`)) join `ww_guests` `g` on(`gm`.`guestid` = `g`.`guestid`)) order by `s`.`showdate`,`gm`.`showguestmapid`;


-- Replace placeholder table for `v_ww_scorekeepers` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_scorekeepers`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_scorekeepers`
AS SELECT
   `s`.`showdate` AS `showdate`,
   `sc`.`scorekeeper` AS `scorekeeper`
FROM ((`ww_shows` `s` join `ww_showskmap` `skm` on(`skm`.`showid` = `s`.`showid`)) join `ww_scorekeepers` `sc` on(`skm`.`scorekeeperid` = `sc`.`scorekeeperid`)) order by `s`.`showdate`;


-- Replace placeholder table for `v_ww_showdates` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_showdates`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_showdates`
AS SELECT
   `ww_shows`.`showdate` AS `showdate`
FROM `ww_shows` order by `ww_shows`.`showdate`;


-- Replace placeholder table for `v_ww_showdetails` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_showdetails`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_showdetails`
AS SELECT
   `s`.`showid` AS `showid`,
   `s`.`showdate` AS `showdate`,
   `sd`.`showdescription` AS `showdescription`,
   `h`.`host` AS `host`,
   `sc`.`scorekeeper` AS `scorekeeper`
FROM (((((`ww_shows` `s` join `ww_showhostmap` `hm` on(`hm`.`showid` = `s`.`showid`)) join `ww_showskmap` `skm` on(`skm`.`showid` = `s`.`showid`)) join `ww_hosts` `h` on(`hm`.`hostid` = `h`.`hostid`)) join `ww_scorekeepers` `sc` on(`skm`.`scorekeeperid` = `sc`.`scorekeeperid`)) join `ww_showdescriptions` `sd` on(`sd`.`showid` = `s`.`showid`)) order by `s`.`showdate`;


-- Replace placeholder table for `v_ww_panelistranks_norepeats` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelistranks_norepeats`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelistranks_norepeats`
AS SELECT
   `v_ww_panelistscore_detailed_norepeats`.`panelist` AS `panelist`,
   `v_ww_panelistscore_detailed_norepeats`.`showpnlrank` AS `showpnlrank`,count(`v_ww_panelistscore_detailed_norepeats`.`showpnlrank`) AS `showpnlrank_count`
FROM `v_ww_panelistscore_detailed_norepeats` group by `v_ww_panelistscore_detailed_norepeats`.`showpnlrank`,`v_ww_panelistscore_detailed_norepeats`.`panelist` order by `v_ww_panelistscore_detailed_norepeats`.`panelist`,`v_ww_panelistscore_detailed_norepeats`.`showpnlrank`;


-- Replace placeholder table for `v_ww_graphdata_panelistswithscore` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_graphdata_panelistswithscore`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_graphdata_panelistswithscore`
AS SELECT
   distinct `pm`.`panelistid` AS `panelistid`
FROM ((`ww_showpnlmap` `pm` join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) join `ww_panelists` `p` on(`pm`.`panelistid` = `p`.`panelistid`)) where `pm`.`panelistscore` is not null and `s`.`bestof` = 0 and `s`.`repeatshowid` is null order by `p`.`panelist`;


-- Replace placeholder table for `v_ww_panelists_lrnd_threewaytie` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelists_lrnd_threewaytie`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelists_lrnd_threewaytie`
AS SELECT
   `s`.`showdate` AS `showdate`,
   `h`.`host` AS `host`,
   `sk`.`scorekeeper` AS `scorekeeper`,
   `p`.`panelist` AS `panelist`,
   `pm`.`panelistlrndstart` AS `panelistlrndstart`
FROM ((((((`ww_showpnlmap` `pm` join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) join `ww_panelists` `p` on(`pm`.`panelistid` = `p`.`panelistid`)) join `ww_showhostmap` `hm` on(`s`.`showid` = `hm`.`showid`)) join `ww_hosts` `h` on(`hm`.`hostid` = `h`.`hostid`)) join `ww_showskmap` `skm` on(`s`.`showid` = `skm`.`showid`)) join `ww_scorekeepers` `sk` on(`skm`.`scorekeeperid` = `sk`.`scorekeeperid`)) where `s`.`bestof` = 0 and `s`.`repeatshowid` is null and `s`.`showid` in (select `vwp`.`showid` from `v_ww_panelist_distinct_scores` `vwp` where `vwp`.`distinct_start` = 1) order by `s`.`showdate`;


-- Replace placeholder table for `v_ww_panelist_distinct_scores` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelist_distinct_scores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelist_distinct_scores`
AS SELECT
   `s`.`showid` AS `showid`,
   `s`.`showdate` AS `showdate`,
   `h`.`hostid` AS `hostid`,
   `h`.`host` AS `host`,
   `sk`.`scorekeeperid` AS `scorekeeperid`,
   `sk`.`scorekeeper` AS `scorekeeper`,count(distinct `pm`.`panelistlrndstart`) AS `distinct_start`,group_concat(`pm`.`panelistlrndstart` separator ',') AS `scores`
FROM (((((`ww_showpnlmap` `pm` join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) join `ww_showskmap` `skm` on(`pm`.`showid` = `skm`.`showid`)) join `ww_scorekeepers` `sk` on(`skm`.`scorekeeperid` = `sk`.`scorekeeperid`)) join `ww_showhostmap` `hm` on(`pm`.`showid` = `hm`.`showid`)) join `ww_hosts` `h` on(`hm`.`hostid` = `h`.`hostid`)) where `s`.`bestof` = 0 and `s`.`repeatshowid` is null and `pm`.`panelistlrndstart` is not null group by `s`.`showdate` order by `s`.`showdate`;


-- Replace placeholder table for `v_ww_graphdata_minmaxscores` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_graphdata_minmaxscores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_graphdata_minmaxscores`
AS SELECT
   min(`ww_showpnlmap`.`panelistscore`) AS `min`,max(`ww_showpnlmap`.`panelistscore`) AS `max`
FROM `ww_showpnlmap`;


-- Replace placeholder table for `v_ww_panelistdetails_withdates` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelistdetails_withdates`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelistdetails_withdates`
AS SELECT
   `s`.`showdate` AS `showdate`,
   `p`.`panelist` AS `panelist`,
   `pm`.`panelistscore` AS `panelistscore`
FROM ((`ww_showpnlmap` `pm` join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) join `ww_panelists` `p` on(`pm`.`panelistid` = `p`.`panelistid`)) order by `pm`.`panelistscore`,`pm`.`showpnlmapid`;


-- Replace placeholder table for `v_ww_panelistscore_breakdown` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_panelistscore_breakdown`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_panelistscore_breakdown`
AS SELECT
   `p`.`panelist` AS `panelist`,
   `pm`.`panelistscore` AS `panelistscore`,count(`pm`.`panelistscore`) AS `panelistscorecount`
FROM ((`ww_showpnlmap` `pm` join `ww_panelists` `p` on(`pm`.`panelistid` = `p`.`panelistid`)) join `ww_shows` `s` on(`pm`.`showid` = `s`.`showid`)) where `s`.`repeatshowid` is null and `pm`.`panelistscore` is not null group by `pm`.`panelistscore`,`p`.`panelist` order by `p`.`panelist`,`pm`.`panelistscore`;


-- Replace placeholder table for `v_ww_showinfo` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_showinfo`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_showinfo`
AS SELECT
   `s`.`showdate` AS `showdate`,
   `sd`.`showdescription` AS `showdescription`,
   `s`.`bestof` AS `bestof`,
   `s`.`showrating` AS `showrating`
FROM (`ww_shows` `s` join `ww_showdescriptions` `sd` on(`sd`.`showid` = `s`.`showid`)) order by `s`.`showdate`;


-- Replace placeholder table for `v_ww_showyears` with correct view syntax
-- ------------------------------------------------------------

DROP TABLE `v_ww_showyears`;

CREATE ALGORITHM=UNDEFINED DEFINER=`lpham`@`%` SQL SECURITY DEFINER VIEW `v_ww_showyears`
AS SELECT
   distinct year(`ww_shows`.`showdate`) AS `showyear`
FROM `ww_shows` order by year(`ww_shows`.`showdate`);


/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
