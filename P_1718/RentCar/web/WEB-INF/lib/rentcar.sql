-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.30 - MySQL Community Server - GPL
-- Server OS:                    Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for rentcar
CREATE DATABASE IF NOT EXISTS `rentcar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rentcar`;

-- Dumping structure for table rentcar.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` varchar(10) NOT NULL,
  `nama_customer` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `no_telp` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `no_ktp` varchar(20) NOT NULL,
  PRIMARY KEY (`id_customer`),
  UNIQUE KEY `no_ktp` (`no_ktp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rentcar.customer: ~3 rows (approximately)
INSERT INTO `customer` (`id_customer`, `nama_customer`, `alamat`, `no_telp`, `no_ktp`) VALUES
	('C001', 'Budi Santoso', 'Jl. Merdeka No. 10 Jakarta', '08123456789', '3171234567890001'),
	('C002', 'Siti Aminah', 'Jl. Sudirman No. 20 Bandung', '08234567890', '3271234567890002'),
	('C003', 'Andi Wijaya', 'Jl. Diponegoro No. 15 Surabaya', '08345678901', '3571234567890003'),
	('C004', 'Sonasa Rinusantoro', 'Jl. Sutera Sawangan V', '08123456788', '3174220118190008');

-- Dumping structure for table rentcar.mobil
CREATE TABLE IF NOT EXISTS `mobil` (
  `id_mobil` varchar(10) NOT NULL,
  `merk` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tipe` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tahun` year NOT NULL,
  `warna` varchar(30) NOT NULL,
  `no_polisi` varchar(15) NOT NULL,
  `harga_sewa` decimal(12,2) NOT NULL,
  `status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_mobil`),
  UNIQUE KEY `no_polisi` (`no_polisi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rentcar.mobil: ~0 rows (approximately)
INSERT INTO `mobil` (`id_mobil`, `merk`, `tipe`, `tahun`, `warna`, `no_polisi`, `harga_sewa`, `status`) VALUES
	('M001', 'Toyota', 'Avanza', '2024', 'Hitam', 'B1234ABC', 350000.00, 'Tersedia'),
	('M002', 'Honda', 'Brio', '2023', 'Putih', 'B5678DEF', 300000.00, 'Tersedia'),
	('M003', 'Daihatsu', 'Xenia', '2022', 'Silver', 'B9012GHI', 325000.00, 'Tersedia'),
	('M004', 'Suzuki', 'Jimny', '2025', 'Silver', 'B6543DEF', 400000.00, 'Tersedia');

-- Dumping structure for table rentcar.pengembalian
CREATE TABLE IF NOT EXISTS `pengembalian` (
  `id_kembali` varchar(10) NOT NULL,
  `id_sewa` varchar(10) NOT NULL,
  `tanggal_kembali` date NOT NULL,
  `denda` int DEFAULT '0',
  `total_bayar` int NOT NULL,
  PRIMARY KEY (`id_kembali`),
  KEY `id_sewa` (`id_sewa`),
  CONSTRAINT `pengembalian_ibfk_1` FOREIGN KEY (`id_sewa`) REFERENCES `penyewaan` (`id_sewa`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rentcar.pengembalian: ~1 rows (approximately)
INSERT INTO `pengembalian` (`id_kembali`, `id_sewa`, `tanggal_kembali`, `denda`, `total_bayar`) VALUES
	('K001', 'S001', '2026-06-18', 50000, 110000),
	('K002', 'S002', '2026-06-20', 0, 1000000);

-- Dumping structure for table rentcar.penyewaan
CREATE TABLE IF NOT EXISTS `penyewaan` (
  `id_sewa` varchar(10) NOT NULL,
  `tanggal_sewa` date NOT NULL,
  `id_customer` varchar(10) NOT NULL,
  `id_mobil` varchar(10) NOT NULL,
  `lama_sewa` int NOT NULL,
  `total_bayar` decimal(12,2) NOT NULL,
  PRIMARY KEY (`id_sewa`),
  KEY `fk_customer` (`id_customer`),
  KEY `fk_mobil` (`id_mobil`),
  CONSTRAINT `fk_customer` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id_customer`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_mobil` FOREIGN KEY (`id_mobil`) REFERENCES `mobil` (`id_mobil`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table rentcar.penyewaan: ~2 rows (approximately)
INSERT INTO `penyewaan` (`id_sewa`, `tanggal_sewa`, `id_customer`, `id_mobil`, `lama_sewa`, `total_bayar`) VALUES
	('S001', '2026-06-18', 'C001', 'M001', 3, 1050000.00),
	('S002', '2026-06-18', 'C002', 'M002', 3, 1000000.00);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
