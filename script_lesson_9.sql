-- 1.В базе данных shop и sample присутствуют одни и те же таблицы, учебной базы данных.
-- Переместите запись id = 1 из таблицы shop.users в таблицу sample.users.
-- Используйте транзакции.


-- создаем свои тестовые базы
CREATE  DATABASE vk_test_2;
CREATE  DATABASE vk_test_3;

-- заливаем дампы базы vk через консоль
mysql -u root -p vk_test_2 < dump-vk_02032020.sql;
mysql -u root -p vk_test_3 < dump-vk_02032020.sql;

-- смотрим
SELECT * FROM vk_test_2.users;
SELECT * FROM vk_test_3.users;
-- перемещаем
START TRANSACTION;
  INSERT INTO vk_test_2.users SELECT * FROM vk_test_3 WHERE id = 1;
  DELETE FROM vk_test_3.users WHERE id = 1 LIMIT 1;
COMMIT;

-- 2.Создайте представление, которое выводит название name товарной
-- позиции из таблицы products и соответствующее название каталога name
-- из таблицы catalogs.

USE example_7;

-- Смотрим
SELECT * FROM catalogs;
SELECT * FROM products;


-- Создаем представление

CREATE OR REPLACE VIEW products_catalogs AS
SELECT
  p.name_position AS product,
  c.name AS catalog
FROM
  products AS p
JOIN
  catalogs AS c
ON
  p.catalog_id = c.id;
 
 
 -- Практическое задание по теме “Администрирование MySQL”
 
 -- 1.Создайте двух пользователей которые имеют доступ к базе данных shop.
-- Первому пользователю shop_read должны быть доступны только запросы на чтение данных,
-- второму пользователю shop — любые операции в пределах базы данных shop.

 -- Создаем двух пользователей которые имеют доступ к базе данных vk_test_2
USE vk_test_2;

CREATE USER 'vk_read'@'localhost';
GRANT SELECT, SHOW VIEW ON vk_test_2.* TO 'vk_read'@'localhost' IDENTIFIED BY '';


CREATE USER 'vk2_read'@'localhost';
GRANT ALL ON vk_test_2.* TO 'vk2read'@'localhost' IDENTIFIED BY '';


-- Практическое задание по теме “Хранимые процедуры и функции, триггеры"

-- 1. Создайте хранимую функцию hello(), которая будет возвращать приветствие, 
-- в зависимости от текущего времени суток. С 6:00 до 12:00 функция должна возвращать фразу "Доброе утро", 
-- с 12:00 до 18:00 функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 — "Добрый вечер", 
-- с 00:00 до 6:00 — "Доброй ночи".

USE vk;

DROP FUNCTION IF EXISTS hello;

DELIMITER -

CREATE FUNCTION hello ()
RETURNS TINYTEXT NO SQL
BEGIN
  DECLARE hour INT;
  SET hour = HOUR(NOW());
  CASE
    WHEN hour BETWEEN 0 AND 5 THEN
      RETURN "Доброй ночи";
    WHEN hour BETWEEN 6 AND 11 THEN
      RETURN "Доброе утро";
    WHEN hour BETWEEN 12 AND 17 THEN
      RETURN "Добрый день";
    WHEN hour BETWEEN 18 AND 23 THEN
      RETURN "Добрый вечер";
  END CASE;
END-

DELIMITER ;

SELECT NOW(), hello ();

-- 2.В таблице products есть два текстовых поля: name с названием товара и
-- description с его описанием. Допустимо присутствие обоих полей или одно из них.
-- Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема. 
-- Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
-- При попытке присвоить полям NULL-значение необходимо отменить операцию.

DELIMITER //

CREATE TRIGGER validate_name_description_insert BEFORE INSERT ON products
FOR EACH ROW BEGIN
  IF NEW.name IS NULL AND NEW.description IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Both name and description are NULL';
  END IF;
END//

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  (NULL, NULL, 9360.00, 2)//

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  ('ASUS PRIME Z370-P', 'HDMI, SATA3, PCI Express 3.0,, USB 3.1', 9360.00, 2)//

INSERT INTO products
  (name, description, price, catalog_id)
VALUES
  (NULL, 'HDMI, SATA3, PCI Express 3.0,, USB 3.1', 9360.00, 2)//

CREATE TRIGGER validate_name_description_update BEFORE UPDATE ON products
FOR EACH ROW BEGIN
  IF NEW.name IS NULL AND NEW.description IS NULL THEN
    SIGNAL SQLSTATE '45000'
    SET MESSAGE_TEXT = 'Both name and description are NULL';
  END IF;
END//
 







