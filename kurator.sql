-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Сен 23 2015 г., 22:55
-- Версия сервера: 5.6.21
-- Версия PHP: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `kurator`
--
CREATE DATABASE IF NOT EXISTS `kurator` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `kurator`;

-- --------------------------------------------------------

--
-- Структура таблицы `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
`id` int(11) NOT NULL,
  `groupname` varchar(20) NOT NULL,
  `begin_year` int(11) NOT NULL,
  `end_year` int(11) NOT NULL,
  `begin_month` int(11) NOT NULL,
  `end_month` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `groups`
--

INSERT INTO `groups` (`id`, `groupname`, `begin_year`, `end_year`, `begin_month`, `end_month`) VALUES
(1, '1PTVR', 2015, 2018, 9, 6),
(2, '1KTVR', 2015, 2017, 9, 6),
(3, '2PTVR', 2014, 2017, 9, 6);

-- --------------------------------------------------------

--
-- Структура таблицы `kurators`
--

CREATE TABLE IF NOT EXISTS `kurators` (
`id` int(11) NOT NULL,
  `id_teacher` int(11) NOT NULL,
  `id_group` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `kurators`
--

INSERT INTO `kurators` (`id`, `id_teacher`, `id_group`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `students`
--

CREATE TABLE IF NOT EXISTS `students` (
`id` int(11) NOT NULL,
  `register` int(11) NOT NULL,
  `id_code` varchar(11) NOT NULL,
  `family` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `id_group` int(11) NOT NULL,
  `telefon` varchar(20) NOT NULL,
  `cantry` varchar(30) NOT NULL,
  `city` varchar(20) NOT NULL,
  `street` varchar(20) NOT NULL,
  `haus` int(11) NOT NULL,
  `flat` int(11) NOT NULL,
  `area` varchar(20) NOT NULL,
  `bank` varchar(20) NOT NULL,
  `eban` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `students`
--

INSERT INTO `students` (`id`, `register`, `id_code`, `family`, `name`, `id_group`, `telefon`, `cantry`, `city`, `street`, `haus`, `flat`, `area`, `bank`, `eban`) VALUES
(1, 2542, '36010132214', 'Ivanov', 'Ivan', 1, '565099999', 'Estonia', 'Jõhvi', 'Narva mnt.', 80, 31, 'Ida-Virumaa', 'swed', 'EE22348390403484849'),
(2, 2543, '39910122216', 'Vassijev', 'Vassili', 2, '434343434', 'Estonia', 'Kohtla-Järve', 'Outokumpu', 32, 45, 'Ida-Virumaa', 'seb', 'EE443302394783343234');

-- --------------------------------------------------------

--
-- Структура таблицы `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
`id` int(11) NOT NULL,
  `family` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `telefon` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `teachers`
--

INSERT INTO `teachers` (`id`, `family`, `name`, `telefon`) VALUES
(1, 'Melnikov', 'Jüri', '56509987'),
(2, 'Bõlova', 'Ljudmila', '5654545645');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `groups`
--
ALTER TABLE `groups`
 ADD PRIMARY KEY (`id`), ADD KEY `groupname` (`groupname`);

--
-- Индексы таблицы `kurators`
--
ALTER TABLE `kurators`
 ADD PRIMARY KEY (`id`), ADD KEY `id_teacher` (`id_teacher`), ADD KEY `id_group` (`id_group`);

--
-- Индексы таблицы `students`
--
ALTER TABLE `students`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_code` (`id_code`), ADD KEY `groupname` (`id_group`);

--
-- Индексы таблицы `teachers`
--
ALTER TABLE `teachers`
 ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `groups`
--
ALTER TABLE `groups`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `kurators`
--
ALTER TABLE `kurators`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `students`
--
ALTER TABLE `students`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT для таблицы `teachers`
--
ALTER TABLE `teachers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `kurators`
--
ALTER TABLE `kurators`
ADD CONSTRAINT `kurators_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id`),
ADD CONSTRAINT `kurators_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id`);

--
-- Ограничения внешнего ключа таблицы `students`
--
ALTER TABLE `students`
ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id`) ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
