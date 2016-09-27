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
  `status` int(10) DEFAULT '1',
  PRIMARY KEY (`id_iklan`),
  KEY `idpenjual` (`idpenjual`),
  CONSTRAINT `iklan_ibfk_1` FOREIGN KEY (`idpenjual`) REFERENCES `profileuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

/*Data for the table `iklan` */

insert  into `iklan`(`id_iklan`,`judul_iklan`,`harga`,`deskripsi_iklan`,`gambar`,`stok`,`idpenjual`,`status`) values (1,'ikan_nila',20000,'bagus','uploads/nila1.jpg',20,1,2),(3,'ikan kerapu',45000,'Fresh','uploads/kerapu1.jpg',5,1,1),(4,'ikan kakap merah',40000,'Bagus','uploads/kakapmerah1.jpg',12,1,1),(5,'ikan bandeng',25000,'Segar ','uploads/bandeng1.jpg',15,1,1),(6,'ikan bandeng',25000,'masih Fresh dari tambak ikan','uploads/bandeng2.jpg',6,3,1),(7,'ikan kakap(fillet)',60000,'Fresh Fillet berkualitas','uploads/kakapfill1.jpg',23,3,1),(8,'ikan bawal',33000,'Bawal Fresh','uploads/bawal1.jpg',45,3,1),(9,'udang peci',50000,'Udang Peci segar','uploads/udpeci1.jpg',21,3,1),(10,'udang flower',90000,'Udang flower segar','uploads/udflower1.jpg',43,3,1),(11,'ikan tenggiri',38000,'Tenggiri Fresh','uploads/tenggiri1.jpg',6,4,1),(12,'ikan tongkol',24000,'Tongkol segar ','uploads/tongkol1.jpg',7,4,1),(13,'ikan kakap merah',40000,'Kakap Merah high quality','uploads/kakapmerah2.jpg',9,4,1),(14,'ikan baronang',40000,'Baronang fresh','uploads/baronang1.jpg',8,4,1),(15,'ikan kembung',22000,'Kembung Fresh','uploads/kembung1.jpg',17,4,1),(16,'ikan teri galar',17000,'Teri Segar','uploads/terigalar1.jpg',10,5,1),(17,'kepiting ',55000,'Kepiting Segar dan fresh','uploads/kepiting1.jpg',8,5,1),(18,'rajungan',45000,'Rajungan Segar dan fresh','uploads/rajungan1.jpg',9,5,1),(19,'Fillet ikan marlin',35000,'Ikan Marlin kondisi Fillet','uploads/filletmarlin1.jpg',17,5,1),(20,'ikan bawal hitam',20000,'Bawal Hitam segar','uploads/bawalhitam1.jpg',16,5,1),(21,'ikan lele',11000,'Lele Segar','uploads/lele1.jpg',19,6,1),(22,'ikan mujair',23000,'Mujair fresh','uploads/mujair1.jpg',29,6,1),(23,'ikan patin',20000,'Patin segar','uploads/patin1.jpg',49,6,1),(24,'ikan mas',35000,'Ikan Mas Fresh ','uploads/mas1.jpg',38,6,1),(25,'ikan layang',23000,'Ikan layang fresh','uploads/layang1.jpg',4,6,1),(26,'Ikan Bawal Keputih',20000,'Nikmat dimasak','uploads/bawalputih1.jpg',12,7,1),(27,'ikan tuna (super)',30000,'Ikan Tuna Kualitas super','uploads/tunasuper1.jpg',4,7,1),(28,'ikan salem',25000,'Ikan Salem Segar','uploads/salem1.jpg',5,7,1),(29,'ikan gurame',55000,'Ikan Gurame Fresh','uploads/gurame1.jpg',16,7,1),(30,'Rumput laut (kering)',12000,'Keadaan kering dan siap diolah','uploads/rumputlaut1.jpg',31,7,1),(31,'ikan kembung',30000,'Ikan kembung segar','uploads/kembung2.jpg',3,2,1),(32,'Cumi-cumi',30000,'Cumi-cumi segar','uploads/cumi2.jpg',12,2,2),(33,'ikan kakap merah',35000,'Ikan kakap merah kondisi fresh','uploads/kakapmerah3.jpg',14,2,1),(34,'ikan cakalang',22500,'Cakalang segar','uploads/cakalang1.jpg',18,2,1),(35,'ikan layang',23000,'Ikan layang Fresh','uploads/layang2.jpg',16,2,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

/*Data for the table `profileuser` */

insert  into `profileuser`(`id`,`nama_user`,`alamat_user`,`no_telp`,`alamat_kirim`,`email`,`username`,`password`,`remember_token`) values (1,'Afif ishamsyah','Bekasi','088813568990','Surabaya','afifhan95@gmail.com','afif','$2y$10$pwE1S1lKOFb/PSVVwCle4.8b8cqsnLY3HVKqvrXBH.1cFEcyhYGCu','18eipvewq4Bh9hw75LCA0VWZnxFVV0FJLl5jAf19bZChOnxcOcAXy0aMaiO6'),(2,'Admin','Surabaya','0888888888','almuslim','Admin@gmail.com','admin','$2y$10$pwE1S1lKOFb/PSVVwCle4.8b8cqsnLY3HVKqvrXBH.1cFEcyhYGCu','Gs8Ur3JEKb0B26wQzEZRVoVRwJSuvfxrIBplUDdy0vOPjrHBaP2yyDGLoOko'),(3,'joshua kevin','Surabaya','081234567890','Surabaya','joke@gmail.com','joke','$2y$10$pwE1S1lKOFb/PSVVwCle4.8b8cqsnLY3HVKqvrXBH.1cFEcyhYGCu','2222'),(4,'Rigold iman k','Surabaya','081098765432','Surabaya','rigold@gmail.com','rigold','$2y$10$pwE1S1lKOFb/PSVVwCle4.8b8cqsnLY3HVKqvrXBH.1cFEcyhYGCu','3333'),(5,'Dewi kartika p','Surabaya','081234098765','Surabaya','dewi@gmail.com','dewi','$2y$10$pwE1S1lKOFb/PSVVwCle4.8b8cqsnLY3HVKqvrXBH.1cFEcyhYGCu','4444'),(6,'Yoga bayu aji pranawa','Surabaya','081239239541','Surabaya','pranawa@gmail.com','pranawa','$2y$10$pwE1S1lKOFb/PSVVwCle4.8b8cqsnLY3HVKqvrXBH.1cFEcyhYGCu','mBGcTvQ8H0p7CrZWvX0rvZD2qINwQUAWKWmh1mMcnPHdsIWE5aLaI6LjPFMq'),(7,'Arfian Fidiantoro','Sidoarjo','45463636363','Surabaya','arfian@mail.com','arfian','$2y$10$L5P9aQTNIvim0EUsiYI6O.gosrkeoVq9XktXYvMG0QKpb4KlEhBbS','KG1KItcnmmi6v3rvxMBIk48Zk6OxLLEo4Pa6ff5uzpwcsmMD5zNHA8e8SncI');

/*Table structure for table `testimoni` */

DROP TABLE IF EXISTS `testimoni`;

CREATE TABLE `testimoni` (
  `id_testi` int(10) NOT NULL AUTO_INCREMENT,
  `isi` varchar(100) NOT NULL,
  `score` int(10) NOT NULL,
  `id_user` int(10) DEFAULT NULL,
  `id_iklan` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_testi`),
  KEY `ibfk_testi_1` (`id_user`),
  KEY `id_iklan` (`id_iklan`),
  CONSTRAINT `ibfk_testi_1` FOREIGN KEY (`id_user`) REFERENCES `profileuser` (`id`),
  CONSTRAINT `testimoni_ibfk_1` FOREIGN KEY (`id_iklan`) REFERENCES `iklan` (`id_iklan`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `testimoni` */

insert  into `testimoni`(`id_testi`,`isi`,`score`,`id_user`,`id_iklan`) values (1,'bagus sekali',100,7,1);

/*Table structure for table `transaksi` */

DROP TABLE IF EXISTS `transaksi`;

CREATE TABLE `transaksi` (
  `id_transaksi` int(10) NOT NULL AUTO_INCREMENT,
  `tanggal_terjual` datetime DEFAULT NULL,
  `idpembeli` int(10) DEFAULT NULL,
  `idpenjual` int(10) DEFAULT NULL,
  `idiklan` float DEFAULT NULL,
  PRIMARY KEY (`id_transaksi`),
  KEY `idpembeli` (`idpembeli`),
  KEY `idpenjual` (`idpenjual`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`idpembeli`) REFERENCES `profileuser` (`id`),
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`idpenjual`) REFERENCES `profileuser` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `transaksi` */

insert  into `transaksi`(`id_transaksi`,`tanggal_terjual`,`idpembeli`,`idpenjual`,`idiklan`) values (1,'2016-05-02 10:45:27',7,1,1),(2,'2016-05-06 11:59:50',1,2,32);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
