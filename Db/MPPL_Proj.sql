/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 10.1.10-MariaDB : Database - mpplproject
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`mpplproject` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `mpplproject`;

/*Table structure for table `accountuser` */

DROP TABLE IF EXISTS `accountuser`;

CREATE TABLE `accountuser` (
  `Id_Akun` varchar(10) NOT NULL,
  `Username` varchar(12) NOT NULL,
  `Password` varchar(12) NOT NULL,
  PRIMARY KEY (`Id_Akun`),
  CONSTRAINT `ProfileUser` FOREIGN KEY (`Id_Akun`) REFERENCES `profileuser` (`ID_User`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `accountuser` */

/*Table structure for table `iklan` */

DROP TABLE IF EXISTS `iklan`;

CREATE TABLE `iklan` (
  `ID_iklan` varchar(10) NOT NULL,
  `Judul_Iklan` varchar(40) NOT NULL,
  `Harga` varchar(20) NOT NULL,
  `Deskripsi_Iklan` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_iklan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `iklan` */

/*Table structure for table `produk_ikan` */

DROP TABLE IF EXISTS `produk_ikan`;

CREATE TABLE `produk_ikan` (
  `ID_Produk` varchar(10) NOT NULL,
  `Nama_Produk` varchar(40) NOT NULL,
  `Gambar_produk` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_Produk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `produk_ikan` */

/*Table structure for table `profileuser` */

DROP TABLE IF EXISTS `profileuser`;

CREATE TABLE `profileuser` (
  `ID_User` varchar(10) NOT NULL,
  `Nama_User` varchar(20) NOT NULL,
  `Alamat_user` varchar(50) NOT NULL,
  `No_telp` int(12) NOT NULL,
  `Alamat_kirim` varchar(50) NOT NULL,
  `E-mail` varchar(20) NOT NULL,
  PRIMARY KEY (`ID_User`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `profileuser` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
