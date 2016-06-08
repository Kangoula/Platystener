-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 06 Janvier 2015 à 10:55
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.4.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `projet_web_deezer`
--

-- --------------------------------------------------------

--
-- Structure de la table `artists`
--

CREATE TABLE IF NOT EXISTS `artists` (
  `artist_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `image_url` varchar(200) CHARACTER SET ascii NOT NULL,
  `info` text NOT NULL,
  PRIMARY KEY (`artist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5283367 ;

--
-- Contenu de la table `artists`
--

INSERT INTO `artists` (`artist_id`, `name`, `image_url`, `info`) VALUES
(13, 'Eminem', 'http://api.deezer.com/artist/13/image', ''),
(27, 'Daft Punk', 'http://api.deezer.com/artist/27/image', ''),
(29, 'Calogero', 'http://api.deezer.com/artist/29/image', ''),
(103, 'Pharrell Williams', 'http://api.deezer.com/artist/103/image', ''),
(145, 'Beyoncé', 'http://api.deezer.com/artist/145/image', ''),
(542, 'David Guetta', 'http://api.deezer.com/artist/542/image', ''),
(564, 'Rihanna', 'http://api.deezer.com/artist/564/image', ''),
(892, 'Coldplay', 'http://api.deezer.com/artist/892/image', ''),
(1188, 'Maroon 5', 'http://api.deezer.com/artist/1188/image', ''),
(3469, 'Sia', 'http://api.deezer.com/artist/3469/image', ''),
(11963, 'Shy''m', 'http://api.deezer.com/artist/11963/image', ''),
(12178, 'Calvin Harris', 'http://api.deezer.com/artist/12178/image', ''),
(12778, 'La Fouine', 'http://api.deezer.com/artist/12778/image', ''),
(13011, 'Soprano', 'http://api.deezer.com/artist/13011/image', ''),
(13204, 'Mark Ronson', 'http://api.deezer.com/artist/13204/image', ''),
(15887, 'Julien Doré', 'http://api.deezer.com/artist/15887/image', ''),
(56895, 'FAUVE', 'http://api.deezer.com/artist/56895/image', ''),
(83110, 'Brigitte', 'http://api.deezer.com/artist/83110/image', ''),
(152369, 'Keen'' V', 'http://api.deezer.com/artist/152369/image', ''),
(162815, 'Guizmo', 'http://api.deezer.com/artist/162815/image', ''),
(249599, 'Jason Derulo', 'http://api.deezer.com/artist/249599/image', ''),
(271922, 'Showtek', 'http://api.deezer.com/artist/271922/image', ''),
(293585, 'Avicii', 'http://api.deezer.com/artist/293585/image', ''),
(307677, 'Lilly Wood And The Prick', 'http://api.deezer.com/artist/307677/image', ''),
(310260, 'Stromae', 'http://api.deezer.com/artist/310260/image', ''),
(382937, 'Nicki Minaj', 'http://api.deezer.com/artist/382937/image', ''),
(384236, 'Ed Sheeran', 'http://api.deezer.com/artist/384236/image', ''),
(416239, 'Imagine Dragons', 'http://api.deezer.com/artist/416239/image', ''),
(429675, 'Bruno Mars', 'http://api.deezer.com/artist/429675/image', ''),
(893222, 'Macklemore & Ryan Lewis', 'http://api.deezer.com/artist/893222/image', ''),
(1097709, 'Sam Smith', 'http://api.deezer.com/artist/1097709/image', ''),
(1191615, 'Jul', 'http://api.deezer.com/artist/1191615/image', ''),
(1520407, 'Christine and the Queens', 'http://api.deezer.com/artist/1520407/image', ''),
(1533050, 'Emma Louise', 'http://api.deezer.com/artist/1533050/image', ''),
(1562681, 'Ariana Grande', 'http://api.deezer.com/artist/1562681/image', ''),
(2005781, 'Robin Schulz', 'http://api.deezer.com/artist/2005781/image', ''),
(2454271, 'Iggy Azalea', 'http://api.deezer.com/artist/2454271/image', ''),
(4087782, 'Lacrim', 'http://api.deezer.com/artist/4087782/image', ''),
(4103977, 'Tove Lo', 'http://api.deezer.com/artist/4103977/image', ''),
(4422353, 'Anais Delva', 'http://api.deezer.com/artist/4422353/image', ''),
(4429712, 'Maître Gims', 'http://api.deezer.com/artist/4429712/image', ''),
(4437965, 'Indila', 'http://api.deezer.com/artist/4437965/image', ''),
(4494623, 'Black M', 'http://api.deezer.com/artist/4494623/image', ''),
(4512147, 'Milky Chance', 'http://api.deezer.com/artist/4512147/image', ''),
(4539853, 'Fréro Delavega', 'http://api.deezer.com/artist/4539853/image', ''),
(4771546, 'London Grammar', 'http://api.deezer.com/artist/4771546/image', ''),
(5062414, 'Hozier', 'http://api.deezer.com/artist/5062414/image', ''),
(5283366, 'The Avener', 'http://api.deezer.com/artist/5283366/image', '');

-- --------------------------------------------------------

--
-- Structure de la table `playlists`
--

CREATE TABLE IF NOT EXISTS `playlists` (
  `user_id` int(11) NOT NULL,
  `playlist_id` int(11) NOT NULL AUTO_INCREMENT,
  `playlist_name` varchar(64) NOT NULL,
  PRIMARY KEY (`playlist_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Structure de la table `playlists_tracks`
--

CREATE TABLE IF NOT EXISTS `playlists_tracks` (
  `playlist_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `track_id` int(11) NOT NULL,
  PRIMARY KEY (`playlist_id`,`position`),
  KEY `playlist_id` (`playlist_id`),
  KEY `track_id` (`track_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tracks`
--

CREATE TABLE IF NOT EXISTS `tracks` (
  `artist_id` int(11) NOT NULL,
  `track_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) NOT NULL,
  `mp3_url` varchar(200) CHARACTER SET ascii NOT NULL,
  `track_id_deezer` int(11) NOT NULL,
  PRIMARY KEY (`track_id`),
  KEY `artist_id` (`artist_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=90250920 ;

--
-- Contenu de la table `tracks`
--

INSERT INTO `tracks` (`artist_id`, `track_id`, `title`, `mp3_url`, `track_id_deezer`) VALUES
(542, 90250728, 'Dangerous (feat. Sam Martin)', 'http://cdn-preview-3.deezer.com/stream/35c8189c2446061c13e50c42603859dd-8.mp3', 87371673),
(542, 90250729, 'Lovers on the Sun (feat. Sam Martin)', 'http://cdn-preview-7.deezer.com/stream/75c2f0f4f18f76d2c6c51ec3d9deb86c-5.mp3', 79965994),
(542, 90250730, 'Bad (feat. Vassy) (Radio Edit)', 'http://cdn-preview-b.deezer.com/stream/b75c749a1bd0e9bfbdf729dfa278572f-3.mp3', 76520669),
(542, 90250731, 'No Money no Love (feat. Elliphant & Ms. Dynamite)', 'http://cdn-preview-d.deezer.com/stream/d1185fb884fb288016bf8dc12d445390-2.mp3', 90250607),
(4494623, 90250732, 'Je ne dirai rien', 'http://cdn-preview-d.deezer.com/stream/d2e84737c14b6abfa9fba3f2fb2f0991-1.mp3', 76395834),
(4494623, 90250733, 'La légende Black', 'http://cdn-preview-7.deezer.com/stream/7192a044463fd72e0b2869233fa9aa46-1.mp3', 76395830),
(4494623, 90250734, 'Sur ma route', 'http://cdn-preview-a.deezer.com/stream/a7091379aaac1aab73b59188a0ab9bc2-1.mp3', 76395840),
(4494623, 90250735, 'Je garde le sourire', 'http://cdn-preview-0.deezer.com/stream/021760a3941a458cf5d258fd77dd88e9-3.mp3', 88725387),
(13011, 90250736, 'Cosmo', 'http://cdn-preview-2.deezer.com/stream/24b6f568e9064af1c3e64cc5d4cc7bd2-0.mp3', 81827770),
(13011, 90250737, 'Fresh Prince (feat. Uncle Phil)', 'http://cdn-preview-e.deezer.com/stream/e0402f936923eb950f3b50585215cbbf-1.mp3', 86453923),
(13011, 90250738, 'Fresh Prince (feat. Uncle Phil)', 'http://cdn-preview-e.deezer.com/stream/e0402f936923eb950f3b50585215cbbf-8.mp3', 87669877),
(13011, 90250739, 'Clown', 'http://cdn-preview-a.deezer.com/stream/a683db7a4aa2cbbcd2aa118cc8d5db0b-8.mp3', 87669875),
(1520407, 90250740, 'Saint Claude', 'http://cdn-preview-8.deezer.com/stream/814877eda90ce79252931c7826df61c6-0.mp3', 78671164),
(1520407, 90250741, 'Christine', 'http://cdn-preview-f.deezer.com/stream/fb29eec8a78f0cdc2949d4765eaacef6-0.mp3', 78671166),
(1520407, 90250742, 'Paradis perdus', 'http://cdn-preview-2.deezer.com/stream/2f56ff56ebdf2abfa8a1209c7de8c930-0.mp3', 78671171),
(1520407, 90250743, 'iT', 'http://cdn-preview-0.deezer.com/stream/0bd499f423867d63f0715ab822c466aa-0.mp3', 78671163),
(12178, 90250744, 'Blame', 'http://cdn-preview-2.deezer.com/stream/2de44dcdef2320b615487db29cb02807-0.mp3', 83489074),
(12178, 90250745, 'Summer', 'http://cdn-preview-1.deezer.com/stream/12cb5b345f04d494177e411194ed835a-5.mp3', 75768941),
(12178, 90250746, 'Outside', 'http://cdn-preview-c.deezer.com/stream/c37d19e2b316a1e960624a3a51cfdff6-5.mp3', 88419425),
(12178, 90250747, 'Open Wide', 'http://cdn-preview-d.deezer.com/stream/d94898ef91ca218720a0d5c9d5017c96-5.mp3', 88936755),
(3469, 90250748, 'Chandelier', 'http://cdn-preview-9.deezer.com/stream/9b276eaade4279ab017910643a76c18c-0.mp3', 79587580),
(3469, 90250749, 'Big Girls Cry', 'http://cdn-preview-b.deezer.com/stream/b5c2376138cf32f3363f76488de70356-0.mp3', 79587582),
(3469, 90250750, 'Breathe Me', 'http://cdn-preview-d.deezer.com/stream/d9812e6277ca2b01e2c89826ad1b8e67-5.mp3', 913858),
(3469, 90250751, 'Chandelier (Piano Version)', 'http://cdn-preview-6.deezer.com/stream/697d083cc501e5885a12b08994c70bdd-2.mp3', 88252835),
(310260, 90250752, 'Papaoutai', 'http://cdn-preview-7.deezer.com/stream/77a0a9edb5154e836778ce5c0895cc4f-6.mp3', 69879250),
(310260, 90250753, 'tous les mêmes', 'http://cdn-preview-6.deezer.com/stream/6681e55cbd75a6e252e5af896d09c5db-6.mp3', 69879253),
(310260, 90250754, 'Formidable', 'http://cdn-preview-4.deezer.com/stream/4fb91f24fa77119a5169afb4068ae3b9-6.mp3', 69879254),
(310260, 90250755, 'ta fête', 'http://cdn-preview-6.deezer.com/stream/68268250e0feb797ba5779a0dcea151a-6.mp3', 69879249),
(307677, 90250756, 'Prayer In C (Robin Schulz Radio Edit)', 'http://cdn-preview-7.deezer.com/stream/7cafc7431233ed7beb021bba34bfd606-0.mp3', 79223833),
(307677, 90250757, 'Middle of the Night', 'http://cdn-preview-0.deezer.com/stream/0f3f27da4a611eec46e4168776146629-0.mp3', 61885066),
(307677, 90250758, 'Where I Want to Be (California)', 'http://cdn-preview-a.deezer.com/stream/a8476d8bf26c80e7d14cf1f0365a96e6-0.mp3', 61885064),
(307677, 90250759, 'Let''s Not Pretend', 'http://cdn-preview-e.deezer.com/stream/e35d6d13d3638bf97534d58ee542e0c1-0.mp3', 61885065),
(2005781, 90250760, 'Prayer In C (Robin Schulz Radio Edit)', 'http://cdn-preview-7.deezer.com/stream/7cafc7431233ed7beb021bba34bfd606-0.mp3', 79223833),
(2005781, 90250761, 'Sun Goes Down (feat. Jasmine Thompson) (Radio Mix)', 'http://cdn-preview-f.deezer.com/stream/fa8a84269c0f6114e7e6d92034ac5dd8-9.mp3', 84908531),
(2005781, 90250762, 'Willst Du (Radio Mix)', 'http://cdn-preview-d.deezer.com/stream/d6a44b699951017ae9c7f8290d5cf076-9.mp3', 84908529),
(2005781, 90250763, 'Same (Bakermat Remix)', 'http://cdn-preview-0.deezer.com/stream/01d9534dc91e680f2c13b406534bf30f-0.mp3', 70184647),
(4437965, 90250764, 'Dernière danse', 'http://cdn-preview-6.deezer.com/stream/6d9f99b090fc9e6e964756e1b502ed42-3.mp3', 71966847),
(4437965, 90250765, 'S.O.S', 'http://cdn-preview-3.deezer.com/stream/3e312a838cae5aff6ceb2906008e44f0-4.mp3', 74427070),
(4437965, 90250766, 'Love Story', 'http://cdn-preview-0.deezer.com/stream/0a5c0117bd8e950ba831088f1df98f50-4.mp3', 74427069),
(4437965, 90250767, 'Run Run', 'http://cdn-preview-1.deezer.com/stream/127609f1e69b0e75e7f0dc85d639c787-4.mp3', 74427072),
(892, 90250768, 'A Sky Full of Stars', 'http://cdn-preview-0.deezer.com/stream/0f261205af1aab77472a2066811ee17f-0.mp3', 78129603),
(892, 90250769, 'Paradise', 'http://cdn-preview-d.deezer.com/stream/d6cbf17e914e30ae78b85b28b61f5548-1.mp3', 14299589),
(892, 90250770, 'Magic', 'http://cdn-preview-f.deezer.com/stream/f5a7fc5f794c5dcb40f8f75876dfc603-0.mp3', 75716617),
(892, 90250771, 'The Scientist', 'http://cdn-preview-b.deezer.com/stream/bc401e3dc74e4b14bbbc421fa1d95474-4.mp3', 3098840),
(1191615, 90250772, 'Señora', 'http://cdn-preview-4.deezer.com/stream/4f4af6e257b1a8d2b440896009a1bb49-1.mp3', 82099266),
(1191615, 90250773, 'Tu la love', 'http://cdn-preview-b.deezer.com/stream/b2c4eb509ca5d0b48859f5d64cad1cf9-1.mp3', 75867424),
(1191615, 90250774, 'J''oublie tout', 'http://cdn-preview-1.deezer.com/stream/1a01102d6e79fba88a42839371cc35eb-1.mp3', 75867418),
(1191615, 90250775, 'Briganté', 'http://cdn-preview-5.deezer.com/stream/550553613fb37aee64cb8305519202c8-0.mp3', 78628739),
(13204, 90250776, 'Uptown Funk', 'http://cdn-preview-2.deezer.com/stream/2a18bcd891da1c622b4bc58db494b95a-5.mp3', 89779813),
(13204, 90250777, 'Feel Right', 'http://cdn-preview-e.deezer.com/stream/e2452ca4acb83aa136cad8b53a6206cc-2.mp3', 90757111),
(13204, 90250778, 'Valerie (Version Revisited)', 'http://cdn-preview-8.deezer.com/stream/8576549d10aeb4bfdc98e6064dabcd39-2.mp3', 7923756),
(13204, 90250779, 'Ooh Wee (featuring Ghostface Killah, Nate Dogg, Trife & Saigon)', 'http://cdn-preview-e.deezer.com/stream/e7c522f2bb512fcb20f34ce51e8d8f64-3.mp3', 8147216),
(4103977, 90250780, 'Stay High (Habits Remix)', 'http://cdn-preview-c.deezer.com/stream/c2a650732ed83fe26faf181735d6b554-5.mp3', 75072795),
(4103977, 90250781, 'Habits (Stay High) (Hippie Sabotage Remix)', 'http://cdn-preview-5.deezer.com/stream/541b41618b90967dc18688fa7bba4aeb-1.mp3', 84669149),
(4103977, 90250782, 'Habits (Stay High)', 'http://cdn-preview-c.deezer.com/stream/c3bb5de65c0b4d69dd35a0c482f7a0dc-5.mp3', 75072793),
(4103977, 90250783, 'Habits (Stay High)', 'http://cdn-preview-f.deezer.com/stream/fd50952c134601c3935b09c20da84c76-1.mp3', 84669141),
(4087782, 90250784, 'J’suis qu’un thug', 'http://cdn-preview-2.deezer.com/stream/2f225f564cfcb7da5c35d0176ac6de97-1.mp3', 84310993),
(4087782, 90250785, 'Barbade', 'http://cdn-preview-e.deezer.com/stream/e5974b8110748c6b9ae279d315ee3a50-1.mp3', 84310977),
(4087782, 90250786, 'A.W.A', 'http://cdn-preview-e.deezer.com/stream/e2935297c8c3d667f53677b63794f753-1.mp3', 84310989),
(4087782, 90250787, 'On Fait Pas Ca', 'http://cdn-preview-d.deezer.com/stream/dfe7f03ead4e3940065bc6435be2fd48-1.mp3', 84310979),
(1188, 90250788, 'Animals', 'http://cdn-preview-1.deezer.com/stream/1041f918b5f75fda6f2e5fd69307764f-0.mp3', 84574199),
(1188, 90250789, 'Maps', 'http://cdn-preview-6.deezer.com/stream/6c29d742bc8c1221ae1ef77640947ed7-1.mp3', 79542042),
(1188, 90250790, 'Maps', 'http://cdn-preview-8.deezer.com/stream/8adecff6644b232866681cfc8ffc86f7-0.mp3', 84574197),
(1188, 90250791, 'One More Night', 'http://cdn-preview-7.deezer.com/stream/7f376382d2aec17f6384b420394bf19b-4.mp3', 44230981),
(1562681, 90250792, 'Problem', 'http://cdn-preview-5.deezer.com/stream/54c1d3a8555abdb75eab7280ee0477f8-2.mp3', 77725101),
(1562681, 90250793, 'Love Me Harder', 'http://cdn-preview-a.deezer.com/stream/a36e55d330319a687d024122780a840a-8.mp3', 83837272),
(1562681, 90250794, 'Bang Bang', 'http://cdn-preview-3.deezer.com/stream/39abee3bd17cf4d514e81d3c851a89e9-3.mp3', 81609384),
(1562681, 90250795, 'Break Free', 'http://cdn-preview-1.deezer.com/stream/1f83aa478f8b59029d6d95e077c34f4f-2.mp3', 80648074),
(2454271, 90250796, 'Fancy', 'http://cdn-preview-9.deezer.com/stream/9e3eb89a2491628ef100bdac7050ad52-4.mp3', 75837242),
(2454271, 90250797, 'Black Widow', 'http://cdn-preview-4.deezer.com/stream/48a8c14c0c0027fad95468dd7d220fb8-2.mp3', 89845471),
(2454271, 90250798, 'Fancy', 'http://cdn-preview-1.deezer.com/stream/12ee23c227c77332344f6ede8adf0d16-8.mp3', 77349246),
(2454271, 90250799, 'Beg For It', 'http://cdn-preview-c.deezer.com/stream/c0af7dccda1360437f9af25ad06d65d9-2.mp3', 89845469),
(4771546, 90250800, 'Wasting My Young Years', 'http://cdn-preview-4.deezer.com/stream/404a7c3d6b30d8093ff8dfdadd8c71bb-1.mp3', 70206826),
(4771546, 90250801, 'Strong', 'http://cdn-preview-7.deezer.com/stream/735b46167575a283e3636d3b6632e47a-1.mp3', 70206829),
(4771546, 90250802, 'Nightcall', 'http://cdn-preview-b.deezer.com/stream/b5f2365802c4610366986d5753b7c46e-1.mp3', 70206830),
(4771546, 90250803, 'Hey Now', 'http://cdn-preview-b.deezer.com/stream/ba254c923c34aa42f1de0eb153e68b91-1.mp3', 70206822),
(416239, 90250804, 'Demons', 'http://cdn-preview-d.deezer.com/stream/df2151bdc5d2a2b82f3a2183db27e719-3.mp3', 63510361),
(416239, 90250805, 'Radioactive', 'http://cdn-preview-a.deezer.com/stream/a68d0e1e73795c7c4a422521a23c7980-3.mp3', 63510358),
(416239, 90250806, 'Warriors', 'http://cdn-preview-2.deezer.com/stream/2a2ef5b3e4b778425bbc51fe3892de54-0.mp3', 85963521),
(416239, 90250807, 'On Top Of The World', 'http://cdn-preview-d.deezer.com/stream/dc8df252267799dd5c7db5d21c6fe2ed-3.mp3', 63510362),
(4429712, 90250808, 'Zombie', 'http://cdn-preview-1.deezer.com/stream/1c208eecb52987cbd44747fab4b87c8e-1.mp3', 72717423),
(4429712, 90250809, 'J''me tire', 'http://cdn-preview-1.deezer.com/stream/106dc096ff362221fdb4614550dba6d9-1.mp3', 72717406),
(4429712, 90250810, 'Changer', 'http://cdn-preview-1.deezer.com/stream/19d5f558db9226cd0f59809c3d246a24-1.mp3', 72717421),
(4429712, 90250811, 'Bella', 'http://cdn-preview-2.deezer.com/stream/23c2a2a34278470b7845893ed4cfed40-1.mp3', 72717420),
(4539853, 90250812, 'Sweet Darling', 'http://cdn-preview-6.deezer.com/stream/6ee9bf6f794af544d6c766707847303f-3.mp3', 81263832),
(4539853, 90250813, 'Mon Petit Pays', 'http://cdn-preview-1.deezer.com/stream/16c407a410a3dfae65fca78cb63fe3c1-3.mp3', 81263840),
(4539853, 90250814, 'Il y a', 'http://cdn-preview-c.deezer.com/stream/c35bc52883bb0675871fbfc7f65881a0-6.mp3', 81263830),
(4539853, 90250815, 'Le Chant Des Sirènes', 'http://cdn-preview-b.deezer.com/stream/b93dc499588d52e7ba048d8bdf041759-3.mp3', 81263834),
(1533050, 90250816, 'Jungle', 'http://cdn-preview-b.deezer.com/stream/bf79aa390fdbaeaf9f7946d32ef774a7-2.mp3', 66878425),
(1533050, 90250817, 'My Head Is A Jungle (Radio Edit)', 'http://cdn-preview-0.deezer.com/stream/083d2272cc4bf96893fcbeae1aeead3a-0.mp3', 67556948),
(1533050, 90250818, 'My Head Is A Jungle (Radio Edit Bonustrack)', 'http://cdn-preview-1.deezer.com/stream/15878166ae9c369cadb0845925d70fbf-2.mp3', 66878436),
(1533050, 90250819, '17 Hours', 'http://cdn-preview-3.deezer.com/stream/360eb4650d9f171fb5ee8c61d07fd16d-2.mp3', 66878426),
(564, 90250820, 'Diamonds', 'http://cdn-preview-b.deezer.com/stream/bd8c7871d2e808f9f30ce78931d023df-5.mp3', 60978718),
(564, 90250821, 'We Found Love', 'http://cdn-preview-a.deezer.com/stream/a96f18cf1432fa4b80db9d8ea57fa65c-3.mp3', 13839981),
(564, 90250822, 'Stay (Album Version Explicit)', 'http://cdn-preview-e.deezer.com/stream/e8a2361ef73324750529d292e4293876-4.mp3', 62376291),
(564, 90250823, 'Man Down (Album Version Explicit)', 'http://cdn-preview-8.deezer.com/stream/80ba6154fb6c3d188dd8d9607cbac254-5.mp3', 12817764),
(293585, 90250824, 'Wake Me Up', 'http://cdn-preview-f.deezer.com/stream/fe3ebb75c8be5506b9f305f09ad7cf58-2.mp3', 68016602),
(293585, 90250825, 'Addicted To You', 'http://cdn-preview-a.deezer.com/stream/af76a043eddf9da8f454f6a32a80f3a2-5.mp3', 70266759),
(293585, 90250826, 'Hey Brother', 'http://cdn-preview-8.deezer.com/stream/89041f7e3a2dbebf93d1b5fc19a70dc4-5.mp3', 70266758),
(293585, 90250827, 'The Days', 'http://cdn-preview-4.deezer.com/stream/4a1c5da9bfb19e341d9c18b81707dc75-2.mp3', 90632835),
(5062414, 90250828, 'Take Me To Church', 'http://cdn-preview-2.deezer.com/stream/27b04dd2e38fdf7f3e3831d2925207ea-4.mp3', 84791837),
(5062414, 90250829, 'Take Me To Church', 'http://cdn-preview-6.deezer.com/stream/6ffb564f9bbeea58809040eb499e5aa0-4.mp3', 76220160),
(5062414, 90250830, 'Angel Of Small Death & The Codeine Scene', 'http://cdn-preview-a.deezer.com/stream/ad205b6848f33261d5272cb8a07ed8de-4.mp3', 84791839),
(5062414, 90250831, 'Jackie And Wilson', 'http://cdn-preview-b.deezer.com/stream/ba90430311b646b4bbf0db32f1694c3b-4.mp3', 84791841),
(145, 90250832, '7/11', 'http://cdn-preview-7.deezer.com/stream/7b2a72843022b58122bea76ef0819614-2.mp3', 90408897),
(145, 90250833, 'Drunk in Love', 'http://cdn-preview-e.deezer.com/stream/e8541f1d5593e287c22196ed53a48acc-0.mp3', 73724283),
(145, 90250834, 'Halo', 'http://cdn-preview-a.deezer.com/stream/a2bf8d6f855bc6647554b72c43107b03-1.mp3', 2553265),
(145, 90250835, 'Crazy in Love', 'http://cdn-preview-c.deezer.com/stream/cda647be1aa524ab0c3867efbc82e221-4.mp3', 609244),
(29, 90250836, 'Le portrait', 'http://cdn-preview-9.deezer.com/stream/97e267382f05b1d1974141fc261611d0-2.mp3', 83389314),
(29, 90250837, 'Un Jour Au Mauvais Endroit', 'http://cdn-preview-8.deezer.com/stream/8dbd426e4d19f7ecdb5439ed21c37a8b-1.mp3', 78516612),
(29, 90250838, 'Un jour au mauvais endroit', 'http://cdn-preview-f.deezer.com/stream/f8b6fef7b4f858c0572dd72f8c1004ee-1.mp3', 83389308),
(29, 90250839, 'Fidèle', 'http://cdn-preview-6.deezer.com/stream/64724871452bcb1bdcb4de65fb0efaf7-1.mp3', 83389306),
(382937, 90250840, 'Anaconda', 'http://cdn-preview-e.deezer.com/stream/eca2704f5bf9f450f954c4e13898b897-1.mp3', 82120630),
(382937, 90250841, 'Bang Bang', 'http://cdn-preview-3.deezer.com/stream/39abee3bd17cf4d514e81d3c851a89e9-3.mp3', 81609384),
(382937, 90250842, 'Bang Bang', 'http://cdn-preview-6.deezer.com/stream/63a712f9de708b092072ce6bd811cfc1-8.mp3', 83837280),
(382937, 90250843, 'Only', 'http://cdn-preview-3.deezer.com/stream/37d6dc446ff3e6498ca7c10c763ce00a-5.mp3', 89179849),
(4422353, 90250844, 'Libérée, Délivrée', 'http://cdn-preview-2.deezer.com/stream/2281957d6a9df66867dcffd4c3d64370-1.mp3', 72427143),
(4422353, 90250845, 'Le Renouveau', 'http://cdn-preview-b.deezer.com/stream/ba4c638774a8447522a1bcd3a35fb4ac-1.mp3', 72427141),
(4422353, 90250846, 'Le Renouveau (Reprise)', 'http://cdn-preview-c.deezer.com/stream/ccab4b3eb4d4dbe0617fbac933060f9f-1.mp3', 72427146),
(4422353, 90250847, 'Libérée, Délivrée', 'http://cdn-preview-b.deezer.com/stream/bd1a6b6d0e8965a1fd608c7f3d2764c6-1.mp3', 72427175),
(103, 90250848, 'Happy (From "Despicable Me 2")', 'http://cdn-preview-8.deezer.com/stream/8a9151cdfe7faf51c55e60e3f465a6f8-1.mp3', 73616508),
(103, 90250849, 'Marilyn Monroe', 'http://cdn-preview-4.deezer.com/stream/42bb47d3077e9e7eb2a9f65cf4d4fb52-2.mp3', 75502840),
(103, 90250850, 'Gust of Wind', 'http://cdn-preview-6.deezer.com/stream/6bc280bfe0bb7b23776c9f9ee76b96ab-2.mp3', 75502846),
(103, 90250851, 'Happy (From "Despicable Me 2")', 'http://cdn-preview-1.deezer.com/stream/123891b9a5a02e0ee2254bad951e6daa-2.mp3', 75502844),
(1097709, 90250852, 'Like I Can (Radio Mix)', 'http://cdn-preview-0.deezer.com/stream/0d6d83f677823f66edaf1bfa1af31c06-2.mp3', 91084099),
(1097709, 90250853, 'Money On My Mind', 'http://cdn-preview-f.deezer.com/stream/fc49aed27e402624fb6204f7e9f1ea60-3.mp3', 74461790),
(1097709, 90250854, 'I''m Not The Only One', 'http://cdn-preview-a.deezer.com/stream/a0262de44338823e15413c65cd96baae-1.mp3', 84876751),
(1097709, 90250855, 'Latch (Acoustic)', 'http://cdn-preview-6.deezer.com/stream/681dddc62a1da2cef5cba79a5c0752b5-2.mp3', 79392487),
(27, 90250856, 'Instant Crush', 'http://cdn-preview-0.deezer.com/stream/0f766b2312d338fd1295df91c869c4e5-5.mp3', 67238732),
(27, 90250857, 'Get Lucky (Radio Edit)', 'http://cdn-preview-e.deezer.com/stream/e6ef23e153ece7b082656c431274dfdb-3.mp3', 66609426),
(27, 90250858, 'Get Lucky', 'http://cdn-preview-7.deezer.com/stream/783280be6a0859be3f7050408050242e-1.mp3', 67238735),
(27, 90250859, 'Lose Yourself to Dance', 'http://cdn-preview-e.deezer.com/stream/ea91cf77f4cd12ddf499465a8f94c272-5.mp3', 67238733),
(56895, 90250860, 'INFIRMIÈRE', 'http://cdn-preview-7.deezer.com/stream/7b7ef0a9ecb44a9a7f9fb681ae3f2ba0-3.mp3', 74494858),
(56895, 90250861, 'LETTRE A ZOÉ', 'http://cdn-preview-6.deezer.com/stream/641b4d747765da121458c0fe7c7725f6-3.mp3', 74494863),
(56895, 90250862, 'BLIZZARD', 'http://cdn-preview-8.deezer.com/stream/8c9c1ff51b3a0dae3d474f9e863e8f65-1.mp3', 73682281),
(56895, 90250863, 'Voyous (feat. Georgio)', 'http://cdn-preview-a.deezer.com/stream/a76104fade212f57a9206b43c1e9be74-3.mp3', 74494854),
(15887, 90250864, 'Paris-Seychelles', 'http://cdn-preview-1.deezer.com/stream/1e2ef465ceaef9b8af7a3116d88fab4b-1.mp3', 68903082),
(15887, 90250865, 'Chou wasabi', 'http://cdn-preview-f.deezer.com/stream/f5616c5b40af27723438f34a8e7fb0f6-0.mp3', 70785264),
(15887, 90250866, 'Mon apache (Piano-Voix)', 'http://cdn-preview-4.deezer.com/stream/43cc59418debee78e045ba6953c32b24-2.mp3', 90530203),
(15887, 90250867, 'On attendra l''hiver', 'http://cdn-preview-f.deezer.com/stream/f4aeb02dfb82be6b07aeed3ed3f22056-0.mp3', 70785268),
(4512147, 90250868, 'Stolen Dance', 'http://cdn-preview-e.deezer.com/stream/ee7ea1ca0dfc2ab7784bd6f9dbcb053f-0.mp3', 72417244),
(4512147, 90250869, 'Down By The River', 'http://cdn-preview-1.deezer.com/stream/1deb154890725bebca4d392e5b58af58-0.mp3', 78232944),
(4512147, 90250870, 'Flashed Junk Mind', 'http://cdn-preview-9.deezer.com/stream/905335f0751b2687866b455915ac5fa1-0.mp3', 78232938),
(4512147, 90250871, 'Stolen Dance', 'http://cdn-preview-e.deezer.com/stream/e6d8e7b51b448713e015b516803388ff-0.mp3', 78232947),
(152369, 90250872, 'Dis-moi oui (Marina)', 'http://cdn-preview-2.deezer.com/stream/25351c11cc864cb47239f2af8764722e-4.mp3', 81797186),
(152369, 90250873, 'J’me bats pour toi', 'http://cdn-preview-b.deezer.com/stream/b6d684724fc4d969dd1b3019f1504ad2-3.mp3', 81797188),
(152369, 90250874, 'La Vie Du Bon Côté', 'http://cdn-preview-4.deezer.com/stream/422533394cf599e603ac64e32e99a47a-3.mp3', 68748923),
(152369, 90250875, 'Petite Émilie', 'http://cdn-preview-d.deezer.com/stream/d1b39e2e277290691e500a907a16de04-1.mp3', 53288981),
(271922, 90250876, 'Bad (feat. Vassy) (Radio Edit)', 'http://cdn-preview-b.deezer.com/stream/b75c749a1bd0e9bfbdf729dfa278572f-3.mp3', 76520669),
(271922, 90250877, 'No Money no Love (feat. Elliphant & Ms. Dynamite)', 'http://cdn-preview-d.deezer.com/stream/d1185fb884fb288016bf8dc12d445390-2.mp3', 90250607),
(271922, 90250878, 'Sun Goes Down (feat. MAGIC! & Sonny Wilson)', 'http://cdn-preview-7.deezer.com/stream/76758b9b2a84557d051797f167058057-3.mp3', 90250623),
(271922, 90250879, 'Booyah (Radio Edit)', 'http://cdn-preview-0.deezer.com/stream/0a5acfa6dc5b181436c1282dae40d214-0.mp3', 70216971),
(11963, 90250880, 'L''effet de serre', 'http://cdn-preview-4.deezer.com/stream/4c4b8041e067601ab708311b382a4f3f-3.mp3', 89359215),
(11963, 90250881, 'La malice', 'http://cdn-preview-4.deezer.com/stream/4e5ed02b180d6ded6a0311b81dac061c-3.mp3', 85755282),
(11963, 90250882, 'L''effet de serre', 'http://cdn-preview-4.deezer.com/stream/4c4b8041e067601ab708311b382a4f3f-2.mp3', 89938637),
(11963, 90250883, 'La malice', 'http://cdn-preview-4.deezer.com/stream/4e5ed02b180d6ded6a0311b81dac061c-2.mp3', 89938635),
(429675, 90250884, 'Locked Out Of Heaven', 'http://cdn-preview-6.deezer.com/stream/6ea1fabf557b2d2aee219b5b452e5c3e-2.mp3', 62724015),
(429675, 90250885, 'Treasure', 'http://cdn-preview-4.deezer.com/stream/43d1e40696abfb3b4dffed8c9f6ff0c4-2.mp3', 62723997),
(429675, 90250886, 'When I Was Your Man', 'http://cdn-preview-e.deezer.com/stream/ef738e680f64c33ec6562ff207eadf9a-2.mp3', 62723999),
(429675, 90250887, 'Grenade', 'http://cdn-preview-c.deezer.com/stream/cf37c7f6ac0e63981ab9cd2ad2d2eabd-10.mp3', 8011849),
(162815, 90250888, 'Dans 10 ans', 'http://cdn-preview-8.deezer.com/stream/83074c876d31bfac275f61ba8dfef0f7-2.mp3', 91046011),
(162815, 90250889, 'Bisou', 'http://cdn-preview-0.deezer.com/stream/0c5294ce096f0a14e9048d5a817b44ce-2.mp3', 91046013),
(162815, 90250890, 'La vie est un thème', 'http://cdn-preview-f.deezer.com/stream/f58f450bb24d43829a1037f2e50de6cf-2.mp3', 91046015),
(162815, 90250891, 'André', 'http://cdn-preview-8.deezer.com/stream/8a66e7b01215aaf8b73ffc3c1d782255-2.mp3', 91046007),
(13, 90250892, 'Guts Over Fear', 'http://cdn-preview-2.deezer.com/stream/23a046cd9c40e609a9b670681143f796-1.mp3', 83844574),
(13, 90250893, 'Lose Yourself (Soundtrack Version)', 'http://cdn-preview-1.deezer.com/stream/17cb0814dd83646cd91d7fe53392f333-9.mp3', 1109731),
(13, 90250894, 'The Monster', 'http://cdn-preview-8.deezer.com/stream/8208a068392026316d0373d95cbd8286-4.mp3', 72059773),
(13, 90250895, 'Love The Way You Lie (Album Version Explicit)', 'http://cdn-preview-c.deezer.com/stream/c492d5c0369cdf18857b8395bbb2ad57-12.mp3', 6461440),
(384236, 90250896, 'Sing', 'http://cdn-preview-c.deezer.com/stream/c64b6538a45b4f20183ee71b26abe97b-0.mp3', 77387146),
(384236, 90250897, 'Thinking Out Loud', 'http://cdn-preview-8.deezer.com/stream/86db7cad6fcc7acb7f60ae3241211696-0.mp3', 79875064),
(384236, 90250898, 'Don''t', 'http://cdn-preview-a.deezer.com/stream/a60281beda68546dc96a10b88abbf5e1-0.mp3', 79875050),
(384236, 90250899, 'I See Fire', 'http://cdn-preview-c.deezer.com/stream/c636287af67655e1b0657b9b98595713-5.mp3', 73135389),
(5283366, 90250900, 'Fade Out Lines', 'http://cdn-preview-2.deezer.com/stream/2d8686c833cc7814df8c11547ff7e7ad-1.mp3', 80460342),
(5283366, 90250901, 'Fade Out Lines', 'http://cdn-preview-9.deezer.com/stream/9fd904608311a1c21541e10a303fed91-0.mp3', 85538588),
(5283366, 90250902, 'Fade Out Lines (Alle Farben Remix)', 'http://cdn-preview-f.deezer.com/stream/fb58b68fbe04312e32f3ee2494e954f9-0.mp3', 85538590),
(5283366, 90250903, 'Fade Out Lines (Marcapasos Remix)', 'http://cdn-preview-f.deezer.com/stream/fbed5e37ed7d41fb9aa30d40c91c60ee-0.mp3', 85538596),
(249599, 90250904, 'Wiggle (feat. Snoop Dogg)', 'http://cdn-preview-d.deezer.com/stream/d16d89ffccc4adf149247bf7639e540b-0.mp3', 77380170),
(249599, 90250905, 'Talk Dirty (feat. 2 Chainz)', 'http://cdn-preview-9.deezer.com/stream/983b31abeec58fad99d0d44bc9d6f14e-3.mp3', 69533953),
(249599, 90250906, 'Trumpets', 'http://cdn-preview-f.deezer.com/stream/f7ccd79b91f28c84456dbede2065d03b-1.mp3', 70506864),
(249599, 90250907, 'Wiggle (feat. Snoop Dogg)', 'http://cdn-preview-d.deezer.com/stream/d16d89ffccc4adf149247bf7639e540b-2.mp3', 79567440),
(12778, 90250908, 'Tu sers à rien', 'http://cdn-preview-b.deezer.com/stream/b45e048a10836b086a91b96d1d9542b6-2.mp3', 90795429),
(12778, 90250909, 'Lové', 'http://cdn-preview-4.deezer.com/stream/4c035ecbf826e649fcf02ca4062babc3-2.mp3', 90795423),
(12778, 90250910, 'Va Bene', 'http://cdn-preview-8.deezer.com/stream/82ba978f45f664dacb2a70ce1f49640f-2.mp3', 89134543),
(12778, 90250911, 'Connaît pas', 'http://cdn-preview-0.deezer.com/stream/0ba0116fde7615fee67602e15babe75e-2.mp3', 90795427),
(83110, 90250912, 'A bouche que veux-tu', 'http://cdn-preview-e.deezer.com/stream/e39647e5c7491cfa38db4754430c36ce-3.mp3', 89755731),
(83110, 90250913, 'L''échappée belle', 'http://cdn-preview-b.deezer.com/stream/b588dd0046b7b8269d0b30c0d1a95894-2.mp3', 89755729),
(83110, 90250914, 'Battez-vous', 'http://cdn-preview-4.deezer.com/stream/41aa07337bac66a9190211b67fc43a44-2.mp3', 10446162),
(83110, 90250915, 'J''sais pas', 'http://cdn-preview-6.deezer.com/stream/600092646f7c5000b400370bacbb9996-2.mp3', 89755733),
(893222, 90250916, 'Can''t Hold Us (feat. Ray Dalton)', 'http://cdn-preview-0.deezer.com/stream/04e17bb3234b39ceb6bfbfbc462a1587-1.mp3', 61424044),
(893222, 90250917, 'Thrift Shop (feat. Wanz)', 'http://cdn-preview-1.deezer.com/stream/1e47a6d0cc9bbe6e7d91c6c7dca29a6f-1.mp3', 61424045),
(893222, 90250918, 'Same Love (feat. Mary Lambert)', 'http://cdn-preview-b.deezer.com/stream/b5961d64806cabd0be5fb01e7dfcb56c-1.mp3', 61424047),
(893222, 90250919, 'White Walls (feat. ScHoolboy Q, Hollis)', 'http://cdn-preview-e.deezer.com/stream/e5293d107cf2bd2e16caa865f22921b4-1.mp3', 61424051);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL,
  `password` varchar(32) CHARACTER SET ascii NOT NULL,
  `email` varchar(200) CHARACTER SET ascii NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `email`) VALUES
(NULL, 'default', 'default', 'default'),
(NULL, 'jimi', '2e3817293fc275dbee74bd71ce6eb056', 'jimi@club27.com'),
(NULL, 'Kangoula', '4c7c9747211faec5f678cf11d850d480', 'g-denis@live.fr');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `tracks`
--
ALTER TABLE `tracks`
  ADD CONSTRAINT `tracks_ibfk_1` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
