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
  CONSTRAINT `iklan_ibfk_1` FOREIGN KEY (`idpenjual`) REFERENCES `profileuser` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

/*Data for the table `iklan` */

insert  into `iklan`(`id_iklan`,`judul_iklan`,`harga`,`deskripsi_iklan`,`gambar`,`stok`,`idpenjual`) values (1,'ikan_nila','20000','bagus','uploads/nila1.jpg',20,1),(2,'cumi','30000','segar','uploads/cumi1.jpg',5,1),(3,'ikan kerapu','45000','Fresh','uploads/kerapu1.jpg',5,1),(4,'ikan kakap merah','40000','Bagus','uploads/kakapmerah1.jpg',12,1),(5,'ikan bandeng','25000','Segar ','uploads/bandeng1.jpg',15,1),(6,'ikan bandeng','25000','masih Fresh dari tambak ikan','uploads/bandeng2.jpg',6,3),(7,'ikan kakap(fillet)','60000','Fresh Fillet berkualitas','uploads/kakapfil1.jpg',23,3),(8,'ikan bawal','33000','Bawal Fresh','uploads/bawal1.jpg',45,3),(9,'udang peci','50000','Udang Peci segar','uploads/udpeci1.jpg',21,3),(10,'udang flower','90000','Udang flower segar','uploads/udflower1.jpg',43,3),(11,'ikan tenggiri','38000','Tenggiri Fresh','uploads/tenggir1.jpg',6,4),(12,'ikan tongkol','24000','Tongkol segar ','uploads/tongkol1.jpg',7,4),(13,'ikan kakap merah','40000','Kakap Merah high quality','uploads/kakapmerah2.jpg',9,4),(14,'ikan baronang','40000','Baronang fresh','uploads/baronang1.jpg',8,4),(15,'ikan kembung','22000','Kembung Fresh','uploads/kembung11.jpg',17,4),(16,'ikan teri galar','17000','Teri Segar','uploads/terigalar1.jpg',10,5),(17,'kepiting ','55000','Kepiting Segar dan fresh','uploads/kepiting1.jpg',8,5),(18,'rajungan','45000','Rajungan Segar dan fresh','uploads/rajungan1.jpg',9,5),(19,'Fillet ikan marlin','35000','Ikan Marlin kondisi Fillet','uploads/filletmarlin1.jpg',17,5),(20,'ikan bawal hitam','20000','Bawal Hitam segar','uploads/bawalhitam1.jpg',16,5),(21,'ikan lele','11000','Lele Segar','uploads/lele1.jpg',19,6),(22,'ikan mujair','23000','Mujair fresh','uploads/mujair1.jpg',29,6),(23,'ikan patin','20000','Patin segar','uploads/patin1.jpg',49,6),(24,'ikan mas','35000','Ikan Mas Fresh ','uploads/mas1.jpg',38,6),(25,'ikan layang','23000','Ikan layang fresh','uploads/layang1.jpg',4,6),(26,'ikan bawal putih','30000','Bawal putih segar','uploads/bawalputih1.jpg',2,7),(27,'ikan tuna (super)','30000','Ikan Tuna Kualitas super','uploads/tunasuper1.jpg',4,7),(28,'ikan salem','25000','Ikan Salem Segar','uploads/salem1.jpg',5,7),(29,'ikan gurame','55000','Ikan Gurame Fresh','uploads/gurame1.jpg',16,7),(30,'Rumput laut (kering)','12000','Keadaan kering dan siap diolah','uploads/rumputlaut1.jpg',31,7),(31,'ikan kembung','30000','Ikan kembung segar','uploads/kembung2.jpg',3,2),(32,'Cumi-cumi','30000','Cumi-cumi segar','uploads/cumi2.jpg',12,2),(33,'ikan kakap merah','35000','Ikan kakap merah kondisi fresh','uploads/kakapmerah3.jpg',14,2),(34,'ikan cakalang','22500','Cakalang segar','uploads/cakalang1.jpg',18,2),(35,'ikan layang','23000','Ikan layang Fresh','uploads/layang2.jpg',16,2);

/*Table structure for table `profileuser` */

DROP TABLE IF EXISTS `profileuser`;

CREATE TABLE `profileuser` (
  `id_user` int(10) NOT NULL AUTO_INCREMENT,
  `nama_user` varchar(50) NOT NULL,
  `alamat_user` varchar(50) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `alamat_kirim` varchar(50) NOT NULL,
  `email` varchar(20) NOT NULL,
  `username` varchar(1024) NOT NULL,
  `password` varchar(1024) NOT NULL,
  `remember_token` varchar(100) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

/*Data for the table `profileuser` */

insert  into `profileuser`(`id_user`,`nama_user`,`alamat_user`,`no_telp`,`alamat_kirim`,`email`,`username`,`password`,`remember_token`) values (1,'Afif ishamsyah','Bekasi','088813568990','Surabaya','afifhan95@gmail.com','afif','$2y$10$pwE1S1lKOFb/PSVVwCle4.8b8cqsnLY3HVKqvrXBH.1cFEcyhYGCu','1111'),(2,'Admin','Surabaya','0888888888','almuslim','Admin@gmail.com','admin','$2y$10$pwE1S1lKOFb/PSVVwCle4.8b8cqsnLY3HVKqvrXBH.1cFEcyhYGCu','0000'),(3,'joshua kevin','Surabaya','081234567890','Surabaya','joke@gmail.com','joke','$2y$10$pwE1S1lKOFb/PSVVwCle4.8b8cqsnLY3HVKqvrXBH.1cFEcyhYGCu','2222'),(4,'Rigold iman k','Surabaya','081098765432','Surabaya','rigold@gmail.com','rigold','$2y$10$pwE1S1lKOFb/PSVVwCle4.8b8cqsnLY3HVKqvrXBH.1cFEcyhYGCu','3333'),(5,'Dewi kartika p','Surabaya','081234098765','Surabaya','dewi@gmail.com','dewi','$2y$10$pwE1S1lKOFb/PSVVwCle4.8b8cqsnLY3HVKqvrXBH.1cFEcyhYGCu','4444'),(6,'Yoga bayu aji pranawa','Surabaya','081239239541','Surabaya','pranawa@gmail.com','pranawa','$2y$10$pwE1S1lKOFb/PSVVwCle4.8b8cqsnLY3HVKqvrXBH.1cFEcyhYGCu','5555'),(7,'Arfian fidiantoro','Sidoarjo','081232009822','Surabaya','fidi@gmail.com','fidi','$2y$10$pwE1S1lKOFb/PSVVwCle4.8b8cqsnLY3HVKqvrXBH.1cFEcyhYGCu','6666');

/*Table structure for table `testimony` */

DROP TABLE IF EXISTS `testimony`;

CREATE TABLE `testimony` (
  `id_testi` int(10) NOT NULL,
  `judul` varchar(20) NOT NULL,
  `isi` varchar(100) NOT NULL,
  `score` int(10) NOT NULL,
  `id_penjual` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_testi`),
  KEY `ibfk_testi_1` (`id_penjual`),
  CONSTRAINT `ibfk_testi_1` FOREIGN KEY (`id_penjual`) REFERENCES `profileuser` (`id_user`)
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
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`idpembeli`) REFERENCES `profileuser` (`id_user`),
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`idpenjual`) REFERENCES `profileuser` (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `transaksi` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
