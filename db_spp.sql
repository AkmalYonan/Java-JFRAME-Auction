-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 27, 2024 at 02:40 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_spp`
--

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id` int(15) NOT NULL,
  `nama_kelas` varchar(20) NOT NULL,
  `jurusan` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id`, `nama_kelas`, `jurusan`) VALUES
(1, 'RPL', 'Rekayasa Perangkat Lunak'),
(2, 'TABUS', 'Tata Busana'),
(3, 'TABOG', 'Tata Boga'),
(4, 'UPW', 'Usaha Perjalanan Wisata'),
(5, 'PH', 'Perhotelan');

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `nisn` int(20) NOT NULL,
  `nis` int(20) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `kelas_id` varchar(70) NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(40) NOT NULL,
  `spp_id` varchar(20) NOT NULL,
  `level` varchar(20) NOT NULL DEFAULT 'SISWA'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`nisn`, `nis`, `nama`, `kelas_id`, `alamat`, `telp`, `spp_id`, `level`) VALUES
(111, 11, 'Tasya', 'RPL|Rekayasa Perangkat Lunak', 'JL.Asem aem', '08577789776', '2023|50000', 'SISWA'),
(222, 22, 'Aziz', 'RPL|Rekayasa Perangkat Lunak', 'JL.Kali Sari', '08577789889', '2023|100000', 'SISWA'),
(333, 33, 'Viola', 'TABUS|Tata Busana', 'JL.Padelarang', '08577789886', '2023|100000', 'SISWA'),
(444, 44, 'Rere', 'PH|Perhotelan', 'JL.Cipayung', '08577789442', '2024|250000', 'SISWA'),
(555, 55, 'Raka', 'TABOG|Tata Boga', 'JL.Malaka', '08577789225', '2024|300000', 'SISWA'),
(666, 66, 'Yudhi', 'RPL|Rekayasa Perangkat Lunak', 'JL.Buni', '08577789227', '2023|100000', 'SISWA');

-- --------------------------------------------------------

--
-- Table structure for table `spp`
--

CREATE TABLE `spp` (
  `id` int(15) NOT NULL,
  `tahun` varchar(15) NOT NULL,
  `bulan` varchar(15) NOT NULL,
  `nominal` int(30) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spp`
--

INSERT INTO `spp` (`id`, `tahun`, `bulan`, `nominal`) VALUES
(14, '2023', 'Januari', 50000),
(15, '2023', 'Febuari', 50000),
(16, '2023', 'Maret', 100000),
(17, '2023', 'April', 100000),
(18, '2024', 'Januari', 200000),
(19, '2024', 'Febuari', 250000),
(20, '2024', 'Maret', 300000);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(15) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `nisn` int(20) NOT NULL,
  `tgl_bayar` char(15) NOT NULL,
  `bln_bayar` varchar(15) NOT NULL,
  `th_bayar` char(10) NOT NULL,
  `spp_id` varchar(20) NOT NULL,
  `jml_bayar` varchar(30) NOT NULL,
  `status` enum('Lunas','Tertunda') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `nama`, `nisn`, `tgl_bayar`, `bln_bayar`, `th_bayar`, `spp_id`, `jml_bayar`, `status`) VALUES
(18, 'Aziz', 222, '14', 'April', '2023', '2023|100000', '100000', 'Lunas'),
(19, 'Viola', 333, '13', 'April', '2023', '2024|300000', '300000', 'Lunas'),
(20, 'Raka', 555, '12', 'Maret', '2023', '2023|50000', '40000', 'Tertunda'),
(21, 'Yudhi', 666, '12', 'April', '2023', '2023|100000', '100000', 'Lunas'),
(22, 'dewi', 98, '09-09-2023', 'April', '2024', '2023|50000', '50000', 'Lunas');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(15) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `level` enum('ADMIN','PETUGAS') NOT NULL DEFAULT 'PETUGAS',
  `status` enum('AKTIF','PASIF') NOT NULL DEFAULT 'AKTIF'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `nama_user`, `username`, `password`, `level`, `status`) VALUES
(1, 'Tasya Ramadhinta', 'Tasya', '5f49e4529bdd931f9acc9a9f59df4e73', 'ADMIN', 'AKTIF'),
(2, 'Muhammad Aziz', 'Aziz', 'Aziz', 'ADMIN', 'AKTIF'),
(3, 'Mark Zurkeberg', 'Mark', 'Mark', 'ADMIN', 'PASIF'),
(4, 'Arina', 'Rinaa', 'Rina', 'PETUGAS', 'PASIF'),
(5, 'Annisa Khoirunnisa', 'Annisa', '2cae57c3ddc4a8e3e204593b4ba14ff3', 'PETUGAS', 'AKTIF'),
(6, 'Fiola Putri', 'Fiolala', 'fiola', 'PETUGAS', 'AKTIF');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`nisn`),
  ADD KEY `kelas_id` (`kelas_id`),
  ADD KEY `spp_id` (`spp_id`);

--
-- Indexes for table `spp`
--
ALTER TABLE `spp`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`nama`),
  ADD KEY `nisn` (`nisn`),
  ADD KEY `spp_id` (`spp_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `spp`
--
ALTER TABLE `spp`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
