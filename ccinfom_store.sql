-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: ccinfom_store
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES (1,'Laptop','Electronics',999.99,50,'2024-10-01'),(2,'Wireless Mouse','Accessories',29.99,150,'2024-10-05'),(3,'Smartphone','Electronics',699.99,75,'2024-10-08'),(4,'Desk Lamp','Home Decor',49.99,100,'2024-10-10'),(5,'Bluetooth Speaker','Electronics',59.99,120,'2024-10-12'),(6,'Office Chair','Furniture',199.99,40,'2024-10-15'),(7,'Monitor 27\"','Electronics',299.99,30,'2024-10-20'),(8,'Keyboard','Accessories',79.99,80,'2024-10-25'),(9,'Bookshelf','Furniture',89.99,20,'2024-10-28'),(10,'Coffee Maker','Home Appliances',99.99,35,'2024-10-30');
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2001,1,'2024-10-15','2024-10-20','Shipped',1,999.99),(2002,3,'2024-10-17','2024-10-25','Pending',2,1399.98),(2003,4,'2024-10-18','2024-10-23','Delivered',1,49.99),(2004,2,'2024-10-19','2024-10-26','Shipped',3,89.97),(2005,5,'2024-10-20','2024-10-28','Delivered',2,119.98),(2006,7,'2024-10-21','2024-10-30','Pending',1,299.99),(2007,8,'2024-10-22','2024-10-29','Shipped',4,319.96),(2008,6,'2024-10-23','2024-11-01','Pending',1,199.99),(2009,10,'2024-10-24','2024-11-02','Delivered',1,99.99),(2010,9,'2024-10-25','2024-11-04','Pending',2,179.98);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-28 22:25:57
