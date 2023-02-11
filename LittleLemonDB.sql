-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: littlelemondb
-- ------------------------------------------------------
-- Server version	8.0.20

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
  `BookingID` int NOT NULL AUTO_INCREMENT,
  `Guest_GuestID` int NOT NULL,
  `Guest_GuestFirstName` varchar(100) NOT NULL,
  `Guest_GuestLastName` varchar(100) NOT NULL,
  `TableNo` int DEFAULT NULL,
  `BookingSlot` time NOT NULL,
  `Employees_EmployeeID` int NOT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `fk_Bookings_Employees1_idx` (`Employees_EmployeeID`),
  KEY `fk_Bookings_Guest1_idx` (`Guest_GuestID`),
  CONSTRAINT `fk_Bookings_Employees1` FOREIGN KEY (`Employees_EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `fk_Bookings_Guest1` FOREIGN KEY (`Guest_GuestID`) REFERENCES `guest` (`GuestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `DeliveryID` int NOT NULL,
  `Guest_GuestID` int NOT NULL,
  `Guest_GuestFirstName` varchar(100) NOT NULL,
  `Guest_GuestLastName` varchar(100) NOT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `DeliveryStatus` varchar(45) DEFAULT NULL,
  `Guest_GuestAddress` varchar(100) NOT NULL,
  `Guest_GuestPhone` int NOT NULL,
  `Orders_OrderID` int NOT NULL,
  PRIMARY KEY (`DeliveryID`),
  KEY `fk_Delivery_Guest1_idx` (`Guest_GuestID`) /*!80000 INVISIBLE */,
  KEY `fk_Delivery_Orders1_idx` (`Orders_OrderID`),
  CONSTRAINT `fk_Delivery_Guest1` FOREIGN KEY (`Guest_GuestID`) REFERENCES `guest` (`GuestID`),
  CONSTRAINT `fk_Delivery_Orders1` FOREIGN KEY (`Orders_OrderID`) REFERENCES `orders` (`OrderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) DEFAULT NULL,
  `Role` varchar(100) DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Contact_Number` int DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Annual_Salary` varchar(100) DEFAULT NULL,
  `Order_Status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `GuestID` int NOT NULL,
  `GuestFirstName` varchar(100) NOT NULL,
  `GuestLastName` varchar(100) NOT NULL,
  `GuestPhone` int NOT NULL,
  `GuestAddress` varchar(100) NOT NULL,
  PRIMARY KEY (`GuestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `MenuID` int NOT NULL,
  `ItemID` int NOT NULL,
  `Cuisine` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`MenuID`,`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menuitems`
--

DROP TABLE IF EXISTS `menuitems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menuitems` (
  `ItemID` int NOT NULL,
  `Menu_MenuID` int DEFAULT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Type` varchar(100) DEFAULT NULL,
  `Price` int DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `fk_MenuItems_Menu1_idx` (`Menu_MenuID`,`ItemID`),
  CONSTRAINT `fk_MenuItems_Menu1` FOREIGN KEY (`Menu_MenuID`, `ItemID`) REFERENCES `menu` (`MenuID`, `ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menuitems`
--

LOCK TABLES `menuitems` WRITE;
/*!40000 ALTER TABLE `menuitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `menuitems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `OrderID` int NOT NULL,
  `TableNo` int NOT NULL,
  `Menu_MenuID` int NOT NULL,
  `Bookings_BookingID` int NOT NULL,
  `MenuItems_ItemID` int NOT NULL,
  `Employees_EmployeeID` int NOT NULL,
  `BillAmount` int DEFAULT NULL,
  `Quantity` int DEFAULT NULL,
  `BookingID` int DEFAULT NULL,
  `Order_Status` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`OrderID`),
  KEY `fk_Orders_Bookings1_idx` (`Bookings_BookingID`),
  KEY `fk_Orders_MenuItems1_idx` (`MenuItems_ItemID`),
  KEY `fk_Orders_Menu1_idx` (`Menu_MenuID`),
  KEY `fk_Orders_Employees1_idx` (`Employees_EmployeeID`),
  CONSTRAINT `fk_Orders_Bookings1` FOREIGN KEY (`Bookings_BookingID`) REFERENCES `bookings` (`BookingID`),
  CONSTRAINT `fk_Orders_Employees1` FOREIGN KEY (`Employees_EmployeeID`) REFERENCES `employees` (`EmployeeID`),
  CONSTRAINT `fk_Orders_Menu1` FOREIGN KEY (`Menu_MenuID`) REFERENCES `menu` (`MenuID`),
  CONSTRAINT `fk_Orders_MenuItems1` FOREIGN KEY (`MenuItems_ItemID`) REFERENCES `menuitems` (`ItemID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
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

-- Dump completed on 2023-02-11 14:30:55
