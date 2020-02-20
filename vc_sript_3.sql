-- Создаём БД
CREATE DATABASE vk;

-- Делаем её текущей
USE vk;

-- Смотрим таблицы
SHOW TABLES;

-- Смотрим содержимое
SELECT * FROM users u2 LIMIT 10;
-- Приводим в порядок даты
UPDATE users SET created_at = updated_at WHERE created_at > updated_at;


-- Таблица пользователей
CREATE TABLE users (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  email VARCHAR(120) NOT NULL UNIQUE,
  phone VARCHAR(15) NOT NULL UNIQUE,
  `password` VARCHAR(15),
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Смотрим содержимое
SELECT * FROM profiles p2 LIMIT 10;
-- Выставляем значения пола при помощи использования временной таблицы
CREATE TEMPORARY TABLE sex (sex CHAR(1));
INSERT INTO sex VALUES ('m'), ('f');
UPDATE profiles SET sex = (SELECT sex FROM sex ORDER BY RAND() LIMIT 1);
-- Связываем таблицу профиль с таблицей юзерс по внешними ключу
ALTER TABLE profiles ADD COLUMN user_id INT UNSIGNED NOT NULL FIRST;
UPDATE profiles SET user_id = FLOOR(1 + (RAND() * 100));
-- Проверяем структуру таблицы
DESC profiles;


-- Таблица профилей
CREATE TABLE profiles (
  birthdate DATE,
  sex CHAR(1) NOT NULL,
  hometown VARCHAR(100),
  country VARCHAR(100),
  photo_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Проверяем сообщения
SELECT * FROM messages m2 LIMIT 100;
-- Меняем отправителя и получателя сообщений
UPDATE messages SET
  from_user_id = FLOOR(1 + (RAND() * 100)),
  to_user_id = FLOOR(1 + (RAND() * 100));
  -- Добавим столбец в messages (групповое сообщение или нет)
ALTER TABLE messages ADD COLUMN to_community_id INT UNSIGNED AFTER to_user_id;
 -- Заполним данными
UPDATE messages SET to_community_id = FLOOR(1 + (RAND() * 10)) WHERE id > 50 AND id < 70; 
-- Проверяем структуру таблицы
DESC messages;


-- Таблица сообщений
CREATE TABLE messages (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  from_user_id INT UNSIGNED NOT NULL,
  to_user_id INT UNSIGNED NOT NULL,
  body TEXT NOT NULL,
  is_important BOOLEAN,
  is_delivered BOOLEAN,
  created_at DATETIME DEFAULT NOW()
);

-- Проверяем дружбу
SELECT * FROM friendship f2 LIMIT 50;
-- Обновляем идентификаторы владельцев
UPDATE friendship SET user_id = FLOOR(1 + (RAND() * 100));
UPDATE friendship SET friend_id = FLOOR(1 + (RAND() * 100));
-- Обновляем ссылки на статусы в таблице дружбы  
UPDATE friendship SET status_id = FLOOR(1 + (RAND() * 3));  
-- Приводим в порядок даты
UPDATE friendship SET requested_at = confirmed_at WHERE requested_at > confirmed_at;
-- Проверяем структуру таблицы
DESC friendship;

-- Таблица дружбы
CREATE TABLE friendship (
  user_id INT UNSIGNED NOT NULL,
  friend_id INT UNSIGNED NOT NULL,
  status_id INT UNSIGNED NOT NULL,
  requested_at DATETIME DEFAULT NOW(),
  confirmed_at DATETIME,
  PRIMARY KEY (user_id, friend_id)
);

-- Проверяем статусы дружбы
SELECT * FROM friendship_statuses;
-- Вставляем новые значения
INSERT INTO friendship_statuses (name)
  VALUES ('Requested'), ('Confirmed'), ('Rejected');


-- Таблица статусов дружеских отношений
CREATE TABLE friendship_statuses (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE
);


-- Проверяем группы
SELECT * FROM communities;
DELETE FROM communities WHERE id > 20;
-- Добавим столбцы
ALTER TABLE communities ADD COLUMN is_open BOOLEAN;
ALTER TABLE communities ADD COLUMN description TEXT NOT NULL;
-- Заполняем данными
UPDATE communities SET is_open = TRUE WHERE id IN (2, 3, 5, 8, 9);
UPDATE communities SET description = (SELECT body FROM messages WHERE messages.id = communities.id);
-- Если нужно удалить и пересоздать
ALTER TABLE communities DROP COLUMN description;


-- Таблица групп
CREATE TABLE communities (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL UNIQUE
);


-- Проверяем таблицу связи communities_users
SELECT * FROM communities_users LIMIT 100;
-- Обновляем значения идентификаторов для группы и членов групп
UPDATE communities_users SET community_id = FLOOR(1 + (RAND() * 20));
UPDATE communities_users SET user_id = FLOOR(1 + (RAND() * 100));



-- Таблица связи пользователей и групп
CREATE TABLE communities_users (
  community_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  PRIMARY KEY (community_id, user_id)
);



-- Проверяем медиафайлы
SELECT * FROM media LIMIT 10;
-- Обновляем ссылки на типы
UPDATE media SET media_type_id = FLOOR(1 + (RAND() * 3));
-- Обновляем идентификаторы владельцев
UPDATE media SET user_id = FLOOR(1 + (RAND() * 100));
-- Улучшаем внешний вид ссылки на файл
UPDATE media SET filename = CONCAT('https://dropbox/vk/file_', size);
-- Исправляем нули в столбце size
UPDATE media SET size=345643 WHERE size=0;
-- Дорабатываем метаданные    
UPDATE media SET metadata = CONCAT('{"owner":"', 
  (SELECT CONCAT(first_name, ' ', last_name) FROM users WHERE id = user_id),
  '"}');   


-- Таблица медиафайлов
CREATE TABLE media (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  media_type_id INT UNSIGNED NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  filename VARCHAR(255) NOT NULL,
  size INT NOT NULL,
  metadata JSON,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


-- Проверяем типы медиафайлов
SELECT * FROM media_types LIMIT 10;
-- Вставляем типы медиа
INSERT INTO media_types (name) VALUES
  ('photo'),
  ('video'),
  ('audio')
;

-- Таблица типов медиафайлов
CREATE TABLE media_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE
);


-- Проверяем таблицу постов
SELECT * FROM post p LIMIT 10;
-- Обновляем идентификаторы владельцев
UPDATE post SET user_id = FLOOR(1 + (RAND() * 100));
-- Обновляем ссылки на медиа
UPDATE post SET media_id = FLOOR(1 + (RAND() * 100));



-- Таблица постов
CREATE table post (
  id INT unsigned not null auto_increment primary key, 
  media_id INT unsigned, 
  user_id INT unsigned not null, 
  post mediumtext, 
  created_at datetime default Current_Timestamp, 
  updated_at datetime default Current_Timestamp on update Current_Timestamp
); 


-- Проверяем таблицу лайков
SELECT * FROM likes LIMIT 10;
-- Обновляем идентификаторы владельцев
UPDATE likes SET user_id = FLOOR(1 + (RAND() * 100));
-- Обновляем индентификаторы постов
UPDATE likes SET post_id = FLOOR(1 + (RAND() * 100));



-- Таблица лайков
CREATE table likes (
  id INT unsigned not null auto_increment primary key, 
  post_id INT unsigned, 
  user_id INT unsigned not null, 
  created_at datetime default Current_Timestamp, 
  updated_at datetime default Current_Timestamp on update Current_Timestamp
);

