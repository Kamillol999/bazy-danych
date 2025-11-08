-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 08 Lis 2025, 14:48
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
-- Baza danych: `polish_car_market_2023`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `car_brands`
--

CREATE TABLE `car_brands` (
  `brand_id` int(11) NOT NULL,
  `brand_name` varchar(50) NOT NULL,
  `establishing_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `car_brands`
--

INSERT INTO `car_brands` (`brand_id`, `brand_name`, `establishing_date`) VALUES
(1, 'Toyota', '1937-08-28'),
(2, 'Skoda', '1895-12-18'),
(3, 'Volkswagen', '1937-05-28'),
(4, 'Kia', '1944-12-11'),
(5, 'Hyundai', '1967-12-29'),
(6, 'Dacia', '1966-08-30'),
(7, 'Opel', '1862-01-21'),
(8, 'Ford', '1903-06-16'),
(9, 'Renault', '1899-02-25'),
(10, 'Nissan', '1933-12-26'),
(11, 'Fiat', '1899-07-11'),
(12, 'Peugeot', '1810-03-02'),
(13, 'Citroen', '1919-06-04'),
(14, 'Suzuki', '1909-10-01'),
(15, 'Seat', '1950-05-09'),
(16, 'Mazda', '1920-01-30'),
(17, 'BMW', '1916-03-07'),
(18, 'Mercedes-Benz', '1926-06-28'),
(19, 'Audi', '1909-07-16'),
(20, 'Volvo', '1927-04-14');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `car_models`
--

CREATE TABLE `car_models` (
  `model_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `model_name` varchar(50) NOT NULL,
  `units_sold` int(11) DEFAULT NULL,
  `avg_price_pln` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `car_models`
--

INSERT INTO `car_models` (`model_id`, `brand_id`, `model_name`, `units_sold`, `avg_price_pln`) VALUES
(1, 1, 'Corolla', 17500, '105000.00'),
(2, 2, 'Octavia', 16800, '110000.00'),
(3, 1, 'Yaris', 15200, '72000.00'),
(4, 4, 'Sportage', 14500, '125000.00'),
(5, 5, 'Tucson', 13800, '130000.00'),
(6, 1, 'C-HR', 12400, '120000.00'),
(7, 3, 'Golf', 11900, '115000.00'),
(8, 6, 'Duster', 11100, '80000.00'),
(9, 2, 'Kamiq', 10000, '90000.00'),
(10, 3, 'T-Roc', 9700, '125000.00'),
(11, 7, 'Astra', 9300, '95000.00'),
(12, 4, 'Ceed', 8600, '90000.00'),
(13, 5, 'i30', 7900, '85000.00'),
(14, 9, 'Clio', 7200, '75000.00'),
(15, 8, 'Focus', 6500, '100000.00'),
(16, 10, 'Qashqai', 5800, '135000.00'),
(17, 3, 'T-Cross', 5100, '105000.00'),
(18, 11, '500', 4400, '65000.00'),
(19, 12, '2008', 3700, '115000.00'),
(20, 13, 'C3', 3000, '70000.00'),
(21, 14, 'Vitara', 2600, '95000.00'),
(22, 15, 'Leon', 2200, '105000.00'),
(23, 16, 'CX-30', 1800, '130000.00'),
(24, 17, 'X1', 1400, '175000.00'),
(25, 18, 'A-Class', 1000, '165000.00'),
(26, 19, 'A3', 800, '155000.00'),
(27, 20, 'XC40', 600, '185000.00'),
(28, 2, 'Fabia', 4800, '70000.00'),
(29, 3, 'Passat', 4400, '145000.00'),
(30, 1, 'RAV4', 4000, '155000.00'),
(31, 4, 'Stonic', 3600, '85000.00'),
(32, 5, 'i20', 3200, '65000.00'),
(33, 6, 'Sandero', 2800, '55000.00'),
(34, 7, 'Corsa', 2400, '75000.00'),
(35, 8, 'Kuga', 2000, '140000.00'),
(36, 12, '308', 1600, '110000.00'),
(37, 9, 'Captur', 1200, '95000.00'),
(38, 13, 'C4', 800, '105000.00'),
(39, 15, 'Arona', 400, '90000.00'),
(40, 16, 'CX-5', 300, '150000.00'),
(41, 14, 'Swift', 250, '60000.00'),
(42, 11, 'Tipo', 200, '80000.00'),
(43, 10, 'Micra', 150, '65000.00'),
(44, 17, '3 Series', 100, '195000.00'),
(45, 18, 'GLA', 80, '185000.00'),
(46, 19, 'Q3', 60, '180000.00'),
(47, 20, 'XC60', 40, '225000.00'),
(48, 2, 'Superb', 2500, '155000.00'),
(49, 3, 'Tiguan', 2200, '150000.00'),
(50, 1, 'Aygo', 1900, '50000.00'),
(51, 4, 'Rio', 1600, '60000.00'),
(52, 5, 'Kona', 1300, '115000.00'),
(53, 6, 'Logan', 1000, '50000.00'),
(54, 7, 'Crossland', 700, '90000.00'),
(55, 8, 'Fiesta', 400, '70000.00'),
(56, 12, '3008', 300, '145000.00'),
(57, 9, 'Megane', 200, '105000.00'),
(58, 13, 'C3 Aircross', 150, '95000.00'),
(59, 15, 'Ibiza', 100, '75000.00'),
(60, 16, '3', 80, '115000.00'),
(61, 14, 'SX4 S-Cross', 60, '105000.00'),
(62, 11, 'Panda', 40, '45000.00'),
(63, 10, 'Juke', 30, '100000.00'),
(64, 17, 'X3', 25, '235000.00'),
(65, 18, 'CLA', 20, '175000.00'),
(66, 19, 'A4', 15, '185000.00'),
(67, 20, 'S60', 10, '195000.00'),
(68, 2, 'Scala', 1800, '85000.00'),
(69, 3, 'ID.3', 1500, '175000.00'),
(70, 1, 'Camry', 1200, '155000.00'),
(71, 4, 'Niro', 900, '135000.00'),
(72, 5, 'Bayon', 600, '90000.00'),
(73, 6, 'Spring', 300, '95000.00'),
(74, 7, 'Mokka', 200, '115000.00'),
(75, 8, 'Puma', 150, '105000.00'),
(76, 12, '208', 100, '80000.00'),
(77, 9, 'Arkana', 80, '125000.00'),
(78, 13, 'C4 Cactus', 60, '90000.00'),
(79, 15, 'Ateca', 40, '135000.00'),
(80, 16, '2', 30, '75000.00'),
(81, 14, 'Ignis', 20, '60000.00'),
(82, 11, '500X', 15, '105000.00'),
(83, 10, 'Leaf', 10, '155000.00'),
(84, 17, '1 Series', 8, '145000.00'),
(85, 18, 'B-Class', 6, '155000.00'),
(86, 19, 'Q2', 4, '135000.00'),
(87, 20, 'V60', 2, '205000.00'),
(88, 2, 'Enyaq', 1000, '215000.00'),
(89, 3, 'Arteon', 800, '185000.00'),
(90, 1, 'Proace City', 600, '115000.00'),
(91, 4, 'XCeed', 400, '125000.00'),
(92, 5, 'Santa Fe', 200, '195000.00'),
(93, 6, 'Jogger', 100, '90000.00'),
(94, 7, 'Grandland', 50, '135000.00'),
(95, 8, 'Mondeo', 25, '155000.00'),
(96, 12, '5008', 10, '175000.00'),
(97, 9, 'Talisman', 5, '165000.00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `polish_car_sales_2023`
--

CREATE TABLE `polish_car_sales_2023` (
  `id` int(11) NOT NULL,
  `brand` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `units_sold` int(11) DEFAULT NULL,
  `avg_price_pln` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `polish_car_sales_2023`
--

INSERT INTO `polish_car_sales_2023` (`id`, `brand`, `model`, `units_sold`, `avg_price_pln`) VALUES
(1, 'Toyota', 'Corolla', 19850, '105000.00'),
(2, 'Skoda', 'Octavia', 15730, '112000.00'),
(3, 'Toyota', 'Yaris', 14560, '78000.00'),
(4, 'Kia', 'Sportage', 12450, '125000.00'),
(5, 'Volkswagen', 'Golf', 11980, '118000.00'),
(6, 'Toyota', 'C-HR', 10870, '132000.00'),
(7, 'Hyundai', 'Tucson', 9750, '135000.00'),
(8, 'Dacia', 'Duster', 9120, '85000.00'),
(9, 'Skoda', 'Kamiq', 8950, '98000.00'),
(10, 'Volkswagen', 'T-Roc', 8740, '120000.00'),
(11, 'Kia', 'Ceed', 8520, '95000.00'),
(12, 'Opel', 'Corsa', 8310, '72000.00'),
(13, 'Hyundai', 'i30', 8150, '88000.00'),
(14, 'Toyota', 'RAV4', 7980, '155000.00'),
(15, 'Fiat', '500', 7820, '65000.00'),
(16, 'Renault', 'Clio', 7650, '70000.00'),
(17, 'Skoda', 'Fabia', 7540, '68000.00'),
(18, 'Ford', 'Focus', 7320, '105000.00'),
(19, 'Nissan', 'Qashqai', 7180, '130000.00'),
(20, 'Volkswagen', 'T-Cross', 7050, '95000.00'),
(21, 'Suzuki', 'Vitara', 6920, '92000.00'),
(22, 'Dacia', 'Sandero', 6780, '60000.00'),
(23, 'Peugeot', '2008', 6650, '110000.00'),
(24, 'Kia', 'Stonic', 6520, '85000.00'),
(25, 'Opel', 'Astra', 6390, '98000.00'),
(26, 'Hyundai', 'i20', 6260, '72000.00'),
(27, 'Mazda', 'CX-30', 6130, '125000.00'),
(28, 'Renault', 'Captur', 6000, '95000.00'),
(29, 'Citroen', 'C3', 5870, '68000.00'),
(30, 'Volkswagen', 'Tiguan', 5740, '145000.00'),
(31, 'Seat', 'Leon', 5610, '110000.00'),
(32, 'Ford', 'Kuga', 5480, '140000.00'),
(33, 'Skoda', 'Karoq', 5350, '128000.00'),
(34, 'BMW', 'Series 3', 5220, '195000.00'),
(35, 'Mercedes-Benz', 'A-Class', 5090, '165000.00'),
(36, 'Audi', 'A3', 4960, '155000.00'),
(37, 'Volvo', 'XC40', 4830, '185000.00'),
(38, 'Peugeot', '208', 4700, '75000.00'),
(39, 'Toyota', 'Aygo', 4570, '55000.00'),
(40, 'Kia', 'Rio', 4440, '68000.00'),
(41, 'Fiat', 'Tipo', 4310, '72000.00'),
(42, 'Suzuki', 'Swift', 4180, '65000.00'),
(43, 'Opel', 'Crossland', 4050, '88000.00'),
(44, 'Hyundai', 'Kona', 3920, '110000.00'),
(45, 'Mazda', 'CX-5', 3790, '145000.00'),
(46, 'Seat', 'Arona', 3660, '92000.00'),
(47, 'Dacia', 'Spring', 3530, '105000.00'),
(48, 'Citroen', 'C3 Aircross', 3400, '95000.00'),
(49, 'Ford', 'Puma', 3270, '100000.00'),
(50, 'Renault', 'Megane', 3140, '105000.00'),
(51, 'Volkswagen', 'ID.3', 3010, '175000.00'),
(52, 'Skoda', 'Scala', 2880, '85000.00'),
(53, 'Peugeot', '3008', 2750, '155000.00'),
(54, 'Toyota', 'Camry', 2620, '160000.00'),
(55, 'Kia', 'Picanto', 2490, '55000.00'),
(56, 'BMW', 'X1', 2360, '175000.00'),
(57, 'Mercedes-Benz', 'GLA', 2230, '185000.00'),
(58, 'Audi', 'Q3', 2100, '180000.00'),
(59, 'Volvo', 'XC60', 1970, '220000.00'),
(60, 'Nissan', 'Micra', 1840, '65000.00'),
(61, 'Hyundai', 'Bayon', 1710, '85000.00'),
(62, 'Mazda', '3', 1580, '115000.00'),
(63, 'Seat', 'Ibiza', 1450, '72000.00'),
(64, 'Fiat', 'Panda', 1320, '52000.00'),
(65, 'Suzuki', 'SX4 S-Cross', 1190, '98000.00'),
(66, 'Opel', 'Mokka', 1060, '105000.00'),
(67, 'Citroen', 'C4', 930, '95000.00'),
(68, 'Ford', 'Fiesta', 800, '75000.00'),
(69, 'Renault', 'Arkana', 670, '120000.00'),
(70, 'Volkswagen', 'Polo', 540, '78000.00'),
(71, 'Skoda', 'Superb', 410, '145000.00'),
(72, 'Peugeot', '508', 280, '155000.00'),
(73, 'Toyota', 'Prius', 150, '140000.00'),
(74, 'Kia', 'Sorento', 120, '195000.00'),
(75, 'BMW', 'X3', 100, '235000.00'),
(76, 'Mercedes-Benz', 'C-Class', 90, '210000.00'),
(77, 'Audi', 'A4', 80, '195000.00'),
(78, 'Volvo', 'S60', 70, '185000.00'),
(79, 'Nissan', 'Leaf', 60, '165000.00'),
(80, 'Hyundai', 'Ioniq', 50, '155000.00'),
(81, 'Mazda', '6', 40, '150000.00'),
(82, 'Seat', 'Tarraco', 30, '165000.00'),
(83, 'Fiat', '500X', 20, '105000.00'),
(84, 'Suzuki', 'Ignis', 15, '68000.00'),
(85, 'Opel', 'Insignia', 12, '140000.00'),
(86, 'Citroen', 'C5 Aircross', 10, '135000.00'),
(87, 'Ford', 'Mondeo', 8, '145000.00'),
(88, 'Renault', 'Talisman', 6, '150000.00'),
(89, 'Volkswagen', 'Passat', 5, '155000.00'),
(90, 'Skoda', 'Enyaq', 4, '220000.00'),
(91, 'Peugeot', '5008', 3, '175000.00'),
(92, 'Toyota', 'Mirai', 2, '280000.00'),
(93, 'Kia', 'EV6', 1, '240000.00');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `car_brands`
--
ALTER TABLE `car_brands`
  ADD PRIMARY KEY (`brand_id`),
  ADD UNIQUE KEY `brand_name` (`brand_name`);

--
-- Indeksy dla tabeli `car_models`
--
ALTER TABLE `car_models`
  ADD PRIMARY KEY (`model_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indeksy dla tabeli `polish_car_sales_2023`
--
ALTER TABLE `polish_car_sales_2023`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT dla zrzuconych tabel
--

--
-- AUTO_INCREMENT dla tabeli `car_brands`
--
ALTER TABLE `car_brands`
  MODIFY `brand_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT dla tabeli `car_models`
--
ALTER TABLE `car_models`
  MODIFY `model_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=98;

--
-- AUTO_INCREMENT dla tabeli `polish_car_sales_2023`
--
ALTER TABLE `polish_car_sales_2023`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `car_models`
--
ALTER TABLE `car_models`
  ADD CONSTRAINT `car_models_ibfk_1` FOREIGN KEY (`brand_id`) REFERENCES `car_brands` (`brand_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
