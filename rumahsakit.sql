-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2024 at 04:55 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` varchar(10) NOT NULL,
  `nama_dokter` text NOT NULL,
  `jeniskelamin_dokter` text NOT NULL,
  `alamat_dokter` text NOT NULL,
  `notel_dokter` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `jeniskelamin_dokter`, `alamat_dokter`, `notel_dokter`) VALUES
('DK001', 'Amalia', 'Perempuan', 'Jakarta Barat', 895122312),
('DK002', 'Kevin', 'Laki-Laki', 'Jakarta Pusat', 21356423),
('DK003', 'Desi', 'Perempuan', 'Tangerang', 895433278),
('DK004', 'Adhit', 'Laki-Laki', 'Bekasi', 546734213),
('DK005', 'Rehan', 'Laki-Laki', 'Bogor', 865478432);

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` varchar(10) NOT NULL,
  `nama_obat` varchar(30) NOT NULL,
  `harga` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`, `harga`) VALUES
('OBT001', 'Paracetamol', 10000),
('OBT002', 'Betadin', 25500),
('OBT003', 'Sanadryl', 20300),
('OBT004', 'Methyprednisolone', 9000),
('OBT005', 'Panadol', 15000);

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` varchar(10) NOT NULL,
  `nama_pasien` text NOT NULL,
  `jeniskelamin_pasien` text NOT NULL,
  `alamat_pasien` text NOT NULL,
  `notel_pasien` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`id_pasien`, `nama_pasien`, `jeniskelamin_pasien`, `alamat_pasien`, `notel_pasien`) VALUES
('PS001', 'Ivan', 'Laki-Laki', 'Bogor', 87654982),
('PS002', 'Rio', 'Laki-Laki', 'Medan', 845825332),
('PS003', 'Aisyah', 'Perempuan', 'Kebon Jeruk', 854776328),
('PS004', 'Marisa', 'Perempuan', 'Makasar', 892853321),
('PS005', 'Jamila', 'Perempuan', 'Bandung', 857769422);

-- --------------------------------------------------------

--
-- Table structure for table `penyakit`
--

CREATE TABLE `penyakit` (
  `id_penyakit` varchar(10) NOT NULL,
  `nama_penyakit` varchar(50) NOT NULL,
  `keterangan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `penyakit`
--

INSERT INTO `penyakit` (`id_penyakit`, `nama_penyakit`, `keterangan`) VALUES
('PN001', 'Demam', 'Sakit Kepala, Menggigil, Kelelahan'),
('PN002', 'Radang', 'Suara Serak, Sakit Tenggorokan, Batuk'),
('PN003', 'Migrain', 'Pucat, Mual, Sakit Kepala'),
('PN004', 'Batuk', 'Sakit Tenggorokan, Badan Panas'),
('PN005', 'Luka Luar', 'Luka Berdarah');

-- --------------------------------------------------------

--
-- Table structure for table `periksa`
--

CREATE TABLE `periksa` (
  `id_periksa` varchar(10) NOT NULL,
  `tgl_periksa` date NOT NULL,
  `id_dokter` varchar(10) NOT NULL,
  `id_pasien` varchar(10) NOT NULL,
  `id_penyakit` varchar(10) NOT NULL,
  `keluhan` text NOT NULL,
  `diagnosa` varchar(100) NOT NULL,
  `id_obat` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `periksa`
--

INSERT INTO `periksa` (`id_periksa`, `tgl_periksa`, `id_dokter`, `id_pasien`, `id_penyakit`, `keluhan`, `diagnosa`, `id_obat`) VALUES
('PR001', '2024-05-02', 'DK001', 'PS004', 'PN001', 'Badan Panas, Menggigil, Sakit Kepala, Gampang kelelahan', 'Demam', 'OBT001'),
('PR002', '2024-05-03', 'DK004', 'PS004', 'PN002', 'Sakit Tenggorokan dan Batuk', 'Radang', 'OBT004'),
('PR003', '2024-05-03', 'DK003', 'PS002', 'PN003', 'Mual, Sakit Kepala', 'Migrain', 'OBT005'),
('PR004', '2024-05-03', 'DK005', 'PS001', 'PN005', 'Luka Berdarah', 'Luka Luar', 'OBT002'),
('PR005', '2024-05-04', 'DK001', 'PS002', 'PN005', 'Luka Berdarah, bengkak', 'Luka Luar', 'OBT005');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`);

--
-- Indexes for table `penyakit`
--
ALTER TABLE `penyakit`
  ADD PRIMARY KEY (`id_penyakit`);

--
-- Indexes for table `periksa`
--
ALTER TABLE `periksa`
  ADD PRIMARY KEY (`id_periksa`),
  ADD UNIQUE KEY `id_dokter` (`id_dokter`,`id_pasien`,`id_penyakit`,`id_obat`),
  ADD KEY `id_obat` (`id_obat`),
  ADD KEY `id_pasien` (`id_pasien`),
  ADD KEY `id_penyakit` (`id_penyakit`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `periksa`
--
ALTER TABLE `periksa`
  ADD CONSTRAINT `periksa_ibfk_1` FOREIGN KEY (`id_obat`) REFERENCES `obat` (`id_obat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_ibfk_2` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_ibfk_3` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `periksa_ibfk_4` FOREIGN KEY (`id_penyakit`) REFERENCES `penyakit` (`id_penyakit`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
