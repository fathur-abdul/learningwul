-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2023 at 02:09 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.4.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `learning`
--

-- --------------------------------------------------------

--
-- Table structure for table `analisis`
--

CREATE TABLE `analisis` (
  `id_analisis` int(100) NOT NULL,
  `id_ujian` int(100) NOT NULL,
  `id_soal` int(100) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `jawaban` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `analisis`
--

INSERT INTO `analisis` (`id_analisis`, `id_ujian`, `id_soal`, `id_siswa`, `jawaban`) VALUES
(1, 12, 107, 21, '1'),
(2, 12, 111, 21, '2'),
(3, 12, 112, 21, '2'),
(4, 12, 113, 21, '2'),
(5, 12, 114, 21, '2'),
(6, 13, 115, 22, '2'),
(7, 13, 116, 22, '2'),
(8, 13, 117, 22, '2'),
(9, 13, 118, 22, '0'),
(10, 13, 119, 22, '2'),
(11, 13, 115, 21, '2'),
(12, 13, 116, 21, '3'),
(13, 13, 117, 21, '2'),
(14, 13, 118, 21, '2'),
(15, 13, 119, 21, '2'),
(16, 14, 120, 1, '1'),
(17, 14, 121, 1, '2'),
(18, 14, 122, 1, '2'),
(19, 14, 123, 1, '2'),
(20, 14, 124, 1, '3'),
(21, 14, 120, 2, '1'),
(22, 14, 121, 2, '2'),
(23, 14, 122, 2, '2'),
(24, 14, 123, 2, '2'),
(25, 14, 124, 2, '3'),
(26, 16, 127, 5, '3');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_tugas`
--

CREATE TABLE `kelas_tugas` (
  `id_klstugas` int(11) NOT NULL,
  `id_tugas` int(11) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_tugas`
--

INSERT INTO `kelas_tugas` (`id_klstugas`, `id_tugas`, `id_kelas`, `id_jurusan`, `aktif`) VALUES
(1, 1, 13, 6, 'Y'),
(2, 3, 13, 6, 'N'),
(3, 3, 13, 6, 'Y'),
(4, 5, 13, 6, 'N'),
(5, 5, 13, 6, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_ujian`
--

CREATE TABLE `kelas_ujian` (
  `id_klsujian` int(11) NOT NULL,
  `id_ujian` int(5) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kelas_ujian`
--

INSERT INTO `kelas_ujian` (`id_klsujian`, `id_ujian`, `id_kelas`, `id_jurusan`, `aktif`) VALUES
(1, 14, 13, 6, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `kelas_ujianessay`
--

CREATE TABLE `kelas_ujianessay` (
  `id_klsessay` int(11) NOT NULL,
  `id_ujianessay` int(11) NOT NULL,
  `id_kelas` int(5) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `aktif` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(10) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `id_ujian` varchar(100) NOT NULL,
  `acak_soal` text NOT NULL,
  `jawaban` text NOT NULL,
  `sisa_waktu` time NOT NULL,
  `waktu_selesai` time NOT NULL,
  `jml_benar` int(5) NOT NULL,
  `jml_kosong` int(5) NOT NULL,
  `jml_salah` int(5) NOT NULL,
  `nilai` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `id_siswa`, `id_ujian`, `acak_soal`, `jawaban`, `sisa_waktu`, `waktu_selesai`, `jml_benar`, `jml_kosong`, `jml_salah`, `nilai`) VALUES
(1, 1, '14', '120,123,124,121,122', '1,2,3,2,2', '00:05:00', '20:05:05', 5, 0, 0, '100'),
(2, 2, '14', '122,123,124,120,121', '2,2,3,1,2', '00:05:00', '08:47:43', 5, 0, 0, '100'),
(3, 5, '16', '127', '3', '01:30:00', '17:38:26', 0, 0, 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `pesan`
--

CREATE TABLE `pesan` (
  `id_pesan` int(10) NOT NULL,
  `id_pengirim` varchar(30) NOT NULL,
  `id_penerima` varchar(30) NOT NULL,
  `tanggal` date NOT NULL,
  `isi_pesan` longtext NOT NULL,
  `sudah_dibaca` enum('belum','sudah') NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pesan`
--

INSERT INTO `pesan` (`id_pesan`, `id_pengirim`, `id_penerima`, `tanggal`, `isi_pesan`, `sudah_dibaca`, `id_kelas`, `id_jurusan`) VALUES
(1, '119200001', '199509090001', '2020-04-21', 'Pak saya sudah kerjakan tugas bapak.', 'sudah', 13, 6),
(2, '199509090001', '119200001', '2020-04-21', 'Re: <p>Ok siap</p>\r\n', 'belum', 13, 6);

-- --------------------------------------------------------

--
-- Table structure for table `soal`
--

CREATE TABLE `soal` (
  `id_soal` int(5) NOT NULL,
  `id_ujian` int(5) NOT NULL,
  `soal` text NOT NULL,
  `pilihan_1` text NOT NULL,
  `pilihan_2` text NOT NULL,
  `pilihan_3` text NOT NULL,
  `pilihan_4` text NOT NULL,
  `pilihan_5` text NOT NULL,
  `kunci` int(2) NOT NULL,
  `status` enum('Y','N') NOT NULL DEFAULT 'Y'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `soal`
--

INSERT INTO `soal` (`id_soal`, `id_ujian`, `soal`, `pilihan_1`, `pilihan_2`, `pilihan_3`, `pilihan_4`, `pilihan_5`, `kunci`, `status`) VALUES
(106, 11, '1+18', '18', '19', '20', '21', '22', 2, 'Y'),
(105, 11, '1+17', '17', '18', '19', '20', '21', 1, 'Y'),
(104, 11, '1+16', '16', '17', '18', '19', '20', 1, 'Y'),
(103, 11, '1+15', '15', '16', '17', '18', '19', 1, 'Y'),
(102, 11, '1+14', '14', '15', '16', '17', '18', 1, 'Y'),
(101, 11, '1+13', '13', '14', '15', '16', '17', 2, 'Y'),
(100, 11, '1+12', '12', '13', '14', '15', '16', 3, 'Y'),
(99, 11, '1+11', '11', '12', '13', '14', '15', 4, 'Y'),
(98, 11, '1+10', '10', '11', '12', '13', '14', 5, 'Y'),
(97, 11, '1+9', '9', '10', '11', '12', '13', 4, 'Y'),
(96, 11, '1+8', '8', '9', '10', '11', '12', 3, 'Y'),
(95, 11, '1+7', '7', '8', '9', '10', '11', 2, 'Y'),
(94, 11, '1+6', '6', '7', '8', '9', '10', 3, 'Y'),
(93, 11, '1+5', '5', '6', '7', '8', '9', 2, 'Y'),
(92, 11, '1+4', '4', '5', '6', '7', '8', 2, 'Y'),
(91, 11, '1+3', '3', '4', '5', '6', '7', 2, 'Y'),
(90, 11, '1+2', '2', '3', '4', '5', '6', 3, 'Y'),
(89, 11, '1+1', '1', '2', '3', '4', '5', 2, 'Y'),
(107, 12, '<p>Pertanyaan 1?</p>\r\n', 'A', 'B', 'C', 'D', 'E', 1, 'Y'),
(113, 12, '1+3', '3', '4', '5', '6', '7', 2, 'Y'),
(112, 12, '1+2', '2', '3', '4', '5', '6', 3, 'Y'),
(111, 12, '1+1', '1', '2', '3', '4', '5', 2, 'Y'),
(114, 12, '1+4', '4', '5', '6', '7', '8', 2, 'Y'),
(115, 13, '1+1', '1', '2', '3', '4', '5', 2, 'Y'),
(116, 13, '1+2', '2', '3', '4', '5', '6', 3, 'Y'),
(117, 13, '1+3', '3', '4', '5', '6', '7', 2, 'Y'),
(118, 13, '1+4', '4', '5', '6', '7', '8', 2, 'Y'),
(119, 13, '1+5', '5', '6', '7', '9', '8', 2, 'Y'),
(120, 14, '<p>Soal nomor satu?</p>\r\n', 'A benar', 'B', 'C', 'D', 'E', 1, 'Y'),
(121, 14, '1+1', '1', '2', '3', '4', '5', 2, 'Y'),
(122, 14, '1+2', '2', '3', '4', '5', '6', 2, 'Y'),
(123, 14, '1+3', '3', '4', '5', '6', '7', 2, 'Y'),
(124, 14, '1+4', '4', '6', '5', '7', '8', 3, 'Y'),
(125, 15, '<p>test</p>\r\n', 'tes', 'te', 't', 't', 't', 3, 'Y'),
(126, 15, '<p>dasdad</p>\r\n', 'asddsadas', '2', '4', '5', '6', 5, 'Y'),
(127, 16, '<p>sdad</p>\r\n', 'd', 'd', 'd', 'd', 'd', 4, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
--

CREATE TABLE `tb_admin` (
  `id_admin` int(11) NOT NULL,
  `nama_lengkap` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `aktif` varchar(5) NOT NULL,
  `foto` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`id_admin`, `nama_lengkap`, `username`, `password`, `aktif`, `foto`) VALUES
(1, 'Admin', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 'Y', 'support.png');

-- --------------------------------------------------------

--
-- Table structure for table `tb_guru`
--

CREATE TABLE `tb_guru` (
  `id_guru` int(11) NOT NULL,
  `nik` varchar(20) NOT NULL,
  `nama_guru` varchar(120) NOT NULL,
  `email` varchar(65) NOT NULL,
  `password` varchar(255) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status` varchar(5) NOT NULL,
  `date_created` date NOT NULL,
  `confirm` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_guru`
--

INSERT INTO `tb_guru` (`id_guru`, `nik`, `nama_guru`, `email`, `password`, `foto`, `status`, `date_created`, `confirm`) VALUES
(8, '270902', 'Wulan Putri Septiani, Sp.d.', 'wulan@gmail.com', '668ffa2520b9b69de0589927b8f9a30d50df6343', '011cbf056dc82a552055632328c8df32.jpg', 'Y', '2023-11-15', 'Yes'),
(9, '1234', 'ENENG METIN NURAENI, S.Pd', 'metin@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'default.png', 'Y', '2023-11-20', 'Yes'),
(10, '1234', 'RIRI RAHMI NISA, S.Pd', 'riri@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'default.png', 'Y', '2023-11-20', 'Yes'),
(11, '1234', 'Muhammad Aditya Firdaus, M.Pd', 'aditya@gmail.com', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'default.png', 'Y', '2023-11-20', 'Yes');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenisperangkat`
--

CREATE TABLE `tb_jenisperangkat` (
  `id_jenisperangkat` int(11) NOT NULL,
  `jenis_perangkat` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenisperangkat`
--

INSERT INTO `tb_jenisperangkat` (`id_jenisperangkat`, `jenis_perangkat`) VALUES
(1, 'RPP'),
(2, 'SILABUS'),
(3, 'MODUL');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenistugas`
--

CREATE TABLE `tb_jenistugas` (
  `id_jenistugas` int(11) NOT NULL,
  `jenis_tugas` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenistugas`
--

INSERT INTO `tb_jenistugas` (`id_jenistugas`, `jenis_tugas`) VALUES
(1, 'INDIVIDU'),
(2, 'KELOMPOK');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenisujian`
--

CREATE TABLE `tb_jenisujian` (
  `id_jenis` int(11) NOT NULL,
  `jenis_ujian` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenisujian`
--

INSERT INTO `tb_jenisujian` (`id_jenis`, `jenis_ujian`) VALUES
(2, 'Harian');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_jurusan`
--

CREATE TABLE `tb_master_jurusan` (
  `id_jurusan` int(11) NOT NULL,
  `jurusan` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_master_jurusan`
--

INSERT INTO `tb_master_jurusan` (`id_jurusan`, `jurusan`) VALUES
(6, 'Pendidikan Agama Islam');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_kelas`
--

CREATE TABLE `tb_master_kelas` (
  `id_kelas` int(11) NOT NULL,
  `kelas` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_master_kelas`
--

INSERT INTO `tb_master_kelas` (`id_kelas`, `kelas`) VALUES
(13, 'A3');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_mapel`
--

CREATE TABLE `tb_master_mapel` (
  `id_mapel` int(11) NOT NULL,
  `mapel` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_master_mapel`
--

INSERT INTO `tb_master_mapel` (`id_mapel`, `mapel`) VALUES
(11, 'Pendidikan Agama Islam');

-- --------------------------------------------------------

--
-- Table structure for table `tb_master_semester`
--

CREATE TABLE `tb_master_semester` (
  `id_semester` int(11) NOT NULL,
  `semester` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_master_semester`
--

INSERT INTO `tb_master_semester` (`id_semester`, `semester`) VALUES
(1, 'SEMESTER 5');

-- --------------------------------------------------------

--
-- Table structure for table `tb_materi`
--

CREATE TABLE `tb_materi` (
  `id_materi` int(11) NOT NULL,
  `judul_materi` varchar(120) NOT NULL,
  `materi` text NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(20) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tgl_entry` date NOT NULL,
  `id_roleguru` int(11) NOT NULL,
  `public` enum('Y','N') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_materi`
--

INSERT INTO `tb_materi` (`id_materi`, `judul_materi`, `materi`, `nama_file`, `tipe_file`, `ukuran_file`, `file`, `tgl_entry`, `id_roleguru`, `public`) VALUES
(4, 'Pengertian Sholat', '<p>Dalam sebuah dari segi bahasa berarti do&rsquo;a, dan menurut istilah syara&rsquo; berarti ucapan&nbsp;dan pekerjaan yang dimulai dengan takbir, dan diakhiri/ditutup denngan salam,&nbsp;dengan syarat tertentu.&nbsp;Kemudian shalat diartikan sebagai suatu ibadah yang meliputi ucapan dan&nbsp;peragaan tubuh yang khusus, dimulai dengan takbir dan di akhiri dengan salam&nbsp;(taslim). Dari pengertian tersebut dapat diambil kesimpulan bahwa yang dimaksud&nbsp;dengan shalat adalah suatu pekerjaan yang diniati ibadah dengan berdasarkan syarat-<br />\r\nsyarat yang telah ditentukan yang dimulai dengan takbiratul ikhram dan diakhiri&nbsp;dengan salam.Shalat menghubungkan seorang hamba kepada penciptanya, dan shalat&nbsp;merupakan menifestasi penghambaan dan kebutuhan diri kepada Allah SWT.Dari sini&nbsp; maka, shalat dapat menjadi media permohonan, pertolongan dalam menyingkirkan&nbsp;segala bentuk kesulitan yang ditemui manusia dalam perjalanan hidupnya.&nbsp;Para ahli Islam memiliki berbagai pandangan dan definisi tentang sholat. Di antara pandangan mereka, ada beberapa poin umum yang dapat dijelaskan:</p>\r\n\r\n<p>1. Ibadah kepada Allah: Sholat adalah bentuk ibadah yang paling mendasar dalam Islam. Ini adalah cara umat Islam berkomunikasi dengan Allah, mengingat-Nya, dan mengukuhkan hubungan spiritual dengan-Nya.</p>\r\n\r\n<p>2. Sarana Ketaatan: Sholat adalah sarana untuk melaksanakan perintah Allah. Umat Islam diwajibkan untuk menjalankan sholat sebagai tanda ketaatan kepada-Nya.</p>\r\n\r\n<p>3. Aktivitas Spiritual: Sholat adalah aktivitas spiritual yang melibatkan gerakan fisik dan bacaan doa. Ini menciptakan pengalaman yang mendalam dalam menyatakan kehambaan kepada Allah.</p>\r\n\r\n<p>4. Pembersih Diri: Sholat juga dianggap sebagai sarana untuk membersihkan diri dari dosa dan kesalahan. Melalui sholat, seseorang diharapkan dapat memohon ampunan Allah dan meningkatkan kualitas moral dan spiritualnya.</p>\r\n\r\n<p>5. Komunikasi Dengan Allah: Sholat adalah bentuk komunikasi langsung antara individu dan Allah. Melalui sholat, umat Islam dapat mengungkapkan keinginan, permohonan, dan rasa syukur kepada Allah.</p>\r\n\r\n<p>6. Pengertian sholat dapat bervariasi sedikit di antara para ahli Islam, tetapi intinya adalah bahwa sholat adalah ibadah yang sangat penting dalam agama Islam yang mencakup aspek-aspek spiritual, ketaatan, dan komunikasi dengan Allah.</p>\r\n\r\n<p><br />\r\nSholat juga dianggap sebagai bentuk ketaatan dan penghormatan yang mendalam terhadap Allah. Saat seorang Muslim melaksanakan sholat, ia menunjukkan ketaatannya kepada perintah Ilahi dan mengakui kebesaran serta keagungan Allah. Sholat bukan hanya sekadar rutinitas ibadah, tetapi juga merupakan penghormatan yang sungguh-sungguh dalam mempersembahkan diri di hadapan Sang Pencipta. Sholat menciptakan suasana ketundukan dan keheningan yang memberikan kesempatan bagi individu untuk merenung dan memperkuat ikatan spiritualnya dengan Allah. Dalam momen-momen kesunyian di antara gerakan sholat, seorang Muslim dapat menemukan kedamaian batin dan kekhusyukan dalam berkomunikasi dengan Allah tanpa gangguan dari dunia sekitarnya.&nbsp;Sholat juga diartikan sebagai upaya untuk meningkatkan kesadaran diri terhadap nilai-nilai moral dan etika Islam. Melalui pengulangan ritual sholat, seorang Muslim diberi kesempatan untuk merefleksikan perbuatannya, mengevaluasi sikap hidup, dan merencanakan perbaikan diri. Sholat menjadi sarana untuk pertumbuhan pribadi dan peningkatan kesadaran akan tanggung jawab moral.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '1700386284', 'text', '0', '--', '2023-11-19', 2, 'Y'),
(9, 'Keutamaan Sholat', '<p>Dalam hadits Nabi Muhammad SAW telah mengingatkan keutamaan sholat fardhu. Salah satunya bagi yang senantiasa menjaga sholat maka dijanjikan cahaya dan petunjuk pada hari kiamat kelak. ???? ??????? ????????? ??????? ???? ??????? ????????????? ????????? ?????? ????????????? ?????? ???? ????????? ????????? ???? ?????? ???? ?????? ????? ?????????? ????? ??????? ? ??????? ?????? ???????????? ???? ????????? ????????????? ??????????? ????????? ???? ?????? Artinya: &quot;Siapa saja yang menjaga sholat maka dia akan mendapatkan cahaya, petunjuk dan keselamatan pada hari kiamat. Sedangkan, siapa saja yang tidak menjaga sholat, dia tidak akan mendapatkan cahaya, petunjuk dan keselamatan. Dan pada hari kiamat nanti, dia akan dikumpulkan bersama dengan Qarun, Firaun, Haman, dan Ubay bin Khalaf.&quot; (HR Ahmad) Mengutip buku Ringkasan Shahih Muslim karya M. Nashiruddin al-Albani, hadits Rasulullah SAW lainnya menyebutkan bahwa melaksanakan fardhu diibaratkan sebagai pencuci dosa manusia. Dari Abu Hurairah radhiyallahu &#39;anhu, ia berkata bahwa Rasulullah SAW pernah bersabda, ???????????? ???? ????? ??????? ??????? ?????????? ? ?????????? ????? ????? ?????? ??????? ? ??? ??????? ?????? ??????? ???? ???????? &raquo; . ??????? ??? ??????? ???? ???????? ??????? . ????? &laquo; ???????? ?????? ???????????? ????????? ? ??????? ??????? ????? ??????????? &raquo; Artinya: &quot;Jika seandainya ada aliran sungai mengetuk pintu kalian untuk mencuci rumah kalian lima kali dalam sehari, apakah mungkin masih ada kotoran yang tersisa?&quot; Para sahabat menjawab, &quot;Tidak mungkin ada kotoran yang tersisa.&quot; Lalu Nabi bersabda, &quot;Begitu juga halnya dengan sholat lima waktu, Allah akan menghapus dosa kalian dengan sholat-sholat tersebut,&quot; (HR Al-Bukhari, Muslim, Tirmidzi, dan An-Nasa&#39;i) Selain itu, dijelaskan oleh Khalifat Utsman bin Affan melalui kutipan dalam buku Belajar dari Ustadz Yusuf Mansur karya Ahmad Jameel, dkk, ada sembilan keutamaan sholat fadhu yang dilaksanakan tepat waktu. Berikut adalah keutamaan tersebut.</p>\r\n\r\n<p>1. Disayangi oleh Allah SWT</p>\r\n\r\n<p>2. Badannya selalu diberikan kesehatan</p>\r\n\r\n<p>3. Pribadinya dijaga oleh malaikat</p>\r\n\r\n<p>4. Diberi keberkahan yang diturunkan ke rumahnya</p>\r\n\r\n<p>5. Mukanya terpancar aura orang yang shaleh</p>\r\n\r\n<p>6. Hatinya akan dilembutkan oleh Allah SWT</p>\r\n\r\n<p>7. Mampu melewati jembatan Shiratal Mustaqim kelak seperti kilat yang sangat cepat</p>\r\n\r\n<p>8. Pribadinya akan dipelihara dari sentuhan api neraka</p>\r\n\r\n<p>9. Ditempatkan oleh Allah SWT ke dalam golongan orang-orang yang tidak takut pula bersedih</p>\r\n\r\n<p>Selain itu,&nbsp;Sholat fardhu yang dilaksanakan tepat waktu membawa keutamaan besar, termasuk pertolongan langsung dari Allah SWT. Melalui ketaatan dalam menjaga sholat, seorang Muslim dapat merasakan bimbingan dan perlindungan-Nya dalam menghadapi berbagai ujian dan cobaan di dunia ini. Selain itu, sholat juga menjadi bukti keimanan dan ketaatan yang dapat membantu seseorang mendapatkan pertolongan dan rahmat Allah di akhirat nanti.&nbsp;Sholat fardhu yang dilakukan dengan penuh khusyuk dan tuma&#39;ninah tidak hanya memberikan keutamaan rohaniah, tetapi juga kesehatan bagi tubuh fisik. Gerakan-gerakan dalam sholat melibatkan aktivitas fisik yang dapat menjaga kebugaran dan kesehatan tubuh. Secara holistik, sholat berperan sebagai bentuk ibadah yang merawat keseimbangan antara kesehatan fisik dan spiritual, menciptakan harmoni dalam kehidupan seorang Muslim.</p>\r\n', '1700387221', 'text', '0', '--', '2023-11-19', 2, 'Y'),
(11, 'Syarat Sah Sholat', '<p>Syarat-syarat sholat yaitu 8 :<br />\r\nSuci dari 2 hadas yakni hadas kecil dan hadas besar , dan suci dari segala najis pada pakaian, dan badan, dan tempat , dan menutup aurat , dan menghadap kiblat , dan masuk waktu , dan mengetahui dengan fardhu-fardhunya , dan bahwa jangan ia beri&rsquo;tiqod akan yang fardhu daripada fardhu-fardhu sholat akan sunah, dan meninggalkan segala yang membatalkan sholat .<br />\r\n&nbsp;1. suci dari kedua hadats, yaitu hadats kecil seperti kecing dan berak, dan hadats besar seperti keluar seperma (mani) akibat bersetubuh suami-istri atau dengan sebab yang lainnya, seperti bermimpi, dll., yang diharuskan mandi junub.<br />\r\n2. suci dari najis dalam pakaian, badan dan tempat seseorang yang melaksanakan shalat. Yang dimaksud dengan najis tersebut adalah najis yang la yu&rsquo;fa &lsquo;anhu (tidak bisa dimaklumi menurut syariah).&nbsp;<br />\r\nTidak sah shalat seseorang dalam keadaan badan, pakaian dan tampat shalatnya terkena najis. Rasulallah saw bersabda: &ldquo;Cucilah bekas air kencing, karena kebanyakan azab kubur itu karena masalah itu.&rdquo; (HR. Muslim).<br />\r\nAllah berfirman &ldquo;Dan pakaianmu, bersihkanlah&rdquo;. QS Al-Muddatstsir &nbsp;4<br />\r\nBegitu pula hadits yang menceritakan seorang arab badawi yang kencing di dalam masjid. Rasulullah saw memerintahkan untuk menyiraminya dengan seember air. (HR Bukhari Muslim). Menurut Imam as-Syihab ar-Ramly bahwa batasan sedikit dan banyaknya najis dapat diketahui menurut pandangan umum (&lsquo;urf), yang menyatakan bahwa jika najis tidak susah terdeteksi dan susah dihindarinya maka termasuk najis yang sedikit (qalyl), jika lebih dari itu (baca, mudah terdeteksi, jelas dan mudah untuk dihindarinya) maka termasuk najis yang banyak (katsir). Sebab pada dasarnya najis sedikit yang dapat dimaklumi oleh syariat (ma&rsquo;fu &lsquo;anhu) adalah karena susah untuk dihindari (ta&rsquo;adzuri al-ikhtiraz). Sedangkan sebagian ulama berpendapat bahwa batasan banyaknya najis adalah batasan dimana seseorang dapat melihatnya dengan jelas tanpa mengangan-angan, memikirkan dan menelitinya.<br />\r\n3. menutup aurat. Batasan menutup aurat dengan sekiranya kulit seseorang tidak dapat dilihat oleh mata orang lain. Ada perbedaan batasan aurat dalam shalat bagi laki-laki dan perempuan. Batasan aurat bagi laki-laki yang wajib ditutup adalah anggauta badan di antara pusar sampai dengan lutut. Sedangkan aurat bagi perempuan yang wajib ditutup adalah sekujur tubuhnya kecuali wajah dan kedua telapak tangannya.<br />\r\nOrang yang hendak melaksanakan shalat harus menutupi auratnya, meski shalat di kegelapan malam atau berada di tempat yang sepi. Dan disunahkan bagi seorang yang melaksanakan shalat dengan menggunakan pakaian yang terbaik yang dimilikinya.<br />\r\n4. menghadap Kiblat.<br />\r\nKewajiban menghadap Kiblat pada saat seseorang melaksanakan shalat berdasarkan ayat al-Quran yang memerintahkan menghadap Kiblat. Sebagaimana Allah berfirman;<br />\r\n&ldquo;Sungguh kami (sering) melihat mukamu menengadah ke langit, maka sungguh kami akan memalingkan kamu ke Kiblat yang kamu sukai. Palingkanlah mukamu ke arah Masjid al-Haram. Dan dimana saja kamu berada, palingkanlah mukamu ke arahnya. Dan sesungguhnya orang-orang (Yahudi dan Nasrani) yang diberi Al-Kitab (Taurat dan Injil) memang mengetahui bahwa berpaling ke Masjid al-Haram itu adalah benar dari Tuhannya; dan Allah sekali-kali tidak lengah dari apa yang mereka kerjakan&rdquo;. (QS. Al-Baqarah : 144).</p>\r\n\r\n<p>Dalam ayat tersebut Allah telah memerintahkan lebih dari satu kali memerintahkan kita untuk menghadap kiblat. Dan ayat tersebut dipertegas dengan ayat yang lain, sebagaimana Allah berfirman;<br />\r\n&ldquo;Dan dimana saja kamu keluar, maka palingkanlah wajahmu ke arah Masjid al-Haram; sesungguhnya ketentuan itu benar-benar sesuatu yang hak dari Tuhanmu. Dan Allah sekali-kali tidak lengah dari apa yang kamu kerjakan. Dan darimana saja kamu keluar, maka palingkanlah wajahmu ke arah Masjid al-Haram. Dan dimana saja kamu (sekalian) berada, maka palingkanlah wajahmu ke arahnya, agar tidak ada hujjah manusia atas kamu, kecuali orang-orang yang dzalim di antara mereka. Maka janganlah kamu takut kepada mereka dan takutlah kepadaKu. Dan agar kesempurnaan nikmatKu atasmu, dan supaya kamu mendapat petunjuk&rdquo;. (QS &nbsp;al-Baqarah ayat 150)</p>\r\n\r\n<p>Ada sebuah ungkapan kaidah yang mengatakan bahwa &ldquo;kullu syain mustasnayatun&rdquo; (Setiap sesuatu ada pengecualiannya).&nbsp;<br />\r\nSebagaimana dalam persoalan menghadap Kiblat, ada dua keadaan yang mana seorang yang melaksanakan shalat diperbolehkan untuk tidak menghadap Kiblat ;&nbsp;<br />\r\nPertama, keadaan seseorang yang teramat mencekam dalam bayang-bayang ketakutan (syadzid al-khauf). Seperti kondisi peperangan, dimana jika memaksakan kehendak untuk berusaha menghadap Kiblat, maka akan tertangkap basah oleh musuh dan nyawa pun akan melayang, kondisi seperti inilah yang membolehkan seseorang shalat tidak menghadap Kiblat.<br />\r\nAllah berfirman: &ldquo;Maka jika kamu dalam keadaan takut (bahaya), maka (sholatlah) sambil berjalan atau berkendaraan&rdquo; al-Baqarah 239<br />\r\nIbnu Umar ra berkata tentang tafsir ayat ini, &ldquo;Jika rasa takut melebihi itu, maka mereka boleh shalat sambil jalan kaki atau berkendaraan dengan menghadap kiblat maupun tidak menghadap kiblat&rdquo;. (HR. Bukhari)<br />\r\nKedua, shalat sunah yang dilaksanakan dalam kondisi bepergian yang diperbolehkan menurut syariat. Dengan kata lain, perjalanan tidak dalam keadaan atau demi mencapai tujuan yang bernuansa maksiat.<br />\r\nBoleh sesorang tidak menghadap kiblat dalam shalat jika dalam keadaan sangat takut atau bahaya (perang dan sebagainya).<br />\r\nSedang jika dalam perjalanan (berkendaraan) boleh tidak menghadap kiblat ketika shalat sunnah. Sesuai dengan hadits yang diriwayatkan dari Abdullah bin Umar ra, ia berkata: &ldquo;Rasulullah saw pernah shalat di atas kendaraannya sesuai dengan kendaraannya mengarah.&rdquo; (HR Bukhari). Dari hadist ini kita bisa memahami bahwa jika ingin melakukan yang fardhu, Rasulallah saw turun dari kendaraannya lalu menghadap kiblat.<br />\r\nKesimpulannya menghadap kiblat adalah syarat sahnya shalat, maka ia tidak gugur kecuali dalam keadaan sangat takut (bahaya) dan saat shalat sunah dalam bepergian sebagaimana telah disebutkan.<br />\r\nKetahuilah bahwa terdapat empat derajat kiblat, sesuai dengan kadar dan cara mengetahui eksistensinya, yaitu ;&nbsp;<br />\r\nPertama, seseorang yang benar-benar melihat dan mengetahui secara langsung Kiblat.&nbsp;<br />\r\nKedua, mengetahui Kiblat dari informasi seorang yang dapat dipercaya, seperti ia mengatakan; aku melihat sendiri Kiblat.&nbsp;<br />\r\nKetiga, mengetahui Kiblat melalui ijtihad.&nbsp;<br />\r\nDan keempat, mengetahui Kiblat melalui taklid pada mujtahid.<br />\r\n5. masuk waktu.<br />\r\nMengetahui masuknya waktu secara yakin benar-benar mengetahui secara persis, atau dengan praduga (dzan) melalui ijtihad yang sungguh-sungguh.&nbsp;<br />\r\nAda tiga tingkatan dalam mengetahui masuknya waktu shalat.&nbsp;<br />\r\nPertama, mengetahui sendiri secara langsung, atau mengetahui dari informasi seseorang yang dapat dipercaya, atau melihat petunjuk Bencet yang benar dan tidak rusak, atau mengetahui melalui petunjuk bayang-bayang matahari, atau jam dan Kompas. Termasuk juga adzan seorang muadzin termasuk petunjuk yang dapat mengetahui masuknya waktu shalat.<br />\r\nKedua, ijtihad melalui penggalian al-Quran, belajar, mengkaji ilmu, atau menganalisa melalui fenomena alam, seperti kokok Ayam di pagi hari. Harus diteliti apakah kokok ayam telah menunjukkan waktu subuh sudah masuk atau belum. Maka tidak boleh mengikuti kokok ayah dengan tanpa diteliti dan berijtihan terlebih dahulu.<br />\r\nKetiga, taklid pada seorang mujtahid. Maka jiaka seseorang mampu berijtihan sendiri, maka tidak boleh mengikuti ijtihan orang lain. Dengan syarat ia dalam kondisi dapat melihat. Sementara bagi orang yang buta harus taklid pada mujtahid, meski ia sebenarnya mampu berijtihad. Karena kebutaannya itu lah sehingga mengakibatkan ia tidak mampu meneliti secara komprehensip dan seksama atas sesuatu.<br />\r\n6. mengetahui kefardhuan shalat. Artinya bahwa shalat lima waktu itu diketahui dan diyakini sebagai shalat yang wajib dilaksanakan bagi seluruh umat Islam.<br />\r\n7. tidak meyakini shalat fardhu sebagai pekerjaan yang disunahkan.<br />\r\n&nbsp;8. menjauhi segala sesuatu yang membatalkan shalat.</p>\r\n', '1700387389', 'text', '0', '--', '2023-11-19', 2, 'Y'),
(12, 'Ancaman bagi yang melalaikan Sholat', '<p><strong>Sholat&nbsp;</strong>merupakan salah satu rukun Islam yang wajib dilaksanakan oleh setiap umat muslim. Sholat dilakukan sebagai bentuk ketaatan, ibadah kepada Allah SWT, serta sebagai sarana perbaikan diri dan menjaga ketaqwaan kepada-Nya. Akan tetapi, umat manusia sering kali lalai ataupun kurang berkonsentrasi ketika mengerjakan sholat.</p>\r\n\r\n<p>Abdul Qadir Ar-Rahbawi dalam buku Tentang Thaharah: Hukum Air dan Wudhu menjelaskan bahwa Allah SWT sangat keras dalam memberikan peringatan terhadap orang yang lalai dalam sholat. Perihal ini juga telah tertuang pada firman Allah SWT dalam Al-Qur&#39;an Surat Al-Maun ayat 4-5:</p>\r\n\r\n<p>fa wailul lil-mushall&icirc;n. Alladz&icirc;na hum &#39;an shal&acirc;tihim s&acirc;h&ucirc;n.</p>\r\n\r\n<p>Artinya: &quot;Maka celakalah bagi orang-orang yang sholat, (yaitu) orang-orang yang lalai dalam sholatnya.&quot; (QS. Al-Ma&#39;un: 4-5).</p>\r\n\r\n<p>Lalu, apa hukuman bagi orang yang lalai dalam sholat?</p>\r\n\r\n<p>Siksaan awal sebelum datangnya siksa kubur&nbsp;<br />\r\n&nbsp;Merasa kehausan, kelaparan dan terhina&nbsp;<br />\r\nSiksaan didalam kubur<br />\r\n1. &nbsp;Kuburan akan di Sempitkan<br />\r\n2. Dibakar dengan bara api yang menyala<br />\r\n3. Akan ditemani ular yang sangat besar</p>\r\n\r\n<h2>Hukuman Bagi orang yang Lalai dalam Sholat</h2>\r\n\r\n<p>Menurut pendapat Nurul Mubin dalam buku berjudul Ular yang Menunggu Jenazah karya Rizem Aizid, berikut ini adalah hukuman bagi orang yang lalai dalam sholat:</p>\r\n\r\n<h3>1. Dijatuhi Hukuman Had</h3>\r\n\r\n<p>Hukuman bagi orang yang meninggalkan sholat karena malas ataupun lalai dalam sholatnya akan dijatuhi hukuman had atau hukuman fisik. Tak hanya bagi orang yang meninggalkan sholat, hukuman had juga diperuntukkan bagi pelaku dosa besar yang lain seperti berzina, mencuri, mengonsumsi minuman keras, memfitnah, dan lain sebagainya. Adapun hukuman had yang diperuntukkan bagi mereka yaitu dibunuh dengan cara dirajam.</p>\r\n\r\n<h3>2. Dijuluki dengan Sebutan Khabirah atau Akbarul Kaba&#39;ir</h3>\r\n\r\n<p>Orang yang lalai dalam sholat dan meninggalkan sholat akan dijuluki dengan sebutan khabirah yang artinya dosa besar. Sudikah umat muslim dijuluki dengan nama tersebut? Naudzu billah min dzalik, semoga umat muslim tidak sampai dijuluki dengan nama tersebut.</p>\r\n\r\n<h3>3. Termasuk Golongan Fahisyah</h3>\r\n\r\n<p>Orang yang lalai dalam sholat termasuk dalam golongan fahisyah yang berarti semua kemaksiatan yang sangat buruk dan melampaui batasan. Orang yang lalai dalam sholat berarti ia telah melakukan kekafiran yang nyata terhadap Allah SWT. Oleh karena itu, tidak mengherankan apabila orang yang lalai dalam sholatnya termasuk ke dalam golongan fahisyah.</p>\r\n\r\n<h3>4. Termasuk Orang yang Fasik</h3>\r\n\r\n<p>Lalai dalam sholat dan meninggalkan sholat termasuk dalam perbuatan dosa besar. Karena itulah orang yang melakukan dosa besar disebut fasik yang berarti keluar dari sesuatu. Orang fasik adalah orang yang telah keluar dari jalan Allah SWT, yaitu orang yang melakukan dosa besar karena sudah tidak mempedulikan perintah-Nya. Sebagaimana firman Allah SWT yang terdapat dalam Al-Qur&#39;an surat Al-Baqarah ayat 27:</p>\r\n\r\n<p>alladz&icirc;na yangqudl&ucirc;na &#39;ahdall&acirc;hi mim ba&#39;di m&icirc;ts&acirc;qih&icirc; wa yaqtha&#39;&ucirc;na m&acirc; amarall&acirc;hu bih&icirc; ay y&ucirc;shala wa yufsid&ucirc;na fil-ardl, ul&acirc;&#39;ika humul-kh&acirc;sir&ucirc;n</p>\r\n\r\n<p>Artinya: &quot;(yaitu) orang-orang yang melanggar perjanjian Allah setelah (perjanjian) itu diteguhkan, memutuskan apa yang diperintahkan Allah untuk disambungkan (silaturahmi), dan berbuat kerusakan di bumi. Mereka itulah orang-orang yang rugi (fasik).&quot; (QS. Al-Baqarah: 27).</p>\r\n\r\n<h3>5. Mendapat Laknat dari Allah SWT</h3>\r\n\r\n<p>Umat muslim perlu mengetahui bahwa orang yang lalai dalam sholat niscaya akan mendapatkan laknat-Nya. Laknat dalam hal ini merupakan pengusiran atau penjauhan dari rahmat dan kasih sayang Allah SWT. Maka dari itu, apabila seorang muslim melalaikan lalai dalam sholat, maka bersiap-siaplah untuk menjauh dari rahmat dan kasih sayang-Nya.</p>\r\n\r\n<h3>6. Tidak Dilihat oleh Allah SWT</h3>\r\n\r\n<p>Tak hanya memperoleh laknat dari Allah SWT, orang yang lalai dalam sholat niscaya juga tidak akan pernah dilihat oleh Allah SWT baik di dunia maupun di akhirat. Jika sudah seperti ini, dapat dipastikan bahwa orang-orang yang lalai dalam sholat termasuk orang-orang yang merugi.</p>\r\n\r\n<h3>7. Jauh dari Surga dan Kekal di Neraka</h3>\r\n\r\n<p>Sholat termasuk ibadah pertama yang akan dihisab oleh Allah SWT di hari kiamat nantinya. Penentu umat muslim akan masuk surga atau tidaknya ditentukan dari kualitas sholatnya ketika hidup di dunia. Melalaikan sholat sama halnya dengan menjauhi surga-Nya. Oleh karena itu, secara otomatis ia akan berada kekal di dalam neraka selama-lamanya.</p>\r\n\r\n<h3>8. Tidak dianggap Sebagai Muslim</h3>\r\n\r\n<p>Hukuman lain bagi orang yang lalai dalam sholat yaitu tidak mendapat pengakuan sebagai seorang muslim. Hal ini dikarenakan perbuatan melalaikan sholat dan meninggalkannya akan menjadikan umat muslim sebagai orang yang kafir atau musyrik. Sebagaimana dalam hadits, dari Tsauban RA pernah mendengar Rasulullah SAW bersabda:&nbsp;&quot;Pemisah antara seorang hamba dengan kekufuran dan keimanan adalah sholat. Apabila ia meninggalkannya, maka ia telah melakukan kesyirikan.&quot; (HR. Thabari).</p>\r\n\r\n<p>Itulah beberapa dari hukuman bagi orang yang lalai dalam sholat dan meninggalkannya secara sengaja. Apabila umat muslim selama ini merasa telah lalai dalam sholatnya, maka segeralah untuk bertaubat dan memohon ampunan kepada Allah SWT.</p>\r\n', '1700387635', 'text', '0', '--', '2023-11-19', 2, 'Y'),
(13, 'Hal hal yang membatalkan sholat', '<p>Perkara yang membatalkan shalat menurut kitab saffinah ada empat belas, yaitu:<br />\r\n1. Berhadats (seperti kencing dan buang air besar).<br />\r\n2. Terkena najis, jika tidak dihilangkan seketika, tanpa dipegang atau diangkat (dengan tangan atau selainnya).<br />\r\n3. Terbuka aurat, jika tidak dihilangkan seketikas.<br />\r\n4. Mengucapkan dua huruf atau satu huruf yang dapat difaham.<br />\r\n5. Mengerjakan sesuatu yang membatalkan puasa dengn sengaja.<br />\r\n6. Makan yang banyak sekalipun lupa.<br />\r\n7. Bergerak dengan tiga gerakan berturut-turut sekalipun lupa.<br />\r\n8. Melompat yang luas.<br />\r\n9. Memukul yang keras.<br />\r\n10. Menambah rukun fi&rsquo;li dengan sengaja.<br />\r\n11. Mendahului imam dengan dua rukun fi&rsquo;li dengan sengaja.<br />\r\n12. Terlambat denga dua rukun fi&rsquo;li tanpa udzur.<br />\r\n13. Niat yang membatalkan shalat.<br />\r\n14. Mensyaratkan berhenti shalat dengan sesuatu dan ragu dalam memberhentikannya.</p>\r\n', '1700387873', 'text', '0', '--', '2023-11-19', 2, 'Y'),
(14, 'Rukun Sholat', '<p>Rukun sholat terdiri dari tiga kategori utama, yakni rukun fi&rsquo;li, rukun qalbi, dan rukun qauli. Seperti disebutkan sebelumnya, rukun fi&rsquo;li adalah rukun yang membahas tentang gerakan sholat meliputi gerakan berdiri tegak, ruku, itidal, sujud, <a href=\"https://kumparan.com/topic/duduk\">duduk</a> di antara dua sujud, dan duduk tasyahud akhir.<br />\r\n1. Rukun Qauli</p>\r\n\r\n<p>Rukun shalat pertama yakni Qauli. Pada dasarnya, rukun qauli adalah hal yang wajib dikerjakan, berupa perkataan yang harus dilafadzkan ketika sedang mengerjakan shalat. Jika rukun qauli ini tidak diucapkan di bibir seseorang atau rukun qauli diucapkan dibibirnya (seperti hanya komat-kamit/sekedar bibir bergerak sehingga telinga dirinya sendiri tidak mendengar), maka shalatnya tidak sah. Berikut adalah unsur Rukun Qauli, diantaranya.<br />\r\na. Takbiratul Ihram<br />\r\nb. Alfatiahah<br />\r\nc. bacaan tahiyat akhir<br />\r\nd. Sholawat nabi<br />\r\ne. Salam pertama</p>\r\n\r\n<p>Rukun Qolbi, hanya ada 1 diantaranya</p>\r\n\r\n<p>a. Niat</p>\r\n\r\n<p>yang ketiga ada Rukun Fi&#39;li, diantaranya :</p>\r\n\r\n<p>a. berdiri</p>\r\n\r\n<p>b. rukuk</p>\r\n\r\n<p>c. tuma&rsquo;ninah ketika rukuk</p>\r\n\r\n<p>d. i&rsquo;tidal, tuma&rsquo;ninah ketika i&rsquo;tidal</p>\r\n\r\n<p>e. sujud awal, tuma&rsquo;ninah ketika sujud awal</p>\r\n\r\n<p>f. duduk setelah sujud awal</p>\r\n\r\n<p>g. tuma&rsquo;ninah ketika duduk</p>\r\n\r\n<p>h. sujud kedua</p>\r\n\r\n<p>i. tuma&rsquo;ninah ketika sujud kedua</p>\r\n\r\n<p>j. duduk akhir</p>\r\n\r\n<p>k. tertib.</p>\r\n', '1700389767', 'text', '0', '--', '2023-11-19', 2, 'Y');

-- --------------------------------------------------------

--
-- Table structure for table `tb_perangkat`
--

CREATE TABLE `tb_perangkat` (
  `id_perangkat` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(20) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `isi_perangkat` text NOT NULL,
  `id_jenisperangkat` int(11) NOT NULL,
  `tgl_entry` date NOT NULL,
  `publish` int(11) NOT NULL,
  `id_roleguru` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tb_roleguru`
--

CREATE TABLE `tb_roleguru` (
  `id_roleguru` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_roleguru`
--

INSERT INTO `tb_roleguru` (`id_roleguru`, `id_guru`, `id_kelas`, `id_mapel`, `id_semester`, `id_jurusan`) VALUES
(2, 8, 13, 11, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tb_sekolah`
--

CREATE TABLE `tb_sekolah` (
  `id_sekolah` int(11) NOT NULL,
  `nama_sekolah` varchar(120) NOT NULL,
  `kepsek` varchar(120) NOT NULL,
  `textlogo` varchar(120) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `copyright` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_sekolah`
--

INSERT INTO `tb_sekolah` (`id_sekolah`, `nama_sekolah`, `kepsek`, `textlogo`, `logo`, `copyright`) VALUES
(1, 'UNIVERSITAS ISLAM NUSANTARA', 'Muhammad Aditya Firdaus, M.Pd', 'E-Classroom', 'uninus.png.crdownload', 'Kelompok 5');

-- --------------------------------------------------------

--
-- Table structure for table `tb_siswa`
--

CREATE TABLE `tb_siswa` (
  `id_siswa` int(11) NOT NULL,
  `nis` varchar(15) NOT NULL,
  `nama_siswa` varchar(120) NOT NULL,
  `jk` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` varchar(15) NOT NULL,
  `aktif` varchar(30) NOT NULL,
  `tingkat` varchar(20) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `id_kelas` int(11) NOT NULL,
  `id_jurusan` int(11) NOT NULL,
  `confirm` enum('Yes','No') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `tb_siswa`
--

INSERT INTO `tb_siswa` (`id_siswa`, `nis`, `nama_siswa`, `jk`, `password`, `status`, `aktif`, `tingkat`, `foto`, `id_kelas`, `id_jurusan`, `confirm`) VALUES
(7, 'achmad', 'Achmad Fajrullah', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(8, 'agni', 'Agni Garib Mubarok', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(9, 'arif', 'Arif Permana', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(10, 'bilqis', 'Bilqis Salbiyyah Fitriyani', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(12, 'faidatus', 'Faidatus Saadah', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(13, 'husni', 'Husniati Nurhalizah', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(14, 'intan', 'Intan Mustika Sukmawati', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(15, 'irapani', 'Irapani Soptiani', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(16, 'miftah', 'Miftah Ali Syaban', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(17, 'akbar', 'Muhammad Akbar Maulana', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(18, 'rafly', 'Rafly Januar Hendrawan', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(19, 'sopi', 'Sopi Sopiah', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(20, 'syifafr', 'Syifa Fatur Rahmah', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(21, 'tantan', 'Tantan Setiawan', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(22, 'wiva', 'Wiva Ainunnajah', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(23, 'yulia', 'Yulia Fatimah', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(24, 'zaky', 'Zaky A Yamani', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(25, 'najwa', 'Najwa Syifa Alawiyah', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(26, 'fauzan', 'Fauzan Aliyan', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(27, 'shifa', 'Shifa Lestari', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(28, 'silvi', 'Silvi Dwi Rahmayanti', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(29, 'hafidz', 'M Hafidz Al Azka', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(30, 'irfan', 'Irfan Syamsul Maarif', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(31, 'uli', 'Muhammad Uli Nuha', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(32, 'aliyan', 'Fauzan Aliyan', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(33, 'syifazn', 'Syifa Zakiyyatun Nafsi', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(34, 'chelsea', 'Chelsea Amadhea Kania', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(35, 'indah', 'Indah Puji Pertiwi', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(36, 'isma', 'Isma Yanti', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(37, 'yuni', 'Neneng Yuni Lestari', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(38, 'raihan', 'Raihan Miftah Hafidh', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(39, 'rahma', 'Pipa Rahma Yami', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(40, 'nurjanah', 'Nurjanah Aprilianti Hermawa', 'P', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'Y', '0', 'default.png', 13, 6, 'Yes'),
(41, 'siswa', 'siswa', 'L', '7110eda4d09e062aa5e4a390b0a572ac0d2c0220', 'off', 'N', '0', 'default.png', 13, 6, 'No');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tugas`
--

CREATE TABLE `tb_tugas` (
  `id_tugas` int(11) NOT NULL,
  `id_jenistugas` int(11) NOT NULL,
  `judul_tugas` varchar(100) NOT NULL,
  `isi_tugas` text NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` int(30) NOT NULL,
  `jml_anggota` int(30) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tugas`
--

INSERT INTO `tb_tugas` (`id_tugas`, `id_jenistugas`, `judul_tugas`, `isi_tugas`, `tanggal`, `waktu`, `jml_anggota`, `id_guru`, `id_mapel`, `id_semester`) VALUES
(1, 1, 'Membuat Kalkulator sederhan dengan PHP', '<p>Segera kerjakan tugas makalah membuat kalkulator berbasis web PHP</p>\r\n', '2020-04-21', 3, 0, 7, 11, 2),
(5, 2, 'Tugas Kelompok', '<p>Kelompok 1 : Syarat Sah Sholat<br />\r\nKelompok 2 : Rukun Qauli dan Qolbi<br />\r\nKelompok 3 : Rukun Fi&#39;li<br />\r\nKelompok 4 : Hal yang membatalkan Sholat</p>\r\n\r\n<p>&nbsp;</p>\r\n', '2023-11-19', 7, 8, 8, 11, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tugas_siswa`
--

CREATE TABLE `tugas_siswa` (
  `id_tgssiswa` int(11) NOT NULL,
  `id_tugas` int(11) NOT NULL,
  `subjek` varchar(120) NOT NULL,
  `id_siswa` int(11) NOT NULL,
  `kelompok` text NOT NULL,
  `nama_file` varchar(120) NOT NULL,
  `tipe_file` varchar(30) NOT NULL,
  `ukuran_file` varchar(30) NOT NULL,
  `file` varchar(255) NOT NULL,
  `tgl_upload` date NOT NULL,
  `ket` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tugas_siswa`
--

INSERT INTO `tugas_siswa` (`id_tgssiswa`, `id_tugas`, `subjek`, `id_siswa`, `kelompok`, `nama_file`, `tipe_file`, `ukuran_file`, `file`, `tgl_upload`, `ket`) VALUES
(1, 1, 'Membuat Kalkulator sederhan dengan PHP', 1, '', '1587473255', 'doc', '1483', '../vendor/file/tugasTUGAS-INDIVIDU_1587473255.doc', '2020-04-21', 'Selesai'),
(2, 3, ' Subjek', 5, '<p>ANGGOTA KELOMPOK</p>\r\n', '1700385062', 'pdf', '604175', '../vendor/file/tugasTUGAS-KELOMPOK_1700385062.pdf', '2023-11-19', 'Selesai');

-- --------------------------------------------------------

--
-- Table structure for table `ujian`
--

CREATE TABLE `ujian` (
  `id_ujian` int(5) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `jml_soal` int(30) NOT NULL,
  `acak` varchar(100) NOT NULL,
  `tipe` int(1) NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ujian`
--

INSERT INTO `ujian` (`id_ujian`, `judul`, `tanggal`, `waktu`, `jml_soal`, `acak`, `tipe`, `id_jenis`, `id_guru`, `id_mapel`, `id_semester`) VALUES
(14, 'Kalkulator', '2020-04-21', '00:05:00', 5, 'acak', 0, 2, 7, 11, 2);

-- --------------------------------------------------------

--
-- Table structure for table `ujian_essay`
--

CREATE TABLE `ujian_essay` (
  `id_ujianessay` int(11) NOT NULL,
  `judul` varchar(50) NOT NULL,
  `tanggal` date NOT NULL,
  `jml_soal` int(30) NOT NULL,
  `soal_essay` text NOT NULL,
  `id_jenis` int(11) NOT NULL,
  `id_guru` int(11) NOT NULL,
  `id_mapel` int(11) NOT NULL,
  `id_semester` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `analisis`
--
ALTER TABLE `analisis`
  ADD PRIMARY KEY (`id_analisis`);

--
-- Indexes for table `kelas_tugas`
--
ALTER TABLE `kelas_tugas`
  ADD PRIMARY KEY (`id_klstugas`);

--
-- Indexes for table `kelas_ujian`
--
ALTER TABLE `kelas_ujian`
  ADD PRIMARY KEY (`id_klsujian`);

--
-- Indexes for table `kelas_ujianessay`
--
ALTER TABLE `kelas_ujianessay`
  ADD PRIMARY KEY (`id_klsessay`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `pesan`
--
ALTER TABLE `pesan`
  ADD PRIMARY KEY (`id_pesan`);

--
-- Indexes for table `soal`
--
ALTER TABLE `soal`
  ADD PRIMARY KEY (`id_soal`);

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `tb_guru`
--
ALTER TABLE `tb_guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `tb_jenisperangkat`
--
ALTER TABLE `tb_jenisperangkat`
  ADD PRIMARY KEY (`id_jenisperangkat`);

--
-- Indexes for table `tb_jenistugas`
--
ALTER TABLE `tb_jenistugas`
  ADD PRIMARY KEY (`id_jenistugas`);

--
-- Indexes for table `tb_jenisujian`
--
ALTER TABLE `tb_jenisujian`
  ADD PRIMARY KEY (`id_jenis`);

--
-- Indexes for table `tb_master_jurusan`
--
ALTER TABLE `tb_master_jurusan`
  ADD PRIMARY KEY (`id_jurusan`);

--
-- Indexes for table `tb_master_kelas`
--
ALTER TABLE `tb_master_kelas`
  ADD PRIMARY KEY (`id_kelas`);

--
-- Indexes for table `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  ADD PRIMARY KEY (`id_mapel`);

--
-- Indexes for table `tb_master_semester`
--
ALTER TABLE `tb_master_semester`
  ADD PRIMARY KEY (`id_semester`);

--
-- Indexes for table `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD PRIMARY KEY (`id_materi`),
  ADD KEY `id_roleguru` (`id_roleguru`);

--
-- Indexes for table `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  ADD PRIMARY KEY (`id_perangkat`),
  ADD KEY `id_roleguru` (`id_roleguru`);

--
-- Indexes for table `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  ADD PRIMARY KEY (`id_roleguru`),
  ADD KEY `id_guru` (`id_guru`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_mapel` (`id_mapel`),
  ADD KEY `id_semester` (`id_semester`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `tb_sekolah`
--
ALTER TABLE `tb_sekolah`
  ADD PRIMARY KEY (`id_sekolah`);

--
-- Indexes for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  ADD PRIMARY KEY (`id_siswa`),
  ADD KEY `id_kelas` (`id_kelas`),
  ADD KEY `id_jurusan` (`id_jurusan`);

--
-- Indexes for table `tb_tugas`
--
ALTER TABLE `tb_tugas`
  ADD PRIMARY KEY (`id_tugas`);

--
-- Indexes for table `tugas_siswa`
--
ALTER TABLE `tugas_siswa`
  ADD PRIMARY KEY (`id_tgssiswa`);

--
-- Indexes for table `ujian`
--
ALTER TABLE `ujian`
  ADD PRIMARY KEY (`id_ujian`);

--
-- Indexes for table `ujian_essay`
--
ALTER TABLE `ujian_essay`
  ADD PRIMARY KEY (`id_ujianessay`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `analisis`
--
ALTER TABLE `analisis`
  MODIFY `id_analisis` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `kelas_tugas`
--
ALTER TABLE `kelas_tugas`
  MODIFY `id_klstugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `kelas_ujian`
--
ALTER TABLE `kelas_ujian`
  MODIFY `id_klsujian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kelas_ujianessay`
--
ALTER TABLE `kelas_ujianessay`
  MODIFY `id_klsessay` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pesan`
--
ALTER TABLE `pesan`
  MODIFY `id_pesan` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `soal`
--
ALTER TABLE `soal`
  MODIFY `id_soal` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_guru`
--
ALTER TABLE `tb_guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_jenisperangkat`
--
ALTER TABLE `tb_jenisperangkat`
  MODIFY `id_jenisperangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_jenistugas`
--
ALTER TABLE `tb_jenistugas`
  MODIFY `id_jenistugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_jenisujian`
--
ALTER TABLE `tb_jenisujian`
  MODIFY `id_jenis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_master_jurusan`
--
ALTER TABLE `tb_master_jurusan`
  MODIFY `id_jurusan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_master_kelas`
--
ALTER TABLE `tb_master_kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tb_master_mapel`
--
ALTER TABLE `tb_master_mapel`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `tb_master_semester`
--
ALTER TABLE `tb_master_semester`
  MODIFY `id_semester` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_materi`
--
ALTER TABLE `tb_materi`
  MODIFY `id_materi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  MODIFY `id_perangkat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  MODIFY `id_roleguru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tb_sekolah`
--
ALTER TABLE `tb_sekolah`
  MODIFY `id_sekolah` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_siswa`
--
ALTER TABLE `tb_siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `tb_tugas`
--
ALTER TABLE `tb_tugas`
  MODIFY `id_tugas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tugas_siswa`
--
ALTER TABLE `tugas_siswa`
  MODIFY `id_tgssiswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `ujian`
--
ALTER TABLE `ujian`
  MODIFY `id_ujian` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `ujian_essay`
--
ALTER TABLE `ujian_essay`
  MODIFY `id_ujianessay` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_materi`
--
ALTER TABLE `tb_materi`
  ADD CONSTRAINT `tb_materi_ibfk_1` FOREIGN KEY (`id_roleguru`) REFERENCES `tb_roleguru` (`id_roleguru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_perangkat`
--
ALTER TABLE `tb_perangkat`
  ADD CONSTRAINT `tb_perangkat_ibfk_1` FOREIGN KEY (`id_roleguru`) REFERENCES `tb_roleguru` (`id_roleguru`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_roleguru`
--
ALTER TABLE `tb_roleguru`
  ADD CONSTRAINT `tb_roleguru_ibfk_1` FOREIGN KEY (`id_guru`) REFERENCES `tb_guru` (`id_guru`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_2` FOREIGN KEY (`id_jurusan`) REFERENCES `tb_master_jurusan` (`id_jurusan`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_3` FOREIGN KEY (`id_kelas`) REFERENCES `tb_master_kelas` (`id_kelas`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_4` FOREIGN KEY (`id_mapel`) REFERENCES `tb_master_mapel` (`id_mapel`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_roleguru_ibfk_5` FOREIGN KEY (`id_semester`) REFERENCES `tb_master_semester` (`id_semester`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
