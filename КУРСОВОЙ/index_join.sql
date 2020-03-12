-- 1. Соединяем данные из двух таблиц через colors_id, чтобы узнать какой цвет чаще покупается
-- получается, что белый, скрин прилагаю
SELECT COUNT(users_id) AS kol, color
FROM purchases, colors
WHERE colors_id=colors.id
GROUP BY colors_id 
ORDER BY kol DESC;

-- 2. Считаем, кто чаще покупает женщины или мужчины
-- поллучается, что женщины 52 и 38 мужчины

SELECT sex, COUNT(user_id) AS kol
FROM profiles,purchases
WHERE purchases.users_id=profiles.user_id 
GROUP BY sex
ORDER BY kol DESC;

-- 3. Считаем, какой пользователь потратил больше всего денег на покупки
-- получается 637USD-Jacobs

SELECT DISTINCT last_name, SUM(price) AS rashod
FROM users
JOIN purchases
ON users.id=purchases.users_id
JOIN products 
ON purchases.products_id=products.id
GROUP BY last_name
ORDER BY rashod DESC
LIMIT 10;

-- 4. У какой компании самый дорогой запас продукции в долларах
-- находим и умножаем остатки на цену
-- Jones ltd= 765625USD

SELECT DISTINCT seller,SUM(quantity_sellers.quantity*products.price) AS s
FROM sellers
JOIN quantity_sellers
ON sellers.id=quantity_sellers.sellers_id
JOIN products 
ON quantity_sellers.products_id=products.id
GROUP BY seller 
ORDER BY s DESC
LIMIT 10;


-- 5. Создаем составной индекс на таблицу покупок
-- товар и поставщик
SELECT * FROM purchases WHERE products_id =5 AND sellers_id =3;
-- индекс
CREATE INDEX purchases_products_id_purchases_sellers_id_idx ON purchases(products_id, sellers_id);

-- 6. Создаем составной индекс на таблицу остатков по цвету
SELECT * FROM quantity_colors WHERE products_id =5 AND colors_id =1;
-- индекс
CREATE INDEX quantity_colors_products_id_colors_id_idx ON quantity_colors(products_id, colors_id);


-- 7.Создайте представление, которое выводит название товара и категории

CREATE OR REPLACE VIEW products_categories AS
SELECT
p.pr_name,
c.cat_name 
FROM
products AS p
JOIN
categories AS c
ON p.categories_id =c.id;

--  смотрим
SELECT*FROM products_categories;

-- 8. Представление, которе выводит фамилию и цвет товара

CREATE OR REPLACE VIEW users_purchases_colors AS
SELECT
u.last_name,
c.color
FROM 
users AS u
JOIN
purchases AS p
ON u.id=p.users_id
JOIN
colors AS c
ON p.colors_id=c.id;

--  смотрим
SELECT*FROM users_purchases_colors;

-- 9. Необходимо вывести продавца, самого взрослого покупателя, а также самую дорогую и самую дешевую покупку

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
         salm AS (PARTITION BY sellers.id ORDER BY products.price);












