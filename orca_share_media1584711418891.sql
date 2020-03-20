CREATE DATABASE  IF NOT EXISTS `firstdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `firstdb`;
-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: firstdb
-- ------------------------------------------------------
-- Server version	5.6.47-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `username` varchar(45) NOT NULL DEFAULT '',
  `Trip_Id` int(11) NOT NULL DEFAULT '0',
  `NumOfAdults` int(11) DEFAULT NULL,
  `NumOfChildren` int(11) DEFAULT NULL,
  `BusType` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`username`,`Trip_Id`),
  KEY `Trip_Id` (`Trip_Id`),
  CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`),
  CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`Trip_Id`) REFERENCES `trips` (`Trip_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES ('user1',1,2,3,'vip'),('user1',2,1,0,'normal'),('user2',1,12,0,'vip'),('user2',2,3,3,'normal');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centers`
--

DROP TABLE IF EXISTS `centers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centers` (
  `Center` varchar(20) NOT NULL,
  PRIMARY KEY (`Center`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centers`
--

LOCK TABLES `centers` WRITE;
/*!40000 ALTER TABLE `centers` DISABLE KEYS */;
INSERT INTO `centers` VALUES ('Al-karem'),('Al-mahatta'),('Al-qumsiah'),('Aleppo'),('Banias'),('Damascus'),('Dreikish'),('Homs'),('Jableh'),('Kadmous'),('Latakia'),('Maata'),('Safita'),('Salamiah'),('Tartous');
/*!40000 ALTER TABLE `centers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `username` varchar(45) NOT NULL DEFAULT '',
  `Trip_Id` int(11) NOT NULL DEFAULT '0',
  `SeatNumber` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`Trip_Id`,`SeatNumber`),
  KEY `Trip_Id` (`Trip_Id`),
  CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`) ON UPDATE CASCADE,
  CONSTRAINT `seats_ibfk_2` FOREIGN KEY (`Trip_Id`) REFERENCES `trips` (`Trip_Id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES ('user1',1,12),('user1',1,13),('user1',1,14),('user1',1,15),('user1',1,16),('user1',2,40);
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thelines`
--

DROP TABLE IF EXISTS `thelines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thelines` (
  `Source_Center` varchar(20) DEFAULT NULL,
  `Destination_Center` varchar(20) DEFAULT NULL,
  `Line` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`Line`),
  KEY `Source_Center` (`Source_Center`),
  KEY `Destination_Center` (`Destination_Center`),
  CONSTRAINT `thelines_ibfk_1` FOREIGN KEY (`Source_Center`) REFERENCES `centers` (`Center`),
  CONSTRAINT `thelines_ibfk_2` FOREIGN KEY (`Destination_Center`) REFERENCES `centers` (`Center`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thelines`
--

LOCK TABLES `thelines` WRITE;
/*!40000 ALTER TABLE `thelines` DISABLE KEYS */;
INSERT INTO `thelines` VALUES ('Aleppo','Al-karem','Aleppo-Al-karem'),('Aleppo','Al-mahatta','Aleppo-Al-mahatta'),('Aleppo','Al-qumsiah','Aleppo-Al-qumsiah'),('Aleppo','Banias','Aleppo-Banias'),('Aleppo','Damascus','Aleppo-Damascus'),('Aleppo','Dreikish','Aleppo-Dreikish'),('Aleppo','Homs','Aleppo-Homs'),('Aleppo','Jableh','Aleppo-Jableh'),('Aleppo','Kadmous','Aleppo-Kadmous'),('Aleppo','Latakia','Aleppo-Latakia'),('Aleppo','Maata','Aleppo-Maata'),('Aleppo','Safita','Aleppo-Safita'),('Aleppo','Salamiah','Aleppo-Salamiah'),('Aleppo','Tartous','Aleppo-Tartous'),('Damascus','Al-karem','Damascus-Al-karem'),('Damascus','Al-mahatta','Damascus-Al-mahatta'),('Damascus','Al-qumsiah','Damascus-Al-qumsiah'),('Damascus','Aleppo','Damascus-Aleppo'),('Damascus','Banias','Damascus-Banias'),('Damascus','Dreikish','Damascus-Dreikish'),('Damascus','Homs','Damascus-Homs'),('Damascus','Jableh','Damascus-Jableh'),('Damascus','Kadmous','Damascus-Kadmous'),('Damascus','Latakia','Damascus-Latakia'),('Damascus','Maata','Damascus-Maata'),('Damascus','Safita','Damascus-Safita'),('Damascus','Salamiah','Damascus-Salamiah'),('Damascus','Tartous','Damascus-Tartous'),('Homs','Al-karem','Homs-Al-karem'),('Homs','Al-mahatta','Homs-Al-mahatta'),('Homs','Al-qumsiah','Homs-Al-qumsiah'),('Homs','Aleppo','Homs-Aleppo'),('Homs','Banias','Homs-Banias'),('Homs','Damascus','Homs-Damascus'),('Homs','Dreikish','Homs-Dreikish'),('Homs','Jableh','Homs-Jableh'),('Homs','Kadmous','Homs-Kadmous'),('Homs','Latakia','Homs-Latakia'),('Homs','Maata','Homs-Maata'),('Homs','Safita','Homs-Safita'),('Homs','Salamiah','Homs-Salamiah'),('Homs','Tartous','Homs-Tartous'),('Tartous','Al-karem','Tartous-Al-karem'),('Tartous','Al-mahatta','Tartous-Al-mahatta'),('Tartous','Al-qumsiah','Tartous-Al-qumsiah'),('Tartous','Aleppo','Tartous-Aleppo'),('Tartous','Banias','Tartous-Banias'),('Tartous','Damascus','Tartous-Damascus'),('Tartous','Dreikish','Tartous-Dreikish'),('Tartous','Homs','Tartous-Homs'),('Tartous','Jableh','Tartous-Jableh'),('Tartous','Kadmous','Tartous-Kadmous'),('Tartous','Latakia','Tartous-Latakia'),('Tartous','Maata','Tartous-Maata'),('Tartous','Safita','Tartous-Safita'),('Tartous','Salamiah','Tartous-Salamiah');
/*!40000 ALTER TABLE `thelines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trips`
--

DROP TABLE IF EXISTS `trips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trips` (
  `Trip` varchar(45) NOT NULL DEFAULT '',
  `Trip_Day` varchar(20) NOT NULL DEFAULT '',
  `Departure_Time` time NOT NULL DEFAULT '00:00:00',
  `Trip_Id` int(11) DEFAULT NULL,
  `NumOfPassengers` int(11) DEFAULT NULL,
  PRIMARY KEY (`Trip`,`Trip_Day`,`Departure_Time`),
  UNIQUE KEY `Trip_Id` (`Trip_Id`),
  CONSTRAINT `trips_ibfk_1` FOREIGN KEY (`Trip`, `Trip_Day`) REFERENCES `weeklytrips` (`Trip`, `Trip_Day`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trips`
--

LOCK TABLES `trips` WRITE;
/*!40000 ALTER TABLE `trips` DISABLE KEYS */;
INSERT INTO `trips` VALUES ('Homs-Damascus','Thursday','16:51:45',1,5),('Homs-Damascus','Thursday','20:00:00',2,11),('Homs-Safita','Friday','00:00:00',3,12),('Homs-Safita','Friday','03:00:00',4,6);
/*!40000 ALTER TABLE `trips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `username` varchar(45) NOT NULL DEFAULT '',
  `FName` varchar(45) DEFAULT NULL,
  `LName` varchar(45) DEFAULT NULL,
  `My_Password` text,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('user1','Ali','Ahmad','aaaa1111'),('user2','Tamer','Mohammed','bbbb1111'),('user3','Rami','Karam','cccc1111'),('user4','Rama','Ali','dddd1111');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weeklytrips`
--

DROP TABLE IF EXISTS `weeklytrips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weeklytrips` (
  `Trip` varchar(45) NOT NULL DEFAULT '',
  `Trip_Day` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`Trip`,`Trip_Day`),
  CONSTRAINT `weeklytrips_ibfk_1` FOREIGN KEY (`Trip`) REFERENCES `thelines` (`Line`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weeklytrips`
--

LOCK TABLES `weeklytrips` WRITE;
/*!40000 ALTER TABLE `weeklytrips` DISABLE KEYS */;
INSERT INTO `weeklytrips` VALUES ('Aleppo-Banias','Monday'),('Aleppo-Damascus','Wednesday'),('Aleppo-Homs','Tuesday'),('Damascus-Aleppo','Sunday'),('Damascus-Banias','Saturday'),('Homs-Damascus','Thursday'),('Homs-Safita','Friday');
/*!40000 ALTER TABLE `weeklytrips` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-20  1:41:47
