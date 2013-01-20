-- phpMyAdmin SQL Dump
-- version 2.11.6
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 20, 2013 at 04:57 PM
-- Server version: 5.0.51
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `bdbazr`
--

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `cat_id` decimal(2,0) NOT NULL,
  `cat_name` varchar(80) collate utf8_unicode_ci NOT NULL,
  `cat_status` decimal(1,0) NOT NULL,
  PRIMARY KEY  (`cat_id`),
  KEY `cat_name` (`cat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Triggers `category`
--
DROP TRIGGER IF EXISTS `bdbazr`.`category_before_insert_trigger`;
DELIMITER //
CREATE TRIGGER `bdbazr`.`category_before_insert_trigger` BEFORE INSERT ON `bdbazr`.`category`
 FOR EACH ROW BEGIN
Declare
max_id DECIMAL(2);
select max(cat_id) into max_id from `category`;
	if max_id is not null then
		set new.cat_id=max_id+1;
    else
		set new.cat_id=10;
	end if;
END
//
DELIMITER ;

--
-- Dumping data for table `category`
--


-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE `sub_category` (
  `subcat_id` decimal(4,0) NOT NULL,
  `cat_id` decimal(2,0) NOT NULL,
  `subcat_name` varchar(80) collate utf8_unicode_ci NOT NULL,
  `subcat_status` decimal(1,0) NOT NULL,
  PRIMARY KEY  (`subcat_id`),
  KEY `subcat_name` (`subcat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=COMPACT;

--
-- Triggers `sub_category`
--
DROP TRIGGER IF EXISTS `bdbazr`.`subcategory_before_insert_trigger`;
DELIMITER //
CREATE TRIGGER `bdbazr`.`subcategory_before_insert_trigger` BEFORE INSERT ON `bdbazr`.`sub_category`
 FOR EACH ROW BEGIN
Declare
max_id DECIMAL(4);
select max(subcat_id) into max_id from `sub_category` where cat_id = new.cat_id;
	if max_id is not null then
		set new.subcat_id=max_id+1;
    else
		set new.subcat_id=new.cat_id*100;
	end if;
END
//
DELIMITER ;

--
-- Dumping data for table `sub_category`
--

