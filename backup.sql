-- --------------------------------------------------------
-- Hôte :                        localhost
-- Version du serveur:           5.7.24 - MySQL Community Server (GPL)
-- SE du serveur:                Win64
-- HeidiSQL Version:             9.5.0.5332
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Listage de la structure de la base pour ecommerce
CREATE DATABASE IF NOT EXISTS `ecommerce` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ecommerce`;

-- Listage de la structure de la table ecommerce. failed_jobs
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ecommerce.failed_jobs : ~0 rows (environ)
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;

-- Listage de la structure de la table ecommerce. migrations
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ecommerce.migrations : ~4 rows (environ)
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
	(5, '2014_10_12_000000_create_users_table', 1),
	(6, '2014_10_12_100000_create_password_resets_table', 1),
	(7, '2019_08_19_000000_create_failed_jobs_table', 1),
	(8, '2020_01_13_130737_create_products_table', 1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;

-- Listage de la structure de la table ecommerce. password_resets
CREATE TABLE IF NOT EXISTS `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ecommerce.password_resets : ~0 rows (environ)
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;

-- Listage de la structure de la table ecommerce. products
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_title_unique` (`title`),
  UNIQUE KEY `products_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ecommerce.products : ~30 rows (environ)
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` (`id`, `title`, `slug`, `subtitle`, `description`, `price`, `image`, `created_at`, `updated_at`) VALUES
	(1, 'Repellendus velit earum reprehenderit omnis eveniet.', 'nam-voluptates-iusto-eveniet-dolorem-est-ducimus-veritatis', 'Quasi aliquam cum dignissimos.', 'Tenetur sit voluptatum dolorem. Provident atque et numquam quia ut. Qui quam nobis ratione autem. Deleniti ut beatae sit aut ex odio quia.', 21300, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(2, 'Aut voluptatem repellendus debitis voluptas.', 'maiores-aut-consequatur-accusantium-deleniti-qui', 'Enim autem dolor rerum.', 'Quibusdam rerum eos eveniet non. Et sequi asperiores harum dolor et et. Sed nesciunt sed qui repellendus voluptates.', 29300, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(3, 'Consequuntur incidunt blanditiis reiciendis.', 'quaerat-vel-est-vel-a', 'Libero assumenda excepturi quasi eum.', 'Dignissimos aut dicta ex et et. Asperiores quis quidem aspernatur. Debitis dolores deleniti maxime minus cum neque iste. Hic praesentium dicta blanditiis error repudiandae distinctio vel.', 21100, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(4, 'Quis nisi architecto fugit repellendus.', 'et-a-repellendus-officia-magni-nisi', 'Eius magnam deserunt mollitia accusamus quisquam.', 'Et est minima aut nihil pariatur enim repellendus praesentium. Rerum optio quod culpa enim sed dolore quidem. Voluptatem repellat fugiat ut quis perferendis.', 23900, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(5, 'Nisi molestiae magni.', 'minima-voluptates-ab-animi-qui-magni', 'Doloribus aperiam et ea commodi.', 'Aliquam laborum optio quis ut. Dicta est dolor laboriosam odio impedit in ipsam. Commodi aut laborum nulla aspernatur.', 26300, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(6, 'Dolorem autem et enim odio.', 'ab-culpa-sint-fugit-similique-repellat', 'Ullam magni odio asperiores et repellat.', 'Sit minus reprehenderit sunt. Dolorem rerum inventore sed voluptate. Et in at ut consequuntur et.', 15800, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(7, 'Ipsum nulla sit illo.', 'ut-est-sit-accusantium-debitis', 'Tenetur eveniet sit consequuntur dolor optio.', 'Et quia cupiditate quas quia voluptas minima. Et et laboriosam recusandae officiis qui.', 29200, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(8, 'Perferendis saepe dolorem aut.', 'minima-recusandae-non-sit-assumenda', 'Deleniti dolor tenetur laudantium tempora numquam.', 'Quia nisi eligendi asperiores dicta quod vel doloremque. A natus omnis dolores voluptas. Rem illum ea quae dolorem atque aut ipsam.', 23300, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(9, 'Non voluptates ea et dolores.', 'porro-quia-veniam-nam-exercitationem-ducimus', 'Dolor debitis porro aut.', 'Ad voluptate doloribus minus et officia est tempore numquam. Eum omnis tempore cumque quis cum.', 19900, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(10, 'Voluptatem assumenda eos libero a perferendis.', 'possimus-dolore-architecto-asperiores-ab-sit-magni-ut', 'Alias voluptatem quas soluta ratione.', 'Quis sed explicabo consequatur ea eius. Vero modi ullam adipisci aut numquam temporibus. Porro voluptas esse eligendi.', 17000, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(11, 'Et qui consequatur quia aliquid.', 'voluptates-numquam-tempore-accusamus-pariatur-voluptas', 'Ipsum itaque sit ad atque.', 'Est eligendi possimus ex adipisci illo repudiandae facere. Odio dolorem ipsam aut est non. Voluptatum dolores labore et dolor animi nostrum temporibus. Fugit minus aut fugit quaerat maiores.', 10800, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(12, 'Maiores aspernatur vitae cum ut.', 'occaecati-id-dolore-rerum-voluptatem-ut', 'Optio temporibus laudantium voluptas dolor blanditiis itaque.', 'Assumenda minus facilis ut voluptatum alias. Porro id animi non eius facilis. Accusamus iusto et ex dolorum. Totam suscipit eveniet quia. Distinctio quia dolor laudantium eius qui magni.', 13000, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(13, 'Sed id nesciunt quo modi.', 'a-aut-consequatur-ea-voluptate-distinctio-omnis-nulla', 'Exercitationem et asperiores natus possimus nisi.', 'Placeat qui omnis eos quod reiciendis ullam aut iste. Ipsa optio ut et exercitationem. Aliquam fugit alias illo et error voluptas odio eveniet. Alias eaque iusto voluptas aut.', 14100, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(14, 'Maiores consequuntur quasi ipsa.', 'quo-reiciendis-a-reprehenderit', 'Eos accusantium optio nesciunt quam.', 'Quos enim eius enim odit non voluptatibus. Unde fugiat numquam rem occaecati illum.', 30000, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:06', '2020-01-13 13:21:06'),
	(15, 'Porro molestiae hic inventore ut.', 'laborum-quibusdam-est-veritatis-unde-in-eum-blanditiis-molestias', 'Dolor enim qui quae.', 'Deleniti sint quasi ad consequuntur ipsam aut praesentium. Voluptas aut eum et voluptas est. A laborum maxime ab numquam eum ut.', 10400, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(16, 'Reiciendis error eveniet natus et.', 'dolor-nostrum-voluptates-eum', 'Vel repudiandae et officia sit.', 'Deleniti inventore dolores et totam omnis. Consectetur quisquam autem alias rerum. Et itaque maiores praesentium repudiandae.', 23800, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(17, 'Et accusamus quibusdam quis minima recusandae.', 'ut-officia-eum-dolores', 'Est pariatur animi molestias eaque nobis porro.', 'Consequatur quia sequi autem ipsa eveniet. Autem laudantium voluptates aut. Est sed voluptatibus et est nihil sed non. Aut accusamus deserunt aspernatur ipsa qui ipsam doloribus.', 25900, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(18, 'Quis vel vel possimus dolores est.', 'ipsum-aut-autem-eius-officia-minima-eius-quasi', 'Officia voluptate quia sint laboriosam.', 'Illum dolorem voluptatum quasi nam. Quae dignissimos consequatur quod consequatur. Sapiente assumenda id nemo voluptates. Non ut repellendus itaque cum.', 25500, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(19, 'Molestias voluptatem ut.', 'et-ut-ipsam-delectus-velit-explicabo-labore-in', 'Numquam libero repellendus dolores.', 'Et eos nihil architecto quae velit sed dolore. Ea ut velit ut dolores distinctio. Consequuntur aspernatur consequatur ea nihil beatae et. Tempora fuga laborum inventore qui ut nam qui.', 11000, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(20, 'Eos ipsa incidunt odit quae.', 'quam-suscipit-amet-ipsam-hic-voluptas-cupiditate', 'Commodi hic occaecati molestiae.', 'Necessitatibus maxime officia consequatur itaque omnis. Ea aspernatur et laborum ducimus. Iste minus eligendi iste suscipit quis. Quia omnis libero enim assumenda sit et aliquam reiciendis.', 6700, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(21, 'Rerum officiis ut corporis consequatur fugiat.', 'cupiditate-nesciunt-possimus-suscipit-ea-rerum-et', 'Ducimus aut eaque quae molestias sit.', 'Quae debitis asperiores doloremque aut enim non ipsa. Occaecati earum dolor voluptatem pariatur et voluptas. Aspernatur quidem cumque et est accusamus.', 6300, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(22, 'Ea minima consequatur nulla sed.', 'quia-deserunt-ipsa-porro', 'Deserunt nihil laborum illo maxime animi ipsa.', 'Sed quo inventore et alias maiores quo qui. Ut est explicabo vel id. Ex ut quam iusto aspernatur maxime velit. Saepe similique labore illo ea tenetur.', 15200, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(23, 'Eaque accusantium excepturi et.', 'eligendi-harum-architecto-qui-vero-qui-voluptatem', 'Ut velit ut assumenda.', 'Aliquam cum est quidem deleniti inventore. Maxime voluptas cum perferendis rerum quia aperiam. Cumque facere in praesentium voluptatem libero voluptatem rerum.', 15400, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(24, 'Aliquid nihil dignissimos ut.', 'eius-et-dolor-qui-fugiat-dignissimos-adipisci-dolorum-et', 'Qui reprehenderit reprehenderit sunt.', 'Neque minus qui quia ut eos. Sequi sit aspernatur accusantium. Eaque laborum voluptas molestiae enim dolorem eius.', 17500, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(25, 'Odio consectetur quia itaque.', 'quas-impedit-commodi-recusandae-ullam-inventore', 'Vel perferendis est vel omnis.', 'Non vitae quia quia corrupti odit officia ex. Consequatur quo temporibus enim eos veniam. Laborum sed ex aut quo vel maxime quisquam. Modi omnis itaque cumque ducimus maxime cum. At sunt velit rem.', 9000, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(26, 'Accusamus laboriosam animi aperiam ab.', 'possimus-ab-necessitatibus-qui-officia-ullam-illum', 'Nemo ut ullam fugiat.', 'Sint eaque molestiae similique ut neque quos amet. Alias aut voluptatum ducimus facilis. Deleniti quod dolor fuga corporis aut. Aut quia omnis ut error incidunt tempore est.', 12600, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(27, 'Perspiciatis est aliquam.', 'non-ut-amet-dolor', 'Excepturi necessitatibus iure sit voluptas sit.', 'Eum iure at aliquam ipsam dolorem doloribus quia. Rerum qui ratione culpa provident nihil libero error consectetur. Facere ea dolorem nostrum iure quo est. Nihil et totam at numquam.', 6400, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(28, 'Quia illum laboriosam ducimus necessitatibus.', 'eligendi-modi-accusantium-ex-perspiciatis-magni', 'Eveniet commodi libero delectus quae porro dolorum.', 'Rerum non accusantium distinctio repudiandae quia possimus aut. Nihil fugit voluptatem sunt natus expedita nobis. Exercitationem qui vel recusandae cum.', 4700, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(29, 'Modi amet sed.', 'autem-voluptate-laboriosam-qui-voluptate-exercitationem-excepturi', 'Nihil aut in tenetur sequi minima facere.', 'Est atque fuga eveniet quisquam. Sunt occaecati qui accusamus non non ducimus est. Blanditiis natus ut necessitatibus. Exercitationem ipsa necessitatibus quidem ad. Eum ea inventore veritatis et.', 22600, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07'),
	(30, 'Voluptas laudantium nihil asperiores minima et.', 'ex-ut-sequi-eum-et-non', 'Fugit veniam sit id distinctio.', 'Adipisci perspiciatis explicabo rem sequi odio voluptas suscipit minus. Aut cupiditate alias alias et. Accusamus maxime sit voluptatibus doloribus quas.', 4000, 'https://via.placeholder.com/200x250', '2020-01-13 13:21:07', '2020-01-13 13:21:07');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;

-- Listage de la structure de la table ecommerce. users
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Listage des données de la table ecommerce.users : ~0 rows (environ)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
