-- Добавляем внешние ключи в БД ali

USE ali;


-- 1. Таблицу групп товаров связываем с таблицей категории товаров

ALTER TABLE groupss
 ADD CONSTRAINT groupss_categories_id_fk 
    FOREIGN KEY (categories_id) REFERENCES categories(id);
   
   
-- 2. Таблицу товаров связываем с группой и категорией товаров

   ALTER TABLE products
 ADD CONSTRAINT products_categories_id_fk 
    FOREIGN KEY (categories_id) REFERENCES categories(id),
     ADD CONSTRAINT products_groupss_id_fk 
    FOREIGN KEY (groupss_id) REFERENCES groupss(id);
   
   
-- 3.Связываем таблицу "остатки по размеру"
    
   ALTER TABLE quantity_sizer
 ADD CONSTRAINT quantity_sizer_products_id_fk
    FOREIGN KEY (products_id) REFERENCES products(id);
   
   ALTER TABLE quantity_sizer
 ADD CONSTRAINT quantity_sizer_raz_id_fk
    FOREIGN KEY (raz_id) REFERENCES raz(id);
    
 
 -- 4. Связываем таблицу "остатки по цвету"

      ALTER TABLE quantity_colors
 ADD CONSTRAINT quantity_colors_products_id_fk
    FOREIGN KEY (products_id) REFERENCES products(id);
   
   ALTER TABLE quantity_colors
 ADD CONSTRAINT quantity_colors_colors_id_fk
    FOREIGN KEY (colors_id) REFERENCES colors(id);
   
   -- 5. Связываем таблицу "остатки по продавцу"
   
      ALTER TABLE quantity_sellers
 ADD CONSTRAINT quantity_sellers_products_id_fk
    FOREIGN KEY (products_id) REFERENCES products(id);
   
   ALTER TABLE quantity_sellers
 ADD CONSTRAINT quantity_sellers_sellers_id_fk
    FOREIGN KEY (sellers_id) REFERENCES sellers(id);
   
   -- 6. Связываем таблицу users  и profiles
   
   ALTER TABLE profiles 
 ADD CONSTRAINT profiles_user_id_fk
    FOREIGN KEY (user_id) REFERENCES users(id);
   
   -- 7. Связываем таблицу покупок
   
   ALTER TABLE purchases 
 ADD CONSTRAINT purchases_users_id_fk
    FOREIGN KEY (users_id) REFERENCES users(id);
   
   ALTER TABLE purchases 
 ADD CONSTRAINT purchases_products_id_fk
    FOREIGN KEY (products_id) REFERENCES products(id),
    ADD CONSTRAINT purchases_sizes_id_fk
    FOREIGN KEY (sizes_id) REFERENCES raz(id),
    ADD CONSTRAINT purchases_colors_id_fk
    FOREIGN KEY (colors_id) REFERENCES colors(id),
    ADD CONSTRAINT purchases_sellers_id_fk
    FOREIGN KEY (sellers_id) REFERENCES sellers(id);
   
  -- 8. Связываем таблицу отзывов и покупок
  
   ALTER TABLE comment 
 ADD CONSTRAINT comment_purchases_id_fk
    FOREIGN KEY (purchases_id) REFERENCES purchases(id);
    
   
    
    
    
    ;
   
   
   
   
   
   
   