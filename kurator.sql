-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Ноя 13 2015 г., 17:07
-- Версия сервера: 5.5.46-0+deb8u1
-- Версия PHP: 5.6.14-0+deb8u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `kurator`
--

-- --------------------------------------------------------

--
-- Структура таблицы `address`
--

CREATE TABLE IF NOT EXISTS `address` (
`id` int(11) NOT NULL,
  `student_id` int(6) NOT NULL,
  `region` varchar(40) NOT NULL,
  `city` varchar(40) NOT NULL,
  `street` varchar(40) NOT NULL,
  `house` varchar(5) NOT NULL,
  `room` varchar(5) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `address`
--

REPLACE INTO `address` (`id`, `student_id`, `region`, `city`, `street`, `house`, `room`) VALUES
(1, 1, 'Ida-Viruvaa', 'Johvi', 'Narva mnt.', '80', '33');

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE IF NOT EXISTS `countries` (
`id` int(6) NOT NULL,
  `country` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `countries`
--

REPLACE INTO `countries` (`id`, `country`) VALUES
(1, 'Estonia');

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

REPLACE INTO `groups` (`id`, `groupname`, `begin_year`, `end_year`, `begin_month`, `end_month`) VALUES
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

REPLACE INTO `kurators` (`id`, `id_teacher`, `id_group`) VALUES
(1, 1, 1),
(2, 2, 3),
(3, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `parents`
--

CREATE TABLE IF NOT EXISTS `parents` (
`id` int(11) NOT NULL,
  `student_id` int(11) NOT NULL,
  `status` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `adress_id` int(11) NOT NULL,
  `info` time NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `parents`
--

REPLACE INTO `parents` (`id`, `student_id`, `status`, `phone`, `adress_id`, `info`) VALUES
(1, 1, 'Мать', '56506653', 1, '00:00:00'),
(2, 1, 'Отец', '56506652', 1, '00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `students`
--

CREATE TABLE IF NOT EXISTS `students` (
`id` int(11) NOT NULL,
  `register` int(11) NOT NULL,
  `personal_code` varchar(11) NOT NULL,
  `family` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `id_group` int(11) NOT NULL,
  `id_countries` int(6) NOT NULL,
  `info` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `students`
--

REPLACE INTO `students` (`id`, `register`, `personal_code`, `family`, `name`, `phone`, `id_group`, `id_countries`, `info`) VALUES
(1, 2542, '36010132214', 'Ivanov', 'Ivan', '', 1, 1, '');

-- --------------------------------------------------------

--
-- Структура таблицы `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
`id` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `family` varchar(40) NOT NULL,
  `name` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `teachers`
--

REPLACE INTO `teachers` (`id`, `phone`, `family`, `name`) VALUES
(1, '', 'Melnikov', 'Jüri'),
(2, '', 'Bõlova', 'Ljudmila');

-- --------------------------------------------------------

--
-- Структура таблицы `teacher_phone`
--

CREATE TABLE IF NOT EXISTS `teacher_phone` (
`id` int(11) NOT NULL,
  `phone` varchar(12) NOT NULL,
  `owner_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `address`
--
ALTER TABLE `address`
 ADD PRIMARY KEY (`id`), ADD KEY `student_id` (`student_id`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
 ADD PRIMARY KEY (`id`);

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
-- Индексы таблицы `parents`
--
ALTER TABLE `parents`
 ADD PRIMARY KEY (`id`), ADD KEY `student_id` (`student_id`), ADD KEY `adress_id` (`adress_id`);

--
-- Индексы таблицы `students`
--
ALTER TABLE `students`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `id_code` (`personal_code`), ADD KEY `groupname` (`id_group`), ADD KEY `id_countries` (`id_countries`);

--
-- Индексы таблицы `teachers`
--
ALTER TABLE `teachers`
 ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `teacher_phone`
--
ALTER TABLE `teacher_phone`
 ADD PRIMARY KEY (`id`), ADD KEY `owner_id` (`owner_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `address`
--
ALTER TABLE `address`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
MODIFY `id` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
-- AUTO_INCREMENT для таблицы `parents`
--
ALTER TABLE `parents`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `students`
--
ALTER TABLE `students`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT для таблицы `teachers`
--
ALTER TABLE `teachers`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `teacher_phone`
--
ALTER TABLE `teacher_phone`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `address`
--
ALTER TABLE `address`
ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`);

--
-- Ограничения внешнего ключа таблицы `kurators`
--
ALTER TABLE `kurators`
ADD CONSTRAINT `kurators_ibfk_1` FOREIGN KEY (`id_teacher`) REFERENCES `teachers` (`id`),
ADD CONSTRAINT `kurators_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id`);

--
-- Ограничения внешнего ключа таблицы `parents`
--
ALTER TABLE `parents`
ADD CONSTRAINT `parents_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `parents_ibfk_2` FOREIGN KEY (`adress_id`) REFERENCES `address` (`id`);

--
-- Ограничения внешнего ключа таблицы `students`
--
ALTER TABLE `students`
ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `students_ibfk_2` FOREIGN KEY (`id_countries`) REFERENCES `countries` (`id`);

--
-- Ограничения внешнего ключа таблицы `teacher_phone`
--
ALTER TABLE `teacher_phone`
ADD CONSTRAINT `teacher_phone_ibfk_1` FOREIGN KEY (`owner_id`) REFERENCES `teachers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
