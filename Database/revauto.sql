-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 03, 2019 at 04:07 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `revauto`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand_new_items`
--

DROP TABLE IF EXISTS `brand_new_items`;
CREATE TABLE IF NOT EXISTS `brand_new_items` (
  `prod_id` int(6) NOT NULL,
  `restock_level` int(6) NOT NULL,
  PRIMARY KEY (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `components`
--

DROP TABLE IF EXISTS `components`;
CREATE TABLE IF NOT EXISTS `components` (
  `component_id` int(6) NOT NULL AUTO_INCREMENT,
  `component_name` varchar(32) NOT NULL,
  `qty` int(6) NOT NULL,
  `prod_id` int(6) NOT NULL,
  PRIMARY KEY (`component_id`),
  UNIQUE KEY `prod_id` (`component_id`),
  UNIQUE KEY `proid_UNIQUE` (`prod_id`),
  KEY `prod_id_idx` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ordered_items`
--

DROP TABLE IF EXISTS `ordered_items`;
CREATE TABLE IF NOT EXISTS `ordered_items` (
  `prod_id` int(6) NOT NULL,
  `order_id` int(6) NOT NULL,
  `ordered_qty` int(6) NOT NULL,
  KEY `ord_prod_id` (`prod_id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `prod_id` int(6) NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(32) NOT NULL,
  `brandname` varchar(32) NOT NULL,
  `quality` varchar(32) NOT NULL,
  `category` enum('tires','engine') NOT NULL,
  `type` enum('oil','car engine') NOT NULL,
  `size` int(10) NOT NULL,
  `purchase_price` int(9) NOT NULL,
  `stocks_left` int(11) NOT NULL,
  PRIMARY KEY (`prod_id`),
  UNIQUE KEY `prod_id_UNIQUE` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchased_details`
--

DROP TABLE IF EXISTS `purchased_details`;
CREATE TABLE IF NOT EXISTS `purchased_details` (
  `purchased_id` int(6) NOT NULL,
  `prod_id` int(6) NOT NULL,
  `qty` int(6) NOT NULL,
  KEY `purchased_id` (`purchased_id`),
  KEY `det_prod_id` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchased_items`
--

DROP TABLE IF EXISTS `purchased_items`;
CREATE TABLE IF NOT EXISTS `purchased_items` (
  `purchased_id` int(6) NOT NULL AUTO_INCREMENT,
  `purchased_date` datetime NOT NULL,
  `total_amount` int(11) NOT NULL,
  `supplier_id` int(6) NOT NULL,
  PRIMARY KEY (`purchased_id`),
  KEY `pur_supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

DROP TABLE IF EXISTS `purchase_orders`;
CREATE TABLE IF NOT EXISTS `purchase_orders` (
  `order_id` int(6) NOT NULL AUTO_INCREMENT,
  `ordered_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total_amount` int(8) NOT NULL,
  `status` enum('pending','ordered') NOT NULL,
  `supplier_id` int(6) NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `sup_supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_replacements`
--

DROP TABLE IF EXISTS `purchase_replacements`;
CREATE TABLE IF NOT EXISTS `purchase_replacements` (
  `preplace_id` int(6) NOT NULL AUTO_INCREMENT,
  `qty` int(7) NOT NULL,
  `reason` varchar(150) NOT NULL,
  `replacement` varchar(10) NOT NULL,
  `replacement_qty` int(11) NOT NULL,
  `status` enum('damage','unsealed') NOT NULL,
  `replaced_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `prod_id` int(6) NOT NULL,
  `supplier_id` int(6) NOT NULL,
  PRIMARY KEY (`preplace_id`),
  KEY `pre_prod_id` (`prod_id`),
  KEY `pre_supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

DROP TABLE IF EXISTS `purchase_returns`;
CREATE TABLE IF NOT EXISTS `purchase_returns` (
  `preturn_id` int(6) NOT NULL AUTO_INCREMENT,
  `reason` varchar(150) NOT NULL,
  `qty` int(9) NOT NULL,
  `total_amount` int(9) NOT NULL,
  `returned_date` datetime NOT NULL,
  `prod_id` int(6) NOT NULL,
  `supplier_id` int(6) NOT NULL,
  PRIMARY KEY (`preturn_id`),
  KEY `ret_prod_id` (`prod_id`),
  KEY `ret_supplier_id` (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `received_items`
--

DROP TABLE IF EXISTS `received_items`;
CREATE TABLE IF NOT EXISTS `received_items` (
  `prod_id` int(6) NOT NULL,
  `order_id` int(6) NOT NULL,
  `received_qty` int(7) NOT NULL,
  `received_date` datetime NOT NULL,
  KEY `rec_prod_id` (`prod_id`),
  KEY `rec_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `supplier_id` int(6) NOT NULL AUTO_INCREMENT,
  `supplier_name` int(32) NOT NULL,
  `address` varchar(32) NOT NULL,
  `contact_person` varchar(32) NOT NULL,
  `contact_no` int(11) NOT NULL,
  PRIMARY KEY (`supplier_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `supplier_product`
--

DROP TABLE IF EXISTS `supplier_product`;
CREATE TABLE IF NOT EXISTS `supplier_product` (
  `supplier_id` int(6) NOT NULL,
  `prod_id` int(6) NOT NULL,
  KEY `supplier_id` (`supplier_id`),
  KEY `sup_prod_id` (`prod_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `surplus_items`
--

DROP TABLE IF EXISTS `surplus_items`;
CREATE TABLE IF NOT EXISTS `surplus_items` (
  `prod_id` int(6) NOT NULL,
  `number_of_components` int(6) NOT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `prod_id` (`prod_id`,`number_of_components`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(32) NOT NULL,
  `last_name` varchar(32) NOT NULL,
  `address` varchar(30) NOT NULL,
  `contact_no` int(11) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` enum('admin','employee') NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brand_new_items`
--
ALTER TABLE `brand_new_items`
  ADD CONSTRAINT `prod_id` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `components`
--
ALTER TABLE `components`
  ADD CONSTRAINT `proid` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ordered_items`
--
ALTER TABLE `ordered_items`
  ADD CONSTRAINT `ord_prod_id` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `order_id` FOREIGN KEY (`order_id`) REFERENCES `purchase_orders` (`order_id`) ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`prod_id`) REFERENCES `surplus_items` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchased_details`
--
ALTER TABLE `purchased_details`
  ADD CONSTRAINT `det_prod_id` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchased_id` FOREIGN KEY (`purchased_id`) REFERENCES `purchased_items` (`purchased_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchased_items`
--
ALTER TABLE `purchased_items`
  ADD CONSTRAINT `pur_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `sup_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_replacements`
--
ALTER TABLE `purchase_replacements`
  ADD CONSTRAINT `pre_prod_id` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pre_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON UPDATE CASCADE;

--
-- Constraints for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD CONSTRAINT `ret_prod_id` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `ret_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON UPDATE CASCADE;

--
-- Constraints for table `received_items`
--
ALTER TABLE `received_items`
  ADD CONSTRAINT `rec_order_id` FOREIGN KEY (`order_id`) REFERENCES `purchase_orders` (`order_id`),
  ADD CONSTRAINT `rec_prod_id` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`) ON UPDATE CASCADE;

--
-- Constraints for table `supplier_product`
--
ALTER TABLE `supplier_product`
  ADD CONSTRAINT `sup_prod_id` FOREIGN KEY (`prod_id`) REFERENCES `products` (`prod_id`),
  ADD CONSTRAINT `supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`supplier_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
