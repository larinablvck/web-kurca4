-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Май 29 2019 г., 15:46
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `kursach`
--

-- --------------------------------------------------------

--
-- Структура таблицы `akc`
--

CREATE TABLE IF NOT EXISTS `akc` (
  `id_akc` int(11) NOT NULL DEFAULT '0',
  `id_type_akc` int(11) DEFAULT NULL,
  `id_tovar` int(11) DEFAULT NULL,
  `id_type_tovar` int(11) DEFAULT NULL,
  `id_marok` int(11) DEFAULT NULL,
  `data_start` date DEFAULT NULL,
  `data_fin` date DEFAULT NULL,
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_akc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `contact`
--

CREATE TABLE IF NOT EXISTS `contact` (
  `ur_adres` varchar(255) NOT NULL,
  `fc_adres` varchar(255) NOT NULL,
  `telefon` int(11) NOT NULL,
  `e-mail` varchar(255) NOT NULL,
  `inn` int(11) NOT NULL,
  `kpp` int(11) NOT NULL,
  `ogrn` int(11) NOT NULL,
  `r/sch` int(11) NOT NULL,
  `ao` varchar(255) NOT NULL,
  `k/sch` int(11) NOT NULL,
  `bic` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `contact`
--

INSERT INTO `contact` (`ur_adres`, `fc_adres`, `telefon`, `e-mail`, `inn`, `kpp`, `ogrn`, `r/sch`, `ao`, `k/sch`, `bic`) VALUES
('119261 г. Ялта, Сапун д. 72/2', '119261 г. Севастополь, Сапун д. 72/2', 12345, 'qweqe', 555, 235365, 53757, 111177777, 'qefwrdvrdvc', 12334, 3546);

-- --------------------------------------------------------

--
-- Структура таблицы `katalog_marok`
--

CREATE TABLE IF NOT EXISTS `katalog_marok` (
  `id_marok` int(11) NOT NULL,
  `id_tovar` int(11) NOT NULL,
  `Id_akc` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_marok`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `katalog_marok`
--

INSERT INTO `katalog_marok` (`id_marok`, `id_tovar`, `Id_akc`, `name`) VALUES
(1, 1, 1, 'qwert'),
(2, 2, 2, 'abc');

-- --------------------------------------------------------

--
-- Структура таблицы `list_prod`
--

CREATE TABLE IF NOT EXISTS `list_prod` (
  `id_tovar` int(11) NOT NULL,
  `data_prod` date NOT NULL,
  `name` varchar(255) NOT NULL,
  `kolvo` int(11) NOT NULL,
  `stoimost` decimal(10,0) NOT NULL,
  `stoimost_skidka` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id_tovar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE IF NOT EXISTS `news` (
  `id_news` int(11) NOT NULL,
  `data_start` date NOT NULL,
  `data_fin` date NOT NULL,
  `opisanie` text NOT NULL,
  `type` varchar(255) NOT NULL,
  PRIMARY KEY (`id_news`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pokupatel`
--

CREATE TABLE IF NOT EXISTS `pokupatel` (
  `id_pokupatel` int(11) NOT NULL,
  `id_zakaz_pokupka` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  `tel` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `card` int(20) NOT NULL,
  PRIMARY KEY (`id_pokupatel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `postavshik`
--

CREATE TABLE IF NOT EXISTS `postavshik` (
  `id_postavshik` int(11) NOT NULL,
  `id_zakaz_postavka` int(11) NOT NULL,
  `fio` varchar(255) NOT NULL,
  `inn` int(11) NOT NULL,
  `tel` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `adres` varchar(255) NOT NULL,
  PRIMARY KEY (`id_postavshik`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `tovar`
--

CREATE TABLE IF NOT EXISTS `tovar` (
  `id_tovar` int(11) NOT NULL,
  `id_akc` int(11) NOT NULL,
  `id_marok` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `stoimost` decimal(10,0) NOT NULL,
  `kolvo_tovar` int(11) NOT NULL,
  PRIMARY KEY (`id_tovar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_akc`
--

CREATE TABLE IF NOT EXISTS `type_akc` (
  `id_type_akc` int(11) NOT NULL DEFAULT '0',
  `id_akc` int(11) DEFAULT NULL,
  `name` text,
  PRIMARY KEY (`id_type_akc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `type_tovar`
--

CREATE TABLE IF NOT EXISTS `type_tovar` (
  `id_akc` int(11) DEFAULT NULL,
  `id_type_tovar` int(11) NOT NULL DEFAULT '0',
  `name` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_type_tovar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `t_t_t`
--

CREATE TABLE IF NOT EXISTS `t_t_t` (
  `id_tovar` int(11) NOT NULL DEFAULT '0',
  `id_type_tovar` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_tovar`,`id_type_tovar`),
  KEY `ID_TYPE_TOVAR` (`id_type_tovar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `t_z_p`
--

CREATE TABLE IF NOT EXISTS `t_z_p` (
  `id_tovar` int(11) NOT NULL,
  `id_zakaz_postavka` int(11) NOT NULL,
  PRIMARY KEY (`id_tovar`,`id_zakaz_postavka`),
  KEY `id_zakaz_postavka` (`id_zakaz_postavka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `t_z_pok`
--

CREATE TABLE IF NOT EXISTS `t_z_pok` (
  `id_tovar` int(11) NOT NULL,
  `id_zakaz_pokupka` int(11) NOT NULL,
  PRIMARY KEY (`id_tovar`,`id_zakaz_pokupka`),
  KEY `id_zakaz_pokupka` (`id_zakaz_pokupka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `zakaz_pokupka`
--

CREATE TABLE IF NOT EXISTS `zakaz_pokupka` (
  `id_zakaz_pokupka` int(11) NOT NULL,
  `Id_pokupatel` int(11) NOT NULL,
  `stoimost` decimal(10,0) NOT NULL,
  `kolvo` int(11) NOT NULL,
  `name_tovar` varchar(255) NOT NULL,
  `data` date NOT NULL,
  PRIMARY KEY (`id_zakaz_pokupka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `zakaz_postavka`
--

CREATE TABLE IF NOT EXISTS `zakaz_postavka` (
  `id_zakaz_postavka` int(11) NOT NULL,
  `id_postavshik` int(11) NOT NULL,
  `data` date NOT NULL,
  `stoimost` decimal(10,0) NOT NULL,
  `kolvo_tovar` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id_zakaz_postavka`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `t_t_t`
--
ALTER TABLE `t_t_t`
  ADD CONSTRAINT `@y0_@y0_@y0_ibfk_1` FOREIGN KEY (`id_type_tovar`) REFERENCES `type_tovar` (`id_type_tovar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `@y0_@y0_@y0_ibfk_2` FOREIGN KEY (`id_tovar`) REFERENCES `tovar` (`id_tovar`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `t_z_p`
--
ALTER TABLE `t_z_p`
  ADD CONSTRAINT `@y0_@n0_@v0_ibfk_1` FOREIGN KEY (`id_tovar`) REFERENCES `tovar` (`id_tovar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `@y0_@n0_@v0_ibfk_2` FOREIGN KEY (`id_zakaz_postavka`) REFERENCES `zakaz_postavka` (`id_zakaz_postavka`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `t_z_pok`
--
ALTER TABLE `t_z_pok`
  ADD CONSTRAINT `@y0_@n0_@v0@u0@q0_ibfk_1` FOREIGN KEY (`id_tovar`) REFERENCES `tovar` (`id_tovar`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `@y0_@n0_@v0@u0@q0_ibfk_2` FOREIGN KEY (`id_zakaz_pokupka`) REFERENCES `zakaz_pokupka` (`id_zakaz_pokupka`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
