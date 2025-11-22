-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 22 Lis 2025, 16:16
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
-- Baza danych: `lotr`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `armie`
--

CREATE TABLE `armie` (
  `id` int(11) NOT NULL,
  `krolestwo_id` int(11) NOT NULL,
  `nazwa` varchar(120) NOT NULL,
  `zdrowie_max` int(11) NOT NULL CHECK (`zdrowie_max` > 0),
  `zdrowie_akt` int(11) NOT NULL CHECK (`zdrowie_akt` >= 0),
  `morale` tinyint(4) NOT NULL CHECK (`morale` between 1 and 10),
  `doswiadczenie` tinyint(4) NOT NULL CHECK (`doswiadczenie` between 1 and 10)
) ;

--
-- Zrzut danych tabeli `armie`
--

INSERT INTO `armie` (`id`, `krolestwo_id`, `nazwa`, `zdrowie_max`, `zdrowie_akt`, `morale`, `doswiadczenie`) VALUES
(101, 1, 'Strażnicy Białego Miasta', 100, 85, 8, 8),
(102, 1, 'Gwardia Osgiliath', 100, 72, 7, 7),
(201, 2, 'Jeźdźcy Rohanu', 100, 90, 9, 7),
(202, 2, 'Straż Edoras', 100, 76, 7, 6),
(301, 3, 'Legiony Mordoru', 120, 98, 8, 9),
(302, 3, 'Trolle Szturmowe', 130, 88, 7, 8),
(401, 4, 'Uruk-hai Isengardu', 110, 70, 8, 8),
(402, 4, 'Watahy Wargów', 100, 64, 6, 6),
(501, 5, 'Korpus Haradrimów', 110, 82, 7, 7),
(502, 5, 'Mûmakile Południa', 140, 110, 6, 8);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bitwy`
--

CREATE TABLE `bitwy` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(150) NOT NULL,
  `miejsce` varchar(120) NOT NULL,
  `data` date DEFAULT NULL,
  `wynik` enum('zwyciestwo_sojusz','zwyciestwo_zrzeszenie','nierozstrzygnieta') NOT NULL,
  `opis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `bitwy`
--

INSERT INTO `bitwy` (`id`, `nazwa`, `miejsce`, `data`, `wynik`, `opis`) VALUES
(1, 'Bitwa o Helmowy Jar', 'Hornburg (Rohan)', '3019-03-03', 'zwyciestwo_sojusz', 'Obrona Rohanu przed Isengardem'),
(2, 'Bitwa na Polach Pelennoru', 'Minas Tirith (Gondor)', '3019-03-15', 'zwyciestwo_sojusz', 'Gondor i Rohan przeciw Mordorowi i Haradowi'),
(3, 'Bitwa pod Morannon', 'Czarna Brama (Mordor)', '3019-03-25', 'zwyciestwo_sojusz', 'Wyprawa pod Czarną Bramę przeciw wojskom Mordoru');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bitwy_uczestnicy`
--

CREATE TABLE `bitwy_uczestnicy` (
  `bitwa_id` int(11) NOT NULL,
  `krolestwo_id` int(11) NOT NULL,
  `strona` enum('atak','obrona') NOT NULL,
  `straty_wojsko` int(11) NOT NULL DEFAULT 0 CHECK (`straty_wojsko` >= 0),
  `rezultat` enum('zwyciestwo','porażka','brak') NOT NULL DEFAULT 'brak'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `bitwy_uczestnicy`
--

INSERT INTO `bitwy_uczestnicy` (`bitwa_id`, `krolestwo_id`, `strona`, `straty_wojsko`, `rezultat`) VALUES
(1, 2, 'obrona', 1200, 'zwyciestwo'),
(1, 4, 'atak', 3000, 'porażka'),
(2, 1, 'obrona', 3500, 'zwyciestwo'),
(2, 2, 'atak', 1800, 'zwyciestwo'),
(2, 3, 'atak', 7000, 'porażka'),
(2, 5, 'atak', 2500, 'porażka'),
(3, 1, 'atak', 1200, 'zwyciestwo'),
(3, 2, 'atak', 900, 'zwyciestwo'),
(3, 3, 'obrona', 6000, 'porażka');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `krolestwa`
--

CREATE TABLE `krolestwa` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(100) NOT NULL,
  `obszar` varchar(100) NOT NULL,
  `typ` varchar(50) NOT NULL,
  `stolica` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `krolestwa`
--

INSERT INTO `krolestwa` (`id`, `nazwa`, `obszar`, `typ`, `stolica`) VALUES
(1, 'Gondor', 'Południe', 'ludzie', 'Minas Tirith'),
(2, 'Rohan', 'Zachód', 'ludzie', 'Edoras'),
(3, 'Mordor', 'Wschód', 'orki', 'Barad-dûr'),
(4, 'Isengard', 'Zachód', 'ludzie (czarni czarownicy)', 'Orthanc'),
(5, 'Haradwaith', 'Południe', 'ludzie (Południe)', NULL);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `krolestwa_sojusze`
--

CREATE TABLE `krolestwa_sojusze` (
  `krolestwo_id` int(11) NOT NULL,
  `sojusz_id` int(11) NOT NULL,
  `rola` enum('czlonek','lider','wspierajacy') NOT NULL DEFAULT 'czlonek'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `krolestwa_sojusze`
--

INSERT INTO `krolestwa_sojusze` (`krolestwo_id`, `sojusz_id`, `rola`) VALUES
(1, 1, 'lider'),
(2, 1, 'czlonek'),
(3, 2, 'lider'),
(4, 2, 'czlonek'),
(5, 2, 'czlonek');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `sojusze`
--

CREATE TABLE `sojusze` (
  `id` int(11) NOT NULL,
  `nazwa` varchar(120) NOT NULL,
  `typ` enum('sojusz','zrzeszenie') NOT NULL,
  `opis` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `sojusze`
--

INSERT INTO `sojusze` (`id`, `nazwa`, `typ`, `opis`) VALUES
(1, 'Sojusz Gondoru i Rohanu', 'sojusz', 'Tradycyjny sojusz ludzi Zachodu'),
(2, 'Zrzeszenie Trzech', 'zrzeszenie', 'Wspólny blok interesów: Mordor, Isengard, Harad');

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `v_saldo_mocy`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `v_saldo_mocy` (
`krolestwo_id` int(11)
,`nazwa` varchar(100)
,`wojsko` int(11)
,`zdolnosc_bojowa` tinyint(4)
,`zdolnosc_obronna` tinyint(4)
,`wsk_mocy` bigint(15)
);

-- --------------------------------------------------------

--
-- Zastąpiona struktura widoku `v_sojusze_czlonkowie`
-- (Zobacz poniżej rzeczywisty widok)
--
CREATE TABLE `v_sojusze_czlonkowie` (
`sojusz` varchar(120)
,`typ` enum('sojusz','zrzeszenie')
,`krolestwo` varchar(100)
,`rola` enum('czlonek','lider','wspierajacy')
);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `wskazniki`
--

CREATE TABLE `wskazniki` (
  `krolestwo_id` int(11) NOT NULL,
  `poziom_agresji` tinyint(4) NOT NULL CHECK (`poziom_agresji` between 1 and 10),
  `zdolnosc_obronna` tinyint(4) NOT NULL CHECK (`zdolnosc_obronna` between 1 and 10),
  `zdolnosc_bojowa` tinyint(4) NOT NULL CHECK (`zdolnosc_bojowa` between 1 and 10)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `wskazniki`
--

INSERT INTO `wskazniki` (`krolestwo_id`, `poziom_agresji`, `zdolnosc_obronna`, `zdolnosc_bojowa`) VALUES
(1, 4, 8, 8),
(2, 3, 7, 7),
(3, 9, 7, 9),
(4, 7, 6, 8),
(5, 6, 5, 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zasoby`
--

CREATE TABLE `zasoby` (
  `krolestwo_id` int(11) NOT NULL,
  `zloto` int(11) NOT NULL CHECK (`zloto` >= 0),
  `wojsko` int(11) NOT NULL CHECK (`wojsko` >= 0),
  `krysztaly_endu` int(11) NOT NULL CHECK (`krysztaly_endu` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `zasoby`
--

INSERT INTO `zasoby` (`krolestwo_id`, `zloto`, `wojsko`, `krysztaly_endu`) VALUES
(1, 120000, 38000, 12),
(2, 45000, 18000, 3),
(3, 80000, 95000, 25),
(4, 30000, 16000, 7),
(5, 50000, 22000, 5);

-- --------------------------------------------------------

--
-- Struktura widoku `v_saldo_mocy`
--
DROP TABLE IF EXISTS `v_saldo_mocy`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_saldo_mocy`  AS SELECT `k`.`id` AS `krolestwo_id`, `k`.`nazwa` AS `nazwa`, `z`.`wojsko` AS `wojsko`, `w`.`zdolnosc_bojowa` AS `zdolnosc_bojowa`, `w`.`zdolnosc_obronna` AS `zdolnosc_obronna`, `z`.`wojsko`* (`w`.`zdolnosc_bojowa` + `w`.`zdolnosc_obronna`) AS `wsk_mocy` FROM ((`krolestwa` `k` join `zasoby` `z` on(`z`.`krolestwo_id` = `k`.`id`)) join `wskazniki` `w` on(`w`.`krolestwo_id` = `k`.`id`)) ;

-- --------------------------------------------------------

--
-- Struktura widoku `v_sojusze_czlonkowie`
--
DROP TABLE IF EXISTS `v_sojusze_czlonkowie`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_sojusze_czlonkowie`  AS SELECT `s`.`nazwa` AS `sojusz`, `s`.`typ` AS `typ`, `k`.`nazwa` AS `krolestwo`, `ks`.`rola` AS `rola` FROM ((`sojusze` `s` join `krolestwa_sojusze` `ks` on(`ks`.`sojusz_id` = `s`.`id`)) join `krolestwa` `k` on(`k`.`id` = `ks`.`krolestwo_id`)) ;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `armie`
--
ALTER TABLE `armie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_armie_krolestwo` (`krolestwo_id`);

--
-- Indeksy dla tabeli `bitwy`
--
ALTER TABLE `bitwy`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `bitwy_uczestnicy`
--
ALTER TABLE `bitwy_uczestnicy`
  ADD PRIMARY KEY (`bitwa_id`,`krolestwo_id`),
  ADD KEY `idx_bu_bitwa` (`bitwa_id`),
  ADD KEY `idx_bu_krolestwo` (`krolestwo_id`);

--
-- Indeksy dla tabeli `krolestwa`
--
ALTER TABLE `krolestwa`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nazwa` (`nazwa`);

--
-- Indeksy dla tabeli `krolestwa_sojusze`
--
ALTER TABLE `krolestwa_sojusze`
  ADD PRIMARY KEY (`krolestwo_id`,`sojusz_id`),
  ADD KEY `idx_ks_sojusz` (`sojusz_id`);

--
-- Indeksy dla tabeli `sojusze`
--
ALTER TABLE `sojusze`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nazwa` (`nazwa`);

--
-- Indeksy dla tabeli `wskazniki`
--
ALTER TABLE `wskazniki`
  ADD PRIMARY KEY (`krolestwo_id`);

--
-- Indeksy dla tabeli `zasoby`
--
ALTER TABLE `zasoby`
  ADD PRIMARY KEY (`krolestwo_id`);

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `armie`
--
ALTER TABLE `armie`
  ADD CONSTRAINT `fk_arm_krol` FOREIGN KEY (`krolestwo_id`) REFERENCES `krolestwa` (`id`);

--
-- Ograniczenia dla tabeli `bitwy_uczestnicy`
--
ALTER TABLE `bitwy_uczestnicy`
  ADD CONSTRAINT `fk_bu_bit` FOREIGN KEY (`bitwa_id`) REFERENCES `bitwy` (`id`),
  ADD CONSTRAINT `fk_bu_krol` FOREIGN KEY (`krolestwo_id`) REFERENCES `krolestwa` (`id`);

--
-- Ograniczenia dla tabeli `krolestwa_sojusze`
--
ALTER TABLE `krolestwa_sojusze`
  ADD CONSTRAINT `fk_ks_krol` FOREIGN KEY (`krolestwo_id`) REFERENCES `krolestwa` (`id`),
  ADD CONSTRAINT `fk_ks_soj` FOREIGN KEY (`sojusz_id`) REFERENCES `sojusze` (`id`);

--
-- Ograniczenia dla tabeli `wskazniki`
--
ALTER TABLE `wskazniki`
  ADD CONSTRAINT `fk_wsk_krol` FOREIGN KEY (`krolestwo_id`) REFERENCES `krolestwa` (`id`);

--
-- Ograniczenia dla tabeli `zasoby`
--
ALTER TABLE `zasoby`
  ADD CONSTRAINT `fk_zas_krol` FOREIGN KEY (`krolestwo_id`) REFERENCES `krolestwa` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
