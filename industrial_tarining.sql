-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.7.33 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for industrial-training
CREATE DATABASE IF NOT EXISTS `industrial-training` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `industrial-training`;

-- Dumping structure for table industrial-training.academic_year
CREATE TABLE IF NOT EXISTS `academic_year` (
  `academicYearID` int(11) NOT NULL AUTO_INCREMENT,
  `academicYear` varchar(30) NOT NULL,
  `status` int(11) NOT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`academicYearID`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.academic_year: 6 rows
/*!40000 ALTER TABLE `academic_year` DISABLE KEYS */;
INSERT INTO `academic_year` (`academicYearID`, `academicYear`, `status`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(2, '2017', 0, '2018-10-05 04:44:41', '2020-02-02 08:26:25', 164),
	(3, '2018', 0, '2020-02-02 08:26:25', '2020-03-07 14:18:11', 1),
	(4, '2019', 0, '2020-03-06 18:13:56', '2020-03-07 14:53:29', 1),
	(5, '2020', 0, '2020-03-07 14:59:45', '2022-03-27 21:02:25', 1),
	(6, '2021', 0, '2022-03-27 20:06:51', '2022-03-27 20:57:44', 1),
	(7, '2022', 1, '2022-03-27 21:02:25', '2022-03-28 10:43:14', 1);
/*!40000 ALTER TABLE `academic_year` ENABLE KEYS */;

-- Dumping structure for table industrial-training.activities
CREATE TABLE IF NOT EXISTS `activities` (
  `activity_ID` int(11) NOT NULL AUTO_INCREMENT,
  `activity_tittle` varchar(255) NOT NULL,
  `activity_description` varchar(255) NOT NULL,
  `main_activity_ID` int(11) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `createdBy` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`activity_ID`),
  KEY `activityFK` (`main_activity_ID`),
  CONSTRAINT `activityFK` FOREIGN KEY (`main_activity_ID`) REFERENCES `main_activities` (`main_activity_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.activities: ~1 rows (approximately)
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` (`activity_ID`, `activity_tittle`, `activity_description`, `main_activity_ID`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(3, 'sub11', 'description of sub 11', 2, '2022-03-29 13:23:03', '2022-03-29 13:41:57', 1),
	(4, 'MCL Challenge', 'This is for', 4, '2022-03-29 16:10:57', '2022-03-29 16:10:57', 1);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;

-- Dumping structure for table industrial-training.activity_schedule
CREATE TABLE IF NOT EXISTS `activity_schedule` (
  `schedule_ID` int(11) NOT NULL AUTO_INCREMENT,
  `starting_date` date NOT NULL,
  `end_date` date NOT NULL,
  `activity_ID` int(11) NOT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`schedule_ID`),
  KEY `scheduleFK` (`activity_ID`),
  CONSTRAINT `scheduleFK` FOREIGN KEY (`activity_ID`) REFERENCES `activities` (`activity_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.activity_schedule: ~1 rows (approximately)
/*!40000 ALTER TABLE `activity_schedule` DISABLE KEYS */;
INSERT INTO `activity_schedule` (`schedule_ID`, `starting_date`, `end_date`, `activity_ID`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(7, '2022-04-01', '2022-04-15', 4, '2022-04-01 12:24:43', '2022-04-01 12:24:43', 1),
	(8, '2022-04-09', '2022-04-22', 3, '2022-04-01 12:24:56', '2022-04-01 12:24:56', 1);
/*!40000 ALTER TABLE `activity_schedule` ENABLE KEYS */;

-- Dumping structure for table industrial-training.departments
CREATE TABLE IF NOT EXISTS `departments` (
  `departmentID` int(11) NOT NULL AUTO_INCREMENT,
  `schoolID` int(11) NOT NULL,
  `departmentName` varchar(150) NOT NULL,
  `departmentCode` varchar(40) NOT NULL,
  `email` varchar(145) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`departmentID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.departments: 2 rows
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` (`departmentID`, `schoolID`, `departmentName`, `departmentCode`, `email`, `status`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(1, 5, 'Department of Computer Science', 'DCS', 'hdcs@suza.ac.tz', 1, '2020-03-09 10:49:54', '2020-03-09 10:49:54', 1),
	(2, 5, 'Department of Social Sciencevvvv', 'DSS', 'departmentofsocial@hotmail.com', 1, '2022-03-27 16:43:55', '2022-03-28 13:02:16', 1);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;

-- Dumping structure for table industrial-training.employmentstatus
CREATE TABLE IF NOT EXISTS `employmentstatus` (
  `employmentStatusID` int(11) NOT NULL AUTO_INCREMENT,
  `studentID` int(11) DEFAULT NULL,
  `employer` varchar(250) DEFAULT NULL,
  `employerAddress` varchar(150) DEFAULT NULL,
  `placeOfWork` varchar(150) DEFAULT NULL,
  `designation` varchar(100) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`employmentStatusID`),
  KEY `applicantID_idx` (`studentID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.employmentstatus: ~12 rows (approximately)
/*!40000 ALTER TABLE `employmentstatus` DISABLE KEYS */;
INSERT INTO `employmentstatus` (`employmentStatusID`, `studentID`, `employer`, `employerAddress`, `placeOfWork`, `designation`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(1, 156, 'Ministry of Agricultural Naturalresource and Livestock', NULL, 'Maruhubi', 'Officer  ', '2019-03-04 08:00:40', '2019-03-04 08:00:40', 578),
	(2, 190, 'Ministry of education', NULL, 'Kiongwe', 'Teacher', '2019-03-05 05:27:59', '2019-03-05 05:27:59', 612),
	(3, 198, 'Ministry of education', NULL, 'Mtoni kidatu', 'Teacher', '2019-03-05 05:31:32', '2019-03-05 05:31:32', 620),
	(4, 209, 'Wizara ya Elimu na mafunzo ya elimu zanzibar', NULL, 'Jangombe Secondary School', 'Ualimu', '2019-03-05 09:47:59', '2019-03-05 09:47:59', 631),
	(5, 228, 'Tatu', NULL, 'Matemwe', 'Mwalimu', '2019-03-07 06:26:21', '2019-03-07 06:26:21', 650),
	(6, 151, 'Ministry of education in zanzibar', NULL, 'Nyerere secondary', 'Teachee', '2019-03-07 07:12:54', '2019-03-07 07:12:54', 573),
	(7, 251, 'WIZARA YA ELIMU NA MAFUNZO YA AMALI', NULL, 'KILIMAHEWA -ZANZIBAR', 'MWALIMU', '2019-03-10 04:23:17', '2019-03-10 04:23:17', 673),
	(8, 229, 'Ministry of education and vocational training', NULL, 'Nyerere primary school', 'Teacher', '2019-03-10 07:13:41', '2019-03-10 07:13:41', 651),
	(9, 233, 'Immigration Tanzania ', NULL, 'P. O. Box 1354 Zanzibar ', '', '2019-03-11 06:01:27', '2019-10-16 10:12:20', 422),
	(10, 270, 'teacher', NULL, 'magogoni', 'teacher', '2019-03-12 07:23:48', '2019-03-12 07:29:04', 692),
	(11, 142, 'Ministry of education and vocational training ', NULL, 'Magogoni primary school', 'Jang&#039;ombe ', '2019-03-19 23:38:21', '2019-03-19 23:50:47', 564),
	(12, 202, 'Goverment', NULL, 'Ministry of education and vocational training zanzibar', 'Nyerere secondary school', '2019-04-01 05:48:33', '2019-04-01 05:48:33', 624);
/*!40000 ALTER TABLE `employmentstatus` ENABLE KEYS */;

-- Dumping structure for table industrial-training.instructor
CREATE TABLE IF NOT EXISTS `instructor` (
  `instructorID` int(11) NOT NULL AUTO_INCREMENT,
  `departmentID` int(11) DEFAULT NULL,
  `salutation` varchar(10) NOT NULL,
  `titleID` int(11) DEFAULT NULL,
  `firstName` varchar(100) NOT NULL,
  `middleName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `instructorName` varchar(150) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `employmentStatusID` varchar(45) DEFAULT NULL,
  `instructorStatus` varchar(45) DEFAULT NULL,
  `officeNumber` varchar(45) DEFAULT NULL,
  `isLogin` tinyint(4) DEFAULT NULL,
  `instructorImage` text,
  `userID` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`instructorID`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.instructor: ~71 rows (approximately)
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` (`instructorID`, `departmentID`, `salutation`, `titleID`, `firstName`, `middleName`, `lastName`, `instructorName`, `gender`, `phoneNumber`, `email`, `employmentStatusID`, `instructorStatus`, `officeNumber`, `isLogin`, `instructorImage`, `userID`, `status`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(1, 1, 'Mr', 1, 'HMY', '', 'HOD', 'HMY HOD', '', '0777810700', 'massoudhamad@gmail.com', '1', '1', '', 1, NULL, 168, 1, '2019-02-23 07:02:38', '2019-03-06 05:14:03', 168),
	(2, 9, 'Prof', 1, 'YUNIS ', '', 'MUSA', 'YUNIS  MUSA', 'Male', '0778571207', 'abuikrama@yahoo.com', '1', '1', '0778571207', 1, NULL, 694, 1, '2019-02-27 05:17:34', '2019-03-15 04:02:22', 694),
	(3, 9, 'Dr', 4, 'NASSOR ', '', 'BAKAR', 'NASSOR  BAKAR', 'Male', '777451398', 'dr.nassorhamad2030@gmail.com', '1', '1', 'Old Building', 1, '55691.jpg', 695, 1, '2019-02-27 05:18:38', '2019-03-18 02:57:19', 695),
	(4, 9, '', NULL, 'ISMAEL', '', 'SENGENDO', 'ISMAEL SENGENDO', NULL, '+255 778927003', 'lsmasengendo2001@yahoo.com', NULL, '1', NULL, 1, NULL, 696, 0, '2019-02-27 05:21:20', '2019-02-27 05:21:20', 421),
	(5, 9, 'Dr', 3, 'ALI ', '', 'SUNKAR', 'ALI  SUNKAR', 'Male', '0773076079', 'abufatma2001@yahoo.ca', '1', '1', 'Examinations Office', 1, NULL, 697, 1, '2019-02-27 05:22:15', '2019-03-15 01:40:19', 697),
	(6, 9, '', NULL, 'OMAR', '', 'ALI', 'OMAR ALI', NULL, '+255 773823825', 'umartz2000@yahoo.com', NULL, '1', NULL, 1, NULL, 698, 0, '2019-02-27 05:23:07', '2019-03-07 04:55:46', 421),
	(7, 4, 'Prof', 2, 'FOWZI ', '', 'BARROW', 'FOWZI  BARROW', 'Male', '0773773619', 'fowzaan75@gmail.com', '1', '1', '0773773619', 1, NULL, 699, 1, '2019-02-27 05:24:21', '2019-03-15 03:44:13', 699),
	(8, 2, '', NULL, 'SULEIMAN ', '', 'SAID', 'SULEIMAN  SAID', NULL, '+255 777 308 411', 'sunsul3@yahoo.com', NULL, '1', NULL, 1, NULL, 700, 0, '2019-02-27 05:25:26', '2019-02-27 05:25:26', 421),
	(9, 4, 'Mr', 4, 'ABDALLA ', '', 'ALI', 'ABDALLA  ALI', 'Male', '777415495', 'ahalyfazy@yahoo.com', '1', '1', 'New Building', 1, NULL, 701, 1, '2019-02-27 05:26:13', '2019-03-15 03:29:31', 701),
	(10, 2, 'Ms', 4, 'AZIZA ', '', 'IBRAHIM', 'AZIZA  IBRAHIM', 'Female', '0777494498', 'azizahamdun@hotmail.com', '1', '1', '', 1, NULL, 702, 1, '2019-02-27 05:27:00', '2019-03-15 03:53:50', 702),
	(11, 2, 'Mr', 4, 'SUWEID ', '', 'SUWEID ', 'SUWEID  SUWEID ', 'Male', '0777434564', 'suwedi.suwedi@suza.ac.tz', '2', '1', '', 1, NULL, 703, 1, '2019-02-27 05:27:47', '2019-08-02 04:08:16', 703),
	(12, 3, '', NULL, 'MWANATUMU ', '', 'HASSAN', 'MWANATUMU  HASSAN', NULL, '+255 623 966 916', 'tumuhassan19@gmail.com', NULL, '1', NULL, 1, NULL, 704, 0, '2019-02-27 05:29:05', '2019-02-27 05:29:05', 421),
	(13, 3, 'Mr', 5, 'AMOS ', '', 'NGOGE', 'AMOS  NGOGE', 'Male', '0715733120', 'amostabley@yahoo.com', '1', '1', '', 1, NULL, 705, 1, '2019-02-27 05:29:42', '2019-03-15 04:41:07', 705),
	(14, 3, 'Ms', 5, 'MWANAJUMA ', '', 'ALI', 'MWANAJUMA  ALI', 'Female', '0778241212', 'ajumi2010@gmail.com', '1', '1', '', 1, NULL, 706, 1, '2019-02-27 05:31:07', '2019-03-15 03:35:04', 706),
	(15, 3, 'Ms', 4, 'SAADE', '', 'MBAROUK', 'SAADE MBAROUK', 'Female', '0773041808', 'khasma10@yahoo.com', '1', '1', '', 1, NULL, 707, 1, '2019-02-27 05:31:58', '2019-03-15 03:33:59', 707),
	(16, 3, 'Mr', 5, 'SHEHE ', '', 'NASSOR', 'SHEHE  NASSOR', 'Male', '0777862683', 'shesuna1981@gmail.com', '1', '1', '14 Old Building', 1, NULL, 708, 1, '2019-02-27 05:33:07', '2019-03-19 04:31:38', 708),
	(17, 3, '', NULL, 'ULFAT ', '', 'IBRAHIM  ', 'ULFAT  IBRAHIM  ', NULL, '+255 777 481 252', 'missullu@yahoo.com', NULL, '1', NULL, 1, NULL, 709, 0, '2019-02-27 05:33:57', '2019-02-27 05:33:57', 421),
	(18, 2, '', NULL, 'MAZHAR ', '', 'SABRI', 'MAZHAR  SABRI', NULL, '+255 773 216 584', 'sabri2003@yahoo.com', NULL, '1', NULL, 1, NULL, 710, 0, '2019-02-27 05:35:15', '2019-02-27 05:35:15', 421),
	(19, 2, 'Dr', 4, 'MUHAMMED ', '', 'MUHAMMED', 'MUHAMMED  MUHAMMED', 'Male', '0255776582789', 'abuubashiyr@yahoo.com', '1', '1', '0255776582789', 1, NULL, 711, 1, '2019-02-27 05:36:20', '2019-03-15 05:24:09', 0),
	(20, 2, 'Dr', 4, 'HAJI   ', '', 'NYANGE', 'HAJI    NYANGE', 'Male', '0777426913', 'hajinyange1974@gmail.com', '1', '1', '', 1, NULL, 712, 1, '2019-02-27 05:37:06', '2019-03-15 04:01:07', 712),
	(21, 2, 'Mr', 4, 'MUHAMMED ', '', 'ALI ', 'MUHAMMED  ALI ', 'Male', '0773292247', 'maulania7@gmail.com', '1', '1', '', 1, NULL, 713, 1, '2019-02-27 05:37:53', '2019-03-15 06:54:03', 713),
	(22, 2, '', NULL, 'JUMA  ', '', 'KOMBO', 'JUMA   KOMBO', NULL, '+255 777 471 668', 'jumakhator@yahoo.com', NULL, '1', NULL, 1, NULL, 714, 0, '2019-02-27 05:39:06', '2019-02-27 05:39:06', 421),
	(23, 2, 'Mr', 4, 'MOHAMED ', '', 'KHALFAN', 'MOHAMED  KHALFAN', 'Male', '773999897', 'mohdkhalfan@yahoo.com', '1', '1', 'DSS', 1, '855216.jpg', 715, 1, '2019-02-27 05:39:56', '2019-03-15 01:55:50', 715),
	(24, 2, 'Ms', 4, 'JEMA ', '', 'KHALFAN', 'JEMA  KHALFAN', 'Female', '0773216584', 'jemakhalfan5@gmail.com', '1', '1', '', 1, NULL, 716, 1, '2019-02-27 05:41:34', '2019-03-17 05:38:52', 716),
	(25, 1, 'Mr', 5, ' MBAROUK  ', '', 'SALIM', ' MBAROUK   SALIM', 'Male', '0777865315', 'mbarouk2001@yahoo.com', '1', '1', '0777865315', 1, NULL, 717, 1, '2019-02-27 05:43:24', '2019-03-15 03:53:33', 717),
	(26, 1, 'Dr', 3, 'AMAL ', '', 'MOHAMED ', 'AMAL  MOHAMED ', 'Female', '0776424696', 'amelelsheikh74@gmail.com', '1', '1', '121', 1, NULL, 718, 1, '2019-02-27 05:47:30', '2019-03-15 04:01:24', 718),
	(27, 1, 'Dr', 3, 'MUNA ', '', 'ABDELRAHMAN ', 'MUNA  ABDELRAHMAN ', 'Female', '0629820845', 'munamohammed8787@gmail.com', '1', '1', 'Dispensary', 1, '255064.jpg', 719, 1, '2019-02-27 05:48:05', '2019-03-15 03:59:09', 719),
	(28, 6, 'Mr', 4, 'HMY', '', 'DEMO', 'HMY DEMO', 'Male', '0773500429', 'hmytechnologies@gmail.com', '1', '1', '45', 1, NULL, 421, 1, '2019-02-27 07:22:56', '2019-02-27 07:23:15', 421),
	(29, 7, '', NULL, 'ABDU ', '', 'AHMED ', 'ABDU  AHMED ', NULL, '+255 774 771 050', 'ahatet@yahoo.com', NULL, '1', NULL, 1, NULL, 720, 0, '2019-02-28 07:17:22', '2019-02-28 07:30:59', 164),
	(30, 7, 'Mr', 4, 'AKLI ', '', 'BABI ', 'AKLI  BABI ', 'Male', '0773228087', 'ababi007@gmail.com', '1', '1', 'Room 13', 1, NULL, 721, 1, '2019-02-28 07:18:21', '2019-03-15 01:37:51', 721),
	(31, 0, 'Mr', 4, 'HAMAD ', '', 'NASSOR  ', 'HAMAD  NASSOR  ', 'Male', '255777775815', 'cholochukwani@gmail.com', '1', '1', '14 Old Building', 1, NULL, 722, 1, '2019-02-28 07:19:08', '2019-08-10 04:36:04', 722),
	(32, 6, '', NULL, 'RAMADHAN ', '', 'SALUM ', 'RAMADHAN  SALUM ', NULL, '+255 777 866 160', 'ramsonking@hotmail.com', NULL, '1', NULL, 1, NULL, 723, 0, '2019-02-28 07:19:51', '2019-02-28 07:19:51', 164),
	(33, 6, 'Ms', 6, 'MULHAT ', '', 'FASIHI', 'MULHAT  FASIHI', 'Female', '0773818103', 'mulhat_09@yahoo.com', '1', '1', '', 1, NULL, 724, 1, '2019-02-28 07:20:44', '2019-03-15 03:06:22', 724),
	(34, 7, '', NULL, 'SALMA ', '', 'MOHAMMED ', 'SALMA  MOHAMMED ', NULL, '+255 777 480 349', 'satiomh1979@gmail.com', NULL, '1', NULL, 1, NULL, 725, 0, '2019-02-28 07:21:22', '2019-02-28 07:33:10', 164),
	(35, 6, '', NULL, 'TUMU ', '', 'MUSSA ', 'TUMU  MUSSA ', NULL, '+255 773 230 456', 'mussa_tumu@yahoo.com', NULL, '1', NULL, 1, NULL, 726, 0, '2019-02-28 07:22:03', '2019-02-28 07:22:03', 164),
	(36, 6, 'Mr', 4, 'SALIM  ', '', 'SALIM ', 'SALIM   SALIM ', 'Male', '0776101616', 'sathomh@gmail.com', '1', '1', '', 1, NULL, 727, 1, '2019-02-28 07:22:45', '2019-03-29 05:33:32', 727),
	(37, 6, '', NULL, 'ANTONY ', '', ' OCHIENG', 'ANTONY   OCHIENG', NULL, '+255 714 283 887', 'thiringinyi@hotmail.com', NULL, '1', NULL, 1, NULL, 728, 0, '2019-02-28 07:23:24', '2019-02-28 07:23:24', 164),
	(38, 6, 'Mr', 5, 'SALEH ', '', 'HANDHAL ', 'SALEH  HANDHAL ', 'Male', '0773813173', 'handhals@hotmail.com', '1', '1', 'Old Building', 1, NULL, 729, 1, '2019-02-28 07:24:03', '2019-07-23 03:39:58', 729),
	(39, 6, 'Prof', 2, 'MSAFIRI ', '', 'MSHEWA ', 'MSAFIRI  MSHEWA ', 'Male', '713858990', 'msafirimmasa@gmail.com', '1', '1', '0777506735', 1, NULL, 730, 1, '2019-02-28 07:25:29', '2019-03-15 04:03:18', 730),
	(40, 7, 'Mr', 5, 'KHALEF ', '', 'KHAMIS ', 'KHALEF  KHAMIS ', 'Male', '0778339348', 'eng.khalef@gmail.com', '1', '1', 'COMPLAB', 1, NULL, 731, 1, '2019-02-28 07:26:31', '2019-03-15 03:53:24', 731),
	(41, 7, 'Mr', 5, 'KHAMIS ', '', 'KHAMIS ', 'KHAMIS  KHAMIS ', 'Male', '255778429151', 'khamis_masoudi@hotmail.com', '1', '1', '12', 1, NULL, 732, 1, '2019-02-28 07:27:35', '2019-08-06 04:41:47', 732),
	(42, 6, '', NULL, 'EL-BAKRI ', '', 'AHMED ', 'EL-BAKRI  AHMED ', NULL, '+255 777 855 815', 'elbakrish@yahoo.com', NULL, '1', NULL, 1, NULL, 733, 0, '2019-02-28 07:28:57', '2019-02-28 07:28:57', 164),
	(43, 6, '', NULL, 'KHAMIS ', '', 'SAID ', 'KHAMIS  SAID ', NULL, '+255773010806', 'khamsaid1@yahoo.com', NULL, '1', NULL, 1, NULL, 734, 0, '2019-02-28 07:29:55', '2019-02-28 07:29:55', 164),
	(44, 7, '', NULL, 'ALAWI', '', 'ALI', 'ALAWI ALI', NULL, '0777871455', 'ay_ali06@yahoo.com', NULL, '1', NULL, 1, NULL, 735, 0, '2019-03-05 07:29:06', '2019-03-05 07:29:06', 421),
	(45, 7, '', NULL, 'AMOUR', '', 'MOH\'D', 'AMOUR MOH\'D', NULL, '0773657304', 'amoursamo@gmail.com', NULL, '1', NULL, 1, NULL, 736, 0, '2019-03-05 07:30:18', '2019-03-05 07:30:18', 421),
	(46, 7, '', NULL, 'ALI ', '', 'MSHINDO', 'ALI  MSHINDO', NULL, '0773141328', 'allym28@yahoo.com', NULL, '1', NULL, 1, NULL, 737, 0, '2019-03-05 07:31:23', '2019-03-05 07:31:23', 421),
	(47, 7, '', NULL, 'ASHA', '', 'SAID', 'ASHA SAID', NULL, '0777435391', 'ashanassor53@yahoo.com', NULL, '1', NULL, 1, NULL, 738, 0, '2019-03-05 07:32:29', '2019-03-05 07:32:29', 421),
	(48, 7, '', NULL, 'ALI', '', ' SALEH', 'ALI  SALEH', NULL, '0772280545', 'annour06@gmail.com', NULL, '1', NULL, 1, NULL, 739, 0, '2019-03-05 08:07:07', '2019-03-05 08:07:07', 421),
	(49, 7, '', NULL, 'SULEIMAN', '', 'HAMYAR', 'SULEIMAN HAMYAR', NULL, '0777459285', 'seleamz@gmail.com', NULL, '1', NULL, 1, NULL, 740, 0, '2019-03-05 08:08:37', '2019-03-05 08:08:37', 421),
	(50, 7, '', NULL, 'SHARIF', '', 'MOH\'D', 'SHARIF MOH\'D', NULL, '0772776226', 'theresheriff25@gmail.com', NULL, '1', NULL, 1, NULL, 741, 0, '2019-03-05 08:09:49', '2019-03-05 08:09:49', 421),
	(51, 7, '', NULL, 'SAID', '', 'OMAR', 'SAID OMAR', NULL, '0773538337', 'ibnilkhatwab@gmail.com', NULL, '1', NULL, 1, NULL, 742, 0, '2019-03-05 08:10:52', '2019-03-05 08:10:52', 421),
	(52, 7, '', NULL, 'MWANTUM ', '', 'HASSAN', 'MWANTUM  HASSAN', NULL, '077', 'tumhassan@yahoo.com', NULL, '1', NULL, 1, NULL, 743, 0, '2019-03-05 08:13:34', '2019-03-05 08:13:34', 421),
	(53, 1, '', NULL, 'HMY', '', 'MANAGER', 'HMY MANAGER', NULL, '0777810700', 'hmy@hmytechnologies.com', NULL, '1', NULL, 1, NULL, 167, 0, '2019-03-06 06:54:15', '2019-03-06 06:54:15', 164),
	(54, 7, '', NULL, 'HASSAN', '', 'ALI', 'HASSAN ALI', NULL, '0772221952', 'hasaha56@yahoo.com', NULL, '1', NULL, 1, NULL, 744, 0, '2019-03-07 02:09:57', '2019-03-07 02:09:57', 421),
	(55, 6, '', NULL, 'RASHID', '', 'RASHID', 'RASHID RASHID', NULL, '-', 'rjuma2000@yahoo.co.uk', NULL, '1', NULL, 1, NULL, 755, 0, '2019-03-12 05:11:50', '2019-03-12 05:11:50', 421),
	(56, 6, 'Dr', 3, 'KHAMIS', '', 'KHALID', 'KHAMIS KHALID', 'Male', '0778001880', 'khakhasa@yahoo.com', '2', '1', '2222', 1, NULL, 756, 1, '2019-03-12 05:13:12', '2019-03-12 11:58:10', 756),
	(57, 5, 'Mr', 4, 'KHAMIS', '', 'KHALFAN', 'KHAMIS KHALFAN', 'Male', '0778698127', 'khamisi7@hotmail.com', '1', '1', '', 1, NULL, 757, 1, '2019-03-13 06:44:19', '2019-03-15 03:48:44', 757),
	(58, 6, 'Mr', 5, 'OMAR', '', 'HAKUM', 'OMAR HAKUM', 'Male', '0714541186', 'saidomarhakum@yahoo.com', '1', '1', '110', 1, NULL, 758, 1, '2019-03-15 01:35:25', '2019-03-15 01:39:58', 758),
	(59, 5, 'Mr', 6, 'RAMADHAN', '', 'NASSOR', 'RAMADHAN NASSOR', 'Male', '774532383', 'rama.zanzibar83@gmail.com', '1', '1', 'Dispensary', 1, '505938.jpg', 759, 1, '2019-03-15 02:03:46', '2019-03-15 02:21:14', 759),
	(60, 5, 'Mr', 5, 'OMAR', '', 'OMAR', 'OMAR OMAR', 'Male', '0773525892', 'sircounselor@yahoo.com', '2', '1', '210', 1, NULL, 760, 1, '2019-03-15 03:25:22', '2019-03-15 03:38:37', 760),
	(61, 6, 'Mr', 3, 'ANTHONY', '', 'OCHIENG_1', 'ANTHONY OCHIENG_1', 'Male', '0714283887', 'd_norbatus@yahoo.com', '1', '1', '', 1, '344451.jpg', 763, 1, '2019-03-18 03:32:45', '2019-03-18 03:57:26', 763),
	(62, 5, 'Dr', 4, 'NUHA', '', 'ELSADIG', 'NUHA ELSADIG', 'Female', '0779304676', 'nuha_elsadig@hotmail.com', '1', '1', '6', 1, NULL, 764, 1, '2019-07-11 05:45:18', '2019-08-05 08:35:46', 764),
	(63, 3, 'Mr', 4, 'SAJI', '', 'PILLAI', 'SAJI PILLAI', 'Male', '0629801225', 'krishnasaji.17@gmail.com', '1', '1', '', 1, '264133.jpg', 765, 1, '2019-07-11 05:47:29', '2019-08-08 07:31:52', 765),
	(64, 3, 'Dr', 4, 'IMELDA', '', 'ABAS', 'IMELDA ABAS', 'Female', '0629801416', 'imelabas@yahoo.com', '1', '1', '', 1, '350320.jpg', 766, 1, '2019-07-15 02:54:04', '2019-07-15 04:15:10', 766),
	(65, 0, 'Mr', 5, 'ALI', '', 'ABDULLA', 'ALI ABDULLA', 'Male', '0777173967', 'aliabdulla13@gmail.com', '2', '1', '', 1, '368790.jpg', 767, 1, '2019-08-05 06:31:50', '2019-08-05 06:46:13', 767),
	(66, 0, 'Ms', 5, 'KEVSER', '', 'KOCADAG', 'KEVSER KOCADAG', 'Female', '0777326752', 'k.kocadag@live.com', '1', '1', '', 1, NULL, 768, 1, '2019-08-06 02:19:44', '2019-08-06 02:36:45', 768),
	(67, 7, 'Dr', 4, 'ALI', '', 'ADNAN', 'ALI ADNAN', 'Male', '0772086682', 'aliadnn@gmail.com', '2', '1', '', 1, NULL, 769, 1, '2019-08-07 02:51:00', '2019-08-07 04:46:16', 769),
	(68, 7, 'Mr', 5, 'ABDULHAMID', '', 'AHMED', 'ABDULHAMID AHMED', 'Male', '0629816407', 'hamid@sumait.ac.tz', '1', '1', '0629816419', 1, NULL, 770, 1, '2020-02-07 08:10:00', '2020-02-07 08:38:04', 770),
	(69, 7, '', NULL, 'ANTAR', '', 'ABDUL-QAWY', 'ANTAR ABDUL-QAWY', NULL, '0776438887', 'antarabdulqawy@sumait.ac.tz', NULL, '1', NULL, 1, NULL, 771, 0, '2020-02-07 08:11:12', '2020-02-07 08:11:12', 422),
	(70, 7, '', NULL, 'RAYA', '', 'AHMADA', 'RAYA AHMADA', NULL, '0776310512', 'raya.ahmada@suza.ac.tz', NULL, '1', NULL, 1, NULL, 1042, 0, '2020-02-14 08:34:51', '2020-02-14 08:34:51', 164),
	(71, 2, '', NULL, 'HAMAD', '', 'MMANGA', 'HAMAD MMANGA', NULL, '0778989898', 'mmhama@utu.fii', NULL, '1', NULL, 1, NULL, 1043, 0, '2020-02-15 20:16:57', '2020-02-15 20:16:57', 164);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;

-- Dumping structure for table industrial-training.main_activities
CREATE TABLE IF NOT EXISTS `main_activities` (
  `main_activity_ID` int(11) NOT NULL AUTO_INCREMENT,
  `tittle` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `createdBy` int(11) NOT NULL,
  PRIMARY KEY (`main_activity_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.main_activities: ~2 rows (approximately)
/*!40000 ALTER TABLE `main_activities` DISABLE KEYS */;
INSERT INTO `main_activities` (`main_activity_ID`, `tittle`, `description`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(2, 'Kuview data', 'Leo tuataingiza dataaa', '2022-03-29 12:24:42', '2022-03-29 13:22:38', 1),
	(3, 'Ingiza Data', 'President', '2022-03-29 12:25:48', '2022-03-29 12:25:48', 1),
	(4, 'Challenge', 'This is for all challenges', '2022-03-29 16:10:31', '2022-03-29 16:10:31', 1);
/*!40000 ALTER TABLE `main_activities` ENABLE KEYS */;

-- Dumping structure for table industrial-training.organization
CREATE TABLE IF NOT EXISTS `organization` (
  `organizationID` int(11) NOT NULL AUTO_INCREMENT,
  `organizationName` varchar(250) DEFAULT NULL,
  `organizationCode` varchar(50) DEFAULT NULL,
  `organizationTypeID` int(11) DEFAULT NULL,
  `organizationAddress` varchar(200) DEFAULT NULL,
  `organizationPhone` varchar(145) DEFAULT NULL,
  `organizationEmail` varchar(150) DEFAULT NULL,
  `organizationWebsite` varchar(145) DEFAULT NULL,
  `organizationPicture` text,
  `contactPerson` varchar(245) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`organizationID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.organization: ~0 rows (approximately)
/*!40000 ALTER TABLE `organization` DISABLE KEYS */;
INSERT INTO `organization` (`organizationID`, `organizationName`, `organizationCode`, `organizationTypeID`, `organizationAddress`, `organizationPhone`, `organizationEmail`, `organizationWebsite`, `organizationPicture`, `contactPerson`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(10, 'State University of Zanzibar', 'SUZA', 1, 'Tunguu Zanzibar', '0777345678', 'suza@gmail.com', 'www.suza.ac.tz', '60033.jpg', 'Massoud Mmanga', '2022-04-01 15:03:46', '2022-04-01 15:03:46', NULL);
/*!40000 ALTER TABLE `organization` ENABLE KEYS */;

-- Dumping structure for table industrial-training.organization_type
CREATE TABLE IF NOT EXISTS `organization_type` (
  `orgTypeID` int(11) NOT NULL AUTO_INCREMENT,
  `typeName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orgTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.organization_type: ~2 rows (approximately)
/*!40000 ALTER TABLE `organization_type` DISABLE KEYS */;
INSERT INTO `organization_type` (`orgTypeID`, `typeName`) VALUES
	(1, 'University'),
	(2, 'Clients');
/*!40000 ALTER TABLE `organization_type` ENABLE KEYS */;

-- Dumping structure for table industrial-training.programmes
CREATE TABLE IF NOT EXISTS `programmes` (
  `programmeID` int(11) NOT NULL AUTO_INCREMENT,
  `programmeName` varchar(200) NOT NULL,
  `programmeCode` varchar(30) NOT NULL,
  `programmeLevelID` int(11) NOT NULL,
  `organization_ID` int(11) NOT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`programmeID`)
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.programmes: 3 rows
/*!40000 ALTER TABLE `programmes` DISABLE KEYS */;
INSERT INTO `programmes` (`programmeID`, `programmeName`, `programmeCode`, `programmeLevelID`, `organization_ID`, `status`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(28, 'Bachelor of Science with Education', 'BSE', 2, 10, 1, '2022-04-01 18:42:19', '2022-04-01 18:42:20', 1),
	(27, 'Bachelor of Science in Information technology', 'BIT', 2, 10, 1, '2022-04-01 18:41:32', '2022-04-01 18:41:33', 1),
	(26, 'Bachelor of Science in Computer Science', 'BCS', 2, 10, 1, '2022-04-01 18:39:12', '2022-04-01 18:39:14', 1);
/*!40000 ALTER TABLE `programmes` ENABLE KEYS */;

-- Dumping structure for table industrial-training.programme_level
CREATE TABLE IF NOT EXISTS `programme_level` (
  `programmeLevelID` int(11) NOT NULL AUTO_INCREMENT,
  `programmeLevel` varchar(50) NOT NULL,
  `programmeLevelCode` varchar(20) NOT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`programmeLevelID`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.programme_level: 2 rows
/*!40000 ALTER TABLE `programme_level` DISABLE KEYS */;
INSERT INTO `programme_level` (`programmeLevelID`, `programmeLevel`, `programmeLevelCode`, `status`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(1, 'Undergraduate Degree', 'UQF8', 1, '2017-10-04 02:55:14', '2017-10-04 02:55:42', 18),
	(2, 'Postgraduate Degree', 'PGD', 0, '2017-11-30 15:06:03', '2019-02-11 10:27:20', 164);
/*!40000 ALTER TABLE `programme_level` ENABLE KEYS */;

-- Dumping structure for table industrial-training.roles
CREATE TABLE IF NOT EXISTS `roles` (
  `roleID` int(11) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(100) NOT NULL,
  PRIMARY KEY (`roleID`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.roles: 5 rows
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` (`roleID`, `roleName`) VALUES
	(1, 'Administrator'),
	(2, 'Student'),
	(3, 'Field Coordinator'),
	(4, 'Organization Leader'),
	(5, 'Manager');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;

-- Dumping structure for table industrial-training.schools
CREATE TABLE IF NOT EXISTS `schools` (
  `schoolID` int(11) NOT NULL AUTO_INCREMENT,
  `schoolName` varchar(100) DEFAULT NULL,
  `schoolCode` varchar(50) DEFAULT NULL,
  `campusID` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`schoolID`),
  UNIQUE KEY `schoolCode_UNIQUE` (`schoolCode`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.schools: ~0 rows (approximately)
/*!40000 ALTER TABLE `schools` DISABLE KEYS */;
INSERT INTO `schools` (`schoolID`, `schoolName`, `schoolCode`, `campusID`, `status`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(5, 'School of Natural and Social Science', 'SNSS', 3, 1, '2020-03-06 19:02:08', '2020-03-06 19:02:08', 1),
	(6, 'School of Health and Science', 'SOHS', 3, 1, '2022-03-27 16:42:13', '2022-04-01 14:47:58', 1);
/*!40000 ALTER TABLE `schools` ENABLE KEYS */;

-- Dumping structure for table industrial-training.student
CREATE TABLE IF NOT EXISTS `student` (
  `studentID` int(11) NOT NULL AUTO_INCREMENT,
  `academicYearID` int(11) NOT NULL,
  `programmeCode` int(11) DEFAULT NULL,
  `universityCode` int(11) NOT NULL,
  `registrationNumber` varchar(40) NOT NULL,
  `statusID` int(11) DEFAULT NULL,
  `firstName` varchar(50) NOT NULL,
  `lastName` varchar(150) NOT NULL,
  `gender` char(1) NOT NULL,
  `disabilityStatus` varchar(30) DEFAULT NULL,
  `employmentStatus` varchar(30) DEFAULT NULL,
  `phoneNumber` varchar(30) DEFAULT NULL,
  `email` varchar(130) DEFAULT NULL,
  `status` tinyint(100) DEFAULT NULL,
  `studentPicture` varchar(255) DEFAULT NULL,
  `rgStatus` int(11) DEFAULT NULL,
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`studentID`),
  UNIQUE KEY `registrationNumber` (`registrationNumber`),
  KEY `universityCode` (`universityCode`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`universityCode`) REFERENCES `organization` (`organizationID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.student: ~2 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`studentID`, `academicYearID`, `programmeCode`, `universityCode`, `registrationNumber`, `statusID`, `firstName`, `lastName`, `gender`, `disabilityStatus`, `employmentStatus`, `phoneNumber`, `email`, `status`, `studentPicture`, `rgStatus`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(82, 7, NULL, 10, 'BCS/14/19/003/TZ', 1, 'Sleman', 'Hamad Sleman', 'M', NULL, NULL, '0774531966', 'hasuko52@gmail.com', NULL, NULL, NULL, '2022-04-01 16:08:47', '2022-04-01 16:08:47', 1),
	(83, 7, NULL, 10, 'BCS/14/19/001/TZ', 1, 'Bahati', 'Ali Hajji', 'F', NULL, NULL, '0775531966', 'alihajibahati@icloud.com', NULL, NULL, NULL, '2022-04-01 16:10:41', '2022-04-01 16:10:41', 1);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;

-- Dumping structure for table industrial-training.student_schedule
CREATE TABLE IF NOT EXISTS `student_schedule` (
  `stu_schedule_ID` int(11) NOT NULL AUTO_INCREMENT,
  `student_ID` int(11) NOT NULL,
  `schedule_ID` int(11) NOT NULL,
  `createdDate` datetime NOT NULL,
  `modifiedDate` datetime NOT NULL,
  `createdBy` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`stu_schedule_ID`),
  KEY `stuFK` (`schedule_ID`),
  KEY `sifFK` (`student_ID`),
  CONSTRAINT `sifFK` FOREIGN KEY (`student_ID`) REFERENCES `student` (`studentID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `stuFK` FOREIGN KEY (`schedule_ID`) REFERENCES `activity_schedule` (`schedule_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.student_schedule: ~2 rows (approximately)
/*!40000 ALTER TABLE `student_schedule` DISABLE KEYS */;
INSERT INTO `student_schedule` (`stu_schedule_ID`, `student_ID`, `schedule_ID`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(22, 82, 8, '2022-04-01 16:39:05', '2022-04-01 16:39:05', 1),
	(23, 83, 8, '2022-04-01 16:39:05', '2022-04-01 16:39:05', 1);
/*!40000 ALTER TABLE `student_schedule` ENABLE KEYS */;

-- Dumping structure for table industrial-training.userroles
CREATE TABLE IF NOT EXISTS `userroles` (
  `userRoleID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) DEFAULT NULL,
  `roleID` int(11) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `createdDate` datetime DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`userRoleID`),
  KEY `userID_idx` (`userID`),
  KEY `roleID_idx` (`roleID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.userroles: ~0 rows (approximately)
/*!40000 ALTER TABLE `userroles` DISABLE KEYS */;
INSERT INTO `userroles` (`userRoleID`, `userID`, `roleID`, `status`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(1, 1, 1, 1, '2018-03-08 09:07:28', '2018-03-08 09:11:18', 2);
/*!40000 ALTER TABLE `userroles` ENABLE KEYS */;

-- Dumping structure for table industrial-training.users
CREATE TABLE IF NOT EXISTS `users` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(140) NOT NULL,
  `middleName` varchar(140) DEFAULT NULL,
  `lastName` varchar(140) NOT NULL,
  `phoneNumber` varchar(150) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `username` varchar(150) NOT NULL,
  `password` varchar(250) NOT NULL,
  `departmentID` int(11) DEFAULT NULL,
  `userImage` text,
  `status` tinyint(1) NOT NULL,
  `login` tinyint(1) NOT NULL,
  `ftoken` varchar(250) NOT NULL,
  `createdDate` date DEFAULT NULL,
  `modifiedDate` date DEFAULT NULL,
  `createdBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table industrial-training.users: 1 rows
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`userID`, `firstName`, `middleName`, `lastName`, `phoneNumber`, `email`, `username`, `password`, `departmentID`, `userImage`, `status`, `login`, `ftoken`, `createdDate`, `modifiedDate`, `createdBy`) VALUES
	(1, 'Msilikale', '', 'Msilanga', '0777810700', 'msilikalemsilanga@gmail.com', 'admin', 'e3dcc3509b359e3eb75865bd979030400a5212cb7480a2124', 1, NULL, 1, 1, '', '2018-03-08', '2022-04-01', 1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
