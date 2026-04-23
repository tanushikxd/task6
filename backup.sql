-- MySQL dump 10.13  Distrib 9.6.0, for macos26.3 (arm64)
--
-- Host: localhost    Database: fake_data
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '659a9dae-3dc9-11f1-973b-8c2f45ce39b2:1-105';

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `city_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `locale` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'New York','en_US'),(2,'Los Angeles','en_US'),(3,'Berlin','de_DE'),(4,'Munich','de_DE'),(5,'Berlin','de_DE'),(6,'Munich','de_DE'),(7,'Hamburg','de_DE'),(8,'Cologne','de_DE');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eye_colors`
--

DROP TABLE IF EXISTS `eye_colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eye_colors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `color` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eye_colors`
--

LOCK TABLES `eye_colors` WRITE;
/*!40000 ALTER TABLE `eye_colors` DISABLE KEYS */;
INSERT INTO `eye_colors` VALUES (1,'blue'),(2,'brown'),(3,'green');
/*!40000 ALTER TABLE `eye_colors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `first_names`
--

DROP TABLE IF EXISTS `first_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `first_names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `locale` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `first_names`
--

LOCK TABLES `first_names` WRITE;
/*!40000 ALTER TABLE `first_names` DISABLE KEYS */;
INSERT INTO `first_names` VALUES (1,'John','en_US'),(2,'Emily','en_US'),(3,'David','en_US'),(4,'Sophia','en_US'),(5,'James','en_US'),(6,'Olivia','en_US'),(7,'Liam','en_US'),(8,'Noah','en_US'),(9,'Emma','en_US'),(10,'Ava','en_US'),(11,'Hans','de_DE'),(12,'Anna','de_DE'),(13,'Peter','de_DE'),(14,'Lukas','de_DE'),(15,'Marie','de_DE'),(16,'Laura','de_DE'),(17,'Leon','de_DE'),(18,'Sophie','de_DE'),(19,'Paul','de_DE'),(20,'Julia','de_DE'),(21,'Lukas','de_DE'),(22,'Leon','de_DE'),(23,'Finn','de_DE'),(24,'Paul','de_DE'),(25,'Jonas','de_DE'),(26,'Ben','de_DE'),(27,'Elias','de_DE'),(28,'Anna','de_DE'),(29,'Emma','de_DE'),(30,'Mia','de_DE'),(31,'Hannah','de_DE'),(32,'Lea','de_DE'),(33,'Lukas','de_DE'),(34,'Leon','de_DE'),(35,'Finn','de_DE'),(36,'Paul','de_DE'),(37,'Jonas','de_DE'),(38,'Ben','de_DE'),(39,'Elias','de_DE'),(40,'Noah','de_DE'),(41,'Luis','de_DE'),(42,'Felix','de_DE'),(43,'Maximilian','de_DE'),(44,'Alexander','de_DE'),(45,'Julian','de_DE'),(46,'David','de_DE'),(47,'Tim','de_DE'),(48,'Niklas','de_DE'),(49,'Moritz','de_DE'),(50,'Jan','de_DE'),(51,'Fabian','de_DE'),(52,'Philipp','de_DE'),(53,'Erik','de_DE'),(54,'Simon','de_DE'),(55,'Tobias','de_DE'),(56,'Daniel','de_DE'),(57,'Marcel','de_DE'),(58,'Anna','de_DE'),(59,'Emma','de_DE'),(60,'Mia','de_DE'),(61,'Hannah','de_DE'),(62,'Lea','de_DE'),(63,'Lena','de_DE'),(64,'Sophie','de_DE'),(65,'Marie','de_DE'),(66,'Laura','de_DE'),(67,'Clara','de_DE'),(68,'Sarah','de_DE'),(69,'Johanna','de_DE'),(70,'Lisa','de_DE'),(71,'Julia','de_DE'),(72,'Katharina','de_DE'),(73,'Vanessa','de_DE'),(74,'Nina','de_DE'),(75,'Melanie','de_DE'),(76,'Franziska','de_DE'),(77,'Sabrina','de_DE'),(78,'Theresa','de_DE'),(79,'Alina','de_DE'),(80,'Carina','de_DE'),(81,'Bianca','de_DE'),(82,'Anja','de_DE');
/*!40000 ALTER TABLE `first_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `last_names`
--

DROP TABLE IF EXISTS `last_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `last_names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `locale` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `last_names`
--

LOCK TABLES `last_names` WRITE;
/*!40000 ALTER TABLE `last_names` DISABLE KEYS */;
INSERT INTO `last_names` VALUES (1,'Smith','en_US'),(2,'Johnson','en_US'),(3,'Brown','en_US'),(4,'Williams','en_US'),(5,'Jones','en_US'),(6,'Garcia','en_US'),(7,'Miller','en_US'),(8,'Davis','en_US'),(9,'Rodriguez','en_US'),(10,'Martinez','en_US'),(11,'Müller','de_DE'),(12,'Schmidt','de_DE'),(13,'Schneider','de_DE'),(14,'Fischer','de_DE'),(15,'Weber','de_DE'),(16,'Meyer','de_DE'),(17,'Wagner','de_DE'),(18,'Becker','de_DE'),(19,'Hoffmann','de_DE'),(20,'Schäfer','de_DE'),(21,'Müller','de_DE'),(22,'Schmidt','de_DE'),(23,'Schneider','de_DE'),(24,'Fischer','de_DE'),(25,'Weber','de_DE'),(26,'Meyer','de_DE'),(27,'Wagner','de_DE'),(28,'Becker','de_DE'),(29,'Schulz','de_DE'),(30,'Hoffmann','de_DE'),(31,'Smith','en_US'),(32,'Johnson','en_US'),(33,'Williams','en_US'),(34,'Brown','en_US'),(35,'Jones','en_US'),(36,'Garcia','en_US'),(37,'Miller','en_US'),(38,'Davis','en_US'),(39,'Rodriguez','en_US'),(40,'Martinez','en_US'),(41,'Hernandez','en_US'),(42,'Lopez','en_US'),(43,'Gonzalez','en_US'),(44,'Wilson','en_US'),(45,'Anderson','en_US'),(46,'Thomas','en_US'),(47,'Taylor','en_US'),(48,'Moore','en_US'),(49,'Jackson','en_US'),(50,'Martin','en_US'),(51,'Lee','en_US'),(52,'Perez','en_US'),(53,'Thompson','en_US'),(54,'White','en_US'),(55,'Harris','en_US'),(56,'Sanchez','en_US'),(57,'Clark','en_US'),(58,'Ramirez','en_US'),(59,'Lewis','en_US'),(60,'Robinson','en_US'),(61,'Walker','en_US'),(62,'Young','en_US'),(63,'Allen','en_US'),(64,'King','en_US'),(65,'Wright','en_US'),(66,'Scott','en_US'),(67,'Torres','en_US'),(68,'Nguyen','en_US'),(69,'Hill','en_US'),(70,'Flores','en_US'),(71,'Green','en_US'),(72,'Adams','en_US'),(73,'Nelson','en_US'),(74,'Baker','en_US'),(75,'Hall','en_US'),(76,'Rivera','en_US'),(77,'Campbell','en_US'),(78,'Mitchell','en_US'),(79,'Carter','en_US'),(80,'Roberts','en_US'),(81,'Müller','de_DE'),(82,'Schmidt','de_DE'),(83,'Schneider','de_DE'),(84,'Fischer','de_DE'),(85,'Weber','de_DE'),(86,'Meyer','de_DE'),(87,'Wagner','de_DE'),(88,'Becker','de_DE'),(89,'Schulz','de_DE'),(90,'Hoffmann','de_DE'),(91,'Schäfer','de_DE'),(92,'Koch','de_DE'),(93,'Bauer','de_DE'),(94,'Richter','de_DE'),(95,'Klein','de_DE'),(96,'Wolf','de_DE'),(97,'Schröder','de_DE'),(98,'Neumann','de_DE'),(99,'Schwarz','de_DE'),(100,'Zimmermann','de_DE'),(101,'Braun','de_DE'),(102,'Krüger','de_DE'),(103,'Hofmann','de_DE'),(104,'Hartmann','de_DE'),(105,'Lange','de_DE'),(106,'Schmitt','de_DE'),(107,'Werner','de_DE'),(108,'Schmitz','de_DE'),(109,'Krause','de_DE'),(110,'Meier','de_DE'),(111,'Lehmann','de_DE'),(112,'Schmid','de_DE'),(113,'Schulze','de_DE'),(114,'Maier','de_DE'),(115,'Köhler','de_DE'),(116,'Herrmann','de_DE'),(117,'König','de_DE'),(118,'Walter','de_DE'),(119,'Mayer','de_DE'),(120,'Huber','de_DE'),(121,'Kaiser','de_DE'),(122,'Fuchs','de_DE'),(123,'Peters','de_DE'),(124,'Lang','de_DE'),(125,'Scholz','de_DE');
/*!40000 ALTER TABLE `last_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `names`
--

DROP TABLE IF EXISTS `names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `names` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `locale` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `names`
--

LOCK TABLES `names` WRITE;
/*!40000 ALTER TABLE `names` DISABLE KEYS */;
INSERT INTO `names` VALUES (1,'John','Smith','en_US'),(2,'Emily','Johnson','en_US'),(3,'Michael','Brown','en_US'),(4,'Anna','Müller','de_DE'),(5,'Lukas','Schmidt','de_DE');
/*!40000 ALTER TABLE `names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `streets`
--

DROP TABLE IF EXISTS `streets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `streets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `street_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `locale` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `streets`
--

LOCK TABLES `streets` WRITE;
/*!40000 ALTER TABLE `streets` DISABLE KEYS */;
INSERT INTO `streets` VALUES (1,'Main St','en_US'),(2,'Second Ave','en_US'),(3,'Hauptstrasse','de_DE'),(4,'Bahnhofstrasse','de_DE'),(5,'Hauptstrasse','de_DE'),(6,'Bahnhofstrasse','de_DE'),(7,'Gartenweg','de_DE'),(8,'Schulstrasse','de_DE');
/*!40000 ALTER TABLE `streets` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-22 22:58:40
