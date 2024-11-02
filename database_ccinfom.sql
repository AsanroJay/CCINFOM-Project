CREATE DATABASE  IF NOT EXISTS `CCINFOM_STORE` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;
USE `CCINFOM_STORE`;

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
-- Table structure for table `Inventory`
--
DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `Inventory` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductName` char(100) NOT NULL DEFAULT '',
  `Category` char(50) NOT NULL DEFAULT '',
  `Price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `QuantityInStock` int(11) NOT NULL DEFAULT '0',
  `DateAdded` date NOT NULL,
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=latin1;

/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES 
(1, 'Laptop', 'Electronics', 999.99, 50, '2024-10-01'),
(2, 'Wireless Mouse', 'Accessories', 29.99, 150, '2024-10-05'),
(3, 'Smartphone', 'Electronics', 699.99, 75, '2024-10-08'),
(4, 'Desk Lamp', 'Home Decor', 49.99, 100, '2024-10-10'),
(5, 'Bluetooth Speaker', 'Electronics', 59.99, 120, '2024-10-12'),
(6, 'Office Chair', 'Furniture', 199.99, 40, '2024-10-15'),
(7, 'Monitor 27"', 'Electronics', 299.99, 30, '2024-10-20'),
(8, 'Keyboard', 'Accessories', 79.99, 80, '2024-10-25'),
(9, 'Bookshelf', 'Furniture', 89.99, 20, '2024-10-28'),
(10, 'Coffee Maker', 'Home Appliances', 99.99, 35, '2024-10-30');
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `store_record`
--

DROP TABLE IF EXISTS `store_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store_record` (
  `storeID` int NOT NULL,
  `storeName` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `contactNo` varchar(45) DEFAULT NULL,
  `contactAdd` varchar(45) DEFAULT NULL,
  `productsID` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`storeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_record`
--

LOCK TABLES `store_record` WRITE;
/*!40000 ALTER TABLE `store_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_record` ENABLE KEYS */;
UNLOCK TABLES;

-- Table structure for table `Orders`
DROP TABLE IF EXISTS `Orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;

CREATE TABLE `Orders` (
  `OrderID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `OrderDate` date NOT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `OrderStatus` char(20) NOT NULL DEFAULT 'Pending',
  `OrderQuantity` int(11) NOT NULL,
  `TotalPrice` decimal(10,2) NOT NULL,
  PRIMARY KEY (`OrderID`),
  FOREIGN KEY (`ProductID`) REFERENCES `Inventory`(`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Inserting sample data into `Orders`
LOCK TABLES `Orders` WRITE;
/*!40000 ALTER TABLE `Orders` DISABLE KEYS */;
INSERT INTO `Orders` (`ProductID`, `OrderDate`, `DeliveryDate`, `OrderStatus`, `OrderQuantity`, `TotalPrice`) VALUES
(1, '2024-11-01', '2024-11-05', 'Delivered', 2, 1999.98),          -- 2 Laptops
(2, '2024-11-02', '2024-11-06', 'Shipped', 5, 149.95),             -- 5 Wireless Mice
(3, '2024-11-03', '2024-11-07', 'Pending', 1, 699.99),             -- 1 Smartphone
(4, '2024-11-04', '2024-11-10', 'Delivered', 3, 149.97),           -- 3 Desk Lamps
(5, '2024-11-05', '2024-11-11', 'Shipped', 4, 239.96),             -- 4 Bluetooth Speakers
(6, '2024-11-06', '2024-11-15', 'Pending', 1, 199.99),             -- 1 Office Chair
(7, '2024-11-07', '2024-11-12', 'Delivered', 1, 299.99),           -- 1 Monitor 27"
(8, '2024-11-08', '2024-11-15', 'Pending', 2, 159.98),             -- 2 Keyboards
(9, '2024-11-09', '2024-11-17', 'Delivered', 1, 89.99),            -- 1 Bookshelf
(10, '2024-11-10', '2024-11-18', 'Shipped', 1, 99.99);             -- 1 Coffee Maker
/*!40000 ALTER TABLE `Orders` ENABLE KEYS */;
UNLOCK TABLES;

-- Restore MySQL settings
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

