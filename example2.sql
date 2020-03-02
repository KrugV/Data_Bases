-- Создаём БД
CREATE DATABASE example;

-- Делаем её текущей
USE example;

-- Копируем таблицу из базы VK
CREATE TABLE example.users AS SELECT * FROM vk.users;

-- Смотрим содержимое
SELECT * FROM users LIMIT 10;
-- Удаляем даты
UPDATE users SET created_at = NULL;
UPDATE users SET updated_at = NULL;

-- 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными. Заполните их текущими датой и временем.
UPDATE users SET created_at = NOW();

-- 2. Таблица users была неудачно спроектирована. 
-- Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". 
-- Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

-- Меняю поля на VARCHAR
ALTER TABLE users MODIFY COLUMN updated_at VARCHAR(100);
ALTER TABLE users MODIFY COLUMN created_at VARCHAR(100);
-- Проверяю трибуты полей, изменились....
DESC users;
-- Меняю поля на DATETIME
ALTER TABLE users MODIFY COLUMN updated_at DATETIME;
ALTER TABLE users MODIFY COLUMN created_at DATETIME;

-- 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. 
-- Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. 
-- Однако, нулевые запасы должны выводиться в конце, после всех записей.

-- Создаем таблицу
CREATE TABLE storehouses_products (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  value INT NOT NULL
);

-- Смотрим содержимое
SELECT * FROM storehouses_products LIMIT 10;
-- Получаем 7 строк с разными значениями
INSERT storehouses_products SET value = FLOOR(1 + (RAND() * 100));

-- Заменяем 2 целых числа на нули в столбце для примера 
UPDATE storehouses_products SET value=0 WHERE value=64;
UPDATE storehouses_products SET value=0 WHERE value=92;

-- Выводим записи в порядке увеличения value, нулевые запасы в конце
SELECT * FROM storehouses_products ORDER BY CASE WHEN value=0 THEN 99 else value END;


-- 1. Подсчитайте средний возраст пользователей в таблице users

-- Копируем таблицу из базы VK с датами рождения
CREATE TABLE example.profiles AS SELECT * FROM vk.profiles;
-- Смотрим содержимое
USE example;
SELECT * FROM profiles LIMIT 10;

-- Добавляем столбец age
ALTER TABLE profiles ADD COLUMN age INT UNSIGNED AFTER birthdate;
 -- Определяем возраст пользователей
UPDATE profiles SET age = (YEAR(CURRENT_DATE)-YEAR(`birthdate`))-(RIGHT(CURRENT_DATE,5)<RIGHT(`birthdate`,5)
  );
 -- Определяем средний возраст - получаем 23 года
 SELECT ROUND(AVG(age),0)FROM profiles;



-- 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. 
-- учесть, что необходимы дни недели текущего года, а не года рождения.
-- Добавляем столбец age_2020
ALTER TABLE profiles ADD COLUMN age_2020 INT UNSIGNED AFTER age;
-- Делаем текстовым
ALTER TABLE profiles MODIFY COLUMN age_2020 VARCHAR(100);
-- Проверяю
DESC profiles;
SELECT * FROM profiles LIMIT 10;
-- Новая дата+перевод поля в дату
UPDATE profiles SET age_2020 = CONCAT("2020-", RIGHT(`birthdate`,5));
ALTER TABLE profiles MODIFY COLUMN age_2020 DATETIME;
-- Добавляем столбец день_недели wd
ALTER TABLE profiles ADD COLUMN wd VARCHAR(100) AFTER age_2020;
-- Определяем день недели
UPDATE profiles SET wd = DAYNAME(age_2020); 
-- Считаем кол-во ДР, которые приходятся на каждый из дней недели
SELECT COUNT(*), SUBSTRING(wd, 1,3) AS wdkol FROM profiles GROUP BY wdkol;










