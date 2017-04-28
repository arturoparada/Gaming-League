-- MySQL dump 10.13  Distrib 5.7.12, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: gaming_league
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `games`
--

DROP TABLE IF EXISTS `games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `games` (
  `game_code` varchar(4) NOT NULL,
  `game_name` varchar(25) NOT NULL,
  `game_description` varchar(25) DEFAULT NULL,
  `other_details` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`game_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `games`
--

LOCK TABLES `games` WRITE;
/*!40000 ALTER TABLE `games` DISABLE KEYS */;
INSERT INTO `games` VALUES ('','',NULL,NULL),('G001','Gears of War 4','War, strategy','One of the bes sellers'),('G002','Assassins Creed','History, action-adventure','It has a comic book'),('G003','Grand Theft Auto V','Violence, gangs, action','Most sells in 2014'),('G004','FIFA 2017','Sports, competition','Most online played'),('G005','Halo 5','Futuristic, adventure','In first person'),('G006','Forza Motorsport 6','Cars, Speed','Only for Xbox One'),('G007','Call of Duty: Black Ops 3','War, action','Multi platform'),('G008','Forza Horizon 3','Cars, Speed','One of the bes sellers'),('G009','Battlefield: Hardline','War, adventure','Action role playing game'),('G010','Dark Souls III','Role playing','Satellite Award Best Action / Adventure Game');
/*!40000 ALTER TABLE `games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leagues`
--

DROP TABLE IF EXISTS `leagues`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leagues` (
  `league_id` varchar(4) NOT NULL,
  `league_name` varchar(20) NOT NULL,
  `league_details` varchar(45) NOT NULL,
  PRIMARY KEY (`league_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues`
--

LOCK TABLES `leagues` WRITE;
/*!40000 ALTER TABLE `leagues` DISABLE KEYS */;
INSERT INTO `leagues` VALUES ('','',''),('L001','Dark League','Multiplayer of Dark Souls'),('L002','Battlefield MP','Multiplayer of Battlefield'),('L003','Horizon League','Multiplayer of Forza Horizon'),('L004','CofD mega league','Multiplayer of Call of Dutty'),('L005','The speed league','Multiplayer of ForzaMotorsport'),('L006','HaloTournament','Multiplayer of Halo 5'),('L007','FIFA 2017','Multiplayer of FIFA 2017'),('L008','GTA V Online','Multiplayer of Grand theft auto'),('L009','The Brotherhood','Multiplayer of Assassins Creed'),('L010','GoW Online','Multiplayer of Gears of war');
/*!40000 ALTER TABLE `leagues` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leagues_games`
--

DROP TABLE IF EXISTS `leagues_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `leagues_games` (
  `league_id` varchar(4) DEFAULT NULL,
  `game_code` varchar(4) DEFAULT NULL,
  KEY `leagueid_fmLeagues_idx` (`league_id`),
  KEY `gamecd_fmGames_idx` (`game_code`),
  KEY `leagueid_idx` (`league_id`),
  CONSTRAINT `gamecode` FOREIGN KEY (`game_code`) REFERENCES `games` (`game_code`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `leagueid` FOREIGN KEY (`league_id`) REFERENCES `leagues` (`league_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leagues_games`
--

LOCK TABLES `leagues_games` WRITE;
/*!40000 ALTER TABLE `leagues_games` DISABLE KEYS */;
INSERT INTO `leagues_games` VALUES (NULL,NULL),('L001','G010'),('L002','G009'),('L003','G008'),('L004','G007'),('L005','G006'),('L006','G005'),('L007','G004'),('L008','G003'),('L009','G002'),('L010','G001');
/*!40000 ALTER TABLE `leagues_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matches` (
  `match_id` varchar(4) NOT NULL,
  `game_code` varchar(4) DEFAULT NULL,
  `player1_id` varchar(4) DEFAULT NULL,
  `player2_id` varchar(4) DEFAULT NULL,
  `match_date` date NOT NULL,
  `result` varchar(15) NOT NULL,
  `other_details` varchar(15) NOT NULL,
  PRIMARY KEY (`match_id`),
  KEY `codeGame_idx` (`game_code`),
  KEY `IDplayer1_idx` (`player1_id`),
  KEY `IDplayer2_idx` (`player2_id`),
  CONSTRAINT `IDplayer1` FOREIGN KEY (`player1_id`) REFERENCES `players` (`player_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `IDplayer2` FOREIGN KEY (`player2_id`) REFERENCES `players` (`player_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `codeGame` FOREIGN KEY (`game_code`) REFERENCES `games` (`game_code`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES ('',NULL,NULL,NULL,'0000-00-00','',''),('M001','G010','P001','P010','2017-04-03','player2 wins','First lap'),('M002','G009','P002','P009','2017-04-03','player1 wins','First lap'),('M003','G008','P003','P008','2017-04-04','player2 wins','First lap'),('M004','G007','P004','P007','2017-04-04','player1 wins','First lap'),('M005','G006','P005','P006','2017-04-05','player2 wins','First lap'),('M006','G005','P001','P010','2017-04-05','player2 wins','Final lap'),('M007','G004','P002','P009','2017-04-06','player2 wins','Final lap'),('M008','G003','P003','P008','2017-04-06','player1 wins','Final lap'),('M009','G002','P004','P007','2017-04-07','player1 wins','Final lap'),('M010','G001','P005','P006','2017-04-07','player1 wins','Final lap');
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `player_id` varchar(4) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `country` varchar(15) NOT NULL,
  `nickname` varchar(25) NOT NULL,
  PRIMARY KEY (`player_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES ('','','','','',''),('P001','Carlos','Ramirez','male','Espania','Ocelote'),('P002','Ana','Tellechea','female','Paris','thenglishteacher'),('P003','Arturo','Parada','male','Ukraine','r2d2 pk'),('P004','Matilde','Escobar','female','Colombia','skywoman'),('P005','Daniel','Silva','male','New Zealand','MopeyBrich71'),('P006','Cintya','Trujillo','female','Canada','JumperCrack'),('P007','Jesusandres','Lopez','male','Mexico','JEzvery'),('P008','Salma','Arkam','female','Morocco','moroccogirl123'),('P009','Flavio','Robles','male','Japan','lll DKFVS lll'),('P010','Haydee','Moreno','female','United Kingdom','haydeemorenog');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players_game_ranking`
--

DROP TABLE IF EXISTS `players_game_ranking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players_game_ranking` (
  `player_id` varchar(4) DEFAULT NULL,
  `game_code` varchar(4) DEFAULT NULL,
  `ranking` varchar(3) NOT NULL,
  KEY `playerid_fmplayers_idx` (`player_id`),
  KEY `gamecd_fmGames_idx` (`game_code`),
  CONSTRAINT `gamecd_fmGames` FOREIGN KEY (`game_code`) REFERENCES `games` (`game_code`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `playerid_fmPlayers` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players_game_ranking`
--

LOCK TABLES `players_game_ranking` WRITE;
/*!40000 ALTER TABLE `players_game_ranking` DISABLE KEYS */;
INSERT INTO `players_game_ranking` VALUES (NULL,NULL,''),('P002','G009','90'),('P004','G007','69'),('P006','G005','34'),('P008','G003','55'),('P010','G001','99'),('P009','G002','12'),('P007','G004','80'),('P005','G006','79'),('P003','G008','50'),('P001','G010','22');
/*!40000 ALTER TABLE `players_game_ranking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_players`
--

DROP TABLE IF EXISTS `team_players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_players` (
  `team_id` varchar(4) DEFAULT NULL,
  `player_id` varchar(4) DEFAULT NULL,
  `date_from` date NOT NULL,
  `date_to` date DEFAULT NULL,
  `other_details` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`date_from`),
  KEY `teamID_idx` (`team_id`),
  KEY `playerID_idx` (`player_id`),
  CONSTRAINT `playerID` FOREIGN KEY (`player_id`) REFERENCES `players` (`player_id`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `teamID` FOREIGN KEY (`team_id`) REFERENCES `teams` (`team_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_players`
--

LOCK TABLES `team_players` WRITE;
/*!40000 ALTER TABLE `team_players` DISABLE KEYS */;
INSERT INTO `team_players` VALUES (NULL,NULL,'0000-00-00',NULL,NULL),('T002','P003','1995-10-12','2016-10-12','Dissolved by conflicts'),('T004','P009','1999-07-28','2001-03-30','Host changed team'),('T010','P004','2000-04-11','2002-09-21','Bad working'),('T008','P006','2000-05-03','2008-02-29','Differences in the team'),('T006','P008','2005-11-01','2007-08-19','Conflicts with sponsors'),('T009','P002','2012-12-12',NULL,'More games won last year'),('T005','P007','2014-10-22',NULL,'Best paid'),('T001','P005','2015-01-02',NULL,'One of the best in GoW'),('T003','P001','2016-06-16',NULL,NULL),('T007','P010','2017-04-26',NULL,'Just started');
/*!40000 ALTER TABLE `team_players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `team_id` varchar(4) NOT NULL,
  `created_by` varchar(4) DEFAULT NULL,
  `team_name` varchar(15) NOT NULL,
  `date_created` date DEFAULT NULL,
  `date_disbaned` date DEFAULT NULL,
  `other_details` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`team_id`),
  KEY `createdby_playerid_idx` (`created_by`),
  CONSTRAINT `createdby_playerid` FOREIGN KEY (`created_by`) REFERENCES `players` (`player_id`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES ('','','',NULL,NULL,NULL),('T001','P005','Abomyzation','2015-01-02',NULL,'One of the best in GoW'),('T002','P003','Cannon','1995-10-12','2016-10-12','Dissolved by conflicts'),('T003','P001','DragonTeam','2016-06-16',NULL,NULL),('T004','P009','Bloodwrath','1999-07-28','2001-03-30','Host changed team'),('T005','P007','Chillwindx','2014-10-22',NULL,'Best paid'),('T006','P008','Darkfire','2005-11-01','2007-08-19','Conflicts with sponsors'),('T007','P010','Flamechampion','2017-04-26',NULL,'Just started'),('T008','P006','Grindelwald','2000-05-03','2008-02-29','Differences in the team'),('T009','P002','Hancock','2012-12-12',NULL,'More games won last year'),('T010','P004','Jumanji','2000-04-11','2002-09-21','Bad working');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-28  0:47:43
