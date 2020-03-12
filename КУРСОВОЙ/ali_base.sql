-- Создаем базу данных интернет- магазина aliexpress
CREATE DATABASE ali;

-- Делаем её текущей
USE ali;

-- 1. Создаем таблицу категорий товара

CREATE TABLE categories (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  cat_name VARCHAR(100) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Заполняем
INSERT INTO categories(cat_name) VALUES
('Women’s Clothing'),
('Men’s Clothing'),
('Phones & Accessories');


-- 2. Создаем таблицу групп товара

CREATE TABLE groupss (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  gr_name VARCHAR(100) NOT NULL,
  categories_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Заполняем
INSERT INTO groupss (gr_name, categories_id) VALUES
('Dresses','1'),
('Blouses & Shirts','1'),
('Hoodies & Sweatshirts','2'),
('Tops & Tees','2'),
('Cellphones','3'),
('iPhones','3');

SELECT * FROM groupss LIMIT 10;

-- 3. Создаем таблицу товара
DROP TABLE IF EXISTS products;
CREATE TABLE products (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  pr_name VARCHAR(255) NOT NULL,
  groupss_id INT UNSIGNED NOT NULL,
  categories_id INT UNSIGNED NOT NULL,
  photo_id INT UNSIGNED,
  price INT NOT NULL,
  price_discount INT NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );
 
 -- Заполняем
INSERT INTO products (pr_name, groupss_id, categories_id, price, price_discount) VALUES
('Women Sexy Stage Wear Bling Long Dress Gold Tassel Sparkling Crystals Costumes Nightclub Wedding Party Stage Dance Costumes','1','1','110.3724','79.98'),
('Green Tassels Crystals Skinny Long Dress Women Fashion Bar Outfit Party Fringed Rhinestones Dance Costume Show Stage Wear','1','1','59.8782','43.39'),
('Women Fashion Casual Stripe Print V Neck Tops Long Sleeve Plus Size Slim Fit Irregular Spring Autumn Pullover Cotton Blouse','2','1','7.99','7.99'),
('Black Rose Shirt, Rose Tshirt, Pocket Rose T Shirt, Roses White Tee, Hypebeast Clothing, Trendy T-Shirt, Streetwear Shirts-D998','2','1','6.31','6.31'),
('New quick-drying sports hoodie men loose street personality printing wild men hoodies casual simple men jogging hoodies men','3','2','23.535','15.69'),
('Spring New Camo Jacket Men Fashion Washed Military Wind Hooded Jacket Man Streetwear Hip Hop Loose Bomber Jacket Male Clothes','3','2','33.9053','23.71'),
('2019 Spring Men Jogging Pants GYM Training Pant Sportswear Joggers Sports Pants Men Running Swearing Pants Jogging Sweatpants','4','2','6.405','4.27'),
('2020 TEAM UAE PRO cycling jersey 9D gel bike shorts suit MTB Ropa Ciclismo mens summer bicycling Maillot culotte clothing','4','2','26.6399','20.03'),
('ELEPHONE U3H Helio P70 Octa Core Smartphone 8GB 256GB 6.53" FHD+ Screen 48MP IMX586 Rear Cam 24MP Selfie Face Unlock Android 10','5','3','467.987','359.99'),
('Teclast P10HD 4G Phone Call Tablets Octa Core 10.1 inch IPS 1920×1200 3GB RAM 32GB ROM SC9863A GPS Android 9.0 6000mAh tablet PC','5','3','190.9699','150.37'),
('Apple iPhone 7 - 32GB - Black (AT&T) A1778 (GSM)','6','3','169.45','135.56'),
('Apple iPhone 7 - 32GB - Black (AT&T) A1778 (GSM)','6','3','282.647','245.78');

-- Заполняем photo_id

UPDATE products SET photo_id = FLOOR(1 + (RAND() * 100));

SELECT * FROM products LIMIT 12;

-- 4. Создаем таблицу товара "остатки по размеру"
DROP TABLE IF EXISTS quantity_sizer;
CREATE TABLE quantity_sizer(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  products_id INT UNSIGNED NOT NULL,
  quantity INT NOT NULL,
  raz_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );

 -- Заполняем
INSERT INTO quantity_sizer (products_id, quantity, raz_id) VALUES
('1','48','2'),
('2','199','2'),
('3','174','3'),
('3','174','2'),
('3','174','1'),
('3','174','5'),
('4','476','3'),
('4','476','2'),
('4','476','1'),
('4','476','5'),
('4','476','4'),
('5','592','2'),
('5','592','1'),
('5','592','4'),
('6','5993','2'),
('6','5993','1'),
('6','5993','3'),
('7','7998','3'),
('7','7998','2'),
('7','7998','1'),
('7','7998','5'),
('7','7998','4'),
('8','1677','2'),
('9','1164','1'),
('10','1427','1'),
('11','2356','1'),
('12','154','1');


SELECT * FROM quantity_sizer;

-- 5. Создаем таблицу товара "остатки по цвету"

CREATE TABLE quantity_colors(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  products_id INT UNSIGNED NOT NULL,
  quantity INT NOT NULL,
  colors_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );

 -- Заполняем
INSERT INTO quantity_colors (products_id, quantity, colors_id) VALUES
 ('1','48','8'),
('2','199','3'),
('3','174','7'),
('3','174','1'),
('3','174','2'),
('3','174','6'),
('4','595','7'),
('4','595','1'),
('4','595','4'),
('4','595','6'),
('5','592','1'),
('5','592','4'),
('5','592','5'),
('6','5993','4'),
('6','5993','3'),
('6','5993','1'),
('7','19995','7'),
('7','19995','6'),
('8','559','1'),
('8','559','3'),
('8','559','5'),
('9','582','1'),
('9','582','2'),
('10','1427','1'),
('11','1178','1'),
('11','1178','2'),
('12','154','1');

SELECT * FROM quantity_colors LIMIT 12;

-- 6. Создаем таблицу товара "остатки по продавцу"
 CREATE TABLE quantity_sellers(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  products_id INT UNSIGNED NOT NULL,
  quantity INT NOT NULL,
  sellers_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  );
 
  -- Заполняем
INSERT INTO quantity_sellers (products_id, quantity, sellers_id) VALUES
 ('1','48','8'),
('2','199','8'),
('3','696','2'),
('4','2380','4'),
('5','1776','1'),
('6','5993','1'),
('6','5993','5'),
('6','5993','7'),
('7','19995','7'),
('7','19995','6'),
('8','839','7'),
('8','838','6'),
('9','1164','3'),
('10','1427','9'),
('11','1178','3'),
('11','1178','9'),
('12','77','3'),
('12','77','9');

SELECT * FROM quantity_sellers LIMIT 12;

-- 7. Создаем таблицу "размеров"
DROP TABLE IF EXISTS raz;
 CREATE TABLE raz(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  sizze CHAR(100) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Заполняем
INSERT INTO raz(sizze) VALUES
('l'),
('m'),
('s'),
('xl'),
('xs');

SELECT * FROM raz;
DESC raz;


-- 8. Создаем таблицу "цветов"

 CREATE TABLE colors(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  color CHAR(100) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Заполняем
INSERT INTO colors(color) VALUES
('black'),
('blue'),
('green'),
('grey'),
('khaki'),
('red'),
('white'),
('multi');

SELECT * FROM colors;


-- 9. Создаем таблицу "продавцов"
DROP TABLE IF EXISTS sellers;
 CREATE TABLE sellers(
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
  seller CHAR(100) NOT NULL,
  country CHAR(100) NOT NULL,
  address CHAR(100) NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- генерим данные с помощью filldb
-- заливаем дамп

SELECT * FROM sellers;

-- 10. Создаем таблицу пользователей
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


-- генерим данные с помощью filldb
-- заливаем дамп

SELECT * FROM users LIMIT 10;

-- 11. Создаем таблицу профилей
DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
  birthdate DATE,
  sex CHAR(1) NOT NULL,
  hometown VARCHAR(100),
  country VARCHAR(100),
  photo_id INT UNSIGNED,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- генерим данные с помощью filldb
-- заливаем дамп

SELECT * FROM profiles LIMIT 10;

-- Выставляем значения пола при помощи использования временной таблицы
CREATE TEMPORARY TABLE sex (sex CHAR(1));
INSERT INTO sex VALUES ('m'), ('f');
UPDATE profiles SET sex = (SELECT sex FROM sex ORDER BY RAND() LIMIT 1);
-- Связываем таблицу профиль с таблицей юзерс по внешними ключу
ALTER TABLE profiles ADD COLUMN user_id INT UNSIGNED NOT NULL FIRST;
UPDATE profiles SET user_id = FLOOR(1 + (RAND() * 100));

-- 12. Создаем таблицу покупок
DROP TABLE IF EXISTS purchases;
 CREATE TABLE purchases(
 id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
 users_id INT UNSIGNED NOT NULL,
 products_id INT UNSIGNED NOT NULL,
 sizes_id INT UNSIGNED NOT NULL,
 colors_id INT UNSIGNED NOT NULL,
 sellers_id INT UNSIGNED NOT NULL,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- генерим данные с помощью filldb
-- заливаем дамп
-- корректируем данные 
SELECT * FROM purchases LIMIT 10;
UPDATE purchases SET users_id = FLOOR(1 + (RAND() * 100));
UPDATE purchases SET products_id = FLOOR(1 + (RAND() * 12));
UPDATE purchases SET sizes_id = FLOOR(1 + (RAND() * 5));
UPDATE purchases SET colors_id = FLOOR(1 + (RAND() * 8));
UPDATE purchases SET sellers_id = FLOOR(1 + (RAND() * 9));

-- 13. Создаем таблицу отзывов
CREATE TABLE comment (
  id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, 
  purchases_id INT UNSIGNED NOT NULL,
  body TEXT NOT NULL,
  created_at DATETIME DEFAULT NOW()
);

-- генерим данные с помощью filldb
-- заливаем дамп
-- корректируем purchases_id

SELECT * FROM comment LIMIT 10;
UPDATE comment SET purchases_id = FLOOR(1 + (RAND() * 100));
 
 
 
