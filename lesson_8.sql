-- 1. Добавляем внешние ключи для всех таблиц базы данных vk

USE vk;

-- Таблица профилей
DESC profiles;
SELECT * FROM profiles LIMIT 10;

ALTER TABLE profiles
  ADD CONSTRAINT profiles_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;
     
     ALTER TABLE profiles
  ADD CONSTRAINT profiles_photo_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id)
      ON DELETE CASCADE;

-- Таблица сообщений
     DESC messages;
    SELECT * FROM messages;

    ALTER TABLE messages
  ADD CONSTRAINT messages_from_user_id_fk 
    FOREIGN KEY (from_user_id) REFERENCES users(id),
  ADD CONSTRAINT messages_to_user_id_fk 
    FOREIGN KEY (to_user_id) REFERENCES users(id);
   
    ALTER TABLE messages
  ADD CONSTRAINT messages_to_community_id_fk 
    FOREIGN KEY (to_community_id) REFERENCES communities(id);
   
   -- Таблица дружбы
   DESC friendship;
SELECT * FROM friendship LIMIT 10;


ALTER TABLE friendship
  ADD CONSTRAINT friendship_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id),
  ADD CONSTRAINT friendship_friend_id_fk 
    FOREIGN KEY (friend_id) REFERENCES users(id),
     ADD CONSTRAINT friendship_status_id_fk 
    FOREIGN KEY (status_id) REFERENCES friendship_statuses(id);
   
   
   -- Таблица связи пользователей и групп
     DESC communities_users;
SELECT * FROM communities_users LIMIT 10;

 ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);
    
   ALTER TABLE communities_users
  ADD CONSTRAINT communities_users_community_id_fk 
    FOREIGN KEY (community_id) REFERENCES communities(id);
   
 
   -- Таблица медиафайлов
   DESC media;
SELECT * FROM media LIMIT 10;

ALTER TABLE media
  ADD CONSTRAINT media_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);
   
    ALTER TABLE media
  ADD CONSTRAINT media_media_type_id_fk 
    FOREIGN KEY (media_type_id) REFERENCES media_types(id);
   
   
   -- Таблица постов
      DESC post;
SELECT * FROM post LIMIT 10;

ALTER TABLE post 
  ADD CONSTRAINT post_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);
   
   ALTER TABLE post
  ADD CONSTRAINT post_media_id_fk 
    FOREIGN KEY (media_id) REFERENCES media(id);
   
   
   --  Таблица лайков
   DESC likes;
SELECT * FROM likes LIMIT 100;

ALTER TABLE likes 
  ADD CONSTRAINT likes_user_id_fk 
    FOREIGN KEY (user_id) REFERENCES users(id);
   
   ALTER TABLE likes 
  ADD CONSTRAINT likes_target_id_fk 
    FOREIGN KEY (target_id) REFERENCES users(id);
   
   ALTER TABLE likes 
  ADD CONSTRAINT likes_target_type_id_fk 
    FOREIGN KEY (target_type_id) REFERENCES target_types(id);
   
   -- Задачи 6-го урока
   -- 2. Подсчитать общее количество лайков, которые получили 10 самых молодых пользователей.
   -- получаем 18 лайков
USE vk;
SELECT * FROM profiles;
SELECT * FROM likes;
DESC likes;


SELECT SUM(tar) AS ob_kol
FROM (SELECT birthdate, COUNT(target_id) AS tar
FROM profiles
JOIN likes
ON profiles.user_id=likes.user_id
GROUP BY birthdate
ORDER BY birthdate DESC
LIMIT 10)AS combi;

-- 3. Определить кто больше поставил лайков (всего) - мужчины или женщины?
SELECT sex AS pol, COUNT(target_id) AS tar
FROM profiles
JOIN likes
WHERE profiles.user_id =likes.user_id
GROUP BY pol;



-- 4. 10 пользователей с наибольшим количеством лайков за медиафайлы
SELECT users.id, first_name, last_name, COUNT(*) AS total_likes
  FROM users
    JOIN media
      ON users.id = media.user_id
    JOIN likes
      ON media.id = likes.target_id
    JOIN target_types
      ON likes.target_type_id = target_types.id
  WHERE target_types.name = 'media'
  GROUP BY users.id
  ORDER BY total_likes
  LIMIT 10;





   
   
   
   
    
    



   
   
    
   
   
   
   
   
   
   

    
   
   