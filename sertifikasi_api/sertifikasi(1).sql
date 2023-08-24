-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 23, 2021 at 11:59 AM
-- Server version: 10.3.22-MariaDB-1
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sertifikasi`
--

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_sertifikasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `mahasiswa`
--

CREATE TABLE `mahasiswa` (
  `id_mhs` int(11) NOT NULL,
  `nim` varchar(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `jurusan` varchar(50) NOT NULL,
  `pilihan1` varchar(25) NOT NULL,
  `pilihan2` varchar(25) NOT NULL,
  `pilihan3` varchar(25) NOT NULL,
  `upload_ktm` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mahasiswa`
--

INSERT INTO `mahasiswa` (`id_mhs`, `nim`, `nama`, `jurusan`, `pilihan1`, `pilihan2`, `pilihan3`, `upload_ktm`) VALUES
(10, '165410029', 'Wedi Arya Santana', 'Teknik Informatika', 'CCNA', 'TOEFL', 'ORACLE', ''),
(11, '165410028', 'Andre Putra', 'Teknik Informatika', 'CCNA', 'TEOFL', 'ORACLE', ''),
(12, '165410090', 'Abdurrahman', 'Sistem Informasi', 'CCNA', 'TEOFL', 'ORACLE', ''),
(13, '12345678', 'Andika Suhardiman', 'Teknik Informatika', 'CCNA', 'TOEFL', 'ORACLE', ''),
(14, '456789', 'yoga', 'Teknik Komputer', 'CCNA', 'TEOFL', 'ORACLE', ''),
(15, '1234', 'Diki Adrian', 'Teknik Komputer', 'CCNA', 'TEOFL', 'ORACLE', ''),
(16, '165410098', 'Andre Shevchenko', 'Teknik Informatika', 'CCNA', 'TEOFL', 'ORACLE', ''),
(17, '165410078', 'puspita pitriani', 'tkj', 'CCNA', 'CISCO', 'TOEFL', 'tes.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `sertifikasi`
--

CREATE TABLE `sertifikasi` (
  `id_sertifikasi` int(11) NOT NULL,
  `nama_sertifikasi` varchar(100) NOT NULL,
  `dosen_pengampu` varchar(100) NOT NULL,
  `hari` varchar(15) NOT NULL,
  `jam` char(15) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sertifikasi`
--

INSERT INTO `sertifikasi` (`id_sertifikasi`, `nama_sertifikasi`, `dosen_pengampu`, `hari`, `jam`, `tanggal`) VALUES
(9, 'TOEFL', 'Siska Lidya Revianti', 'Rabu', '10:00', '2021-07-24'),
(11, 'ORACLE', 'Dany Kristanto', 'Kamis', '10:00', '2021-08-04'),
(12, 'NIIT', 'Agung Budi', 'Rabu', '10:00', '2021-11-23');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` char(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama`, `username`, `password`) VALUES
(30, 'kualakumal', 'kualakumal', 'YXNkZjEyMzQ7'),
(31, 'uciha madara', 'madara', 'YXNkZjEyMzQ7'),
(32, 'jeruk', 'jeruk', 'YXNkZjEyMzQ7'),
(33, 'zahra', 'zahra', 'YXNkZjEyMzQ7'),
(34, 'rahma', 'rahma', 'YXNkZjEyMzQ7'),
(35, 'tes', 'tes', 'MTIzNA=='),
(36, 'nur', 'nur', '81dc9bdb52d04dc20036dbd8313ed055'),
(37, 'kukuku', 'kuku', 'MTIzNA=='),
(38, '', '', ''),
(39, '', '', ''),
(40, '', '', ''),
(41, '', '', ''),
(42, '', '', ''),
(43, 'diki', 'diki', 'MTIzNA=='),
(44, '', '', ''),
(45, '', '', ''),
(46, 'yoga', 'yoga', 'MTIzNA=='),
(47, 'bangsat', 'bangsat', 'YXNkZjEyMzQ7'),
(48, 'tukijo', 'tukijo', 'YXNkZjEyMzQ7'),
(49, 'lambeturah', 'lambe', 'MTIzNA=='),
(50, 'kinclong', 'kinclong', 'YXNkZjEyMzQ7'),
(51, 'pitriani puspita', 'pitriani', 'YXNkZjEyMzQ7');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_ser` (`id_user`),
  ADD KEY `id_sertifikasi` (`id_sertifikasi`);

--
-- Indexes for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  ADD PRIMARY KEY (`id_mhs`);

--
-- Indexes for table `sertifikasi`
--
ALTER TABLE `sertifikasi`
  ADD PRIMARY KEY (`id_sertifikasi`),
  ADD KEY `nama_sertifikasi` (`nama_sertifikasi`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `mahasiswa`
--
ALTER TABLE `mahasiswa`
  MODIFY `id_mhs` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `sertifikasi`
--
ALTER TABLE `sertifikasi`
  MODIFY `id_sertifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_sertifikasi`) REFERENCES `sertifikasi` (`id_sertifikasi`),
  ADD CONSTRAINT `jadwal_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `user` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
