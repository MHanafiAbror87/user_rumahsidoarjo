-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 06, 2022 at 09:05 AM
-- Server version: 10.4.8-MariaDB
-- PHP Version: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsidoarjo`
--

-- --------------------------------------------------------

--
-- Table structure for table `berita_informasi`
--

CREATE TABLE `berita_informasi` (
  `kode` int(11) NOT NULL,
  `kategori` enum('informasi','berita','pengumuman') NOT NULL,
  `judul` varchar(100) NOT NULL,
  `tanggal_publish` date NOT NULL,
  `deskripsi` text NOT NULL,
  `gambar` varchar(30) NOT NULL,
  `link` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `berita_informasi`
--

INSERT INTO `berita_informasi` (`kode`, `kategori`, `judul`, `tanggal_publish`, `deskripsi`, `gambar`, `link`) VALUES
(1, 'informasi', 'Antusiasme Warga Desa Pabean Ikuti Sosialisasi DBHCHT', '2021-09-22', 'ominfo, Sidoarjo - Sosialisasi DBHCHT kali ke 7 kembali diselenggarakan Dinas Komunikasi dan Informatika Kabupaten Sidoarjo, di balai Desa Pabean, Kecamatan Sedati, pada Selasa (21/9).\r\n\r\nDibuka oleh M. Wildan, SS, Kepala Seksi Layanan Informasi Publik Dinas Kominfo Sidoarjo. Sekira 50 warga sekitar Desa Pabean antusias mengikuti acara sosialisasi pemberantasan rokok ilegal 2021 ini. Hadir narasumber dari Bagian Perekonomian Sidoarjo, Satpol PP Sidoarjo dan Perwakilan Kantor Bea Cukai Sidoarjo.\r\n\r\nHal yang dibahas dalam sosialisasi kali ini sama dengan poin sebelumnya, yakni seputar pemanfaatan dan penggunaan dana bagi hasil cukai hasil tembakau (DBHCHT). Kepala Bagian Perekonomian Sidoarjo, Sri Warso Yudhono, SE mengatakan prioritas penggunaan DBHCHT tahun ini adalah difokuskan untuk karyawan atau pekerja di bidang industri rokok. \"Alhamdulillah ada karyawan rokok dari 41 perusahaan rokok di Sidoarjo sudah mendapatkan bantuan uang tunai sebesar Rp 300.000; setiap bulannya sampai Desember mendatang. Itu diambilkan dari DBHCHT ini,\" terang Yudho', '12.jpeg', 'https://diskominfo.sidoarjokab.go.id/?page=v-berita&id=1632285201'),
(2, 'berita', 'Bupati Muhdlor Galang Dekranasda Kebut Program Digitalisasi UMKM', '2021-10-18', ' Kominfo, Sidoarjo - Kepengurusan Dewan Kerajinan Nasional Daerah Kabupaten Sidoarjo (Dekranasda) masa bakti 2021 - 2024 secara resmi dilantik Bupati Sidoarjo Ahmad Muhdlor di Pendopo Delta Wibawa, Kamis (18/11/2021),', '12.jpeg', 'https://www.sidoarjokab.go.id/bupati-muhdlor-galang-dekranasda-kebut-program-digitalisasi-umkm'),
(3, 'pengumuman', 'Perubahan APBD Sidoarjo TA>A 2021', '2021-11-17', 'Perda Perubahan APBD Sidoarjo T.A. 2021', '12.jpeg', 'https://www.sidoarjokab.go.id/perubahan-apbd-sidoarjo-taa-2021');

-- --------------------------------------------------------

--
-- Table structure for table `bpbd`
--

CREATE TABLE `bpbd` (
  `id_bpbd` int(11) NOT NULL,
  `id_kecamatan` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `penanggungjawab` varchar(50) NOT NULL,
  `lat` varchar(50) NOT NULL,
  `long` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bpbd`
--

INSERT INTO `bpbd` (`id_bpbd`, `id_kecamatan`, `nama`, `alamat`, `no_tlp`, `penanggungjawab`, `lat`, `long`) VALUES
(8, 2, 'Kantor Bantuan', 'jol. Kayun no.12', '081273638383', 'Dika Pratama', '', ''),
(9, 3, 'Kantor Cabang Kriyan', 'jl. Mastrip 3 no.5', '08127439393', 'Bayu Agil', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `cctv`
--

CREATE TABLE `cctv` (
  `id_cctv` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `status` enum('Aktif','Tidak Aktif') NOT NULL,
  `link` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cctv`
--

INSERT INTO `cctv` (`id_cctv`, `nama`, `alamat`, `status`, `link`) VALUES
(4, 'Alun-Alun', 'jl. Songosari', 'Aktif', ''),
(5, 'Tower Toren', 'jl. Singa no.23', 'Tidak Aktif', ''),
(6, 'Simpang 4', 'jl.Bunga ', 'Aktif', '');

-- --------------------------------------------------------

--
-- Table structure for table `ekskul_sekolah`
--

CREATE TABLE `ekskul_sekolah` (
  `id_ekskul` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ekskul_sekolah`
--

INSERT INTO `ekskul_sekolah` (`id_ekskul`, `id_sekolah`, `nama`) VALUES
(1, 1, 'Karate'),
(2, 2, 'Badminton'),
(3, 8, 'Karate'),
(4, 4, 'Futsal');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id_event` int(11) NOT NULL,
  `kategori` enum('Agenda Kota','Lomba Budaya') NOT NULL,
  `nama_event` varchar(100) NOT NULL,
  `tgl_posting` date NOT NULL,
  `penyelenggara` varchar(100) NOT NULL,
  `tempat_kegiatan` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto1` varchar(30) NOT NULL,
  `foto2` varchar(30) NOT NULL,
  `foto3` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`id_event`, `kategori`, `nama_event`, `tgl_posting`, `penyelenggara`, `tempat_kegiatan`, `deskripsi`, `foto1`, `foto2`, `foto3`) VALUES
(1, 'Agenda Kota', 'Menggambar', '2021-10-21', 'Dinas Pendidikan', 'Alun-Alun Kabupaten Sidoarjo', 'Kegiatan Menggambar Bersama', 'pariwisata.jpg', 'sekolah.jpg', ''),
(2, 'Lomba Budaya', 'Lomba Tari ', '2021-11-08', 'Dinas Kebudayaan', 'Alun-Alun Kabupaten Sidoarjo', 'Keiatan ini dilaksanakan oleh Dinas Kebudayaan', 'pariwisata.jpg', 'sekolah.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `event_komunitas`
--

CREATE TABLE `event_komunitas` (
  `id_event` int(11) NOT NULL,
  `id_komunitas` int(11) NOT NULL,
  `nama_event` varchar(200) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `tempat` varchar(100) NOT NULL,
  `penanggung_jawab` varchar(100) NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto1` varchar(100) NOT NULL,
  `foto2` varchar(100) NOT NULL,
  `status` enum('Akan Datang','Event Selesai') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `event_komunitas`
--

INSERT INTO `event_komunitas` (`id_event`, `id_komunitas`, `nama_event`, `tanggal`, `waktu`, `tempat`, `penanggung_jawab`, `no_tlp`, `deskripsi`, `foto1`, `foto2`, `status`) VALUES
(1, 2, 'Mari Berkarya melalui Tari Tradisional', '2021-10-20', '06:00:00', 'Alun-Alun kabupaten Sidoarjo', 'Harisman Sihombing', '081923027300', 'Kegiatan ini dilaksanakan oleh komunitas tari', 'tari.jpg', '', 'Akan Datang'),
(2, 3, 'Mancing mania', '2021-10-27', '02:12:00', 'Kolam Pemancingan ', 'Hanafi Abror', '08929102838', 'Dapatkan hadiah dengan menangkap ikan sebanyak-banyaknya', 'tari.jpg', '', 'Event Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `fasilitas_sekolah`
--

CREATE TABLE `fasilitas_sekolah` (
  `id_fasilitas` int(11) NOT NULL,
  `id_sekolah` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `fasilitas_sekolah`
--

INSERT INTO `fasilitas_sekolah` (`id_fasilitas`, `id_sekolah`, `nama`) VALUES
(1, 1, 'Lab. Kimia'),
(2, 2, 'Lab Fisika'),
(3, 8, 'Lapangan Basket'),
(4, 1, 'Lab Fisika'),
(5, 4, 'Lab Fisika');

-- --------------------------------------------------------

--
-- Table structure for table `kantor_polisi`
--

CREATE TABLE `kantor_polisi` (
  `id_kantor_polisi` int(11) NOT NULL,
  `id_kecamatan` int(11) NOT NULL,
  `nama_kantor_polisi` varchar(150) NOT NULL,
  `alamat` varchar(200) NOT NULL,
  `no_tlp` varchar(200) NOT NULL,
  `penanggungjawab` varchar(50) NOT NULL,
  `lat` varchar(100) NOT NULL,
  `long` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kantor_polisi`
--

INSERT INTO `kantor_polisi` (`id_kantor_polisi`, `id_kecamatan`, `nama_kantor_polisi`, `alamat`, `no_tlp`, `penanggungjawab`, `lat`, `long`) VALUES
(9, 5, 'Kepolisian Resor (POLRES) Sidoarjo', 'Jl. Kombespol M. Duriat No. 45, Kabupaten Sidoarjo, Jawa Timur', '082276485986', 'Bayu Pratama', '', ''),
(10, 14, 'Kantor Polisi Wonoayu', 'Wonoayu Sidoarjo', '08328374', 'Harisman', '', ''),
(12, 14, 'Kantor Polisi cabang Kota', 'Sidoarjo Kota', '082378948399', 'Budi Doremi', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_layanan`
--

CREATE TABLE `kategori_layanan` (
  `id_kategorilayanan` int(11) NOT NULL,
  `nama_kategori` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_layanan`
--

INSERT INTO `kategori_layanan` (`id_kategorilayanan`, `nama_kategori`) VALUES
(2, 'SIM'),
(4, 'KTP'),
(5, 'Kartu Keluarga');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_wisata`
--

CREATE TABLE `kategori_wisata` (
  `id_kategori_wisata` int(11) NOT NULL,
  `kategori` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori_wisata`
--

INSERT INTO `kategori_wisata` (`id_kategori_wisata`, `kategori`) VALUES
(1, 'pemancingan'),
(2, 'sejarah'),
(3, 'kuliner');

-- --------------------------------------------------------

--
-- Table structure for table `kecamatan`
--

CREATE TABLE `kecamatan` (
  `id_kecamatan` int(11) NOT NULL,
  `kecamatan` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kecamatan`
--

INSERT INTO `kecamatan` (`id_kecamatan`, `kecamatan`) VALUES
(1, 'Balongbendo'),
(2, 'Buduran'),
(3, 'Candi'),
(4, 'Gedangan'),
(5, 'Jabon'),
(6, 'Krembung'),
(7, 'Krian'),
(8, 'Prambon'),
(9, 'Porong'),
(10, 'Sedati'),
(11, 'Sukodono'),
(12, 'sidoarjo'),
(13, 'sukodono'),
(14, 'Taman'),
(15, 'Tanggulangin'),
(16, 'Tarik'),
(17, 'Tulangan'),
(18, 'Waru'),
(19, 'Wonoayu');

-- --------------------------------------------------------

--
-- Table structure for table `kelurahan`
--

CREATE TABLE `kelurahan` (
  `id_kelurahan` int(11) NOT NULL,
  `id_kecamatan` int(11) NOT NULL,
  `nama` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelurahan`
--

INSERT INTO `kelurahan` (`id_kelurahan`, `id_kecamatan`, `nama`) VALUES
(1, 1, 'Balongbendo'),
(2, 1, 'Bakalan Wringinpitu'),
(3, 1, 'Bakungpringgodani'),
(4, 2, 'Banjarkemantran'),
(5, 2, 'Banjarsari'),
(6, 2, 'Buduran'),
(7, 3, 'Balongdowo'),
(8, 3, 'Balonggabus'),
(9, 3, 'Bligo'),
(10, 4, 'Bangah'),
(11, 4, 'Ganting'),
(12, 4, 'Gedangan'),
(13, 5, 'Balongtani'),
(14, 5, 'Besuki'),
(15, 5, 'Dukuhsari'),
(16, 6, 'Balanggarut'),
(17, 6, 'Cankring'),
(18, 6, 'Gading'),
(19, 7, 'Barengkrajan'),
(20, 7, 'Gamping'),
(21, 7, 'Jatikalang'),
(22, 8, 'Bendotretek'),
(23, 8, 'Bulang'),
(24, 8, 'Cangkringturi'),
(25, 9, 'Candipari'),
(26, 9, 'Glagaharum'),
(27, 9, 'Kebakalan'),
(28, 10, 'Banjarkemuningtambak'),
(29, 10, 'Betro'),
(30, 10, 'Buncitan'),
(31, 11, 'Anggaswangi'),
(32, 11, 'Bangsri'),
(33, 11, 'Cangkringsari'),
(34, 11, 'Jumputrejo'),
(35, 11, 'Kebonagung'),
(36, 11, 'Keloposepuluh'),
(37, 11, 'Jogosatru'),
(38, 11, 'Masangankulon'),
(39, 11, 'Masanganwetan'),
(40, 11, 'Ngaresrejo'),
(41, 11, 'Pademonegoro'),
(42, 11, 'Panjunan'),
(43, 11, 'Pekarungan'),
(44, 11, 'Plumbungan'),
(45, 11, 'Sambungrejo'),
(46, 11, 'Sukodono'),
(47, 11, 'Suko'),
(48, 11, 'Suruh'),
(49, 11, 'Wilayut'),
(50, 1, 'Bakungtemenggungan'),
(51, 1, 'Bogempinggir'),
(52, 1, 'Gadungkepuhsari'),
(53, 1, 'Jabaran'),
(54, 1, 'Jeruklegi'),
(55, 1, 'Kedungsukodani'),
(56, 1, 'Kemangsen'),
(57, 1, 'Penambangan'),
(58, 1, 'Seduri'),
(59, 1, 'Seketi'),
(60, 1, 'Singkalang'),
(61, 1, 'Sumokebangsri'),
(62, 1, 'Suwaluh'),
(63, 1, 'Waruberon'),
(64, 1, 'Watesari'),
(65, 1, 'Wonokarang'),
(66, 1, 'Wonokupang'),
(70, 1, 'Bakungtemenggungan'),
(71, 1, 'Bogempinggir'),
(72, 1, 'Gadungkepuhsari'),
(73, 1, 'Jabaran'),
(74, 1, 'Jeruklegi'),
(75, 1, 'Kedungsukodani'),
(76, 1, 'Kemangsen'),
(77, 1, 'Penambangan'),
(78, 1, 'Seduri'),
(79, 1, 'Seketi'),
(80, 1, 'Singkalang'),
(81, 1, 'Sumokebangsri'),
(82, 1, 'Suwaluh'),
(83, 1, 'Waruberon'),
(84, 1, 'Watesari'),
(85, 1, 'Wonokarang'),
(86, 1, 'Wonokupang'),
(87, 2, 'Entalsewu'),
(88, 2, 'Pagerwojo'),
(89, 2, 'Prasung'),
(90, 2, 'Sawohan'),
(91, 2, 'Sidokerto'),
(92, 2, 'Sidomulyo'),
(93, 2, 'Sidokepung'),
(94, 2, 'Siwalanpanji'),
(95, 2, 'Sukorejo'),
(96, 2, 'Wadungasin'),
(97, 2, 'Damarsi'),
(98, 2, 'Dukuhtengah'),
(99, 3, 'Candi'),
(100, 3, 'Durungbanjar'),
(101, 3, 'Durungbedug'),
(102, 3, 'Gelam'),
(103, 3, 'Jambangan'),
(104, 3, 'Kalipecabean'),
(105, 3, 'Karangtanjung'),
(106, 3, 'Kebonsari'),
(107, 3, 'Kedungkendo'),
(108, 3, 'Kedungpeluk'),
(109, 3, 'Kendalpecabean'),
(110, 3, 'Klurak'),
(111, 3, 'Larangan'),
(112, 3, 'Ngampelsari'),
(113, 3, 'Sepande'),
(114, 3, 'Sidodadi'),
(115, 3, 'Sugihwaras'),
(116, 3, 'Sumokali'),
(117, 3, 'Sumorame'),
(118, 3, 'Tenggulunan'),
(119, 3, 'Wedoroklurak'),
(121, 3, 'Candi'),
(122, 3, 'Durungbanjar'),
(123, 3, 'Durungbedug'),
(124, 3, 'Gelam'),
(125, 3, 'Jambangan'),
(126, 3, 'Kalipecabean'),
(127, 3, 'Karangtanjung'),
(128, 3, 'Kebonsari'),
(129, 3, 'Kedungkendo'),
(130, 3, 'Kedungpeluk'),
(131, 3, 'Kendalpecabean'),
(132, 3, 'Klurak'),
(133, 3, 'Larangan'),
(134, 3, 'Ngampelsari'),
(135, 3, 'Sepande'),
(136, 3, 'Sidodadi'),
(137, 3, 'Sugihwaras'),
(138, 3, 'Sumokali'),
(139, 3, 'Sumorame'),
(140, 3, 'Tenggulunan'),
(141, 3, 'Wedoroklurak'),
(142, 4, 'Gemurung'),
(143, 4, 'Karangbong'),
(144, 4, 'Keboan Sikep'),
(145, 4, 'Keboan Anom'),
(146, 4, 'Ketajen'),
(147, 4, 'Kragan'),
(148, 4, 'Punggul'),
(149, 4, 'Sawo Tratap'),
(150, 4, 'Semambung'),
(151, 4, 'Seruni'),
(152, 4, 'Tebel'),
(153, 4, 'Wedi'),
(154, 5, 'Jemirahan'),
(155, 5, 'Keboguyang'),
(156, 5, 'Kedungcangkring'),
(157, 5, 'Kedungpandan'),
(159, 5, 'Kedungrejo'),
(160, 5, 'Kupang'),
(161, 5, 'Panggreh'),
(162, 5, 'Pejarakan'),
(163, 5, 'Permisan'),
(164, 5, 'Semambung'),
(165, 5, 'Tambakkalisogo'),
(166, 5, 'Trompoasri'),
(167, 6, 'Jenggot'),
(168, 6, 'Kandangan'),
(169, 6, 'Kedungrawan'),
(170, 6, 'Kedungsumur'),
(171, 6, 'Keper'),
(172, 6, 'Keret'),
(173, 6, 'Krembung'),
(174, 6, 'Lemujut'),
(175, 6, 'Mojoruntut'),
(176, 6, 'Ploso'),
(177, 6, 'Rejeni'),
(178, 6, 'Tambakrejo'),
(179, 6, 'Tanjegwagir'),
(180, 6, 'Wangkal'),
(181, 6, 'Wonomlati'),
(182, 6, 'Waung'),
(183, 7, 'Jerukgamping'),
(184, 7, 'Junwangi'),
(185, 7, 'Katerungan'),
(186, 7, 'Keboharan'),
(187, 7, 'Kraton'),
(188, 7, 'Ponokawan'),
(189, 7, 'Sedenganmijen'),
(190, 7, 'Sidomojo'),
(191, 7, 'Sidomulyo'),
(192, 7, 'Sidorejo'),
(193, 7, 'Tempel'),
(194, 7, 'Terik'),
(195, 7, 'Terungkulon'),
(196, 7, 'Terungwetan'),
(197, 7, 'Tropodo'),
(198, 7, 'Watugolong'),
(199, 7, 'Kemasan'),
(200, 7, 'Krian'),
(201, 7, 'Tambak Kemerakan'),
(202, 8, 'Gampang'),
(203, 8, 'Gedangrowo'),
(204, 8, 'Jatialunalun'),
(205, 8, 'Jatikalang'),
(206, 8, 'Jedongcangkring'),
(207, 8, 'Kajartrengguli'),
(208, 8, 'Kedungkembar'),
(209, 8, 'Kedungsugo'),
(210, 8, 'Kedungwonokerto'),
(211, 8, 'Pejangkungan'),
(212, 8, 'Prambon'),
(213, 8, 'Simogirang'),
(214, 8, 'Simpang'),
(215, 8, 'Temu'),
(216, 8, 'Watutulis'),
(217, 8, 'Wirobiting'),
(218, 8, 'Wonoplintahan'),
(219, 9, 'Kebonagung'),
(220, 9, 'Kedungboto'),
(221, 9, 'Kedungsolo'),
(222, 9, 'Kesambi'),
(223, 9, 'Lajuk'),
(224, 9, 'Pamotan'),
(225, 9, 'Pesawahan'),
(226, 9, 'Plumbon'),
(227, 9, 'Reno Kenongo'),
(228, 9, 'Wunut'),
(229, 9, 'Gedang'),
(230, 9, 'Jatirejo'),
(231, 9, 'Juwetkenongo'),
(232, 9, 'Mindi'),
(233, 9, 'Porong'),
(234, 9, 'Siring'),
(235, 10, 'Cemandi'),
(236, 10, 'Gisikcemandi'),
(237, 10, 'Kalanganyar'),
(238, 10, 'Kwangsan'),
(239, 10, 'Pabean'),
(240, 10, 'Pepe'),
(241, 10, 'Pranti'),
(242, 10, 'Pulungan'),
(243, 10, 'Sedatiagungi'),
(244, 10, 'Sedatigede'),
(245, 10, 'Segorotambak'),
(246, 10, 'Semampir'),
(247, 10, 'Tambakcemandi'),
(248, 12, 'Banjarbendo'),
(249, 12, 'Bluru Kidul'),
(250, 12, 'Cemengbakalan'),
(251, 12, 'Jati'),
(252, 12, 'Kemiri'),
(254, 12, 'Lebo'),
(255, 12, 'Rangkah Kidul'),
(256, 12, 'Sarirogo'),
(257, 12, 'Suko'),
(258, 12, 'Sumput'),
(259, 12, 'Bulusidokare'),
(260, 12, 'Celep'),
(261, 12, 'Cemengkalang'),
(262, 12, 'Gebang'),
(263, 12, 'Lemahputro'),
(264, 12, 'Magersari'),
(265, 12, 'Pekauman'),
(266, 12, 'Pucang'),
(267, 12, 'Pucanganom'),
(268, 12, 'Sekardangan'),
(269, 12, 'Sidokare'),
(270, 12, 'Sidoklumpuk'),
(271, 12, 'Sidokumpul'),
(272, 12, 'Urangagung'),
(273, 13, 'Anggaswangi'),
(274, 13, 'Bangsri'),
(275, 13, 'Cangkringsari'),
(276, 13, 'Jumputrejo'),
(277, 13, 'Kebonagung'),
(278, 13, 'Keloposepuluh'),
(279, 13, 'Jogosatru'),
(280, 13, 'Masangankulon'),
(281, 13, 'Masanganwetan'),
(282, 13, 'Ngaresrejo'),
(283, 13, 'Pademonegoro'),
(284, 13, 'Panjunan'),
(285, 13, 'Pekarungan'),
(286, 13, 'Plumbungan'),
(287, 13, 'Sambungrejo'),
(288, 13, 'Sukodono'),
(289, 13, 'Suko'),
(290, 13, 'Suruh'),
(291, 13, 'Wilayut'),
(292, 14, 'Bohar'),
(293, 14, 'Bringinbendo'),
(294, 14, 'Gilang'),
(295, 14, 'Jemundo'),
(296, 14, 'Kedungturi'),
(297, 14, 'Kragan'),
(298, 14, 'Kletek'),
(299, 14, 'Kramatjegu'),
(300, 14, 'Krembangan'),
(301, 14, 'Pertapan Maduretno'),
(302, 14, 'Sadang'),
(303, 14, 'Sambibulu'),
(304, 14, 'Sidodadi'),
(305, 14, 'Tawangsari'),
(306, 14, 'Trosobo'),
(307, 14, 'Wage'),
(308, 14, 'Bebekan'),
(309, 14, 'Geluran'),
(310, 14, 'Kalijaten'),
(311, 14, 'Ketegan'),
(312, 14, 'Ngelom'),
(313, 14, 'Sepanjang'),
(314, 14, 'Taman'),
(315, 14, 'Wonocolo'),
(316, 15, 'Kalitengah'),
(317, 15, 'Kludan'),
(318, 15, 'Boro'),
(319, 15, 'Ngaban'),
(320, 15, 'Putat'),
(321, 15, 'Kedungbanteng'),
(322, 15, 'Banjarpanji'),
(323, 15, 'Banjarsari'),
(324, 15, 'Penatarsewu'),
(325, 15, 'Sentul'),
(326, 15, 'Kalidawir'),
(327, 15, 'Gempolsari'),
(328, 15, 'Kedungbendo'),
(329, 15, 'Ketapang'),
(330, 15, 'Kalisempurno'),
(331, 15, 'Kedensari'),
(332, 15, 'Ketegan'),
(333, 15, 'Ganggang Panjang'),
(334, 15, 'Randegan'),
(335, 16, 'Banjarwungu'),
(336, 16, 'Balongmacekan'),
(337, 16, 'Gampingrowo'),
(338, 16, 'Gedangklutuk'),
(339, 16, 'Janti'),
(340, 16, 'Kalimati'),
(341, 16, 'Kedungbocok'),
(342, 16, 'Kedinding'),
(343, 16, 'Kemuning'),
(344, 16, 'Kendalsewu'),
(345, 16, 'Klantingsari'),
(346, 16, 'Kramattemanggung'),
(347, 16, 'Mergobener'),
(348, 16, 'Mergosari'),
(349, 16, 'Mindugading'),
(350, 16, 'Miriprowo'),
(351, 16, 'Sebani'),
(352, 16, 'Segodobancang'),
(353, 16, 'Singgogalih'),
(354, 16, 'Tarik'),
(355, 17, 'Gelang'),
(356, 17, 'Grabangan'),
(357, 17, 'Grinting'),
(358, 17, 'Grogol'),
(359, 17, 'Janti'),
(360, 17, 'Jiken'),
(361, 17, 'Kajeksan'),
(362, 17, 'Kebaran'),
(363, 17, 'Kedondong'),
(364, 17, 'Kemantren'),
(365, 17, 'Kenongo'),
(366, 17, 'Kepatihan'),
(367, 17, 'Kepadangan'),
(368, 17, 'Kepuhkemiri'),
(369, 17, 'Kepunten'),
(370, 17, 'Medalem'),
(371, 17, 'Modong'),
(372, 17, 'Pangkemiri'),
(373, 17, 'Singopadu'),
(374, 17, 'Sudimoro'),
(375, 17, 'Tlasih'),
(376, 17, 'Tulangan'),
(377, 18, 'Berbek'),
(378, 18, 'Bungurasih'),
(379, 18, 'Janti'),
(380, 18, 'Kedungrejo'),
(381, 18, 'Kepuhkiriman'),
(382, 18, 'Kureksari'),
(383, 18, 'Medaeng'),
(384, 18, 'Ngingas'),
(385, 18, 'Pepelegi'),
(386, 18, 'Tambakoso'),
(387, 18, 'Tambarejo'),
(388, 18, 'Tambaksawah'),
(389, 18, 'Tambaksumur'),
(390, 18, 'Tropodo'),
(391, 18, 'Wadungasri'),
(392, 18, 'Waru'),
(393, 18, 'Wedoro'),
(394, 19, 'Becirongengor'),
(395, 19, 'Candinegoro'),
(396, 19, 'Jimbarankulon'),
(397, 19, 'Jimbaranwetan'),
(398, 19, 'Karangpuri'),
(399, 19, 'Ketimang'),
(400, 19, 'Lambangan'),
(401, 19, 'Mojorangagung'),
(402, 19, 'Mulyodadi'),
(403, 19, 'Pagerngumbuk'),
(404, 19, 'Pilang'),
(405, 19, 'Plaosan'),
(406, 19, 'Ploso'),
(407, 19, 'Popoh'),
(408, 19, 'Sawocangkring'),
(409, 19, 'Semambung'),
(410, 19, 'Simoanginangin'),
(411, 19, 'Simoketawang'),
(412, 19, 'Sumberejo'),
(413, 19, 'Tanggul'),
(414, 19, 'Wonoayu'),
(415, 19, 'Wonokalang'),
(416, 19, 'Wonokasihan');

-- --------------------------------------------------------

--
-- Table structure for table `kesehatan`
--

CREATE TABLE `kesehatan` (
  `id_kesehatan` int(11) NOT NULL,
  `id_kecamatan` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `kepemilikan` enum('Pemerintah','Swasta') NOT NULL,
  `kategori` enum('PKM UTAMA','PKM PEMBANTU','RSU') NOT NULL,
  `no_telepon` varchar(13) NOT NULL,
  `fax` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `website` varchar(200) NOT NULL,
  `penanggung_jawab` varchar(50) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `lat` varchar(100) NOT NULL,
  `long` varchar(100) NOT NULL,
  `link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kesehatan`
--

INSERT INTO `kesehatan` (`id_kesehatan`, `id_kecamatan`, `nama`, `alamat`, `kepemilikan`, `kategori`, `no_telepon`, `fax`, `email`, `website`, `penanggung_jawab`, `foto`, `lat`, `long`, `link`) VALUES
(2, 5, 'Puskesmas Sidoarjo', 'Jl. Dr. Soetomo No.14, Magersari, Kec. Sidoarjo, Kabupaten Sidoarjo\r\nSidoarjo, Jawa Timur, Indonesia', 'Pemerintah', 'PKM PEMBANTU', '(031) 8921956', '(031) 8921956', ' puskesmassidoarjo@sidoarjokab.go.id', 'puskesmassidoarjo.sidoarjokab.go.id/?page=informasi&p=1#', 'Dinas kesehatan', 'kesehatan.jpg', '-7.457245528549237', '112.71564229551771', ''),
(7, 2, 'Puskesmas Buduran', 'Jl. Jawa No.2, Prasung, Buduran, Kabupaten Sidoarjo\r\nSidoarjo, Jawa Timur, Indonesia 61252', 'Pemerintah', 'PKM UTAMA', '(031) 8967494', '(031) 8967494', 'puskesmasbuduran@gmail.com', 'www.instagram.com/puskesmas_buduran/?hl=id\r\n', 'Pihak Rumah sakit Buduran', 'kesehatan.jpg', '-7.457245528549237', '112.71564229551771', ''),
(8, 12, 'RSUD Sidoarjo', 'Jl. Mojopahit No.667, Kabupaten Sidoarjo', 'Pemerintah', 'RSU', '08349759484', '23', 'rsudsda@yahoo.co.id', 'rsd.sidoarjokab.go.id/#', 'Dinas Kesehatan', 'kesehatan.jpg', '-7.457245528549237', '112.71564229551771', '');

-- --------------------------------------------------------

--
-- Table structure for table `komunitas`
--

CREATE TABLE `komunitas` (
  `id_komunitas` int(11) NOT NULL,
  `nama_komunitas` varchar(150) NOT NULL,
  `ketua` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `sosialmedia` varchar(30) NOT NULL,
  `foto1` varchar(50) NOT NULL,
  `foto2` varchar(50) NOT NULL,
  `foto_profil` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `komunitas`
--

INSERT INTO `komunitas` (`id_komunitas`, `nama_komunitas`, `ketua`, `alamat`, `deskripsi`, `no_tlp`, `sosialmedia`, `foto1`, `foto2`, `foto_profil`) VALUES
(2, 'Komunitas Tari', 'Sandika Galig', 'Wonoayu sidoarjo', 'Komunitas Tari Tradisional ', '083682726475', 'Komunitas Tari', 'sekolah.jpg', 'admin.png', 'sekolah.jpg'),
(3, 'Komunitas Memancing', 'nafis Hidayatulloh', 'jl. Kayun Wono0ayu', 'Komunitas Mancing Air tawar', '082638408437', 'Komunitas Mancing ', 'sekolah.jpg', 'sekolah.jpg', 'admin.png');

-- --------------------------------------------------------

--
-- Table structure for table `layanan_publik`
--

CREATE TABLE `layanan_publik` (
  `id_layanan` int(11) NOT NULL,
  `id_kategorilayanan` int(11) NOT NULL,
  `nama` varchar(150) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `layanan_publik`
--

INSERT INTO `layanan_publik` (`id_layanan`, `id_kategorilayanan`, `nama`, `deskripsi`) VALUES
(13, 4, 'Pelayanan KTP', 'Syarat dan ketentuan Berlaku'),
(14, 4, 'KTP Baru', 'Minimal Berusia 17 Tahun '),
(15, 2, 'SIM Hilang', 'Membawa surat Keterangan kehilangan dari Kantor Polisi'),
(16, 5, 'Penambahan Jumlah Anggota keluarga', 'Harap membawa Akte lagir dari Anggota keluarga baru');

-- --------------------------------------------------------

--
-- Table structure for table `lowongan`
--

CREATE TABLE `lowongan` (
  `id_lowongan` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  `judul_lowongan` varchar(100) NOT NULL,
  `deskripsi_pekerjaan` text NOT NULL,
  `foto_lowongan` varchar(50) NOT NULL,
  `file` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `lowongan`
--

INSERT INTO `lowongan` (`id_lowongan`, `id`, `judul_lowongan`, `deskripsi_pekerjaan`, `foto_lowongan`, `file`) VALUES
(6, 4, 'Penerimaan Perawat', 'Perawat dengan lulusan Akademi kebidanan', 'lowongan.jpeg', 'lowongan.jpeg'),
(7, 2, 'Supir Truk', 'Dibutuhkan supir truk berpengalaman', 'kesehatan.jpg', 'lowongan.jpeg'),
(8, 3, 'Kepala Gudang', 'Lowongan kepala Gudang 5 orang', 'kesehatan.jpg', 'lowongan.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `menu_kuliner`
--

CREATE TABLE `menu_kuliner` (
  `id_kuliner` int(11) NOT NULL,
  `id_wisata` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `menu_kuliner`
--

INSERT INTO `menu_kuliner` (`id_kuliner`, `id_wisata`, `nama`, `harga`) VALUES
(1, 5, 'Nasi Pecel', 10000);

-- --------------------------------------------------------

--
-- Table structure for table `panik_button`
--

CREATE TABLE `panik_button` (
  `id_laporan` int(11) NOT NULL,
  `NIK` varchar(12) NOT NULL,
  `kategori` enum('Kriminal','Kecelakaan','Bencana') NOT NULL,
  `lat` varchar(100) NOT NULL,
  `long` varchar(100) NOT NULL,
  `waktu_kejadian` datetime NOT NULL,
  `bukti_kejadian` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `petugas` enum('Kantor Polisi','Rumah Sakit','BPBD') NOT NULL,
  `status` enum('Menunggu Konfirmasi','Proses','Selesai','Tolak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `panik_button`
--

INSERT INTO `panik_button` (`id_laporan`, `NIK`, `kategori`, `lat`, `long`, `waktu_kejadian`, `bukti_kejadian`, `deskripsi`, `petugas`, `status`) VALUES
(11, '351092890358', 'Kriminal', '-378958413', '-378958413', '2022-01-05 22:00:00', 'hendra.jpeg', 'Pencurian Motor', 'Kantor Polisi', 'Selesai'),
(12, '354898237819', 'Kecelakaan', '-478224646', '-378958413', '2022-01-05 00:20:21', 'sekolah.jpg', 'Tabrakan Mobil', 'Rumah Sakit', 'Proses'),
(13, '356798298401', 'Bencana', '-3674554', '-378958413', '2022-01-05 00:20:21', 'admin.png', 'Banjir ', 'BPBD', 'Selesai'),
(14, '928778638492', 'Kriminal', '-648754', '-378958413', '2022-01-05 00:20:21', 'perusahaan.jpg', 'pembegalan', 'Kantor Polisi', 'Proses'),
(15, '351092890358', 'Kriminal', '-378958413', '-378958413', '2022-01-05 22:00:00', 'hendra.jpeg', 'Pencurian Motor', 'Rumah Sakit', 'Proses'),
(16, '928778638492', 'Kriminal', '-648754', '-378958413', '2022-01-05 00:20:21', 'perusahaan.jpg', 'pembegalan', 'BPBD', 'Proses'),
(17, '351092890358', 'Kriminal', '-378958413', '-378958413', '2022-01-05 22:00:00', 'hendra.jpeg', 'Pencurian Motor', 'Rumah Sakit', 'Menunggu Konfirmasi'),
(19, '928778638492', 'Kriminal', '-648754', '-378958413', '2022-01-05 00:20:21', 'perusahaan.jpg', 'pembegalan', 'Rumah Sakit', 'Proses');

-- --------------------------------------------------------

--
-- Table structure for table `pariwisata`
--

CREATE TABLE `pariwisata` (
  `id_wisata` int(11) NOT NULL,
  `id_kategori_wisata` int(11) NOT NULL,
  `nama_wisata` varchar(150) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `pengelola` varchar(100) NOT NULL,
  `no_telepon` varchar(13) NOT NULL,
  `jam_buka` time NOT NULL,
  `jam_tutup` time NOT NULL,
  `foto1` varchar(50) NOT NULL,
  `foto2` varchar(50) NOT NULL,
  `foto3` varchar(50) NOT NULL,
  `lat` varchar(50) NOT NULL,
  `long` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pariwisata`
--

INSERT INTO `pariwisata` (`id_wisata`, `id_kategori_wisata`, `nama_wisata`, `alamat`, `pengelola`, `no_telepon`, `jam_buka`, `jam_tutup`, `foto1`, `foto2`, `foto3`, `lat`, `long`) VALUES
(5, 1, 'Pemancingan Air laut', 'Sidoarjo Kota', 'Dinas Pariwisata', '0895359914312', '07:00:00', '18:00:00', 'pariwisata.jpg', 'pariwisata.jpg', 'pariwisata.jpg', '-7.264987264004733', '112.73866182887794'),
(6, 1, 'Pemancingan Tegal', 'Sidoarjo', 'Dinas Pariwisata', '0895359914312', '08:00:00', '15:00:00', 'pariwisata.jpg', 'pariwisata.jpg', 'pariwisata.jpg', '-7.264987264004733', '112.73866182887794'),
(7, 2, 'Museum', 'Sidoarop Wonoayu', 'Swasta', '083487363828', '00:00:00', '00:00:00', 'pariwisata.jpg', 'pariwisata.jpg', 'pariwisata.jpg', '-7.264987264004733', '112.73866182887794'),
(8, 1, 'Pemancingan WonoAyu', 'Sidoarjo', 'Dinas Pariwisata', '0895359914312', '08:00:00', '22:00:00', 'pariwisata.jpg', 'pariwisata.jpg', 'pariwisata.jpg', '-7.264987264004733', '112.73866182887794'),
(9, 3, 'Rawon Gajah Mada', 'Jl. Gajahmada', 'P. GajahMada', '08123456789', '08:00:00', '19:00:00', 'pariwisata.jpg', 'pariwisata.jpg', 'pariwisata.jpg', '-7.462825195497774', '112.745239038624');

-- --------------------------------------------------------

--
-- Table structure for table `pengaduan_umum`
--

CREATE TABLE `pengaduan_umum` (
  `id_pengaduan` int(11) NOT NULL,
  `NIK` varchar(12) NOT NULL,
  `kategori` enum('Pelayanan','Fasilitas Publik','Kesehatan') NOT NULL,
  `lokasi_kejadian` varchar(100) NOT NULL,
  `waktu_kejadian` datetime NOT NULL,
  `deskripsi` varchar(500) NOT NULL,
  `gambar` varchar(50) NOT NULL,
  `status_pengaduan` enum('Menunggu','Sedang Diproses','Selesai','Ditolak') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pengaduan_umum`
--

INSERT INTO `pengaduan_umum` (`id_pengaduan`, `NIK`, `kategori`, `lokasi_kejadian`, `waktu_kejadian`, `deskripsi`, `gambar`, `status_pengaduan`) VALUES
(5, '351092890358', 'Pelayanan', 'Capil Sidoarjo', '2022-01-05 02:00:00', 'terdapat pungli saat pembuatan berkas', '', 'Menunggu'),
(6, '354898237819', 'Fasilitas Publik', 'Alun-alun', '2021-10-19 05:00:00', 'fasilitas umum rusak', 'hendra.jpeg', 'Sedang Diproses'),
(7, '356798298401', 'Kesehatan', 'Puskesmas Wonoayu', '2021-10-20 08:00:00', 'Kekurangan Alat medis', 'kesehatan.jpg', 'Selesai'),
(8, '928778638492', 'Pelayanan', 'Capil Sidoarjo', '2021-12-30 12:00:00', 'Berkas yang saya urus ama selesai', 'gg.jpeg', 'Ditolak');

-- --------------------------------------------------------

--
-- Table structure for table `perusahaan`
--

CREATE TABLE `perusahaan` (
  `id` int(11) NOT NULL,
  `nama_perusahaan` varchar(100) NOT NULL,
  `kepemilikan` enum('Pemerintah','Swasta') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `email` varchar(50) NOT NULL,
  `lat` varchar(50) NOT NULL,
  `long` varchar(50) NOT NULL,
  `website` varchar(100) NOT NULL,
  `penanggung_jawab` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `perusahaan`
--

INSERT INTO `perusahaan` (`id`, `nama_perusahaan`, `kepemilikan`, `alamat`, `no_tlp`, `email`, `lat`, `long`, `website`, `penanggung_jawab`, `deskripsi`, `foto`) VALUES
(2, 'PT. Orang Tua', 'Swasta', 'Bangsal sari', '082378749383', 'orangtua@gmail.com', '-7.462825195497774', '112.745239038624', 'sidoarjokab.go.id', 'Harisman', 'Perusahaan berherak pada bidang Makanan', 'perusahaan.jpg'),
(3, 'PT. Tambang Prifot', 'Swasta', 'jl. Bunga Mawar Sidoarjo', '081273849594', 'tambang34@gmail.com', '-7.462825195497774', '112.745239038624', 'sidoarjokab.go.id', 'Dika Pratama', 'Perusahaan Tambang', 'perusahaan.jpg'),
(4, 'RS Siloam', 'Pemerintah', 'jl. Baturaden 4,no.10 ', '081273847212', 'siloam28@gmail.com', '-7.462825195497774', '112.745239038624', 'sidoarjokab.go.id', 'Nafis Hidayatulloh', 'Perusahaan kesehatan', 'perusahaan.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `rule_admin`
--

CREATE TABLE `rule_admin` (
  `id_role` int(11) NOT NULL,
  `nama_role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rule_admin`
--

INSERT INTO `rule_admin` (`id_role`, `nama_role`) VALUES
(1, 'Super Admin'),
(2, 'Admin Dishub'),
(3, 'Admin UMKM'),
(4, 'Admin Loker'),
(5, 'Admin Pendidikan'),
(6, 'Admin Kesehatan'),
(7, 'Admin Pariwisata'),
(8, 'Admin Polisi'),
(9, 'Admin BPDB');

-- --------------------------------------------------------

--
-- Table structure for table `sekolah`
--

CREATE TABLE `sekolah` (
  `id_sekolah` int(11) NOT NULL,
  `id_kelurahan` int(11) NOT NULL,
  `nama_sekolah` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `akreditasi` enum('A','B','C','Belum Memiliki Akreditasi') NOT NULL,
  `NPSN` varchar(50) NOT NULL,
  `no_telepon` varchar(13) NOT NULL,
  `jenjang` enum('SD','SLB','SMP') NOT NULL,
  `status` enum('Swasta','Negeri') NOT NULL,
  `foto` varchar(30) NOT NULL,
  `lat` varchar(50) NOT NULL,
  `long` varchar(50) NOT NULL,
  `website` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sekolah`
--

INSERT INTO `sekolah` (`id_sekolah`, `id_kelurahan`, `nama_sekolah`, `alamat`, `akreditasi`, `NPSN`, `no_telepon`, `jenjang`, `status`, `foto`, `lat`, `long`, `website`, `email`) VALUES
(1, 8, 'SMP N 2 Tulung Agung', 'jl.Tulung Agung ', 'B', '868264219', '081273648484', 'SMP', 'Swasta', 'sekolah.jpg', '-7.427347204249193', '112.72134844674079', 'www.suarasurabaya.net/kelanakota/2021/sekolah-di-s', 'abror@gmail.com'),
(2, 14, 'SD S Yadika', 'jl. Kayun', 'A', '083182132', '081273648484', 'SD', 'Swasta', 'sekolah.jpg', '-7.427347204249193', '112.72134844674079', 'lala', 'abror@gmail.com'),
(4, 4, 'SLB N Wonoayu', 'Wonoayu', 'Belum Memiliki Akreditasi', '28740283', '081273648484', 'SLB', 'Negeri', 'sekolah.jpg', '-7.427347204249193', '112.72134844674079', '', 'abror@gmail.com'),
(8, 11, 'SD N118400', 'jl.Mastrip', 'B', '98391373', '081273648484', 'SD', 'Negeri', 'sekolah.jpg', '-7.427347204249193', '112.72134844674079', 'lla', 'abror@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tarif_wisata`
--

CREATE TABLE `tarif_wisata` (
  `id_tarif` int(11) NOT NULL,
  `id_wisata` int(11) NOT NULL,
  `tarif` int(11) NOT NULL,
  `nama_tiket` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tarif_wisata`
--

INSERT INTO `tarif_wisata` (`id_tarif`, `id_wisata`, `tarif`, `nama_tiket`) VALUES
(1, 5, 15000, 'Senin - Jumat'),
(3, 5, 25000, 'Sabtu - Minggu');

-- --------------------------------------------------------

--
-- Table structure for table `ulasan_umkm`
--

CREATE TABLE `ulasan_umkm` (
  `id_ulasan` int(11) NOT NULL,
  `id_umkm` int(11) NOT NULL,
  `NIK` varchar(12) NOT NULL,
  `ulasan` text NOT NULL,
  `tanggal_upload` date NOT NULL,
  `foto1` varchar(255) NOT NULL,
  `foto2` varchar(255) NOT NULL,
  `foto3` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ulasan_umkm`
--

INSERT INTO `ulasan_umkm` (`id_ulasan`, `id_umkm`, `NIK`, `ulasan`, `tanggal_upload`, `foto1`, `foto2`, `foto3`) VALUES
(63, 3, '351092890358', 'Barang bagus', '2021-12-29', 'umkm.jpg', 'umkm.jpg', 'perusahaan.jpg'),
(64, 1, '354898237819', 'Makanan nya enak dan murah', '2021-12-29', 'umkm.jpg', 'perusahaan.jpg', 'umkm.jpg'),
(65, 7, '356798298401', 'Pupuk yang ditawarkan murah', '2021-12-08', 'umkm.jpg', 'admin.png', 'umkm.jpg'),
(66, 7, '928778638492', 'pupuk nya sangat manjur,', '2021-12-14', 'perusahaan.jpg', 'umkm.jpg', 'umkm.jpg'),
(67, 7, '351092890358', 'ada bonus antar barang, saya suka', '2021-12-22', 'sekolah.jpg', 'umkm.jpg', 'perusahaan.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `ulasan_wisata`
--

CREATE TABLE `ulasan_wisata` (
  `id_ulasan` int(11) NOT NULL,
  `id_wisata` int(11) NOT NULL,
  `NIK` varchar(12) NOT NULL,
  `ulasan` text NOT NULL,
  `tanggal_upload` date NOT NULL,
  `foto1` varchar(255) NOT NULL,
  `foto2` varchar(255) NOT NULL,
  `foto3` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ulasan_wisata`
--

INSERT INTO `ulasan_wisata` (`id_ulasan`, `id_wisata`, `NIK`, `ulasan`, `tanggal_upload`, `foto1`, `foto2`, `foto3`) VALUES
(28, 7, '351092890358', 'Museum Nya Bagus dan terawat', '2021-12-22', 'hendra.jpeg', 'admin.png', 'umkm.jpg'),
(29, 5, '354898237819', 'Ika nya gede gede, bagus', '2021-12-29', 'pariwisata.jpg', 'pariwisata.jpg', 'hendra.jpeg'),
(30, 8, '356798298401', 'Kolam nya tidak terawat', '2021-12-08', 'pariwisata.jpg', 'pariwisata.jpg', 'umkm.jpg'),
(31, 7, '928778638492', 'Museum nya sangat lengkap, saya suka saya suka ', '2021-12-17', 'pariwisata.jpg', 'perusahaan.jpg', 'umkm.jpg'),
(32, 6, '350919271000', 'jhaa', '2021-12-31', '20d99aa1576e47698d78f0b0d3db0400.jpeg', 'pariwisata.jpg', 'umkm.jpg'),
(33, 9, '350919271000', 'enak banget', '2021-12-31', 'pariwisata.jpg', 'pariwisata.jpg', 'perusahaan.jpg'),
(34, 5, '', 'y', '2022-01-04', '', '', ''),
(35, 7, '', 'p', '2022-01-04', '', '', ''),
(36, 9, '', 'p', '2022-01-04', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `umkm`
--

CREATE TABLE `umkm` (
  `id_umkm` int(11) NOT NULL,
  `kategori` enum('Kerajinan','Makanan','Pertanian') NOT NULL,
  `nama` varchar(100) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `penanggung_jawab` varchar(50) NOT NULL,
  `foto1` varchar(50) NOT NULL,
  `foto2` varchar(50) NOT NULL,
  `foto3` varchar(50) NOT NULL,
  `deskripsi` text NOT NULL,
  `lat` varchar(100) NOT NULL,
  `long` varchar(100) NOT NULL,
  `no_telp` varchar(13) NOT NULL,
  `website` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `umkm`
--

INSERT INTO `umkm` (`id_umkm`, `kategori`, `nama`, `alamat`, `penanggung_jawab`, `foto1`, `foto2`, `foto3`, `deskripsi`, `lat`, `long`, `no_telp`, `website`, `email`) VALUES
(1, 'Makanan', 'Usus Krispy', 'Alun Alun Sidoarjo', 'Harisman Sihombing', 'perusahaan.jpg', 'perusahaan.jpg', 'perusahaan.jpg', 'UMKM Menjual aneka usu ayam ', '-7.458097681002431', '112.71400925052222', '081276383838', 'www.sidoarjokab.go.id', 'haris@gmail.com'),
(3, 'Kerajinan', 'Toko Kerajina Bunga', 'Sidoarjo Kota', 'Ajeng', 'perusahaan.jpg', 'perusahaan.jpg', 'hendra.jpeg', 'Kerajinan Plasyil', '-7.458097681002431', '112.71400925052222', '08287482478', 'sidoarjokab.go.id', 'haris@gmail.com'),
(5, 'Makanan', 'Dika Kue', 'Sidoarjo Kota', 'Puput', 'perusahaan.jpg', 'hendra.jpeg', 'perusahaan.jpg', 'Pembuatan kue donat spesial ', '-7.458097681002431', '112.71400925052222', '0813187274287', 'sidoarjokab.go.id', 'haris@gmail.com'),
(6, 'Makanan', 'Bakso Wonogiri', 'Sidoarjo', 'Koko', 'perusahaan.jpg', 'hendra.jpeg', 'perusahaan.jpg', 'Bakso Wonogiri ddengan resep dari 1945', '-7.458097681002431', '112.71400925052222', '0823864826428', 'sidoarjokab.go.id', 'haris@gmail.com'),
(7, 'Pertanian', 'PT. Usaha Tani', 'Sioarjo', 'nafis', 'perusahaan.jpg', 'perusahaan.jpg', 'hendra.jpeg', 'Menjual Perlengkapan pertanian ', '-7.458097681002431', '112.71400925052222', '082387483708', '', 'haris@gmail.com'),
(8, 'Kerajinan', 'Kerajinan Tangan', 'Mojokerto', 'Abror Hanafi', 'perusahaan.jpg', 'hendra.jpeg', 'perusahaan.jpg', 'Menjual Kerajinan Tangan', '-7.458097681002431', '112.71400925052222', '0895359914312', '', 'haris@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `user_admin`
--

CREATE TABLE `user_admin` (
  `id_admin` int(11) NOT NULL,
  `nip` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `id_role` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `no_tlp` varchar(13) NOT NULL,
  `email` varchar(30) NOT NULL,
  `foto` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_admin`
--

INSERT INTO `user_admin` (`id_admin`, `nip`, `username`, `id_role`, `nama`, `alamat`, `no_tlp`, `email`, `foto`, `password`) VALUES
(1, 12121212, 'admin', 1, 'Harisman Sihombing', 'Bukit Tujuh', '081216249196', 'e41181135@student.polije.ac.id', 'hendra.jpeg', '202cb962ac59075b964b07152d234b70'),
(2, 2147483647, 'dishub', 2, 'NAFIS', 'medan', '082274839292', 'harismansihombing28@gmal.com', '5.png', '202cb962ac59075b964b07152d234b70'),
(3, 2147483647, 'umkm', 3, 'Dika Pratama', 'MEDAN', '082274933040', 'nafislestamanta@gmail.com', '3.png', '202cb962ac59075b964b07152d234b70'),
(4, 2147483647, 'loker', 4, 'M Abror', 'jl.Kayun 4 No.10 Jember', '081274838475', 'harisman@gmail.com', 'pas.jpg', '202cb962ac59075b964b07152d234b70'),
(5, 2147483647, 'pendidikan', 5, 'Ajeng', 'jl.Mastrip 4 No.10 Jember', '0812738473626', 'sihombingharisman28@gmail.com', 'hendra.jpeg', '202cb962ac59075b964b07152d234b70'),
(6, 192497248, 'kesehatan', 6, 'bayu Alfiky', 'MEDAN', '081287648999', 'e41181135@student.polije.ac.id', 'pas.jpg', '202cb962ac59075b964b07152d234b70'),
(7, 2147483647, 'pariwisata', 7, 'Dika Pratama', 'jl.Mastrip 6 No.10 Jember', '0812374838373', 'e41181135@student.polije.ac.id', 'hendra.jpeg', '202cb962ac59075b964b07152d234b70'),
(8, 2147483647, 'polisi', 8, 'Harisman Sihombing', 'MEDAN', '082283748372', 'harismansihombing28@gmal.com', 'hendra.jpeg', '202cb962ac59075b964b07152d234b70'),
(9, 2147483647, 'bpbd', 9, 'Tika', 'MEDAN', '082386577963', 'haris@gamil.com', 'hendra.jpeg', '202cb962ac59075b964b07152d234b70');

-- --------------------------------------------------------

--
-- Table structure for table `user_mobile`
--

CREATE TABLE `user_mobile` (
  `NIK` varchar(16) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` enum('Laki-Laki','Perempuan') NOT NULL,
  `no_telepon` varchar(13) NOT NULL,
  `password` varchar(50) NOT NULL,
  `foto_ktp` varchar(30) NOT NULL,
  `foto_profil` varchar(255) NOT NULL,
  `selfie_ktp` varchar(30) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_mobile`
--

INSERT INTO `user_mobile` (`NIK`, `nama`, `alamat`, `email`, `tanggal_lahir`, `jenis_kelamin`, `no_telepon`, `password`, `foto_ktp`, `foto_profil`, `selfie_ktp`, `status`) VALUES
('3333333333333333', 'l', 'l', 'l', '1999-10-27', 'Laki-Laki', '09', '827ccb0eea8a706c4c34a16891f84e7b', '', '', '', 0),
('351092890358', 'Haris bayu', 'jl. Ahmad yani Pesanggaran Ban', 'wahyudi@sidoarjokab.go.id', '2091-06-18', 'Laki-Laki', '082274933040', '202cb962ac59075b964b07152d234b70', 'admin.png', 'admin.png', '', 1),
('354898237819', 'Hendra basirun', 'Jl.Mastrip 4 no.39', 'hendra@gmail.com', '2098-03-17', 'Laki-Laki', '082487492739', '202cb962ac59075b964b07152d234b70', '', 'hendra.jpeg', '', 1),
('356798298401', 'Ayu P.ratiwi', 'jl.kembang no.45', 'ayu@gmail.com', '2001-12-22', 'Perempuan', '082487402838', '202cb962ac59075b964b07152d234b70', '', 'Admin.png', '', 1),
('928778638492', 'Desi Sulastri', 'jl.Pancing No 12 Medan. Sumate', 'desi@gmail.com', '2021-07-14', 'Perempuan', '081290345987', '202cb962ac59075b964b07152d234b70', '', 'hendra.jpeg', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_token`
--

CREATE TABLE `user_token` (
  `id` int(11) NOT NULL,
  `email` varchar(128) NOT NULL,
  `token` varchar(128) NOT NULL,
  `date_create` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_token`
--

INSERT INTO `user_token` (`id`, `email`, `token`, `date_create`) VALUES
(1, 'e41181135@student.polije.ac.id', 'dOrkmVvJ31pQnFqeKxn9SkAaG59Ou20nGdZt8AvS1a4=', 1640827596),
(2, 'nafislestamanta@gmail.com', 'WStIg9dt/O33W/kEZmDtrlUawXV8VO2Z5KC4vVOQC6A=', 1640917820),
(3, 'e41181135@student.polije.ac.id', 'e6OP24SK5fNNJnXb1uXhOwT/oZ0Yxg3zyM6rZuWQirI=', 1640919293),
(4, 'nafislestamanta@gmail.com', 'Jnp9Gc5MG4f1ZdfU5t6/Q0XAoa7+UXLWlS47obLQmIE=', 1641178112);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `berita_informasi`
--
ALTER TABLE `berita_informasi`
  ADD PRIMARY KEY (`kode`);

--
-- Indexes for table `bpbd`
--
ALTER TABLE `bpbd`
  ADD PRIMARY KEY (`id_bpbd`),
  ADD KEY `id_kecamatan` (`id_kecamatan`);

--
-- Indexes for table `cctv`
--
ALTER TABLE `cctv`
  ADD PRIMARY KEY (`id_cctv`);

--
-- Indexes for table `ekskul_sekolah`
--
ALTER TABLE `ekskul_sekolah`
  ADD PRIMARY KEY (`id_ekskul`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id_event`);

--
-- Indexes for table `event_komunitas`
--
ALTER TABLE `event_komunitas`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `id_kumunitas` (`id_komunitas`);

--
-- Indexes for table `fasilitas_sekolah`
--
ALTER TABLE `fasilitas_sekolah`
  ADD PRIMARY KEY (`id_fasilitas`);

--
-- Indexes for table `kantor_polisi`
--
ALTER TABLE `kantor_polisi`
  ADD PRIMARY KEY (`id_kantor_polisi`),
  ADD KEY `id_kecamatan` (`id_kecamatan`);

--
-- Indexes for table `kategori_layanan`
--
ALTER TABLE `kategori_layanan`
  ADD PRIMARY KEY (`id_kategorilayanan`);

--
-- Indexes for table `kategori_wisata`
--
ALTER TABLE `kategori_wisata`
  ADD PRIMARY KEY (`id_kategori_wisata`);

--
-- Indexes for table `kecamatan`
--
ALTER TABLE `kecamatan`
  ADD PRIMARY KEY (`id_kecamatan`);

--
-- Indexes for table `kelurahan`
--
ALTER TABLE `kelurahan`
  ADD PRIMARY KEY (`id_kelurahan`),
  ADD KEY `id_kecamatan` (`id_kecamatan`);

--
-- Indexes for table `kesehatan`
--
ALTER TABLE `kesehatan`
  ADD PRIMARY KEY (`id_kesehatan`),
  ADD KEY `id_kecamatan` (`id_kecamatan`);

--
-- Indexes for table `komunitas`
--
ALTER TABLE `komunitas`
  ADD PRIMARY KEY (`id_komunitas`);

--
-- Indexes for table `layanan_publik`
--
ALTER TABLE `layanan_publik`
  ADD PRIMARY KEY (`id_layanan`),
  ADD KEY `id_kategorilayanan` (`id_kategorilayanan`);

--
-- Indexes for table `lowongan`
--
ALTER TABLE `lowongan`
  ADD PRIMARY KEY (`id_lowongan`),
  ADD KEY `lowongan_ibfk_1` (`id`);

--
-- Indexes for table `menu_kuliner`
--
ALTER TABLE `menu_kuliner`
  ADD PRIMARY KEY (`id_kuliner`);

--
-- Indexes for table `panik_button`
--
ALTER TABLE `panik_button`
  ADD PRIMARY KEY (`id_laporan`),
  ADD KEY `NIK` (`NIK`);

--
-- Indexes for table `pariwisata`
--
ALTER TABLE `pariwisata`
  ADD PRIMARY KEY (`id_wisata`),
  ADD KEY `id_kategori_wisata` (`id_kategori_wisata`);

--
-- Indexes for table `pengaduan_umum`
--
ALTER TABLE `pengaduan_umum`
  ADD PRIMARY KEY (`id_pengaduan`),
  ADD KEY `NIK` (`NIK`);

--
-- Indexes for table `perusahaan`
--
ALTER TABLE `perusahaan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rule_admin`
--
ALTER TABLE `rule_admin`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `sekolah`
--
ALTER TABLE `sekolah`
  ADD PRIMARY KEY (`id_sekolah`),
  ADD KEY `kelurahan` (`id_kelurahan`);

--
-- Indexes for table `tarif_wisata`
--
ALTER TABLE `tarif_wisata`
  ADD PRIMARY KEY (`id_tarif`),
  ADD KEY `id_wisata` (`id_wisata`);

--
-- Indexes for table `ulasan_umkm`
--
ALTER TABLE `ulasan_umkm`
  ADD PRIMARY KEY (`id_ulasan`),
  ADD KEY `id_wisata` (`id_umkm`),
  ADD KEY `NIK` (`NIK`);

--
-- Indexes for table `ulasan_wisata`
--
ALTER TABLE `ulasan_wisata`
  ADD PRIMARY KEY (`id_ulasan`),
  ADD KEY `id_wisata` (`id_wisata`),
  ADD KEY `NIK` (`NIK`);

--
-- Indexes for table `umkm`
--
ALTER TABLE `umkm`
  ADD PRIMARY KEY (`id_umkm`);

--
-- Indexes for table `user_admin`
--
ALTER TABLE `user_admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD KEY `id_role` (`id_role`);

--
-- Indexes for table `user_mobile`
--
ALTER TABLE `user_mobile`
  ADD PRIMARY KEY (`NIK`);

--
-- Indexes for table `user_token`
--
ALTER TABLE `user_token`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `berita_informasi`
--
ALTER TABLE `berita_informasi`
  MODIFY `kode` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bpbd`
--
ALTER TABLE `bpbd`
  MODIFY `id_bpbd` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `cctv`
--
ALTER TABLE `cctv`
  MODIFY `id_cctv` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `ekskul_sekolah`
--
ALTER TABLE `ekskul_sekolah`
  MODIFY `id_ekskul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `event_komunitas`
--
ALTER TABLE `event_komunitas`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `fasilitas_sekolah`
--
ALTER TABLE `fasilitas_sekolah`
  MODIFY `id_fasilitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kantor_polisi`
--
ALTER TABLE `kantor_polisi`
  MODIFY `id_kantor_polisi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `kategori_layanan`
--
ALTER TABLE `kategori_layanan`
  MODIFY `id_kategorilayanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kategori_wisata`
--
ALTER TABLE `kategori_wisata`
  MODIFY `id_kategori_wisata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kecamatan`
--
ALTER TABLE `kecamatan`
  MODIFY `id_kecamatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `kelurahan`
--
ALTER TABLE `kelurahan`
  MODIFY `id_kelurahan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=417;

--
-- AUTO_INCREMENT for table `kesehatan`
--
ALTER TABLE `kesehatan`
  MODIFY `id_kesehatan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `komunitas`
--
ALTER TABLE `komunitas`
  MODIFY `id_komunitas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `layanan_publik`
--
ALTER TABLE `layanan_publik`
  MODIFY `id_layanan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `lowongan`
--
ALTER TABLE `lowongan`
  MODIFY `id_lowongan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `menu_kuliner`
--
ALTER TABLE `menu_kuliner`
  MODIFY `id_kuliner` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `panik_button`
--
ALTER TABLE `panik_button`
  MODIFY `id_laporan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pariwisata`
--
ALTER TABLE `pariwisata`
  MODIFY `id_wisata` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pengaduan_umum`
--
ALTER TABLE `pengaduan_umum`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `perusahaan`
--
ALTER TABLE `perusahaan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rule_admin`
--
ALTER TABLE `rule_admin`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `sekolah`
--
ALTER TABLE `sekolah`
  MODIFY `id_sekolah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tarif_wisata`
--
ALTER TABLE `tarif_wisata`
  MODIFY `id_tarif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `ulasan_umkm`
--
ALTER TABLE `ulasan_umkm`
  MODIFY `id_ulasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `ulasan_wisata`
--
ALTER TABLE `ulasan_wisata`
  MODIFY `id_ulasan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `umkm`
--
ALTER TABLE `umkm`
  MODIFY `id_umkm` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `user_admin`
--
ALTER TABLE `user_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `user_token`
--
ALTER TABLE `user_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_komunitas`
--
ALTER TABLE `event_komunitas`
  ADD CONSTRAINT `event_komunitas_ibfk_1` FOREIGN KEY (`id_komunitas`) REFERENCES `komunitas` (`id_komunitas`);

--
-- Constraints for table `layanan_publik`
--
ALTER TABLE `layanan_publik`
  ADD CONSTRAINT `layanan_publik_ibfk_1` FOREIGN KEY (`id_kategorilayanan`) REFERENCES `kategori_layanan` (`id_kategorilayanan`);

--
-- Constraints for table `lowongan`
--
ALTER TABLE `lowongan`
  ADD CONSTRAINT `lowongan_ibfk_1` FOREIGN KEY (`id`) REFERENCES `perusahaan` (`id`);

--
-- Constraints for table `panik_button`
--
ALTER TABLE `panik_button`
  ADD CONSTRAINT `panik_button_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `user_mobile` (`NIK`);

--
-- Constraints for table `pariwisata`
--
ALTER TABLE `pariwisata`
  ADD CONSTRAINT `pariwisata_ibfk_1` FOREIGN KEY (`id_kategori_wisata`) REFERENCES `kategori_wisata` (`id_kategori_wisata`);

--
-- Constraints for table `pengaduan_umum`
--
ALTER TABLE `pengaduan_umum`
  ADD CONSTRAINT `pengaduan_umum_ibfk_1` FOREIGN KEY (`NIK`) REFERENCES `user_mobile` (`NIK`);

--
-- Constraints for table `tarif_wisata`
--
ALTER TABLE `tarif_wisata`
  ADD CONSTRAINT `tarif_wisata_ibfk_1` FOREIGN KEY (`id_wisata`) REFERENCES `pariwisata` (`id_wisata`);

--
-- Constraints for table `ulasan_umkm`
--
ALTER TABLE `ulasan_umkm`
  ADD CONSTRAINT `ulasan_umkm_ibfk_1` FOREIGN KEY (`id_umkm`) REFERENCES `umkm` (`id_umkm`),
  ADD CONSTRAINT `ulasan_umkm_ibfk_2` FOREIGN KEY (`NIK`) REFERENCES `user_mobile` (`NIK`);

--
-- Constraints for table `ulasan_wisata`
--
ALTER TABLE `ulasan_wisata`
  ADD CONSTRAINT `ulasan_wisata_ibfk_1` FOREIGN KEY (`id_wisata`) REFERENCES `pariwisata` (`id_wisata`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
