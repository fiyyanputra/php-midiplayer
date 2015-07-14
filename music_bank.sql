-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 12 Jul 2015 pada 22.47
-- Versi Server: 5.6.21
-- PHP Version: 5.5.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `music_bank`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `album`
--

CREATE TABLE IF NOT EXISTS `album` (
`ID_ALBUM` int(11) NOT NULL,
  `ID_GENRE` int(11) NOT NULL,
  `JUDUL` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `album`
--

INSERT INTO `album` (`ID_ALBUM`, `ID_GENRE`, `JUDUL`) VALUES
(1, 2, 'Album Nidji'),
(2, 1, 'Album Shania Twain'),
(3, 3, 'Album Rod Stewart'),
(4, 3, 'Album U2'),
(5, 8, 'Album The Bangles'),
(6, 5, 'Album RATM'),
(7, 4, 'Album Frank Sinatra'),
(8, 7, 'Album Elvy Sukaesih'),
(9, 6, 'Album Kanye West'),
(10, 6, 'Album Leessang');

-- --------------------------------------------------------

--
-- Struktur dari tabel `file_lagu`
--

CREATE TABLE IF NOT EXISTS `file_lagu` (
`ID_FILE` int(11) NOT NULL,
  `NAMA_FILE` varchar(50) NOT NULL,
  `PATH` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `file_lagu`
--

INSERT INTO `file_lagu` (`ID_FILE`, `NAMA_FILE`, `PATH`) VALUES
(1, 'Nidji-Biarlah', ''),
(2, 'Nidji-Hapus_Aku', ''),
(3, 'Nidji-Disco_Lazy_Time', ''),
(4, 'Shania_Twain-You_re_Still_The_One', ''),
(5, 'Shania_Twain-From_This_Moment_On', ''),
(6, 'Shania_Twain-Any_Man_Of_Mine', ''),
(7, 'Frank_Sinatra-Fly_Me_To_The_Moon', ''),
(8, 'Frank_Sinatra-My_Way', ''),
(9, 'Frank_Sinatra-New_York_New_York', ''),
(10, 'Rod_Stewart-I_Dont_Wanna_Talk_About_It', ''),
(11, 'Rod_Stewart-Have_I_Told_You_Lately', ''),
(12, 'Rod_Stewart-Do_Yo_Think_Im_Sexy', ''),
(13, 'U2-With_Or_Without_You', ''),
(14, 'U2-Where_The_Streets_Have_No_Name', ''),
(15, 'U2-One', ''),
(16, 'rage_against_the_machine-killing_in_the_name_of', ''),
(17, 'rage_against_the_machine-know_your_enemy', ''),
(18, 'rage_against_the_machine-bulls_on_parade', ''),
(19, 'Nidji-Kau_Dan_Aku', ''),
(20, 'Elvi_Sukaesih-Bisik_Bisik_Tetangga', ''),
(21, 'Elvi_Sukaesih-Sumpah_Benang_Emas', ''),
(22, 'Elvi_Sukaesih-Gula_Gula', ''),
(23, 'Elvi_Sukaesih-Mawar_Merah', ''),
(24, 'The_Bangles-Eternal_Flame', ''),
(25, 'The_Bangles-Manic_Monday', ''),
(26, 'The_Bangles-Walk_Like_An_Egyptian', ''),
(27, 'kanye_west-all_falls_down', ''),
(28, 'kanye_west-all_the_lights_ft_rihanna', ''),
(29, 'kanye_west-never_let_me_down', ''),
(30, 'kanye_west-through_the_wire', ''),
(31, 'kanye_west-diamonds_are_forever', ''),
(32, 'Nidji-Bila_Aku_Jatuh_Cinta', ''),
(33, 'Leessang_Youre_The_Answer_To_A_Guy_Like_Me', ''),
(34, 'Leessang-Turned_Off_The_TV', ''),
(35, 'Leessang_&_Eugene-Tears', '');

-- --------------------------------------------------------

--
-- Struktur dari tabel `genre`
--

CREATE TABLE IF NOT EXISTS `genre` (
`ID_GENRE` int(11) NOT NULL,
  `NAMA` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `genre`
--

INSERT INTO `genre` (`ID_GENRE`, `NAMA`) VALUES
(1, 'Country'),
(2, 'Pop'),
(3, 'Rock'),
(4, 'Jazz'),
(5, 'Metal'),
(6, 'Hip Hop'),
(7, 'Dangdut'),
(8, 'Pop Rock');

-- --------------------------------------------------------

--
-- Struktur dari tabel `lagu`
--

CREATE TABLE IF NOT EXISTS `lagu` (
`ID_LAGU` int(11) NOT NULL,
  `ID_ALBUM` int(11) DEFAULT NULL,
  `ID_FILE` int(11) NOT NULL,
  `ID_PENYANYI` int(11) NOT NULL,
  `JUDUL` varchar(25) NOT NULL,
  `PENCIPTA` varchar(25) DEFAULT NULL,
  `TAHUN` varchar(4) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `lagu`
--

INSERT INTO `lagu` (`ID_LAGU`, `ID_ALBUM`, `ID_FILE`, `ID_PENYANYI`, `JUDUL`, `PENCIPTA`, `TAHUN`) VALUES
(1, 1, 1, 1, 'Biarlah', NULL, NULL),
(2, 1, 2, 1, 'Hapus Aku', NULL, NULL),
(3, 1, 3, 1, 'Disco Lazy Time', NULL, NULL),
(4, 2, 4, 2, 'You`re Still The One', NULL, NULL),
(5, 2, 5, 2, 'From This Moment On', NULL, NULL),
(6, 2, 6, 2, 'Any Man of Mine', NULL, NULL),
(7, 7, 7, 3, 'Fly Me To The Moon', NULL, NULL),
(8, 7, 8, 3, 'My Way', NULL, NULL),
(9, 7, 9, 3, 'New York New York', NULL, NULL),
(10, 3, 10, 4, 'I Dont Talk About It', NULL, NULL),
(11, 3, 11, 4, 'I Told You Lately', NULL, NULL),
(12, 3, 12, 4, 'Do You Think Im Sexy', NULL, NULL),
(13, 4, 13, 5, 'With Or Without You', NULL, NULL),
(14, 4, 14, 5, 'Where The Streets Have No', NULL, NULL),
(15, 4, 15, 5, 'One', NULL, NULL),
(16, 6, 16, 6, 'Killing In The Name Of', NULL, NULL),
(17, 6, 17, 6, 'Know Your Enemy', NULL, NULL),
(18, 6, 18, 6, 'Bulls On Parade', NULL, NULL),
(19, 1, 19, 1, 'Kau dan Aku', NULL, NULL),
(28, 8, 20, 7, 'Bisik Bisik Tetangga', NULL, NULL),
(29, 8, 21, 7, 'Sumpah Benang Emas', NULL, NULL),
(30, 8, 22, 7, 'Gula Gula', NULL, NULL),
(31, 8, 23, 7, 'Mawar Merah', NULL, NULL),
(32, 5, 24, 8, 'Eternal Flame', NULL, NULL),
(33, 5, 25, 8, 'Manic Monday', NULL, NULL),
(34, 5, 26, 8, 'Walk Like An Egyptian', NULL, NULL),
(35, 9, 27, 9, 'All Falls Down', NULL, NULL),
(36, 9, 28, 9, 'All_The Lights ft Rihanna', NULL, NULL),
(37, 9, 29, 9, 'Let Me Down', NULL, NULL),
(38, 9, 30, 9, 'Through The Wire', NULL, NULL),
(39, 9, 31, 9, 'Diamonds Are Forever', NULL, NULL),
(40, 1, 32, 1, 'Bila Aku Jatuh Cinta', NULL, NULL),
(57, 10, 33, 10, 'Youre The Answer To A Guy', NULL, NULL),
(58, 10, 34, 10, 'Turned Off The TV', NULL, NULL),
(59, 10, 35, 10, 'Tears ft. Eugene', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `penyanyi`
--

CREATE TABLE IF NOT EXISTS `penyanyi` (
`ID_PENYANYI` int(11) NOT NULL,
  `NAMA` varchar(25) NOT NULL,
  `TEMPAT_LAHIR` varchar(25) DEFAULT NULL,
  `TANGGAL_LAHIR` date DEFAULT NULL,
  `JENIS_KELAMIN` varchar(8) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `penyanyi`
--

INSERT INTO `penyanyi` (`ID_PENYANYI`, `NAMA`, `TEMPAT_LAHIR`, `TANGGAL_LAHIR`, `JENIS_KELAMIN`) VALUES
(1, 'Nidji', NULL, NULL, NULL),
(2, 'Shania Twain', NULL, NULL, NULL),
(3, 'Frank Sinatra', NULL, NULL, NULL),
(4, 'Rod Stewart', NULL, NULL, NULL),
(5, 'U2', NULL, NULL, NULL),
(6, 'Rage Against The Machine', NULL, NULL, NULL),
(7, 'Elvy Sukaesih', NULL, NULL, NULL),
(8, 'The Bangles', NULL, NULL, NULL),
(9, 'Kanye West', NULL, NULL, NULL),
(10, 'Leessang', NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `album`
--
ALTER TABLE `album`
 ADD PRIMARY KEY (`ID_ALBUM`), ADD KEY `FK_RELATIONSHIP_4` (`ID_GENRE`);

--
-- Indexes for table `file_lagu`
--
ALTER TABLE `file_lagu`
 ADD PRIMARY KEY (`ID_FILE`);

--
-- Indexes for table `genre`
--
ALTER TABLE `genre`
 ADD PRIMARY KEY (`ID_GENRE`);

--
-- Indexes for table `lagu`
--
ALTER TABLE `lagu`
 ADD PRIMARY KEY (`ID_LAGU`), ADD KEY `FK_RELATIONSHIP_2` (`ID_PENYANYI`), ADD KEY `FK_RELATIONSHIP_3` (`ID_FILE`), ADD KEY `FK_RELATIONSHIP_5` (`ID_ALBUM`);

--
-- Indexes for table `penyanyi`
--
ALTER TABLE `penyanyi`
 ADD PRIMARY KEY (`ID_PENYANYI`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `album`
--
ALTER TABLE `album`
MODIFY `ID_ALBUM` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `file_lagu`
--
ALTER TABLE `file_lagu`
MODIFY `ID_FILE` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=36;
--
-- AUTO_INCREMENT for table `genre`
--
ALTER TABLE `genre`
MODIFY `ID_GENRE` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `lagu`
--
ALTER TABLE `lagu`
MODIFY `ID_LAGU` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=60;
--
-- AUTO_INCREMENT for table `penyanyi`
--
ALTER TABLE `penyanyi`
MODIFY `ID_PENYANYI` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `album`
--
ALTER TABLE `album`
ADD CONSTRAINT `FK_RELATIONSHIP_4` FOREIGN KEY (`ID_GENRE`) REFERENCES `genre` (`ID_GENRE`);

--
-- Ketidakleluasaan untuk tabel `lagu`
--
ALTER TABLE `lagu`
ADD CONSTRAINT `FK_RELATIONSHIP_2` FOREIGN KEY (`ID_PENYANYI`) REFERENCES `penyanyi` (`ID_PENYANYI`),
ADD CONSTRAINT `FK_RELATIONSHIP_3` FOREIGN KEY (`ID_FILE`) REFERENCES `file_lagu` (`ID_FILE`),
ADD CONSTRAINT `FK_RELATIONSHIP_5` FOREIGN KEY (`ID_ALBUM`) REFERENCES `album` (`ID_ALBUM`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
