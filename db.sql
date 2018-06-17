-- --------------------------------------------------------
-- Host:                         35.198.218.159
-- Server version:               5.7.14-google - (Google)
-- Server OS:                    Linux
-- HeidiSQL Version:             9.5.0.5278
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for movies
CREATE DATABASE IF NOT EXISTS `movies` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `movies`;

-- Dumping structure for table movies.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- Dumping data for table movies.categories: ~11 rows (approximately)
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` (`id`, `name`) VALUES
	(2, 'Crime'),
	(3, 'Mystery'),
	(4, 'Drama'),
	(5, 'Biography'),
	(6, 'Adventure'),
	(7, 'Horror'),
	(8, 'Action'),
	(9, 'Family'),
	(10, 'Comedy'),
	(11, 'Western'),
	(12, 'Film-Noir');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;

-- Dumping structure for table movies.movies
CREATE TABLE IF NOT EXISTS `movies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `poster` varchar(250) NOT NULL,
  `description` varchar(3000) NOT NULL,
  `rating` decimal(4,1) NOT NULL DEFAULT '0.0',
  `price` decimal(10,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`id`),
  KEY `fk_mv_category` (`category_id`),
  CONSTRAINT `fk_mv_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- Dumping data for table movies.movies: ~100 rows (approximately)
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` (`id`, `category_id`, `title`, `poster`, `description`, `rating`, `price`) VALUES
	(1, 2, 'The Godfather (1972)', 'posters/MV5BM2MyNjYxNmUtYTAwNi00MTYxLWJmNWYtYzZlODY3ZTk3OTFlXkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UY268_CR3,0,182,268_AL_.jpg', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 9.2, 15.000),
	(2, 4, 'The Shawshank Redemption (1994)', 'posters/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU._V1_UX182_CR0,0,182,268_AL_.jpg', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', 9.3, 27.000),
	(3, 5, 'Schindler\'s List (1993)', 'posters/MV5BNDE4OTMxMTctNmRhYy00NWE2LTg3YzItYTk3M2UwOTU5Njg4XkEyXkFqcGdeQXVyNjU0OTQ0OTY._V1_UX182_CR0,0,182,268_AL_.jpg', 'In German-occupied Poland during World War II, Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazi Germans.', 8.9, 29.000),
	(4, 5, 'Raging Bull (1980)', 'posters/MV5BYjRmODkzNDItMTNhNi00YjJlLTg0ZjAtODlhZTM0YzgzYThlXkEyXkFqcGdeQXVyNzQ1ODk3MTQ._V1_UX182_CR0,0,182,268_AL_.jpg', 'The life of boxer <a href=\'/name/nm0483766/?ref_=\'>Jake LaMotta</a>, as the violence and temper that leads him to the top in the ring destroys his life outside of it.', 8.2, 27.000),
	(5, 4, 'Casablanca (1942)', 'posters/MV5BY2IzZGY2YmEtYzljNS00NTM5LTgwMzUtMzM1NjQ4NGI0OTk0XkEyXkFqcGdeQXVyNDYyMDk5MTU._V1_UX182_CR0,0,182,268_AL_.jpg', 'A cynical nightclub owner protects an old flame and her husband from Nazis in Morocco.', 8.5, 28.000),
	(6, 4, 'Citizen Kane (1941)', 'posters/MV5BYjBiOTYxZWItMzdiZi00NjlkLWIzZTYtYmFhZjhiMTljOTdkXkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'Following the death of a publishing tycoon, news reporters scramble to discover the meaning of his final utterance.', 8.4, 16.000),
	(7, 4, 'Gone with the Wind (1939)', 'posters/MV5BYjUyZWZkM2UtMzYxYy00ZmQ3LWFmZTQtOGE2YjBkNjA3YWZlXkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'A manipulative woman and a roguish man conduct a turbulent romance during the American Civil War and Reconstruction periods.', 8.2, 23.000),
	(8, 6, 'The Wizard of Oz (1939)', 'posters/MV5BNjUyMTc4MDExMV5BMl5BanBnXkFtZTgwNDg0NDIwMjE._V1_UX182_CR0,0,182,268_AL_.jpg', 'Dorothy Gale is swept away from a farm in Kansas to a magical land of Oz in a tornado and embarks on a quest with her new friends to see the Wizard who can help her return home in Kansas and help her friends as well.', 8.0, 23.000),
	(9, 4, 'One Flew Over the Cuckoo\'s Nest (1975)', 'posters/MV5BZjA0OWVhOTAtYWQxNi00YzNhLWI4ZjYtNjFjZTEyYjJlNDVlL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI._V1_UX182_CR0,0,182,268_AL_.jpg', 'A criminal pleads insanity after getting into trouble again and once in the mental institution rebels against the oppressive nurse and rallies up the scared patients.', 8.7, 27.000),
	(10, 6, 'Lawrence of Arabia (1962)', 'posters/MV5BYWY5ZjhjNGYtZmI2Ny00ODM0LWFkNzgtZmI1YzA2N2MxMzA0XkEyXkFqcGdeQXVyNjUwNzk3NDc._V1_UY268_CR2,0,182,268_AL_.jpg', 'The story of <a href=\'/name/nm0493042/?ref_=\'>T.E. Lawrence</a>, the English officer who successfully united and led the diverse, often warring, Arab tribes during World War I in order to fight the Turks.', 8.3, 21.000),
	(11, 3, 'Vertigo (1958)', 'posters/MV5BYTE4ODEwZDUtNDFjOC00NjAxLWEzYTQtYTI1NGVmZmFlNjdiL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'A San Francisco detective suffering from acrophobia investigates the strange activities of an old friend\'s wife, all the while becoming dangerously obsessed with her.', 8.3, 18.000),
	(12, 7, 'Psycho (1960)', 'posters/MV5BNTQwNDM1YzItNDAxZC00NWY2LTk0M2UtNDIwNWI5OGUyNWUxXkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'A Phoenix secretary embezzles $40,000 from her employer\'s client, goes on the run, and checks into a remote motel run by a young man under the domination of his mother.', 8.5, 16.000),
	(13, 2, 'The Godfather: Part II (1974)', 'posters/MV5BMWMwMGQzZTItY2JlNC00OWZiLWIyMDctNDk2ZDQ2YjRjMWQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UY268_CR3,0,182,268_AL_.jpg', 'The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.', 9.0, 16.000),
	(14, 2, 'On the Waterfront (1954)', 'posters/MV5BY2I0MWFiZDMtNWQyYy00Njk5LTk3MDktZjZjNTNmZmVkYjkxXkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'An ex-prize fighter turned longshoreman struggles to stand up to his corrupt union bosses.', 8.2, 18.000),
	(15, 4, 'Sunset Blvd. (1950)', 'posters/MV5BMTU0NTkyNzYwMF5BMl5BanBnXkFtZTgwMDU0NDk5MTI._V1_UX182_CR0,0,182,268_AL_.jpg', 'A screenwriter is hired to rework a faded silent film star\'s script, only to find himself developing a dangerous relationship.', 8.5, 28.000),
	(16, 4, 'Forrest Gump (1994)', 'posters/MV5BNWIwODRlZTUtY2U3ZS00Yzg1LWJhNzYtMmZiYmEyNmU1NjMzXkEyXkFqcGdeQXVyMTQxNzMzNDI._V1_UY268_CR1,0,182,268_AL_.jpg', 'The presidencies of Kennedy and Johnson, Vietnam, Watergate, and other history unfold through the perspective of an Alabama man with an IQ of 75.', 8.8, 16.000),
	(17, 5, 'The Sound of Music (1965)', 'posters/MV5BODIxNjhkYjEtYzUyMi00YTNjLWE1YjktNjAyY2I2MWNkNmNmL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI._V1_UY268_CR3,0,182,268_AL_.jpg', 'A woman leaves an Austrian convent to become a governess to the children of a Naval officer widower.', 8.0, 30.000),
	(18, 2, '12 Angry Men (1957)', 'posters/MV5BMWU4N2FjNzYtNTVkNC00NzQ0LTg0MjAtYTJlMjFhNGUxZDFmXkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'A jury holdout attempts to prevent a miscarriage of justice by forcing his colleagues to reconsider the evidence.', 8.9, 20.000),
	(19, 2, 'West Side Story (1961)', 'posters/MV5BMTM0NDAxOTI5MF5BMl5BanBnXkFtZTcwNjI4Mjg3NA._V1_UX182_CR0,0,182,268_AL_.jpg', 'Two youngsters from rival New York City gangs fall in love, but tensions between their respective friends build toward tragedy.', 7.6, 19.000),
	(20, 8, 'Star Wars (1977)', 'posters/MV5BNzVlY2MwMjktM2E4OS00Y2Y3LWE3ZjctYzhkZGM3YzA1ZWM2XkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'Luke Skywalker joins forces with a Jedi Knight, a cocky pilot, a Wookiee and two droids to save the galaxy from the Empire\'s world-destroying battle-station, while also attempting to rescue Princess Leia from the evil Darth Vader.', 8.6, 26.000),
	(21, 9, 'E.T. the Extra-Terrestrial (1982)', 'posters/MV5BMTQ2ODFlMDAtNzdhOC00ZDYzLWE3YTMtNDU4ZGFmZmJmYTczXkEyXkFqcGdeQXVyMTQxNzMzNDI._V1_UX182_CR0,0,182,268_AL_.jpg', 'A troubled child summons the courage to help a friendly alien escape Earth and return to his home world.', 7.9, 18.000),
	(22, 6, '2001: A Space Odyssey (1968)', 'posters/MV5BMmNlYzRiNDctZWNhMi00MzI4LThkZTctMTUzMmZkMmFmNThmXkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'Humanity finds a mysterious, obviously artificial object buried beneath the Lunar surface and, with the intelligent computer HAL 9000, sets off on a quest.', 8.3, 23.000),
	(23, 2, 'The Silence of the Lambs (1991)', 'posters/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY._V1_UX182_CR0,0,182,268_AL_.jpg', 'A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.', 8.6, 25.000),
	(24, 4, 'Chinatown (1974)', 'posters/MV5BOGMwYmY5ZmEtMzY1Yi00OWJiLTk1Y2MtMzI2MjBhYmZkNTQ0XkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'A private detective hired to expose an adulterer finds himself caught up in a web of deceit, corruption, and murder.', 8.2, 25.000),
	(25, 6, 'The Bridge on the River Kwai (1957)', 'posters/MV5BMGVhNjhjODktODgxYS00MDdhLTlkZjktYTkyNzQxMTU0ZDYxXkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'After settling his differences with a Japanese PoW camp commander, a British colonel co-operates to oversee his men\'s construction of a railway bridge for their captors - while oblivious to a plan by the Allies to destroy it.', 8.2, 24.000),
	(26, 10, 'Singin\' in the Rain (1952)', 'posters/MV5BZDRjNGViMjQtOThlMi00MTA3LThkYzQtNzJkYjBkMGE0YzE1XkEyXkFqcGdeQXVyNDYyMDk5MTU._V1_UY268_CR0,0,182,268_AL_.jpg', 'A silent film production company and cast make a difficult transition to sound.', 8.3, 21.000),
	(27, 4, 'It\'s a Wonderful Life (1946)', 'posters/MV5BZjc4NDZhZWMtNGEzYS00ZWU2LThlM2ItNTA0YzQ0OTExMTE2XkEyXkFqcGdeQXVyNjUwMzI2NzU._V1_UY268_CR1,0,182,268_AL_.jpg', 'An angel is sent from Heaven to help a desperately frustrated businessman by showing him what life would have been like if he had never existed.', 8.6, 28.000),
	(28, 10, 'Dr. Strangelove or: How I Learned to Stop Worrying and Love the Bomb (1964)', 'posters/MV5BZWI3ZTMxNjctMjdlNS00NmUwLWFiM2YtZDUyY2I3N2MxYTE0XkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'An insane general triggers a path to nuclear holocaust that a War Room full of politicians and generals frantically tries to stop.', 8.4, 27.000),
	(29, 6, 'Ben-Hur (1959)', 'posters/MV5BNjgxY2JiZDYtZmMwOC00ZmJjLWJmODUtMTNmNWNmYWI5ODkwL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'When a Jewish prince is betrayed and sent into slavery by a Roman friend, he regains his freedom and comes back for revenge.', 8.1, 23.000),
	(30, 10, 'Some Like It Hot (1959)', 'posters/MV5BNzAyOGIxYjAtMGY2NC00ZTgyLWIwMWEtYzY0OWQ4NDFjOTc5XkEyXkFqcGdeQXVyNjU0OTQ0OTY._V1_UX182_CR0,0,182,268_AL_.jpg', 'When two male musicians witness a mob hit, they flee the state in an all-female band disguised as women, but further complications set in.', 8.3, 24.000),
	(31, 4, 'Apocalypse Now (1979)', 'posters/MV5BZGM3ODFkYTAtYzU2OC00NzdmLWI3YWUtZWVmOGExNWE0MmJkXkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'During the Vietnam War, Captain Willard is sent on a dangerous mission into Cambodia to assassinate a renegade Colonel who has set himself up as a god among a local tribe.', 8.5, 15.000),
	(32, 5, 'Amadeus (1984)', 'posters/MV5BMTg5NDkwMTk5N15BMl5BanBnXkFtZTYwODg3MDk2._V1_UX182_CR0,0,182,268_AL_.jpg', 'The life, success and troubles of Wolfgang Amadeus Mozart, as told by Antonio Salieri, the contemporary composer who was insanely jealous of Mozart\'s talent and claimed to have murdered him.', 8.3, 17.000),
	(33, 6, 'The Lord of the Rings: The Return of the King (2003)', 'posters/MV5BNzA5ZDNlZWMtM2NhNS00NDJjLTk4NDItYTRmY2EwMWZlMTY3XkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'Gandalf and Aragorn lead the World of Men against Sauron\'s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', 8.9, 27.000),
	(34, 8, 'Gladiator (2000)', 'posters/MV5BMDliMmNhNDEtODUyOS00MjNlLTgxODEtN2U3NzIxMGVkZTA1L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY._V1_UX182_CR0,0,182,268_AL_.jpg', 'When a Roman General is betrayed, and his family murdered by an emperor\'s corrupt son, he comes to Rome as a gladiator to seek revenge.', 8.5, 21.000),
	(35, 4, 'Titanic (1997)', 'posters/MV5BMDdmZGU3NDQtY2E5My00ZTliLWIzOTUtMTY4ZGI1YjdiNjk3XkEyXkFqcGdeQXVyNTA4NzY1MzY._V1_UX182_CR0,0,182,268_AL_.jpg', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.', 7.8, 21.000),
	(36, 4, 'From Here to Eternity (1953)', 'posters/MV5BM2U3YzkxNGMtYWE0YS00ODk0LTk1ZGEtNjk3ZTE0MTk4MzJjXkEyXkFqcGdeQXVyNDk0MDg4NDk._V1_UX182_CR0,0,182,268_AL_.jpg', 'In Hawaii in 1941, a private is cruelly punished for not boxing on his unit\'s team, while his captain\'s wife and second-in-command are falling in love.', 7.7, 24.000),
	(37, 4, 'Saving Private Ryan (1998)', 'posters/MV5BZjhkMDM4MWItZTVjOC00ZDRhLThmYTAtM2I5NzBmNmNlMzI1XkEyXkFqcGdeQXVyNDYyMDk5MTU._V1_UY268_CR0,0,182,268_AL_.jpg', 'Following the Normandy Landings, a group of U.S. soldiers go behind enemy lines to retrieve a paratrooper whose brothers have been killed in action.', 8.6, 19.000),
	(38, 4, 'Unforgiven (1992)', 'posters/MV5BODM3YWY4NmQtN2Y3Ni00OTg0LWFhZGQtZWE3ZWY4MTJlOWU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY._V1_UX182_CR0,0,182,268_AL_.jpg', 'Retired Old West gunslinger William Munny reluctantly takes on one last job, with the help of his old partner and a young man.', 8.2, 17.000),
	(39, 8, 'Raiders of the Lost Ark (1981)', 'posters/MV5BMjA0ODEzMTc1Nl5BMl5BanBnXkFtZTcwODM2MjAxNA._V1_UX182_CR0,0,182,268_AL_.jpg', 'In 1936, archaeologist and adventurer Indiana Jones is hired by the U.S. government to find the Ark of the Covenant before <a href=\'/name/nm0386944/?ref_=\'>Adolf Hitler</a>\'s Nazis can obtain its awesome powers.', 8.5, 24.000),
	(40, 4, 'Rocky (1976)', 'posters/MV5BMTY5MDMzODUyOF5BMl5BanBnXkFtZTcwMTQ3NTMyNA._V1_UX182_CR0,0,182,268_AL_.jpg', 'A small-time boxer gets a supremely rare chance to fight a heavy-weight champion in a bout in which he strives to go the distance for his self-respect.', 8.1, 17.000),
	(41, 4, 'A Streetcar Named Desire (1951)', 'posters/MV5BNzk2M2Y3MzYtNGMzMi00Y2FjLTkwODQtNmExYWU3ZWY3NzExXkEyXkFqcGdeQXVyNTA4NzY1MzY._V1_UX182_CR0,0,182,268_AL_.jpg', 'Disturbed Blanche DuBois moves in with her sister in New Orleans and is tormented by her brutish brother-in-law while her reality crumbles around her.', 8.0, 19.000),
	(42, 10, 'The Philadelphia Story (1940)', 'posters/MV5BYjQ4ZDA4NGMtMTkwYi00NThiLThhZDUtZTEzNTAxOWYyY2E4XkEyXkFqcGdeQXVyMjUxODE0MDY._V1_UY268_CR0,0,182,268_AL_.jpg', 'When a rich woman\'s ex-husband and a tabloid-type reporter turn up just before her planned remarriage, she begins to learn the truth about herself.', 8.0, 28.000),
	(43, 2, 'To Kill a Mockingbird (1962)', 'posters/MV5BNmVmYzcwNzMtMWM1NS00MWIyLThlMDEtYzUwZDgzODE1NmE2XkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'Atticus Finch, a lawyer in the Depression-era South, defends a black man against an undeserved rape charge, and his children against prejudice.', 8.3, 26.000),
	(44, 4, 'An American in Paris (1951)', 'posters/MV5BMzFkNGM0YTUtZjY5Ny00NzBkLWE1NTAtYzUxNjUyZmJlODMwL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'Three friends struggle to find work in Paris. Things become more complicated when two of them fall in love with the same woman.', 7.2, 20.000),
	(45, 4, 'The Best Years of Our Lives (1946)', 'posters/MV5BY2RmNTRjYzctODI4Ni00MzQyLWEyNTAtNjU0N2JkMTNhNjJkXkEyXkFqcGdeQXVyNjU0OTQ0OTY._V1_UX182_CR0,0,182,268_AL_.jpg', 'Three World War II veterans return home to small-town America to discover that they and their families have been irreparably changed.', 8.1, 27.000),
	(46, 4, 'My Fair Lady (1964)', 'posters/MV5BMjA5MTEzMzE4MF5BMl5BanBnXkFtZTcwMDAzMTUyMg._V1_UY268_CR4,0,182,268_AL_.jpg', 'A snobbish phonetics professor agrees to a wager that he can take a flower girl and make her presentable in high society.', 7.9, 22.000),
	(47, 2, 'A Clockwork Orange (1971)', 'posters/MV5BMTY3MjM1Mzc4N15BMl5BanBnXkFtZTgwODM0NzAxMDE._V1_UX182_CR0,0,182,268_AL_.jpg', 'In the future, a sadistic gang leader is imprisoned and volunteers for a conduct-aversion experiment, but it doesn\'t go as planned.', 8.3, 23.000),
	(48, 6, 'The Searchers (1956)', 'posters/MV5BYWQ3YWJiMDEtMDBhNS00YjY1LTkzNmEtY2U4Njg4MjQ3YWE3XkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'An American Civil War veteran embarks on a journey to rescue his niece from the Comanches.', 8.0, 27.000),
	(49, 4, 'Doctor Zhivago (1965)', 'posters/MV5BNzdmZTk4MTktZmExNi00OWEwLTgxZDctNTE4NWMwNjc1Nzg2XkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'The life of a Russian physician and poet who, although married to another, falls in love with a political activist\'s wife and experiences hardship during the First World War and then the October Revolution.', 8.0, 16.000),
	(50, 6, 'Jaws (1975)', 'posters/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ._V1_UX182_CR0,0,182,268_AL_.jpg', 'A local sheriff, a marine biologist and an old seafarer team up to hunt down a great white shark wrecking havoc in a beach resort.', 8.0, 17.000),
	(51, 5, 'Patton (1970)', 'posters/MV5BMmNhZmJhMmYtNjlkMC00MjhjLTk1NzMtMTNlMzYzNjZlMjNiXkEyXkFqcGdeQXVyMTQxNzMzNDI._V1_UX182_CR0,0,182,268_AL_.jpg', 'The World War II phase of the career of the controversial American general, <a href=\'/name/nm0666567/?ref_=\'>George S. Patton</a>.', 8.0, 20.000),
	(52, 5, 'Butch Cassidy and the Sundance Kid (1969)', 'posters/MV5BMTkyMTM2NDk5Nl5BMl5BanBnXkFtZTgwNzY1NzEyMDE._V1_UX182_CR0,0,182,268_AL_.jpg', 'Wyoming, early 1900s. Butch Cassidy and The Sundance Kid are the leaders of a band of outlaws. After a train robbery goes wrong they find themselves on the run with a posse hard on their heals. Their solution - escape to Bolivia.', 8.1, 30.000),
	(53, 6, 'The Treasure of the Sierra Madre (1948)', 'posters/MV5BOTJlZWMxYzEtMjlkMS00ODE0LThlM2ItMDI3NGQ2YjhmMzkxXkEyXkFqcGdeQXVyMDI2NDg0NQ._V1_UX182_CR0,0,182,268_AL_.jpg', 'Fred Dobbs and Bob Curtin, two Americans searching for work in Mexico, convince an old prospector to help them mine for gold in the Sierra Madre Mountains.', 8.3, 28.000),
	(54, 11, 'Il buono, il brutto, il cattivo (1966)', 'posters/MV5BOTQ5NDI3MTI4MF5BMl5BanBnXkFtZTgwNDQ4ODE5MDE._V1_UX182_CR0,0,182,268_AL_.jpg', 'A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.', 8.9, 22.000),
	(55, 10, 'The Apartment (1960)', 'posters/MV5BN2YxYmUyZGItZWEzYy00NTA3LThhM2UtZThhNDM5NWYxZGQ1L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY._V1_UX182_CR0,0,182,268_AL_.jpg', 'A man tries to rise in his company by letting its executives use his apartment for trysts, but complications and a romance of his own ensue.', 8.3, 28.000),
	(56, 4, 'Platoon (1986)', 'posters/MV5BM2Y1NTQyNWYtNDViNy00ZWRhLTk3MTMtOTI3ZGQ5MDFiNWM4XkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'A young soldier in Vietnam faces a moral crisis when confronted with the horrors of war and the duality of man.', 8.1, 30.000),
	(57, 8, 'High Noon (1952)', 'posters/MV5BOWIzZGUxZmItOThkMS00Y2QxLTg0MTYtMDdhMjRlNTNlYTI3L2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'A town Marshal, despite the disagreements of his newlywed bride and the townspeople around him, must face a gang of deadly killers alone at high noon when the gang leader, an outlaw he sent up years ago, arrives on the noon train.', 8.0, 30.000),
	(58, 5, 'Braveheart (1995)', 'posters/MV5BMzkzMmU0YTYtOWM3My00YzBmLWI0YzctOGYyNTkwMWE5MTJkXkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'When his secret bride is executed for assaulting an English soldier who tried to rape her, Sir William Wallace begins a revolt against King Edward I of England.', 8.4, 23.000),
	(59, 6, 'Dances with Wolves (1990)', 'posters/MV5BMTY3OTI5NDczN15BMl5BanBnXkFtZTcwNDA0NDY3Mw._V1_UX182_CR0,0,182,268_AL_.jpg', 'Lieutenant John Dunbar, assigned to a remote western Civil War outpost, befriends wolves and Indians, making him an intolerable aberration in the military.', 8.0, 18.000),
	(60, 6, 'Jurassic Park (1993)', 'posters/MV5BMjM2MDgxMDg0Nl5BMl5BanBnXkFtZTgwNTM2OTM5NDE._V1_UX182_CR0,0,182,268_AL_.jpg', 'During a preview tour, a theme park suffers a major power breakdown that allows its cloned dinosaur exhibits to run amok.', 8.1, 26.000),
	(61, 7, 'The Exorcist (1973)', 'posters/MV5BYjhmMGMxZDYtMTkyNy00YWVmLTgyYmUtYTU3ZjcwNTBjN2I1XkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'When a teenage girl is possessed by a mysterious entity, her mother seeks the help of two priests to save her daughter.', 8.0, 30.000),
	(62, 5, 'The Pianist (2002)', 'posters/MV5BOWRiZDIxZjktMTA1NC00MDQ2LWEzMjUtMTliZmY3NjQ3ODJiXkEyXkFqcGdeQXVyNjU0OTQ0OTY._V1_UY268_CR6,0,182,268_AL_.jpg', 'A Polish Jewish musician struggles to survive the destruction of the Warsaw ghetto of World War II.', 8.5, 26.000),
	(63, 5, 'Goodfellas (1990)', 'posters/MV5BY2NkZjEzMDgtN2RjYy00YzM1LWI4ZmQtMjIwYjFjNmI3ZGEwXkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito in the Italian-American crime syndicate.', 8.7, 16.000),
	(64, 4, 'The Deer Hunter (1978)', 'posters/MV5BNDhmNTA0ZDMtYjhkNS00NzEzLWIzYTItOGNkMTVmYjE2YmI3XkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'An in-depth examination of the ways in which the U.S. Vietnam War impacts and disrupts the lives of people in a small industrial town in Pennsylvania.', 8.1, 18.000),
	(65, 8, 'Bonnie and Clyde (1967)', 'posters/MV5BYzQ3ODZmOTktYWRiYy00YjZjLWFkYTctMjA4MmYxNTVmN2I2XkEyXkFqcGdeQXVyMjUzOTY1NTc._V1_UX182_CR0,0,182,268_AL_.jpg', 'Bonnie Parker, a bored waitress falls in love with an ex-con named Clyde Barrow and together they start a violent crime spree through the country, stealing cars and robbing banks.', 7.9, 16.000),
	(66, 4, 'All Quiet on the Western Front (1930)', 'posters/MV5BMzg2MWQ4MDEtOGZlNi00MTg0LWIwMjQtYWY5NTQwYmUzMWNmXkEyXkFqcGdeQXVyMzg2MzE2OTE._V1_UX182_CR0,0,182,268_AL_.jpg', 'A young soldier faces profound disillusionment in the soul-destroying horror of World War I.', 8.1, 25.000),
	(67, 10, 'City Lights (1931)', 'posters/MV5BY2I4MmM1N2EtM2YzOS00OWUzLTkzYzctNDc5NDg2N2IyODJmXkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'With the aid of a wealthy erratic tippler, a dewy-eyed tramp who has fallen in love with a sightless flower girl accumulates money to be able to help her medically.', 8.6, 25.000),
	(68, 8, 'The French Connection (1971)', 'posters/MV5BOTZhY2E3NmItMGIwNi00OTA2LThkYmEtODFiZTM0NGI0ZWU5XkEyXkFqcGdeQXVyNTc1NTQxODI._V1_UY268_CR4,0,182,268_AL_.jpg', 'A pair of NYC cops in the Narcotics Bureau stumble onto a drug smuggling job with a French connection.', 7.8, 18.000),
	(69, 10, 'It Happened One Night (1934)', 'posters/MV5BZmViYmM5OTYtNGQ4Ny00YjQyLThiNjEtYTE4MGZhZTNmZjcyL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY._V1_UX182_CR0,0,182,268_AL_.jpg', 'A spoiled heiress running away from her family is helped by a man who is actually a reporter in need of a story.', 8.1, 27.000),
	(70, 4, 'A Place in the Sun (1951)', 'posters/MV5BMmNjMjE2ZDMtODQzYS00ZDc2LTk0ODgtNjI1NTNhZWI5MmE0XkEyXkFqcGdeQXVyNjUwNzk3NDc._V1_UX182_CR0,0,182,268_AL_.jpg', 'A poor boy gets a job working for his rich uncle and ends up falling in love with two women.', 7.8, 18.000),
	(71, 4, 'Midnight Cowboy (1969)', 'posters/MV5BNTgwZmIzMmYtZjE3Yy00NzgzLTgxNmUtNjlmZDlkMzlhOTJkXkEyXkFqcGdeQXVyNjUwNzk3NDc._V1_UX182_CR0,0,182,268_AL_.jpg', 'A naive hustler travels from Texas to New York City to seek personal fortune but, in the process, finds himself a new friend.', 7.9, 23.000),
	(72, 10, 'Mr. Smith Goes to Washington (1939)', 'posters/MV5BZTYwYjYxYzgtMDE1Ni00NzU4LWJlMTEtODQ5YmJmMGJhZjI5L2ltYWdlXkEyXkFqcGdeQXVyMDI2NDg0NQ._V1_UX182_CR0,0,182,268_AL_.jpg', 'A naive man is appointed to fill a vacancy in the United States Senate. His plans promptly collide with political corruption, but he doesn\'t back down.', 8.2, 29.000),
	(73, 10, 'Annie Hall (1977)', 'posters/MV5BZDg1OGQ4YzgtM2Y2NS00NjA3LWFjYTctMDRlMDI3NWE1OTUyXkEyXkFqcGdeQXVyMjUzOTY1NTc._V1_UX182_CR0,0,182,268_AL_.jpg', 'Neurotic New York comedian Alvy Singer falls in love with the ditzy Annie Hall.', 8.0, 24.000),
	(74, 4, 'Rain Man (1988)', 'posters/MV5BMzVjNzI4NzYtMjE4NS00M2IzLWFkOWMtOTYwMWUzN2ZlNGVjL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMTQxNzMzNDI._V1_UX182_CR0,0,182,268_AL_.jpg', 'Selfish yuppie Charlie Babbitt\'s father left a fortune to his savant brother Raymond and a pittance to Charlie; they travel cross-country.', 8.0, 22.000),
	(75, 4, 'Giant (1956)', 'posters/MV5BYWQ3ZmZhMmQtODQyMS00Y2Q0LThlOTAtM2NiMDMyNDdlYmQ0L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'Sprawling epic covering the life of a Texas cattle rancher and his family and associates.', 7.7, 27.000),
	(76, 2, 'Fargo (1996)', 'posters/MV5BNDJiZDgyZjctYmRjMS00ZjdkLTkwMTEtNGU1NDg3NDQ0Yzk1XkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'Jerry Lundegaard\'s inept crime falls apart due to his and his henchmen\'s bungling and the persistent police work of the quite pregnant Marge Gunderson.', 8.1, 25.000),
	(77, 4, 'The Grapes of Wrath (1940)', 'posters/MV5BNzJiOGI2MjctYjUyMS00ZjkzLWE2ZmUtOTg4NTZkOTNhZDc1L2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'A poor Midwest family is forced off their land. They travel to California, suffering the misfortunes of the homeless in the Great Depression.', 8.1, 17.000),
	(78, 4, 'Shane (1953)', 'posters/MV5BYmZjM2RkZTAtMGIyMi00MTRlLTljY2ItOTRjOWQyODFiNjE3XkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'A weary gunfighter attempts to settle down with a homestead family, but a smoldering settler/rancher conflict forces him to act.', 7.7, 16.000),
	(79, 2, 'The Green Mile (1999)', 'posters/MV5BMTUxMzQyNjA5MF5BMl5BanBnXkFtZTYwOTU2NTY3._V1_UX182_CR0,0,182,268_AL_.jpg', 'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift.', 8.5, 28.000),
	(80, 4, 'Close Encounters of the Third Kind (1977)', 'posters/MV5BMjM1NjE5NjQxN15BMl5BanBnXkFtZTgwMjYzMzQxMDE._V1_UX182_CR0,0,182,268_AL_.jpg', 'After an accidental encounter with otherworldly vessels, an ordinary man follows a series of psychic clues to the first scheduled meeting between representatives of Earth and visitors from the cosmos.', 7.7, 22.000),
	(81, 10, 'Nashville (1975)', 'posters/MV5BMDY0MzE3YWQtZTAzMS00ZmRlLWE3NzYtMjk0NDlkMmE4N2U2XkEyXkFqcGdeQXVyMTAwMzUyOTc._V1_UX182_CR0,0,182,268_AL_.jpg', 'Over the course of a few hectic days, numerous interrelated people prepare for a political convention as secrets and lies are surfaced and revealed.', 7.8, 23.000),
	(82, 4, 'Network (1976)', 'posters/MV5BNmFiOWY3ZTktOTYwNy00ZTUzLTk0ODQtNzIxMzQ0ZDFjMTgyXkEyXkFqcGdeQXVyNTc1NTQxODI._V1_UX182_CR0,0,182,268_AL_.jpg', 'A television network cynically exploits a deranged former anchor\'s ravings and revelations about the news media for its own profit.', 8.1, 28.000),
	(83, 10, 'The Graduate (1967)', 'posters/MV5BMTQ0ODc4MDk4Nl5BMl5BanBnXkFtZTcwMTEzNzgzNA._V1_UX182_CR0,0,182,268_AL_.jpg', 'A disillusioned college graduate finds himself torn between his older lover and her daughter.', 8.0, 17.000),
	(84, 10, 'American Graffiti (1973)', 'posters/MV5BMjI5NjM5MjIyNF5BMl5BanBnXkFtZTgwNjg2MTUxMDE._V1_UX182_CR0,0,182,268_AL_.jpg', 'A couple of high school grads spend one final night cruising the strip with their buddies before they go off to college.', 7.5, 22.000),
	(85, 10, 'Terms of Endearment (1983)', 'posters/MV5BMTk0ODM4NDk0MF5BMl5BanBnXkFtZTgwMTEzMDUxMDE._V1_UX182_CR0,0,182,268_AL_.jpg', 'Follows hard-to-please Aurora looking for love, and her daughter\'s family problems.', 7.4, 16.000),
	(86, 2, 'Pulp Fiction (1994)', 'posters/MV5BNGNhMDIzZTUtNTBlZi00MTRlLWFjM2ItYzViMjE3YzI5MjljXkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UY268_CR1,0,182,268_AL_.jpg', 'The lives of two mob hitmen, a boxer, a gangster\'s wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', 8.9, 18.000),
	(87, 4, 'Good Will Hunting (1997)', 'posters/MV5BOTI0MzcxMTYtZDVkMy00NjY1LTgyMTYtZmUxN2M3NmQ2NWJhXkEyXkFqcGdeQXVyMTQxNzMzNDI._V1_UX182_CR0,0,182,268_AL_.jpg', 'Will Hunting, a janitor at M.I.T., has a gift for mathematics, but needs help from a psychologist to find direction in his life.', 8.3, 19.000),
	(88, 6, 'The African Queen (1951)', 'posters/MV5BOTg0NjY1NTEyMF5BMl5BanBnXkFtZTgwNjUwMTY3MjE._V1_UX182_CR0,0,182,268_AL_.jpg', 'In Africa during World War I, a gin-swilling riverboat captain is persuaded by a strait-laced missionary to use his boat to attack an enemy warship.', 7.9, 20.000),
	(89, 6, 'Mutiny on the Bounty (1935)', 'posters/MV5BNzJkM2ZiZjktYjA0MS00OGQxLWI5NWEtNzQ5M2U4MjZhMzc0XkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'A tyrannical ship captain decides to exact revenge on his abused crew after they form a mutiny against him, but the sailor he targets had no hand in it.', 7.8, 27.000),
	(90, 6, 'Stagecoach (1939)', 'posters/MV5BOGQ4NDUyNWQtZTEyOC00OTMzLWFhYjAtNDNmYmQ2MWQyMTRmXkEyXkFqcGdeQXVyNTA4NzY1MzY._V1_UX182_CR0,0,182,268_AL_.jpg', 'A group of people traveling on a stagecoach find their journey complicated by the threat of Geronimo and learn something about each other in the process.', 7.9, 29.000),
	(91, 2, 'Double Indemnity (1944)', 'posters/MV5BZmRmYmZkZTktZDc5ZC00ZjZmLTg4NWMtYjM3MjcyNTVjNGQ5L2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'An insurance representative lets himself be talked into a murder/insurance fraud scheme that arouses an insurance investigator\'s suspicions.', 8.3, 20.000),
	(92, 10, 'The Great Dictator (1940)', 'posters/MV5BMmExYWJjNTktNGUyZS00ODhmLTkxYzAtNWIzOGEyMGNiMmUwXkEyXkFqcGdeQXVyNjU0OTQ0OTY._V1_UX182_CR0,0,182,268_AL_.jpg', 'Dictator Adenoid Hynkel tries to expand his empire while a poor Jewish barber tries to avoid persecution from Hynkel\'s regime.', 8.5, 20.000),
	(93, 12, 'The Maltese Falcon (1941)', 'posters/MV5BZjIwNGM1ZTUtOThjYS00NDdiLTk2ZDYtNGY5YjJkNzliM2JjL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyMDI2NDg0NQ._V1_UX182_CR0,0,182,268_AL_.jpg', 'A private detective takes on a case that involves him with three eccentric criminals, a gorgeous liar, and their quest for a priceless statuette.', 8.1, 20.000),
	(94, 4, 'Wuthering Heights (1939)', 'posters/MV5BMDAxZDkzNTktYzQyMi00YmRlLWFmYWQtY2Q4ZTQyMGFlMzNmL2ltYWdlL2ltYWdlXkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'A servant in the house of Wuthering Heights tells a traveler the unfortunate tale of lovers Cathy and Heathcliff.', 7.7, 17.000),
	(95, 2, 'Taxi Driver (1976)', 'posters/MV5BM2M1MmVhNDgtNmI0YS00ZDNmLTkyNjctNTJiYTQ2N2NmYzc2XkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'A mentally unstable veteran works as a nighttime taxi driver in New York City, where the perceived decadence and sleaze fuels his urge for violent action, while attempting to liberate a twelve-year-old prostitute.', 8.3, 29.000),
	(96, 3, 'Rear Window (1954)', 'posters/MV5BNGUxYWM3M2MtMGM3Mi00ZmRiLWE0NGQtZjE5ODI2OTJhNTU0XkEyXkFqcGdeQXVyMTQxNzMzNDI._V1_UY268_CR0,0,182,268_AL_.jpg', 'A wheelchair-bound photographer spies on his neighbors from his apartment window and becomes convinced one of them has committed murder.', 8.5, 17.000),
	(97, 12, 'The Third Man (1949)', 'posters/MV5BYjE2OTdhMWUtOGJlMy00ZDViLWIzZjgtYjZkZGZmMDZjYmEyXkEyXkFqcGdeQXVyNzkwMjQ5NzM._V1_UX182_CR0,0,182,268_AL_.jpg', 'Pulp novelist Holly Martins travels to shadowy, postwar Vienna, only to find himself investigating the mysterious death of an old friend, Harry Lime.', 8.2, 23.000),
	(98, 4, 'Rebel Without a Cause (1955)', 'posters/MV5BMjMwNWIwYzAtMWVhZi00YzQ2LTlmNGYtOTg3NDdkNTRjOWI2XkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'A rebellious young man with a troubled past comes to a new town, finding friends and enemies.', 7.8, 25.000),
	(99, 5, 'Yankee Doodle Dandy (1942)', 'posters/MV5BNDQ2MWJjNjUtYmVlNS00YjUzLWFkMDEtYzE2MjkxOTljMmI1XkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'The life of the renowned musical composer, playwright, actor, dancer, and singer <a href=\'/name/nm0169125/?ref_=\'>George M. Cohan</a>.', 7.8, 18.000),
	(100, 6, 'North by Northwest (1959)', 'posters/MV5BZDA3NDExMTUtMDlhOC00MmQ5LWExZGUtYmI1NGVlZWI4OWNiXkEyXkFqcGdeQXVyNjc1NTYyMjg._V1_UX182_CR0,0,182,268_AL_.jpg', 'A hapless New York advertising executive is mistaken for a government agent by a group of foreign spies, and is pursued across the country while he looks for a way to survive.', 8.3, 17.000);
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;

-- Dumping structure for table movies.oders
CREATE TABLE IF NOT EXISTS `oders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) NOT NULL DEFAULT '1',
  `order_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `price` decimal(10,3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_status` (`status_id`),
  CONSTRAINT `fk_order_status` FOREIGN KEY (`status_id`) REFERENCES `order_statuses` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table movies.oders: ~0 rows (approximately)
/*!40000 ALTER TABLE `oders` DISABLE KEYS */;
/*!40000 ALTER TABLE `oders` ENABLE KEYS */;

-- Dumping structure for table movies.order_items
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `ft_item_order` (`order_id`),
  KEY `fk_item_movie` (`movie_id`),
  CONSTRAINT `fk_item_movie` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `ft_item_order` FOREIGN KEY (`order_id`) REFERENCES `oders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table movies.order_items: ~0 rows (approximately)
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;

-- Dumping structure for table movies.order_statuses
CREATE TABLE IF NOT EXISTS `order_statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table movies.order_statuses: ~5 rows (approximately)
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` (`id`, `title`) VALUES
	(1, 'New'),
	(2, 'Payed'),
	(3, 'Packed'),
	(4, 'Delivered'),
	(5, 'Canceled');
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;

-- Dumping structure for table movies.reviews
CREATE TABLE IF NOT EXISTS `reviews` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rating` decimal(4,1) NOT NULL DEFAULT '0.0',
  `title` varchar(150) NOT NULL,
  `body` varchar(3000) NOT NULL,
  `is_approved` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_review_movie` (`movie_id`),
  KEY `fk_review_user` (`user_id`),
  CONSTRAINT `fk_review_movie` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_review_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table movies.reviews: ~0 rows (approximately)
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;

-- Dumping structure for table movies.users
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(50) NOT NULL,
  `is_admin` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Dumping data for table movies.users: ~4 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`id`, `username`, `email`, `password`, `is_admin`) VALUES
	(1, 'root', 'root@root.com', '63a9f0ea7bb98050796b649e85481845', b'1'),
	(2, 'user', 'user@user.com', 'ee11cbb19052e40b07aac0ca060c23ee', b'0'),
	(6, 'user2', 'user2@user.com', 'ee11cbb19052e40b07aac0ca060c23ee', b'0'),
	(7, 'user3', 'user3@user.com', 'ee11cbb19052e40b07aac0ca060c23ee', b'0');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
