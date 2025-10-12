-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Paź 2025, 11:48
-- Wersja serwera: 10.4.20-MariaDB
-- Wersja PHP: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `tartak`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `po_obrobce`
--

CREATE TABLE `po_obrobce` (
  `nazwa` text NOT NULL,
  `tonaż` int(11) NOT NULL,
  `cena` int(11) NOT NULL,
  `zapotrzebowanie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `po_obrobce`
--

INSERT INTO `po_obrobce` (`nazwa`, `tonaż`, `cena`, `zapotrzebowanie`) VALUES
('brzoza', 98, 1681, 101),
('buk', 54, 2860, 67),
('dąb', 68, 3158, 52),
('jesion', 110, 1782, 99),
('olcha', 76, 1476, 66);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `po_obrobce`
--
ALTER TABLE `po_obrobce`
  ADD PRIMARY KEY (`nazwa`(20));
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
