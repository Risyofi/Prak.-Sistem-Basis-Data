-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 22 Bulan Mei 2023 pada 05.14
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `perbankan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `cabang_bank`
--

CREATE TABLE `cabang_bank` (
  `kode_cabang` varchar(20) NOT NULL,
  `nama_cabang` varchar(45) NOT NULL,
  `alamat_cabang` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `cabang_bank`
--

INSERT INTO `cabang_bank` (`kode_cabang`, `nama_cabang`, `alamat_cabang`) VALUES
('BRUB', 'Bank Rut Unit Boyolali', 'Jl.Ahmad Yani 45'),
('BRUK', 'Bank Rut Unit Klaten', 'Jl.Suparman 23'),
('BRUS', 'Bank Rut Unit Surakarta', 'Jl.Slamet Riyadi 18'),
('BRUW', 'Bank Rut Unit Wonogiri', 'Jl. A. Yani No.23'),
('BRUY', 'Bank Rut Unit Yogyakarta', 'Jl.Anggrek 21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nasabah`
--

CREATE TABLE `nasabah` (
  `id_nasabah` int(11) NOT NULL,
  `nama_nasabah` varchar(45) NOT NULL,
  `alamat_nasabah` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nasabah`
--

INSERT INTO `nasabah` (`id_nasabah`, `nama_nasabah`, `alamat_nasabah`) VALUES
(1, 'Sutopo', 'Jl. Jendral Sudirman 12'),
(2, 'Maryati', 'Jl. MT. Heryono 31'),
(3, 'Suparman', 'Jl. Hasanudin 81'),
(4, 'Kartika Padmasari', 'Jl. Manggis 15'),
(5, 'Budi Eko Prayogo', 'Jl. Kantil 30'),
(6, 'Satria Eka Jaya', 'Jl. Slamet Riyadi 45'),
(8, 'Sari Murti', 'Jl. Pangandaran 11'),
(9, 'Canka Lokananta', 'Jl. Tidar 86'),
(10, 'Budi Murtono', 'Jl. Merak 22'),
(11, 'Supono', 'Jl.Ahmad Dahlan 56'),
(12, 'Suryani', 'Jl.Siti Walidah 31'),
(13, 'Endang Sri Suyamti', 'Jl.Soepomo 17'),
(14, 'Suwardi', 'Jl. Mangga 20'),
(15, 'Budiyati', 'Jl. Kenanga 30'),
(16, 'Sundari', 'Jl.Rambutan 17'),
(17, 'Diah Saptarini', 'Jl.Kenangan 5'),
(18, 'Murfiah', 'Jl.Melati 11'),
(19, 'Sukamto', 'Jl.Mawar 5'),
(20, 'Ida Dwi Hastuti', 'Jl.Bangau 24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `nasabah_has_rekening`
--

CREATE TABLE `nasabah_has_rekening` (
  `id_nasabahFK` int(11) NOT NULL,
  `no_rekeningFK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `nasabah_has_rekening`
--

INSERT INTO `nasabah_has_rekening` (`id_nasabahFK`, `no_rekeningFK`) VALUES
(1, 104),
(2, 103),
(3, 105),
(3, 106),
(4, 101),
(4, 107),
(5, 102),
(5, 107),
(6, 109),
(7, 109),
(8, 111),
(8, 112),
(9, 110),
(10, 108),
(10, 113);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rekening`
--

CREATE TABLE `rekening` (
  `no_rekening` int(11) NOT NULL,
  `kode_cabangFK` varchar(20) DEFAULT NULL,
  `pin` varchar(20) NOT NULL DEFAULT '1234',
  `saldo` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rekening`
--

INSERT INTO `rekening` (`no_rekening`, `kode_cabangFK`, `pin`, `saldo`) VALUES
(101, 'BRUS', '1111', 500000),
(102, 'BRUS', '2222', 350000),
(103, 'BRUS', '3333', 750000),
(104, 'BRUM', '4444', 900000),
(105, 'BRUM', '5555', 2000000),
(106, 'BRUS', '6666', 3000000),
(107, 'BRUS', '7777', 1000000),
(108, 'BRUB', '0', 5000000),
(109, 'BRUB', '9999', 0),
(110, 'BRUY', '1234', 550000),
(111, 'BRUK', '4321', 150000),
(112, 'BRUK', '123', 300000),
(113, 'BRUY', '8888', 255000);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `no_transaksi` bigint(20) UNSIGNED NOT NULL,
  `id_nasabahFK` int(11) DEFAULT NULL,
  `no_rekeningFK` int(11) DEFAULT NULL,
  `jenis_transaksi` varchar(20) NOT NULL DEFAULT 'debit',
  `tanggal` datetime NOT NULL DEFAULT current_timestamp(),
  `jumlah` int(11) NOT NULL CHECK (`jumlah` >= 20000)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`no_transaksi`, `id_nasabahFK`, `no_rekeningFK`, `jenis_transaksi`, `tanggal`, `jumlah`) VALUES
(1, 3, 105, 'debit', '2009-11-10 00:00:00', 50000),
(2, 2, 103, 'debit', '2009-11-10 00:00:00', 40000),
(3, 4, 101, 'kredit', '2009-11-12 00:00:00', 20000),
(4, 3, 106, 'debit', '2009-11-13 00:00:00', 50000),
(5, 5, 107, 'kredit', '2009-11-13 00:00:00', 30000),
(6, 1, 104, 'kredit', '2009-11-15 00:00:00', 200000),
(7, 9, 110, 'kredit', '2009-11-15 00:00:00', 150000),
(8, 5, 102, 'debit', '2009-11-16 00:00:00', 20000),
(9, 3, 105, 'kredit', '2009-11-18 00:00:00', 50000),
(10, 4, 107, 'debit', '2009-11-19 00:00:00', 100000),
(11, 2, 103, 'debit', '2009-11-19 00:00:00', 100000),
(12, 1, 104, 'debit', '2009-11-19 00:00:00', 50000),
(13, 4, 107, 'kredit', '2009-11-20 00:00:00', 200000),
(14, 3, 105, 'debit', '2009-11-21 00:00:00', 40000),
(15, 1, 104, 'kredit', '2009-11-22 00:00:00', 100000),
(16, 4, 101, 'kredit', '2009-11-22 00:00:00', 20000),
(17, 2, 103, 'debit', '2009-11-22 00:00:00', 50000),
(18, 5, 102, 'debit', '2009-11-25 00:00:00', 50000),
(19, 10, 108, 'debit', '2009-11-26 00:00:00', 100000),
(20, 3, 106, 'kredit', '2009-11-27 00:00:00', 50000),
(21, 2, 103, 'kredit', '2009-11-28 00:00:00', 200000),
(22, 3, 105, 'kredit', '2009-11-28 00:00:00', 100000),
(23, 5, 102, 'debit', '2009-11-30 00:00:00', 20000),
(24, 1, 104, 'debit', '2009-12-01 00:00:00', 50000),
(25, 2, 103, 'debit', '2009-12-02 00:00:00', 40000),
(26, 4, 101, 'debit', '2009-12-04 00:00:00', 50000),
(27, 2, 103, 'kredit', '2009-12-05 00:00:00', 100000),
(28, 5, 102, 'kredit', '2009-12-05 00:00:00', 200000),
(29, 7, 109, 'debit', '2009-12-05 00:00:00', 100000),
(30, 9, 110, 'debit', '2009-12-06 00:00:00', 20000),
(31, 2, 104, 'debit', '2009-12-06 00:00:00', 40000),
(32, 6, 108, 'kredit', '2009-12-06 00:00:00', 100000),
(33, 4, 103, 'kredit', '2009-12-07 00:00:00', 250000),
(34, 5, 104, 'kredit', '2009-12-07 00:00:00', 100000),
(35, 7, 101, 'debit', '2009-12-07 00:00:00', 50000),
(36, 1, 107, 'kredit', '2009-12-07 00:00:00', 40000),
(37, 2, 102, 'kredit', '2009-12-08 00:00:00', 100000),
(38, 3, 104, 'kredit', '2009-12-08 00:00:00', 30000),
(39, 5, 105, 'debit', '2009-12-08 00:00:00', 300000),
(40, 6, 102, 'debit', '2009-12-08 00:00:00', 100000),
(41, 7, 103, 'debit', '2009-12-08 00:00:00', 200000),
(42, 5, 104, 'kredit', '2009-12-09 00:00:00', 150000),
(43, 2, 101, 'kredit', '2009-12-09 00:00:00', 60000),
(44, 5, 106, 'kredit', '2009-12-09 00:00:00', 50000),
(45, 3, 103, 'debit', '2009-12-09 00:00:00', 100000),
(46, 1, 106, 'debit', '2009-12-09 00:00:00', 200000),
(47, 1, 104, 'kredit', '2009-12-10 00:00:00', 150000),
(48, 5, 102, 'kredit', '2009-12-10 00:00:00', 20000),
(49, 2, 106, 'kredit', '2009-12-10 00:00:00', 100000),
(50, 5, 104, 'kredit', '2009-12-10 00:00:00', 20000);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `cabang_bank`
--
ALTER TABLE `cabang_bank`
  ADD PRIMARY KEY (`kode_cabang`),
  ADD UNIQUE KEY `nama_cabang` (`nama_cabang`);

--
-- Indeks untuk tabel `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id_nasabah`);

--
-- Indeks untuk tabel `nasabah_has_rekening`
--
ALTER TABLE `nasabah_has_rekening`
  ADD PRIMARY KEY (`id_nasabahFK`,`no_rekeningFK`);

--
-- Indeks untuk tabel `rekening`
--
ALTER TABLE `rekening`
  ADD PRIMARY KEY (`no_rekening`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_transaksi`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `no_transaksi` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
