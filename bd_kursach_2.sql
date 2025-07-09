-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Июл 09 2025 г., 19:26
-- Версия сервера: 8.0.30
-- Версия PHP: 7.4.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `bd_kursach_2`
--

-- --------------------------------------------------------

--
-- Структура таблицы `disciplines`
--

CREATE TABLE `disciplines` (
  `id_dis` int NOT NULL,
  `id_gryp` int NOT NULL,
  `id_teacher` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `prikas_form` varchar(30) DEFAULT NULL,
  `year_form` year DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `disciplines`
--

INSERT INTO `disciplines` (`id_dis`, `id_gryp`, `id_teacher`, `name`, `prikas_form`, `year_form`) VALUES
(1, 1, 1, 'Математика', 'Приказ-0001', 2002),
(2, 2, 2, 'Русский', 'Приказ-0001', 2002),
(3, 3, 3, 'История', 'Приказ-0001', 2002),
(4, 1, 2, 'Физика', 'Приказ-0001', 2002),
(5, 2, 1, 'Инженерия', 'Приказ-0002', 2003),
(6, 3, 4, 'Программирование', 'Приказ-0002', 2003),
(7, 2, 5, 'Компьютерная графика', NULL, 2002),
(8, 7, 2, 'Операционные системы', 'Приказ-0003', 2003),
(9, 1, 6, 'Почтовая связь', NULL, NULL),
(10, 2, 6, 'Почтовые протоколы', NULL, NULL),
(11, 2, 3, 'Почтовая служба', NULL, NULL),
(12, 1, 2, 'Виртуальные сети', 'Приказ-0004', 2003),
(13, 3, 2, 'Телекомуникация', 'Приказ-0004', NULL),
(14, 5, 2, 'История информации', NULL, NULL),
(15, 2, 5, 'Информатика', 'Приказ-0004', 2005),
(16, 6, 3, 'Пакеты Прикладных программ', 'Приказ-0005', 2005),
(17, 2, 4, 'Численные методы', 'Приказ-0005', 2005),
(18, 1, 2, 'Математические алгоритмы', 'Приказ-0005', 2004);

-- --------------------------------------------------------

--
-- Структура таблицы `gryppa`
--

CREATE TABLE `gryppa` (
  `id_gryp` int NOT NULL,
  `id_spec` int NOT NULL,
  `name` varchar(10) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `kurs` tinyint UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `gryppa`
--

INSERT INTO `gryppa` (`id_gryp`, `id_spec`, `name`, `type`, `kurs`) VALUES
(1, 1, 'ИСС-1', NULL, 1),
(2, 1, 'ИСС-1у', 'ускоренная', 1),
(3, 1, 'ИСС-2', NULL, 1),
(4, 2, 'КБ-1', NULL, 1),
(5, 2, 'КБ-1к', 'Комерция', 1),
(6, 3, 'ПИ-2', NULL, 1),
(7, 3, 'ПИ-1', NULL, 2),
(8, 3, 'ПИ-1к', 'Комерция', 2),
(9, 4, 'ИСТ-1', NULL, 3),
(10, 4, 'ИСТ-2', NULL, 2),
(11, 4, 'ИСС-3', NULL, 1),
(12, 5, 'КБВС-10к', 'Комерция', NULL),
(13, 7, 'БИ-1', 'Комерция', 2),
(14, 7, 'БИ-2', 'Комерция', 1),
(15, 1, 'ИСС-3', NULL, 3),
(16, 1, 'ИСТ-3у', 'ускоренная', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `kafedra`
--

CREATE TABLE `kafedra` (
  `id_kaf` int NOT NULL,
  `name` varchar(30) NOT NULL,
  `head` varchar(30) DEFAULT NULL,
  `priras_form` varchar(30) DEFAULT NULL,
  `year_form` year DEFAULT NULL,
  `adres` varchar(30) DEFAULT NULL,
  `telephone` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `kafedra`
--

INSERT INTO `kafedra` (`id_kaf`, `name`, `head`, `priras_form`, `year_form`, `adres`, `telephone`) VALUES
(1, 'Математические науки', 'Сергеев Е.Ф', 'Приказ-0010', 2002, 'ул. Ялтинская д.20', '+79277066678'),
(2, 'Филологические науки', NULL, 'Приказ-0011', 2002, 'ул. Тушина д.24', NULL),
(3, 'Физические науки', 'Леонова Е.П.', 'Приказ-0010', 2002, 'ул. Ялтинская д.20', '+79277016565'),
(4, 'Почтовые службы', 'Воробьёв А.Г.', NULL, NULL, 'ул. Тушина д.24', '8(970)6678985'),
(5, 'Компьютерные науки', NULL, 'Приказ-0020', 2003, 'ул. Ялтинская д.20а', NULL),
(6, 'Физвоспитания', NULL, NULL, 2002, 'ул. Тушина д.24', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `specialnost`
--

CREATE TABLE `specialnost` (
  `id_spec` int NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `year_form` year DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `specialnost`
--

INSERT INTO `specialnost` (`id_spec`, `name`, `year_form`) VALUES
(1, 'Информационные системы и сети', 2002),
(2, 'Кибербезопасность', 2005),
(3, 'Программная Инженерия', 2002),
(4, 'Информационные системы и технологии', 2003),
(5, 'Кибербезопасность в вирутальных сетях', 2010),
(6, 'Почтовая связь', NULL),
(7, 'Бизнес информатика', 2010),
(8, 'Электромеханика', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `student`
--

CREATE TABLE `student` (
  `id_stud` int NOT NULL,
  `id_gryp` int NOT NULL,
  `surname` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `seсname` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `student`
--

INSERT INTO `student` (`id_stud`, `id_gryp`, `surname`, `name`, `seсname`) VALUES
(1, 1, 'Петров', 'Кирилл', 'Степанович'),
(2, 1, 'Попова', 'Оливия', 'Дмитриевна'),
(3, 1, 'Селезнева', 'Александра', NULL),
(4, 2, 'Крылова', 'София', 'Тимофеевна'),
(5, 2, 'Малышева', 'Алиса', 'Дмитриевна'),
(6, 3, 'Карпова', 'Ксения', 'Сергеевна'),
(7, 3, 'Прокофьев', 'Алексей', 'Мирославович'),
(8, 4, 'Медведев', 'Фёдор', 'Романович'),
(9, 4, 'Ефимов', 'Михаил', NULL),
(10, 5, 'Петрова', 'Елизавета', 'Ивановна'),
(11, 6, 'Белкин', 'Алексей', 'Гордеевич'),
(12, 7, 'Антонов', 'Григорий', 'Максимович'),
(13, 8, 'Павлова', 'Лилия', 'Константиновна'),
(14, 12, 'Аникина', 'Вероника', NULL),
(15, 10, 'Ткачев', 'Мирон', 'Платонович'),
(16, 12, 'Матвеева', 'Нина', 'Марковна'),
(17, 3, 'Новиков', 'Егор', NULL),
(18, 10, 'Егорова', 'Василиса', 'Ивановна'),
(19, 14, 'Федоров', 'Илья', 'Сергеевич'),
(20, 15, 'Овчинников', 'Евгений', 'Демидович'),
(21, 12, 'Сальников', 'Эмиль', NULL),
(22, 13, 'Киселева', 'Аделина', 'Александровна'),
(23, 9, 'Дубов', 'Роман', 'Дмитриевич'),
(24, 1, 'Орлов', 'Александр', 'Дмитриевич'),
(25, 1, 'Смирнов', 'Тимофей', 'Александрович'),
(26, 3, 'Егорова', 'Василиса', 'Ивановна'),
(27, 6, 'Новиков', 'Егор', 'Кириллович'),
(28, 10, 'Рыбакова', 'Мария', NULL),
(29, 2, 'Грачев', 'Герман', NULL),
(30, 15, 'Леонтьев', 'Василий', 'Григорьевич'),
(31, 4, 'Павлова', 'Артуров', 'Табенский'),
(32, 4, 'Прохоров', 'Николаев', 'Табенский'),
(33, 7, 'fam', 'Ima', 'Otc');

-- --------------------------------------------------------

--
-- Структура таблицы `studentcard`
--

CREATE TABLE `studentcard` (
  `id_stud` int NOT NULL,
  `year_postup` year DEFAULT NULL,
  `prikas_postup` text,
  `stependia` int DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `adres` text,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(14) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `studentcard`
--

INSERT INTO `studentcard` (`id_stud`, `year_postup`, `prikas_postup`, `stependia`, `birthday`, `adres`, `email`, `telephone`) VALUES
(1, 2020, 'Приказ о зачисление от 3.8.2020', 3500, '2000-12-21', 'г. Самара ул. Артёмовская д.63 кв. 246', 'parfenov2000@gmail.com', '8(917)0012567'),
(2, 2020, NULL, NULL, '2001-07-12', 'г. Самара ул. Герцена д. 23', 'angrypop@gmail.com', NULL),
(6, 2020, 'Приказ о зачислении от 3.8.2020', NULL, NULL, NULL, 'goldfish1234@yandex.ru', '8(200)1005544'),
(7, 2020, 'Приказ о зачисление от 4.8.2020', NULL, '2001-10-12', NULL, NULL, '+7(927)7017010'),
(8, 2019, 'Приказ о зачисление от 23.8.2019', 1200, NULL, 'ул. Янгеля д. 14', NULL, NULL),
(11, 2020, NULL, NULL, '2001-08-14', NULL, 'spacecalmar2001@gmail.com', NULL),
(16, NULL, NULL, NULL, NULL, NULL, NULL, '+7(203)6617943'),
(17, 2019, 'Приказ о зачислении студента от 25.06.2019', NULL, NULL, 'ПГТ Мирный, ул. Строительная, Корпус 4, кв. 17', NULL, NULL),
(20, 2020, 'Приказ о зачислении от 3.08.2020', 3800, '2002-01-17', 'ул. Стара загора д. 17 кв. 17 ', 'stydi.mail.002@gmail.com', '88005553535');

-- --------------------------------------------------------

--
-- Структура таблицы `teacher`
--

CREATE TABLE `teacher` (
  `id_teach` int NOT NULL,
  `id_kaf` int NOT NULL,
  `surname` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `secname` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `teacher`
--

INSERT INTO `teacher` (`id_teach`, `id_kaf`, `surname`, `name`, `secname`) VALUES
(1, 1, 'Павлова', 'Елизавета', 'Сергеевна'),
(2, 1, 'Тихонова', 'Ева', NULL),
(3, 1, 'Данилов', 'Фёдор', NULL),
(4, 2, 'Прохоров', 'Андрей', 'Матвеевич'),
(5, 2, 'Орлова', 'Елизавета', 'Павловна'),
(6, 3, 'Сычев', 'Лука', 'Богданович'),
(7, 4, 'Иванов', 'Всеволод', NULL),
(8, 5, 'Сергеев', 'Илья', 'Ильич'),
(9, 5, 'Лазарева', 'Ева', 'Германовна'),
(10, 5, 'Фадеев', 'Алексей', NULL),
(11, 5, 'Колесникова', 'Амалия ', NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `teachercard`
--

CREATE TABLE `teachercard` (
  `id_teach` int NOT NULL,
  `year_hired` year DEFAULT NULL,
  `adress` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `email` varchar(30) DEFAULT NULL,
  `telephone` varchar(14) DEFAULT NULL,
  `wages` int UNSIGNED DEFAULT NULL,
  `study_type` varchar(30) DEFAULT NULL,
  `study_year` year DEFAULT NULL,
  `birthday` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `teachercard`
--

INSERT INTO `teachercard` (`id_teach`, `year_hired`, `adress`, `email`, `telephone`, `wages`, `study_type`, `study_year`, `birthday`) VALUES
(1, 2015, 'ул. Герцена д. 15', 'e.s.pavlova@mail.ru', '+7(907)3004511', 15000, 'Доктор', 2008, '1983-11-10'),
(3, 2014, 'ул. Ташкентская д. 218', NULL, '+7(097)4560023', 15600, NULL, 2006, NULL),
(5, 2019, NULL, NULL, NULL, NULL, 'аспирант', 2010, '1993-07-13'),
(7, 2008, 'г. Сызрань, Новопетровский район, ул. Машиностроиелей, д. 114, кв. 12', NULL, '8(104)1040012', 23500, 'Доктор', 1992, '1973-11-10'),
(8, 2020, NULL, 'Sergey.teach@gmail.com', '8(970)6678994', 10700, 'аспирант', 2016, NULL),
(10, NULL, NULL, 'bestmolgol@mail.ru', NULL, NULL, NULL, NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `disciplines`
--
ALTER TABLE `disciplines`
  ADD PRIMARY KEY (`id_dis`),
  ADD KEY `id_gryp` (`id_gryp`),
  ADD KEY `id_teacher` (`id_teacher`);

--
-- Индексы таблицы `gryppa`
--
ALTER TABLE `gryppa`
  ADD PRIMARY KEY (`id_gryp`),
  ADD KEY `id_spec` (`id_spec`);

--
-- Индексы таблицы `kafedra`
--
ALTER TABLE `kafedra`
  ADD PRIMARY KEY (`id_kaf`);

--
-- Индексы таблицы `specialnost`
--
ALTER TABLE `specialnost`
  ADD PRIMARY KEY (`id_spec`);

--
-- Индексы таблицы `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`id_stud`),
  ADD KEY `id_gryp` (`id_gryp`);

--
-- Индексы таблицы `studentcard`
--
ALTER TABLE `studentcard`
  ADD PRIMARY KEY (`id_stud`);

--
-- Индексы таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`id_teach`),
  ADD KEY `id_kaf` (`id_kaf`);

--
-- Индексы таблицы `teachercard`
--
ALTER TABLE `teachercard`
  ADD PRIMARY KEY (`id_teach`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `disciplines`
--
ALTER TABLE `disciplines`
  MODIFY `id_dis` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT для таблицы `gryppa`
--
ALTER TABLE `gryppa`
  MODIFY `id_gryp` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `kafedra`
--
ALTER TABLE `kafedra`
  MODIFY `id_kaf` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `specialnost`
--
ALTER TABLE `specialnost`
  MODIFY `id_spec` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `student`
--
ALTER TABLE `student`
  MODIFY `id_stud` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT для таблицы `studentcard`
--
ALTER TABLE `studentcard`
  MODIFY `id_stud` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT для таблицы `teacher`
--
ALTER TABLE `teacher`
  MODIFY `id_teach` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `disciplines`
--
ALTER TABLE `disciplines`
  ADD CONSTRAINT `disciplines_ibfk_1` FOREIGN KEY (`id_gryp`) REFERENCES `gryppa` (`id_gryp`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `disciplines_ibfk_2` FOREIGN KEY (`id_teacher`) REFERENCES `teacher` (`id_teach`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `gryppa`
--
ALTER TABLE `gryppa`
  ADD CONSTRAINT `gryppa_ibfk_1` FOREIGN KEY (`id_spec`) REFERENCES `specialnost` (`id_spec`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`id_gryp`) REFERENCES `gryppa` (`id_gryp`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `studentcard`
--
ALTER TABLE `studentcard`
  ADD CONSTRAINT `studentcard_ibfk_1` FOREIGN KEY (`id_stud`) REFERENCES `student` (`id_stud`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`id_kaf`) REFERENCES `kafedra` (`id_kaf`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `teachercard`
--
ALTER TABLE `teachercard`
  ADD CONSTRAINT `teachercard_ibfk_1` FOREIGN KEY (`id_teach`) REFERENCES `teacher` (`id_teach`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
