-- 1. Хранимая функция выводит сумму покупателя, истратившего больше всего на покупки в магазине

DELIMITER -
CREATE FUNCTION big_sale (bg INT)
RETURNS FLOAT READS SQL DATA

  BEGIN
    
    DECLARE requests_bg INT;
    
    SET requests_bg = 
      (SELECT DISTINCT SUM(price) AS rashod
FROM users
JOIN purchases
ON users.id=purchases.users_id
JOIN products 
ON purchases.products_id=products.id
GROUP BY last_name
ORDER BY rashod DESC
LIMIT 1);
    
    RETURN requests_bg;
  END-
  
DELIMITER ;
-- проверяем 637 USD
SELECT TRUNCATE(big_sale(1), 1) AS big_sale;
-- просмотр функции
SHOW CREATE FUNCTION big_sale;


-- 2. Создаем триггер, который будет вести логи по продавцам, покупателям, покупкам и новому товару в каталоге

-- создаем таблицу по логам
CREATE TABLE Logs (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    created_at datetime DEFAULT CURRENT_TIMESTAMP,
    table_name varchar(50) NOT NULL,
    row_id INT UNSIGNED NOT NULL,
    row_name varchar(255)
) ENGINE = Archive;

-- создаем триггер
DELIMITER //

CREATE TRIGGER purchases_insert AFTER INSERT ON purchases
FOR EACH ROW
BEGIN
    INSERT INTO Logs VALUES (NULL, DEFAULT, "purchases", NEW.id, NEW.name);
END //

CREATE TRIGGER users_insert AFTER INSERT ON users
FOR EACH ROW
BEGIN
    INSERT INTO Logs VALUES (NULL, DEFAULT, "users", NEW.id, NEW.name);
END //

CREATE TRIGGER sellers_insert AFTER INSERT ON sellers
FOR EACH ROW
BEGIN
    INSERT INTO Logs VALUES (NULL, DEFAULT, "sellers", NEW.id, NEW.name);
END //

CREATE TRIGGER products_insert AFTER INSERT ON products
FOR EACH ROW
BEGIN
    INSERT INTO Logs VALUES (NULL, DEFAULT, "products", NEW.id, NEW.name);
END //

DELIMITER;

-- 3. Создаем процедуру, которая будет выводить поставщика, фамилию, 
-- макимальную покупку и минимальную покупку из столбца максимальных продаж

DELIMITER //
CREATE PROCEDURE salespeople(str VARCHAR(45))
BEGIN
    CASE str
    WHEN "Макс покупка"
    THEN
        SELECT DISTINCT 
  sellers.seller AS sel,
  FIRST_VALUE(users.last_name) 
    OVER lns AS oldest_last_name,
    MAX(products.price)
    OVER sal AS max_sale,
    MIN(products.price)
    OVER salm AS min_sale
    FROM sellers
      JOIN purchases 
        ON purchases.sellers_id = sellers.id
      JOIN users 
        ON purchases.users_id = users.id
      JOIN profiles 
        ON profiles.user_id = users.id
      JOIN products 
        ON purchases.products_id=products.id
        WINDOW 
          lns AS (PARTITION BY sellers.id ORDER BY profiles.birthdate),
          sal AS (PARTITION BY sellers.id ORDER BY products.price DESC),
         salm AS (PARTITION BY sellers.id ORDER BY products.price)
         ORDER BY max_sale DESC 
        LIMIT 1;
    WHEN "Мин покупка"
    THEN
        SELECT DISTINCT 
  sellers.seller AS sel,
  FIRST_VALUE(users.last_name) 
    OVER lns AS oldest_last_name,
    MAX(products.price)
    OVER sal AS max_sale,
    MIN(products.price)
    OVER salm AS min_sale
    FROM sellers
      JOIN purchases 
        ON purchases.sellers_id = sellers.id
      JOIN users 
        ON purchases.users_id = users.id
      JOIN profiles 
        ON profiles.user_id = users.id
      JOIN products 
        ON purchases.products_id=products.id
        WINDOW 
          lns AS (PARTITION BY sellers.id ORDER BY profiles.birthdate),
          sal AS (PARTITION BY sellers.id ORDER BY products.price DESC),
         salm AS (PARTITION BY sellers.id ORDER BY products.price)
         ORDER BY max_sale 
        LIMIT 1;
    END CASE;
END //
DELIMITER ;

-- смотрим
CALL salespeople("Макс покупка");
CALL salespeople("Мин покупка");