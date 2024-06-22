-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: May 05, 2022 at 01:37 PM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `airline`
--

-- --------------------------------------------------------

--
-- Table structure for table `business class`
--

DROP TABLE IF EXISTS `business class`;
CREATE TABLE IF NOT EXISTS `business class` (
  `bclass_id` int(10) NOT NULL,
  `b_price` int(5) NOT NULL,
  `type_id` int(10) NOT NULL,
  PRIMARY KEY (`bclass_id`),
  KEY `business class` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `business class`
--

INSERT INTO `business class` (`bclass_id`, `b_price`, `type_id`) VALUES
(11, 11000, 23),
(22, 22000, 74),
(23, 230000, 23),
(24, 240000, 76),
(25, 250000, 76);

-- --------------------------------------------------------

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
CREATE TABLE IF NOT EXISTS `destination` (
  `dest_id` int(10) NOT NULL,
  `dest_name` varchar(10) NOT NULL,
  PRIMARY KEY (`dest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `destination`
--

INSERT INTO `destination` (`dest_id`, `dest_name`) VALUES
(6, 'karachi'),
(7, 'islamabad'),
(8, 'lahore'),
(9, 'skardu'),
(10, 'dubai');

-- --------------------------------------------------------

--
-- Table structure for table `economy class`
--

DROP TABLE IF EXISTS `economy class`;
CREATE TABLE IF NOT EXISTS `economy class` (
  `eclass_id` int(10) NOT NULL,
  `e_price` int(5) NOT NULL,
  `type_id` int(10) NOT NULL,
  PRIMARY KEY (`eclass_id`),
  KEY `economy class` (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `economy class`
--

INSERT INTO `economy class` (`eclass_id`, `e_price`, `type_id`) VALUES
(33, 33000, 65),
(34, 34000, 75),
(35, 35000, 65),
(36, 36000, 75),
(77, 77000, 23);

-- --------------------------------------------------------

--
-- Table structure for table `flight`
--

DROP TABLE IF EXISTS `flight`;
CREATE TABLE IF NOT EXISTS `flight` (
  `flight_id` int(10) NOT NULL,
  `flight_fare` int(5) NOT NULL,
  `flight_dur` varchar(10) NOT NULL,
  `dest_id` int(10) NOT NULL,
  PRIMARY KEY (`flight_id`),
  KEY `flight_ibfk_1` (`dest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flight`
--

INSERT INTO `flight` (`flight_id`, `flight_fare`, `flight_dur`, `dest_id`) VALUES
(44, 256001, '4 hours', 7),
(45, 86574, '3 hours', 6),
(46, 76576, '2 hours', 8),
(47, 65367, '5 hours', 9),
(55, 55000, '6 hours', 10);

-- --------------------------------------------------------

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
CREATE TABLE IF NOT EXISTS `login` (
  `login_id` int(10) NOT NULL,
  `login_pass` varchar(10) NOT NULL,
  PRIMARY KEY (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login`
--

INSERT INTO `login` (`login_id`, `login_pass`) VALUES
(5500, '65356'),
(6600, '7654'),
(7700, '9864'),
(8800, '2585'),
(9900, '86463');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

DROP TABLE IF EXISTS `passenger`;
CREATE TABLE IF NOT EXISTS `passenger` (
  `passenger_id` int(10) NOT NULL,
  `passenger_fname` varchar(10) NOT NULL,
  `passenger_lname` varchar(10) NOT NULL,
  `passenger_cnic` bigint(15) NOT NULL,
  `passenger_num` bigint(11) NOT NULL,
  `passenger_gender` varchar(6) NOT NULL,
  `passenger_email` varchar(20) NOT NULL,
  `passenger_address` text NOT NULL,
  `plane_id` int(10) NOT NULL,
  `flight_id` int(10) NOT NULL,
  `login_id` int(10) NOT NULL,
  PRIMARY KEY (`passenger_id`),
  KEY `passenger_ibfk_1` (`plane_id`),
  KEY `passenger_ibfk_2` (`flight_id`),
  KEY `passenger_ibfk_3` (`login_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`passenger_id`, `passenger_fname`, `passenger_lname`, `passenger_cnic`, `passenger_num`, `passenger_gender`, `passenger_email`, `passenger_address`, `plane_id`, `flight_id`, `login_id`) VALUES
(1, 'khansa', 'safdar', 6110137645844845, 3005003232, 'female', 'khansa@gmail.com', 'house# 1 , s1# 2 F8', 82, 44, 6600),
(2, 'sumra', 'habib', 611014556676, 3007654386, 'female', 'sumra76@gmail.com', 'house#3 , st#4 I8', 83, 55, 5500),
(3, 'hashim', 'safdar', 6110137755844878, 3007853546, 'male', 'hashim@gmail.com', 'house#5 st#6 E11', 84, 46, 8800),
(4, 'umer', 'sajid', 6110145878676, 3003579682, 'male', 'umer@gmail.com', 'house#7 st#8 F6', 85, 45, 7700),
(5, 'umer', 'zafar', 6110162475327, 3005456745, 'male', 'umer3@gmail.com', 'house#9 st#10 I9', 86, 47, 9900);

-- --------------------------------------------------------

--
-- Table structure for table `plane`
--

DROP TABLE IF EXISTS `plane`;
CREATE TABLE IF NOT EXISTS `plane` (
  `plane_id` int(10) NOT NULL COMMENT 'id of the plane',
  `no_of_seats` int(5) NOT NULL COMMENT 'number of seats',
  PRIMARY KEY (`plane_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `plane`
--

INSERT INTO `plane` (`plane_id`, `no_of_seats`) VALUES
(82, 200),
(83, 205),
(84, 210),
(85, 215),
(86, 220);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
CREATE TABLE IF NOT EXISTS `route` (
  `route_id` int(10) NOT NULL,
  `dep_place` varchar(10) NOT NULL,
  `dep_date` date NOT NULL,
  `dep_time` time(5) NOT NULL,
  `stay_places` int(5) NOT NULL,
  `flight_id` int(10) NOT NULL,
  PRIMARY KEY (`route_id`),
  KEY `route_ibfk_1` (`flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `dep_place`, `dep_date`, `dep_time`, `stay_places`, `flight_id`) VALUES
(91, 'lahore', '2022-05-03', '07:00:00.00000', 1, 44),
(92, 'islamabad', '2022-05-11', '17:01:14.00008', 0, 46),
(93, 'faisalabad', '2022-05-09', '05:01:14.00000', 2, 55),
(94, 'karachi', '2022-05-10', '07:01:14.00000', 1, 47),
(95, 'lahore', '2022-05-19', '09:12:14.00000', 0, 55);

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `type_id` int(10) NOT NULL,
  `flight_id` int(10) NOT NULL,
  PRIMARY KEY (`type_id`),
  KEY `type_ibfk_1` (`flight_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `flight_id`) VALUES
(23, 44),
(65, 45),
(76, 46),
(75, 47),
(74, 55);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `business class`
--
ALTER TABLE `business class`
  ADD CONSTRAINT `business class` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`);

--
-- Constraints for table `economy class`
--
ALTER TABLE `economy class`
  ADD CONSTRAINT `economy class` FOREIGN KEY (`type_id`) REFERENCES `type` (`type_id`);

--
-- Constraints for table `flight`
--
ALTER TABLE `flight`
  ADD CONSTRAINT `flight_ibfk_1` FOREIGN KEY (`dest_id`) REFERENCES `destination` (`dest_id`);

--
-- Constraints for table `passenger`
--
ALTER TABLE `passenger`
  ADD CONSTRAINT `passenger_ibfk_1` FOREIGN KEY (`plane_id`) REFERENCES `plane` (`plane_id`),
  ADD CONSTRAINT `passenger_ibfk_2` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`),
  ADD CONSTRAINT `passenger_ibfk_3` FOREIGN KEY (`login_id`) REFERENCES `login` (`login_id`);

--
-- Constraints for table `route`
--
ALTER TABLE `route`
  ADD CONSTRAINT `route_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`);

--
-- Constraints for table `type`
--
ALTER TABLE `type`
  ADD CONSTRAINT `type_ibfk_1` FOREIGN KEY (`flight_id`) REFERENCES `flight` (`flight_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;





-- 1.	List of passengers and their  flight duration
SELECT  Passenger_id , Passenger_fname , Passenger_lname , f.flight_id, Flight_dur
FROM    passenger p, flight f
WHERE   p.flight_id= f.flight_id  ;

-- 2.	Produce list of passengers having  flight id ‘201’
SELECT  Passenger_id , Passenger_fname , Passenger_lname  
FROM    passenger
WHERE  flight_id=’201’  ;

-- 3.	List the total flight avaliable ,max flight fare and min flight fare 
SELECT  COUNT(flight_id) AS tot_flights, MAX(flight_fare) AS maxfare,MIN(flight_fare) AS minfare
FROM    flight  ;


-- 4.	List only flight ids that are booked
SELECT   DISTINCT flight_id
FROM    passenger;

-- 5.	List all passengers whose last name is “khan”
SELECT  Passenger_id , Passenger_fname , Passenger_lname  
FROM    passenger
WHERE  Passenger_lname LIKE ‘%Khan%’  ;

-- Question #02
-- 8 level queries

-- 1.Print flight duration and fare of flight going to islamabad
SELECT flight_dur,flight_fare 
FROM flight 
WHERE dest_id=( SELECT dest_id 
FROM destination 
WHERE dest_name='islamabad');

-- 2.Print name of passenger going to skardu
SELECT passenger_id,passenger_fname,passenger_lname 
FROM passenger 
WHERE flight_id=( SELECT flight_id 
FROM flight 
WHERE dest_id=( SELECT dest_id FROM destination 
WHERE dest_name='skardu'));


-- 3.List passengers whose flight duration is 3hrs
SELECT  Passenger_id , Passenger_fname , Passenger_lname  
FROM    passenger
WHERE  flight_id= ( SELECT flight_id
FROM    flight
WHERE  flight_dur= "3 hrs" ) ;

