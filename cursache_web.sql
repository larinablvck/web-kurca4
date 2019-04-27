-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Апр 22 2019 г., 20:23
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `cursache_web`
--

-- --------------------------------------------------------

--
-- Структура таблицы `акции`
--

CREATE TABLE IF NOT EXISTS `акции` (
  `ID_АКЦИИ` int(11) NOT NULL DEFAULT '0',
  `ID_ТИПА_АКЦИИ` int(11) DEFAULT NULL,
  `ID_ТОВАРА` int(11) DEFAULT NULL,
  `ID_ТИПА_ТОВАРА` int(11) DEFAULT NULL,
  `ID_МАРОК` int(11) DEFAULT NULL,
  `ДАТА_НАЧАЛА` date DEFAULT NULL,
  `ДАТА_ОКОНЧАНИЯ` date DEFAULT NULL,
  `НАЗВАНИЕ` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_АКЦИИ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `акции`:
--   `ID_АКЦИИ`
--       `тип_акции` -> `ID_ТИПА_АКЦИИ`
--

-- --------------------------------------------------------

--
-- Структура таблицы `заказ_на_покупку`
--

CREATE TABLE IF NOT EXISTS `заказ_на_покупку` (
  `ID_заказа_на_покупку` int(11) NOT NULL,
  `ID_покупателя` int(11) NOT NULL,
  `Стоимость` decimal(10,0) NOT NULL,
  `Кол-во` int(11) NOT NULL,
  `Название_товара` varchar(255) NOT NULL,
  `Дата` date NOT NULL,
  PRIMARY KEY (`ID_заказа_на_покупку`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `заказ_на_поставку`
--

CREATE TABLE IF NOT EXISTS `заказ_на_поставку` (
  `ID_заказа_на_поставку` int(11) NOT NULL,
  `ID_поставщика` int(11) NOT NULL,
  `Дата` date NOT NULL,
  `Стоимость` decimal(10,0) NOT NULL,
  `Кол-во_товара` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_заказа_на_поставку`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `каталог_марок`
--

CREATE TABLE IF NOT EXISTS `каталог_марок` (
  `ID_марок` int(11) NOT NULL,
  `ID_товара` int(11) NOT NULL,
  `ID_акции` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_марок`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `лист_продаж`
--

CREATE TABLE IF NOT EXISTS `лист_продаж` (
  `ID_товара` int(11) NOT NULL,
  `Дата_продажи` date NOT NULL,
  `Название` varchar(255) NOT NULL,
  `Кол-во` int(11) NOT NULL,
  `Стоимость` decimal(10,0) NOT NULL,
  `Стоимость_со_скидкой` decimal(10,0) NOT NULL,
  PRIMARY KEY (`ID_товара`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `новости`
--

CREATE TABLE IF NOT EXISTS `новости` (
  `ID_новости` int(11) NOT NULL,
  `Дата_начала` date NOT NULL,
  `Дата_конца` date NOT NULL,
  `Описание` text NOT NULL,
  `Тип` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_новости`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `покупатель`
--

CREATE TABLE IF NOT EXISTS `покупатель` (
  `ID_покупателя` int(11) NOT NULL,
  `ID_заказа_на_поставку` int(11) NOT NULL,
  `ФИО` varchar(255) NOT NULL,
  `Адрес` varchar(255) NOT NULL,
  `Телефон` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `Номер_карты` int(20) NOT NULL,
  PRIMARY KEY (`ID_покупателя`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `поставщик`
--

CREATE TABLE IF NOT EXISTS `поставщик` (
  `ID_поставщика` int(11) NOT NULL,
  `ID_заказа_на_поставку` int(11) NOT NULL,
  `Имя_поставщика` varchar(255) NOT NULL,
  `ИНН` int(11) NOT NULL,
  `Телефон` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `Адрес` varchar(255) NOT NULL,
  PRIMARY KEY (`ID_поставщика`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `т_з_п`
--

CREATE TABLE IF NOT EXISTS `т_з_п` (
  `ID_товара` int(11) NOT NULL,
  `ID_заказа_на_поставку` int(11) NOT NULL,
  PRIMARY KEY (`ID_товара`,`ID_заказа_на_поставку`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `т_з_пок`
--

CREATE TABLE IF NOT EXISTS `т_з_пок` (
  `ID_товара` int(11) NOT NULL,
  `ID_заказа_на_покупку` int(11) NOT NULL,
  PRIMARY KEY (`ID_товара`,`ID_заказа_на_покупку`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `т_т_т`
--

CREATE TABLE IF NOT EXISTS `т_т_т` (
  `ID_ТОВАРА` int(11) NOT NULL DEFAULT '0',
  `ID_ТИПА_ТОВАРА` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID_ТОВАРА`,`ID_ТИПА_ТОВАРА`),
  KEY `ID_ТИПА_ТОВАРА` (`ID_ТИПА_ТОВАРА`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- СВЯЗИ ТАБЛИЦЫ `т_т_т`:
--   `ID_ТИПА_ТОВАРА`
--       `тип_товара` -> `ID_ТИПА_ТОВАРА`
--

-- --------------------------------------------------------

--
-- Структура таблицы `тип_акции`
--

CREATE TABLE IF NOT EXISTS `тип_акции` (
  `ID_ТИПА_АКЦИИ` int(11) NOT NULL DEFAULT '0',
  `ID_АКЦИИ` int(11) DEFAULT NULL,
  `НАИМЕНОВАНИЕ` text,
  PRIMARY KEY (`ID_ТИПА_АКЦИИ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `тип_товара`
--

CREATE TABLE IF NOT EXISTS `тип_товара` (
  `ID_АКЦИИ` int(11) DEFAULT NULL,
  `ID_ТИПА_ТОВАРА` int(11) NOT NULL DEFAULT '0',
  `НАЗВАНИЕ_ТИПА_ТОВАРА` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`ID_ТИПА_ТОВАРА`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `товар`
--

CREATE TABLE IF NOT EXISTS `товар` (
  `ID_товара` int(11) NOT NULL,
  `ID_акции` int(11) NOT NULL,
  `ID_марок` int(11) NOT NULL,
  `Название` varchar(255) NOT NULL,
  `Стоимость` decimal(10,0) NOT NULL,
  `Кол-во_товара` int(11) NOT NULL,
  PRIMARY KEY (`ID_товара`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `акции`
--
ALTER TABLE `акции`
  ADD CONSTRAINT `@g0@q0@i1@o0@o0_ibfk_1` FOREIGN KEY (`ID_АКЦИИ`) REFERENCES `тип_акции` (`ID_ТИПА_АКЦИИ`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `т_т_т`
--
ALTER TABLE `т_т_т`
  ADD CONSTRAINT `@y0_@y0_@y0_ibfk_1` FOREIGN KEY (`ID_ТИПА_ТОВАРА`) REFERENCES `тип_товара` (`ID_ТИПА_ТОВАРА`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
