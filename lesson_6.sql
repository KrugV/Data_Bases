-- 1. Проанализировать запросы, которые выполнялись на занятии, определить возможные корректировки и/или улучшения
-- Корректирую задания по теме Агрегация
-- Смотрим содержимое
USE example;
SELECT * FROM profiles LIMIT 10;
-- Считаем средний возраст пользователей в таблице profiles - 23,47
SELECT
  AVG(TIMESTAMPDIFF(YEAR, birthdate, NOW())) AS age
FROM
  profiles;
-- Cчитаем количество дней рождения, которые приходятся на каждый из дней недели.
-- Следует учесть, что необходимы дни недели текущего года, а не года рождения.
DATE_FORMAT(DATE(CONCAT_WS('-', YEAR(NOW()), MONTH(birthdate), DAY(birthdate))), '%W') AS days,
  COUNT(*) AS total
FROM
  profiles
GROUP BY
  days
ORDER BY
  total DESC;
 
 -- 2. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
 -- Смотрим содержимое
USE vk;
SELECT * FROM profiles;
SELECT * FROM likes;
DESC likes;

-- Соединяем данные из двух таблиц через user_id, чтобы узнать какие посты лайкнули 
SELECT birthdate, post_id
FROM profiles, likes
WHERE profiles.user_id =likes.user_id

-- С помощью GROUP BY и COUNT считаем количество лайков десяти самых молодых пользователей т.е. вставлям выражение выше в новую формулу
SELECT birthdate AS birth, COUNT(*) AS new
FROM (SELECT birthdate, post_id
FROM profiles, likes
WHERE profiles.user_id =likes.user_id) AS combi
GROUP BY birth
ORDER BY birth DESC
LIMIT 10;

-- Считаем общее количество лайков - получилось 16
SELECT SUM(new) AS ob_kol
FROM (SELECT birthdate AS birth, COUNT(*) AS new
FROM (SELECT birthdate, post_id
FROM profiles, likes
WHERE profiles.user_id =likes.user_id) AS combi
GROUP BY birth
ORDER BY birth DESC
LIMIT 10) AS combi2;

-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?

-- Соединяем данные из двух таблиц через user_id, аналогично второму заданию
SELECT sex, post_id
FROM profiles, likes
WHERE profiles.user_id =likes.user_id;

-- Вставляем запрос выше в новый запрос и получаем муж-40, жен-60
SELECT sex AS pol, COUNT(*) AS kol
FROM (SELECT sex, post_id
FROM profiles, likes
WHERE profiles.user_id =likes.user_id) AS combi
GROUP BY pol;

-- 4. Найти 10 пользователей, которые проявляют наименьшую активность в использовании социальной сети.

-- Наименьшую активность определяем по друзьям, постам и лайкам.
SELECT `users`.*,
(
(SELECT COUNT(1) FROM `friendship` WHERE `user_id` = `users`.`id`) +
(SELECT COUNT(1) FROM `post` WHERE `user_id` = `users`.`id`) +
(SELECT COUNT(1) FROM `likes` WHERE `user_id` = `users`.`id`)
) AS `activ`
FROM `users`
ORDER BY `activ`
LIMIT 10;

