-- MariaDB dump 10.19  Distrib 10.4.27-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: perbankan
-- ------------------------------------------------------
-- Server version	10.4.27-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cabang_bank`
--

DROP TABLE IF EXISTS `cabang_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cabang_bank` (
  `kode_cabang` varchar(20) NOT NULL,
  `nama_cabang` varchar(45) NOT NULL,
  `alamat_cabang` varchar(225) NOT NULL,
  PRIMARY KEY (`kode_cabang`),
  UNIQUE KEY `nama_cabang` (`nama_cabang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cabang_bank`
--

LOCK TABLES `cabang_bank` WRITE;
/*!40000 ALTER TABLE `cabang_bank` DISABLE KEYS */;
INSERT INTO `cabang_bank` VALUES ('BRUB','Bank Rut Unit Boyolali','Jl. Ahmad Yani 45'),('BRUK','Bank Rut Unit Klaten','Jl. Suparman 23'),('BRUS','Bank Rut Unit Surakarta','Jl. Slamet Riyadi 18'),('BRUW','Bank Rut Unit Wonogiri','Jl. A. Yani 23'),('BRUY','Bank Rut Unit Yogyakarta','Jl. Anggrek 21');
/*!40000 ALTER TABLE `cabang_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nasabah`
--

DROP TABLE IF EXISTS `nasabah`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nasabah` (
  `id_nasabah` int(11) NOT NULL,
  `nama_nasabah` varchar(45) NOT NULL,
  `alamat_nasabah` varchar(225) NOT NULL,
  PRIMARY KEY (`id_nasabah`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nasabah`
--

LOCK TABLES `nasabah` WRITE;
/*!40000 ALTER TABLE `nasabah` DISABLE KEYS */;
INSERT INTO `nasabah` VALUES (1,'Sutopo','Jl. Jendral Sudirman 12'),(2,'Maryati','Jl. MT. Haryono'),(3,'Suparman','Jl. Hasanudin 81'),(4,'Kartika Padmasari','Jl. Manggis 15'),(5,'Budi Eko Prayogo','Jl. Kantil 30'),(6,'Satria Eka Jaya','Jl. Slamet Riyadi 45'),(8,'Sari Murti','Jl. Pangandaran 11'),(9,'Canka Lokanata','Jl. Tidar 86'),(10,'Budi Murtono','Jl. Merak 22'),(21,'Muhammad Irfan Abidin','Solo');
/*!40000 ALTER TABLE `nasabah` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nasabah_has_rekening`
--

DROP TABLE IF EXISTS `nasabah_has_rekening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nasabah_has_rekening` (
  `id_nasabah` int(11) NOT NULL,
  `no_rekening` int(11) NOT NULL,
  PRIMARY KEY (`id_nasabah`,`no_rekening`),
  KEY `no_rekening` (`no_rekening`),
  CONSTRAINT `nasabah_has_rekening_ibfk_1` FOREIGN KEY (`id_nasabah`) REFERENCES `nasabah` (`id_nasabah`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `nasabah_has_rekening_ibfk_2` FOREIGN KEY (`no_rekening`) REFERENCES `rekening` (`no_rekening`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nasabah_has_rekening`
--

LOCK TABLES `nasabah_has_rekening` WRITE;
/*!40000 ALTER TABLE `nasabah_has_rekening` DISABLE KEYS */;
INSERT INTO `nasabah_has_rekening` VALUES (2,103),(3,106),(4,101),(4,107),(5,102),(5,107),(6,109),(8,111),(8,112),(9,110),(10,108),(10,113);
/*!40000 ALTER TABLE `nasabah_has_rekening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rekening`
--

DROP TABLE IF EXISTS `rekening`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rekening` (
  `no_rekening` int(11) NOT NULL,
  `kode_cabang` varchar(20) DEFAULT NULL,
  `pin` varchar(20) NOT NULL DEFAULT '1234',
  `saldo` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`no_rekening`),
  KEY `kode_cabang` (`kode_cabang`),
  CONSTRAINT `rekening_ibfk_1` FOREIGN KEY (`kode_cabang`) REFERENCES `cabang_bank` (`kode_cabang`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rekening`
--

LOCK TABLES `rekening` WRITE;
/*!40000 ALTER TABLE `rekening` DISABLE KEYS */;
INSERT INTO `rekening` VALUES (101,'BRUS','1111',500000),(102,'BRUS','2222',350000),(103,'BRUS','3333',750000),(106,'BRUS','6666',300000),(107,'BRUS','7777',1000000),(108,'BRUB','8888',500000),(109,'BRUB','9999',0),(110,'BRUY','1234',550000),(111,'BRUK','4321',150000),(112,'BRUK','123',300000),(113,'BRUY','8888',255000);
/*!40000 ALTER TABLE `rekening` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaksi`
--

DROP TABLE IF EXISTS `transaksi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transaksi` (
  `no_transaksi` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `id_nasabah` int(11) DEFAULT NULL,
  `no_rekening` int(11) DEFAULT NULL,
  `jenis_transaksi` varchar(20) NOT NULL DEFAULT 'debit',
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `jumlah` int(11) NOT NULL CHECK (`jumlah` >= 20000),
  PRIMARY KEY (`no_transaksi`),
  KEY `id_nasabah` (`id_nasabah`),
  KEY `no_rekening` (`no_rekening`),
  CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`id_nasabah`) REFERENCES `nasabah` (`id_nasabah`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`no_rekening`) REFERENCES `rekening` (`no_rekening`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaksi`
--

LOCK TABLES `transaksi` WRITE;
/*!40000 ALTER TABLE `transaksi` DISABLE KEYS */;
INSERT INTO `transaksi` VALUES (1,3,NULL,'debit','2009-11-10 00:00:00',50000),(2,2,103,'debit','2009-11-10 00:00:00',40000),(3,4,101,'kredit','2009-11-12 00:00:00',20000),(4,3,106,'debit','2009-11-13 00:00:00',50000),(5,5,107,'kredit','2009-11-13 00:00:00',30000),(6,1,NULL,'kredit','2009-11-15 00:00:00',200000),(7,9,110,'kredit','2009-11-15 00:00:00',150000),(8,5,102,'debit','2009-11-16 00:00:00',20000),(9,3,NULL,'kredit','2009-11-18 00:00:00',50000),(10,4,107,'debit','2009-11-19 00:00:00',100000),(11,2,103,'debit','2009-11-19 00:00:00',100000),(12,1,NULL,'debit','2009-11-19 00:00:00',50000),(13,4,107,'kredit','2009-11-20 00:00:00',200000),(14,3,NULL,'debit','2009-11-21 00:00:00',40000),(15,1,NULL,'kredit','2009-11-22 00:00:00',100000),(16,4,101,'kredit','2009-11-22 00:00:00',20000),(17,2,103,'debit','2009-11-22 00:00:00',50000),(18,5,102,'debit','2009-11-25 00:00:00',50000),(19,10,108,'debit','2009-11-26 00:00:00',100000),(20,3,106,'kredit','2009-11-27 00:00:00',50000),(21,2,103,'kredit','2009-11-28 00:00:00',200000),(22,3,NULL,'kredit','2009-11-28 00:00:00',100000),(23,5,102,'debit','2009-11-30 00:00:00',20000),(24,1,NULL,'debit','2009-12-01 00:00:00',50000),(25,2,103,'debit','2009-12-02 00:00:00',40000),(26,4,101,'debit','2009-12-04 00:00:00',50000),(27,2,103,'kredit','2009-12-05 00:00:00',100000),(28,5,102,'kredit','2009-12-05 00:00:00',200000),(29,NULL,109,'debit','2009-12-05 00:00:00',100000),(30,9,110,'debit','2009-12-06 00:00:00',20000),(35,2,103,'debit','2009-11-15 00:00:00',250000);
/*!40000 ALTER TABLE `transaksi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-09 15:43:54
