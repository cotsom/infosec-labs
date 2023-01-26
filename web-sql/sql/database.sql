SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


CREATE TABLE `users_info` (
  `id` int UNSIGNED NOT NULL,
  `login` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `vocation` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3;


INSERT INTO `users_info` (`id`, `login`, `password`, `vocation`) VALUES
(1, 'admin', 'hguerhg@!r32hf2buJHfe', 'Devops');
INSERT INTO `users_info` (`id`, `login`, `password`, `vocation`) VALUES
(2, 'moderator', 'oijrgoih34g234', 'Backend programmer');
INSERT INTO `users_info` (`id`, `login`, `password`, `vocation`) VALUES
(3, 'Sam', 'oijh348ufh34f234', 'Frontend programmer');

ALTER TABLE `users_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

ALTER TABLE `users_info`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;