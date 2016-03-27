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
  `judul_iklan` varchar(100) NOT NULL,
  `harga` decimal(10,0) NOT NULL,
  `deskripsi_iklan` varchar(250) DEFAULT NULL,
  `gambar` varchar(100) DEFAULT NULL,
  `stok` int(100) DEFAULT NULL,
  `idpenjual` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_iklan`),
  KEY `idpenjual` (`idpenjual`),
  CONSTRAINT `iklan_ibfk_1` FOREIGN KEY (`idpenjual`) REFERENCES `profileuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `iklan` */

insert  into `iklan`(`id_iklan`,`judul_iklan`,`harga`,`deskripsi_iklan`,`gambar`,`stok`,`idpenjual`) values (1,'ikan_nila',20000,'bagus',NULL,20,1),(2,'cumi',10,'ampas',NULL,5,1),(3,'ikan',2000,'gede',NULL,2,NULL);

/*Table structure for table `profileuser` */

DROP TABLE IF EXISTS `profileuser`;

CREATE TABLE `profileuser` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(50) NOT NULL,
  `alamat_user` varchar(50) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `alamat_kirim` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(1024) NOT NULL,
  `password` varchar(1024) NOT NULL,
  `remember_token` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `profileuser` */

insert  into `profileuser`(`id`,`nama_user`,`alamat_user`,`no_telp`,`alamat_kirim`,`email`,`username`,`password`,`remember_token`) values (1,'Afif Ishamsyah','Bekasi','088813568990','Surabaya','afifhan95@gmail.com','minyman','$2y$10$.Z6/KaMCpr7A.nqP3Pd8Xui6mVrylIRVZdO7ZP.Nuh901W2Ce6X/y','JE6ztNprGFwhIGfmu6SCmbMyAr1d10jKD2RoCskQyqXvukrrTl3eJzNxRP8w'),(2,'anwar','bekasi','0888888888','almuslim','anwar@gmaill.com','anwar','$2y$10$Ug8I24zR76D0Nq.HE0IW5.5alH0IoJ9V5CbcDxqNyh4yLjd0Cq2EK','gEO3Nt5CoGGqUeR7iWwteQ2hcMjC7mVwwcJgTmq8xYL5HME7aSRZUiHs4y3T');

/*Table structure for table `testimony` */

DROP TABLE IF EXISTS `testimony`;

CREATE TABLE `testimony` (
  `id_testi` int(10) NOT NULL AUTO_INCREMENT,
  `judul` varchar(20) DEFAULT NULL,
  `isi` varchar(100) DEFAULT NULL,
  `score` int(10) DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_iklan` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_testi`),
  KEY `ibfk_testi_1` (`id_user`),
  KEY `id_iklan` (`id_iklan`),
  CONSTRAINT `testimony_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `profileuser` (`id`),
  CONSTRAINT `testimony_ibfk_2` FOREIGN KEY (`id_iklan`) REFERENCES `iklan` (`id_iklan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `testimony` */

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id_transaksi` int(10) NOT NULL AUTO_INCREMENT,
  `stok` int(10) DEFAULT NULL,
  `tanggal_terjual` datetime DEFAULT NULL,
  `idpembeli` int(10) DEFAULT NULL,
  `idpenjual` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `idpembeli` (`idpembeli`),
  KEY `idpenjual` (`idpenjual`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`idpembeli`) REFERENCES `profileuser` (`id`),
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`idpenjual`) REFERENCES `profileuser` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaksi` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
