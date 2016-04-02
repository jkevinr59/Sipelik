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
  `status` int(1) DEFAULT '1',
  PRIMARY KEY (`id_iklan`),
  KEY `idpenjual` (`idpenjual`),
  CONSTRAINT `iklan_ibfk_1` FOREIGN KEY (`idpenjual`) REFERENCES `profileuser` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `iklan` */

insert  into `iklan`(`id_iklan`,`judul_iklan`,`harga`,`deskripsi_iklan`,`gambar`,`stok`,`idpenjual`,`status`) values (1,'Udang',30000,'nikmat','uploads/2.jpg',20,1,1),(2,'cumi',10,'ampas',NULL,5,2,1),(4,'pari',20000,'beracun',NULL,20,1,1),(5,'nemo',3000,'badut',NULL,5,2,0),(7,'ikan hiu',9000,'ini ikan hiu','uploads/WP_20160123_010.jpg',90,1,0),(8,'ikan piranha',1000000,'ini ikan piranha','uploads/1.jpg',1222,1,0);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `profileuser` */

insert  into `profileuser`(`id`,`nama_user`,`alamat_user`,`no_telp`,`alamat_kirim`,`email`,`username`,`password`,`remember_token`) values (1,'Afif Ishamsyah','Bekasi','081383112806','Surabaya','afifhan95@gmail.com','minyman','$2y$10$kj1xnRHsLJ/ikfFgKGNkSuCkRQg5kSm/QH8LoBpXswATpMBRc7pIi','wEGuLqiQNxdqV8NzMN0wVL2SfNKEP4rU3T9JWoBraXLyukxqjRslvs0JRkKR'),(2,'anwar','bekasi','0888888888','almuslim','anwar@gmaill.com','anwar','$2y$10$Ug8I24zR76D0Nq.HE0IW5.5alH0IoJ9V5CbcDxqNyh4yLjd0Cq2EK','afokBVcrvv0kacrp7CK96LiyJeTCJp60xTVHk4dZbI0N07X7xZVnZ2yWNIKu'),(3,'yahya','Jakarta','0812345666','Surabaya','yahyasem@gmail.com','yahyasem','$2y$10$2wRkPHEgAIqm69kTuUoIkuJpaL.zvO63DsWjaHO3Hjh8j5M3AxjZK','qHDQrhSLHYemiHf3uf4QCEhxa3dK02ujfn4N9mt1FYMYii2Bdt1qs4fhHTSI');

/*Table structure for table `testimoni` */

DROP TABLE IF EXISTS `testimoni`;

CREATE TABLE `testimoni` (
  `id_testi` int(10) NOT NULL AUTO_INCREMENT,
  `isi` varchar(100) DEFAULT NULL,
  `score` int(10) DEFAULT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_iklan` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_testi`),
  KEY `ibfk_testi_1` (`id_user`),
  KEY `testimoni_ibfk_2` (`id_iklan`),
  CONSTRAINT `testimoni_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `profileuser` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `testimoni_ibfk_2` FOREIGN KEY (`id_iklan`) REFERENCES `iklan` (`id_iklan`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `testimoni` */

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id_transaksi` int(10) NOT NULL AUTO_INCREMENT,
  `tanggal_terjual` datetime DEFAULT NULL,
  `idpembeli` int(10) DEFAULT NULL,
  `idpenjual` int(10) DEFAULT NULL,
  `idiklan` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `idpembeli` (`idpembeli`),
  KEY `idpenjual` (`idiklan`),
  KEY `transaksi_ibfk_3` (`idpenjual`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`idpembeli`) REFERENCES `profileuser` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`idiklan`) REFERENCES `iklan` (`id_iklan`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `transaksi_ibfk_3` FOREIGN KEY (`idpenjual`) REFERENCES `profileuser` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `transaksi` */

insert  into `transaksi`(`id_transaksi`,`tanggal_terjual`,`idpembeli`,`idpenjual`,`idiklan`) values (1,'2016-04-01 16:50:09',1,2,5),(2,'2016-04-02 07:30:12',2,1,8),(4,'2016-04-02 10:14:17',3,1,7);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
