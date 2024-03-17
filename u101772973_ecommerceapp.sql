-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: u101772973_ecommerceapp
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-cll-lve

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `address_name` varchar(255) NOT NULL,
  `address_lat` varchar(255) NOT NULL,
  `address_long` varchar(255) NOT NULL,
  `address_street` varchar(255) NOT NULL,
  `address_city` varchar(255) NOT NULL,
  `address_userid` int(11) NOT NULL,
  PRIMARY KEY (`address_id`),
  KEY `adreess_userid` (`address_userid`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`address_userid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES
(28,'Aga','27.580529','41.7130895','Birot','Hail',32);
/*!40000 ALTER TABLE `address` ENABLE KEYS */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `admin_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `admin_pass` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `admin_phone` int(100) NOT NULL,
  `admin_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'default',
  `admin_verifycode` int(4) NOT NULL,
  `admin_approval` tinyint(4) NOT NULL,
  `admin_roll` int(11) NOT NULL,
  `admin_createdat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `admin_email` (`admin_email`),
  UNIQUE KEY `admin_pass` (`admin_pass`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES
(1,'admin1','admin1@email.com','19485e369c691fa8ece1fabc8a6ceabfb5666b79',0,'default',432745,1,0,'2023-08-10 03:59:07');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `cart_id` int(11) NOT NULL AUTO_INCREMENT,
  `cart_userid` int(11) NOT NULL,
  `cart_proid` int(11) NOT NULL,
  `cart_ordersid` int(11) NOT NULL DEFAULT 0,
  `cart_ordersprice` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`cart_id`),
  KEY `cart_userid` (`cart_userid`),
  KEY `cart_proid` (`cart_proid`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`cart_userid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`cart_proid`) REFERENCES `product` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;

--
-- Temporary table structure for view `cartview`
--

DROP TABLE IF EXISTS `cartview`;
/*!50001 DROP VIEW IF EXISTS `cartview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cartview` AS SELECT
 1 AS `pros_price`,
  1 AS `pros_count`,
  1 AS `pro_id`,
  1 AS `pro_name`,
  1 AS `pro_name_ar`,
  1 AS `pro_desc`,
  1 AS `pro_desc_ar`,
  1 AS `pro_color`,
  1 AS `pro_color_ar`,
  1 AS `pro_image`,
  1 AS `pro_price`,
  1 AS `pro_shipping`,
  1 AS `pro_delivery`,
  1 AS `pro_rate`,
  1 AS `pro_discount`,
  1 AS `pro_payment`,
  1 AS `pro_active`,
  1 AS `pro_count`,
  1 AS `pro_createdat`,
  1 AS `pro_catid`,
  1 AS `pro_adminid`,
  1 AS `cart_id`,
  1 AS `cart_userid`,
  1 AS `cart_proid`,
  1 AS `cart_ordersid`,
  1 AS `cart_ordersprice` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `categorie_id` int(11) NOT NULL AUTO_INCREMENT,
  `categorie_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `categorie_name_ar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `categorie_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'default',
  `categorie_createdat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`categorie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES
(1,'laptop','لابتوب','laptop.svg','2023-02-10 19:40:46'),
(11,'mobile','mobilear','642mobile.svg','2023-06-06 11:40:11'),
(13,'television','تلفزيون','565tv_FILL0_wght400_GRAD0_opsz48.svg','2023-08-11 18:29:17'),
(14,'camera','كاميرا','350photo_camera_FILL0_wght400_GRAD0_opsz48.svg','2023-08-11 18:30:27');
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_name` varchar(100) NOT NULL,
  `coupon_discount` smallint(6) NOT NULL DEFAULT 0,
  `coupon_count` int(11) NOT NULL,
  `coupon_expirydate` varchar(255) NOT NULL,
  PRIMARY KEY (`coupon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES
(1,'atowi7',10,4,'2023-08-30 17:19:18');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `delivery_id` int(11) NOT NULL AUTO_INCREMENT,
  `delivery_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `delivery_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `delivery_pass` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `delivery_phone` int(100) NOT NULL,
  `delivery_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'default',
  `delivery_verifycode` int(100) NOT NULL,
  `delivery_approval` tinyint(4) NOT NULL,
  `delivery_createdat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  PRIMARY KEY (`delivery_id`),
  UNIQUE KEY `delivery_email` (`delivery_email`),
  UNIQUE KEY `delivery_pass` (`delivery_pass`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES
(3,'delivery1','delivery1@email.com','19485e369c691fa8ece1fabc8a6ceabfb5666b79',0,'default',619536,1,'2023-08-10 14:00:02');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favorite` (
  `fav_id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_userid` int(11) NOT NULL,
  `fav_proid` int(11) NOT NULL,
  PRIMARY KEY (`fav_id`),
  KEY `userid` (`fav_userid`),
  KEY `productid` (`fav_proid`),
  CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`fav_userid`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`fav_proid`) REFERENCES `product` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
INSERT INTO `favorite` VALUES
(93,32,8);
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;

--
-- Table structure for table `heading`
--

DROP TABLE IF EXISTS `heading`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `heading` (
  `heading_id` int(11) NOT NULL AUTO_INCREMENT,
  `heading_title` varchar(50) NOT NULL,
  `heading_body` varchar(100) NOT NULL,
  `heading_deliverytime` int(11) NOT NULL DEFAULT 30,
  PRIMARY KEY (`heading_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `heading`
--

/*!40000 ALTER TABLE `heading` DISABLE KEYS */;
INSERT INTO `heading` VALUES
(1,'Summer Discount','You have 80% discount',30);
/*!40000 ALTER TABLE `heading` ENABLE KEYS */;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_text` varchar(255) NOT NULL,
  `message_image` varchar(255) NOT NULL,
  `message_createdat` varchar(255) NOT NULL,
  `message_adminid` int(11) NOT NULL,
  `message_userid` int(11) NOT NULL,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

/*!40000 ALTER TABLE `message` DISABLE KEYS */;
/*!40000 ALTER TABLE `message` ENABLE KEYS */;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notification` (
  `notification_id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `notification_body` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `notification_createdat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `notification_adminid` int(11) NOT NULL DEFAULT 0,
  `notification_userid` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`notification_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orders_id` int(11) NOT NULL AUTO_INCREMENT,
  `orders_price` double NOT NULL,
  `orders_deliveryprice` double NOT NULL,
  `orders_totalprice` double NOT NULL,
  `orders_couponid` int(11) NOT NULL,
  `orders_coupondiscount` int(11) NOT NULL,
  `orders_paymentmethod` tinyint(4) NOT NULL,
  `orders_type` tinyint(4) NOT NULL,
  `orders_status` tinyint(4) NOT NULL,
  `orders_createdat` varchar(255) NOT NULL,
  `orders_deleted` tinyint(4) NOT NULL,
  `orders_addressid` int(11) NOT NULL,
  `orders_deliveryid` int(11) NOT NULL DEFAULT 0,
  `orders_userid` int(11) NOT NULL,
  PRIMARY KEY (`orders_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES
(26,2000,0,2000,0,0,0,1,3,'2023-08-20 08:41:37',0,28,0,32);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;

--
-- Temporary table structure for view `ordersdetailview`
--

DROP TABLE IF EXISTS `ordersdetailview`;
/*!50001 DROP VIEW IF EXISTS `ordersdetailview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ordersdetailview` AS SELECT
 1 AS `pros_price`,
  1 AS `pros_count`,
  1 AS `pro_id`,
  1 AS `pro_name`,
  1 AS `pro_name_ar`,
  1 AS `pro_desc`,
  1 AS `pro_desc_ar`,
  1 AS `pro_color`,
  1 AS `pro_color_ar`,
  1 AS `pro_image`,
  1 AS `pro_price`,
  1 AS `pro_shipping`,
  1 AS `pro_delivery`,
  1 AS `pro_rate`,
  1 AS `pro_discount`,
  1 AS `pro_payment`,
  1 AS `pro_active`,
  1 AS `pro_count`,
  1 AS `pro_createdat`,
  1 AS `pro_catid`,
  1 AS `pro_adminid`,
  1 AS `cart_id`,
  1 AS `cart_userid`,
  1 AS `cart_proid`,
  1 AS `cart_ordersid`,
  1 AS `cart_ordersprice` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `ordersview`
--

DROP TABLE IF EXISTS `ordersview`;
/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `ordersview` AS SELECT
 1 AS `orders_id`,
  1 AS `orders_price`,
  1 AS `orders_deliveryprice`,
  1 AS `orders_totalprice`,
  1 AS `orders_couponid`,
  1 AS `orders_coupondiscount`,
  1 AS `orders_paymentmethod`,
  1 AS `orders_type`,
  1 AS `orders_status`,
  1 AS `orders_createdat`,
  1 AS `orders_deleted`,
  1 AS `orders_addressid`,
  1 AS `orders_deliveryid`,
  1 AS `orders_userid`,
  1 AS `address_id`,
  1 AS `address_name`,
  1 AS `address_lat`,
  1 AS `address_long`,
  1 AS `address_street`,
  1 AS `address_city`,
  1 AS `address_userid` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pro_name_ar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pro_desc` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pro_desc_ar` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pro_color` varchar(100) CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `pro_color_ar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pro_image` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'default',
  `pro_price` float NOT NULL,
  `pro_shipping` tinyint(4) NOT NULL DEFAULT 0,
  `pro_delivery` tinyint(4) NOT NULL DEFAULT 0,
  `pro_rate` double NOT NULL DEFAULT -1,
  `pro_discount` smallint(6) NOT NULL,
  `pro_payment` tinyint(4) NOT NULL DEFAULT 0,
  `pro_active` tinyint(4) NOT NULL DEFAULT 1 COMMENT '0 ==> Hidden , \r\n1 ==> Active,',
  `pro_count` int(11) NOT NULL,
  `pro_createdat` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `pro_catid` int(11) NOT NULL,
  `pro_adminid` int(11) NOT NULL,
  PRIMARY KEY (`pro_id`),
  KEY `categorie_item` (`pro_catid`),
  CONSTRAINT `categorie_item` FOREIGN KEY (`pro_catid`) REFERENCES `categorie` (`categorie_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES
(6,'hp laptop','لاب توب اتش بي','product description','وصف المنتج','?','','13png-clipart-laptop-hewlett-packard-intel-hp-pavilion-gaming-computer-laptop-gadget-electronics.png',1000,0,0,-1,0,1,1,2,'2023-08-11 21:34:31',1,1),
(7,'Samsung S22','سامسونج اس ٢٢','product description','وصف المنتج','????','','21371c5rhsUkxL._AC_UF894,1000_QL80_.jpg',1500,0,0,-1,10,0,1,4,'2023-08-11 21:36:24',11,1),
(8,'television tv','تلفزيون ','product description','وصف المنتج','g????','','317f30c111fd0df99f1917c0e275c647cf50456d743_580978.jpg',5000,0,0,-1,20,0,1,6,'2023-08-11 21:38:23',13,1),
(9,'Canon EOS','كانون','product description','وصف المنتج','b????','','55861BKYlNqH6L._AC_UF894,1000_QL80_.jpg',1299,0,0,-1,15,0,1,15,'2023-08-11 21:39:55',14,1),
(11,'T-shirt','T-Shirt','description','description','yallow','yallow','301IMG_20230820_141253.jpg',32,0,0,-1,2,1,1,2,'2023-08-20T14:13:11.214551',14,1);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

--
-- Table structure for table `productrate`
--

DROP TABLE IF EXISTS `productrate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productrate` (
  `productrate_id` int(11) NOT NULL AUTO_INCREMENT,
  `productrate_value` float NOT NULL DEFAULT 0,
  `productrate_comment` varchar(255) NOT NULL,
  `productrate_proid` int(11) NOT NULL,
  `productrate_userid` int(11) NOT NULL,
  PRIMARY KEY (`productrate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productrate`
--

/*!40000 ALTER TABLE `productrate` DISABLE KEYS */;
/*!40000 ALTER TABLE `productrate` ENABLE KEYS */;

--
-- Temporary table structure for view `producttopselling`
--

DROP TABLE IF EXISTS `producttopselling`;
/*!50001 DROP VIEW IF EXISTS `producttopselling`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `producttopselling` AS SELECT
 1 AS `cart_procount`,
  1 AS `priceafterdiscount`,
  1 AS `cart_id`,
  1 AS `cart_userid`,
  1 AS `cart_proid`,
  1 AS `cart_ordersid`,
  1 AS `cart_ordersprice`,
  1 AS `pro_id`,
  1 AS `pro_name`,
  1 AS `pro_name_ar`,
  1 AS `pro_desc`,
  1 AS `pro_desc_ar`,
  1 AS `pro_color`,
  1 AS `pro_color_ar`,
  1 AS `pro_image`,
  1 AS `pro_price`,
  1 AS `pro_shipping`,
  1 AS `pro_delivery`,
  1 AS `pro_rate`,
  1 AS `pro_discount`,
  1 AS `pro_payment`,
  1 AS `pro_active`,
  1 AS `pro_count`,
  1 AS `pro_createdat`,
  1 AS `pro_catid`,
  1 AS `pro_adminid` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `productview`
--

DROP TABLE IF EXISTS `productview`;
/*!50001 DROP VIEW IF EXISTS `productview`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `productview` AS SELECT
 1 AS `pro_id`,
  1 AS `pro_name`,
  1 AS `pro_name_ar`,
  1 AS `pro_desc`,
  1 AS `pro_desc_ar`,
  1 AS `pro_color`,
  1 AS `pro_color_ar`,
  1 AS `pro_image`,
  1 AS `pro_price`,
  1 AS `pro_shipping`,
  1 AS `pro_delivery`,
  1 AS `pro_rate`,
  1 AS `pro_discount`,
  1 AS `pro_payment`,
  1 AS `pro_active`,
  1 AS `pro_count`,
  1 AS `pro_createdat`,
  1 AS `pro_catid`,
  1 AS `pro_adminid`,
  1 AS `priceafterdiscount`,
  1 AS `shippingprice`,
  1 AS `deliveryprice`,
  1 AS `categorie_id`,
  1 AS `categorie_name`,
  1 AS `categorie_name_ar`,
  1 AS `categorie_image`,
  1 AS `categorie_createdat` */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(100) NOT NULL,
  `user_email` varchar(100) NOT NULL,
  `user_pass` varchar(100) NOT NULL,
  `user_phone` int(100) NOT NULL,
  `user_image` varchar(255) NOT NULL DEFAULT 'default',
  `user_verifycode` int(100) NOT NULL,
  `user_approval` tinyint(4) NOT NULL DEFAULT 0,
  `user_createdat` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`user_email`),
  UNIQUE KEY `pass` (`user_pass`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES
(32,'user1','dhoom.sedge@gmail.com','19485e369c691fa8ece1fabc8a6ceabfb5666b79',0,'default',194003,1,'2023-08-09 08:07:17');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

--
-- Temporary table structure for view `userfavorite`
--

DROP TABLE IF EXISTS `userfavorite`;
/*!50001 DROP VIEW IF EXISTS `userfavorite`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `userfavorite` AS SELECT
 1 AS `user_id`,
  1 AS `pro_id`,
  1 AS `pro_name`,
  1 AS `pro_name_ar`,
  1 AS `pro_desc`,
  1 AS `pro_desc_ar`,
  1 AS `pro_color`,
  1 AS `pro_color_ar`,
  1 AS `pro_image`,
  1 AS `pro_price`,
  1 AS `pro_shipping`,
  1 AS `pro_delivery`,
  1 AS `pro_rate`,
  1 AS `pro_discount`,
  1 AS `pro_payment`,
  1 AS `pro_active`,
  1 AS `pro_count`,
  1 AS `pro_createdat`,
  1 AS `pro_catid`,
  1 AS `pro_adminid`,
  1 AS `priceafterdiscount`,
  1 AS `fav_id`,
  1 AS `fav_userid`,
  1 AS `fav_proid` */;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'u101772973_ecommerceapp'
--

--
-- Final view structure for view `cartview`
--

/*!50001 DROP VIEW IF EXISTS `cartview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `cartview` AS select sum(`product`.`pro_price` - `product`.`pro_price` * (`product`.`pro_discount` / 100) + `product`.`pro_price` * (`product`.`pro_shipping` / 100) + `product`.`pro_price` * (`product`.`pro_delivery` / 100)) AS `pros_price`,count(`cart`.`cart_id`) AS `pros_count`,`product`.`pro_id` AS `pro_id`,`product`.`pro_name` AS `pro_name`,`product`.`pro_name_ar` AS `pro_name_ar`,`product`.`pro_desc` AS `pro_desc`,`product`.`pro_desc_ar` AS `pro_desc_ar`,`product`.`pro_color` AS `pro_color`,`product`.`pro_color_ar` AS `pro_color_ar`,`product`.`pro_image` AS `pro_image`,`product`.`pro_price` AS `pro_price`,`product`.`pro_shipping` AS `pro_shipping`,`product`.`pro_delivery` AS `pro_delivery`,`product`.`pro_rate` AS `pro_rate`,`product`.`pro_discount` AS `pro_discount`,`product`.`pro_payment` AS `pro_payment`,`product`.`pro_active` AS `pro_active`,`product`.`pro_count` AS `pro_count`,`product`.`pro_createdat` AS `pro_createdat`,`product`.`pro_catid` AS `pro_catid`,`product`.`pro_adminid` AS `pro_adminid`,`cart`.`cart_id` AS `cart_id`,`cart`.`cart_userid` AS `cart_userid`,`cart`.`cart_proid` AS `cart_proid`,`cart`.`cart_ordersid` AS `cart_ordersid`,`cart`.`cart_ordersprice` AS `cart_ordersprice` from (`cart` join `product` on(`cart`.`cart_proid` = `product`.`pro_id`)) where `cart`.`cart_ordersid` = 0 group by `cart`.`cart_proid`,`cart`.`cart_userid`,`cart`.`cart_ordersid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordersdetailview`
--

/*!50001 DROP VIEW IF EXISTS `ordersdetailview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ordersdetailview` AS select sum(`product`.`pro_price` - `product`.`pro_price` * (`product`.`pro_discount` / 100)) AS `pros_price`,count(`cart`.`cart_id`) AS `pros_count`,`product`.`pro_id` AS `pro_id`,`product`.`pro_name` AS `pro_name`,`product`.`pro_name_ar` AS `pro_name_ar`,`product`.`pro_desc` AS `pro_desc`,`product`.`pro_desc_ar` AS `pro_desc_ar`,`product`.`pro_color` AS `pro_color`,`product`.`pro_color_ar` AS `pro_color_ar`,`product`.`pro_image` AS `pro_image`,`product`.`pro_price` AS `pro_price`,`product`.`pro_shipping` AS `pro_shipping`,`product`.`pro_delivery` AS `pro_delivery`,`product`.`pro_rate` AS `pro_rate`,`product`.`pro_discount` AS `pro_discount`,`product`.`pro_payment` AS `pro_payment`,`product`.`pro_active` AS `pro_active`,`product`.`pro_count` AS `pro_count`,`product`.`pro_createdat` AS `pro_createdat`,`product`.`pro_catid` AS `pro_catid`,`product`.`pro_adminid` AS `pro_adminid`,`cart`.`cart_id` AS `cart_id`,`cart`.`cart_userid` AS `cart_userid`,`cart`.`cart_proid` AS `cart_proid`,`cart`.`cart_ordersid` AS `cart_ordersid`,`cart`.`cart_ordersprice` AS `cart_ordersprice` from (`cart` join `product` on(`cart`.`cart_proid` = `product`.`pro_id`)) where `cart`.`cart_ordersid` <> 0 group by `cart`.`cart_proid`,`cart`.`cart_userid`,`cart`.`cart_ordersid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ordersview`
--

/*!50001 DROP VIEW IF EXISTS `ordersview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `ordersview` AS select `orders`.`orders_id` AS `orders_id`,`orders`.`orders_price` AS `orders_price`,`orders`.`orders_deliveryprice` AS `orders_deliveryprice`,`orders`.`orders_totalprice` AS `orders_totalprice`,`orders`.`orders_couponid` AS `orders_couponid`,`orders`.`orders_coupondiscount` AS `orders_coupondiscount`,`orders`.`orders_paymentmethod` AS `orders_paymentmethod`,`orders`.`orders_type` AS `orders_type`,`orders`.`orders_status` AS `orders_status`,`orders`.`orders_createdat` AS `orders_createdat`,`orders`.`orders_deleted` AS `orders_deleted`,`orders`.`orders_addressid` AS `orders_addressid`,`orders`.`orders_deliveryid` AS `orders_deliveryid`,`orders`.`orders_userid` AS `orders_userid`,`address`.`address_id` AS `address_id`,`address`.`address_name` AS `address_name`,`address`.`address_lat` AS `address_lat`,`address`.`address_long` AS `address_long`,`address`.`address_street` AS `address_street`,`address`.`address_city` AS `address_city`,`address`.`address_userid` AS `address_userid` from (`orders` left join `address` on(`orders`.`orders_addressid` = `address`.`address_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `producttopselling`
--

/*!50001 DROP VIEW IF EXISTS `producttopselling`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `producttopselling` AS select count(`cart`.`cart_id`) AS `cart_procount`,`product`.`pro_price` - `product`.`pro_price` * (`product`.`pro_discount` / 100) AS `priceafterdiscount`,`cart`.`cart_id` AS `cart_id`,`cart`.`cart_userid` AS `cart_userid`,`cart`.`cart_proid` AS `cart_proid`,`cart`.`cart_ordersid` AS `cart_ordersid`,`cart`.`cart_ordersprice` AS `cart_ordersprice`,`product`.`pro_id` AS `pro_id`,`product`.`pro_name` AS `pro_name`,`product`.`pro_name_ar` AS `pro_name_ar`,`product`.`pro_desc` AS `pro_desc`,`product`.`pro_desc_ar` AS `pro_desc_ar`,`product`.`pro_color` AS `pro_color`,`product`.`pro_color_ar` AS `pro_color_ar`,`product`.`pro_image` AS `pro_image`,`product`.`pro_price` AS `pro_price`,`product`.`pro_shipping` AS `pro_shipping`,`product`.`pro_delivery` AS `pro_delivery`,`product`.`pro_rate` AS `pro_rate`,`product`.`pro_discount` AS `pro_discount`,`product`.`pro_payment` AS `pro_payment`,`product`.`pro_active` AS `pro_active`,`product`.`pro_count` AS `pro_count`,`product`.`pro_createdat` AS `pro_createdat`,`product`.`pro_catid` AS `pro_catid`,`product`.`pro_adminid` AS `pro_adminid` from (`cart` join `product` on(`cart`.`cart_proid` = `product`.`pro_id`)) where `cart`.`cart_ordersid` <> 0 group by `cart`.`cart_proid` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `productview`
--

/*!50001 DROP VIEW IF EXISTS `productview`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `productview` AS select `product`.`pro_id` AS `pro_id`,`product`.`pro_name` AS `pro_name`,`product`.`pro_name_ar` AS `pro_name_ar`,`product`.`pro_desc` AS `pro_desc`,`product`.`pro_desc_ar` AS `pro_desc_ar`,`product`.`pro_color` AS `pro_color`,`product`.`pro_color_ar` AS `pro_color_ar`,`product`.`pro_image` AS `pro_image`,`product`.`pro_price` AS `pro_price`,`product`.`pro_shipping` AS `pro_shipping`,`product`.`pro_delivery` AS `pro_delivery`,`product`.`pro_rate` AS `pro_rate`,`product`.`pro_discount` AS `pro_discount`,`product`.`pro_payment` AS `pro_payment`,`product`.`pro_active` AS `pro_active`,`product`.`pro_count` AS `pro_count`,`product`.`pro_createdat` AS `pro_createdat`,`product`.`pro_catid` AS `pro_catid`,`product`.`pro_adminid` AS `pro_adminid`,`product`.`pro_price` - `product`.`pro_price` * (`product`.`pro_discount` / 100) AS `priceafterdiscount`,`product`.`pro_price` * (`product`.`pro_shipping` / 100) AS `shippingprice`,`product`.`pro_price` * (`product`.`pro_delivery` / 100) AS `deliveryprice`,`categorie`.`categorie_id` AS `categorie_id`,`categorie`.`categorie_name` AS `categorie_name`,`categorie`.`categorie_name_ar` AS `categorie_name_ar`,`categorie`.`categorie_image` AS `categorie_image`,`categorie`.`categorie_createdat` AS `categorie_createdat` from (`product` join `categorie` on(`product`.`pro_catid` = `categorie`.`categorie_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `userfavorite`
--

/*!50001 DROP VIEW IF EXISTS `userfavorite`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */

/*!50001 VIEW `userfavorite` AS select `user`.`user_id` AS `user_id`,`product`.`pro_id` AS `pro_id`,`product`.`pro_name` AS `pro_name`,`product`.`pro_name_ar` AS `pro_name_ar`,`product`.`pro_desc` AS `pro_desc`,`product`.`pro_desc_ar` AS `pro_desc_ar`,`product`.`pro_color` AS `pro_color`,`product`.`pro_color_ar` AS `pro_color_ar`,`product`.`pro_image` AS `pro_image`,`product`.`pro_price` AS `pro_price`,`product`.`pro_shipping` AS `pro_shipping`,`product`.`pro_delivery` AS `pro_delivery`,`product`.`pro_rate` AS `pro_rate`,`product`.`pro_discount` AS `pro_discount`,`product`.`pro_payment` AS `pro_payment`,`product`.`pro_active` AS `pro_active`,`product`.`pro_count` AS `pro_count`,`product`.`pro_createdat` AS `pro_createdat`,`product`.`pro_catid` AS `pro_catid`,`product`.`pro_adminid` AS `pro_adminid`,`product`.`pro_price` - `product`.`pro_price` * (`product`.`pro_discount` / 100) AS `priceafterdiscount`,`favorite`.`fav_id` AS `fav_id`,`favorite`.`fav_userid` AS `fav_userid`,`favorite`.`fav_proid` AS `fav_proid` from ((`favorite` join `user` on(`user`.`user_id` = `favorite`.`fav_userid`)) join `product` on(`product`.`pro_id` = `favorite`.`fav_proid`)) */;
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

-- Dump completed on 2024-02-22  2:14:59
