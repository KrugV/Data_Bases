-- 1. Составьте список пользователей users, которые осуществили хотя бы один заказ orders в интернет магазине.
-- Создаём БД
CREATE DATABASE example_7;
-- Делаем её текущей
USE example_7;
-- Копируем таблицу users из базы vk в базу example_7
CREATE TABLE example_7.users LIKE vk.users;
-- Переносим данные
INSERT INTO example_7.users SELECT * FROM vk.users;
SELECT * FROM users LIMIT 10;
-- создаем таблицу ecom
CREATE TABLE ecom (
  user_id INT UNSIGNED NOT NULL,
  order_id INT UNSIGNED NOT NULL
);
-- Загрузил данные из filldb (для практики), привожу в нормальный вид
UPDATE ecom SET user_id = FLOOR(1 + (RAND() * 100));
UPDATE ecom SET order_id = FLOOR(1 + (RAND() * 100));
-- смотрим
SELECT * FROM ecom LIMIT 10;
-- через JOIN находим пользователей, которые осуществили хотя бы один заказ из двух таблиц 
-- два пользователя сделали по одному заказу в интернет-магазине
SELECT u.first_name, u.last_name, e.order_id
FROM users AS u JOIN ecom AS e
ON u.id=e.user_id
ORDER BY
 e.order_id
 LIMIT 10;


-- 2.Выведите список товаров products и разделов catalogs, который соответствует товару.
-- создаем таблицу catalogs
USE example_7;

 DROP TABLE IF EXISTS catalogs; 
 CREATE TABLE catalogs(
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100));

 SELECT * FROM catalogs LIMIT 10;
-- вставляем данные
INSERT INTO catalogs (name) VALUES ('КСН'), ('Вино'), ('Пиво'), ('Сопутка'), ('Сигареты');

-- создаем таблицу products  
CREATE TABLE products(
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
catalog_id INT UNSIGNED,
name_position VARCHAR(100),
price DECIMAL (11,2));
 SELECT * FROM products LIMIT 10;

-- вставляем данные
INSERT INTO products (catalog_id, name_position, price) VALUES
(1,'Водка Грушовица 0,50',230),
(1,'Абсент 0.5',450),
(2,'Вино Дон де Суэло Шардоне бел\сух 0,75',835),
(2,'Вино Альмадор Темпранильо кр\сух 14% 0,7',865),
(3,'Пиво ЖИГУЛЕВСКОЕ светлое 4,5% 1,42л ПЭТ',65),
(3,'Пиво КАСС светлое 4,5% 1,6л',89),
(4,'Кальмар сушеный/щупальца 20г Д/Ф',33),
(4,'Набор Лососевые кусочки сушеные 60г Д/Р',56),
(5,'Ява Классическая твердая', 120),
(5,'Ява Золотая Классическая 30',250);
-- смотрим
 SELECT * FROM products LIMIT 10;

-- с помощью JOIN выводим список товаров products и разделов catalogs, который соответствует товару
SELECT p.name_position, p.price, c.name
FROM products AS p JOIN catalogs AS c
ON p.catalog_id=c.id;


-- 3.(по желанию) Пусть имеется таблица рейсов flights (id, from, to) и таблица городов cities (label, name). 
-- Поля from, to и label содержат английские названия городов, поле name — русское. 
-- Выведите список рейсов flights с русскими названиями городов.

-- Создаем таблицу flights
DROP TABLE IF EXISTS flights; 
CREATE TABLE flights(
id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
fromm VARCHAR(100),
too VARCHAR(100));
 SELECT * FROM flights;

-- вставляем данные
INSERT INTO flights (fromm, too) VALUES
('moscow','omsk'),
('novgorod','kazan'),
('irkutsk','moscow'),
('omsk','irkutsk'),
('moscow','kazan');

-- Создаем таблицу cities
CREATE TABLE cities (
label VARCHAR(100),
name VARCHAR(100));
 SELECT * FROM cities;

-- вставляем данные
INSERT INTO cities (label, name) VALUES
('moscow','Москва'),
('novgorod','Новгород'),
('irkutsk','Иркутск'),
('omsk','Омск'),
('kazan', 'Казань');

-- Выводим список рейсов с русскими названиями городов	
SELECT f.id, c.name AS fr, ci.name AS tooo
FROM cities AS c JOIN flights AS f
ON c.label=f.fromm
JOIN cities AS ci
ON ci.label=f.too
ORDER BY
  f.id;
 
 USE vk;


-- Новая таблица лайков к базе данных vk
 USE vk;
DROP TABLE IF EXISTS likes;
CREATE TABLE likes (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  target_id INT UNSIGNED NOT NULL,
  target_type_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

-- обновляю таблицу через дамп и filldb
-- проверяем
SELECT * FROM likes LIMIT 10;
-- корректируем
UPDATE likes SET user_id = FLOOR(1 + (RAND() * 100));
UPDATE likes SET target_id = FLOOR(1 + (RAND() * 100));
UPDATE likes SET target_type_id = FLOOR(1 + (RAND() * 4));

-- Таблица типов лайков
CREATE TABLE target_types (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
-- заполняем
INSERT INTO target_types (name) VALUES 
  ('messages'),
  ('users'),
  ('media'),
  ('posts');
-- проверяем
SELECT * FROM target_types LIMIT 10;
 
 











