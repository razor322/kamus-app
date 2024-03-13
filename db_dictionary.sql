-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 13 Mar 2024 pada 16.27
-- Versi server: 10.4.27-MariaDB
-- Versi PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_dictionary`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `tgl_daftar` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `fullname`, `tgl_daftar`) VALUES
(4, 'jono', 'jono@gmail.com', '202cb962ac59075b964b07152d234b70', 'jono', '2024-03-13 18:31:30'),
(5, 'ari', 'ari@gmail.com', '202cb962ac59075b964b07152d234b70', 'ari', '2024-03-13 21:34:24');

-- --------------------------------------------------------

--
-- Struktur dari tabel `word`
--

CREATE TABLE `word` (
  `id_kata` bigint(20) UNSIGNED NOT NULL,
  `kata_indonesia` varchar(255) NOT NULL,
  `kata_jerman` varchar(255) NOT NULL,
  `jenis_kata` enum('benda','kerja','sifat') NOT NULL,
  `arti_indonesia` varchar(255) NOT NULL,
  `arti_jerman` varchar(255) NOT NULL,
  `contoh_indonesia` varchar(255) NOT NULL,
  `contoh_jerman` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `word`
--

INSERT INTO `word` (`id_kata`, `kata_indonesia`, `kata_jerman`, `jenis_kata`, `arti_indonesia`, `arti_jerman`, `contoh_indonesia`, `contoh_jerman`, `created_at`, `updated_at`) VALUES
(1, 'Buku', 'Buch', 'benda', 'kumpulan kertas yang berisi tulisan atau gambar', 'eine Sammlung von Blättern, die Schrift oder Bilder enthalten', 'Saya sedang membaca buku.', 'Ich lese gerade ein Buch.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(2, 'Makan', 'Essen', 'kerja', 'memasukkan makanan ke dalam mulut, mengunyah, dan menelannya', 'Nahrung in den Mund nehmen, kauen und schlucken', 'Saya sedang makan siang.', 'Ich esse gerade zu Mittag.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(3, 'Besar', 'groß', 'sifat', 'memiliki ukuran di atas rata-rata', 'überdurchschnittliche Größe haben', 'Rumah itu besar sekali.', 'Das Haus ist sehr groß.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(4, 'Air', 'Wasser', 'benda', 'cairan tidak berwarna, tidak berbau, dan tidak berasa yang merupakan zat utama penyusun kehidupan', 'Flüssigkeit ohne Farbe, Geruch und Geschmack, die den Hauptbestandteil des Lebens ausmacht', 'Saya minum air putih.', 'Ich trinke Wasser.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(5, 'Api', 'Feuer', 'benda', 'reaksi kimia eksotermis yang menghasilkan panas dan cahaya', 'eine exotherme chemische Reaktion, die Wärme und Licht erzeugt', 'Api unggun menghangatkan tubuh.', 'Das Lagerfeuer wärmt den Körper.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(6, 'Meja', 'Tisch', 'benda', 'perabot yang memiliki permukaan datar dan satu atau lebih kaki untuk menopangnya', 'ein Möbelstück mit einer flachen Oberfläche und einem oder mehreren Beinen zur Unterstützung', 'Saya meletakkan buku di atas meja.', 'Ich lege das Buch auf den Tisch.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(7, 'Kursi', 'Stuhl', 'benda', 'perabot untuk duduk', 'ein Möbelstück zum Sitzen', 'Saya duduk di kursi.', 'Ich sitze auf dem Stuhl.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(8, 'Lampu', 'Lampe', 'benda', 'alat penerangan yang menghasilkan cahaya', 'ein Beleuchtungsgerät, das Licht erzeugt', 'Saya menyalakan lampu.', 'Ich schalte das Licht ein.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(9, 'Pintu', 'Tür', 'benda', 'bukaan pada tembok yang dapat ditutup dan dibuka untuk keluar masuk', 'eine Öffnung in einer Wand, die zum Ein- und Ausgehen geschlossen und geöffnet werden kann', 'Saya membuka pintu.', 'Ich öffne die Tür.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(10, 'Jendela', 'Fenster', 'benda', 'bukaan pada tembok yang dilapisi kaca untuk memasukkan cahaya dan udara', 'eine Öffnung in einer Wand, die mit Glas bedeckt ist, um Licht und Luft hereinzulassen', 'Saya melihat keluar jendela.', 'Ich schaue aus dem Fenster.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(11, 'Berjalan', 'Gehen', 'kerja', 'bergerak dengan melangkahkan kaki secara bergantian', 'sich mit abwechselnden Schritten fortbewegen', 'Saya berjalan kaki ke sekolah.', 'Ich gehe zu Fuß zur Schule.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(12, 'Berenang', 'Schwimmen', 'kerja', 'bergerak di air dengan menggunakan gerakan kaki dan tangan', 'sich im Wasser mit den Füßen und Händen fortbewegen', 'Saya berenang di kolam renang.', 'Ich schwimme im Pool.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(13, 'Bermain', 'Spielen', 'kerja', 'melakukan kegiatan untuk bersenang-senang', 'Aktivitäten zum Spaß unternehmen', 'Anak-anak bermain di taman.', 'Die Kinder spielen im Park.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(14, 'Bernyanyi', 'Singen', 'kerja', 'menghasilkan suara melodis dengan mulut', 'Töne mit dem Mund erzeugen, um eine Melodie zu erzeugen', 'Saya bernyanyi lagu favorit.', 'Ich singe mein Lieblingslied.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(15, 'Baik', 'Gut', 'sifat', 'memiliki sifat positif', 'positive Eigenschaften haben', 'Dia adalah orang yang baik.', 'Er ist ein guter Mensch.', '2024-03-12 02:18:31', '2024-03-12 02:18:31'),
(16, 'Buruk', 'Schlecht', 'sifat', 'memiliki sifat negatif', 'negative Eigenschaften haben', 'Cuaca hari ini buruk.', 'Das Wetter ist heute schlecht.', '2024-03-12 02:18:31', '2024-03-12 02:18:31');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `word`
--
ALTER TABLE `word`
  ADD PRIMARY KEY (`id_kata`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `word`
--
ALTER TABLE `word`
  MODIFY `id_kata` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
