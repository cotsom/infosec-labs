SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
-- --------------------------------------------------------

--
-- Структура таблицы `users_info`
--

CREATE TABLE `users_info` (
  `id` int UNSIGNED NOT NULL,
  `login` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


INSERT INTO `users_info` (`id`, `login`, `password`) VALUES
(1, 'admin', 'hguerhg@!r32hf2buJHfe');
INSERT INTO `users_info` (`id`, `login`, `password`) VALUES
(2, 'moderator', 'oijrgoih34g234');

--
-- Индексы таблицы `users_info`
--
ALTER TABLE `users_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- AUTO_INCREMENT для таблицы `users_info`
--
ALTER TABLE `users_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
