DROP SCHEMA IF EXISTS `SpotifyClone`;
CREATE SCHEMA IF NOT EXISTS `SpotifyClone`;

CREATE TABLE `SpotifyClone`.`User`(
	`user_id` INT NOT NULL AUTO_INCREMENT,
	`username` VARCHAR(100) NOT NULL,
	`age` INT NOT NULL,
	`plan_date` DATETIME NOT NULL,
    `plan_id` INT,
PRIMARY KEY (`user_id`)
);

CREATE TABLE `SpotifyClone`.`Plan`(
	`plan_id` INT NOT NULL AUTO_INCREMENT, 
    `plan_type` VARCHAR(30) NOT NULL,
    `plan_value` FLOAT(5,2) NOT NULL,
PRIMARY KEY (`plan_id`)
);

CREATE TABLE `SpotifyClone`.`PlaybackHistory`(
    `user_id` INT NOT NULL,
    `song_id` INT NOT NULL,
    `reproduction_date` VARCHAR(100) NOT NULL,
CONSTRAINT PRIMARY KEY (`user_id`, `song_id`)
);

CREATE TABLE `SpotifyClone`.`FollowingArtists`(
	`user_id` INT,
    `artist_id` INT,
PRIMARY KEY (`user_id`, `artist_id`)
);

CREATE TABLE `SpotifyClone`.`Artists`(
	`artist_id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(50) NOT NULL,
    `last_name` VARCHAR(50) DEFAULT NULL,
PRIMARY KEY (`artist_id`)
);

CREATE TABLE `SpotifyClone`.`Album`(
	`album_id` INT NOT NULL AUTO_INCREMENT,
    `album_name` VARCHAR(100) NOT NULL,
    `artist_id` INT NOT NULL,
	`release_year` INT NOT NULL,
PRIMARY KEY (`album_id`)
);

CREATE TABLE `SpotifyClone`.`Songs`(
	`song_id` INT NOT NULL AUTO_INCREMENT,
    `song_name` VARCHAR(100) NOT NULL,
    `album_id` INT NOT NULL,
    `artist_id` INT NOT NULL,
    `duration` INT NOT NULL,
PRIMARY KEY (`song_id`)
);

ALTER TABLE `SpotifyClone`.`PlaybackHistory`
ADD CONSTRAINT `fk_history_user_id`
FOREIGN KEY (`user_id`)
REFERENCES `User`(`user_id`);

ALTER TABLE `SpotifyClone`.`PlaybackHistory`
ADD CONSTRAINT `fk_history_song_id`
FOREIGN KEY (`song_id`)
REFERENCES `Songs`(`song_id`);

ALTER TABLE `SpotifyClone`.`FollowingArtists`
ADD CONSTRAINT `fk_followingArt_artists_id`
FOREIGN KEY (`artist_id`)
REFERENCES `Artists`(`artist_id`);

ALTER TABLE `SpotifyClone`.`FollowingArtists`
ADD CONSTRAINT `fk_followingArt_user_id`
FOREIGN KEY (`user_id`)
REFERENCES `User`(`user_id`);

ALTER TABLE `SpotifyClone`.`Album` 
ADD CONSTRAINT `fk_album_artist_id`
FOREIGN KEY (`artist_id`)
REFERENCES `Artists`(`artist_id`);

ALTER TABLE `SpotifyClone`.`Songs`
ADD CONSTRAINT `fk_songs_album_id`
FOREIGN KEY (`album_id`)
REFERENCES `Album`(`album_id`);

ALTER TABLE `SpotifyClone`.`Songs`
ADD CONSTRAINT `fk_songs_artists_id`
FOREIGN KEY (`artist_id`)
REFERENCES `Artists`(`artist_id`);

ALTER TABLE `SpotifyClone`.`User`
ADD FOREIGN KEY (`plan_id`)
REFERENCES `Plan`(`plan_id`);


INSERT INTO `SpotifyClone`.`User` (`user_id`, `username`, `age`, `plan_date`)
VALUES (1, 'Thati', 23, '2019-10-20'),
  (2, 'Cintia', 35, '2017-12-30'),
  (3, 'Bill', 20, '2019-06-05'),
  (4, 'Roger', 45, '2020-05-13'),
  (5, 'Norman', 58, '2017-02-17'),
  (6, 'Patrick', 33, '2017-01-06'),
  (7, 'Vivian', 26, '2018-01-05'),
  (8, 'Carol', 19, '2018-02-14'),
  (9, 'Angelina', 42, '2018-04-29'),
  (10, 'Paul', 46, '2017-01-17');
  
INSERT INTO `SpotifyClone`.`Plan` (`plan_id`, `plan_type`, `plan_value`) 
VALUES (1, 'gratuito', 0),
  (2, 'universitário', 5.99),
  (3, 'pessoal', 6.99),
  (4, 'familiar', 7.99);

INSERT INTO `SpotifyClone`.`Artists` (`artist_id`, `first_name`, `last_name`) 
VALUES (1, 'Walter', 'Phoenix'),
  (2, 'Peter', 'Strong'),
  (3, 'Lance', 'Day'),
  (4, 'Freedie', 'Shannon'),
  (5, 'Tyler', 'Isle'),
  (6, 'Fog', NULL);
  
INSERT INTO `SpotifyClone`.`Album` (`album_id`, `album_name`, `artist_id`, `release_year`)
VALUES (1, 'Envious', 1, 1990),
  (2, 'Exuberant', 1, 1993),
  (3, 'Hallowed Steam', 2, 1995),
  (4, 'Incandescent', 3, 1998),
  (5, 'Temporary Culture', 4, 2001),
  (6, 'Library of liberty', 4, 2003),
  (7, 'Chained Down', 5, 2007),
  (8, 'Cabinet of fools', 5, 2012),
  (9, 'No guarantees', 5, 2015),
  (10, 'Apparatus', 6, 2015);
  
INSERT INTO `SpotifyClone`.`Songs` (`song_id`, `song_name`, `duration`, `artist_id`, `album_id`)
VALUES (1, "Soul For Us", 200, 1, 1),
  (2, "Reflections Of Magic", 163, 1, 1),
  (3, "Dance With Her Own", 116, 1, 1),
  (4, "Troubles Of My Inner Fire", 203, 1, 2),
  (5, "Time Fireworks", 152, 1, 2),
  (6, "Magic Circus", 105, 2, 3),
  (7, "Honey, So Do I", 207, 2, 3),
  (8, "Sweetie, Let's Go Wild", 139, 2, 3),
  (9, "She Knows", 244, 2, 3),
  (10, "Fantasy For Me", 100, 3, 4),
  (11, "Celebration Of More", 146, 3, 4),
  (12, "Rock His Everything", 223, 3, 4),
  (13, "Home Forever", 231, 3, 4),
  (14, "Diamond Power", 241, 3, 4),
  (15, "Let's Be Silly", 132, 3, 4),
  (16, "Thang Of Thunder", 240, 4, 5),
  (17, "Words Of Her Life", 185, 4, 5),
  (18, "Without My Streets", 176, 4, 5),
  (19, "Need Of The Evening", 190, 4, 6),
  (20, "History Of My Roses", 222, 4, 6),
  (21, "Without My Love", 111, 4, 6),
  (22, "Walking And Game", 123, 4, 6),
  (23, "Young And Father", 197, 4, 6),
  (24, "Finding My Traditions", 179, 5, 7),
  (25, "Walking And Man", 229, 5, 7),
  (26, "Hard And Time", 135, 5, 7),
  (27, "Honey, I'm A Lone Wolf", 150, 5, 7),
  (28, "She Thinks I Won't Stay Tonight", 166, 5, 8),
  (29, "He Heard You're Bad For Me", 154, 5, 8),
  (30, "He Hopes We Can't Stay", 210, 5, 8),
  (31, "I Know I Know", 117, 5, 8),
  (32, "He's Walking Away", 159, 5, 9),
  (33, "He's Trouble", 138, 5, 9),
  (34, "I Heard I Want To Bo Alone", 120, 5, 9),
  (35, "I Ride Alone", 151, 5, 9),
  (36, "Honey", 79, 6, 10),
  (37, "You Cheated On Me", 95, 6, 10),
  (38, "Wouldn't It Be Nice", 213, 6, 10),
  (39, "Baby", 136, 6, 10),
  (40, "You Make Me Feel So..", 83, 6, 10);
  
INSERT INTO `SpotifyClone`.`FollowingArtists` (`user_id`, `artist_id`)
VALUES (1, 1), (1, 4),
	(1, 3), (2, 1),
    (2, 3), (3, 2),
    (3, 1), (4, 4),
	(5, 5), (5, 6),
	(6, 6), (6, 3),
    (6, 1), (7, 2),
    (7, 5), (8, 1),
    (8, 5), (9, 6),
    (9, 4), (9, 3),
	(10, 2), (10, 6);
    
INSERT INTO `SpotifyClone`.`PlaybackHistory` (`user_id`, `song_id`, `reproduction_date`)
VALUES (1, 36, "2020-02-28 10:45:55"),
  (1, 25, "2020-05-02 05:30:35"),
  (1, 23, "2020-03-06 11:22:33"),
  (1, 14, "2020-08-05 08:05:17"),
  (1, 15, "2020-09-14 16:32:22"),
  (2, 34, "2020-01-02 07:40:33"),
  (2, 24, "2020-05-16 06:16:22"),
  (2, 21, "2020-10-09 12:27:48"),
  (2, 39, "2020-09-21 13:14:46"),
  (3, 6, "2020-11-13 16:55:13"),
  (3, 3, "2020-12-05 18:38:30"),
  (3, 26, "2020-07-30 10:00:00"),
  (4, 2, "2021-08-15 17:10:10"),
  (4, 35, "2021-07-10 15:20:30"),
  (4, 36, "2021-01-09 01:44:33"),
  (5, 7, "2020-07-03 19:33:28"),
  (5, 12, "2017-02-24 21:14:22"),
  (5, 14, "2020-08-06 15:23:43"),
  (5, 1, "2020-11-10 13:52:27"),
  (6, 38, "2019-02-07 20:33:48"),
  (6, 29, "2017-01-24 00:31:17"),
  (6, 30, "2017-10-12 12:35:20"),
  (6, 22, "2018-05-29 14:56:41"),
  (7, 5, "2018-05-09 22:30:49"),
  (7, 4, "2020-07-27 12:52:58"),
  (7, 11, "2018-01-16 18:40:43"),
  (8, 39, "2018-03-21 16:56:40"),
  (8, 40, "2020-10-18 13:38:05"),
  (8, 32, "2019-05-25 08:14:03"),
  (8, 33, "2021-08-15 21:37:09"),
  (9, 16, "2021-05-24 17:23:45"),
  (9, 17, "2018-12-07 22:48:52"),
  (9, 8, "2021-03-14 06:14:26"),
  (9, 9, "2020-04-01 03:36:00"),
  (10, 20, "2017-02-06 08:21:34"),
  (10, 21, "2017-12-04 05:33:43"),
  (10, 12, "2017-07-27 05:24:49"),
  (10, 13, "2017-12-25 01:03:57");
