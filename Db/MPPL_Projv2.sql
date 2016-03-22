/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.9-MariaDB : Database - mpplproject
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

/*Table structure for table `iklan` */

DROP TABLE IF EXISTS `iklan`;

CREATE TABLE `iklan` (
  `id_iklan` int(11) NOT NULL AUTO_INCREMENT,
  `judul_iklan` varchar(40) DEFAULT NULL,
  `harga` decimal(10,0) DEFAULT NULL,
  `deskripsi_iklan` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_iklan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `iklan` */

/*Table structure for table `produk_ikan` */

DROP TABLE IF EXISTS `produk_ikan`;

CREATE TABLE `produk_ikan` (
  `id_produk` int(11) NOT NULL AUTO_INCREMENT,
  `nama_produk` varchar(40) DEFAULT NULL,
  `gambar_produk` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_produk`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `produk_ikan` */

/*Table structure for table `profileuser` */

DROP TABLE IF EXISTS `profileuser`;

CREATE TABLE `profileuser` (
  `id_user` int(10) NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(50) DEFAULT NULL,
  `alamat_user` varchar(50) DEFAULT NULL,
  `no_telp` varchar(13) DEFAULT NULL,
  `alamat_kirim` varchar(50) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `username` varchar(1024) DEFAULT NULL,
  `password` varchar(1024) DEFAULT NULL,
  `remenber_token` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `profileuser` */

insert  into `profileuser`(`id_user`,`nama_user`,`alamat_user`,`no_telp`,`alamat_kirim`,`email`,`username`,`password`,`remenber_token`) values (1,'Afif Ishamsyah','Bekasi','088813568990','Surabaya','afifhan95@gmail.com','minyman','$2y$10$.Z6/KaMCpr7A.nqP3Pd8Xui6mVrylIRVZdO7ZP.Nuh901W2Ce6X/y',NULL);

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id_transaksi` int(10) NOT NULL AUTO_INCREMENT,
  `tanggal_terjual` datetime DEFAULT NULL,
  `pembeli` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaksi` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
