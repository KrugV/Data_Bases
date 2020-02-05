#
# TABLE STRUCTURE FOR: media
#

DROP TABLE IF EXISTS `media`;

CREATE TABLE `media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `media_type_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(11) NOT NULL,
  `metadata` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (1, 0, 0, 'sint', 806608, NULL, '1991-09-25 02:55:45', '2002-03-03 20:54:15');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (2, 0, 0, 'non', 0, NULL, '2008-09-28 00:29:49', '1985-07-02 14:19:18');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (3, 0, 0, 'ipsam', 423851504, NULL, '1983-01-24 12:07:52', '2001-12-18 00:41:14');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (4, 0, 0, 'officiis', 7, NULL, '2016-12-08 03:28:58', '1970-04-01 12:51:23');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (5, 0, 0, 'occaecati', 323, NULL, '2011-12-29 07:11:40', '1970-04-28 23:41:21');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (6, 0, 0, 'dolorem', 0, NULL, '2015-12-01 11:09:12', '1977-08-25 12:47:10');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (7, 0, 0, 'voluptas', 29, NULL, '1994-05-02 10:04:04', '1982-06-11 01:09:53');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (8, 0, 0, 'culpa', 764, NULL, '1991-11-13 02:47:22', '1999-03-16 10:11:02');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (9, 0, 0, 'dolore', 475, NULL, '1975-01-04 06:02:15', '1972-07-15 12:42:35');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (10, 0, 0, 'eveniet', 2979504, NULL, '1995-06-29 17:30:47', '2005-12-16 13:43:55');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (11, 0, 0, 'nemo', 278582, NULL, '1975-09-18 06:18:37', '2011-08-21 05:11:56');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (12, 0, 0, 'culpa', 0, NULL, '1999-10-16 22:08:48', '2006-07-11 18:11:24');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (13, 0, 0, 'debitis', 5829705, NULL, '2018-01-23 16:34:58', '1978-11-10 11:56:06');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (14, 0, 0, 'aliquam', 370551960, NULL, '1995-12-25 00:05:08', '2003-07-17 14:06:18');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (15, 0, 0, 'ea', 470320424, NULL, '1972-10-21 21:19:05', '1987-08-29 10:21:52');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (16, 0, 0, 'unde', 5421, NULL, '2005-04-06 09:36:54', '1978-09-21 18:56:53');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (17, 0, 0, 'reiciendis', 97985, NULL, '1977-04-28 02:16:17', '2015-10-11 09:41:46');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (18, 0, 0, 'consequatur', 65, NULL, '1998-12-12 14:52:29', '1983-03-10 15:35:51');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (19, 0, 0, 'illum', 0, NULL, '1980-07-24 21:52:36', '2016-10-15 22:33:17');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (20, 0, 0, 'quis', 5854, NULL, '2009-09-15 14:13:49', '1992-03-27 01:29:34');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (21, 0, 0, 'quo', 100, NULL, '2000-06-18 04:07:07', '2013-06-17 09:15:01');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (22, 0, 0, 'modi', 879750, NULL, '1979-06-12 08:44:45', '2001-05-04 14:21:41');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (23, 0, 0, 'cupiditate', 902, NULL, '2019-01-11 14:06:05', '2006-04-03 00:48:48');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (24, 0, 0, 'quis', 970580015, NULL, '1970-04-20 18:11:41', '1980-09-21 15:00:03');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (25, 0, 0, 'nemo', 7, NULL, '1997-03-24 14:54:38', '1984-11-29 11:20:16');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (26, 0, 0, 'ea', 6187542, NULL, '1980-10-29 12:57:17', '2008-09-29 15:59:48');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (27, 0, 0, 'qui', 5179540, NULL, '1985-12-08 02:02:01', '1985-08-06 16:15:53');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (28, 0, 0, 'quaerat', 248713, NULL, '1990-06-24 11:54:02', '1987-06-29 17:29:03');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (29, 0, 0, 'saepe', 15071, NULL, '1982-11-27 15:25:10', '2008-11-20 12:02:14');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (30, 0, 0, 'est', 18726247, NULL, '1977-02-12 08:45:21', '2008-09-12 06:33:38');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (31, 0, 0, 'ea', 917636, NULL, '1985-02-24 15:55:28', '1995-07-22 18:00:08');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (32, 0, 0, 'voluptas', 909307933, NULL, '2019-03-07 05:25:51', '1991-05-20 16:38:00');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (33, 0, 0, 'rem', 727, NULL, '1979-06-15 20:29:05', '1999-03-20 19:10:42');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (34, 0, 0, 'quis', 380833, NULL, '2016-04-09 07:31:58', '2007-02-28 15:05:53');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (35, 0, 0, 'adipisci', 85, NULL, '2016-03-22 01:58:28', '2019-05-06 02:34:33');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (36, 0, 0, 'commodi', 7, NULL, '1982-03-10 23:12:38', '1971-08-17 02:47:48');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (37, 0, 0, 'reiciendis', 88349, NULL, '1993-08-20 15:41:25', '2014-05-20 07:54:54');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (38, 0, 0, 'voluptatum', 822662, NULL, '2014-12-14 11:36:53', '1972-03-17 00:12:38');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (39, 0, 0, 'id', 6841094, NULL, '1986-02-15 16:27:06', '1991-07-05 20:15:06');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (40, 0, 0, 'ipsam', 9249758, NULL, '2016-09-27 05:06:07', '1987-01-03 19:06:49');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (41, 0, 0, 'et', 0, NULL, '1982-06-06 09:29:11', '1997-05-16 03:49:38');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (42, 0, 0, 'sed', 82, NULL, '2001-11-17 04:37:15', '1997-06-25 05:15:57');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (43, 0, 0, 'non', 283, NULL, '2017-07-25 12:15:45', '2006-08-22 13:17:22');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (44, 0, 0, 'ducimus', 60, NULL, '1979-01-14 06:01:56', '2009-10-24 23:59:20');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (45, 0, 0, 'facere', 209767909, NULL, '1977-03-14 23:15:02', '1992-06-10 14:18:41');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (46, 0, 0, 'eius', 780694, NULL, '1998-09-25 23:15:08', '1989-03-28 10:11:42');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (47, 0, 0, 'et', 5517, NULL, '1973-06-01 10:06:35', '2000-11-29 05:46:00');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (48, 0, 0, 'aliquid', 0, NULL, '2009-10-16 14:29:47', '1999-09-07 05:05:27');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (49, 0, 0, 'velit', 75195604, NULL, '2008-05-07 22:44:10', '1997-12-03 07:43:15');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (50, 0, 0, 'non', 19009997, NULL, '1974-05-09 00:16:07', '1984-10-09 12:33:56');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (51, 0, 0, 'dolores', 735254, NULL, '1970-04-04 02:27:20', '1990-02-22 12:02:32');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (52, 0, 0, 'libero', 665284, NULL, '1987-11-08 01:15:09', '2013-04-10 05:32:25');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (53, 0, 0, 'exercitationem', 0, NULL, '1970-07-13 02:33:38', '2003-06-13 05:57:10');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (54, 0, 0, 'ex', 0, NULL, '2008-09-06 18:33:13', '2016-09-22 15:06:40');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (55, 0, 0, 'aliquid', 0, NULL, '2017-12-14 14:50:46', '1987-02-06 04:32:19');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (56, 0, 0, 'ea', 41462, NULL, '1982-07-31 02:04:33', '1986-06-14 19:14:35');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (57, 0, 0, 'itaque', 1622, NULL, '2000-09-29 15:01:30', '1987-03-14 22:53:51');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (58, 0, 0, 'molestiae', 9, NULL, '1982-09-25 13:12:01', '1991-06-06 14:58:40');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (59, 0, 0, 'dolorum', 0, NULL, '1973-12-13 08:21:30', '1975-09-20 01:05:05');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (60, 0, 0, 'sit', 485675122, NULL, '1987-08-07 11:20:48', '1973-05-11 14:22:03');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (61, 0, 0, 'aut', 59, NULL, '1970-03-02 00:08:11', '1970-06-05 07:09:35');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (62, 0, 0, 'similique', 43, NULL, '1979-04-20 04:13:15', '2015-11-14 13:33:08');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (63, 0, 0, 'commodi', 0, NULL, '2010-05-31 19:07:03', '2019-07-18 01:09:41');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (64, 0, 0, 'illum', 81015501, NULL, '2001-01-19 07:00:19', '1972-07-04 00:27:42');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (65, 0, 0, 'earum', 922, NULL, '1982-01-21 14:40:31', '2008-02-05 19:24:23');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (66, 0, 0, 'quis', 1124, NULL, '2011-03-13 22:24:04', '2001-10-02 10:21:20');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (67, 0, 0, 'doloremque', 35765, NULL, '1977-07-17 09:18:29', '2018-09-16 06:17:39');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (68, 0, 0, 'et', 703996481, NULL, '1992-06-13 00:04:28', '2016-12-21 08:02:24');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (69, 0, 0, 'tempore', 7886974, NULL, '1974-10-21 14:14:52', '2002-01-17 01:33:42');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (70, 0, 0, 'expedita', 1, NULL, '2016-07-28 02:40:08', '1997-02-19 11:55:54');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (71, 0, 0, 'magnam', 215041, NULL, '1992-03-15 06:18:54', '2012-02-08 09:07:05');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (72, 0, 0, 'nihil', 8997256, NULL, '1992-09-03 17:44:42', '2001-01-14 13:45:49');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (73, 0, 0, 'vel', 99, NULL, '2005-03-27 05:49:19', '1971-02-02 04:43:02');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (74, 0, 0, 'nostrum', 2, NULL, '1986-10-30 23:54:51', '1975-09-21 02:15:01');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (75, 0, 0, 'sint', 32581793, NULL, '2019-12-13 23:56:13', '1976-01-19 07:02:12');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (76, 0, 0, 'exercitationem', 0, NULL, '1983-11-19 22:37:15', '1990-11-13 04:34:35');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (77, 0, 0, 'aspernatur', 6294, NULL, '1981-12-02 08:07:21', '1970-07-14 07:27:25');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (78, 0, 0, 'libero', 138019874, NULL, '1970-04-30 00:29:26', '1998-02-14 02:01:17');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (79, 0, 0, 'voluptatem', 17535651, NULL, '1993-07-30 10:27:57', '1976-04-25 09:28:54');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (80, 0, 0, 'qui', 508, NULL, '1990-04-26 16:01:31', '1975-12-21 16:38:20');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (81, 0, 0, 'non', 9748056, NULL, '2005-08-16 20:29:22', '1989-05-30 14:31:33');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (82, 0, 0, 'explicabo', 74005522, NULL, '1990-04-09 14:43:05', '2002-11-28 09:09:36');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (83, 0, 0, 'minima', 0, NULL, '1970-07-09 17:56:21', '1997-11-14 13:47:45');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (84, 0, 0, 'odio', 60, NULL, '2004-06-25 18:45:37', '1974-10-24 15:03:37');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (85, 0, 0, 'maxime', 4927490, NULL, '2012-10-19 12:12:16', '1973-11-05 17:11:03');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (86, 0, 0, 'voluptatum', 914, NULL, '1995-05-28 13:42:48', '2002-08-10 06:44:47');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (87, 0, 0, 'voluptates', 26, NULL, '2009-02-13 23:58:40', '1996-06-21 01:43:57');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (88, 0, 0, 'accusamus', 26500, NULL, '2019-07-29 06:42:50', '2017-02-15 17:46:45');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (89, 0, 0, 'corporis', 67261, NULL, '1987-04-25 17:58:48', '1998-10-01 17:41:16');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (90, 0, 0, 'asperiores', 6519528, NULL, '1996-01-09 01:47:55', '1976-02-05 07:50:52');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (91, 0, 0, 'quae', 0, NULL, '1982-10-01 03:58:52', '2007-04-24 19:26:20');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (92, 0, 0, 'delectus', 0, NULL, '2011-08-12 21:15:23', '1998-12-02 01:11:14');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (93, 0, 0, 'iste', 637, NULL, '2007-12-23 21:09:16', '2008-11-18 01:50:39');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (94, 0, 0, 'sint', 286164, NULL, '1997-02-05 11:40:12', '1973-03-27 04:44:43');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (95, 0, 0, 'ea', 876, NULL, '1982-07-15 23:51:34', '2016-08-07 17:51:55');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (96, 0, 0, 'eius', 568, NULL, '1970-04-16 00:36:18', '1992-07-11 16:02:37');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (97, 0, 0, 'dolore', 0, NULL, '1975-07-04 00:51:33', '1991-06-05 05:23:41');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (98, 0, 0, 'deserunt', 85203471, NULL, '1995-01-10 00:22:01', '1983-02-08 05:10:56');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (99, 0, 0, 'voluptate', 94685153, NULL, '1976-02-05 01:21:41', '2018-01-28 01:24:38');
INSERT INTO `media` (`id`, `media_type_id`, `user_id`, `filename`, `size`, `metadata`, `created_at`, `updated_at`) VALUES (100, 0, 0, 'optio', 5625220, NULL, '2011-07-09 06:27:42', '1986-08-02 09:19:52');


