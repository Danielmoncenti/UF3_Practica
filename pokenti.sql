-- MySQL dump 10.18  Distrib 10.3.27-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: pokenti
-- ------------------------------------------------------
-- Server version	10.3.27-MariaDB-0+deb10u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Temporary table structure for view `BoxAndStats`
--

DROP TABLE IF EXISTS `BoxAndStats`;
/*!50001 DROP VIEW IF EXISTS `BoxAndStats`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `BoxAndStats` (
  `id_caught` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `max_hp` tinyint NOT NULL,
  `attack` tinyint NOT NULL,
  `defense` tinyint NOT NULL,
  `special` tinyint NOT NULL,
  `agility` tinyint NOT NULL,
  `lvl` tinyint NOT NULL,
  `xp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `caught`
--

DROP TABLE IF EXISTS `caught`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caught` (
  `id_caught` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pokemon` int(10) unsigned NOT NULL,
  `id_stat` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_caught`),
  KEY `id_pokemon` (`id_pokemon`),
  KEY `id_stat` (`id_stat`),
  CONSTRAINT `caught_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemons` (`id_pokemon`),
  CONSTRAINT `caught_ibfk_2` FOREIGN KEY (`id_stat`) REFERENCES `stats` (`id_stat`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caught`
--

LOCK TABLES `caught` WRITE;
/*!40000 ALTER TABLE `caught` DISABLE KEYS */;
INSERT INTO `caught` VALUES (1,13,4),(2,8,7),(3,13,17),(4,9,5),(5,15,9),(6,11,10),(7,4,20),(8,3,8),(9,6,11),(10,9,13),(11,13,18),(12,15,12),(13,10,16),(14,5,15);
/*!40000 ALTER TABLE `caught` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evolutions`
--

DROP TABLE IF EXISTS `evolutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evolutions` (
  `id_evolution` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pokemon_to_evolve` int(10) unsigned NOT NULL,
  `id_pokemon_evolved` int(10) unsigned NOT NULL,
  `lvl_requirement` int(11) NOT NULL,
  PRIMARY KEY (`id_evolution`),
  KEY `id_pokemon_to_evolve` (`id_pokemon_to_evolve`),
  KEY `id_pokemon_evolved` (`id_pokemon_evolved`),
  CONSTRAINT `evolutions_ibfk_1` FOREIGN KEY (`id_pokemon_to_evolve`) REFERENCES `pokemons` (`id_pokemon`),
  CONSTRAINT `evolutions_ibfk_2` FOREIGN KEY (`id_pokemon_evolved`) REFERENCES `pokemons` (`id_pokemon`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evolutions`
--

LOCK TABLES `evolutions` WRITE;
/*!40000 ALTER TABLE `evolutions` DISABLE KEYS */;
INSERT INTO `evolutions` VALUES (1,1,4,16),(2,4,5,36);
/*!40000 ALTER TABLE `evolutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pokemons`
--

DROP TABLE IF EXISTS `pokemons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pokemons` (
  `id_pokemon` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `id_type1` int(10) unsigned NOT NULL,
  `id_type2` int(10) unsigned NOT NULL,
  `description` varchar(32) NOT NULL,
  `weight` int(11) NOT NULL,
  `height` int(11) NOT NULL,
  `pokedex_number` int(11) NOT NULL,
  PRIMARY KEY (`id_pokemon`),
  KEY `id_type1` (`id_type1`),
  KEY `id_type2` (`id_type2`),
  CONSTRAINT `pokemons_ibfk_1` FOREIGN KEY (`id_type1`) REFERENCES `types` (`id_type`),
  CONSTRAINT `pokemons_ibfk_2` FOREIGN KEY (`id_type2`) REFERENCES `types` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pokemons`
--

LOCK TABLES `pokemons` WRITE;
/*!40000 ALTER TABLE `pokemons` DISABLE KEYS */;
INSERT INTO `pokemons` VALUES (1,'Bulbasaur',4,13,'plantasaurio',5,2,7),(2,'Charmander',3,15,'lagartija',6,5,1),(3,'Squirtle',5,15,'tortuguilla',10,5,4),(4,'Ivysaur',4,13,'Floripondio',12,20,8),(5,'Venusaur',4,13,'Palmera',20,50,9),(6,'Wartortle',5,15,'tortuguilla de guerra',10,20,5),(7,'Blastoise',5,15,'tortugaza de guerra',100,30,6),(8,'Charmeleon',5,15,'lagartija grande',10,20,2),(9,'Charizard',5,1,'not a dragon',60,90,3),(10,'Pachirisu',14,15,'not pikachu',1,1,10),(11,'Raichu',14,15,'Fatass Pikachu',20,30,13),(12,'Jynx',9,15,'Lady GaGa',13,27,15),(13,'Pikachu',14,15,'Nintendo slave',13,5,12),(14,'Dunsparce',16,15,'Who s this?',3,3,11),(15,'Agumon',11,3,'NOT EVEN A POKEMON',20,20,14),(16,'Mewtwo',12,15,'niño probeta',30,60,16);
/*!40000 ALTER TABLE `pokemons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `pokemonstats`
--

DROP TABLE IF EXISTS `pokemonstats`;
/*!50001 DROP VIEW IF EXISTS `pokemonstats`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `pokemonstats` (
  `id_team` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `max_hp` tinyint NOT NULL,
  `actual_hp` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `id_stat` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `max_hp` int(11) NOT NULL,
  `actual_hp` int(11) NOT NULL,
  `lvl` int(11) NOT NULL,
  `xp` int(10) unsigned NOT NULL,
  `attack` int(11) NOT NULL,
  `defense` int(11) NOT NULL,
  `special` int(11) NOT NULL,
  `agility` int(11) NOT NULL,
  `shiny` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_stat`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES (1,450,450,100,1000000,50,80,300,80,0),(2,450,320,99,1000000,51,80,280,80,1),(3,89,89,20,5861,100,20,15,200,0),(4,125,125,36,12012,200,40,40,230,0),(5,40,25,5,200,20,40,40,10,0),(6,100,100,100,1000000,100,100,100,100,0),(7,80,10,2,40,6,10,12,3,1),(8,50,50,45,203146,500,200,20,20,0),(9,5,3,3,60,5,4,5,7,1),(10,70,58,90,135315,80,200,150,4,0),(11,90,90,90,183158,80,220,170,6,1),(12,65,65,20,1516,20,40,38,79,1),(13,89,63,33,32156,102,40,40,120,0),(14,800,2,100,2000000,500,300,300,800,0),(15,500,500,99,999999,99,86,84,3,1),(16,20,15,2,31,5,5,5,20,1),(17,135,135,82,165654,20,120,200,40,0),(18,40,30,15,516,20,80,20,100,0),(19,236,236,52,65164,48,63,23,220,1),(20,100,100,100,100,100,100,100,100,1);
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `id_team` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_pokemon` int(10) unsigned NOT NULL,
  `id_stat` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id_team`),
  KEY `id_pokemon` (`id_pokemon`),
  KEY `id_stat` (`id_stat`),
  CONSTRAINT `team_ibfk_1` FOREIGN KEY (`id_pokemon`) REFERENCES `pokemons` (`id_pokemon`),
  CONSTRAINT `team_ibfk_2` FOREIGN KEY (`id_stat`) REFERENCES `stats` (`id_stat`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,1,1),(2,1,2),(3,12,3),(4,14,19),(5,6,6),(6,16,14);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types`
--

DROP TABLE IF EXISTS `types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `types` (
  `id_type` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types`
--

LOCK TABLES `types` WRITE;
/*!40000 ALTER TABLE `types` DISABLE KEYS */;
INSERT INTO `types` VALUES (1,'Volador'),(2,'Lucha'),(3,'Fuego'),(4,'Planta'),(5,'Agua'),(6,'Roca'),(7,'Tierra'),(8,'Bicho'),(9,'Hielo'),(10,'Fantasma'),(11,'Dragon'),(12,'Psiquico'),(13,'Veneno'),(14,'Electrico'),(15,'NONE'),(16,'Normal');
/*!40000 ALTER TABLE `types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `BoxAndStats`
--

/*!50001 DROP TABLE IF EXISTS `BoxAndStats`*/;
/*!50001 DROP VIEW IF EXISTS `BoxAndStats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `BoxAndStats` AS select `caught`.`id_caught` AS `id_caught`,`pokemons`.`name` AS `name`,`stats`.`max_hp` AS `max_hp`,`stats`.`attack` AS `attack`,`stats`.`defense` AS `defense`,`stats`.`special` AS `special`,`stats`.`agility` AS `agility`,`stats`.`lvl` AS `lvl`,`stats`.`xp` AS `xp` from ((`caught` left join `pokemons` on(`caught`.`id_pokemon` = `pokemons`.`id_pokemon`)) left join `stats` on(`caught`.`id_stat` = `stats`.`id_stat`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `pokemonstats`
--

/*!50001 DROP TABLE IF EXISTS `pokemonstats`*/;
/*!50001 DROP VIEW IF EXISTS `pokemonstats`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `pokemonstats` AS select `team`.`id_team` AS `id_team`,`pokemons`.`name` AS `name`,`stats`.`max_hp` AS `max_hp`,`stats`.`actual_hp` AS `actual_hp` from ((`team` left join `pokemons` on(`team`.`id_pokemon` = `pokemons`.`id_pokemon`)) left join `stats` on(`team`.`id_stat` = `stats`.`id_stat`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-21 23:36:46
