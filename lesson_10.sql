-- 1. Проанализировать какие запросы могут выполняться наиболее часто в 
-- процессе работы приложения и добавить необходимые индексы.

-- рассмотрим запрос  с сортировкой по дате создания медиа и применим к нему индекс

USE vk;
SELECT * FROM media LIMIT 10;


SELECT media_type_id, created_at
FROM media
WHERE created_at ="2007-08-27 18:03:34"
LIMIT 10;

CREATE INDEX media_created_at_idx ON media(created_at);

-- рассмотрим составной запрос таблицы лайков и применим к нему составной индекс

SELECT * FROM likes LIMIT 10;

SELECT*FROM likes WHERE user_id =85 AND target_type_id =3;

CREATE INDEX likes_user_id_target_type_id_idx ON likes(user_id, target_type_id);

-- 2. Задание на оконные функции
-- Построить запрос, который будет выводить следующие столбцы:
-- имя группы
-- среднее количество пользователей в группах
-- самый молодой пользователь в группе
-- самый пожилой пользователь в группе
-- общее количество пользователей в группе
-- всего пользователей в системе
-- отношение в процентах (общее количество пользователей в группе / всего пользователей в системе) * 100


SELECT * FROM communities_users LIMIT 10;
SELECT * FROM communities;
SELECT * FROM users LIMIT 10;

-- Не смог вытащить общее количество пользователей простым способом,
-- пришлось применить RIGHT JOIN
SELECT DISTINCT communities.name,
 COUNT(profiles.birthdate) OVER ()/MAX(communities.id) OVER () AS average,
  MAX(profiles.birthdate) OVER w AS yang,
   MIN(profiles.birthdate) OVER w AS old,
    COUNT(profiles.birthdate) OVER w AS kol_grup,
     MAX(users.id) OVER () AS kols,
      COUNT(profiles.birthdate) OVER w/MAX(users.id) OVER () *100 AS "%%"
    FROM (communities
      JOIN communities_users
        ON communities.id = communities_users.community_id
         JOIN profiles 
        ON profiles.user_id=communities_users.user_id
        RIGHT JOIN users 
        ON users.id= profiles.user_id)
        WINDOW w AS (PARTITION BY communities.id);
       



