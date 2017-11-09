/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.0.27-community-nt : Database - water_tanker
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`water_tanker` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;

USE `water_tanker`;

/*Table structure for table `aadhar_database` */

DROP TABLE IF EXISTS `aadhar_database`;

CREATE TABLE `aadhar_database` (
  `aadhar_number` varchar(20) collate utf8_unicode_ci NOT NULL,
  `aaadhar_name` varchar(100) collate utf8_unicode_ci default NULL,
  `aadhar_mobile` varchar(10) collate utf8_unicode_ci default NULL,
  `aadhar_email` varchar(100) collate utf8_unicode_ci default NULL,
  `aadhar_gender` varchar(10) collate utf8_unicode_ci default NULL,
  `aadhar_address` varchar(500) collate utf8_unicode_ci default NULL,
  `zone` varchar(20) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`aadhar_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `aadhar_database` */

insert  into `aadhar_database`(`aadhar_number`,`aaadhar_name`,`aadhar_mobile`,`aadhar_email`,`aadhar_gender`,`aadhar_address`,`zone`) values ('123456789012','abhiram','1234567890','veerapaneni.abhiram@gmail.com','male','kukatpally, hyderabad','north'),('234567890123','sushanth','2345678901','sai61095@gmail.com','male','gachibowli, hyderabad','south'),('345678901234','paramesh','3456789012','paramesh201@gmail.com','female','disukh nagar, hyderabad','east'),('456789123456','gautham','5478963214','gauthamlg.6@gmail.com','male','bhel, hyderabad','west');

/*Table structure for table `company_registration` */

DROP TABLE IF EXISTS `company_registration`;

CREATE TABLE `company_registration` (
  `company_name` varchar(100) collate utf8_unicode_ci NOT NULL,
  `company_password` varchar(100) collate utf8_unicode_ci default NULL,
  `company_email` varchar(100) collate utf8_unicode_ci default NULL,
  `company_mobile` varchar(100) collate utf8_unicode_ci default NULL,
  `company_licence` varchar(100) collate utf8_unicode_ci NOT NULL,
  `company_tanker_cost` varchar(50) collate utf8_unicode_ci default NULL,
  `company_type` varchar(50) collate utf8_unicode_ci default NULL,
  `company_address` varchar(100) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`company_name`,`company_licence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `company_registration` */

insert  into `company_registration`(`company_name`,`company_password`,`company_email`,`company_mobile`,`company_licence`,`company_tanker_cost`,`company_type`,`company_address`) values ('aa','ff','aa@gmail.com','5375735','fff','4200','Private','hyderabad, telangana'),('abc','abc123','abc@gmail.com','1235896478','abclicence','5000','Private','hyderabad, telangana'),('bbj','ggg','jkbkbk2@kk.ufu','66161','hiuv','8000','Private','jhhvhk'),('c1','c1','c1@gmail.com','65161','sjdfbs','5200','Private','hydeee'),('company1','newpassword','c1@gmail.com','26664','jbdjadfb','2500','Private','hyderabad'),('company2','company123','c2@gmail.com','5466466','hfhjsvdh','5200','Private','gachibowli, hyderabad'),('Government','govt123','govt@gmail.com','2464646464','govt123','600','Government','GHMC'),('my company','mycompany','my@gmail.com','546156161','jgdisbiub','5000','Private','hyderabad'),('new','new','new@new.new','1245896','mew','8000','Private','jbadfjkbdfja'),('sdgsgs','aa','gsg@sg.sgs','+5466','kjjbkjb','4500','Private','jbb');

/*Table structure for table `tanker_bookings` */

DROP TABLE IF EXISTS `tanker_bookings`;

CREATE TABLE `tanker_bookings` (
  `user_aadhar_number` varchar(20) collate utf8_unicode_ci default '',
  `company_name` varchar(100) collate utf8_unicode_ci default NULL,
  `company_type` varchar(100) collate utf8_unicode_ci default NULL,
  `user_address` varchar(100) collate utf8_unicode_ci default NULL,
  `user_mobile` varchar(100) collate utf8_unicode_ci default NULL,
  `status` varchar(50) collate utf8_unicode_ci default 'Pending',
  `zone` varchar(25) collate utf8_unicode_ci default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tanker_bookings` */

insert  into `tanker_bookings`(`user_aadhar_number`,`company_name`,`company_type`,`user_address`,`user_mobile`,`status`,`zone`) values ('234567890123','Government','Government','gachibowli, hyderabad','2345678901','accepted','north'),('234567890123','Government','Government','new address aarusha','2345678901','accepted','south'),('234567890123','company2','Private','gachibowli, hyderabad','2345678901','rejected','north'),('234567890123','Government','Government','simhachalam, visakhapatnam','2345678901','Pending','north'),('234567890123','company2','Private','qcity , gowlidoddi, hyderabad','2345678901','Pending','north'),('123456789012','new','Private','kukatpally, hyderabad','1234567890','accepted','north');

/*Table structure for table `user_registration` */

DROP TABLE IF EXISTS `user_registration`;

CREATE TABLE `user_registration` (
  `aadhar_number` varchar(20) collate utf8_unicode_ci NOT NULL,
  `password` varchar(50) collate utf8_unicode_ci default NULL,
  `govt_tanker_count` int(2) default NULL,
  PRIMARY KEY  (`aadhar_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `user_registration` */

insert  into `user_registration`(`aadhar_number`,`password`,`govt_tanker_count`) values ('123456789012','8106632929',2),('234567890123','sushanth@1996',1),('345678901234','paramesh@1996',0),('456789123456','gautham@1996',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
