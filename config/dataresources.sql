-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Мар 16 2022 г., 20:53
-- Версия сервера: 10.3.34-MariaDB
-- Версия PHP: 7.1.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `dataresources`
--

-- --------------------------------------------------------

--
-- Структура таблицы `month`
--

CREATE TABLE `month` (
  `id` int(11) NOT NULL,
  `month` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `rus_month` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `month`
--

INSERT INTO `month` (`id`, `month`, `rus_month`) VALUES
(1, 'january', 'январь'),
(2, 'january', 'февраль'),
(3, 'february', 'август'),
(4, 'august', 'сентябрь'),
(5, 'september', 'октябрь'),
(6, 'october', 'ноябрь');

-- --------------------------------------------------------

--
-- Структура таблицы `price`
--

CREATE TABLE `price` (
  `id` int(11) NOT NULL,
  `price` float NOT NULL,
  `type_id` int(11) DEFAULT NULL,
  `tonnages_id` int(11) DEFAULT NULL,
  `month_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `price`
--

INSERT INTO `price` (`id`, `price`, `type_id`, `tonnages_id`, `month_id`) VALUES
(1, 125, 1, 1, 1),
(2, 121, 1, 1, 2),
(3, 137, 1, 1, 3),
(4, 126, 1, 1, 4),
(5, 124, 1, 1, 5),
(6, 128, 1, 1, 6),
(7, 145, 1, 2, 1),
(8, 118, 1, 2, 2),
(9, 119, 1, 2, 3),
(10, 121, 1, 2, 4),
(11, 122, 1, 2, 5),
(12, 147, 1, 2, 6),
(13, 136, 1, 3, 1),
(14, 137, 1, 3, 2),
(15, 141, 1, 3, 3),
(16, 137, 1, 3, 4),
(17, 131, 1, 3, 5),
(18, 143, 1, 3, 6),
(19, 138, 1, 4, 1),
(20, 142, 1, 4, 2),
(21, 117, 1, 4, 3),
(22, 124, 1, 4, 4),
(23, 147, 1, 4, 5),
(24, 112, 1, 4, 6),
(25, 121, 2, 1, 1),
(26, 137, 2, 1, 2),
(27, 124, 2, 1, 3),
(28, 137, 2, 1, 4),
(29, 122, 2, 1, 5),
(30, 125, 2, 1, 6),
(31, 118, 2, 2, 1),
(32, 121, 2, 2, 2),
(33, 145, 2, 2, 3),
(34, 147, 2, 2, 4),
(35, 143, 2, 2, 5),
(36, 145, 2, 2, 6),
(37, 137, 2, 3, 1),
(38, 124, 2, 3, 2),
(39, 136, 2, 3, 3),
(40, 143, 2, 3, 4),
(41, 112, 2, 3, 5),
(42, 136, 2, 3, 6),
(43, 142, 2, 4, 1),
(44, 131, 2, 4, 2),
(45, 138, 2, 4, 3),
(46, 112, 2, 4, 4),
(47, 117, 2, 4, 5),
(48, 138, 2, 4, 6),
(49, 137, 3, 1, 1),
(50, 125, 3, 1, 2),
(51, 124, 3, 1, 3),
(52, 122, 3, 1, 4),
(53, 137, 3, 1, 5),
(54, 121, 3, 1, 6),
(55, 147, 3, 2, 1),
(56, 145, 3, 2, 2),
(57, 145, 3, 2, 3),
(58, 143, 3, 2, 4),
(59, 119, 3, 2, 5),
(60, 118, 3, 2, 6),
(61, 112, 3, 3, 1),
(62, 136, 3, 3, 2),
(63, 136, 3, 3, 3),
(64, 112, 3, 3, 4),
(65, 141, 3, 3, 5),
(66, 137, 3, 3, 6),
(67, 122, 3, 4, 1),
(68, 138, 3, 4, 2),
(69, 138, 3, 4, 3),
(70, 117, 3, 4, 4),
(71, 117, 3, 4, 5),
(72, 142, 3, 4, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `tonnages`
--

CREATE TABLE `tonnages` (
  `id` int(11) NOT NULL,
  `tonnages` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `tonnages`
--

INSERT INTO `tonnages` (`id`, `tonnages`) VALUES
(1, 25),
(2, 50),
(3, 75),
(4, 100);

-- --------------------------------------------------------

--
-- Структура таблицы `types`
--

CREATE TABLE `types` (
  `id` int(11) NOT NULL,
  `type_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `rus_type_name` varchar(10) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Дамп данных таблицы `types`
--

INSERT INTO `types` (`id`, `type_name`, `rus_type_name`) VALUES
(1, 'shrot', 'шрот'),
(2, 'shrot', 'жмых'),
(3, 'zhmyh', 'соя');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `month`
--
ALTER TABLE `month`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `price`
--
ALTER TABLE `price`
  ADD PRIMARY KEY (`id`),
  ADD KEY `type_id` (`type_id`),
  ADD KEY `tonnages_id` (`tonnages_id`),
  ADD KEY `month_id` (`month_id`);

--
-- Индексы таблицы `tonnages`
--
ALTER TABLE `tonnages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `types`
--
ALTER TABLE `types`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `month`
--
ALTER TABLE `month`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `price`
--
ALTER TABLE `price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=73;

--
-- AUTO_INCREMENT для таблицы `tonnages`
--
ALTER TABLE `tonnages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `types`
--
ALTER TABLE `types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `price`
--
ALTER TABLE `price`
  ADD CONSTRAINT `price_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`),
  ADD CONSTRAINT `price_ibfk_2` FOREIGN KEY (`tonnages_id`) REFERENCES `tonnages` (`id`),
  ADD CONSTRAINT `price_ibfk_3` FOREIGN KEY (`month_id`) REFERENCES `month` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
