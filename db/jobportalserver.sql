-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jun 09, 2023 at 04:36 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobportalserver`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_detail`
--

CREATE TABLE `about_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `about_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `details` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `about_detail`
--

INSERT INTO `about_detail` (`id`, `about_id`, `date`, `details`, `created_at`, `updated_at`) VALUES
(1, 2, '2023-04-01', '登録している求職者 厳選された人材のみ', NULL, NULL),
(2, 2, '2023-04-02', '優秀な人材を探せる職種・業種 17万パターン以上', NULL, NULL),
(3, 2, '2023-04-03', '転職潜在層も採用ターゲットにできる', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `lfetimage` text NOT NULL,
  `rightimage` text NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`id`, `title`, `description`, `lfetimage`, `rightimage`, `status`, `created_at`, `updated_at`) VALUES
(2, 'ビズリーチはスカウトでしか 会えない人材に出会えます', 'これまで出会えなかったような優秀な人材を、 データベースから 探せてそのままアプローチ', '1680838867.jpg', '1680838867..png', '1', '2023-04-06 11:04:34', '2023-04-06 21:41:07');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(11) NOT NULL DEFAULT 0,
  `name` varchar(191) NOT NULL,
  `email` varchar(191) NOT NULL,
  `password` varchar(191) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `role_id`, `name`, `email`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(3, 1, 'Buyer', 'buyer@buyer.com', '$2y$10$47ig/2wfYDc6EVg0iVnvp.l.jC0APqEVUjR7P6PFYTEhbNFzHPJ66', 'EIOkmVGm3iTEPVf3qwJzb4LqiIKKjaXB5iRcUBi1tDfw3CFZob4bFFRcbdj6', '2018-09-13 02:53:27', '2018-09-13 02:53:27'),
(4, 2, 'Sub Admin', 'sub@jobsportal.com', '$2y$10$oOY9RLR8a6xVsvxnFXYyf.9y6AdIleaZya9ScPehJVAUYL./B/m2W', 'waiukTr5cYxtkEEn6SIqr7OUIReJQyd0zXMQU1nQUwmNBgZJNTCie2jp5WLv', '2018-09-19 01:24:16', '2019-04-24 02:21:00');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `email` varchar(100) NOT NULL,
  `token` varchar(190) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `applicant_messages`
--

CREATE TABLE `applicant_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(150) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `to_email` varchar(100) DEFAULT NULL,
  `to_name` varchar(100) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_email` varchar(100) DEFAULT NULL,
  `from_phone` varchar(20) DEFAULT NULL,
  `message_txt` mediumtext DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `heading` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cate_id` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `featured` enum('1','0') DEFAULT '0',
  `meta_title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `lang` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `meta_keywords` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `meta_descriptions` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `heading` varchar(255) NOT NULL,
  `slug` varchar(250) NOT NULL,
  `image` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `heading`, `slug`, `image`, `created_at`, `updated_at`) VALUES
(15, 'Job Preparation', 'job-preparation', '1686142129.jpg', '2023-06-07 16:48:49', '2023-06-07 16:48:49');

-- --------------------------------------------------------

--
-- Table structure for table `career_levels`
--

CREATE TABLE `career_levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `career_level_id` int(11) DEFAULT 0,
  `career_level` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `career_levels`
--

INSERT INTO `career_levels` (`id`, `career_level_id`, `career_level`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Department Head', 1, 1, 1, 'en', '2018-04-06 10:12:01', '2018-04-06 10:12:01'),
(2, 2, 'Entry Level', 1, 1, 2, 'en', '2018-04-06 10:12:23', '2018-04-06 10:12:23'),
(3, 3, 'Experienced Professional', 1, 1, 3, 'en', '2018-04-06 10:12:44', '2018-04-06 10:12:44'),
(4, 4, 'GM / CEO / Country Head / President', 1, 1, 4, 'en', '2018-04-06 10:13:07', '2018-04-06 10:13:07'),
(5, 5, 'Intern/Student', 1, 1, 5, 'en', '2018-04-06 10:13:30', '2018-04-06 10:13:30'),
(6, 1, 'ادارے کا سربراہ', 0, 1, 1, 'ur', '2018-04-06 15:41:01', NULL),
(7, 3, 'تجربہ کار پیشہ ورانہ', 0, 1, 2, 'ur', '2018-04-06 15:41:01', NULL),
(8, 4, 'جی ایم / سی ای او / ملک ہیڈ / صدر', 0, 1, 3, 'ur', '2018-04-06 15:41:01', NULL),
(9, 2, 'داخل ہونے کے مراحل', 0, 1, 4, 'ur', '2018-04-06 15:41:01', NULL),
(10, 5, 'داخلہ / طالب علم', 0, 1, 5, 'ur', '2018-04-06 15:41:01', NULL),
(13, 4, 'GM / CEO / Country Head / President', 0, 1, 1, 'es', '2018-04-12 03:34:03', NULL),
(14, 5, 'Interno / Estudiante', 0, 1, 2, 'es', '2018-04-12 03:34:03', NULL),
(15, 1, 'Jefe de departamento', 0, 1, 3, 'es', '2018-04-12 03:34:03', NULL),
(16, 2, 'Nivel de entrada', 0, 1, 4, 'es', '2018-04-12 03:34:03', NULL),
(17, 3, 'Profesional con experiencia', 0, 1, 5, 'es', '2018-04-12 03:34:03', NULL),
(18, 3, 'الخبرة المهنية', 0, 1, 1, 'ar', '2018-04-12 03:35:25', NULL),
(19, 4, 'المدير العام / الرئيس التنفيذي / رئيس الدولة / الرئيس', 0, 1, 2, 'ar', '2018-04-12 03:35:25', NULL),
(20, 1, 'رئيس القسم', 0, 1, 3, 'ar', '2018-04-12 03:35:25', NULL),
(21, 5, 'طالب متدرب', 0, 1, 4, 'ar', '2018-04-12 03:35:25', NULL),
(22, 2, 'مستوى الدخول', 0, 1, 5, 'ar', '2018-04-12 03:35:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `case_studies`
--

CREATE TABLE `case_studies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` int(11) NOT NULL,
  `image` text NOT NULL,
  `title` varchar(255) NOT NULL,
  `image_title` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `case_studies`
--

INSERT INTO `case_studies` (`id`, `company_id`, `image`, `title`, `image_title`, `is_active`, `created_at`, `updated_at`) VALUES
(1, 2, '1685842243.jpg', 'Information Technology', 'Information Technology', '1', '2023-06-04 05:30:43', '2023-06-04 05:30:43');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(10) UNSIGNED NOT NULL,
  `city_id` int(11) DEFAULT 0,
  `city` varchar(30) NOT NULL,
  `state_id` int(11) NOT NULL,
  `is_default` int(11) DEFAULT 0,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 9999,
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `upload_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `city_id`, `city`, `state_id`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`, `upload_image`) VALUES
(1, 1, 'Tangail', 2, 1, 1, 1, 'en', '2023-05-20 11:48:14', '2023-05-20 11:48:14', 'tangail-1684604893-684.jpg'),
(2, 2, 'Mohammodpur', 2, 1, 1, 2, 'en', '2023-05-20 11:50:23', '2023-05-20 11:50:23', 'mohammodpur-1684605023-157.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_slug` varchar(250) DEFAULT NULL,
  `show_in_top_menu` tinyint(1) DEFAULT 0,
  `show_in_footer_menu` tinyint(1) DEFAULT 0,
  `seo_title` text DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `seo_keywords` text DEFAULT NULL,
  `seo_other` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `page_slug`, `show_in_top_menu`, `show_in_footer_menu`, `seo_title`, `seo_description`, `seo_keywords`, `seo_other`, `created_at`, `updated_at`) VALUES
(3, 'about-us', 1, 1, 'Jobs In Pakistan', 'Find best Jobs in Pakistan, jobs listings and job opportunities on ROZEE.PK. Browse more than 100K jobs in Pakistan and apply for free! ROZEE.PK is Pakistan\'s leading job website where more than 52K top companies are posting jobs', 'Jobs in Pakistan, Jobs Pakistan, Jobs, Careers, Recruitment, Employment, Hiring, Banking, CVs, Career, Finance, IT, Marketing, Online Jobs, Opportunity,Pakistan, Resume, Work, naukri, rizq, Rozi', '<meta name=\"robots\" content=\"ALL, FOLLOW,INDEX\" />', '2018-04-02 15:08:57', '2018-08-19 16:17:41'),
(4, 'terms-of-use', 0, 1, 'Terms of use', 'Terms of use', 'Terms of use', NULL, '2019-01-07 10:43:22', '2019-01-07 10:43:22');

-- --------------------------------------------------------

--
-- Table structure for table `cms_content`
--

CREATE TABLE `cms_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_id` int(11) DEFAULT NULL,
  `page_title` text DEFAULT NULL,
  `page_content` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `lang` varchar(10) DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cms_content`
--

INSERT INTO `cms_content` (`id`, `page_id`, `page_title`, `page_content`, `created_at`, `updated_at`, `lang`) VALUES
(7, 3, 'About Us', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec eleifend posuere magna vel suscipit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Morbi hendrerit imperdiet ex quis rutrum. Phasellus mattis mauris tincidunt, facilisis tortor ut, tincidunt justo. Duis interdum metus libero, vitae finibus quam bibendum a. Duis est nisi, rutrum id purus id, condimentum rutrum nulla. Suspendisse sodales cursus dolor, ac vehicula elit semper eget. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean bibendum leo metus, non sagittis arcu pharetra quis. Nullam sollicitudin ultricies lectus, id tincidunt odio. In hac habitasse platea dictumst. Nunc in nisi nibh. Ut dignissim ex id iaculis interdum. Donec ullamcorper nec orci a ullamcorper. Mauris volutpat tincidunt tellus, vitae sagittis urna pharetra pharetra.<br /><br /></p>\r\n<p>Curabitur fermentum, massa a finibus porttitor, felis lorem congue lacus, imperdiet sollicitudin nisl tortor a magna. Phasellus eget arcu sed elit sagittis pellentesque. Sed sit amet mattis lacus. Suspendisse quis vehicula lorem, eget ullamcorper neque. Aliquam vitae sapien erat. Vestibulum eget mauris sit amet turpis dapibus dignissim et ac libero. Etiam vulputate, ex vel dictum volutpat, arcu arcu varius massa, a pulvinar velit justo non ligula. Donec a metus sit amet purus fermentum pellentesque. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.<br /><br /></p>\r\n<p>Nam aliquet odio vitae finibus auctor. Etiam lorem dui, sollicitudin placerat felis quis, molestie posuere eros. Nunc id tellus quis ligula iaculis tempor. Etiam tincidunt augue diam, et faucibus lacus rhoncus id. Integer eu lectus at sem sollicitudin dapibus. Cras blandit urna sit amet nulla fermentum, in pulvinar mi tempor. Nam mollis justo arcu, non rutrum orci pharetra vitae. Duis eleifend quam ac arcu posuere imperdiet. Suspendisse eget viverra lectus. Sed laoreet vestibulum posuere. Phasellus dictum ultrices egestas.</p>', '2018-09-12 04:45:03', '2018-09-12 04:45:17', 'en'),
(8, 4, '個人情報の取り扱い、及び、利用規約', '<p><span data-contrast=\"auto\">本規約は、株式会社</span><span data-contrast=\"auto\">JBBR</span><span data-contrast=\"auto\">（以下、「当社」と言います。） が提供するサービスを利用する上での合意事項となります。ご利用になる際に、必ずご確認、ご承諾いただきますようお願い申し上げます。また、利用者の個人情報を監理するにあたり細心の注意を払い、以下に掲げたとおり取り扱います。</span><span data-ccp-props=\"{\"> </span></p>\r\n<p><span data-ccp-props=\"{\"><br /><br /></span></p>\r\n<p><span data-contrast=\"none\">第１条　本規約について</span><span data-ccp-props=\"{\"> </span></p>\r\n<ol>\r\n<li><span data-contrast=\"none\">この利用規約（以下「本規約」といいます。）は、</span><span data-contrast=\"none\">株式会社</span><span data-contrast=\"none\">name</span><span data-contrast=\"none\">（以下「当社」といいます。）が提供する本システムを利用する際の一切の行為に適用されます。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">本規約は、本システムの利用条件を定めるものです。本システムを利用する者（以下「利用者」といいます。）は、本規約に従い本システムを利用するものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">何らかの方法により本システムを利用することによって、利用者は本規約の全ての記載内容に承諾したものとみなされます。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">当社は、本規約およびその他の利用規約等において、本システムの利用条件を規定しています。その他の利用規約等は名称の如何にかかわらず本規約の一部を構成するものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">本規約の規定とその他の利用規約等の規定が異なる場合は、当該その他の利用規約等の規定が優先して適用されるものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">本規約のうち、現時点では利用者に適用されない規定がある場合、事情変更により将来適用可能となった時点から適用されるものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n</ol>\r\n<br /><br />\r\n<p><span data-ccp-props=\"{}\"> <span class=\"TextRun SCXW134729822 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW134729822 BCX9\">第２条　定義</span></span><span class=\"EOP SCXW134729822 BCX9\" data-ccp-props=\"{}\"> <br /></span></span></p>\r\n<ol>\r\n<li><span data-contrast=\"none\">バロジョブ</span><span data-contrast=\"none\">： </span><span data-contrast=\"none\">当社の運営する「バロジョブ」と称するウェブサイト・システムを通じて、当社が、バロジョブ会員に対して求人者の求人情報を提供する等の機能を提供する就職希望者向けメディアシステムをいいます。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">求人者用システム：</span> <span data-contrast=\"none\">当社が運営する求人者向けウェブサイト。システムを通じて、求人者に対してバロジョブ会員の求職者情報を提供する等の機能を提供する求人者向けメディアシステムをいいます。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">求職者用システム：</span> <span data-contrast=\"none\">当社が運営する求職者向けウェブサイト・システムを通じて、求人者に対してバロジョブ会員の求職者情報を提供する等の機能を提供する求職者向けメディアシステムをいいます。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">本システム：</span><span data-contrast=\"none\"> 「</span><span data-contrast=\"none\">バロジョブ」およびその関連システムをいいます。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">バロジョブ会員：</span><span data-contrast=\"none\"> 「</span><span data-contrast=\"none\">バロジョブ」に会員登録をしている法人ならびに求職者をいいます。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">採用企業：</span> <span data-contrast=\"none\">当社と別途契約の上、求人者用システムに登録している企業をいいます。なお、紹介事業者と採用企業を総称して、「求人者」といいます。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">職務経歴書：</span><span data-contrast=\"none\">利用者が本システム上において、当社の定める投稿方法により、自己の職務経歴、その他登録したものをいいます。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">職務経歴書等の情報：</span> <span data-contrast=\"none\">利用者が本システムを通じて当社または求人者に提供する、職務経歴書、求人情報に関する連絡、応募のためのメール、アンケート回答その他一切の情報をいいます。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">履歴等の情報：</span> <span data-contrast=\"none\">本システム上における求人者との連絡状況、求人者からの受信メール、その他利用者の本システムの利用履歴等の情報をいいます。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"auto\">その他の利用規約等：</span> <span data-contrast=\"auto\">当社が本規約の他に、利用者による本システムの利用に関して定めた規定をいいます。</span><span data-ccp-props=\"{\"> </span></li>\r\n</ol>\r\n<br /><br /><span class=\"TextRun SCXW1467787 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW1467787 BCX9\">第３条　会員登録申込</span></span><span class=\"EOP SCXW1467787 BCX9\" data-ccp-props=\"{}\"> </span><br /><br />\r\n<ol>\r\n<li data-leveltext=\"%1.\" data-font=\"Helvetica Neue\" data-listid=\"4\" data-list-defn-props=\"{\" aria-setsize=\"-1\" data-aria-posinset=\"1\" data-aria-level=\"1\"><span data-contrast=\"none\">バロジョブ会員となることを希望する者は、本規約の内容に同意した上で、当社所定の方法により、会員登録の申込を行うものとします。</span><span data-ccp-props=\"{}\"> </span></li>\r\n</ol>\r\n<ol>\r\n<li data-leveltext=\"%1.\" data-font=\"Helvetica Neue\" data-listid=\"4\" data-list-defn-props=\"{\" aria-setsize=\"-1\" data-aria-posinset=\"2\" data-aria-level=\"1\"><span data-contrast=\"none\">会員登録の申込をした者（以下「登録申込者」といいます。）は、当社が利用の申込を承諾した時点で、バロジョブ会員となります。</span><span data-ccp-props=\"{}\"> </span></li>\r\n</ol>\r\n<ol>\r\n<li data-leveltext=\"%1.\" data-font=\"Helvetica Neue\" data-listid=\"4\" data-list-defn-props=\"{\" aria-setsize=\"-1\" data-aria-posinset=\"3\" data-aria-level=\"1\"><span data-contrast=\"none\">ご登録者は、本サービスの利用を申し込んだ時点もしくは事実上本サービスの利用を開始した時点のいずれか早い時点において、変候補の本規約を含め、本規約の定めに従い本サービスを利用する事について、完全に承諾しているとみなされます。</span><span data-ccp-props=\"{}\"> </span></li>\r\n</ol>\r\n<ol>\r\n<li data-leveltext=\"%1.\" data-font=\"Helvetica Neue\" data-listid=\"4\" data-list-defn-props=\"{\" aria-setsize=\"-1\" data-aria-posinset=\"4\" data-aria-level=\"1\"><span data-contrast=\"none\">利用者は、会員登録時の情報内容に変更が生じた場合には、直ちに本システム上で修正を行うものとします。</span><span data-ccp-props=\"{}\"> </span></li>\r\n</ol>\r\n<p><span data-ccp-props=\"{\"> </span></p>\r\n<p><span data-ccp-props=\"{\"> </span></p>\r\n<p><span data-contrast=\"none\">第４条　会員登録申込の不承諾</span><span data-ccp-props=\"{\"> </span></p>\r\n<ol>\r\n<li><span data-contrast=\"none\">登録申込者が、当社が本システム上で登録申込者に認識可能な方法により表示する会員基準を満たさない場合</span><span data-ccp-props=\"{}\"> </span></li>\r\n<li><span data-contrast=\"none\">登録申込者が、過去に本規約に違反したことを理由として強制登録解除処分を受けた者である場合</span><span data-ccp-props=\"{}\"> </span></li>\r\n<li><span data-contrast=\"none\">登録申込者が反社会的勢力の構成員またはその関係者である場合</span><span data-ccp-props=\"{}\"> </span></li>\r\n<li><span data-contrast=\"none\">その他当社が不適切と判断した場合</span><span data-ccp-props=\"{}\"> </span></li>\r\n</ol>\r\n<br /><span class=\"TextRun SCXW874508 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW874508 BCX9\">第５条　会員登録解除</span></span><span class=\"EOP SCXW874508 BCX9\" data-ccp-props=\"{\"> </span><br />\r\n<ol>\r\n<li><span data-contrast=\"none\">利用者がバロジョブ会員の登録解除を希望する場合には、利用者は、当社所定の方法により、当社に登録解除の申出を行うものとします。</span><span data-ccp-props=\"{}\"> </span></li>\r\n<li><span data-contrast=\"none\">当社は、利用者が次の各号に掲げるいずれかの事項に該当した場合には、当社の判断によって、利用者を強制的に登録解除し、本システムの利用をお断りすることがあります。</span><span data-ccp-props=\"{}\"> </span></li>\r\n</ol>\r\n<br />\r\n<p><span data-contrast=\"none\">（１）第３号第１条の方法によらずに利用の申込を行った事が明らかになった場合</span><span data-ccp-props=\"{\"> </span></p>\r\n<ol>\r\n<li><span data-contrast=\"none\">当社の定める年収等の会員基準を満たしていなかったことが明らかとなった場合</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">本規約に違反した場合</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">会員登録後６ヶ月以上、本システムに一度もログインしなかった場合</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">その他当社が不適切と判断した場合</span><span data-ccp-props=\"{\"> </span></li>\r\n</ol>\r\n<br /><span class=\"TextRun SCXW230076630 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW230076630 BCX9\">第</span><span class=\"NormalTextRun SCXW230076630 BCX9\">６</span><span class=\"NormalTextRun SCXW230076630 BCX9\">条　</span><span class=\"NormalTextRun SCXW230076630 BCX9\">当社のサービス</span></span><span class=\"EOP SCXW230076630 BCX9\" data-ccp-props=\"{\"> </span><br />\r\n<ol>\r\n<li><span data-contrast=\"none\">日本国に所在する法人が求める全職種の求人を対象に海外の人材を</span><span data-contrast=\"none\">ご希望と能力にマッチした職業にすみやかに就転職できるよう責任を持って努めます。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">「当社のサービス」とは、当社が直接にまたは当社のウェブサイト等を通じて提供する転職支援等のサービス（以下、「本サービス」と言います。）のことを言います。本サービスにおいて当社は、ご登録者（求職者）に対して、これまでのキャリア、スキルや適性に対し、ご登録者に適すると思われる求人の紹介等を行います。求人紹介は職業安定法に基づき行います。</span><span data-ccp-props=\"{}\"> </span></li>\r\n<li><span data-contrast=\"none\">人種、国籍、信条、性別、社会的身分等を理由とした差別的な取り扱いは一切いたしません。</span><span data-ccp-props=\"{}\"> </span></li>\r\n<li><span data-contrast=\"none\">ご登録者は当社のご登録者専用ウェブページで、</span><span data-contrast=\"none\">MyPage</span><span data-contrast=\"none\">を利用する事ができます。ご登録者は</span><span data-contrast=\"none\">MyPage</span><span data-contrast=\"none\">上で、当社にご登録している求人者の詳細情報の確認、求人への応募や問い合わせ等を行う事ができます。</span><span data-ccp-props=\"{}\"> </span></li>\r\n<li><span data-contrast=\"none\">ご登録者のスキルや適性に応じて、当社コンサルタントより常務委託案件の紹介を行う場合がございます。なお、当社が紹介した業務委託案件をご登録者が受託する場合は、別途当社もしくは当社顧客企業とご登録者との間で契約を締結するものとし、業務内容、業務委託料、その他詳細条件は当該契約の定めに従うものとします。</span></li>\r\n</ol>\r\n<span data-ccp-props=\"{}\"> </span><br /><span class=\"TextRun SCXW178949372 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW178949372 BCX9\">第７条　サービスの提供</span></span><span class=\"EOP SCXW178949372 BCX9\" data-ccp-props=\"{\"> </span><br /><br />\r\n<ol>\r\n<li><span class=\"TextRun Highlight SCXW253447934 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW253447934 BCX9\">本サービスを提供するにあたり、ご登録者は、当社がご登録者の指定による方法（電子メール、ダイレクトメール、電話、郵便、FAX等）で、ご登録者にご連絡する事について、あらかじめ同意しているものとします。また、氏名、生年月日、</span></span><span class=\"TextRun Highlight SCXW253447934 BCX9\" lang=\"EN-US\" xml:lang=\"EN-US\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW253447934 BCX9\">E</span></span><span class=\"TextRun Highlight SCXW253447934 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW253447934 BCX9\">メールアドレス、電話番号などの基本情報のみをご登録（仮登録）されている方についても同様とします。</span></span><span class=\"EOP SCXW253447934 BCX9\" data-ccp-props=\"{\"> </span></li>\r\n</ol>\r\n<span class=\"TextRun SCXW248164887 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW248164887 BCX9\">第</span><span class=\"NormalTextRun SCXW248164887 BCX9\">８</span><span class=\"NormalTextRun SCXW248164887 BCX9\">条　</span><span class=\"NormalTextRun SCXW248164887 BCX9\">会員</span></span><span class=\"TextRun SCXW248164887 BCX9\" lang=\"EN-US\" xml:lang=\"EN-US\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW248164887 BCX9\">ID</span></span><span class=\"TextRun SCXW248164887 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW248164887 BCX9\">・アカウントパスワード</span></span><span class=\"EOP SCXW248164887 BCX9\" data-ccp-props=\"{\"> </span><br />\r\n<ol>\r\n<li><span data-contrast=\"none\">利用者は</span><span data-contrast=\"none\">1</span><span data-contrast=\"none\">人につき</span><span data-contrast=\"none\">1</span><span data-contrast=\"none\">つの会員アカウントを保有するものとします。</span><span data-contrast=\"none\">1</span><span data-contrast=\"none\">人が複数の会員アカウントを保有すること、複数人が</span><span data-contrast=\"none\">1</span><span data-contrast=\"none\">つの会員アカウントを共同して保有することはできません。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">ご登録者は、発行・付与された</span><span data-contrast=\"none\">ID</span><span data-contrast=\"none\">・パスワードの使用及び管理について一切の責任を負うものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">ご登録者は、理由の如何を問わず、</span><span data-contrast=\"none\">ID</span><span data-contrast=\"none\">・パスワードを第三者に使用させ、もしくは譲渡、貸与、名義変更、売買、担保の用に供する事などはできないものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">ご登録者は、</span><span data-contrast=\"none\">ID</span><span data-contrast=\"none\">・パスワードを第三者に使用させた事により発生する一切の損害、及びご登録者自身もしくは第三者が</span><span data-contrast=\"none\">ID</span><span data-contrast=\"none\">・パスワードを不正に使用した事により発生する一切の損害につき、ご登録者に使用もしくは管理上の帰責性があるか否かにかかわらずその全てを負担するものとし、当社は何ら責任を負わないものとします。</span></li>\r\n</ol>\r\n<br /><span class=\"TextRun SCXW27664864 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW27664864 BCX9\">第９条　ご登録者の責任</span></span><span class=\"EOP SCXW27664864 BCX9\" data-ccp-props=\"{\"> </span><br /><br />\r\n<ol>\r\n<li><span data-contrast=\"none\">ご登録者は、自己の責任に基づいて本サービスを利用するものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">ご登録者は、本サービスの利用の際して入力された全ての情報内容について一切の責任を負うものとし、当社は何ら責任を負わないものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">ご登録者は、本サービスの利用に基づいて得た全ての情報を、本サービスを通じて転職、求職もしくはキャリアアップなどに関する情報の収集という指摘利用の範囲内でのみ利用する事ができるものとし、この目的を超えて利用し、あるいは第三者に対してみだりに公開してはならないものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">ご登録者は、自己責任に基づいて求人企業に対して労働条件あるいはその他の契約内容を直接確認した後に、当該求人企業と労働契約等を結ぶものとします。また、求人のご紹介時に当社がご登録者に通知した労働条件は、当該条件で労働契約を締結する事を最終的に保障するものではない事を承諾するものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n</ol>\r\n<br /><span class=\"TextRun SCXW85793322 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW85793322 BCX9\">第</span><span class=\"NormalTextRun SCXW85793322 BCX9\">１０</span><span class=\"NormalTextRun SCXW85793322 BCX9\">条　システム利用料</span></span><span class=\"EOP SCXW85793322 BCX9\" data-ccp-props=\"{}\"> </span><br /><br />\r\n<ol>\r\n<li><span data-contrast=\"none\">バロジョブ会員登録および本システムのうち当社の定める範囲内におけるシステム機能の利用は無料とします。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">当社の定めるバロジョブシステムサービス機能は有料とします。有料機能の利用料（以下単に「利用料」といいます。）の具体的金額については、本システム上で当社がバロジョブ会員に認識可能な方法で表示するとおりとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">バロジョブシステム使用料に関してはシステム開始日に、利用料の支払義務が発生するものとします。ただし、当社が別に認めた場合にはこの限りではありません。</span></li>\r\n</ol>\r\n<br /><span class=\"TextRun SCXW214922878 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW214922878 BCX9\">第１１条　</span><span class=\"NormalTextRun SCXW214922878 BCX9\">利用環境の整備</span></span><span class=\"EOP SCXW214922878 BCX9\" data-ccp-props=\"{\"> </span><br /><br />\r\n<ol>\r\n<li><span data-contrast=\"none\">利用者は、本システムを利用するために必要なパソコンその他のあらゆる機器、ソフトウェア、通信手段を自己の責任と費用において、適切に整備するものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">利用者は自己の利用環境に応じて、不正アクセスおよび情報漏洩の防止等のセキュリティ対策を講じるものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">当社は利用者の利用環境について一切関与せず、また一切の責任を負いません。</span></li>\r\n</ol>\r\n<br /><span class=\"TextRun SCXW90253900 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW90253900 BCX9\">第１２条　職務経歴書登録</span></span><span class=\"EOP SCXW90253900 BCX9\" data-ccp-props=\"{\"><span class=\"EOP SCXW90253900 BCX9\" data-ccp-props=\"{\"> <br /><br /></span></span>\r\n<ol>\r\n<li><span data-contrast=\"none\">利用者は、バロジョブ会員となった後、当社の定める掲載基準の範囲内において、自己の責任と判断において本システムを利用して職務経歴書を投稿するものとします。</span><span data-ccp-props=\"{}\"> </span></li>\r\n<li><span data-contrast=\"none\">利用者は、職務経歴書に、自己または他者の個人情報（住所、メールアドレス、電話番号等）を記載してはならないものとし、職務経歴書に個人情報が含まれていた場合には、当社が当該部分を削除または修正することがあります。</span><span data-ccp-props=\"{}\"> </span></li>\r\n<li><span data-contrast=\"none\">当社は、利用者が職務経歴書を投稿した場合には、当該職務経歴書の内容が当社の定める掲載基準に適う内容であるか否かを審査し、掲載基準を満たした場合にのみ、求人者に対し閲覧可能な状態とします。利用者は、職務経歴書内容に変更が生じた場合には、直ちに修正を行うものとします。</span><span data-ccp-props=\"{}\"> </span></li>\r\n<li><span data-contrast=\"none\">当社は、職務経歴書が掲載基準に反すること、または事実に反することが明らかになった場合には、自発的削除・訂正を求める権利、職務経歴書の公開範囲を変更しまたは閲覧できない状態（非公開）にする権利、事前の通知なしに当該登録情報の全部または一部を削除変更する権利を有します。</span><span data-ccp-props=\"{}\"> </span></li>\r\n<li><span data-contrast=\"none\">利用者は、職務経歴書を「バロジョブ」のサイトを通じて投稿した場合、または「バロジョブ」のサイトを通じて今後投稿する場合、本システムの管理・運営に必要な範囲で、当該職務経歴書を当社が利用することを予め承諾します</span><span data-ccp-props=\"{\"> </span></li>\r\n</ol>\r\n<span class=\"TextRun SCXW181350216 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW181350216 BCX9\">第１３条　保証</span></span><span class=\"EOP SCXW181350216 BCX9\" data-ccp-props=\"{\"> </span><br /><br />\r\n<ol>\r\n<li><span class=\"TextRun Highlight SCXW187840797 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW187840797 BCX9\">職務経歴書等の情報を投稿する利用者は、当社に対し、当該情報の真実性、正確性および当該情報が第三者の権利を侵害していないことを保証するものとします。万一、第三者との間で何らかの紛争が発生した場合には、当該利用者の費用と責任において問題を解決するとともに、当社に何らの迷惑または損害を与えないものとします。</span></span></li>\r\n</ol>\r\n<br /><br /><span class=\"TextRun SCXW192777543 BCX9\" lang=\"JA-JP\" xml:lang=\"JA-JP\" data-contrast=\"none\"><span class=\"NormalTextRun SCXW192777543 BCX9\">第１４条　免責</span></span><span class=\"EOP SCXW192777543 BCX9\" data-ccp-props=\"{\"> </span><br /><br />\r\n<ol>\r\n<li><span data-contrast=\"none\">ご登録者は、本サービスの利用によって転職の実現が保証されるものではない事、および求人企業との労働条件その他の契約内容について紛争が生じた場合には事故の費用と責任において求人企業と協議の上解決する事を承諾の上、本サービスを利用するものとします。また当社は、本規約の各条項に定めるものの他、本サービスを利用した事かつ当社の責に帰すべき時湯があった事によりご登録者に損害が発生した場合は、それによる直接の結果として現実に被った通常生じる範囲内の損害に限り責任を負い、その他の損害については責任を負わないものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n<li><span data-contrast=\"none\">ご登録者は、天変地異その他当社の責によらない事由によって本サービスの提供が遅延、困難もしくは不可能となった場合には、これに起因してご登録者に発生した一切の損害について、当社が責任を負いかねる事に予め同意するものとします。</span><span data-ccp-props=\"{\"> </span></li>\r\n</ol>\r\n<br /><br /><br /><span data-ccp-props=\"{\"> </span><br /><br /><br /><br /><br /><br /><br />\r\n<p><span data-ccp-props=\"{}\"> </span></p>\r\n<br />\r\n<p><span data-ccp-props=\"{\"> </span></p>', '2019-01-07 10:44:20', '2023-05-20 20:01:48', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(155) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `ceo` varchar(60) DEFAULT NULL,
  `industry_id` int(11) DEFAULT 0,
  `ownership_type_id` int(11) DEFAULT 0,
  `description` mediumtext DEFAULT NULL,
  `location` varchar(155) DEFAULT NULL,
  `no_of_offices` int(11) DEFAULT NULL,
  `website` varchar(155) DEFAULT NULL,
  `no_of_employees` varchar(15) DEFAULT NULL,
  `established_in` varchar(12) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `logo` varchar(155) DEFAULT NULL,
  `country_id` int(11) DEFAULT 0,
  `state_id` int(11) DEFAULT 0,
  `city_id` int(11) DEFAULT 0,
  `slug` varchar(155) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_featured` tinyint(1) DEFAULT 0,
  `verified` tinyint(1) DEFAULT 0,
  `verification_token` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `map` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `facebook` varchar(250) DEFAULT NULL,
  `twitter` varchar(250) DEFAULT NULL,
  `linkedin` varchar(250) DEFAULT NULL,
  `google_plus` varchar(250) DEFAULT NULL,
  `pinterest` varchar(250) DEFAULT NULL,
  `package_id` int(11) DEFAULT 0,
  `package_start_date` timestamp NULL DEFAULT NULL,
  `package_end_date` timestamp NULL DEFAULT NULL,
  `jobs_quota` int(11) DEFAULT 0,
  `availed_jobs_quota` int(11) DEFAULT 0,
  `is_subscribed` tinyint(1) DEFAULT 1,
  `cvs_package_id` int(11) DEFAULT NULL,
  `cvs_package_start_date` timestamp NULL DEFAULT NULL,
  `cvs_package_end_date` timestamp NULL DEFAULT NULL,
  `cvs_quota` int(11) DEFAULT NULL,
  `availed_cvs_quota` int(11) DEFAULT NULL,
  `availed_cvs_ids` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `email`, `ceo`, `industry_id`, `ownership_type_id`, `description`, `location`, `no_of_offices`, `website`, `no_of_employees`, `established_in`, `fax`, `phone`, `logo`, `country_id`, `state_id`, `city_id`, `slug`, `is_active`, `is_featured`, `verified`, `verification_token`, `password`, `remember_token`, `map`, `created_at`, `updated_at`, `facebook`, `twitter`, `linkedin`, `google_plus`, `pinterest`, `package_id`, `package_start_date`, `package_end_date`, `jobs_quota`, `availed_jobs_quota`, `is_subscribed`, `cvs_package_id`, `cvs_package_start_date`, `cvs_package_end_date`, `cvs_quota`, `availed_cvs_quota`, `availed_cvs_ids`, `email_verified_at`, `payment_method`, `type`, `count`) VALUES
(1, 'Power Color', 'jamesdev@gmail.com', 'Power Color', 32, 4, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin fermentum condimentum mauris, non posuere urna consectetur quis. Suspendisse semper eu eros eget convallis. Etiam mattis blandit nulla, non venenatis risus varius vel. Morbi fringilla dignissim elit id blandit. Pellentesque vel luctus felis. Vestibulum eros nibh, consequat ut felis in, vehicula lobortis quam. Duis diam mauris, convallis in risus in, gravida hendrerit lacus. Donec euismod accumsan sem et aliquam. Duis a velit eget urna mattis ultricies. Aliquam nibh ipsum, aliquet nec sollicitudin non, fermentum nec diam. Vestibulum ac urna vehicula, dapibus dui quis, aliquet neque. Sed ac tristique purus. Vestibulum tempor, erat eu porta tempor, erat ipsum cursus dui, eu tempus mauris leo id mi. Sed ultrices sollicitudin vehicula. Proin in ullamcorper massa.', 'Your Location Address USA', 1, 'http://www.comapnydomain.com', '301-600', '2002', '1233333333333', '+12333333333333', 'power-color-1536854682-955.jpg', 231, 3924, 42804, 'power-color-1', 1, 1, 0, NULL, '$2y$10$QNkxVp57f4XziVCfJA3yAeWMCnmVt.Xd5qdLkfivZARYKN/FarVie', 'yeXmwgk1QiZV8mKCzKKGeEXHUeh2yvL2aUS2QG3xv3GCTjj3ZUfcvoEdML0e', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d8310.686427880151!2d-74.00585671025667!3d40.7098868133123!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2s!4v1536851502771\"  frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '2018-07-11 13:38:31', '2021-01-31 21:30:37', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://plus.google.com/', 'https://www.pinterest.com/', 0, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(2, 'AutoSoft Dynamics', 'autosoft@outlook.com', 'AutoSoft Dynamics', 1, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin fermentum condimentum mauris, non posuere urna consectetur quis. Suspendisse semper eu eros eget convallis. Etiam mattis blandit nulla, non venenatis risus varius vel. Morbi fringilla dignissim elit id blandit. Pellentesque vel luctus felis. Vestibulum eros nibh, consequat ut felis in, vehicula lobortis quam. Duis diam mauris, convallis in risus in, gravida hendrerit lacus. Donec euismod accumsan sem et aliquam. Duis a velit eget urna mattis ultricies. Aliquam nibh ipsum, aliquet nec sollicitudin non, fermentum nec diam. Vestibulum ac urna vehicula, dapibus dui quis, aliquet neque. Sed ac tristique purus.<br /><br />\r\n<ul>\r\n<li>Vestibulum tempor, erat eu porta tempor, erat ipsum cursus dui, eu tempus mauris leo id mi.</li>\r\n<li>Sed ultrices sollicitudin vehicula.</li>\r\n<li>Proin in ullamcorper massa.</li>\r\n</ul>', 'Kennesaw, GA USA', 3, 'http://www.comapnydomain.com', '11-50', '2002', '1234567989', '+133333333333', 'autosoft-dynamics-1536854279-440.jpg', 231, 3931, 43999, 'autosoft-dynamics-2', 1, 1, 0, NULL, '$2y$10$h.vwFpirfKJSvrGVobpYReAhGoOkEu9Z27rEVdmLyV0nwplVqKDHW', 'YZeSvd9fuh0WQ6Adwppec2igHjVQ6HEupm3HjIqGKPpnFb4XuDjrXwGdE2XU', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d8310.686427880151!2d-74.00585671025667!3d40.7098868133123!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2s!4v1536851502771\"  frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '2018-07-27 18:22:04', '2019-01-07 13:36:34', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://plus.google.com/', 'https://www.pinterest.com/', 0, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(3, 'New Design Studio', 'info@yourdomain.com', 'New Design Studio', 31, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin fermentum condimentum mauris, non posuere urna consectetur quis. Suspendisse semper eu eros eget convallis. Etiam mattis blandit nulla, non venenatis risus varius vel. Morbi fringilla dignissim elit id blandit. Pellentesque vel luctus felis. Vestibulum eros nibh, consequat ut felis in, vehicula lobortis quam. Duis diam mauris, convallis in risus in, gravida hendrerit lacus. Donec euismod accumsan sem et aliquam. Duis a velit eget urna mattis ultricies. Aliquam nibh ipsum, aliquet nec sollicitudin non, fermentum nec diam. Vestibulum ac urna vehicula, dapibus dui quis, aliquet neque. Sed ac tristique purus. Vestibulum tempor, erat eu porta tempor, erat ipsum cursus dui, eu tempus mauris leo id mi. Sed ultrices sollicitudin vehicula. Proin in ullamcorper massa.', 'Atlantic City, NJ USA', 1, 'http://www.comapnydomain.com', '301-600', '2002', '13245678908', '+133333333333', 'new-design-studio-1536854542-519.jpg', 231, 3953, 47687, 'new-design-studio-3', 1, 1, 0, NULL, '$2y$10$Czj9jjs4ovh8zCmW4yH9mOfAyw7rPFZNBo1wLAH/dpWM7wh6Vtyke', '', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d8310.686427880151!2d-74.00585671025667!3d40.7098868133123!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2s!4v1536851502771\"  frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '0000-00-00 00:00:00', '2018-09-14 07:02:22', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://plus.google.com/', 'https://www.pinterest.com/', 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 'Surf Wave', 'info@yourdomain.com', 'Surf Wave', 41, 3, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin fermentum condimentum mauris, non posuere urna consectetur quis. Suspendisse semper eu eros eget convallis. Etiam mattis blandit nulla, non venenatis risus varius vel. Morbi fringilla dignissim elit id blandit. Pellentesque vel luctus felis. Vestibulum eros nibh, consequat ut felis in, vehicula lobortis quam. Duis diam mauris, convallis in risus in, gravida hendrerit lacus. Donec euismod accumsan sem et aliquam. Duis a velit eget urna mattis ultricies. Aliquam nibh ipsum, aliquet nec sollicitudin non, fermentum nec diam. Vestibulum ac urna vehicula, dapibus dui quis, aliquet neque. Sed ac tristique purus. Vestibulum tempor, erat eu porta tempor, erat ipsum cursus dui, eu tempus mauris leo id mi. Sed ultrices sollicitudin vehicula. Proin in ullamcorper massa.', 'Your Location Address USA', 10, 'http://www.comapnydomain.com', '301-600', '2002', '33333333333', '+1234567890', 'surf-wave-1536855024-252.jpg', 231, 3920, 42679, 'surf-wave-4', 1, 1, 0, NULL, '$2y$10$Czj9jjs4ovh8zCmW4yH9mOfAyw7rPFZNBo1wLAH/dpWM7wh6Vtyke', '', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d8310.686427880151!2d-74.00585671025667!3d40.7098868133123!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2s!4v1536851502771\"  frameborder=\"0\" style=\"border:0\" allowfullscreen></iframe>', '0000-00-00 00:00:00', '2018-09-14 07:10:24', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://plus.google.com/', 'https://www.pinterest.com/', 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, NULL, 'mycompany@gmail.com', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 0, '-5', 0, 0, 0, NULL, '$2y$10$XU6au6/3jVG4lf9mjrb/hOQwbACumMlcGmLk/ql8O89SMZcMVzK4e', NULL, NULL, '2023-06-07 17:06:33', '2023-06-07 17:06:33', NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `company_messages`
--

CREATE TABLE `company_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `seeker_id` int(11) DEFAULT NULL,
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` enum('viewed','unviewed') NOT NULL DEFAULT 'unviewed',
  `type` enum('message','reply') DEFAULT 'message',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `company_messages`
--

INSERT INTO `company_messages` (`id`, `company_id`, `seeker_id`, `message`, `status`, `type`, `created_at`, `updated_at`) VALUES
(1, 1, 6, 'hi, there?', 'viewed', 'reply', '2019-05-29 01:41:30', '2020-10-20 13:20:12'),
(2, 1, 6, 'fghfh', 'viewed', 'reply', '2019-05-29 16:42:02', '2020-10-20 13:20:12'),
(3, 1, 6, 'fghfh', 'viewed', 'reply', '2019-05-29 16:42:04', '2020-10-20 13:20:12'),
(4, 1, 6, 'fghfh', 'viewed', 'reply', '2019-05-29 16:42:38', '2020-10-20 13:20:12'),
(5, 1, 6, 'fghfh', 'viewed', 'reply', '2019-05-29 16:46:03', '2020-10-20 13:20:12'),
(6, 1, 6, 'fghfh', 'viewed', 'reply', '2019-05-29 16:46:31', '2020-10-20 13:20:12'),
(7, 1, 6, 'fghfh', 'viewed', 'reply', '2019-05-29 16:47:10', '2020-10-20 13:20:12'),
(8, 1, 6, 'fghfh', 'viewed', 'reply', '2019-05-29 16:50:30', '2020-10-20 13:20:12'),
(9, 1, 6, 'fghfh', 'viewed', 'reply', '2019-05-29 17:47:40', '2020-10-20 13:20:12'),
(10, 1, 6, 'fghfh', 'viewed', 'reply', '2019-05-29 17:48:28', '2020-10-20 13:20:12'),
(11, 1, 5, 'hi', 'unviewed', 'message', '2019-05-29 18:18:06', '2019-05-29 18:18:06'),
(12, 1, 6, 'hi', 'viewed', 'reply', '2019-09-29 01:49:36', '2020-10-20 13:20:12'),
(13, 1, 5, 'hey', 'unviewed', 'reply', '2019-09-29 01:51:02', '2019-09-29 01:51:02'),
(14, 1, 6, 'hey', 'viewed', 'message', '2019-09-29 01:53:36', '2020-10-20 13:20:12'),
(15, 1, 6, 'yes', 'viewed', 'message', '2019-09-29 01:53:48', '2020-10-20 13:20:12'),
(16, 1, 5, 'hi how are you', 'unviewed', 'reply', '2019-09-29 01:54:56', '2019-09-29 01:54:56'),
(17, 1, 6, 'hi', 'viewed', 'message', '2019-09-29 01:56:26', '2020-10-20 13:20:12'),
(18, 1, 5, 'fine and you', 'unviewed', 'reply', '2019-09-29 01:57:06', '2019-09-29 01:57:06'),
(19, 1, 6, 'zbxvb', 'viewed', 'message', '2019-09-29 01:57:37', '2020-10-20 13:20:12'),
(20, 1, 6, 'hi', 'viewed', 'reply', '2019-09-29 01:58:47', '2020-10-20 13:20:12'),
(21, 1, 6, 'ajkldfjlaksdjf', 'viewed', 'message', '2019-09-29 01:59:02', '2020-10-20 13:20:12'),
(22, 1, 6, 'hi tajammal', 'viewed', 'message', '2019-09-29 06:27:32', '2020-10-20 13:20:12'),
(23, 1, 6, 'ye i am here', 'viewed', 'reply', '2019-09-29 06:28:32', '2020-10-20 13:20:12'),
(24, 1, 6, 'test', 'viewed', 'message', '2019-10-03 08:38:25', '2020-10-20 13:20:12'),
(25, 2, 6, 'testete', 'viewed', 'message', '2019-10-26 13:24:02', '2021-02-21 23:28:54'),
(26, 1, 6, 'this test message', 'viewed', 'message', '2019-10-26 13:36:59', '2020-10-20 13:20:12'),
(27, 1, 6, 'this is test reply', 'viewed', 'reply', '2019-10-26 13:38:03', '2020-10-20 13:20:12'),
(28, 1, 6, 'thanks for contacting us', 'viewed', 'reply', '2019-10-26 13:38:41', '2020-10-20 13:20:12'),
(29, 1, 6, 'good', 'viewed', 'reply', '2019-10-26 14:06:49', '2020-10-20 13:20:12'),
(30, 9, 6, 'this is test', 'viewed', 'reply', '2019-11-06 13:56:30', '2021-02-21 09:21:00'),
(31, 1, 6, 'Test', 'viewed', 'message', '2020-10-20 13:20:20', '2021-02-21 23:28:53'),
(32, 9, 6, 'hi how are you', 'viewed', 'reply', '2021-02-21 11:16:18', '2021-02-21 14:43:42'),
(33, 1, 6, 'Hello', 'viewed', 'message', '2021-02-22 15:29:46', '2021-02-22 15:29:56');

-- --------------------------------------------------------

--
-- Table structure for table `company_password_resets`
--

CREATE TABLE `company_password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `message_txt` mediumtext DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `full_name`, `email`, `phone`, `message_txt`, `subject`, `created_at`, `updated_at`) VALUES
(1, 'dsfsdf', 'toalamin007@gmail.com', '01712223265', 'test', 'this is my first email', '2023-06-04 07:17:42', '2023-06-04 07:17:42'),
(2, 'dsfsdf', 'toalamin007@gmail.com', '01712223265', 'teste', 'this is my first email', '2023-06-04 07:19:25', '2023-06-04 07:19:25'),
(3, 'alamin', 'toalamin007@gmail.com', '01712223265', 'dsfdsfd', 'this is my first email', '2023-06-04 18:23:41', '2023-06-04 18:23:41');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(10) UNSIGNED NOT NULL,
  `country_id` int(11) DEFAULT 0,
  `country` varchar(150) DEFAULT NULL,
  `nationality` varchar(150) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 0,
  `sort_order` int(11) DEFAULT 9999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_id`, `country`, `nationality`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'bangladesh', 'bangla', 1, 1, 1, 'en', '2023-05-20 11:18:57', '2023-05-20 11:18:57');

-- --------------------------------------------------------

--
-- Table structure for table `countries_details`
--

CREATE TABLE `countries_details` (
  `id` int(11) NOT NULL,
  `country_id` int(11) DEFAULT 0,
  `sort_name` varchar(5) NOT NULL,
  `phone_code` int(11) NOT NULL,
  `currency` varchar(60) DEFAULT NULL,
  `code` varchar(7) DEFAULT NULL,
  `symbol` varchar(7) DEFAULT NULL,
  `thousand_separator` varchar(2) DEFAULT NULL,
  `decimal_separator` varchar(2) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `countries_details`
--

INSERT INTO `countries_details` (`id`, `country_id`, `sort_name`, `phone_code`, `currency`, `code`, `symbol`, `thousand_separator`, `decimal_separator`, `created_at`, `updated_at`) VALUES
(1, 1, 'BD', 880, 'bd', '123', '$', NULL, NULL, '2023-05-20 17:34:40', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `currentVisas`
--

CREATE TABLE `currentVisas` (
  `id` int(11) NOT NULL,
  `eng_title` varchar(55) DEFAULT NULL,
  `jp_title` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `currentVisas`
--

INSERT INTO `currentVisas` (`id`, `eng_title`, `jp_title`) VALUES
(1, 'Student Visa', '留学'),
(2, 'Work Visa', '就労'),
(3, 'Permanent Resident', '定住者'),
(4, 'Spouse Visa', '配偶者'),
(5, 'Tourist Visa', '観光'),
(6, 'Technical Visa', '技術'),
(7, 'Cultural Activities Visa', '文化活動'),
(8, 'Short-Term Stay Visa', '短期滞在'),
(9, 'Investor/Business Manager Visa', '投資・経営'),
(10, 'Research Visa', '研究'),
(11, 'Religious Activities Visa', '宗教活動'),
(12, 'Medical Visa', '医療'),
(13, 'Preparatory Student Visa', '留学準備'),
(14, 'Dependent Visa', '家族滞在'),
(15, 'Specific Skills Visa', '特定技能'),
(16, 'Highly Skilled Professional Visa', '高度人材'),
(17, 'Technical Intern Training Visa', '技能実習'),
(18, 'International Exchange Visa', '国際交流'),
(19, 'Long-Term Resident', '永住者'),
(20, 'General Visa', '全般');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` int(11) NOT NULL,
  `eng_title` varchar(55) NOT NULL,
  `jp_title` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `days`
--

INSERT INTO `days` (`id`, `eng_title`, `jp_title`) VALUES
(1, '1st', '一日'),
(2, '2nd', '二日'),
(3, '3rd', '三日'),
(4, '4th', '四日'),
(5, '5th', '五日'),
(6, '6th', '六日'),
(7, '7th', '七日'),
(8, '8th', '八日'),
(9, '9th', '九日'),
(10, '10th', '十日'),
(11, '11th', '十一日'),
(12, '12th', '十二日'),
(13, '13th', '十三日'),
(14, '14th', '十四日'),
(15, '15th', '十五日'),
(16, '16th', '十六日'),
(17, '17th', '十七日'),
(18, '18th', '十八日'),
(19, '19th', '十九日'),
(20, '20th', '二十日'),
(21, '21st', '二十一日'),
(22, '22nd', '二十二日'),
(23, '23rd', '二十三日'),
(24, '24th', '二十四日'),
(25, '25th', '二十五日'),
(26, '26th', '二十六日'),
(27, '27th', '二十七日'),
(28, '28th', '二十八日'),
(29, '29th', '二十九日'),
(30, '30th', '三十日'),
(31, '31st', '三十一日');

-- --------------------------------------------------------

--
-- Table structure for table `degree_levels`
--

CREATE TABLE `degree_levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `degree_level_id` int(11) DEFAULT 0,
  `degree_level` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `degree_levels`
--

INSERT INTO `degree_levels` (`id`, `degree_level_id`, `degree_level`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Non-Matriculation', 1, 1, 1, 'en', '2018-06-09 17:06:46', NULL),
(2, 2, 'Matriculation/O-Level', 1, 1, 2, 'en', '2018-06-09 17:06:46', NULL),
(3, 3, 'Intermediate/A-Level', 1, 1, 3, 'en', '2018-06-09 17:06:46', NULL),
(4, 4, 'Bachelors', 1, 1, 4, 'en', '2018-06-09 17:06:46', NULL),
(5, 5, 'Masters', 1, 1, 5, 'en', '2018-06-09 17:06:46', NULL),
(6, 6, 'MPhil/MS', 1, 1, 6, 'en', '2018-06-09 17:06:46', NULL),
(7, 7, 'PHD/Doctorate', 1, 1, 7, 'en', '2018-06-09 17:06:46', NULL),
(8, 8, 'Certification', 1, 1, 8, 'en', '2018-06-09 17:06:46', NULL),
(9, 9, 'Diploma', 1, 1, 9, 'en', '2018-06-09 17:06:46', NULL),
(10, 10, 'Short Course', 1, 1, 10, 'en', '2018-06-09 17:06:46', '2018-06-09 14:26:54'),
(11, 1, 'No matriculación', 0, 1, 1, 'es', '2018-06-09 17:06:46', NULL),
(12, 2, 'Matriculación / O-Level', 0, 1, 2, 'es', '2018-06-09 17:06:46', NULL),
(13, 3, 'Intermedio / A-Level', 0, 1, 3, 'es', '2018-06-09 17:06:46', NULL),
(14, 4, 'Solteros', 0, 1, 4, 'es', '2018-06-09 17:06:46', NULL),
(15, 5, 'Masters', 0, 1, 5, 'es', '2018-06-09 17:06:46', NULL),
(16, 6, 'MPhil / MS', 0, 1, 6, 'es', '2018-06-09 17:06:46', NULL),
(17, 7, 'PHD / Doctorado', 0, 1, 7, 'es', '2018-06-09 17:06:46', NULL),
(18, 8, 'Proceso de dar un título', 0, 1, 8, 'es', '2018-06-09 17:06:46', NULL),
(19, 9, 'Diploma', 0, 1, 9, 'es', '2018-06-09 17:06:46', NULL),
(20, 10, 'Curso corto', 0, 1, 10, 'es', '2018-06-09 17:06:46', NULL),
(21, 1, 'غير شهادة الثانوية العامة', 0, 1, 1, 'ar', '2018-06-09 17:06:46', NULL),
(22, 2, 'شهادة الثانوية العامة / O المستوى', 0, 1, 2, 'ar', '2018-06-09 17:06:46', NULL),
(23, 3, 'متوسط ​​/ A-مستوى', 0, 1, 3, 'ar', '2018-06-09 17:06:46', NULL),
(24, 4, 'البكالوريوس', 0, 1, 4, 'ar', '2018-06-09 17:06:46', NULL),
(25, 5, 'سادة', 0, 1, 5, 'ar', '2018-06-09 17:06:46', NULL),
(26, 6, 'الماجستير / MS', 0, 1, 6, 'ar', '2018-06-09 17:06:46', NULL),
(27, 7, 'دكتوراه / دكتوراه', 0, 1, 7, 'ar', '2018-06-09 17:06:46', NULL),
(28, 8, 'شهادة', 0, 1, 8, 'ar', '2018-06-09 17:06:46', NULL),
(29, 9, 'شهادة دبلوم', 0, 1, 9, 'ar', '2018-06-09 17:06:47', NULL),
(30, 10, 'دورة قصيرة', 0, 1, 10, 'ar', '2018-06-09 17:06:47', NULL),
(31, 1, 'نان میٹرک', 0, 1, 1, 'ur', '2018-06-09 17:06:47', NULL),
(32, 2, 'میٹرک / O لیول', 0, 1, 2, 'ur', '2018-06-09 17:06:47', NULL),
(33, 3, 'انٹرمیڈیٹ / A لیول', 0, 1, 3, 'ur', '2018-06-09 17:06:47', NULL),
(34, 4, 'بیچلر', 0, 1, 4, 'ur', '2018-06-09 17:06:47', NULL),
(35, 5, 'ماسٹرز', 0, 1, 5, 'ur', '2018-06-09 17:06:47', NULL),
(36, 6, 'ایمیل / ایم ایس', 0, 1, 6, 'ur', '2018-06-09 17:06:47', NULL),
(37, 7, 'پی ایچ ڈی / ڈاکٹر', 0, 1, 7, 'ur', '2018-06-09 17:06:47', NULL),
(38, 8, 'سرٹیفیکیٹ', 0, 1, 8, 'ur', '2018-06-09 17:06:47', NULL),
(39, 9, 'ڈپلومہ', 0, 1, 9, 'ur', '2018-06-09 17:06:47', NULL),
(40, 10, 'مختصر کورس', 0, 1, 10, 'ur', '2018-06-09 17:06:47', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `degree_types`
--

CREATE TABLE `degree_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `degree_level_id` int(11) DEFAULT 0,
  `degree_type_id` int(11) DEFAULT 0,
  `degree_type` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `degree_types`
--

INSERT INTO `degree_types` (`id`, `degree_level_id`, `degree_type_id`, `degree_type`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Matric in Arts', 1, 1, 1, 'en', '2018-06-20 18:43:23', NULL),
(2, 2, 2, 'Matric in Science', 1, 1, 2, 'en', '2018-06-20 18:43:23', NULL),
(3, 2, 3, 'O-Levels', 1, 1, 3, 'en', '2018-06-20 18:43:23', NULL),
(4, 2, 1, 'Matric en Artes', 0, 1, 1, 'es', '2018-06-20 18:43:23', NULL),
(5, 2, 2, 'Matric en Ciencia', 0, 1, 2, 'es', '2018-06-20 18:43:23', NULL),
(6, 2, 3, 'O-Niveles', 0, 1, 3, 'es', '2018-06-20 18:43:23', NULL),
(7, 2, 1, 'میٹرک آرٹس', 0, 1, 1, 'ur', '2018-06-20 18:43:23', '2018-06-23 10:40:56'),
(8, 2, 2, 'سائنس میں میٹرک', 0, 1, 2, 'ur', '2018-06-20 18:43:23', '2018-06-23 10:40:56'),
(9, 2, 3, 'اے کی سطح', 0, 1, 3, 'ur', '2018-06-20 18:43:23', NULL),
(10, 2, 1, 'ماتريك في الفنون', 0, 1, 1, 'ar', '2018-06-20 18:43:23', NULL),
(11, 2, 2, 'Matric في العلوم', 0, 1, 2, 'ar', '2018-06-20 18:43:23', NULL),
(12, 2, 3, 'O-مستويات', 0, 1, 3, 'ar', '2018-06-20 18:43:23', NULL),
(13, 3, 13, 'A-Levels', 1, 1, 1, 'en', '2018-06-20 18:50:52', NULL),
(14, 3, 14, 'Faculty of Arts', 1, 1, 2, 'en', '2018-06-20 18:50:52', NULL),
(15, 3, 15, 'Faculty of Science (Pre-medical)', 1, 1, 3, 'en', '2018-06-20 18:50:52', NULL),
(16, 3, 16, 'Faculty of Science (Pre-Engineering)', 1, 1, 4, 'en', '2018-06-20 18:50:52', NULL),
(17, 3, 17, 'Intermediate in Computer Science', 1, 1, 5, 'en', '2018-06-20 18:50:52', NULL),
(18, 3, 18, 'Intermediate in Commerce', 1, 1, 6, 'en', '2018-06-20 18:50:52', NULL),
(19, 3, 19, 'Intermediate in General Science', 1, 1, 7, 'en', '2018-06-20 18:50:52', NULL),
(20, 3, 13, 'Niveles A', 0, 1, 1, 'es', '2018-06-20 18:50:52', NULL),
(21, 3, 14, 'Facultad de Artes', 0, 1, 2, 'es', '2018-06-20 18:50:52', NULL),
(22, 3, 15, 'Facultad de Ciencias (Pre-médica)', 0, 1, 3, 'es', '2018-06-20 18:50:52', NULL),
(23, 3, 16, 'Facultad de Ciencias (Pre-Ingeniería)', 0, 1, 4, 'es', '2018-06-20 18:50:52', NULL),
(24, 3, 17, 'Intermedio en Ciencias de la Computación', 0, 1, 5, 'es', '2018-06-20 18:50:52', NULL),
(25, 3, 18, 'Intermedio en Comercio', 0, 1, 6, 'es', '2018-06-20 18:50:52', NULL),
(26, 3, 19, 'Intermedio en Ciencias Generales', 0, 1, 7, 'es', '2018-06-20 18:50:52', NULL),
(27, 3, 13, 'على مستويات', 0, 1, 1, 'ar', '2018-06-20 18:50:52', NULL),
(28, 3, 14, 'كلية الفنون', 0, 1, 2, 'ar', '2018-06-20 18:50:52', NULL),
(29, 3, 15, 'كلية العلوم (ما قبل الطب)', 0, 1, 3, 'ar', '2018-06-20 18:50:52', NULL),
(30, 3, 16, 'كلية العلوم (ما قبل الهندسة)', 0, 1, 4, 'ar', '2018-06-20 18:50:52', NULL),
(31, 3, 17, 'وسيط في علوم الكمبيوتر', 0, 1, 5, 'ar', '2018-06-20 18:50:52', NULL),
(32, 3, 18, 'متوسط ​​في التجارة', 0, 1, 6, 'ar', '2018-06-20 18:50:52', NULL),
(33, 3, 19, 'وسيط في العلوم العامة', 0, 1, 7, 'ar', '2018-06-20 18:50:52', NULL),
(34, 3, 13, 'A-Level', 0, 1, 1, 'ur', '2018-06-20 18:50:52', NULL),
(35, 3, 14, 'شعبہءفنون', 0, 1, 2, 'ur', '2018-06-20 18:50:52', NULL),
(36, 3, 15, 'سائنس فیکلٹی (پری میڈیکل)', 0, 1, 3, 'ur', '2018-06-20 18:50:52', NULL),
(37, 3, 16, 'سائنس فیکلٹی (پری انجینئرنگ)', 0, 1, 4, 'ur', '2018-06-20 18:50:52', NULL),
(38, 3, 17, 'انٹرمیڈیٹ کمپیوٹر سائنس میں', 0, 1, 5, 'ur', '2018-06-20 18:50:52', NULL),
(39, 3, 18, 'انٹرمیڈیٹ میں کامرس', 0, 1, 6, 'ur', '2018-06-20 18:50:52', NULL),
(40, 3, 19, 'عام سائنس میں انٹرمیڈیٹ', 0, 1, 7, 'ur', '2018-06-20 18:50:52', NULL),
(41, 4, 41, 'Bachelors in Arts', 1, 1, 1, 'en', '2018-06-20 19:04:54', NULL),
(42, 4, 42, 'Bachelors in Architecture', 1, 1, 2, 'en', '2018-06-20 19:04:54', NULL),
(43, 4, 43, 'Bachelors in Business Administration', 1, 1, 3, 'en', '2018-06-20 19:04:54', NULL),
(44, 4, 44, 'Bachelors in Commerce', 1, 1, 4, 'en', '2018-06-20 19:04:54', NULL),
(45, 4, 45, 'Bachelors of Dental Surgery', 1, 1, 5, 'en', '2018-06-20 19:04:54', NULL),
(46, 4, 46, 'Bachelors of Education', 1, 1, 6, 'en', '2018-06-20 19:04:54', NULL),
(47, 4, 47, 'Bachelors in Engineering', 1, 1, 7, 'en', '2018-06-20 19:04:54', NULL),
(48, 4, 48, 'Bachelors in Pharmacy', 1, 1, 8, 'en', '2018-06-20 19:04:54', NULL),
(49, 4, 49, 'Bachelors in Science', 1, 1, 9, 'en', '2018-06-20 19:04:54', NULL),
(50, 4, 50, 'Bachelors of Science in Nursing (Registered Nursing)', 1, 1, 10, 'en', '2018-06-20 19:04:54', NULL),
(51, 4, 51, 'Bachelors in Law', 1, 1, 11, 'en', '2018-06-20 19:04:54', NULL),
(52, 4, 52, 'Bachelors in Technology', 1, 1, 12, 'en', '2018-06-20 19:04:54', NULL),
(53, 4, 53, 'BCS/BS', 1, 1, 13, 'en', '2018-06-20 19:04:54', NULL),
(54, 4, 54, 'Doctor of Veterinary Medicine', 1, 1, 14, 'en', '2018-06-20 19:04:54', NULL),
(55, 4, 55, 'MBBS', 1, 1, 15, 'en', '2018-06-20 19:04:54', NULL),
(56, 4, 56, 'Post Registered Nursing B.S.', 1, 1, 16, 'en', '2018-06-20 19:04:54', NULL),
(57, 4, 41, 'Licenciatura en Artes', 0, 1, 1, 'es', '2018-06-20 19:04:54', NULL),
(58, 4, 42, 'Licenciatura en Arquitectura', 0, 1, 2, 'es', '2018-06-20 19:04:54', NULL),
(59, 4, 43, 'Licenciatura en Administración de Empresas', 0, 1, 3, 'es', '2018-06-20 19:04:54', NULL),
(60, 4, 44, 'Licenciatura en Comercio', 0, 1, 4, 'es', '2018-06-20 19:04:54', NULL),
(61, 4, 45, 'Licenciatura en Cirugía Dental', 0, 1, 5, 'es', '2018-06-20 19:04:54', NULL),
(62, 4, 46, 'Licenciatura en Educación', 0, 1, 6, 'es', '2018-06-20 19:04:54', NULL),
(63, 4, 47, 'Licenciatura en Ingeniería', 0, 1, 7, 'es', '2018-06-20 19:04:54', NULL),
(64, 4, 48, 'Licenciatura en Farmacia', 0, 1, 8, 'es', '2018-06-20 19:04:54', NULL),
(65, 4, 49, 'Licenciatura en Ciencias', 0, 1, 9, 'es', '2018-06-20 19:04:54', NULL),
(66, 4, 50, 'Licenciatura en Ciencias en Enfermería (Enfermería Registrada)', 0, 1, 10, 'es', '2018-06-20 19:04:54', NULL),
(67, 4, 51, 'Licenciatura en Derecho', 0, 1, 11, 'es', '2018-06-20 19:04:54', NULL),
(68, 4, 52, 'Licenciatura en Tecnología', 0, 1, 12, 'es', '2018-06-20 19:04:54', NULL),
(69, 4, 53, 'BCS / BS', 0, 1, 13, 'es', '2018-06-20 19:04:54', NULL),
(70, 4, 54, 'Doctor en Medicina Veterinaria', 0, 1, 14, 'es', '2018-06-20 19:04:54', NULL),
(71, 4, 55, 'MBBS', 0, 1, 15, 'es', '2018-06-20 19:04:54', NULL),
(72, 4, 56, 'Enfermería Post Registrada B.S.', 0, 1, 16, 'es', '2018-06-20 19:04:54', NULL),
(73, 4, 41, 'البكالوريوس في الآداب', 0, 1, 1, 'ar', '2018-06-20 19:04:54', NULL),
(74, 4, 42, 'البكالوريوس في العمارة', 0, 1, 2, 'ar', '2018-06-20 19:04:54', NULL),
(75, 4, 43, 'البكالوريوس في إدارة الأعمال', 0, 1, 3, 'ar', '2018-06-20 19:04:54', NULL),
(76, 4, 44, 'البكالوريوس في التجارة', 0, 1, 4, 'ar', '2018-06-20 19:04:54', NULL),
(77, 4, 45, 'البكالوريوس في جراحة الأسنان', 0, 1, 5, 'ar', '2018-06-20 19:04:54', NULL),
(78, 4, 46, 'البكالوريوس في التربية', 0, 1, 6, 'ar', '2018-06-20 19:04:54', NULL),
(79, 4, 47, 'البكالوريوس في الهندسة', 0, 1, 7, 'ar', '2018-06-20 19:04:54', NULL),
(80, 4, 48, 'البكالوريوس في الصيدلة', 0, 1, 8, 'ar', '2018-06-20 19:04:54', NULL),
(81, 4, 49, 'البكالوريوس في العلوم', 0, 1, 9, 'ar', '2018-06-20 19:04:54', NULL),
(82, 4, 50, 'بكالوريوس العلوم في التمريض (التمريض المسجل)', 0, 1, 10, 'ar', '2018-06-20 19:04:54', NULL),
(83, 4, 51, 'البكالوريوس في القانون', 0, 1, 11, 'ar', '2018-06-20 19:04:54', NULL),
(84, 4, 52, 'البكالوريوس في التكنولوجيا', 0, 1, 12, 'ar', '2018-06-20 19:04:54', NULL),
(85, 4, 53, 'BCS / BS', 0, 1, 13, 'ar', '2018-06-20 19:04:54', NULL),
(86, 4, 54, 'طبيب الطب البيطري', 0, 1, 14, 'ar', '2018-06-20 19:04:54', NULL),
(87, 4, 55, 'MBBS', 0, 1, 15, 'ar', '2018-06-20 19:04:54', NULL),
(88, 4, 56, 'نشر التمريض المسجل ب.', 0, 1, 16, 'ar', '2018-06-20 19:04:54', NULL),
(89, 4, 41, 'آرٹس میں بیچلر', 0, 1, 1, 'ur', '2018-06-20 19:04:54', NULL),
(90, 4, 42, 'آرکیٹیکچرل میں بیچلر', 0, 1, 2, 'ur', '2018-06-20 19:04:54', NULL),
(91, 4, 43, 'بزنس ایڈمنسٹریشن میں بیچلر', 0, 1, 3, 'ur', '2018-06-20 19:04:54', NULL),
(92, 4, 44, 'کامرس میں بیچلر', 0, 1, 4, 'ur', '2018-06-20 19:04:54', NULL),
(93, 4, 45, 'ڈینٹل سرجری کے بیچلر', 0, 1, 5, 'ur', '2018-06-20 19:04:54', NULL),
(94, 4, 46, 'تعلیم کے بیچلر', 0, 1, 6, 'ur', '2018-06-20 19:04:54', NULL),
(95, 4, 47, 'انجینئرنگ میں بیچلر', 0, 1, 7, 'ur', '2018-06-20 19:04:54', NULL),
(96, 4, 48, 'فارمیسی میں بیچلر', 0, 1, 8, 'ur', '2018-06-20 19:04:54', NULL),
(97, 4, 49, 'سائنس میں بیچلر', 0, 1, 9, 'ur', '2018-06-20 19:04:54', NULL),
(98, 4, 50, 'نرسنگ میں سائنس بیچلر (رجسٹرڈ نرسنگ)', 0, 1, 10, 'ur', '2018-06-20 19:04:54', NULL),
(99, 4, 51, 'قانون میں بیچلر', 0, 1, 11, 'ur', '2018-06-20 19:04:54', NULL),
(100, 4, 52, 'ٹیکنالوجی میں بیچلر', 0, 1, 12, 'ur', '2018-06-20 19:04:54', NULL),
(101, 4, 53, 'BCS / BS', 0, 1, 13, 'ur', '2018-06-20 19:04:54', NULL),
(102, 4, 54, 'ڈاکٹر آف ویٹرنری میڈیسن', 0, 1, 14, 'ur', '2018-06-20 19:04:54', NULL),
(103, 4, 55, 'MBBS', 0, 1, 15, 'ur', '2018-06-20 19:04:54', NULL),
(104, 4, 56, 'پوسٹ رجسٹرڈ نرسنگ بی.', 0, 1, 16, 'ur', '2018-06-20 19:04:54', NULL),
(105, 5, 105, 'Masters in Arts', 1, 1, 1, 'en', '2018-06-20 19:16:09', NULL),
(106, 5, 106, 'Masters in Business Administration', 1, 1, 2, 'en', '2018-06-20 19:16:09', NULL),
(107, 5, 107, 'Masters in Commerce', 1, 1, 3, 'en', '2018-06-20 19:16:09', NULL),
(108, 5, 108, 'Masters of Education', 1, 1, 4, 'en', '2018-06-20 19:16:09', NULL),
(109, 5, 109, 'Masters in Law', 1, 1, 5, 'en', '2018-06-20 19:16:09', NULL),
(110, 5, 110, 'Masters in Science', 1, 1, 6, 'en', '2018-06-20 19:16:09', NULL),
(111, 5, 111, 'Executive Masters in Business Administration', 1, 1, 7, 'en', '2018-06-20 19:16:09', NULL),
(112, 5, 105, 'Maestría en Artes', 0, 1, 1, 'es', '2018-06-20 19:16:09', NULL),
(113, 5, 106, 'Maestría en Administración de Empresas', 0, 1, 2, 'es', '2018-06-20 19:16:09', NULL),
(114, 5, 107, 'Maestros en Comercio', 0, 1, 3, 'es', '2018-06-20 19:16:09', NULL),
(115, 5, 108, 'Maestros de educación', 0, 1, 4, 'es', '2018-06-20 19:16:09', NULL),
(116, 5, 109, 'Maestría en Derecho', 0, 1, 5, 'es', '2018-06-20 19:16:09', NULL),
(117, 5, 110, 'Maestría en Ciencias', 0, 1, 6, 'es', '2018-06-20 19:16:09', NULL),
(118, 5, 111, 'Maestría Ejecutiva en Administración de Empresas', 0, 1, 7, 'es', '2018-06-20 19:16:09', NULL),
(119, 5, 105, 'الماجستير في الآداب', 0, 1, 1, 'ar', '2018-06-20 19:16:09', NULL),
(120, 5, 106, 'درجة الماجستير في إدارة الأعمال', 0, 1, 2, 'ar', '2018-06-20 19:16:09', NULL),
(121, 5, 107, 'الماجستير في التجارة', 0, 1, 3, 'ar', '2018-06-20 19:16:09', NULL),
(122, 5, 108, 'سادة التربية', 0, 1, 4, 'ar', '2018-06-20 19:16:09', NULL),
(123, 5, 109, 'الماجستير في القانون', 0, 1, 5, 'ar', '2018-06-20 19:16:09', NULL),
(124, 5, 110, 'درجة الماجستير في العلوم', 0, 1, 6, 'ar', '2018-06-20 19:16:09', NULL),
(125, 5, 111, 'الماجستير التنفيذي في إدارة الأعمال', 0, 1, 7, 'ar', '2018-06-20 19:16:09', NULL),
(126, 5, 105, 'آرٹس میں ماسٹر', 0, 1, 1, 'ur', '2018-06-20 19:16:09', NULL),
(127, 5, 106, 'بزنس ایڈمنسٹریشن میں ماسٹرز', 0, 1, 2, 'ur', '2018-06-20 19:16:09', NULL),
(128, 5, 107, 'ماسٹررس آف کامرس', 0, 1, 3, 'ur', '2018-06-20 19:16:09', NULL),
(129, 5, 108, 'تعلیم کے ماسٹرز', 0, 1, 4, 'ur', '2018-06-20 19:16:09', NULL),
(130, 5, 109, 'قانون میں ماسٹرز', 0, 1, 5, 'ur', '2018-06-20 19:16:09', NULL),
(131, 5, 110, 'سائنس میں ماسٹرز', 0, 1, 6, 'ur', '2018-06-20 19:16:09', NULL),
(132, 5, 111, 'بزنس ایڈمنسٹریشن میں ایگزیکٹو ماسٹرز', 0, 1, 7, 'ur', '2018-06-20 19:16:09', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faqcategories`
--

CREATE TABLE `faqcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `lan` varchar(50) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `faqcategories`
--

INSERT INTO `faqcategories` (`id`, `category_name`, `image`, `lan`, `created_at`, `updated_at`) VALUES
(1, 'ABC FAQ', '1683132097.png', '英語', '2023-05-01 22:18:24', '2023-06-08 17:24:19'),
(2, 'host', '1683132088.jpg', 'عربى', '2023-05-01 23:35:39', '2023-05-03 10:41:28'),
(3, 'hello2', '1683132078.png', 'Albanian', '2023-05-03 10:36:32', '2023-05-03 10:41:18');

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `faq_question` mediumtext DEFAULT NULL,
  `faq_answer` mediumtext DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `faqs`
--

INSERT INTO `faqs` (`id`, `category_id`, `faq_question`, `faq_answer`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, '無料転職サポートを利用したいのですが、どのようにすればよいですか?', '<p>JAC Recruitment、当社ホームページの<a href=\"https://www.jac-recruitment.jp/entry/\">登録フォーム</a>より、ご登録をお願い致します。<br />インターネット環境が無い方は、郵送で下記をお送りいただければ登録手続きをさせて頂きます。<br />日本語の履歴書・職務経歴書<br />別紙にて、①希望勤務地②現在年収③希望年収<br />お送り頂く際は必ずご連絡先(携帯電話番号、携帯メールアドレス)をご記入ください。<br />また、当社ではサポート期間中、パソコンのメールアドレス宛にご連絡をとらせていただいております<br />その為、インターネット環境がない場合、当社とのやりとりにご不便、ご迷惑をおかけする場合もございますので、予めご了承くださいませ。</p>\r\n<ul class=\"list_no\">\r\n<li>宛先: <em>〒101-0051東京都千代田区神田神保町1-105神保町三井ビルディング14階<br />JAC Recruitment ビジネスサポートチーム宛</em></li>\r\n</ul>\r\n<p>登録手続き完了後は当社よりご連絡致します。<br /><small>※なお、お預かりした書類は返却いたしません。厳重に管理をしており、登録削除時に破棄いたします。</small><br /><a href=\"https://www.jac-recruitment.jp/privacy\">当社の個人情報に関する規約はこちら</a></p>', 1, 'en', '2018-03-31 00:56:52', '2023-04-07 09:08:47'),
(2, 1, 'یہ میرا پہلا پہلا سوال ہے', 'یہ میرا پہلا سوال کا جواب ہے', 2, 'ur', '2018-03-31 00:58:24', '2018-03-31 01:01:34'),
(5, 0, '電話で登録することはできますか?', 'お電話にてのご登録は受け付けておりませんので、登録をお考えの方は、当社ホームページの<a href=\"https://www.jac-recruitment.jp/entry/\">登録フォーム</a>より、ご登録をお願い致します。', 5, 'en', '2023-04-07 09:05:49', '2023-04-07 09:09:15'),
(6, 0, '登録後の流れを教えてください。', '当社に会員登録後に、ご経験やご希望を拝見し、すぐにご提案できる求人があった場合にコンサルタントとの面談をご用意しております。', 6, 'en', '2023-04-07 09:09:41', '2023-04-07 09:09:41'),
(7, 0, '転職支援サービスを受けるにあたって年齢制限はありますか?', '年齢に関わらずご登録は頂けます。ただし、企業から依頼される求人の大半が同職種や同業界での年齢に応じた年数の実務経験を要する案件となります。<br />その為ご登録後、就業経験によってはすぐにご紹介求人案件をご用意できない可能性がございます。予めご了承ください。', 7, 'en', '2023-04-07 09:10:10', '2023-04-07 09:10:10'),
(8, 0, 'ご経験を活かせる求人の有無を確認させていただくため、ご登録後1週間程度お時間をいただいております。', 'JAC Recruitment転職支援サービス登録完了後、どれくらいで連絡がきますか?', 8, 'en', '2023-04-07 09:10:46', '2023-04-07 09:10:46'),
(9, 2, '登録後、「現時点ではすぐに紹介できる求人がない」旨の案内(メール)が届きました。これでサービスは終了になるのでしょうか?', '上記ご連絡後も当社にて都度ご紹介の有無を確認しております。ご案内の後に求人動向が変化し、当社にてご紹介できる求人を獲得できた際には、改めて当社よりご連絡いたします。', 9, 'en', '2023-04-07 09:11:06', '2023-04-07 09:11:06'),
(10, 2, 'sdfsadf', 'asdfsdf', 10, 'en', '2023-05-01 22:35:35', '2023-05-01 23:35:55'),
(11, 2, 'test', 'test', 11, 'ja', '2023-06-08 17:25:16', '2023-06-08 17:25:16');

-- --------------------------------------------------------

--
-- Table structure for table `favourites_company`
--

CREATE TABLE `favourites_company` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `company_slug` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `favourites_company`
--

INSERT INTO `favourites_company` (`id`, `user_id`, `company_slug`, `created_at`, `updated_at`) VALUES
(16, 2, 'php-developer-required-1', '2018-07-31 18:49:07', '2018-07-31 18:49:07'),
(18, 2, 'ismail-industries-limited-16', '2018-08-01 17:42:52', '2018-08-01 17:42:52'),
(19, 2, 'pepsico-pakistan-pvt-limited-7', '2018-08-29 09:42:55', '2018-08-29 09:42:55'),
(20, 5, 'netsol-technologies-pvt-limited-8', '2018-08-29 19:16:59', '2018-08-29 19:16:59'),
(21, 6, 'power-color-1', '2023-06-05 18:11:01', '2023-06-05 18:11:01');

-- --------------------------------------------------------

--
-- Table structure for table `favourites_job`
--

CREATE TABLE `favourites_job` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `job_slug` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `favourites_job`
--

INSERT INTO `favourites_job` (`id`, `user_id`, `job_slug`, `created_at`, `updated_at`) VALUES
(16, 2, 'php-developer-required-1', '2018-07-31 18:49:07', '2018-07-31 18:49:07'),
(17, 5, 'laravel-developer-5', '2018-08-29 09:30:40', '2018-08-29 09:30:40'),
(18, 5, 'php-developer-required-7', '2018-08-29 09:34:21', '2018-08-29 09:34:21'),
(19, 2, 'sales-person-3', '2018-08-29 09:44:34', '2018-08-29 09:44:34');

-- --------------------------------------------------------

--
-- Table structure for table `favourite_applicants`
--

CREATE TABLE `favourite_applicants` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `company_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `favourite_applicants`
--

INSERT INTO `favourite_applicants` (`id`, `user_id`, `job_id`, `company_id`, `status`, `created_at`, `updated_at`) VALUES
(23, 2, 16, 16, NULL, '2018-08-18 23:07:21', '2018-08-18 23:07:21'),
(25, 5, 18, 2, NULL, '2018-09-14 20:22:23', '2018-09-14 20:22:23'),
(26, 5, 2, 2, NULL, '2018-09-17 22:04:07', '2018-09-17 22:04:07'),
(27, 6, 25, 9, NULL, '2021-02-21 10:27:51', '2021-02-21 10:27:51'),
(29, 6, 2, 9, 'hired', '2021-08-10 05:13:54', '2021-08-11 11:32:19');

-- --------------------------------------------------------

--
-- Table structure for table `featureds`
--

CREATE TABLE `featureds` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `institute` int(11) NOT NULL,
  `name` varchar(120) NOT NULL,
  `logo` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `featureds`
--

INSERT INTO `featureds` (`id`, `institute`, `name`, `logo`, `created_at`, `updated_at`) VALUES
(1, 1, 'TOYOTA', '1685841956.jpg', '2023-06-04 05:25:56', '2023-06-04 05:25:56'),
(2, 2, 'KOBE FOREIGN INTERNATIONAL SCHOOL', '1685841980.jpg', '2023-06-04 05:26:20', '2023-06-04 05:26:20'),
(3, 3, 'KOBE DIPLOMA COLLAGE', '1685842006.jpg', '2023-06-04 05:26:46', '2023-06-04 05:26:46');

-- --------------------------------------------------------

--
-- Table structure for table `functional_areas`
--

CREATE TABLE `functional_areas` (
  `id` int(10) UNSIGNED NOT NULL,
  `functional_area_id` int(11) DEFAULT 0,
  `functional_area` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `functional_areas`
--

INSERT INTO `functional_areas` (`id`, `functional_area_id`, `functional_area`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Accountant', 1, 1, 1, 'en', '2018-04-03 12:17:25', '2018-04-08 16:38:01'),
(2, 2, 'Accounts, Finance & Financial Services', 1, 1, 2, 'en', '2018-04-03 12:21:35', '2018-04-08 16:38:01'),
(3, 3, 'Admin', 1, 1, 3, 'en', '2018-04-03 12:22:17', '2018-04-06 00:06:34'),
(4, 4, 'Admin Operation', 1, 1, 4, 'en', '2018-04-03 12:23:42', '2018-04-06 00:06:21'),
(5, 5, 'Administration', 1, 1, 5, 'en', '2018-04-03 12:24:24', '2018-04-06 00:06:31'),
(6, 6, 'Administration Clerical', 1, 1, 6, 'en', '2018-04-03 12:24:37', '2018-04-06 00:06:34'),
(7, 7, 'Advertising', 1, 1, 7, 'en', '2018-04-03 12:25:18', '2018-04-06 00:06:08'),
(8, 8, 'Advertising', 1, 1, 8, 'en', '2018-04-03 12:25:35', '2018-04-06 00:06:34'),
(9, 9, 'Advertisment', 1, 1, 9, 'en', '2018-04-03 12:26:09', '2018-04-06 00:06:34'),
(10, 10, 'Architects & Construction', 1, 1, 10, 'en', '2018-04-03 12:26:28', '2018-04-06 00:06:15'),
(11, 11, 'Architecture', 1, 1, 11, 'en', '2018-04-03 12:27:57', '2018-04-06 00:08:13'),
(12, 12, 'Bank Operation', 1, 1, 12, 'en', '2018-04-03 12:28:25', '2018-04-06 00:08:13'),
(13, 13, 'Business Development', 1, 1, 13, 'en', '2018-04-03 12:28:55', '2018-04-06 00:08:29'),
(14, 14, 'Business Management', 1, 1, 14, 'en', '2018-04-03 12:29:16', '2018-04-06 00:08:13'),
(15, 15, 'Business Systems Analyst', 1, 1, 15, 'en', '2018-04-03 12:29:45', '2018-04-06 00:08:04'),
(16, 16, 'Clerical', 1, 1, 16, 'en', '2018-04-03 12:30:15', '2018-04-06 00:08:29'),
(17, 17, 'Client Services & Customer Support', 1, 1, 17, 'en', '2018-04-03 12:30:40', '2018-04-06 00:07:51'),
(18, 18, 'Computer Hardware', 1, 1, 18, 'en', '2018-04-03 12:31:05', '2018-04-06 00:08:29'),
(19, 19, 'Computer Networking', 1, 1, 19, 'en', '2018-04-03 12:31:25', '2018-04-06 00:07:31'),
(20, 20, 'Consultant', 1, 1, 20, 'en', '2018-04-03 12:31:53', '2018-04-06 00:07:45'),
(21, 21, 'Content Writer', 1, 1, 21, 'en', '2018-04-03 12:32:22', '2018-04-06 00:07:45'),
(22, 22, 'Corporate Affairs', 1, 1, 22, 'en', '2018-04-06 21:30:59', NULL),
(23, 23, 'Creative Design', 1, 1, 23, 'en', '2018-04-06 21:30:59', NULL),
(24, 24, 'Creative Writer', 1, 1, 24, 'en', '2018-04-06 21:30:59', NULL),
(25, 25, 'Customer Support', 1, 1, 25, 'en', '2018-04-06 21:30:59', NULL),
(26, 26, 'Data Entry', 1, 1, 26, 'en', '2018-04-06 21:30:59', NULL),
(27, 27, 'Data Entry Operator', 1, 1, 27, 'en', '2018-04-06 21:30:59', NULL),
(28, 28, 'Database Administration (DBA)', 1, 1, 28, 'en', '2018-04-06 21:30:59', NULL),
(29, 29, 'Development', 1, 1, 29, 'en', '2018-04-06 21:30:59', NULL),
(30, 30, 'Distribution & Logistics', 1, 1, 30, 'en', '2018-04-06 21:30:59', NULL),
(31, 31, 'Education & Training', 1, 1, 31, 'en', '2018-04-06 21:30:59', NULL),
(32, 32, 'Electronics Technician', 1, 1, 32, 'en', '2018-04-06 21:30:59', NULL),
(33, 33, 'Engineering', 1, 1, 33, 'en', '2018-04-06 21:31:00', NULL),
(34, 34, 'Engineering Construction', 1, 1, 34, 'en', '2018-04-06 21:31:00', NULL),
(35, 35, 'Executive Management', 1, 1, 35, 'en', '2018-04-06 21:31:00', NULL),
(36, 36, 'Executive Secretary', 1, 1, 36, 'en', '2018-04-06 21:31:00', NULL),
(37, 37, 'Field Operations', 1, 1, 37, 'en', '2018-04-06 21:31:00', NULL),
(38, 38, 'Front Desk Clerk', 1, 1, 38, 'en', '2018-04-06 21:31:00', NULL),
(39, 39, 'Front Desk Officer', 1, 1, 39, 'en', '2018-04-06 21:31:00', NULL),
(40, 40, 'Graphic Design', 1, 1, 40, 'en', '2018-04-06 21:31:00', NULL),
(41, 41, 'Hardware', 1, 1, 41, 'en', '2018-04-06 21:31:00', NULL),
(42, 42, 'Health & Medicine', 1, 1, 42, 'en', '2018-04-06 21:31:00', NULL),
(43, 43, 'Health & Safety', 1, 1, 43, 'en', '2018-04-06 21:31:00', NULL),
(44, 44, 'Health Care', 1, 1, 44, 'en', '2018-04-06 21:31:00', NULL),
(45, 45, 'Health Related', 1, 1, 45, 'en', '2018-04-06 21:31:00', NULL),
(46, 46, 'Hotel Management', 1, 1, 46, 'en', '2018-04-06 21:31:00', NULL),
(47, 47, 'Hotel/Restaurant Management', 1, 1, 47, 'en', '2018-04-06 21:31:00', NULL),
(48, 48, 'HR', 1, 1, 48, 'en', '2018-04-06 21:31:00', NULL),
(49, 49, 'Human Resources', 1, 1, 49, 'en', '2018-04-06 21:31:00', NULL),
(50, 50, 'Import & Export', 1, 1, 50, 'en', '2018-04-06 21:31:00', NULL),
(51, 51, 'Industrial Production', 1, 1, 51, 'en', '2018-04-06 21:31:00', NULL),
(52, 52, 'Installation & Repair', 1, 1, 52, 'en', '2018-04-06 21:31:00', NULL),
(53, 53, 'Interior Designers & Architects', 1, 1, 53, 'en', '2018-04-06 21:31:00', NULL),
(54, 54, 'Intern', 1, 1, 54, 'en', '2018-04-06 21:31:00', NULL),
(55, 55, 'Internship', 1, 1, 55, 'en', '2018-04-06 21:31:00', NULL),
(56, 56, 'Investment Operations', 1, 1, 56, 'en', '2018-04-06 21:31:00', NULL),
(57, 57, 'IT Security', 1, 1, 57, 'en', '2018-04-06 21:31:00', NULL),
(58, 58, 'IT Systems Analyst', 1, 1, 58, 'en', '2018-04-06 21:31:00', NULL),
(59, 59, 'Legal & Corporate Affairs', 1, 1, 59, 'en', '2018-04-06 21:31:00', NULL),
(60, 60, 'Legal Affairs', 1, 1, 60, 'en', '2018-04-06 21:31:00', NULL),
(61, 61, 'Legal Research', 1, 1, 61, 'en', '2018-04-06 21:31:00', NULL),
(62, 62, 'Logistics & Warehousing', 1, 1, 62, 'en', '2018-04-06 21:31:00', NULL),
(63, 63, 'Maintenance/Repair', 1, 1, 63, 'en', '2018-04-06 21:31:00', NULL),
(64, 64, 'Management Consulting', 1, 1, 64, 'en', '2018-04-06 21:31:00', NULL),
(65, 65, 'Management Information System (MIS)', 1, 1, 65, 'en', '2018-04-06 21:31:00', NULL),
(66, 66, 'Managerial', 1, 1, 66, 'en', '2018-04-06 21:31:00', NULL),
(67, 67, 'Manufacturing', 1, 1, 67, 'en', '2018-04-06 21:31:00', NULL),
(68, 68, 'Manufacturing & Operations', 1, 1, 68, 'en', '2018-04-06 21:31:00', NULL),
(69, 69, 'Marketing', 1, 1, 69, 'en', '2018-04-06 21:31:00', NULL),
(70, 70, 'Marketing', 1, 1, 70, 'en', '2018-04-06 21:31:00', NULL),
(71, 71, 'Media - Print & Electronic', 1, 1, 71, 'en', '2018-04-06 21:31:00', NULL),
(72, 72, 'Media & Advertising', 1, 1, 72, 'en', '2018-04-06 21:31:00', NULL),
(73, 73, 'Medical', 1, 1, 73, 'en', '2018-04-06 21:31:00', NULL),
(74, 74, 'Medicine', 1, 1, 74, 'en', '2018-04-06 21:31:00', NULL),
(75, 75, 'Merchandising', 1, 1, 75, 'en', '2018-04-06 21:31:00', NULL),
(76, 76, 'Merchandising & Product Management', 1, 1, 76, 'en', '2018-04-06 21:31:00', NULL),
(77, 77, 'Monitoring & Evaluation (M&E)', 1, 1, 77, 'en', '2018-04-06 21:31:00', NULL),
(78, 78, 'Network Administration', 1, 1, 78, 'en', '2018-04-06 21:31:00', NULL),
(79, 79, 'Network Operation', 1, 1, 79, 'en', '2018-04-06 21:31:00', NULL),
(80, 80, 'Online Advertising', 1, 1, 80, 'en', '2018-04-06 21:31:00', NULL),
(81, 81, 'Online Marketing', 1, 1, 81, 'en', '2018-04-06 21:31:00', NULL),
(82, 82, 'Operations', 1, 1, 82, 'en', '2018-04-06 21:31:00', NULL),
(83, 83, 'Planning', 1, 1, 83, 'en', '2018-04-06 21:31:00', NULL),
(84, 84, 'Planning & Development', 1, 1, 84, 'en', '2018-04-06 21:31:00', NULL),
(85, 85, 'PR', 1, 1, 85, 'en', '2018-04-06 21:31:00', NULL),
(86, 86, 'Print Media', 1, 1, 86, 'en', '2018-04-06 21:31:00', NULL),
(87, 87, 'Printing', 1, 1, 87, 'en', '2018-04-06 21:31:00', NULL),
(88, 88, 'Procurement', 1, 1, 88, 'en', '2018-04-06 21:31:00', NULL),
(89, 89, 'Product Developer', 1, 1, 89, 'en', '2018-04-06 21:31:00', NULL),
(90, 90, 'Product Development', 1, 1, 90, 'en', '2018-04-06 21:31:00', NULL),
(91, 91, 'Product Development', 1, 1, 91, 'en', '2018-04-06 21:31:00', NULL),
(92, 92, 'Product Management', 1, 1, 92, 'en', '2018-04-06 21:31:00', NULL),
(93, 93, 'Production', 1, 1, 93, 'en', '2018-04-06 21:31:00', NULL),
(94, 94, 'Production & Quality Control', 1, 1, 94, 'en', '2018-04-06 21:31:00', NULL),
(95, 95, 'Project Management', 1, 1, 95, 'en', '2018-04-06 21:31:00', NULL),
(96, 96, 'Project Management Consultant', 1, 1, 96, 'en', '2018-04-06 21:31:00', NULL),
(97, 97, 'Public Relations', 1, 1, 97, 'en', '2018-04-06 21:31:00', NULL),
(98, 98, 'QA', 1, 1, 98, 'en', '2018-04-06 21:31:00', NULL),
(99, 99, 'QC', 1, 1, 99, 'en', '2018-04-06 21:31:00', NULL),
(100, 100, 'Qualitative Research', 1, 1, 100, 'en', '2018-04-06 21:31:00', NULL),
(101, 101, 'Quality Assurance (QA)', 1, 1, 101, 'en', '2018-04-06 21:31:00', NULL),
(102, 102, 'Quality Control', 1, 1, 102, 'en', '2018-04-06 21:31:00', NULL),
(103, 103, 'Quality Inspection', 1, 1, 103, 'en', '2018-04-06 21:31:00', NULL),
(104, 104, 'Recruiting', 1, 1, 104, 'en', '2018-04-06 21:31:00', NULL),
(105, 105, 'Recruitment', 1, 1, 105, 'en', '2018-04-06 21:31:00', NULL),
(106, 106, 'Repair & Overhaul', 1, 1, 106, 'en', '2018-04-06 21:31:00', NULL),
(107, 107, 'Research & Development (R&D)', 1, 1, 107, 'en', '2018-04-06 21:31:00', NULL),
(108, 108, 'Research & Evaluation', 1, 1, 108, 'en', '2018-04-06 21:31:00', NULL),
(109, 109, 'Research & Fellowships', 1, 1, 109, 'en', '2018-04-06 21:31:00', NULL),
(110, 110, 'Researcher', 1, 1, 110, 'en', '2018-04-06 21:31:00', NULL),
(111, 111, 'Restaurant Management', 1, 1, 111, 'en', '2018-04-06 21:31:00', NULL),
(112, 112, 'Retail', 1, 1, 112, 'en', '2018-04-06 21:31:00', NULL),
(113, 113, 'Retail & Wholesale', 1, 1, 113, 'en', '2018-04-06 21:31:00', NULL),
(114, 114, 'Retail Buyer', 1, 1, 114, 'en', '2018-04-06 21:31:00', NULL),
(115, 115, 'Retail Buying', 1, 1, 115, 'en', '2018-04-06 21:31:00', NULL),
(116, 116, 'Retail Merchandising', 1, 1, 116, 'en', '2018-04-06 21:31:00', NULL),
(117, 117, 'Safety & Environment', 1, 1, 117, 'en', '2018-04-06 21:31:00', NULL),
(118, 118, 'Sales', 1, 1, 118, 'en', '2018-04-06 21:31:00', NULL),
(119, 119, 'Sales & Business Development', 1, 1, 119, 'en', '2018-04-06 21:31:00', NULL),
(120, 120, 'Sales Support', 1, 1, 120, 'en', '2018-04-06 21:31:00', NULL),
(121, 121, 'Search Engine Optimization (SEO)', 1, 1, 121, 'en', '2018-04-06 21:31:00', NULL),
(122, 122, 'Secretarial, Clerical & Front Office', 1, 1, 122, 'en', '2018-04-06 21:31:00', NULL),
(123, 123, 'Security', 1, 1, 123, 'en', '2018-04-06 21:31:00', NULL),
(124, 124, 'Security & Environment', 1, 1, 124, 'en', '2018-04-06 21:31:00', NULL),
(125, 125, 'Security Guard', 1, 1, 125, 'en', '2018-04-06 21:31:00', NULL),
(126, 126, 'SEM', 1, 1, 126, 'en', '2018-04-06 21:31:00', NULL),
(127, 127, 'SMO', 1, 1, 127, 'en', '2018-04-06 21:31:00', NULL),
(128, 128, 'Software & Web Development', 1, 1, 128, 'en', '2018-04-06 21:31:00', NULL),
(129, 129, 'Software Engineer', 1, 1, 129, 'en', '2018-04-06 21:31:00', NULL),
(130, 130, 'Software Testing', 1, 1, 130, 'en', '2018-04-06 21:31:00', NULL),
(131, 131, 'Stores & Warehousing', 1, 1, 131, 'en', '2018-04-06 21:31:00', NULL),
(132, 132, 'Supply Chain', 1, 1, 132, 'en', '2018-04-06 21:31:00', NULL),
(133, 133, 'Supply Chain Management', 1, 1, 133, 'en', '2018-04-06 21:31:00', NULL),
(134, 134, 'Systems Analyst', 1, 1, 134, 'en', '2018-04-06 21:31:00', NULL),
(135, 135, 'Teachers/Education, Training & Development', 1, 1, 135, 'en', '2018-04-06 21:31:00', NULL),
(136, 136, 'Technical Writer', 1, 1, 136, 'en', '2018-04-06 21:31:00', NULL),
(137, 137, 'Tele Sale Representative', 1, 1, 137, 'en', '2018-04-06 21:31:00', NULL),
(138, 138, 'Telemarketing', 1, 1, 138, 'en', '2018-04-06 21:31:00', NULL),
(139, 139, 'Training & Development', 1, 1, 139, 'en', '2018-04-06 21:31:00', '2018-04-08 16:37:56'),
(140, 140, 'Transportation & Warehousing', 1, 1, 140, 'en', '2018-04-06 21:31:00', '2018-04-08 16:37:56'),
(141, 141, 'TSR', 1, 1, 141, 'en', '2018-04-06 21:31:00', '2018-04-08 16:37:56'),
(142, 142, 'Typing', 1, 1, 142, 'en', '2018-04-06 21:31:00', '2018-04-08 16:37:56'),
(143, 143, 'Warehousing', 1, 1, 143, 'en', '2018-04-06 21:31:00', '2018-04-08 16:37:56'),
(144, 144, 'Web Developer', 1, 1, 144, 'en', '2018-04-06 21:31:00', '2018-04-08 16:37:56'),
(145, 145, 'Web Marketing', 1, 1, 145, 'en', '2018-04-06 21:31:00', '2018-04-08 16:37:56'),
(146, 146, 'Writer', 1, 1, 146, 'en', '2018-04-06 21:31:00', '2018-04-08 16:37:56'),
(148, 85, 'PR', 0, 1, 2, 'ar', '2018-04-06 21:31:00', NULL),
(149, 98, 'QA', 0, 1, 3, 'ar', '2018-04-06 21:31:00', NULL),
(150, 99, 'QC', 0, 1, 4, 'ar', '2018-04-06 21:31:00', NULL),
(151, 126, 'SEM', 0, 1, 5, 'ar', '2018-04-06 21:31:00', NULL),
(152, 127, 'SMO', 0, 1, 6, 'ar', '2018-04-06 21:31:00', NULL),
(153, 141, 'TSR', 0, 1, 7, 'ar', '2018-04-06 21:31:00', NULL),
(154, 130, 'اختبار البرمجيات', 0, 1, 8, 'ar', '2018-04-06 21:31:00', NULL),
(155, 14, 'ادارة اعمال', 0, 1, 9, 'ar', '2018-04-06 21:31:00', NULL),
(156, 78, 'ادارة الشبكة', 0, 1, 10, 'ar', '2018-04-06 21:31:00', NULL),
(157, 92, 'ادارة المنتج', 0, 1, 11, 'ar', '2018-04-06 21:31:00', NULL),
(158, 95, 'ادارة مشروع', 0, 1, 12, 'ar', '2018-04-06 21:31:00', NULL),
(159, 26, 'ادخال بيانات', 0, 1, 13, 'ar', '2018-04-06 21:31:00', NULL),
(160, 50, 'استيراد و تصدير', 0, 1, 14, 'ar', '2018-04-06 21:31:00', NULL),
(161, 106, 'اصلاح واصلاح', 0, 1, 15, 'ar', '2018-04-06 21:31:00', NULL),
(162, 80, 'اعلانات الانترنت', 0, 1, 16, 'ar', '2018-04-06 21:31:00', NULL),
(163, 5, 'الادارة', 0, 1, 17, 'ar', '2018-04-06 21:31:00', NULL),
(164, 35, 'الادارة التنفيذية', 0, 1, 18, 'ar', '2018-04-06 21:31:00', NULL),
(165, 64, 'الاستشارات الإدارية', 0, 1, 19, 'ar', '2018-04-06 21:31:00', NULL),
(166, 72, 'الاعلام والاعلان', 0, 1, 20, 'ar', '2018-04-06 21:31:00', NULL),
(167, 6, 'الإدارة الكتابية', 0, 1, 21, 'ar', '2018-04-06 21:31:00', NULL),
(168, 51, 'الإنتاج الصناعي', 0, 1, 22, 'ar', '2018-04-06 21:31:00', NULL),
(169, 123, 'الأمان', 0, 1, 23, 'ar', '2018-04-06 21:31:00', NULL),
(170, 124, 'الأمن والبيئة', 0, 1, 24, 'ar', '2018-04-06 21:31:00', NULL),
(171, 110, 'الباحث', 0, 1, 25, 'ar', '2018-04-06 21:31:00', NULL),
(172, 100, 'البحث النوعى', 0, 1, 26, 'ar', '2018-04-06 21:31:00', NULL),
(173, 107, 'البحث والتطوير (R & D)', 0, 1, 27, 'ar', '2018-04-06 21:31:00', NULL),
(174, 108, 'البحث والتقييم', 0, 1, 28, 'ar', '2018-04-06 21:31:00', NULL),
(175, 109, 'البحوث والزمالات', 0, 1, 29, 'ar', '2018-04-06 21:31:00', NULL),
(176, 128, 'البرمجيات وتطوير الويب', 0, 1, 30, 'ar', '2018-04-06 21:31:00', NULL),
(177, 113, 'البيع بالتجزئة والبيع بالجملة', 0, 1, 31, 'ar', '2018-04-06 21:31:00', NULL),
(178, 52, 'التثبيت والإصلاح', 0, 1, 32, 'ar', '2018-04-06 21:31:00', NULL),
(179, 76, 'التجارة وإدارة المنتجات', 0, 1, 33, 'ar', '2018-04-06 21:31:00', NULL),
(180, 112, 'التجزئة', 0, 1, 34, 'ar', '2018-04-06 21:31:00', NULL),
(181, 143, 'التخزين', 0, 1, 35, 'ar', '2018-04-06 21:31:00', NULL),
(182, 84, 'التخطيط والتطوير', 0, 1, 36, 'ar', '2018-04-06 21:31:00', NULL),
(183, 139, 'التدريب و التطوير', 0, 1, 37, 'ar', '2018-04-06 21:31:00', NULL),
(184, 145, 'التسويق الشبكي', 0, 1, 38, 'ar', '2018-04-06 21:31:00', NULL),
(185, 81, 'التسويق عبر الإنترنت', 0, 1, 39, 'ar', '2018-04-06 21:31:00', NULL),
(186, 138, 'التسويق عبر الهاتف', 0, 1, 40, 'ar', '2018-04-06 21:31:00', NULL),
(187, 23, 'التصميم الإبداعي', 0, 1, 41, 'ar', '2018-04-06 21:31:00', NULL),
(188, 40, 'التصميم الجرافيكي', 0, 1, 42, 'ar', '2018-04-06 21:31:00', NULL),
(189, 31, 'التعليم والتدريب', 0, 1, 43, 'ar', '2018-04-06 21:31:00', NULL),
(190, 30, 'التوزيع والخدمات اللوجستية', 0, 1, 44, 'ar', '2018-04-06 21:31:00', NULL),
(191, 2, 'الحسابات المالية والخدمات المالية', 0, 1, 45, 'ar', '2018-04-06 21:31:00', NULL),
(192, 62, 'الخدمات اللوجستية والمخازن', 0, 1, 46, 'ar', '2018-04-06 21:31:00', NULL),
(193, 77, 'الرصد والتقييم (M & E)', 0, 1, 47, 'ar', '2018-04-06 21:31:00', NULL),
(194, 44, 'الرعاىة الصحية', 0, 1, 48, 'ar', '2018-04-06 21:31:00', NULL),
(195, 122, 'السكرتارية والمكتبية ومكتب الجبهة', 0, 1, 49, 'ar', '2018-04-06 21:31:00', NULL),
(196, 36, 'السكرتير التنفيذي', 0, 1, 50, 'ar', '2018-04-06 21:31:00', NULL),
(197, 60, 'الشؤون القانونية', 0, 1, 51, 'ar', '2018-04-06 21:31:00', NULL),
(198, 59, 'الشؤون القانونية والشركات', 0, 1, 52, 'ar', '2018-04-06 21:31:00', NULL),
(199, 45, 'الصحة ذات الصلة', 0, 1, 53, 'ar', '2018-04-06 21:31:00', NULL),
(200, 43, 'الصحة والأمان', 0, 1, 54, 'ar', '2018-04-06 21:31:00', NULL),
(201, 42, 'الصحة والعلاج', 0, 1, 55, 'ar', '2018-04-06 21:31:00', NULL),
(202, 97, 'العلاقات العامة', 0, 1, 56, 'ar', '2018-04-06 21:31:00', NULL),
(203, 24, 'الكاتب الإبداعي', 0, 1, 57, 'ar', '2018-04-06 21:31:00', NULL),
(204, 142, 'الكتابة', 0, 1, 58, 'ar', '2018-04-06 21:31:00', NULL),
(205, 16, 'الكتبة', 0, 1, 59, 'ar', '2018-04-06 21:31:00', NULL),
(206, 119, 'المبيعات وتطوير الأعمال', 0, 1, 60, 'ar', '2018-04-06 21:31:00', NULL),
(207, 54, 'المتدرب', 0, 1, 61, 'ar', '2018-04-06 21:31:00', NULL),
(208, 135, 'المدرسون / التعليم والتدريب والتطوير', 0, 1, 62, 'ar', '2018-04-06 21:31:00', NULL),
(209, 41, 'المعدات', 0, 1, 63, 'ar', '2018-04-06 21:31:00', NULL),
(210, 10, 'المهندسين المعماريين والبناء', 0, 1, 64, 'ar', '2018-04-06 21:31:00', NULL),
(211, 49, 'الموارد البشرية', 0, 1, 65, 'ar', '2018-04-06 21:31:00', NULL),
(212, 132, 'الموردين', 0, 1, 66, 'ar', '2018-04-06 21:31:00', NULL),
(213, 140, 'النقل والتخزين', 0, 1, 67, 'ar', '2018-04-06 21:31:00', NULL),
(214, 34, 'الهيئة الهندسية', 0, 1, 68, 'ar', '2018-04-06 21:31:00', NULL),
(215, 133, 'إدارة الأمدادات', 0, 1, 69, 'ar', '2018-04-06 21:31:00', NULL),
(216, 47, 'إدارة الفنادق / المطاعم', 0, 1, 70, 'ar', '2018-04-06 21:31:00', NULL),
(217, 46, 'إدارة الفندق', 0, 1, 71, 'ar', '2018-04-06 21:31:00', NULL),
(218, 111, 'إدارة المطاعم', 0, 1, 72, 'ar', '2018-04-06 21:31:00', NULL),
(219, 28, 'إدارة قواعد البيانات (DBA)', 0, 1, 73, 'ar', '2018-04-06 21:31:00', NULL),
(220, 66, 'إداري', 0, 1, 74, 'ar', '2018-04-06 21:31:00', NULL),
(221, 7, 'إعلان', 0, 1, 75, 'ar', '2018-04-06 21:31:00', NULL),
(222, 8, 'إعلان', 0, 1, 76, 'ar', '2018-04-06 21:31:00', NULL),
(223, 9, 'إعلانات', 0, 1, 77, 'ar', '2018-04-06 21:31:00', NULL),
(224, 93, 'إنتاج', 0, 1, 78, 'ar', '2018-04-06 21:31:00', NULL),
(225, 18, 'أجزاء الكمبيوتر', 0, 1, 79, 'ar', '2018-04-06 21:31:00', NULL),
(226, 57, 'أمن تكنولوجيا المعلومات', 0, 1, 80, 'ar', '2018-04-06 21:31:00', NULL),
(227, 61, 'بحث قانوني', 0, 1, 81, 'ar', '2018-04-06 21:31:00', NULL),
(228, 117, 'بيئة السلامة', 0, 1, 82, 'ar', '2018-04-06 21:31:00', NULL),
(229, 75, 'تجارة', 0, 1, 83, 'ar', '2018-04-06 21:31:00', NULL),
(230, 116, 'تجارة التجزئة', 0, 1, 84, 'ar', '2018-04-06 21:31:00', NULL),
(231, 104, 'تجنيد', 0, 1, 85, 'ar', '2018-04-06 21:31:00', NULL),
(232, 105, 'تجنيد', 0, 1, 86, 'ar', '2018-04-06 21:31:00', NULL),
(233, 83, 'تخطيط', 0, 1, 87, 'ar', '2018-04-06 21:31:00', NULL),
(234, 88, 'تدبير', 0, 1, 88, 'ar', '2018-04-06 21:31:00', NULL),
(235, 69, 'تسويق', 0, 1, 89, 'ar', '2018-04-06 21:31:00', NULL),
(236, 70, 'تسويق', 0, 1, 90, 'ar', '2018-04-06 21:31:00', NULL),
(237, 12, 'تشغيل البنك', 0, 1, 91, 'ar', '2018-04-06 21:31:00', NULL),
(238, 79, 'تشغيل الشبكة', 0, 1, 92, 'ar', '2018-04-06 21:31:00', NULL),
(239, 67, 'تصنيع', 0, 1, 93, 'ar', '2018-04-06 21:31:00', NULL),
(240, 29, 'تطوير', 0, 1, 94, 'ar', '2018-04-06 21:31:00', NULL),
(241, 13, 'تطوير الاعمال', 0, 1, 95, 'ar', '2018-04-06 21:31:00', NULL),
(242, 90, 'تطوير المنتج', 0, 1, 96, 'ar', '2018-04-06 21:31:00', NULL),
(243, 91, 'تطوير المنتج', 0, 1, 97, 'ar', '2018-04-06 21:31:00', NULL),
(244, 137, 'تيلي بيع الممثل', 0, 1, 98, 'ar', '2018-04-06 21:31:00', NULL),
(245, 125, 'حارس أمن', 0, 1, 99, 'ar', '2018-04-06 21:31:00', NULL),
(246, 17, 'خدمات العملاء ودعم العملاء', 0, 1, 100, 'ar', '2018-04-06 21:31:00', NULL),
(247, 25, 'دعم العملاء', 0, 1, 101, 'ar', '2018-04-06 21:31:00', NULL),
(248, 120, 'دعم المبيعات', 0, 1, 102, 'ar', '2018-04-06 21:31:00', NULL),
(249, 74, 'دواء', 0, 1, 103, 'ar', '2018-04-06 21:31:00', NULL),
(250, 19, 'شبكات الكمبيوتر', 0, 1, 104, 'ar', '2018-04-06 21:31:00', NULL),
(251, 115, 'شراء التجزئة', 0, 1, 105, 'ar', '2018-04-06 21:31:00', NULL),
(252, 22, 'شؤون الشركات', 0, 1, 106, 'ar', '2018-04-06 21:31:00', NULL),
(253, 63, 'صيانة / إصلاح', 0, 1, 107, 'ar', '2018-04-06 21:31:00', NULL),
(254, 101, 'ضمان الجودة (ضمان الجودة)', 0, 1, 108, 'ar', '2018-04-06 21:31:00', NULL),
(255, 87, 'طبع', 0, 1, 109, 'ar', '2018-04-06 21:31:00', NULL),
(256, 73, 'طبي', 0, 1, 110, 'ar', '2018-04-06 21:31:00', NULL),
(257, 82, 'عمليات', 0, 1, 111, 'ar', '2018-04-06 21:31:00', NULL),
(258, 56, 'عمليات الاستثمار', 0, 1, 112, 'ar', '2018-04-06 21:31:00', NULL),
(259, 68, 'عمليات التصنيع', 0, 1, 113, 'ar', '2018-04-06 21:31:00', NULL),
(260, 37, 'عمليات ميدانية', 0, 1, 114, 'ar', '2018-04-06 21:31:00', NULL),
(261, 4, 'عملية المسؤول', 0, 1, 115, 'ar', '2018-04-06 21:31:00', NULL),
(262, 55, 'فترة تدريب', 0, 1, 116, 'ar', '2018-04-06 21:31:00', NULL),
(263, 103, 'فحص الجودة', 0, 1, 117, 'ar', '2018-04-06 21:31:00', NULL),
(264, 32, 'فنى الكترونيات', 0, 1, 118, 'ar', '2018-04-06 21:31:00', NULL),
(265, 146, 'كاتب', 0, 1, 119, 'ar', '2018-04-06 21:31:00', NULL),
(266, 21, 'كاتب المحتوى', 0, 1, 120, 'ar', '2018-04-06 21:31:00', NULL),
(267, 136, 'كاتب تقني', 0, 1, 121, 'ar', '2018-04-06 21:31:00', NULL),
(268, 118, 'مبيعات', 0, 1, 122, 'ar', '2018-04-06 21:31:00', NULL),
(269, 1, 'محاسب', 0, 1, 123, 'ar', '2018-04-06 21:31:00', NULL),
(270, 121, 'محرك البحث الأمثل (جنوب شرقي أوروبا)', 0, 1, 124, 'ar', '2018-04-06 21:31:00', NULL),
(271, 134, 'محلل أنظمة', 0, 1, 125, 'ar', '2018-04-06 21:31:00', NULL),
(272, 15, 'محلل نظم الأعمال', 0, 1, 126, 'ar', '2018-04-06 21:31:00', NULL),
(273, 58, 'محلل نظم تكنولوجيا المعلومات', 0, 1, 127, 'ar', '2018-04-06 21:31:00', NULL),
(274, 131, 'مخازن ومخازن', 0, 1, 128, 'ar', '2018-04-06 21:31:00', NULL),
(275, 27, 'مدخل بيانات', 0, 1, 129, 'ar', '2018-04-06 21:31:00', NULL),
(276, 94, 'مراقبة الإنتاج والجودة', 0, 1, 130, 'ar', '2018-04-06 21:31:00', NULL),
(277, 102, 'مراقبة الجودة', 0, 1, 131, 'ar', '2018-04-06 21:31:00', NULL),
(278, 20, 'مستشار', 0, 1, 132, 'ar', '2018-04-06 21:31:00', NULL),
(279, 96, 'مستشار إدارة المشاريع', 0, 1, 133, 'ar', '2018-04-06 21:31:00', NULL),
(280, 114, 'مشتري التجزئة', 0, 1, 134, 'ar', '2018-04-06 21:31:00', NULL),
(281, 3, 'مشرف', 0, 1, 135, 'ar', '2018-04-06 21:31:00', NULL),
(282, 53, 'مصممي الديكور الداخلي والمهندسين المعماريين', 0, 1, 136, 'ar', '2018-04-06 21:31:00', NULL),
(283, 89, 'مطور المنتجات', 0, 1, 137, 'ar', '2018-04-06 21:31:00', NULL),
(284, 144, 'مطور ويب', 0, 1, 138, 'ar', '2018-04-06 21:31:00', NULL),
(285, 129, 'مهندس برمجيات', 0, 1, 139, 'ar', '2018-04-06 21:31:00', NULL),
(286, 38, 'موظف الاستقبال', 0, 1, 140, 'ar', '2018-04-06 21:31:00', NULL),
(287, 39, 'موظف مكتب الاستقبال', 0, 1, 141, 'ar', '2018-04-06 21:31:00', NULL),
(288, 65, 'نظام المعلومات الإدارية (MIS)', 0, 1, 142, 'ar', '2018-04-06 21:31:00', NULL),
(289, 33, 'هندسة', 0, 1, 143, 'ar', '2018-04-06 21:31:00', NULL),
(290, 11, 'هندسة معمارية', 0, 1, 144, 'ar', '2018-04-06 21:31:00', NULL),
(291, 86, 'وسائل الاعلام المطبوعة', 0, 1, 145, 'ar', '2018-04-06 21:31:00', NULL),
(292, 71, 'وسائل الإعلام - الطباعة والإلكترونية', 0, 1, 146, 'ar', '2018-04-06 21:31:00', NULL),
(293, 147, 'ویب مارکیٹنگ', 0, 1, 293, 'ur', '2018-04-06 21:31:00', NULL),
(294, 146, 'مصنف', 0, 1, 294, 'ur', '2018-04-06 21:31:00', NULL),
(295, 3, 'Administración', 0, 1, 1, 'es', '2018-04-12 03:52:32', NULL),
(296, 5, 'Administración', 0, 1, 2, 'es', '2018-04-12 03:52:32', NULL),
(297, 6, 'Administración Clerical', 0, 1, 3, 'es', '2018-04-12 03:52:33', NULL),
(298, 28, 'Administración de bases de datos (DBA)', 0, 1, 4, 'es', '2018-04-12 03:52:33', NULL),
(299, 14, 'Administración de Empresas', 0, 1, 5, 'es', '2018-04-12 03:52:33', NULL),
(300, 78, 'Administración de red', 0, 1, 6, 'es', '2018-04-12 03:52:33', NULL),
(301, 111, 'Administración del restaurante', 0, 1, 7, 'es', '2018-04-12 03:52:33', NULL),
(302, 112, 'Al por menor', 0, 1, 8, 'es', '2018-04-12 03:52:33', NULL),
(303, 143, 'Almacenaje', 0, 1, 9, 'es', '2018-04-12 03:52:33', NULL),
(304, 15, 'Analista de sistemas de negocios', 0, 1, 10, 'es', '2018-04-12 03:52:33', NULL),
(305, 58, 'Analista de sistemas de TI', 0, 1, 11, 'es', '2018-04-12 03:52:33', NULL),
(306, 134, 'Analizador de sistemas', 0, 1, 12, 'es', '2018-04-12 03:52:33', NULL),
(307, 9, 'Anuncio', 0, 1, 13, 'es', '2018-04-12 03:52:33', NULL),
(308, 10, 'Arquitectos y construcción', 0, 1, 14, 'es', '2018-04-12 03:52:33', NULL),
(309, 11, 'Arquitectura', 0, 1, 15, 'es', '2018-04-12 03:52:33', NULL),
(310, 22, 'Asuntos Corporativos', 0, 1, 16, 'es', '2018-04-12 03:52:33', NULL),
(311, 60, 'Asuntos legales', 0, 1, 17, 'es', '2018-04-12 03:52:33', NULL),
(312, 59, 'Asuntos legales y corporativos', 0, 1, 18, 'es', '2018-04-12 03:52:33', NULL),
(313, 25, 'Atención al cliente', 0, 1, 19, 'es', '2018-04-12 03:52:33', NULL),
(314, 132, 'Cadena de suministro', 0, 1, 20, 'es', '2018-04-12 03:52:33', NULL),
(315, 16, 'Clerical', 0, 1, 21, 'es', '2018-04-12 03:52:33', NULL),
(316, 75, 'Comercialización', 0, 1, 22, 'es', '2018-04-12 03:52:33', NULL),
(317, 116, 'Comercialización al por menor', 0, 1, 23, 'es', '2018-04-12 03:52:33', NULL),
(318, 76, 'Comercialización y gestión de productos', 0, 1, 24, 'es', '2018-04-12 03:52:33', NULL),
(319, 115, 'Compra minorista', 0, 1, 25, 'es', '2018-04-12 03:52:33', NULL),
(320, 114, 'Comprador al por menor', 0, 1, 26, 'es', '2018-04-12 03:52:33', NULL),
(321, 34, 'Construcción de ingeniería', 0, 1, 27, 'es', '2018-04-12 03:52:33', NULL),
(322, 20, 'Consultor', 0, 1, 28, 'es', '2018-04-12 03:52:33', NULL),
(323, 96, 'Consultor de gestión de proyectos', 0, 1, 29, 'es', '2018-04-12 03:52:33', NULL),
(324, 64, 'Consultoría de gestión', 0, 1, 30, 'es', '2018-04-12 03:52:33', NULL),
(325, 1, 'Contador', 0, 1, 31, 'es', '2018-04-12 03:52:33', NULL),
(326, 98, 'Control de calidad', 0, 1, 32, 'es', '2018-04-12 03:52:33', NULL),
(327, 99, 'Control de calidad', 0, 1, 33, 'es', '2018-04-12 03:52:33', NULL),
(328, 102, 'Control de calidad', 0, 1, 34, 'es', '2018-04-12 03:52:33', NULL),
(329, 2, 'Cuentas, finanzas y servicios financieros', 0, 1, 35, 'es', '2018-04-12 03:52:33', NULL),
(330, 44, 'Cuidado de la salud', 0, 1, 36, 'es', '2018-04-12 03:52:33', NULL),
(331, 89, 'Desarrollador de producto', 0, 1, 37, 'es', '2018-04-12 03:52:33', NULL),
(332, 144, 'Desarrollador web', 0, 1, 38, 'es', '2018-04-12 03:52:33', NULL),
(333, 29, 'Desarrollo', 0, 1, 39, 'es', '2018-04-12 03:52:33', NULL),
(334, 13, 'Desarrollo de negocios', 0, 1, 40, 'es', '2018-04-12 03:52:33', NULL),
(335, 90, 'Desarrollo de productos', 0, 1, 41, 'es', '2018-04-12 03:52:33', NULL),
(336, 91, 'Desarrollo de productos', 0, 1, 42, 'es', '2018-04-12 03:52:33', NULL),
(337, 35, 'Dirección ejecutiva', 0, 1, 43, 'es', '2018-04-12 03:52:33', NULL),
(338, 46, 'Dirección hotelera', 0, 1, 44, 'es', '2018-04-12 03:52:33', NULL),
(339, 53, 'Diseñadores de interiores y arquitectos', 0, 1, 45, 'es', '2018-04-12 03:52:33', NULL),
(340, 23, 'Diseño creativo', 0, 1, 46, 'es', '2018-04-12 03:52:33', NULL),
(341, 40, 'Diseño gráfico', 0, 1, 47, 'es', '2018-04-12 03:52:33', NULL),
(342, 30, 'Distribución y Logística', 0, 1, 48, 'es', '2018-04-12 03:52:33', NULL),
(343, 135, 'Docentes / Educación, Capacitación y Desarrollo', 0, 1, 49, 'es', '2018-04-12 03:52:33', NULL),
(344, 31, 'Educación y Entrenamiento', 0, 1, 50, 'es', '2018-04-12 03:52:33', NULL),
(345, 26, 'Entrada de datos', 0, 1, 51, 'es', '2018-04-12 03:52:33', NULL),
(346, 139, 'Entrenamiento y desarrollo', 0, 1, 52, 'es', '2018-04-12 03:52:33', NULL),
(347, 146, 'Escritor', 0, 1, 53, 'es', '2018-04-12 03:52:33', NULL),
(348, 24, 'Escritor creativo', 0, 1, 54, 'es', '2018-04-12 03:52:33', NULL),
(349, 21, 'Escritor de contenido', 0, 1, 55, 'es', '2018-04-12 03:52:33', NULL),
(350, 136, 'Escritor técnico', 0, 1, 56, 'es', '2018-04-12 03:52:33', NULL),
(351, 67, 'Fabricación', 0, 1, 57, 'es', '2018-04-12 03:52:33', NULL),
(352, 101, 'Garantía de calidad (QA)', 0, 1, 58, 'es', '2018-04-12 03:52:33', NULL),
(353, 66, 'Gerencial', 0, 1, 59, 'es', '2018-04-12 03:52:33', NULL),
(354, 133, 'Gestión de la cadena de suministro', 0, 1, 60, 'es', '2018-04-12 03:52:33', NULL),
(355, 95, 'Gestión de proyectos', 0, 1, 61, 'es', '2018-04-12 03:52:33', NULL),
(356, 92, 'Gestión del producto', 0, 1, 62, 'es', '2018-04-12 03:52:34', NULL),
(357, 125, 'Guardia de seguridad', 0, 1, 63, 'es', '2018-04-12 03:52:34', NULL),
(358, 41, 'Hardware', 0, 1, 64, 'es', '2018-04-12 03:52:34', NULL),
(359, 18, 'Hardware de la computadora', 0, 1, 65, 'es', '2018-04-12 03:52:34', NULL),
(360, 48, 'HORA', 0, 1, 66, 'es', '2018-04-12 03:52:34', NULL),
(361, 47, 'Hotel / Gestión de restaurantes', 0, 1, 67, 'es', '2018-04-12 03:52:34', NULL),
(362, 50, 'Importación y exportación', 0, 1, 68, 'es', '2018-04-12 03:52:34', NULL),
(363, 87, 'Impresión', 0, 1, 69, 'es', '2018-04-12 03:52:34', NULL),
(364, 33, 'Ingenieria', 0, 1, 70, 'es', '2018-04-12 03:52:34', NULL),
(365, 129, 'Ingeniero de software', 0, 1, 71, 'es', '2018-04-12 03:52:34', NULL),
(366, 103, 'Inspeccion de calidad', 0, 1, 72, 'es', '2018-04-12 03:52:34', NULL),
(367, 52, 'Instalación y reparación', 0, 1, 73, 'es', '2018-04-12 03:52:34', NULL),
(368, 55, 'Internado', 0, 1, 74, 'es', '2018-04-12 03:52:34', NULL),
(369, 54, 'Interno', 0, 1, 75, 'es', '2018-04-12 03:52:34', NULL),
(370, 100, 'Investigación cualitativa', 0, 1, 76, 'es', '2018-04-12 03:52:34', NULL),
(371, 61, 'Investigación legal', 0, 1, 77, 'es', '2018-04-12 03:52:34', NULL),
(372, 109, 'Investigación y becas', 0, 1, 78, 'es', '2018-04-12 03:52:34', NULL),
(373, 107, 'Investigación y desarrollo (I + D)', 0, 1, 79, 'es', '2018-04-12 03:52:34', NULL),
(374, 108, 'Investigación y evaluación', 0, 1, 80, 'es', '2018-04-12 03:52:34', NULL),
(375, 110, 'Investigador', 0, 1, 81, 'es', '2018-04-12 03:52:34', NULL),
(376, 62, 'Logística y Almacenaje', 0, 1, 82, 'es', '2018-04-12 03:52:34', NULL),
(377, 69, 'Márketing', 0, 1, 83, 'es', '2018-04-12 03:52:34', NULL),
(378, 70, 'Márketing', 0, 1, 84, 'es', '2018-04-12 03:52:34', NULL),
(379, 142, 'Mecanografía', 0, 1, 85, 'es', '2018-04-12 03:52:34', NULL),
(380, 74, 'Medicina', 0, 1, 86, 'es', '2018-04-12 03:52:34', NULL),
(381, 73, 'Médico', 0, 1, 87, 'es', '2018-04-12 03:52:34', NULL),
(382, 71, 'Medios - Impresión y electrónica', 0, 1, 88, 'es', '2018-04-12 03:52:34', NULL),
(383, 86, 'Medios de comunicación impresos', 0, 1, 89, 'es', '2018-04-12 03:52:34', NULL),
(384, 72, 'Medios y publicidad', 0, 1, 90, 'es', '2018-04-12 03:52:34', NULL),
(385, 81, 'Mercadeo en línea', 0, 1, 91, 'es', '2018-04-12 03:52:34', NULL),
(386, 145, 'Mercadotecnia web', 0, 1, 92, 'es', '2018-04-12 03:52:34', NULL),
(387, 77, 'Monitoreo y Evaluación (M & E)', 0, 1, 93, 'es', '2018-04-12 03:52:34', NULL),
(388, 88, 'Obtención', 0, 1, 94, 'es', '2018-04-12 03:52:34', NULL),
(389, 39, 'Oficial de recepción', 0, 1, 95, 'es', '2018-04-12 03:52:34', NULL),
(390, 122, 'Oficina de secretaría, oficina y secretaría', 0, 1, 96, 'es', '2018-04-12 03:52:34', NULL),
(391, 12, 'Operación bancaria', 0, 1, 97, 'es', '2018-04-12 03:52:34', NULL),
(392, 4, 'Operación de administrador', 0, 1, 98, 'es', '2018-04-12 03:52:34', NULL),
(393, 79, 'Operación de red', 0, 1, 99, 'es', '2018-04-12 03:52:34', NULL),
(394, 82, 'Operaciones', 0, 1, 100, 'es', '2018-04-12 03:52:34', NULL),
(395, 37, 'Operaciones de campo', 0, 1, 101, 'es', '2018-04-12 03:52:34', NULL),
(396, 56, 'Operaciones de inversión', 0, 1, 102, 'es', '2018-04-12 03:52:34', NULL),
(397, 68, 'Operaciones de manufactura', 0, 1, 103, 'es', '2018-04-12 03:52:34', NULL),
(398, 27, 'Operador de entrada de datos', 0, 1, 104, 'es', '2018-04-12 03:52:34', NULL),
(399, 121, 'Optimización de motores de búsqueda (SEO)', 0, 1, 105, 'es', '2018-04-12 03:52:34', NULL),
(400, 83, 'Planificación', 0, 1, 106, 'es', '2018-04-12 03:52:34', NULL),
(401, 84, 'Planificación y desarrollo', 0, 1, 107, 'es', '2018-04-12 03:52:34', NULL),
(402, 85, 'PR', 0, 1, 108, 'es', '2018-04-12 03:52:34', NULL),
(403, 93, 'Producción', 0, 1, 109, 'es', '2018-04-12 03:52:34', NULL),
(404, 51, 'Producción industrial', 0, 1, 110, 'es', '2018-04-12 03:52:34', NULL),
(405, 94, 'Producción y control de calidad', 0, 1, 111, 'es', '2018-04-12 03:52:34', NULL),
(406, 130, 'Pruebas de software', 0, 1, 112, 'es', '2018-04-12 03:52:34', NULL),
(407, 7, 'Publicidad', 0, 1, 113, 'es', '2018-04-12 03:52:34', NULL),
(408, 8, 'Publicidad', 0, 1, 114, 'es', '2018-04-12 03:52:34', NULL),
(409, 80, 'Publicidad online', 0, 1, 115, 'es', '2018-04-12 03:52:34', NULL),
(410, 38, 'Recepcionista', 0, 1, 116, 'es', '2018-04-12 03:52:34', NULL),
(411, 104, 'Reclutamiento', 0, 1, 117, 'es', '2018-04-12 03:52:34', NULL),
(412, 105, 'Reclutamiento', 0, 1, 118, 'es', '2018-04-12 03:52:34', NULL),
(413, 49, 'Recursos humanos', 0, 1, 119, 'es', '2018-04-12 03:52:34', NULL),
(414, 19, 'Redes de computadoras', 0, 1, 120, 'es', '2018-04-12 03:52:34', NULL),
(415, 45, 'Relacionado con la salud', 0, 1, 121, 'es', '2018-04-12 03:52:34', NULL),
(416, 97, 'Relaciones públicas', 0, 1, 122, 'es', '2018-04-12 03:52:34', NULL),
(417, 63, 'Reparación de mantenimiento', 0, 1, 123, 'es', '2018-04-12 03:52:34', NULL),
(418, 106, 'Reparación y revisión', 0, 1, 124, 'es', '2018-04-12 03:52:34', NULL),
(419, 137, 'Representante de televenta', 0, 1, 125, 'es', '2018-04-12 03:52:34', NULL),
(420, 42, 'Salud y Medicina', 0, 1, 126, 'es', '2018-04-12 03:52:34', NULL),
(421, 43, 'Salud y Seguridad', 0, 1, 127, 'es', '2018-04-12 03:52:34', NULL),
(422, 36, 'Secretario Ejecutivo', 0, 1, 128, 'es', '2018-04-12 03:52:34', NULL),
(423, 123, 'Seguridad', 0, 1, 129, 'es', '2018-04-12 03:52:34', NULL),
(424, 57, 'Seguridad informatica', 0, 1, 130, 'es', '2018-04-12 03:52:34', NULL),
(425, 117, 'Seguridad y Medio Ambiente', 0, 1, 131, 'es', '2018-04-12 03:52:34', NULL),
(426, 124, 'Seguridad y Medio Ambiente', 0, 1, 132, 'es', '2018-04-12 03:52:34', NULL),
(427, 126, 'SEM', 0, 1, 133, 'es', '2018-04-12 03:52:34', NULL),
(428, 17, 'Servicios al cliente y atención al cliente', 0, 1, 134, 'es', '2018-04-12 03:52:34', NULL),
(429, 65, 'Sistema de información de gestión (MIS)', 0, 1, 135, 'es', '2018-04-12 03:52:34', NULL),
(430, 127, 'SMO', 0, 1, 136, 'es', '2018-04-12 03:52:34', NULL),
(431, 128, 'Software y desarrollo web', 0, 1, 137, 'es', '2018-04-12 03:52:34', NULL),
(432, 120, 'Soporte de ventas', 0, 1, 138, 'es', '2018-04-12 03:52:34', NULL),
(433, 32, 'Técnico en electrónica', 0, 1, 139, 'es', '2018-04-12 03:52:34', NULL),
(434, 138, 'Telemarketing', 0, 1, 140, 'es', '2018-04-12 03:52:34', NULL),
(435, 131, 'Tiendas y almacenaje', 0, 1, 141, 'es', '2018-04-12 03:52:34', NULL),
(436, 140, 'Transporte y almacenamiento', 0, 1, 142, 'es', '2018-04-12 03:52:34', NULL),
(437, 141, 'TSR', 0, 1, 143, 'es', '2018-04-12 03:52:34', NULL),
(438, 113, 'Venta al por mayor al por menor', 0, 1, 144, 'es', '2018-04-12 03:52:34', NULL),
(439, 118, 'Ventas', 0, 1, 145, 'es', '2018-04-12 03:52:34', NULL),
(440, 119, 'Ventas y desarrollo empresarial', 0, 1, 146, 'es', '2018-04-12 03:52:34', NULL),
(441, 48, 'HR', 0, 1, 1, 'ur', '2018-04-12 03:57:10', NULL),
(442, 98, 'QA', 0, 1, 2, 'ur', '2018-04-12 03:57:10', NULL),
(443, 99, 'QC', 0, 1, 3, 'ur', '2018-04-12 03:57:10', NULL),
(444, 126, 'SEM', 0, 1, 4, 'ur', '2018-04-12 03:57:10', NULL),
(445, 135, 'اساتذہ / تعلیم، تربیت اور ترقی', 0, 1, 5, 'ur', '2018-04-12 03:57:10', NULL),
(446, 38, 'استقبالیہ خدمتگار', 0, 1, 6, 'ur', '2018-04-12 03:57:10', NULL),
(447, 131, 'اسٹورز اور گودام', 0, 1, 7, 'ur', '2018-04-12 03:57:10', NULL),
(448, 9, 'اشتہار', 0, 1, 8, 'ur', '2018-04-12 03:57:10', NULL),
(449, 35, 'اعلی انتظامیہ', 0, 1, 9, 'ur', '2018-04-12 03:57:10', NULL),
(450, 2, 'اکاؤنٹس، فنانس اور مالیاتی خدمات', 0, 1, 10, 'ur', '2018-04-12 03:57:10', NULL),
(451, 1, 'اکاؤنٹنٹ', 0, 1, 11, 'ur', '2018-04-12 03:57:10', NULL),
(452, 32, 'الیکٹرانکس تکنیشین', 0, 1, 12, 'ur', '2018-04-12 03:57:10', NULL),
(453, 5, 'انتظامیہ', 0, 1, 13, 'ur', '2018-04-12 03:57:10', NULL),
(454, 55, 'انٹرنشپ', 0, 1, 14, 'ur', '2018-04-12 03:57:10', NULL),
(455, 34, 'انجینرنگ کی تعمیر', 0, 1, 15, 'ur', '2018-04-12 03:57:10', NULL),
(456, 33, 'انجینئرنگ', 0, 1, 16, 'ur', '2018-04-12 03:57:10', NULL),
(457, 54, 'اندرونی', 0, 1, 17, 'ur', '2018-04-12 03:57:10', NULL),
(458, 49, 'انسانی وسائل', 0, 1, 18, 'ur', '2018-04-12 03:57:10', NULL),
(459, 3, 'ایڈمن', 0, 1, 19, 'ur', '2018-04-12 03:57:10', NULL),
(460, 4, 'ایڈمن آپریشن', 0, 1, 20, 'ur', '2018-04-12 03:57:10', NULL),
(461, 6, 'ایڈمنسٹریشن کلریکل', 0, 1, 21, 'ur', '2018-04-12 03:57:10', NULL),
(462, 7, 'ایڈورٹائزنگ', 0, 1, 22, 'ur', '2018-04-12 03:57:10', NULL),
(463, 8, 'ایڈورٹائزنگ', 0, 1, 23, 'ur', '2018-04-12 03:57:10', NULL),
(464, 127, 'ایس ایم او', 0, 1, 24, 'ur', '2018-04-12 03:57:10', NULL),
(465, 36, 'ایگزیکٹو سیکرٹری', 0, 1, 25, 'ur', '2018-04-12 03:57:10', NULL),
(466, 82, 'آپریشنز', 0, 1, 26, 'ur', '2018-04-12 03:57:10', NULL),
(467, 10, 'آرکیٹیکٹس اور تعمیر', 0, 1, 27, 'ur', '2018-04-12 03:57:10', NULL),
(468, 80, 'آن لائن ایڈورٹائزنگ', 0, 1, 28, 'ur', '2018-04-12 03:57:10', NULL),
(469, 81, 'آن لائن مارکیٹنگ', 0, 1, 29, 'ur', '2018-04-12 03:57:10', NULL),
(470, 58, 'آئی ٹی سسٹم تجزیہ کار', 0, 1, 30, 'ur', '2018-04-12 03:57:10', NULL),
(471, 57, 'آئی ٹی سیکورٹی', 0, 1, 31, 'ur', '2018-04-12 03:57:10', NULL),
(472, 63, 'بحالی / مرمت', 0, 1, 32, 'ur', '2018-04-12 03:57:10', NULL),
(473, 15, 'بزنس سسٹم تجزیہ کار', 0, 1, 33, 'ur', '2018-04-12 03:57:10', NULL),
(474, 104, 'بھرتی', 0, 1, 34, 'ur', '2018-04-12 03:57:10', NULL),
(475, 105, 'بھرتی', 0, 1, 35, 'ur', '2018-04-12 03:57:10', NULL),
(476, 12, 'بینک آپریشن', 0, 1, 36, 'ur', '2018-04-12 03:57:10', NULL),
(477, 96, 'پراجیکٹ مینجمنٹ کنسلٹنٹ', 0, 1, 37, 'ur', '2018-04-12 03:57:10', NULL),
(478, 112, 'پرچون', 0, 1, 38, 'ur', '2018-04-12 03:57:10', NULL),
(479, 113, 'پرچون اور تھوک', 0, 1, 39, 'ur', '2018-04-12 03:57:10', NULL),
(480, 114, 'پرچون خریدار', 0, 1, 40, 'ur', '2018-04-12 03:57:10', NULL),
(481, 86, 'پرنٹ میڈیا', 0, 1, 41, 'ur', '2018-04-12 03:57:10', NULL),
(482, 87, 'پرنٹنگ', 0, 1, 42, 'ur', '2018-04-12 03:57:10', NULL),
(483, 89, 'پروڈکٹ ڈویلپر', 0, 1, 43, 'ur', '2018-04-12 03:57:10', NULL),
(484, 92, 'پروڈکٹ مینجمنٹ', 0, 1, 44, 'ur', '2018-04-12 03:57:10', NULL),
(485, 85, 'پی آر', 0, 1, 45, 'ur', '2018-04-12 03:57:10', NULL),
(486, 93, 'پیداوار', 0, 1, 46, 'ur', '2018-04-12 03:57:10', NULL),
(487, 94, 'پیداوار اور کوالٹی کنٹرول', 0, 1, 47, 'ur', '2018-04-12 03:57:10', NULL),
(488, 107, 'تحقیق اور ترقی (آر اینڈ ڈی)', 0, 1, 48, 'ur', '2018-04-12 03:57:10', NULL),
(489, 108, 'تحقیق اور تشخیص', 0, 1, 49, 'ur', '2018-04-12 03:57:10', NULL),
(490, 109, 'تحقیق اور فیلوشپس', 0, 1, 50, 'ur', '2018-04-12 03:57:10', NULL),
(491, 23, 'تخلیقی ڈیزائن', 0, 1, 51, 'ur', '2018-04-12 03:57:10', NULL),
(492, 24, 'تخلیقی مصنف', 0, 1, 52, 'ur', '2018-04-12 03:57:10', NULL),
(493, 139, 'تربیت اور ترقی', 0, 1, 53, 'ur', '2018-04-12 03:57:10', NULL),
(494, 29, 'ترقی', 0, 1, 54, 'ur', '2018-04-12 03:57:10', NULL),
(495, 97, 'تعلقات عامہ', 0, 1, 55, 'ur', '2018-04-12 03:57:10', NULL),
(496, 31, 'تعلیم اور تربیت', 0, 1, 56, 'ur', '2018-04-12 03:57:10', NULL),
(497, 30, 'تقسیم اور لاجسٹکس', 0, 1, 57, 'ur', '2018-04-12 03:57:10', NULL),
(498, 136, 'تکنیکی مصنف', 0, 1, 58, 'ur', '2018-04-12 03:57:10', NULL),
(499, 121, 'تلاش انجن کی اصلاح (SEO)', 0, 1, 59, 'ur', '2018-04-12 03:57:10', NULL),
(500, 52, 'تنصیب اور مرمت', 0, 1, 60, 'ur', '2018-04-12 03:57:10', NULL),
(501, 142, 'ٹائپنگ', 0, 1, 61, 'ur', '2018-04-12 03:57:10', NULL),
(502, 141, 'ٹی ایس آر', 0, 1, 62, 'ur', '2018-04-12 03:57:10', NULL),
(503, 137, 'ٹیلی سیل نمائندے', 0, 1, 63, 'ur', '2018-04-12 03:57:10', NULL),
(504, 138, 'ٹیلی مارکیٹنگ', 0, 1, 64, 'ur', '2018-04-12 03:57:10', NULL),
(505, 125, 'چوکیدار', 0, 1, 65, 'ur', '2018-04-12 03:57:10', NULL),
(506, 88, 'حصولی کے', 0, 1, 66, 'ur', '2018-04-12 03:57:10', NULL),
(507, 117, 'حفاظت اور ماحول', 0, 1, 67, 'ur', '2018-04-12 03:57:10', NULL),
(508, 116, 'خوردہ تجارت', 0, 1, 68, 'ur', '2018-04-12 03:57:10', NULL),
(509, 115, 'خوردہ خریداری', 0, 1, 69, 'ur', '2018-04-12 03:57:10', NULL),
(510, 53, 'داخلہ ڈیزائنرز اور آرکیٹیکٹس', 0, 1, 70, 'ur', '2018-04-12 03:57:10', NULL),
(511, 50, 'درآمد برآمد', 0, 1, 71, 'ur', '2018-04-12 03:57:10', NULL),
(512, 26, 'ڈیٹا انٹری', 0, 1, 72, 'ur', '2018-04-12 03:57:10', NULL),
(513, 27, 'ڈیٹا انٹری آپریٹر', 0, 1, 73, 'ur', '2018-04-12 03:57:10', NULL),
(514, 28, 'ڈیٹا بیس کی انتظامیہ (ڈی بی اے)', 0, 1, 74, 'ur', '2018-04-12 03:57:10', NULL),
(515, 111, 'ریسٹورانٹ مینجمنٹ', 0, 1, 75, 'ur', '2018-04-12 03:57:10', NULL),
(516, 129, 'سافٹ ویئر انجینئر', 0, 1, 76, 'ur', '2018-04-12 03:57:10', NULL),
(517, 128, 'سافٹ ویئر اور ویب ڈویلپمنٹ', 0, 1, 77, 'ur', '2018-04-12 03:57:10', NULL),
(518, 130, 'سافٹ ویئر کی جانچ', 0, 1, 78, 'ur', '2018-04-12 03:57:10', NULL),
(519, 56, 'سرمایہ کاری کے آپریشنز', 0, 1, 79, 'ur', '2018-04-12 03:57:10', NULL),
(520, 134, 'سسٹم تجزیہ کار', 0, 1, 80, 'ur', '2018-04-12 03:57:10', NULL),
(521, 122, 'سیکرٹری، کلریکل اور فرنٹ آفس', 0, 1, 81, 'ur', '2018-04-12 03:57:10', NULL),
(522, 123, 'سیکورٹی', 0, 1, 82, 'ur', '2018-04-12 03:57:10', NULL),
(523, 124, 'سیکورٹی اور ماحولیات', 0, 1, 83, 'ur', '2018-04-12 03:57:10', NULL),
(524, 118, 'سیلز', 0, 1, 84, 'ur', '2018-04-12 03:57:10', NULL),
(525, 119, 'سیلز اور کاروباری ترقی', 0, 1, 85, 'ur', '2018-04-12 03:57:10', NULL),
(526, 120, 'سیلز سپورٹ', 0, 1, 86, 'ur', '2018-04-12 03:57:10', NULL),
(527, 43, 'صحت اور تحفظ', 0, 1, 87, 'ur', '2018-04-12 03:57:10', NULL),
(528, 42, 'صحت اور دوا', 0, 1, 88, 'ur', '2018-04-12 03:57:10', NULL),
(529, 45, 'صحت سے متعلق', 0, 1, 89, 'ur', '2018-04-12 03:57:10', NULL),
(530, 44, 'صحت کی دیکھ بھال', 0, 1, 90, 'ur', '2018-04-12 03:57:10', NULL),
(531, 51, 'صنعتی پیداوار', 0, 1, 91, 'ur', '2018-04-12 03:57:10', NULL),
(532, 74, 'طب', 0, 1, 92, 'ur', '2018-04-12 03:57:10', NULL),
(533, 73, 'طبی', 0, 1, 93, 'ur', '2018-04-12 03:57:10', NULL),
(534, 132, 'فراہمی کا سلسلہ', 0, 1, 94, 'ur', '2018-04-12 03:57:10', NULL),
(535, 133, 'فراہمی کا سلسلہ انتظام', 0, 1, 95, 'ur', '2018-04-12 03:57:10', NULL),
(536, 39, 'فرنٹ ڈیسک آفیسر', 0, 1, 96, 'ur', '2018-04-12 03:57:10', NULL),
(537, 11, 'فن تعمیر', 0, 1, 97, 'ur', '2018-04-12 03:57:10', NULL),
(538, 37, 'فیلڈ آپریشنز', 0, 1, 98, 'ur', '2018-04-12 03:57:10', NULL),
(539, 59, 'قانونی اور کارپوریٹ امور', 0, 1, 99, 'ur', '2018-04-12 03:57:10', NULL),
(540, 61, 'قانونی تحقیق', 0, 1, 100, 'ur', '2018-04-12 03:57:10', NULL),
(541, 60, 'قانونی معاملات', 0, 1, 101, 'ur', '2018-04-12 03:57:10', NULL),
(542, 22, 'کارپوریٹ افیئرز', 0, 1, 102, 'ur', '2018-04-12 03:57:10', NULL),
(543, 14, 'کاروبار کے انتظام', 0, 1, 103, 'ur', '2018-04-12 03:57:10', NULL),
(544, 13, 'کاروبار کی ترقی', 0, 1, 104, 'ur', '2018-04-12 03:57:10', NULL),
(545, 95, 'کام کی ترتیب لگانا', 0, 1, 105, 'ur', '2018-04-12 03:57:10', NULL),
(546, 25, 'کسٹمر سپورٹ', 0, 1, 106, 'ur', '2018-04-12 03:57:10', NULL),
(547, 17, 'کلائنٹ سروسز اور کسٹمر سپورٹ', 0, 1, 107, 'ur', '2018-04-12 03:57:10', NULL),
(548, 16, 'کلریکل', 0, 1, 108, 'ur', '2018-04-12 03:57:10', NULL),
(549, 19, 'کمپیوٹر نیٹ ورکنگ', 0, 1, 109, 'ur', '2018-04-12 03:57:10', NULL),
(550, 18, 'کمپیوٹر ہارڈ ویئر', 0, 1, 110, 'ur', '2018-04-12 03:57:10', NULL),
(551, 20, 'کنسلٹنٹ', 0, 1, 111, 'ur', '2018-04-12 03:57:10', NULL),
(552, 101, 'کوالٹی اشورینس (QA)', 0, 1, 112, 'ur', '2018-04-12 03:57:10', NULL),
(553, 102, 'کوالٹی کنٹرول', 0, 1, 113, 'ur', '2018-04-12 03:57:10', NULL),
(554, 40, 'گرافک ڈیزائن', 0, 1, 114, 'ur', '2018-04-12 03:57:10', NULL),
(555, 143, 'گودام', 0, 1, 115, 'ur', '2018-04-12 03:57:10', NULL),
(556, 62, 'لاجسٹکس اور گودام', 0, 1, 116, 'ur', '2018-04-12 03:57:10', NULL),
(557, 69, 'مارکیٹنگ', 0, 1, 117, 'ur', '2018-04-12 03:57:10', NULL),
(558, 70, 'مارکیٹنگ', 0, 1, 118, 'ur', '2018-04-12 03:57:10', NULL),
(559, 110, 'محقق', 0, 1, 119, 'ur', '2018-04-12 03:57:10', NULL),
(560, 106, 'مرمت اور ختم', 0, 1, 120, 'ur', '2018-04-12 03:57:10', NULL),
(561, 146, 'مصنف', 0, 1, 121, 'ur', '2018-04-12 03:57:10', NULL),
(562, 90, 'مصنوعات کی ترقی', 0, 1, 122, 'ur', '2018-04-12 03:57:10', NULL),
(563, 91, 'مصنوعات کی ترقی', 0, 1, 123, 'ur', '2018-04-12 03:57:10', NULL),
(564, 100, 'معیار تحقیق', 0, 1, 124, 'ur', '2018-04-12 03:57:10', NULL),
(565, 103, 'معیار معائنہ', 0, 1, 125, 'ur', '2018-04-12 03:57:10', NULL),
(566, 83, 'منصوبہ بندی', 0, 1, 126, 'ur', '2018-04-12 03:57:10', NULL),
(567, 84, 'منصوبہ بندی اور ترقی', 0, 1, 127, 'ur', '2018-04-12 03:57:10', NULL),
(568, 21, 'مواد مصنف', 0, 1, 128, 'ur', '2018-04-12 03:57:10', NULL),
(569, 71, 'میڈیا - پرنٹ اور الیکٹرانک', 0, 1, 129, 'ur', '2018-04-12 03:57:10', NULL),
(570, 72, 'میڈیا اور ایڈورٹائزنگ', 0, 1, 130, 'ur', '2018-04-12 03:57:10', NULL),
(571, 65, 'مینجمنٹ انفارمیشن سسٹم (ایم آئی ایس)', 0, 1, 131, 'ur', '2018-04-12 03:57:10', NULL),
(572, 64, 'مینجمنٹ کنسلٹنگ', 0, 1, 132, 'ur', '2018-04-12 03:57:10', NULL),
(573, 67, 'مینوفیکچرنگ', 0, 1, 133, 'ur', '2018-04-12 03:57:10', NULL),
(574, 68, 'مینوفیکچرنگ اور آپریشنز', 0, 1, 134, 'ur', '2018-04-12 03:57:10', NULL),
(575, 66, 'مینیجر', 0, 1, 135, 'ur', '2018-04-12 03:57:10', NULL),
(576, 140, 'نقل و حمل اور گودام', 0, 1, 136, 'ur', '2018-04-12 03:57:10', NULL),
(577, 77, 'نگرانی اور تشخیص (ایم اینڈ ای)', 0, 1, 137, 'ur', '2018-04-12 03:57:10', NULL),
(578, 78, 'نیٹ ورک ایڈمنسٹریشن', 0, 1, 138, 'ur', '2018-04-12 03:57:10', NULL),
(579, 79, 'نیٹ ورک آپریشن', 0, 1, 139, 'ur', '2018-04-12 03:57:10', NULL),
(580, 41, 'ہارڈ ویئر', 0, 1, 140, 'ur', '2018-04-12 03:57:10', NULL),
(581, 47, 'ہوٹل / ریسٹورانٹ مینجمنٹ', 0, 1, 141, 'ur', '2018-04-12 03:57:10', NULL),
(582, 46, 'ہوٹل مینجمنٹ', 0, 1, 142, 'ur', '2018-04-12 03:57:10', NULL),
(583, 75, 'واپسی', 0, 1, 143, 'ur', '2018-04-12 03:57:10', NULL),
(584, 76, 'واپسی اور پروڈکٹ مینجمنٹ', 0, 1, 144, 'ur', '2018-04-12 03:57:10', NULL),
(585, 144, 'ویب ڈویلپر', 0, 1, 145, 'ur', '2018-04-12 03:57:10', NULL),
(586, 145, 'ویب مارکیٹنگ', 0, 1, 146, 'ur', '2018-04-12 03:57:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `genders`
--

CREATE TABLE `genders` (
  `id` int(10) UNSIGNED NOT NULL,
  `gender_id` int(11) DEFAULT 0,
  `gender` varchar(30) DEFAULT NULL,
  `jp_gender` varchar(55) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `genders`
--

INSERT INTO `genders` (`id`, `gender_id`, `gender`, `jp_gender`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 0, 'Male', '男性', 0, NULL, 99999, 'en', '2023-06-08 03:01:18', NULL),
(2, 0, 'Female', '女性', 0, NULL, 99999, 'en', '2023-06-08 03:01:18', NULL),
(3, 0, 'Non-binary', 'ノンバイナリー', 0, NULL, 99999, 'en', '2023-06-08 03:01:18', NULL),
(4, 0, 'Genderqueer', 'ジェンダークィア', 0, NULL, 99999, 'en', '2023-06-08 03:01:18', NULL),
(5, 0, 'Genderfluid', 'ジェンダーフルイド', 0, NULL, 99999, 'en', '2023-06-08 03:01:18', NULL),
(6, 0, 'Agender', 'アジェンダー', 0, NULL, 99999, 'en', '2023-06-08 03:01:18', NULL),
(7, 0, 'Bigender', 'バイジェンダー', 0, NULL, 99999, 'en', '2023-06-08 03:01:18', NULL),
(8, 0, 'Two-Spirit', 'ツースピリット', 0, NULL, 99999, 'en', '2023-06-08 03:01:18', NULL),
(9, 0, 'Androgynous', 'アンドロジノス', 0, NULL, 99999, 'en', '2023-06-08 03:01:18', NULL),
(10, 0, 'Transgender', 'トランスジェンダー', 0, NULL, 99999, 'en', '2023-06-08 03:01:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `growths`
--

CREATE TABLE `growths` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `short_title` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `leftimage` varchar(255) NOT NULL,
  `rightimage` varchar(255) NOT NULL,
  `note` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `growths`
--

INSERT INTO `growths` (`id`, `short_title`, `title`, `leftimage`, `rightimage`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 'スタートアップから大企業まで多数導入', '累計22,300社を超える企業が スカウトを実践', '1680878498.png', '1680878498..png', '※各種数値は2022年10月末時点', '1', '2023-04-07 08:21:26', '2023-04-07 08:41:38');

-- --------------------------------------------------------

--
-- Table structure for table `industries`
--

CREATE TABLE `industries` (
  `id` int(10) UNSIGNED NOT NULL,
  `industry_id` int(11) DEFAULT 0,
  `industry` varchar(150) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `is_default` tinyint(1) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `industries`
--

INSERT INTO `industries` (`id`, `industry_id`, `industry`, `is_active`, `sort_order`, `lang`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 1, 'Information Technology', 1, 34, 'en', 1, '2018-03-29 23:18:57', '2018-04-11 15:47:32'),
(2, 2, 'Telecommunication/ISP', 1, 54, 'en', 1, '2018-03-29 23:19:40', '2018-04-11 15:47:22'),
(3, 3, 'Banking/Financial Services', 1, 10, 'en', 1, '2018-03-29 23:20:18', '2018-04-11 15:47:43'),
(4, 4, 'Fast Moving Consumer Goods (FMCG)', 1, 25, 'en', 1, '2018-03-29 23:20:44', '2018-04-11 15:47:43'),
(5, 5, 'Pharmaceuticals/Clinical Research', 1, 44, 'en', 1, '2018-03-29 23:21:15', '2018-04-11 15:47:26'),
(6, 6, 'Insurance / Takaful', 1, 35, 'en', 1, '2018-03-29 23:21:37', '2018-04-11 15:47:32'),
(7, 7, 'Advertising/PR', 1, 3, 'en', 1, '2018-03-29 23:22:06', '2018-04-11 15:47:42'),
(8, 8, 'Accounting/Taxation', 1, 2, 'en', 1, '2018-03-29 23:22:36', '2018-04-11 15:47:46'),
(9, 9, 'Textiles/Garments', 1, 55, 'en', 1, '2018-03-29 23:22:58', '2018-04-11 15:47:22'),
(10, 10, 'Manufacturing', 1, 38, 'en', 1, '2018-03-29 23:23:17', '2018-04-11 15:47:32'),
(11, 11, 'Education/Training', 1, 20, 'en', 1, '2018-03-29 23:23:40', '2018-04-11 15:47:43'),
(12, 12, 'Chemicals', 1, 15, 'en', 1, '2018-03-29 23:24:09', '2018-04-11 15:47:43'),
(13, 13, 'Agriculture/Fertilizer/Pesticide', 1, 4, 'en', 1, '2018-03-29 23:24:35', '2018-04-11 15:47:43'),
(15, 15, 'Hotel Management / Restaurants', 1, 32, 'en', 1, '2018-03-30 15:19:07', '2018-04-11 15:47:32'),
(16, 16, 'Mining/Oil & Gas/Petroleum', 1, 40, 'en', 1, '2018-03-30 23:07:57', '2018-04-11 15:47:25'),
(17, 17, 'Construction/Cement/Metals', 1, 16, 'en', 1, '2018-04-06 16:01:02', '2018-04-11 15:47:43'),
(18, 18, 'Media/Communications', 1, 39, 'en', 1, '2018-04-06 16:01:02', '2018-04-11 15:47:25'),
(19, 19, 'Law Firms/Legal', 1, 37, 'en', 1, '2018-04-06 16:01:02', '2018-04-11 15:47:32'),
(20, 20, 'Arts / Entertainment', 1, 7, 'en', 1, '2018-04-06 16:01:02', '2018-04-11 15:47:43'),
(21, 21, 'Broadcasting', 1, 12, 'en', 1, '2018-04-06 16:01:02', '2018-04-11 15:47:43'),
(22, 22, 'Business Development', 1, 13, 'en', 1, '2018-04-06 16:01:02', '2018-04-11 15:47:43'),
(23, 23, 'Publishing/Printing', 1, 47, 'en', 1, '2018-04-06 16:01:02', '2018-04-11 15:47:22'),
(24, 24, 'Travel/Tourism/Transportation', 1, 57, 'en', 1, '2018-04-06 16:01:02', '2018-04-11 15:47:22'),
(25, 25, 'Services', 1, 52, 'en', 1, '2018-04-06 16:01:02', '2018-04-11 15:47:22'),
(26, 26, 'Retail', 1, 50, 'en', 1, '2018-04-06 16:01:02', '2018-04-11 15:47:22'),
(27, 27, 'N.G.O./Social Services', 1, 41, 'en', 1, '2018-04-06 16:01:02', '2018-04-11 15:47:25'),
(28, 28, 'Electronics', 1, 21, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(29, 29, 'Engineering', 1, 22, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(30, 30, 'Call Center', 1, 14, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(31, 31, 'AutoMobile', 1, 8, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(32, 32, 'Fashion', 1, 24, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(33, 33, 'Architecture/Interior Design', 1, 6, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(34, 34, 'BPO', 1, 11, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(35, 35, 'Event Management', 1, 23, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(36, 36, 'Gems &amp; Jewelery', 1, 27, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(37, 37, 'Government', 1, 28, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(38, 38, 'Health & Fitness', 1, 29, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:32'),
(39, 39, 'Healthcare/Hospital/Medical', 1, 30, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:32'),
(40, 40, 'Hospitality', 1, 31, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:32'),
(41, 41, 'Courier/Logistics', 1, 18, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(42, 42, 'Power/Energy', 1, 45, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:26'),
(43, 43, 'Recruitment/Employment Firms', 1, 49, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:22'),
(44, 44, 'Real Estate/Property', 1, 48, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:22'),
(45, 45, 'Security/Law Enforcement', 1, 51, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:22'),
(46, 46, 'Shipping/Marine', 1, 53, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:22'),
(47, 47, 'Project Management', 1, 46, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:26'),
(48, 48, 'Importers/ Distributors/Exporters', 1, 33, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:32'),
(49, 49, 'Consultants', 1, 17, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(50, 50, 'Packaging', 1, 42, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:25'),
(51, 51, 'Personal Care and Services', 1, 43, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:25'),
(52, 52, 'Investments', 1, 36, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:32'),
(53, 53, 'Apparel/Clothing', 1, 5, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(54, 54, 'Food & Beverages', 1, 26, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(55, 55, 'Tiles & Ceramics', 1, 56, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:22'),
(56, 56, 'Warehousing', 1, 58, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:22'),
(57, 57, 'Distribution and Logistics', 1, 19, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(58, 58, 'Aviation', 1, 9, 'en', 1, '2018-04-06 20:38:46', '2018-04-11 15:47:43'),
(59, 1, 'انفارمیشن ٹیکنالوجی', 1, 6, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(60, 2, 'ٹیلی مواصلات / آئی ایس پی', 1, 43, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(61, 3, 'بینکنگ / مالیاتی خدمات', 1, 14, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(62, 4, 'فاسٹ منتقل کنڈومر سامان (ایف ایم سی جی)', 1, 33, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(63, 5, 'دواسازی / کلینکیکل ریسرچ', 1, 23, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(64, 6, 'انشورنس / تاکافول', 1, 5, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(65, 7, 'ایڈورٹائزنگ / پی آر', 1, 10, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(66, 8, 'اکاؤنٹنگ / ٹیکس', 1, 7, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(67, 9, 'ٹیکسٹائل / گارمنٹس', 1, 44, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(68, 10, 'مینوفیکچرنگ', 1, 40, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(69, 11, 'تعلیم / تربیت', 1, 15, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(70, 12, 'کیمیکل', 1, 54, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:39'),
(71, 13, 'زراعت / ارورائزر / کیٹناشک', 1, 26, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(72, 15, 'ہوٹل مینجمنٹ / ریستوراں', 1, 57, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:39'),
(73, 16, 'کان کنی / تیل & amp؛ گیس / پٹرولیم', 1, 51, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(74, 17, 'تعمیراتی / سیمنٹ / دھاتیں', 1, 16, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(75, 18, 'میڈیا / مواصلات', 1, 41, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(76, 19, 'قانون فرم / قانونی', 1, 37, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(77, 20, 'آرٹس / تفریح', 1, 1, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(78, 21, 'براڈ کاسٹننگ', 1, 11, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(79, 22, 'کاروبار کی ترقی', 1, 48, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(80, 23, 'اشاعت / پرنٹنگ', 1, 2, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(81, 24, 'سفر / سیاحت / نقل و حمل', 1, 28, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(82, 25, 'خدمات', 1, 21, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(83, 26, 'پرچون', 1, 46, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(84, 27, 'این جی او / سماجی خدمات', 1, 8, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(85, 28, 'الیکٹرانکس', 1, 3, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(86, 29, 'انجینئرنگ', 1, 4, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(87, 30, 'کال سینٹر', 1, 49, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(88, 31, 'گاڑی', 1, 55, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:39'),
(89, 32, 'فیشن', 1, 36, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(90, 33, 'فن تعمیر / داخلہ ڈیزائن', 1, 34, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(91, 34, 'بی پی او', 1, 13, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(92, 35, 'تقریب کے انتظامات', 1, 17, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(93, 36, 'جواہرات & amp؛ زیورات', 1, 19, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(94, 37, 'حکومت', 1, 20, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(95, 38, 'صحت اور AMP؛ صحت', 1, 31, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(96, 39, 'صحت کی دیکھ بھال / ہسپتال / میڈیکل', 1, 32, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(97, 40, 'مہمان', 1, 39, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(98, 41, 'کورئیر / لاجسٹکس', 1, 53, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:39'),
(99, 42, 'پاور / توانائی', 1, 45, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(100, 43, 'بھرتی / روزگار کی اداروں', 1, 12, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(101, 44, 'رئیل اسٹیٹ / جائیداد', 1, 25, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(102, 45, 'سیکورٹی / قانون نافذ کرنے والی', 1, 29, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(103, 46, 'شپنگ / میرین', 1, 30, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(104, 47, 'کام کی ترتیب لگانا', 1, 50, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(105, 48, 'درآمد کنندگان / ڈسٹریبیوٹر / ایکسپورٹرز', 1, 22, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(106, 49, 'کنسلٹنٹس', 1, 52, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:39'),
(107, 50, 'پیکیجنگ', 1, 47, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(108, 51, 'ذاتی دیکھ بھال اور خدمات', 1, 24, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(109, 52, 'سرمایہ کاری', 1, 27, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(110, 53, 'لباس / لباس', 1, 38, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(111, 54, 'فوڈ / مشروبات', 1, 35, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(112, 55, 'ٹائلی سیرامک', 1, 42, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(113, 56, 'گودام', 1, 56, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:39'),
(114, 57, 'تقسیم اور لاجسٹکس', 1, 18, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(115, 58, 'ایوی ایشن', 1, 9, 'ur', 0, '2018-04-06 20:39:36', '2018-04-11 15:48:18'),
(116, 1, 'تكنولوجيا المعلومات', 1, 46, 'ar', 0, '2018-04-11 04:05:22', NULL),
(117, 2, 'الاتصالات / ISP', 1, 4, 'ar', 0, '2018-04-11 04:05:23', NULL),
(118, 3, 'الخدمات المصرفية / المالية', 1, 21, 'ar', 0, '2018-04-11 04:05:23', NULL),
(119, 4, 'السلع الاستهلاكية السريعة الحركة (سلع استهلاكية)', 1, 25, 'ar', 0, '2018-04-11 04:05:23', NULL),
(120, 5, 'الصيدلة / البحوث السريرية', 1, 28, 'ar', 0, '2018-04-11 04:05:23', NULL),
(121, 6, 'التأمين / التكافل', 1, 12, 'ar', 0, '2018-04-11 04:05:23', NULL),
(122, 7, 'الإعلان / العلاقات العامة', 1, 7, 'ar', 0, '2018-04-11 04:05:23', NULL),
(123, 8, 'المحاسبة / الضرائب', 1, 34, 'ar', 0, '2018-04-11 04:05:23', NULL),
(124, 9, 'المنسوجات / الملابس', 1, 37, 'ar', 0, '2018-04-11 04:05:23', NULL),
(125, 10, 'تصنيع', 1, 44, 'ar', 0, '2018-04-11 04:05:23', NULL),
(126, 11, 'التعليم / التدريب', 1, 17, 'ar', 0, '2018-04-11 04:05:23', NULL),
(127, 12, 'مواد كيميائية', 1, 54, 'ar', 0, '2018-04-11 04:05:23', NULL),
(128, 13, 'الزراعة / الأسمدة / المبيدات', 1, 23, 'ar', 0, '2018-04-11 04:05:23', NULL),
(129, 15, 'إدارة الفنادق / المطاعم', 1, 39, 'ar', 0, '2018-04-11 04:05:23', NULL),
(130, 16, 'التعدين / النفط & أمبير ؛ الغاز / البترول', 1, 16, 'ar', 0, '2018-04-11 04:05:23', NULL),
(131, 17, 'البناء / إسمنت / معادن', 1, 11, 'ar', 0, '2018-04-11 04:05:23', NULL),
(132, 18, 'وسائل الإعلام / الاتصالات', 1, 57, 'ar', 0, '2018-04-11 04:05:23', NULL),
(133, 19, 'شركات قانونية / قانونية', 1, 50, 'ar', 0, '2018-04-11 04:05:23', NULL),
(134, 20, 'فنون وترفيه', 1, 52, 'ar', 0, '2018-04-11 04:05:23', NULL),
(135, 21, 'إذاعة', 1, 40, 'ar', 0, '2018-04-11 04:05:23', NULL),
(136, 22, 'تطوير الاعمال', 1, 45, 'ar', 0, '2018-04-11 04:05:23', NULL),
(137, 23, 'النشر / الطبعة', 1, 38, 'ar', 0, '2018-04-11 04:05:23', NULL),
(138, 24, 'السفر / السياحة / وسائل النقل', 1, 24, 'ar', 0, '2018-04-11 04:05:23', NULL),
(139, 25, 'خدمات', 1, 48, 'ar', 0, '2018-04-11 04:05:23', NULL),
(140, 26, 'التجزئة', 1, 13, 'ar', 0, '2018-04-11 04:05:23', NULL),
(141, 27, 'N.G.O./ الخدمات الاجتماعية', 1, 2, 'ar', 0, '2018-04-11 04:05:23', NULL),
(142, 28, 'إلكترونيات', 1, 41, 'ar', 0, '2018-04-11 04:05:23', NULL),
(143, 29, 'هندسة', 1, 56, 'ar', 0, '2018-04-11 04:05:23', NULL),
(144, 30, 'مركز الاتصال', 1, 53, 'ar', 0, '2018-04-11 04:05:23', NULL),
(145, 31, 'سيارة', 1, 49, 'ar', 0, '2018-04-11 04:05:23', NULL),
(146, 32, 'موضه', 1, 55, 'ar', 0, '2018-04-11 04:05:23', NULL),
(147, 33, 'العمارة / التصميم الداخلي', 1, 31, 'ar', 0, '2018-04-11 04:05:23', NULL),
(148, 34, 'BPO', 1, 1, 'ar', 0, '2018-04-11 04:05:23', NULL),
(149, 35, 'أدارة الحدث', 1, 42, 'ar', 0, '2018-04-11 04:05:23', NULL),
(150, 36, 'الأحجار الكريمة & amp؛ مجوهرات', 1, 8, 'ar', 0, '2018-04-11 04:05:23', NULL),
(151, 37, 'الحكومي', 1, 20, 'ar', 0, '2018-04-11 04:05:23', NULL),
(152, 38, 'الصحة & أمبير ؛ اللياقه البدنيه', 1, 27, 'ar', 0, '2018-04-11 04:05:23', NULL),
(153, 39, 'الرعاية الصحية / مستشفى طب /', 1, 22, 'ar', 0, '2018-04-11 04:05:23', NULL),
(154, 40, 'حسن الضيافة', 1, 47, 'ar', 0, '2018-04-11 04:05:23', NULL),
(155, 41, 'البريد السريع / اللوجستية', 1, 10, 'ar', 0, '2018-04-11 04:05:23', NULL),
(156, 42, 'الطاقة الكهربائية', 1, 29, 'ar', 0, '2018-04-11 04:05:23', NULL),
(157, 43, 'التوظيف / شركات التوظيف', 1, 19, 'ar', 0, '2018-04-11 04:05:23', NULL),
(158, 44, 'العقارات', 1, 30, 'ar', 0, '2018-04-11 04:05:23', NULL),
(159, 45, 'الأمن / إنفاذ القانون', 1, 9, 'ar', 0, '2018-04-11 04:05:23', NULL),
(160, 46, 'الشحن / البحرية', 1, 26, 'ar', 0, '2018-04-11 04:05:23', NULL),
(161, 47, 'ادارة مشروع', 1, 3, 'ar', 0, '2018-04-11 04:05:23', NULL),
(162, 48, 'المستوردين / الموزعين / المصدرين', 1, 35, 'ar', 0, '2018-04-11 04:05:23', NULL),
(163, 49, 'الاستشاريين', 1, 6, 'ar', 0, '2018-04-11 04:05:23', NULL),
(164, 50, 'التعبئة والتغليف', 1, 15, 'ar', 0, '2018-04-11 04:05:23', NULL),
(165, 51, 'العناية الشخصية والخدمات', 1, 32, 'ar', 0, '2018-04-11 04:05:23', NULL),
(166, 52, 'الاستثمارات', 1, 5, 'ar', 0, '2018-04-11 04:05:23', NULL),
(167, 53, 'الملابس / الملابس', 1, 36, 'ar', 0, '2018-04-11 04:05:23', NULL),
(168, 54, 'الغذاء & أمبير ؛ مشروبات', 1, 33, 'ar', 0, '2018-04-11 04:05:23', NULL),
(169, 55, 'بلاط و أمبير ؛ سيراميك', 1, 43, 'ar', 0, '2018-04-11 04:05:23', NULL),
(170, 56, 'التخزين', 1, 14, 'ar', 0, '2018-04-11 04:05:23', NULL),
(171, 57, 'التوزيع والخدمات اللوجستية', 1, 18, 'ar', 0, '2018-04-11 04:05:23', NULL),
(172, 58, 'طيران', 1, 51, 'ar', 0, '2018-04-11 04:05:23', NULL),
(173, 1, 'tecnología Información', 1, 54, 'es', 0, '2018-04-11 04:07:07', NULL),
(174, 2, 'Telecomunicaciones / ISP', 1, 55, 'es', 0, '2018-04-11 04:07:07', NULL),
(175, 3, 'Servicios bancarios / financieros', 1, 53, 'es', 0, '2018-04-11 04:07:07', NULL),
(176, 4, 'Artículos de consumo de rápido movimiento (FMCG)', 1, 6, 'es', 0, '2018-04-11 04:07:07', NULL),
(177, 5, 'Farmacia / Investigación Clínica', 1, 27, 'es', 0, '2018-04-11 04:07:07', NULL),
(178, 6, 'Seguro / Takaful', 1, 51, 'es', 0, '2018-04-11 04:07:07', NULL),
(179, 7, 'Publicidad / PR', 1, 45, 'es', 0, '2018-04-11 04:07:07', NULL),
(180, 8, 'Contabilidad / Impuestos', 1, 15, 'es', 0, '2018-04-11 04:07:07', NULL),
(181, 9, 'Textiles / prendas de vestir', 1, 56, 'es', 0, '2018-04-11 04:07:07', NULL),
(182, 10, 'Fabricación', 1, 26, 'es', 0, '2018-04-11 04:07:07', NULL),
(183, 11, 'Educación / Entrenamiento', 1, 20, 'es', 0, '2018-04-11 04:07:07', NULL),
(184, 12, 'Productos químicos', 1, 42, 'es', 0, '2018-04-11 04:07:07', NULL),
(185, 13, 'Agricultura / Fertilizante / Pesticida', 1, 1, 'es', 0, '2018-04-11 04:07:07', NULL),
(186, 15, 'Gestión Hotelera / Restaurantes', 1, 32, 'es', 0, '2018-04-11 04:07:07', NULL),
(187, 16, 'Minería / Petróleo y amp; Gas / petróleo', 1, 39, 'es', 0, '2018-04-11 04:07:07', NULL),
(188, 17, 'Construcción / Cemento / Metales', 1, 13, 'es', 0, '2018-04-11 04:07:07', NULL),
(189, 18, 'Medios / Comunicaciones', 1, 38, 'es', 0, '2018-04-11 04:07:07', NULL),
(190, 19, 'Firmas de abogados / legales', 1, 28, 'es', 0, '2018-04-11 04:07:07', NULL),
(191, 20, 'Arte y entretenimiento', 1, 5, 'es', 0, '2018-04-11 04:07:07', NULL),
(192, 21, 'Radiodifusión', 1, 46, 'es', 0, '2018-04-11 04:07:07', NULL),
(193, 22, 'Desarrollo de negocios', 1, 18, 'es', 0, '2018-04-11 04:07:07', NULL),
(194, 23, 'Publicación / impresión', 1, 44, 'es', 0, '2018-04-11 04:07:07', NULL),
(195, 24, 'Viajes / Turismo / Transporte', 1, 57, 'es', 0, '2018-04-11 04:07:07', NULL),
(196, 25, 'Servicios', 1, 52, 'es', 0, '2018-04-11 04:07:07', NULL),
(197, 26, 'Al por menor', 1, 2, 'es', 0, '2018-04-11 04:07:07', NULL),
(198, 27, 'N.G.O./Social Services', 1, 41, 'es', 0, '2018-04-11 04:07:07', NULL),
(199, 28, 'Electrónica', 1, 21, 'es', 0, '2018-04-11 04:07:07', NULL),
(200, 29, 'Ingenieria', 1, 36, 'es', 0, '2018-04-11 04:07:07', NULL),
(201, 30, 'Centro de llamadas', 1, 11, 'es', 0, '2018-04-11 04:07:07', NULL),
(202, 31, 'Automóvil', 1, 7, 'es', 0, '2018-04-11 04:07:07', NULL),
(203, 32, 'Moda', 1, 40, 'es', 0, '2018-04-11 04:07:07', NULL),
(204, 33, 'Arquitectura / Diseño de interiores', 1, 4, 'es', 0, '2018-04-11 04:07:07', NULL),
(205, 34, 'BPO', 1, 10, 'es', 0, '2018-04-11 04:07:07', NULL),
(206, 35, 'Gestión de eventos', 1, 30, 'es', 0, '2018-04-11 04:07:07', NULL),
(207, 36, 'Gemas y amp; Joyería', 1, 29, 'es', 0, '2018-04-11 04:07:07', NULL),
(208, 37, 'Gobierno', 1, 33, 'es', 0, '2018-04-11 04:07:07', NULL),
(209, 38, 'Salud y amp; Aptitud', 1, 48, 'es', 0, '2018-04-11 04:07:07', NULL),
(210, 39, 'Sanidad / Hospital / Médico', 1, 49, 'es', 0, '2018-04-11 04:07:07', NULL),
(211, 40, 'Hospitalidad', 1, 34, 'es', 0, '2018-04-11 04:07:07', NULL),
(212, 41, 'Correo / Logística', 1, 16, 'es', 0, '2018-04-11 04:07:07', NULL),
(213, 42, 'Energía electrica', 1, 24, 'es', 0, '2018-04-11 04:07:07', NULL),
(214, 43, 'Empresas de reclutamiento / empleo', 1, 23, 'es', 0, '2018-04-11 04:07:07', NULL),
(215, 44, 'Propiedad de bienes raíces', 1, 43, 'es', 0, '2018-04-11 04:07:07', NULL),
(216, 45, 'Seguridad / Aplicación de la ley', 1, 50, 'es', 0, '2018-04-11 04:07:07', NULL),
(217, 46, 'Envío / Marina', 1, 25, 'es', 0, '2018-04-11 04:07:07', NULL),
(218, 47, 'Gestión de proyectos', 1, 31, 'es', 0, '2018-04-11 04:07:07', NULL),
(219, 48, 'Importadores / Distribuidores / Exportadores', 1, 35, 'es', 0, '2018-04-11 04:07:07', NULL),
(220, 49, 'Consultores', 1, 14, 'es', 0, '2018-04-11 04:07:07', NULL),
(221, 50, 'embalaje', 1, 22, 'es', 0, '2018-04-11 04:07:07', NULL),
(222, 51, 'Cuidado y servicios personales', 1, 17, 'es', 0, '2018-04-11 04:07:07', NULL),
(223, 52, 'Inversiones', 1, 37, 'es', 0, '2018-04-11 04:07:07', NULL),
(224, 53, 'Ropa / Ropa', 1, 47, 'es', 0, '2018-04-11 04:07:07', NULL),
(225, 54, 'Comida y amp; Bebidas', 1, 12, 'es', 0, '2018-04-11 04:07:07', NULL),
(226, 55, 'Azulejos y amp; Cerámica', 1, 9, 'es', 0, '2018-04-11 04:07:07', NULL),
(227, 56, 'Almacenaje', 1, 3, 'es', 0, '2018-04-11 04:07:07', NULL),
(228, 57, 'Distribución y Logística', 1, 19, 'es', 0, '2018-04-11 04:07:07', NULL),
(229, 58, 'Aviación', 1, 8, 'es', 0, '2018-04-11 04:07:07', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL DEFAULT 0,
  `sub_category_id` int(11) DEFAULT 0,
  `company_id` int(11) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `benefits` text DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `is_freelance` tinyint(1) DEFAULT 0,
  `career_level_id` int(11) DEFAULT NULL,
  `salary_from` int(11) DEFAULT NULL,
  `salary_to` int(11) DEFAULT NULL,
  `hide_salary` tinyint(1) DEFAULT 0,
  `salary_currency` varchar(5) DEFAULT NULL,
  `salary_period_id` int(11) DEFAULT NULL,
  `functional_area_id` int(11) DEFAULT NULL,
  `job_type_id` int(11) DEFAULT NULL,
  `job_shift_id` int(11) DEFAULT NULL,
  `num_of_positions` int(11) DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `expiry_date` timestamp NULL DEFAULT NULL,
  `degree_level_id` int(11) DEFAULT NULL,
  `job_experience_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 1,
  `is_featured` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `search` text DEFAULT NULL,
  `slug` varchar(210) DEFAULT NULL,
  `reference` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `job_advertiser` varchar(255) DEFAULT NULL,
  `application_url` varchar(255) DEFAULT NULL,
  `json_object` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `category_id`, `sub_category_id`, `company_id`, `title`, `description`, `benefits`, `country_id`, `state_id`, `city_id`, `is_freelance`, `career_level_id`, `salary_from`, `salary_to`, `hide_salary`, `salary_currency`, `salary_period_id`, `functional_area_id`, `job_type_id`, `job_shift_id`, `num_of_positions`, `gender_id`, `expiry_date`, `degree_level_id`, `job_experience_id`, `is_active`, `is_featured`, `created_at`, `updated_at`, `search`, `slug`, `reference`, `location`, `logo`, `type`, `postal_code`, `job_advertiser`, `application_url`, `json_object`) VALUES
(2, 0, 0, 9, 'IOS Developer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin fermentum condimentum mauris, non posuere urna consectetur quis. Suspendisse semper eu eros eget convallis. Etiam mattis blandit nulla, non venenatis risus varius vel. Morbi fringilla dignissim elit id blandit. Pellentesque vel luctus felis. Vestibulum eros nibh, consequat ut felis in, vehicula lobortis quam. Duis diam mauris, convallis in risus in, gravida hendrerit lacus. Donec euismod accumsan sem et aliquam. Duis a velit eget urna mattis ultricies. Aliquam nibh ipsum, aliquet nec sollicitudin non, fermentum nec diam. Vestibulum ac urna vehicula, dapibus dui quis, aliquet neque. Sed ac tristique purus. Vestibulum tempor, erat eu porta tempor, erat ipsum cursus dui, eu tempus mauris leo id mi. Sed ultrices sollicitudin vehicula. Proin in ullamcorper massa.<br /><br />\r\n<ul>\r\n<li>this 1</li>\r\n<li>this is 2</li>\r\n<li>this is 3</li>\r\n</ul>', '<ul>\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\n<li>Nulla consequat metus ac ante semper vehicula.</li>\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\n</ul>', 231, 3919, 42602, 0, 3, 60000, 90000, 0, 'PKR', 1, 128, 3, 1, 4, 2, '2023-06-29 19:00:00', 4, 5, 1, 1, '2018-07-27 16:02:37', '2022-10-05 19:22:13', 'Multimedia Design United States of America Alabama Auburn IOS Developer Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin fermentum condimentum mauris, non posuere urna consectetur quis. Suspendisse semper eu eros eget convallis. Etiam mattis blandit nulla, non venenatis risus varius vel. Morbi fringilla dignissim elit id blandit. Pellentesque vel luctus felis. Vestibulum eros nibh, consequat ut felis in, vehicula lobortis quam. Duis diam mauris, convallis in risus in, gravida hendrerit lacus. Donec euismod accumsan sem et aliquam. Duis a velit eget urna mattis ultricies. Aliquam nibh ipsum, aliquet nec sollicitudin non, fermentum nec diam. Vestibulum ac urna vehicula, dapibus dui quis, aliquet neque. Sed ac tristique purus. Vestibulum tempor, erat eu porta tempor, erat ipsum cursus dui, eu tempus mauris leo id mi. Sed ultrices sollicitudin vehicula. Proin in ullamcorper massa.<br /><br />\r\n<ul>\r\n<li>this 1</li>\r\n<li>this is 2</li>\r\n<li>this is 3</li>\r\n</ul> CSS HTML JavaScript Experienced Professional 60000 90000Monthly Software & Web Development Full Time/Permanent First Shift (Day) Male Bachelors 4 Year', 'ios-developer-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(4, 0, 0, 5, 'Electrical Engineer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tellus libero, rutrum eleifend enim vitae, aliquam fermentum tortor. Morbi facilisis malesuada placerat. Aliquam ipsum metus, scelerisque sit amet libero ac, volutpat molestie lacus. Nam varius leo enim, sit amet aliquet odio varius sed. Vestibulum sodales egestas velit a convallis. Sed aliquam, diam et sagittis tincidunt, nisi nulla fermentum turpis, faucibus interdum lacus turpis ut ligula. Nulla sit amet laoreet enim. Sed lobortis suscipit ipsum eget convallis.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3930, 43593, 1, 3, 35000, 50000, 0, 'USD', 1, 32, 1, 1, 2, 2, '2023-06-29 19:00:00', 4, 3, 1, 1, '2018-07-27 16:10:38', '2022-09-28 08:49:50', 'Power Wave United States of America Florida Aventura Electrical Engineer Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tellus libero, rutrum eleifend enim vitae, aliquam fermentum tortor. Morbi facilisis malesuada placerat. Aliquam ipsum metus, scelerisque sit amet libero ac, volutpat molestie lacus. Nam varius leo enim, sit amet aliquet odio varius sed. Vestibulum sodales egestas velit a convallis. Sed aliquam, diam et sagittis tincidunt, nisi nulla fermentum turpis, faucibus interdum lacus turpis ut ligula. Nulla sit amet laoreet enim. Sed lobortis suscipit ipsum eget convallis. Communication Skills Marketing Sales freelance remote work from home multiple cities Experienced Professional 35000 50000Monthly Electronics Technician Contract First Shift (Day) Male Bachelors 2 Year', 'electrical-engineer-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(5, 0, 0, 8, 'Laravel Developer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tellus libero, rutrum eleifend enim vitae, aliquam fermentum tortor. Morbi facilisis malesuada placerat. Aliquam ipsum metus, scelerisque sit amet libero ac, volutpat molestie lacus. Nam varius leo enim, sit amet aliquet odio varius sed. Vestibulum sodales egestas velit a convallis. Sed aliquam, diam et sagittis tincidunt, nisi nulla fermentum turpis, faucibus interdum lacus turpis ut ligula. Nulla sit amet laoreet enim. Sed lobortis suscipit ipsum eget convallis.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3926, 43396, 0, 3, 45000, 70000, 0, 'USD', 1, 144, 2, 1, 1, 1, '2023-06-29 19:00:00', 4, 5, 1, 1, '2018-07-27 21:11:56', '2022-09-28 08:49:53', 'Travel Advisor United States of America Colorado Canon City Laravel Developer Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tellus libero, rutrum eleifend enim vitae, aliquam fermentum tortor. Morbi facilisis malesuada placerat. Aliquam ipsum metus, scelerisque sit amet libero ac, volutpat molestie lacus. Nam varius leo enim, sit amet aliquet odio varius sed. Vestibulum sodales egestas velit a convallis. Sed aliquam, diam et sagittis tincidunt, nisi nulla fermentum turpis, faucibus interdum lacus turpis ut ligula. Nulla sit amet laoreet enim. Sed lobortis suscipit ipsum eget convallis. CSS HTML MySQL PHP Experienced Professional 45000 70000Monthly Web Developer Freelance First Shift (Day) Female Bachelors 4 Year', 'laravel-developer-5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 0, 0, 4, 'PHP Developer Required', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tellus libero, rutrum eleifend enim vitae, aliquam fermentum tortor. Morbi facilisis malesuada placerat. Aliquam ipsum metus, scelerisque sit amet libero ac, volutpat molestie lacus. Nam varius leo enim, sit amet aliquet odio varius sed. Vestibulum sodales egestas velit a convallis. Sed aliquam, diam et sagittis tincidunt, nisi nulla fermentum turpis, faucibus interdum lacus turpis ut ligula. Nulla sit amet laoreet enim. Sed lobortis suscipit ipsum eget convallis.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3931, 43929, 1, 3, 45000, 70000, 0, 'USD', 1, 144, 1, 1, 1, 2, '2023-06-29 19:00:00', 4, 5, 1, 1, '2018-07-13 16:17:15', '2022-09-28 08:49:55', 'Surf Wave United States of America Georgia Atlanta PHP Developer Required Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tellus libero, rutrum eleifend enim vitae, aliquam fermentum tortor. Morbi facilisis malesuada placerat. Aliquam ipsum metus, scelerisque sit amet libero ac, volutpat molestie lacus. Nam varius leo enim, sit amet aliquet odio varius sed. Vestibulum sodales egestas velit a convallis. Sed aliquam, diam et sagittis tincidunt, nisi nulla fermentum turpis, faucibus interdum lacus turpis ut ligula. Nulla sit amet laoreet enim. Sed lobortis suscipit ipsum eget convallis. MySQL PHP WordPress freelance remote work from home multiple cities Experienced Professional 45000 70000Monthly Web Developer Contract First Shift (Day) Male Bachelors 4 Year', 'php-developer-required-6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(20, 0, 0, 1, 'Php Developer Required', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tellus libero, rutrum eleifend enim vitae, aliquam fermentum tortor. Morbi facilisis malesuada placerat. Aliquam ipsum metus, scelerisque sit amet libero ac, volutpat molestie lacus. Nam varius leo enim, sit amet aliquet odio varius sed. Vestibulum sodales egestas velit a convallis. Sed aliquam, diam et sagittis tincidunt, nisi nulla fermentum turpis, faucibus interdum lacus turpis ut ligula. Nulla sit amet laoreet enim. Sed lobortis suscipit ipsum eget convallis.\r\n\r\nQuisque sit amet nisi vel urna mattis lobortis. Suspendisse non pulvinar magna. Etiam tellus quam, sodales vel semper quis, laoreet eu elit. Maecenas aliquet convallis massa, ac pharetra tellus consequat a. In dictum est non ornare faucibus. Duis malesuada ipsum sed tincidunt aliquam. Cras ullamcorper velit nec tellus bibendum, id varius nunc commodo.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3919, 42594, 0, 3, 5000, 8000, 0, 'USD', 1, 23, 3, 1, 6, NULL, '2023-06-29 19:00:00', 5, 6, 1, 1, '2018-09-17 22:15:54', '2022-09-28 08:49:58', 'Power Color United States of America Alabama Alabaster Php Developer Required Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse tellus libero, rutrum eleifend enim vitae, aliquam fermentum tortor. Morbi facilisis malesuada placerat. Aliquam ipsum metus, scelerisque sit amet libero ac, volutpat molestie lacus. Nam varius leo enim, sit amet aliquet odio varius sed. Vestibulum sodales egestas velit a convallis. Sed aliquam, diam et sagittis tincidunt, nisi nulla fermentum turpis, faucibus interdum lacus turpis ut ligula. Nulla sit amet laoreet enim. Sed lobortis suscipit ipsum eget convallis.\r\n\r\nQuisque sit amet nisi vel urna mattis lobortis. Suspendisse non pulvinar magna. Etiam tellus quam, sodales vel semper quis, laoreet eu elit. Maecenas aliquet convallis massa, ac pharetra tellus consequat a. In dictum est non ornare faucibus. Duis malesuada ipsum sed tincidunt aliquam. Cras ullamcorper velit nec tellus bibendum, id varius nunc commodo. MySQL PHP Strong Communication skills Experienced Professional 5000 8000Monthly Creative Design Full Time/Permanent First Shift (Day) No Preference Masters 5 Year', 'php-developer-required-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(21, 0, 0, 3, 'Web Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3928, 43579, 0, 2, 2000, 5000, 0, 'USD', 1, 28, 4, 1, 4, 2, '2023-06-29 19:00:00', 3, 4, 1, 1, '2018-09-18 08:39:12', '2022-09-28 08:50:00', 'New Design Studio United States of America Delaware Milton Web Designer Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. Adobe Photoshop CSS HTML Entry Level 2000 5000Monthly Database Administration (DBA) Internship First Shift (Day) Male Intermediate/A-Level 3 Year', 'web-designer-21', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(22, 0, 0, 11, 'Frontend Developer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3935, 44403, 0, 3, 5000, 9000, 0, 'USD', 1, 8, 5, 2, 4, 1, '2023-06-29 19:00:00', 2, 3, 1, 1, '2018-09-18 09:07:25', '2022-09-28 08:50:02', 'Sphere United States of America Indiana Clarksville Frontend Developer Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. CSS HTML JavaScript Jquery Experienced Professional 5000 9000Monthly Advertising Part Time Second Shift (Afternoon) Female Matriculation/O-Level 2 Year', 'frontend-developer-22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(23, 0, 0, 7, 'Wordpress Developer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3952, 47610, 0, 3, 5000, 10000, 0, 'USD', 1, 23, 3, 3, 4, 2, '2023-06-29 19:00:00', 8, 6, 1, 1, '2018-09-18 21:29:51', '2022-09-28 08:50:04', 'Connect People United States of America New Hampshire Barrington Wordpress Developer Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. CSS HTML JavaScript WordPress Experienced Professional 5000 10000Monthly Creative Design Full Time/Permanent Third Shift (Night) Male Certification 5 Year', 'wordpress-developer-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(24, 0, 0, 10, 'Senior Php Programer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3960, 45830, 0, 1, 6000, 12000, 0, 'USD', 1, 14, 1, 1, 1, NULL, '2023-06-29 19:00:00', 5, 8, 1, 1, '2018-09-18 21:34:35', '2022-09-28 08:50:06', 'Net Design United States of America Oklahoma Durant Senior Php Programer Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. JavaScript Jquery MySQL PHP Department Head 6000 12000Monthly Business Management Contract First Shift (Day) No Preference Masters 7 Year', 'senior-php-programer-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 0, 0, 9, 'Project Manager', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3932, 44078, 0, 3, 3500, 5000, 0, 'USD', 1, 12, 3, 1, 6, 1, '2023-06-29 19:00:00', 4, 3, 1, 1, '2018-09-18 21:43:04', '2022-09-28 08:50:08', 'Multimedia Design United States of America Hawaii Kaneohe Station Project Manager Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. Communication Skills English Fluency Strong Communication skills Experienced Professional 3500 5000Monthly Bank Operation Full Time/Permanent First Shift (Day) Female Bachelors 2 Year', 'project-manager-25', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(26, 0, 0, 6, 'Graphic Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3942, 44755, 0, 3, 5000, 8000, 0, 'USD', 1, 40, 2, 4, 4, NULL, '2023-06-29 19:00:00', 4, 4, 1, 1, '2018-09-18 21:46:18', '2022-09-28 08:50:10', 'Media Wave United States of America Maryland Arnold Graphic Designer Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. Adobe Illustrator Adobe Photoshop CSS HTML Experienced Professional 5000 8000Monthly Graphic Design Freelance Rotating No Preference Bachelors 3 Year', 'graphic-designer-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(27, 0, 0, 15, 'Medicine Supervisor', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3922, 42762, 0, 3, 6000, 10000, 0, 'USD', 1, 74, 1, 1, 5, NULL, '2023-06-29 19:00:00', 6, 4, 1, 1, '2018-09-18 21:51:39', '2022-09-28 08:50:12', 'Pharma Tech Inc. United States of America Arkansas El Dorado Medicine Supervisor Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. Communication Skills English Fluency Marketing Experienced Professional 6000 10000Monthly Medicine Contract First Shift (Day) No Preference MPhil/MS 3 Year', 'medicine-supervisor-27', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 0, 0, 14, 'SEO Expert', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3975, 46777, 0, 3, 4000, 8000, 0, 'USD', 1, 69, 3, 1, 2, 2, '2023-06-29 19:00:00', 4, 4, 1, 1, '2018-09-18 21:54:17', '2022-09-28 08:50:15', 'Mayan Design Studios United States of America Washington Blaine SEO Expert Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. COMMUNICATION CSS HTML Marketing Experienced Professional 4000 8000Monthly Marketing Full Time/Permanent First Shift (Day) Male Bachelors 3 Year', 'seo-expert-28', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(29, 0, 0, 5, 'Dot Developer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3960, 45830, 0, 1, 6000, 12000, 0, 'USD', 1, 14, 1, 1, 1, NULL, '2023-06-29 19:00:00', 5, 8, 1, 1, '2018-09-18 21:34:35', '2022-09-28 08:50:17', 'Net Design United States of America Oklahoma Durant Senior Php Programer Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. JavaScript Jquery MySQL PHP Department Head 6000 12000Monthly Business Management Contract First Shift (Day) No Preference Masters 7 Year', 'senior-dot-developer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(30, 0, 0, 7, 'Full Stack Designer', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3952, 47610, 0, 3, 6000, 8000, 0, 'USD', 1, 23, 3, 3, 4, 2, '2023-06-29 19:00:00', 8, 6, 1, 1, '2018-09-18 21:29:51', '2022-09-28 08:50:19', 'Connect People United States of America New Hampshire Barrington Wordpress Developer Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui. CSS HTML JavaScript WordPress Experienced Professional 5000 10000Monthly Creative Design Full Time/Permanent Third Shift (Night) Male Certification 5 Year', 'full-stack-designer', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(31, 0, 0, 9, 'Full Stack Developer Required', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3919, 42603, 0, 3, 100000, 200000, 0, 'USD', 1, 3, 1, 2, 4, 2, '2023-06-29 19:00:00', 3, 6, 1, 0, '2019-10-20 15:42:56', '2022-10-05 19:22:46', 'Multimedia Design United States of America Alabama Bessemer testte tetae Adobe Photoshop Experienced Professional 100000 200000Monthly Admin Contract Second Shift (Afternoon) Male Intermediate/A-Level 5 Year', 'testte-31', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 0, 0, 9, 'Graphic Designer Required', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\r\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\r\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\r\n<li>Nulla consequat metus ac ante semper vehicula.</li>\r\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\r\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\r\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\r\n</ul>', 231, 3919, 42603, 0, 3, 100000, 200000, 0, 'USD', 1, 3, 1, 2, 4, 2, '2023-06-29 19:00:00', 3, 6, 1, 0, '2019-10-20 15:43:52', '2022-10-05 19:22:58', 'Multimedia Design United States of America Alabama Bessemer testte tetae Adobe Photoshop Experienced Professional 100000 200000Monthly Admin Contract Second Shift (Afternoon) Male Intermediate/A-Level 5 Year', 'testte-32', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(33, 0, 0, 9, 'SEO Expert', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\n<li>Nulla consequat metus ac ante semper vehicula.</li>\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\n</ul>', 231, 3921, 42695, 0, 2, 100000, 200000, 0, 'USD', 1, 14, 3, 2, 10, 2, '2023-06-29 19:00:00', 6, 7, 1, 0, '2019-10-23 14:16:28', '2022-10-05 19:22:08', 'Multimedia Design United States of America Arizona Casas Adobes SEO Expert tetsteste Adobe Photoshop COMMUNICATION Entry Level 100000 200000Monthly Business Management Full Time/Permanent Second Shift (Afternoon) Male MPhil/MS 6 Year', 'seo-expert-33', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(34, 0, 0, 1, 'Marketing Manager Required', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem. Duis at fermentum odio, ut mattis risus. Mauris molestie mi a dignissim eleifend. Nam sit amet facilisis odio, ac ornare quam. Donec a arcu at leo interdum viverra vulputate vitae odio. Aliquam erat volutpat. Vivamus aliquam interdum ex a condimentum. Sed mollis maximus cursus. Aenean vitae malesuada tellus. Aenean tristique porta massa. Fusce at nisl vitae dui consectetur pharetra. Praesent non ipsum dui.', '<ul>\n<li>Lorem ipsum dolor sit amet, consectetur adipiscing elit.</li>\n<li>Fusce id diam vitae lacus consectetur placerat.</li>\n<li>Nulla consequat metus ac ante semper vehicula.</li>\n<li>Vivamus eleifend elit ut porta hendrerit.</li>\n<li>Donec suscipit magna eu sapien elementum, sit amet ornare ipsum consequat.</li>\n<li>Etiam faucibus nisl accumsan commodo fringilla.</li>\n</ul>', 226, 3755, 41174, 0, 1, 2000, 3000, 0, 'BOB', 1, 15, 3, 1, 1, 2, '2023-06-29 19:00:00', 1, 11, 1, 1, '2020-10-20 08:20:53', '2022-10-05 19:23:10', 'Power Color Tuvalu Nanumanga Tonga link apply https://www.facebook.com Llamadas en frío Jefe de departamento 2000 3000Monthly Analista de sistemas de negocios Tiempo completo / permanente Primer turno (día) Masculino No matriculación Fresco', 'link-34', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(35, 5, 0, 20, 'test job title', 'test job title test job title test job title', 'test job title test job title test job title', 1, 2, 1, 0, 5, 10000, 19998, 0, '123', 1, 19, 3, 4, 10, NULL, '2023-06-09 18:00:00', 10, 1, 1, 0, '2023-05-20 14:49:57', '2023-05-21 01:57:31', 'test company bangladesh Dhaka Tangail test job title test job title test job title test job title HTML Intern/Student 10000 19998Monthly Computer Networking Full Time/Permanent Rotating No Preference Short Course 1 Year', 'test-job-title-35', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(36, 0, 0, 2, 'zxz', 'zx', 'zx', 1, 2, 1, 0, 2, 0, 0, 0, NULL, NULL, 15, 1, NULL, NULL, NULL, '2023-06-09 18:00:00', NULL, 7, 1, 0, '2023-05-20 17:12:58', '2023-05-20 17:12:59', 'AutoSoft Dynamics bangladesh Dhaka Tangail zxz zx Adobe Photoshop Entry Level 0 0 Business Systems Analyst Contract  No Preference  6 Year', 'zxz-36', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 5, 5, 4, 'asa', 'asas', 'asas', 1, 2, 1, 0, 2, 1999, 998, 0, '123', NULL, 3, 2, NULL, 5, NULL, '2023-06-09 18:00:00', 3, 3, 1, 1, '2023-05-20 17:18:29', '2023-05-21 01:56:26', 'Surf Wave bangladesh Dhaka Tangail asa asas Adobe Photoshop Entry Level 1999 998 Admin Freelance  No Preference Intermediate/A-Level 2 Year', 'asa-37', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_alerts`
--

CREATE TABLE `job_alerts` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(500) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `search_title` text DEFAULT NULL,
  `country_id` varchar(500) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `functional_area_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `job_alerts`
--

INSERT INTO `job_alerts` (`id`, `name`, `user_id`, `email`, `search_title`, `country_id`, `state_id`, `city_id`, `functional_area_id`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'monu@synram.co', NULL, NULL, NULL, NULL, NULL, '2020-10-20 16:53:21', '2020-10-20 16:53:21'),
(2, NULL, NULL, 'monu@synram.co', 'Adobe Photoshop', NULL, NULL, NULL, NULL, '2020-10-20 16:55:05', '2020-10-20 16:55:05'),
(3, NULL, NULL, 'monu@synram.co', 'Adobe Photoshop', NULL, NULL, NULL, NULL, '2020-10-20 16:56:47', '2020-10-20 16:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `job_apply`
--

CREATE TABLE `job_apply` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `cv_id` int(11) DEFAULT NULL,
  `current_salary` int(11) DEFAULT NULL,
  `expected_salary` int(11) DEFAULT NULL,
  `salary_currency` varchar(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `job_apply`
--

INSERT INTO `job_apply` (`id`, `user_id`, `job_id`, `cv_id`, `current_salary`, `expected_salary`, `salary_currency`, `created_at`, `updated_at`) VALUES
(1, 2, 16, 2, 50000, 60000, 'PKR', '2018-08-11 12:40:42', '2018-08-11 12:40:42'),
(2, 2, 5, 3, 50000, 60000, 'PKR', '2018-08-28 16:57:33', '2018-08-28 16:57:33'),
(3, 2, 3, 3, 50000, 60000, 'PKR', '2018-08-29 09:44:21', '2018-08-29 09:44:21'),
(4, 2, 11, 2, 90000, 120000, 'PKR', '2018-08-29 09:47:15', '2018-08-29 09:47:15'),
(5, 5, 18, 5, 6000, 8000, 'USD', '2018-09-14 20:15:34', '2018-09-14 20:15:34'),
(7, 5, 20, 5, 65000, 80000, 'PKR', '2019-05-27 00:18:10', '2019-05-27 00:18:10'),
(8, 6, 33, 6, 90000, 120000, 'USD', '2019-10-23 14:28:50', '2019-10-23 14:28:50'),
(9, 6, 29, 6, 2, 33, 'USD', '2021-02-21 10:06:13', '2021-02-21 10:06:13'),
(10, 6, 25, 6, 4, 5, 'USD', '2021-02-21 10:09:45', '2021-02-21 10:09:45'),
(11, 6, 2, 8, 80000, 1500, 'USD', '2021-08-10 05:11:06', '2021-08-10 05:11:06');

-- --------------------------------------------------------

--
-- Table structure for table `job_apply_rejected`
--

CREATE TABLE `job_apply_rejected` (
  `id` int(10) UNSIGNED NOT NULL,
  `apply_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `job_id` int(11) DEFAULT NULL,
  `cv_id` int(11) DEFAULT NULL,
  `current_salary` int(11) DEFAULT NULL,
  `expected_salary` int(11) DEFAULT NULL,
  `salary_currency` varchar(5) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `job_apply_rejected`
--

INSERT INTO `job_apply_rejected` (`id`, `apply_id`, `user_id`, `job_id`, `cv_id`, `current_salary`, `expected_salary`, `salary_currency`, `created_at`, `updated_at`) VALUES
(1, 6, 5, 2, 5, 6000, 8000, 'USD', '2021-08-10 04:51:35', '2021-08-10 04:51:35');

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE `job_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `lan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job_categories`
--

INSERT INTO `job_categories` (`id`, `name`, `lan`, `created_at`, `updated_at`) VALUES
(1, '求職者', '英語', '2023-05-01 00:13:58', '2023-06-08 17:24:30'),
(2, '学生', 'Japanese', '2023-05-01 00:14:29', '2023-06-03 10:11:12'),
(3, '企業向け', 'Japanese', '2023-05-01 00:14:41', '2023-06-03 10:11:31');

-- --------------------------------------------------------

--
-- Table structure for table `job_experiences`
--

CREATE TABLE `job_experiences` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_experience_id` int(11) DEFAULT 0,
  `job_experience` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_experiences`
--

INSERT INTO `job_experiences` (`id`, `job_experience_id`, `job_experience`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, '1 Year', 1, 1, 4, 'en', '2018-04-05 16:27:28', '2018-04-11 23:19:05'),
(2, 2, '10 Year', 1, 1, 13, 'en', '2018-04-05 16:27:51', '2018-04-11 23:19:05'),
(3, 3, '2 Year', 1, 1, 5, 'en', '2018-04-05 16:28:17', '2018-04-11 23:19:05'),
(4, 4, '3 Year', 1, 1, 6, 'en', '2018-04-05 21:28:44', '2018-04-11 23:19:05'),
(5, 5, '4 Year', 1, 1, 7, 'en', '2018-04-05 21:28:49', '2018-04-11 23:19:05'),
(6, 6, '5 Year', 1, 1, 8, 'en', '2018-04-05 21:28:55', '2018-04-11 23:19:05'),
(7, 7, '6 Year', 1, 1, 9, 'en', '2018-04-05 21:28:59', '2018-04-11 23:19:05'),
(8, 8, '7 Year', 1, 1, 10, 'en', '2018-04-05 21:29:04', '2018-04-11 23:19:05'),
(9, 9, '8 Year', 1, 1, 11, 'en', '2018-04-05 21:29:08', '2018-04-11 23:19:05'),
(10, 10, '9 Year', 1, 1, 12, 'en', '2018-04-05 21:29:13', '2018-04-11 23:19:05'),
(11, 11, 'Fresh', 1, 1, 2, 'en', '2018-04-05 21:29:18', '2018-04-11 23:19:05'),
(12, 12, 'Less Than 1 Year', 1, 1, 3, 'en', '2018-04-05 21:29:24', '2018-04-11 23:19:05'),
(14, 1, '1 año', 0, 1, 4, 'es', '2018-04-06 10:29:43', '2018-04-11 23:20:21'),
(15, 2, '10 años', 0, 1, 13, 'es', '2018-04-06 15:34:46', '2018-04-11 23:20:21'),
(16, 3, '2 años', 0, 1, 5, 'es', '2018-04-06 15:34:46', '2018-04-11 23:20:21'),
(17, 4, '3 años', 0, 1, 6, 'es', '2018-04-06 15:34:46', '2018-04-11 23:20:21'),
(18, 5, '4 años', 0, 1, 7, 'es', '2018-04-06 15:34:46', '2018-04-11 23:20:21'),
(19, 6, '5 años', 0, 1, 8, 'es', '2018-04-06 15:34:46', '2018-04-11 23:20:21'),
(20, 7, '6 años', 0, 1, 9, 'es', '2018-04-06 15:34:47', '2018-04-11 23:20:21'),
(21, 8, '7 años', 0, 1, 10, 'es', '2018-04-06 15:34:47', '2018-04-11 23:20:21'),
(22, 9, '8 años', 0, 1, 11, 'es', '2018-04-06 15:34:47', '2018-04-11 23:20:21'),
(23, 10, '9 años', 0, 1, 12, 'es', '2018-04-06 15:34:47', '2018-04-11 23:20:21'),
(24, 11, 'Fresco', 0, 1, 2, 'es', '2018-04-06 15:34:47', '2018-04-11 23:20:21'),
(25, 12, 'Menos de 1 año', 0, 1, 3, 'es', '2018-04-06 15:34:47', '2018-04-11 23:20:21'),
(27, 1, '1 سنة', 0, 1, 4, 'ar', '2018-04-12 04:15:35', '2018-04-11 23:20:04'),
(28, 2, '10 سنوات', 0, 1, 13, 'ar', '2018-04-12 04:15:35', '2018-04-11 23:20:04'),
(29, 3, '2 سنة', 0, 1, 5, 'ar', '2018-04-12 04:15:35', '2018-04-11 23:20:04'),
(30, 4, '3 سنوات', 0, 1, 6, 'ar', '2018-04-12 04:15:35', '2018-04-11 23:20:04'),
(31, 5, '4 سنوات', 0, 1, 7, 'ar', '2018-04-12 04:15:35', '2018-04-11 23:20:04'),
(32, 6, '5 سنوات', 0, 1, 8, 'ar', '2018-04-12 04:15:35', '2018-04-11 23:20:04'),
(33, 7, '6 سنوات', 0, 1, 9, 'ar', '2018-04-12 04:15:35', '2018-04-11 23:20:04'),
(34, 8, '7 سنوات', 0, 1, 10, 'ar', '2018-04-12 04:15:35', '2018-04-11 23:20:04'),
(35, 9, '8 سنوات', 0, 1, 11, 'ar', '2018-04-12 04:15:35', '2018-04-11 23:20:04'),
(36, 10, '9 سنوات', 0, 1, 12, 'ar', '2018-04-12 04:15:35', '2018-04-11 23:20:04'),
(37, 11, 'طازج', 0, 1, 2, 'ar', '2018-04-12 04:15:35', '2018-04-11 23:19:57'),
(38, 12, 'أقل من 1 سنة', 0, 1, 3, 'ar', '2018-04-12 04:15:35', '2018-04-11 23:20:04'),
(40, 1, '1 سال', 0, 1, 4, 'ur', '2018-04-12 04:17:13', '2018-04-11 23:19:28'),
(41, 12, '1 سال سے کم', 0, 1, 3, 'ur', '2018-04-12 04:17:13', '2018-04-11 23:19:28'),
(42, 2, '10 سال', 0, 1, 13, 'ur', '2018-04-12 04:17:13', '2018-04-11 23:19:28'),
(43, 3, '2 سال', 0, 1, 5, 'ur', '2018-04-12 04:17:13', '2018-04-11 23:19:28'),
(44, 4, '3 سال', 0, 1, 6, 'ur', '2018-04-12 04:17:13', '2018-04-11 23:19:28'),
(45, 5, '4 سال', 0, 1, 7, 'ur', '2018-04-12 04:17:13', '2018-04-11 23:19:28'),
(46, 6, '5 سال', 0, 1, 8, 'ur', '2018-04-12 04:17:13', '2018-04-11 23:19:28'),
(47, 7, '6 سال', 0, 1, 9, 'ur', '2018-04-12 04:17:13', '2018-04-11 23:19:28'),
(48, 8, '7 سال', 0, 1, 10, 'ur', '2018-04-12 04:17:13', '2018-04-11 23:19:28'),
(49, 9, '8 سال', 0, 1, 11, 'ur', '2018-04-12 04:17:13', '2018-04-11 23:19:28'),
(50, 10, '9 سال', 0, 1, 12, 'ur', '2018-04-12 04:17:13', '2018-04-11 23:19:28'),
(51, 11, 'تازه', 0, 1, 2, 'ur', '2018-04-12 04:17:13', '2018-04-11 23:19:28');

-- --------------------------------------------------------

--
-- Table structure for table `job_industries`
--

CREATE TABLE `job_industries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sub_id` int(11) NOT NULL,
  `industry_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `lan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job_industries`
--

INSERT INTO `job_industries` (`id`, `sub_id`, `industry_id`, `category_id`, `lan`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 0, 'Bambara', '2023-05-01 10:53:11', '2023-05-01 11:23:26'),
(2, 2, 12, 0, 'Armenian', '2023-05-01 11:12:17', '2023-05-01 11:23:19'),
(3, 4, 7, 0, 'Aymara', '2023-05-01 11:38:36', '2023-05-01 11:38:47'),
(4, 3, 12, 0, 'English', '2023-05-20 04:58:05', '2023-05-20 04:58:05'),
(5, 3, 7, 1, '日本語', '2023-05-26 16:58:48', '2023-06-08 17:24:51');

-- --------------------------------------------------------

--
-- Table structure for table `job_places`
--

CREATE TABLE `job_places` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `industry_id` int(11) NOT NULL,
  `location_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_services`
--

CREATE TABLE `job_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` varchar(120) NOT NULL,
  `fa` varchar(255) DEFAULT NULL,
  `image` varchar(200) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` varchar(255) NOT NULL DEFAULT '1',
  `lang` varchar(44) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job_services`
--

INSERT INTO `job_services` (`id`, `category_id`, `fa`, `image`, `title`, `description`, `status`, `lang`, `created_at`, `updated_at`) VALUES
(1, '2', 'test', '1685788712.png', '転職<br>（JOB CHANGE)', '<p>私たちは、外国籍の日本在住者を対象にした転職サポートサービスを提供しています。バロジョブ・ポータルサイトへ登録している企業への転職をサポートをサポートしています。あなたの経験やキャリアを活かしたキャリアアップを支援します。私たちの転職サポートサービスでは、バロジョブ・ポータルサイトに登録された企業への転職を円滑に進めるためのサポートとし、転職コンサルティングもおこなっております。これまで転職に悩んでいた方々も、バロジョブ・ポータルサイトの登録企業への転職サポートを利用することで、キャリアアップを実現すことができます。私たちの目標は、外国籍の日本在住者が日本での就職を実現し、充実したキャリアを築くことです。個々のニーズに合わせたカスタマイズされたサービスを提供し、確実なサポートをお約束します。バロジョブ転職サポートを利用することで、充実したキャリアを築くためのお手伝いをいたします。</p>', '1', NULL, '2023-06-03 10:32:15', '2023-06-03 17:38:33'),
(2, '2', 'テスト', '1685788743.png', '就職<br>(JOB HUNTING)', '<p>日本での留学生活を終え、数多くの日本企業への就職実績があるバロジョブ・ポータルサイト。皆さんにとって、日本での留学生活を終えて、将来的に日本企業での就職を目指す皆さんにとって、適切な求人情報やキャリアサポートは非常に重要です。バロジョブ・ポータルサイトは日本で学んだ経験と技術を日本の未来のために活かしていける環境を提供しています。国内に在住している外国人留学生を対象とした新卒者向けの求人への就職サポートを提供しております。バロジョブ・ポータルサイトに登録している日本企業へ就職活動を円滑に進めるためのサービスです。登録された企業は即戦力を探しています。求人情報を閲覧し自分に合った企業へ応募し、日本で学んだ経験と技術を活かし、バロジョブ・ポータルサイトのマッチング機能を活用して外国人留学生と日本企業とのマッチングを促進しています。</p>', '1', NULL, '2023-06-03 14:35:22', '2023-06-03 17:39:03'),
(3, '2', 'テスト', '1685788787.png', '在留資格変更<br>(VISA STATUS )', '<p>私たちのサービスでは、専門のコンサルタントが在留資格変更に関する法律や手続きに精通しており、個々の状況に合わせた最適なアドバイスと支援を提供します。外国籍の方々にとって、日本での生活や就労を継続するためには、適切な在留資格を持つことが重要です。在留資格の変更手続きは複雑であり、個人で行うのは難しい場合があります。私たちはそんな方々に対し、最適な在留資格を選定し、必要な書類の作成や手続きの代行をおこない、スムーズかつ迅速な在留資格変更のサポートを提供しています。在留資格変更は個人の将来や生活に大きく関わる重要なプロセスですので、私たちのサポートを通じてスムーズな手続きを行い、安心して新しい在留資格を取得していただけるよう努めます。在留資格変更に関するお悩みやご質問がありましたら、いつでもお気軽にご相談ください。私たちが最善の解決策を提案し、あなたの在留資格変更をサポートいたします。</p>', '1', NULL, '2023-06-03 16:03:52', '2023-06-03 17:39:47'),
(4, '1', 'テスト', '1685790822.png', '就職<br>(JOB HUNTING)', '<p>日本企業へ数多くの就職実現をしてきたバロジョブ・ポータルサイト。日本への就職を実現するための１番の近道がバロジョブ・ポータルサイトです。バロジョブポータルサイトは日本企業への就職活動をスムーズに進めるための支援サービスを提供しています。履歴書や職務経歴書の作成支援、面接対策、就労ビザの取得サポートなど、就職活動全般にわたるサポートを提供することで求職者に安心してご利用していただいております。日本国内の登録会員企業との連携により、求人情報や採用要件を正確に把握し、国外にいる求職者へ情報を提供する事ができるサイトとして求職者と求人者のマッチングを促進することを行なっております。また、求職者にとって魅力的な職場環境や福利厚生などの情報も提供も行っています。日本での就職活動や職場環境に関する情報やアドバイスを提供しております。異文化の違いや日本の労働環境に対する理解を深めるためのコンテンツや、留学生や外国人労働者のための地域情報や生活サポート情報なども提供することで、求職者の準備と適応を支援致します。</p>', '1', NULL, '2023-06-03 16:29:48', '2023-06-03 18:13:42'),
(5, '1', 'テスト', '1685790643.png', '留学<br>(STUDY ABROAD)', '<p>日本への留学希望者へのサポートによる数々な留学実績が弊社の強みです。日本の教育機関、留学先機関など会員登録者の個々のニーズにあった総合サービスを提供しております。バロジョブ・ボータルサイトは留学希望者の目標に合わせ将来設計を考えた留学斡旋サービスを提供しております。日本の多くの留学生が世界中から集まる魅力的な留学先の一つです。私たちは、留学を考えている方々に対し、円滑かつ信頼性の高い留学斡旋サービスを提供しています。当社の留学斡旋サービスでは、個々の留学希望や目標に合わせたプランニングを行います。日本の有名大学や専門学校、語学学校との協力関係を築き、多様な学問分野やコースをカバーしています。また、生活サポートやビザ申請の手続きなど、留学生活に必要なサポートも提供しています。私たちは、留学を通じて異文化を体験し、国際的な視野を広げたいと考える方々をサポートします。日本の教育環境や文化に触れながら、自己成長を遂げる機会を提供します。私たちの留学斡旋サービスは、信頼と品質に基づいており、留学希望者の皆さんのニーズに合わせた最適な留学プログラムをご提案します。私たちのネットワークと経験を活かし、安心で充実した留学生活を実現するお手伝いをいたします。留学の夢を持つ方々にとって、正確な情報と確かなサポートは重要な要素です。私たちはその要望に応えるために、努力を惜しまずにサービスを提供してまいります。是非、私たちの留学斡旋サービスをご利用いただき、素晴らしい留学体験を実現してください。皆さんの夢の実現に向けて、全力でサポートいたします。</p>', '1', NULL, '2023-06-03 16:53:30', '2023-06-03 18:10:43'),
(6, '4', 'テスト', '1685841868.png', '大学<br>(UNIVERSITY)', 'バロジョブ・ポータルサイトは、国内外の語学学校から日本の大学へ進学を希望する留学生に対して、大学紹介のサポートを行っています。当ポータルサイトは、東南アジア・南アジアからの大学進学希望者の登録があり、日本国内の語学学校を卒業する留学生に対して、大学進学の機会を提供しています。バロジョブ・ポータルサイトはこれまでの実績を活かし、留学生の希望や条件に合った大学を迅速かつ効果的に紹介し、スムーズな進学プロセスをサポートしています。留学生のキャリアアップを支援し、夢を実現するためのパートナーとして、バロジョブ・ポータルサイトは運営されています。', '1', NULL, '2023-06-03 17:05:43', '2023-06-06 15:14:01'),
(7, '4', 'テスト', '1685843011.jpg', '専門学校<br> (VOCATIONAL SCHOOL)', 'バロジョブ・ポータルサイトは、国内外の語学学校から日本の専門学校への進学を希望している留学生に対して、より良い条件に合った本ポータルサイト内の登録済み専門学校への紹介と進学サポートを提供しています。当ポータルサイトは、留学生の希望や条件を考慮し、信頼性の高い専門学校を迅速かつ効果的に紹介します。また、進学までのプロセス全体を一貫してサポートすることで、留学生の進学の夢を実現するお手伝いをしています。バロジョブ・ポータルサイトは、留学生のキャリアアップを重視し、専門学校への進学を円滑に進めるためのパートナーとして、信頼と実績のあるサービスを提供しています。', '1', NULL, '2023-06-03 17:06:08', '2023-06-06 15:14:24'),
(8, '1', 'テスト', '1685789237.png', '語学学校<br>  LANGUAGE SCHOOL', '<p>日本人教師と母国語教師のチームワークを活かした日本語教育が強みです。バロジョブ・日本語学校は日本人教師と母国語教師が留学生へ日本語を教えています。日本人教師はネイティブスピーカーとしての豊富な知識と経験を持ち、正確な日本語表現や文化的な背景を生徒たちに伝えることができます。また母国語教師は、生徒たちの母国語を理解し、その言語の特徴や文化的背景を通じて日本語学習をサポートします。彼らは生徒たちがネイティブ言語の影響を受けずに日本語を学ぶための指導方法を熟知しており、生徒たちの学習効果を最大限に引き出すことに力を注いでいます。留学生は日本での生活や文化を習得するまでは母国語教師のサポートが必須となります。生徒たちが自然な日本語の習得に取り組めるよう、丁寧な指導や生活面でのサポートなどを提供します。バロジョブ日本語学校は日本人教師と母国語教師のチームワークを活かし、生徒たちがバランスの取れた学習経験を得られるよう取り組んでいます。それぞれの教師が持つ専門知識と経験を生かし、生徒たちのニーズに合わせたカリキュラムや教材を提供しています。私たちの日本語学校は、生徒たちが確実に日本語を習得し、日本での生活や学習、就職などの様々な目標を達成できるようサポートします。</p>', '1', NULL, '2023-06-03 17:34:27', '2023-06-04 05:34:22'),
(9, '4', 'テスト', '1685842546.png', '語学学校<br>(LANGUAGE SCHOOL)', '南アジアと東南アジアを対象とした日本への留学希望者へのポータルサイトとして運営しております。バロジョブ・ポータルサイトは、日本への留学希望者に対してトータルサポートを提供することが特徴です。登録者は、詳細な情報を提供することで個別のニーズに合った進学先の情報を得ることができます。私たちは留学希望者の夢を実現するための第一歩として、語学学校の紹介を行っています。バロジョブ・ポータルサイトは、全て登録制であり、登録校は留学希望者への情報提供を行うことで、生徒と学校のマッチングを円滑に進めることができます。また、私たちは登録者の情報を適切に評価し、彼らの希望や条件に合った語学学校を迅速かつ効果的に紹介します。', '1', NULL, '2023-06-03 20:23:13', '2023-06-04 06:16:56'),
(10, '3', 'バングラデシュ', '1685844407.jpg', '技能実習生のご紹介（Technical Trainee)', '<p>バングラデシュ、ベトナム・東南アジア等々の技能実習生を実績のある優れた送出機関より技能実習生の確保が可能となり、将来的に受入先企業(実習実施者)で人材育成し社会貢献を目指した世界的取り組みを行いながら特定技能の外国人へと教育していくことを目的とした取り組みに対してバロジョブ・ポータルサイトは有益な情報提供と外国人を雇用した経験がない企業様に対してコンサルティングサポートを積極的にさせていただきます。</p>', '1', NULL, '2023-06-03 21:50:03', '2023-06-04 06:06:47'),
(11, '3', 'バングラデシュ', '1685844691.jpg', '特定技能の外国人<br>(SSW)', '<p>バングラデシュ、ベトナム等々の技能実習生、特定技能の外国人を早く安く簡単に採用するサポートを積極的に支援しております。12業種で特定技能人材を無料でご提案できます。</p>', '1', NULL, '2023-06-03 21:53:42', '2023-06-04 06:19:47'),
(12, '3', 'IT人材の人手不足', '1685844937.jpg', '海外労働者派遣<br>人材紹介', '<p>IT人材の人手不足、製造現場へ外国人労働者を採用したい企業へワンストップサービスをご提供しております。弊社の得とする業種は自動車系、機械系、IT系、電気系等の業種に金属加工技術者・マシニングセンター操作・ＮＣ旋盤・プログラム作成・ＣＡＤエンジニア・ＣＡＭエンジニア・金型設計・ＩＴエンジニア・システムエンジニア（SE）・通訳者・国際業務・研修生・技能実習生・介護・労働者・留学生、調理者等々です。受け入れが初めての企業さまでも、費用やスケジュールについてわかりやすくご説明し、スムーズな受け入れをサポートします。 </p>', '1', NULL, '2023-06-03 22:07:14', '2023-06-04 06:16:12');

-- --------------------------------------------------------

--
-- Table structure for table `job_shifts`
--

CREATE TABLE `job_shifts` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_shift_id` int(11) DEFAULT 0,
  `job_shift` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_shifts`
--

INSERT INTO `job_shifts` (`id`, `job_shift_id`, `job_shift`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'First Shift (Day)', 1, 1, 1, 'en', '2018-07-13 16:19:12', NULL),
(2, 2, 'Second Shift (Afternoon)', 1, 1, 2, 'en', '2018-07-13 16:19:12', NULL),
(3, 3, 'Third Shift (Night)', 1, 1, 3, 'en', '2018-07-13 16:19:24', NULL),
(4, 4, 'Rotating', 1, 1, 4, 'en', '2018-07-13 16:19:39', NULL),
(5, 1, 'Primer turno (día)', 0, 1, 1, 'es', '2018-07-13 16:22:59', NULL),
(6, 2, 'Segundo turno (tarde)', 0, 1, 2, 'es', '2018-07-13 16:22:59', NULL),
(7, 3, 'Tercer turno (Noche)', 0, 1, 3, 'es', '2018-07-13 16:22:59', NULL),
(8, 4, 'Giratorio', 0, 1, 4, 'es', '2018-07-13 16:22:59', NULL),
(9, 1, 'التحول الأول (اليوم)', 0, 1, 1, 'ar', '2018-07-13 16:23:02', NULL),
(10, 2, 'التحول الثاني (بعد الظهر)', 0, 1, 2, 'ar', '2018-07-13 16:23:02', NULL),
(11, 3, 'التحول الثالث (ليلة)', 0, 1, 3, 'ar', '2018-07-13 16:23:02', NULL),
(12, 4, 'دوار', 0, 1, 4, 'ar', '2018-07-13 16:23:02', NULL),
(13, 1, 'پہلا پہر', 0, 1, 1, 'ur', '2018-07-13 16:23:04', NULL),
(14, 2, 'دوپہر', 0, 1, 2, 'ur', '2018-07-13 16:23:04', NULL),
(15, 3, 'تیسراپہر', 0, 1, 3, 'ur', '2018-07-13 16:23:04', NULL),
(16, 4, 'گردشی', 0, 1, 4, 'ur', '2018-07-13 16:23:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_skills`
--

CREATE TABLE `job_skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_skill_id` int(11) DEFAULT 0,
  `job_skill` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_skills`
--

INSERT INTO `job_skills` (`id`, `job_skill_id`, `job_skill`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Adobe Illustrator', 1, 1, 1, 'en', '2018-04-06 09:49:43', '2018-04-06 09:49:43'),
(2, 2, 'Adobe Photoshop', 1, 1, 2, 'en', '2018-04-06 09:50:03', '2018-04-06 09:50:03'),
(3, 3, 'Cold Calling', 1, 1, 3, 'en', '2018-04-06 09:50:25', '2018-04-06 09:50:25'),
(4, 4, 'COMMUNICATION', 1, 1, 4, 'en', '2018-04-06 09:50:45', '2018-04-06 09:50:45'),
(5, 5, 'Communication Skills', 1, 1, 5, 'en', '2018-04-06 09:51:05', '2018-04-06 09:51:05'),
(6, 6, 'CSS', 1, 1, 6, 'en', '2018-04-06 09:51:25', '2018-04-06 09:51:25'),
(7, 7, 'English Fluency', 1, 1, 7, 'en', '2018-04-06 09:51:46', '2018-04-06 09:51:46'),
(8, 8, 'HTML', 1, 1, 8, 'en', '2018-04-06 09:52:08', '2018-04-06 09:52:08'),
(9, 9, 'Java', 1, 1, 9, 'en', '2018-04-06 09:52:32', '2018-04-06 09:52:32'),
(10, 10, 'JavaScript', 1, 1, 10, 'en', '2018-04-06 09:52:40', '2018-04-06 09:52:40'),
(11, 11, 'Jquery', 1, 1, 11, 'en', '2018-04-06 09:52:52', '2018-04-06 09:52:52'),
(12, 12, 'Marketing', 1, 1, 12, 'en', '2018-04-06 09:53:05', '2018-04-06 09:53:05'),
(13, 13, 'MS Excel', 1, 1, 13, 'en', '2018-04-06 09:53:25', '2018-04-06 09:53:25'),
(14, 14, 'MS Office', 1, 1, 14, 'en', '2018-04-06 09:53:45', '2018-04-06 09:53:45'),
(15, 15, 'MySQL', 1, 1, 15, 'en', '2018-04-06 09:54:07', '2018-04-06 09:54:07'),
(16, 16, 'PHP', 1, 1, 16, 'en', '2018-04-06 09:54:30', '2018-04-06 09:54:30'),
(17, 17, 'Sales', 1, 1, 17, 'en', '2018-04-06 09:54:54', '2018-04-06 09:54:54'),
(18, 18, 'Strong Communication skills', 1, 1, 18, 'en', '2018-04-06 09:55:13', '2018-04-08 23:20:54'),
(19, 19, 'WordPress', 1, 1, 19, 'en', '2018-04-06 09:55:28', '2018-04-08 23:20:54'),
(20, 2, 'Adobe Photoshop', 0, 1, 1, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:27'),
(21, 4, 'COMUNICACIÓN', 0, 1, 2, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(22, 6, 'CSS', 0, 1, 3, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(23, 7, 'Fluidez en inglés', 0, 1, 4, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(24, 18, 'Fuertes habilidades de comunicación', 0, 1, 5, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(25, 5, 'Habilidades de comunicación', 0, 1, 6, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(26, 8, 'HTML', 0, 1, 7, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(27, 1, 'Ilustrador Adobe', 0, 1, 8, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(28, 9, 'Java', 0, 1, 9, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(29, 10, 'JavaScript', 0, 1, 10, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(30, 11, 'Jquery', 0, 1, 11, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(31, 3, 'Llamadas en frío', 0, 1, 12, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(32, 12, 'Márketing', 0, 1, 13, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(33, 13, 'MS Excel', 0, 1, 14, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(34, 14, 'MS Office', 0, 1, 15, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(35, 15, 'MySQL', 0, 1, 16, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(36, 16, 'PHP', 0, 1, 17, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(37, 17, 'Ventas', 0, 1, 18, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:27'),
(38, 19, 'WordPress', 0, 1, 19, 'es', '2018-04-06 15:31:29', '2018-04-06 10:33:25'),
(39, 6, 'CSS', 0, 1, 1, 'ar', '2018-04-12 04:29:17', NULL),
(40, 8, 'HTML', 0, 1, 2, 'ar', '2018-04-12 04:29:17', NULL),
(41, 16, 'PHP', 0, 1, 3, 'ar', '2018-04-12 04:29:17', NULL),
(42, 3, 'الاتصال البارد', 0, 1, 4, 'ar', '2018-04-12 04:29:17', NULL),
(43, 4, 'الاتصالات', 0, 1, 5, 'ar', '2018-04-12 04:29:17', NULL),
(44, 7, 'الانجليزية بطلاقة', 0, 1, 6, 'ar', '2018-04-12 04:29:17', NULL),
(45, 15, 'الخلية', 0, 1, 7, 'ar', '2018-04-12 04:29:17', NULL),
(46, 1, 'أدوبي المصور', 0, 1, 8, 'ar', '2018-04-12 04:29:17', NULL),
(47, 2, 'أدوبي فوتوشوب', 0, 1, 9, 'ar', '2018-04-12 04:29:17', NULL),
(48, 12, 'تسويق', 0, 1, 10, 'ar', '2018-04-12 04:29:17', NULL),
(49, 9, 'جافا', 0, 1, 11, 'ar', '2018-04-12 04:29:17', NULL),
(50, 10, 'جافا سكريبت', 0, 1, 12, 'ar', '2018-04-12 04:29:17', NULL),
(51, 13, 'مايكروسوفت اكسل', 0, 1, 13, 'ar', '2018-04-12 04:29:17', NULL),
(52, 14, 'مايكروسوفت أوفيس', 0, 1, 14, 'ar', '2018-04-12 04:29:17', NULL),
(53, 17, 'مبيعات', 0, 1, 15, 'ar', '2018-04-12 04:29:17', NULL),
(54, 11, 'مسج', 0, 1, 16, 'ar', '2018-04-12 04:29:17', NULL),
(55, 18, 'مهارات اتصال قوية', 0, 1, 17, 'ar', '2018-04-12 04:29:17', NULL),
(56, 5, 'مهارات التواصل', 0, 1, 18, 'ar', '2018-04-12 04:29:17', NULL),
(57, 19, 'وورد', 0, 1, 19, 'ar', '2018-04-12 04:29:17', NULL),
(58, 11, 'Jquery', 0, 1, 1, 'ur', '2018-04-12 04:30:36', NULL),
(59, 15, 'MySQL', 0, 1, 2, 'ur', '2018-04-12 04:30:36', NULL),
(60, 2, 'اڈوب فوٹوشاپ', 0, 1, 3, 'ur', '2018-04-12 04:30:36', NULL),
(61, 5, 'اظہار خیال سے متعلقہ مہارتیں', 0, 1, 4, 'ur', '2018-04-12 04:30:36', NULL),
(62, 7, 'انگریزی فلوئرنس', 0, 1, 5, 'ur', '2018-04-12 04:30:36', NULL),
(63, 8, 'ایچ ٹی ایم ایل', 0, 1, 6, 'ur', '2018-04-12 04:30:36', NULL),
(64, 1, 'ایڈوب Illustrator', 0, 1, 7, 'ur', '2018-04-12 04:30:36', NULL),
(65, 13, 'ایم ایس ایکسل', 0, 1, 8, 'ur', '2018-04-12 04:30:36', NULL),
(66, 14, 'ایم ایس آفس', 0, 1, 9, 'ur', '2018-04-12 04:30:36', NULL),
(67, 16, 'پی ایچ پی', 0, 1, 10, 'ur', '2018-04-12 04:30:36', NULL),
(68, 9, 'جاوا', 0, 1, 11, 'ur', '2018-04-12 04:30:36', NULL),
(69, 10, 'جاوا اسکرپٹ', 0, 1, 12, 'ur', '2018-04-12 04:30:36', NULL),
(70, 3, 'سردی کالنگ', 0, 1, 13, 'ur', '2018-04-12 04:30:36', NULL),
(71, 6, 'سی ایس ایس', 0, 1, 14, 'ur', '2018-04-12 04:30:36', NULL),
(72, 17, 'سیلز', 0, 1, 15, 'ur', '2018-04-12 04:30:36', NULL),
(73, 12, 'مارکیٹنگ', 0, 1, 16, 'ur', '2018-04-12 04:30:36', NULL),
(74, 18, 'مضبوط مواصلات کی مہارت', 0, 1, 17, 'ur', '2018-04-12 04:30:36', NULL),
(75, 4, 'مواصلات', 0, 1, 18, 'ur', '2018-04-12 04:30:36', NULL),
(76, 19, 'ورڈپریس', 0, 1, 19, 'ur', '2018-04-12 04:30:36', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_sub_categories`
--

CREATE TABLE `job_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` int(11) NOT NULL,
  `job_user_type` int(11) NOT NULL DEFAULT 0,
  `sub_name` varchar(255) NOT NULL,
  `lan` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `job_sub_categories`
--

INSERT INTO `job_sub_categories` (`id`, `category_id`, `job_user_type`, `sub_name`, `lan`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 'Manufacuring ２', '日本語', '2023-05-01 01:46:40', '2023-06-08 17:24:39'),
(2, 1, 2, 'IT', 'Akan', '2023-05-01 01:46:58', '2023-05-01 01:46:58'),
(3, 1, 3, 'Software company', 'Afrikaans', '2023-05-01 01:47:09', '2023-05-01 01:47:09'),
(4, 5, 2, 'jpsub11', 'Chinese', '2023-05-01 11:36:01', '2023-05-01 11:38:18'),
(5, 5, 1, 'sub-jp1', 'English', '2023-05-20 11:56:20', '2023-05-20 11:56:20'),
(6, 5, 2, 'student - jp1', 'English', '2023-05-20 12:22:38', '2023-05-20 12:22:38'),
(7, 3, 2, 'sub-humanities-student', 'English', '2023-05-20 14:55:11', '2023-05-20 14:55:11');

-- --------------------------------------------------------

--
-- Table structure for table `job_titles`
--

CREATE TABLE `job_titles` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_title_id` int(11) DEFAULT 0,
  `job_title` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_titles`
--

INSERT INTO `job_titles` (`id`, `job_title_id`, `job_title`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Accountant', 1, 1, 1, 'en', '2018-04-05 16:16:40', '2018-04-08 23:47:30'),
(2, 2, 'Accounts Officer', 1, 1, 2, 'en', '2018-04-05 16:16:58', '2018-04-05 16:16:58'),
(3, 3, 'Business Development Executive', 1, 1, 3, 'en', '2018-04-05 16:17:59', '2018-04-05 16:17:59'),
(4, 4, 'Business Development Officer', 1, 1, 4, 'en', '2018-04-05 16:18:26', '2018-04-05 16:18:26'),
(5, 5, 'Call Center Agent', 1, 1, 5, 'en', '2018-04-06 17:24:47', NULL),
(6, 6, 'Computer Operator', 1, 1, 6, 'en', '2018-04-06 17:24:47', NULL),
(7, 7, 'Content Writer', 1, 1, 7, 'en', '2018-04-06 17:24:47', NULL),
(8, 8, 'Customer Representative Officer', 1, 1, 8, 'en', '2018-04-06 17:24:47', NULL),
(9, 9, 'Data Entry Operator', 1, 1, 9, 'en', '2018-04-06 17:24:47', NULL),
(10, 10, 'Graphic Designer', 1, 1, 10, 'en', '2018-04-06 17:24:47', NULL),
(11, 11, 'Marketing Executive', 1, 1, 11, 'en', '2018-04-06 17:24:47', NULL),
(12, 12, 'Marketing Manager', 1, 1, 12, 'en', '2018-04-06 17:24:47', NULL),
(13, 13, 'Office Assistant', 1, 1, 13, 'en', '2018-04-06 17:24:47', NULL),
(14, 14, 'PHP Developer', 1, 1, 14, 'en', '2018-04-06 17:24:47', NULL),
(15, 15, 'Receptionist', 1, 1, 15, 'en', '2018-04-06 17:24:47', NULL),
(16, 16, 'Sales / Marketing Executive', 1, 1, 16, 'en', '2018-04-06 17:24:47', NULL),
(17, 17, 'Sales Executive', 1, 1, 17, 'en', '2018-04-06 17:24:47', NULL),
(18, 18, 'Sales Officer', 1, 1, 18, 'en', '2018-04-06 17:24:47', NULL),
(19, 19, 'Subject Teacher', 1, 1, 19, 'en', '2018-04-06 17:24:47', NULL),
(20, 20, 'Web Developer', 1, 1, 20, 'en', '2018-04-06 17:24:47', '2018-04-08 23:49:35'),
(21, 5, 'Agente de centro de llamadas', 0, 1, 1, 'es', '2018-04-06 17:25:12', NULL),
(22, 13, 'Asistente de oficina', 0, 1, 2, 'es', '2018-04-06 17:25:12', NULL),
(23, 1, 'Contador', 0, 1, 3, 'es', '2018-04-06 17:25:12', NULL),
(24, 14, 'Desarrollador PHP', 0, 1, 4, 'es', '2018-04-06 17:25:12', NULL),
(25, 20, 'Desarrollador web', 0, 1, 5, 'es', '2018-04-06 17:25:12', NULL),
(26, 10, 'Diseñador grafico', 0, 1, 6, 'es', '2018-04-06 17:25:12', NULL),
(27, 11, 'Ejecutivo de marketing', 0, 1, 7, 'es', '2018-04-06 17:25:12', NULL),
(28, 3, 'Ejecutivo de Negocios para el Desarrollo', 0, 1, 8, 'es', '2018-04-06 17:25:12', NULL),
(29, 17, 'Ejecutivo de ventas', 0, 1, 9, 'es', '2018-04-06 17:25:12', NULL),
(30, 16, 'Ejecutivo en Ventas y Mercadotecnia', 0, 1, 10, 'es', '2018-04-06 17:25:12', NULL),
(31, 7, 'Escritor de contenido', 0, 1, 11, 'es', '2018-04-06 17:25:12', NULL),
(32, 12, 'Gerente de Marketing', 0, 1, 12, 'es', '2018-04-06 17:25:12', NULL),
(33, 19, 'Maestro de asignatura', 0, 1, 13, 'es', '2018-04-06 17:25:12', NULL),
(34, 2, 'Oficial de cuentas', 0, 1, 14, 'es', '2018-04-06 17:25:12', NULL),
(35, 4, 'Oficial de desarrollo de negocios', 0, 1, 15, 'es', '2018-04-06 17:25:12', NULL),
(36, 18, 'Oficial de las ventas', 0, 1, 16, 'es', '2018-04-06 17:25:12', NULL),
(37, 9, 'Operador de entrada de datos', 0, 1, 17, 'es', '2018-04-06 17:25:12', NULL),
(38, 6, 'Operador de la computadora', 0, 1, 18, 'es', '2018-04-06 17:25:12', NULL),
(39, 15, 'Recepcionista', 0, 1, 19, 'es', '2018-04-06 17:25:12', NULL),
(40, 8, 'Representante del cliente', 0, 1, 20, 'es', '2018-04-06 17:25:12', NULL),
(41, 11, 'التسويق التنفيذي', 0, 1, 1, 'ar', '2018-04-12 04:39:03', NULL),
(42, 17, 'المبيعات التنفيذي', 0, 1, 2, 'ar', '2018-04-12 04:39:03', NULL),
(43, 7, 'كاتب المحتوى', 0, 1, 3, 'ar', '2018-04-12 04:39:03', NULL),
(44, 16, 'مبيعات & أمبير؛ التسويق التنفيذي', 0, 1, 4, 'ar', '2018-04-12 04:39:03', NULL),
(45, 1, 'محاسب', 0, 1, 5, 'ar', '2018-04-12 04:39:03', NULL),
(46, 9, 'مدخل بيانات', 0, 1, 6, 'ar', '2018-04-12 04:39:03', NULL),
(47, 19, 'مدرس المادة', 0, 1, 7, 'ar', '2018-04-12 04:39:03', NULL),
(48, 12, 'مدير التسويق', 0, 1, 8, 'ar', '2018-04-12 04:39:03', NULL),
(49, 13, 'مساعد المكتب', 0, 1, 9, 'ar', '2018-04-12 04:39:03', NULL),
(50, 18, 'مسؤول المبيعات', 0, 1, 10, 'ar', '2018-04-12 04:39:03', NULL),
(51, 6, 'مشغل كمبيوتر', 0, 1, 11, 'ar', '2018-04-12 04:39:03', NULL),
(52, 10, 'مصمم جرافيك', 0, 1, 12, 'ar', '2018-04-12 04:39:03', NULL),
(53, 14, 'مطور PHP', 0, 1, 13, 'ar', '2018-04-12 04:39:03', NULL),
(54, 3, 'مطور الاعمال التنفيذيه', 0, 1, 14, 'ar', '2018-04-12 04:39:03', NULL),
(55, 20, 'مطور ويب', 0, 1, 15, 'ar', '2018-04-12 04:39:03', NULL),
(56, 8, 'ممثل مندوب العميل', 0, 1, 16, 'ar', '2018-04-12 04:39:03', NULL),
(57, 15, 'موظف الإستقبال', 0, 1, 17, 'ar', '2018-04-12 04:39:03', NULL),
(58, 4, 'موظف تطويرالعمل', 0, 1, 18, 'ar', '2018-04-12 04:39:03', NULL),
(59, 2, 'موظف حسابات', 0, 1, 19, 'ar', '2018-04-12 04:39:03', NULL),
(60, 5, 'وكيل مركز الاتصال', 0, 1, 20, 'ar', '2018-04-12 04:39:03', NULL),
(61, 15, 'استقبال', 0, 1, 1, 'ur', '2018-04-12 04:40:24', NULL),
(62, 2, 'اکاؤنٹس آفیسر', 0, 1, 2, 'ur', '2018-04-12 04:40:24', NULL),
(63, 1, 'اکاؤنٹنٹ', 0, 1, 3, 'ur', '2018-04-12 04:40:24', NULL),
(64, 13, 'آفس اسسٹنٹ. دفتری معاون', 0, 1, 4, 'ur', '2018-04-12 04:40:24', NULL),
(65, 14, 'پی ایچ پی ڈیولپر', 0, 1, 5, 'ur', '2018-04-12 04:40:24', NULL),
(66, 9, 'ڈیٹا انٹری آپریٹر', 0, 1, 6, 'ur', '2018-04-12 04:40:24', NULL),
(67, 16, 'سیلز / مارکیٹنگ ایگزیکٹو', 0, 1, 7, 'ur', '2018-04-12 04:40:24', NULL),
(68, 17, 'سیلز ایگزیکٹو', 0, 1, 8, 'ur', '2018-04-12 04:40:24', NULL),
(69, 18, 'سیلز آفیسر', 0, 1, 9, 'ur', '2018-04-12 04:40:24', NULL),
(70, 4, 'کاروباری ترقی افسر', 0, 1, 10, 'ur', '2018-04-12 04:40:24', NULL),
(71, 3, 'کاروباری ترقی ایگزیکٹو', 0, 1, 11, 'ur', '2018-04-12 04:40:24', NULL),
(72, 5, 'کال سینٹر ایجنٹ', 0, 1, 12, 'ur', '2018-04-12 04:40:24', NULL),
(73, 8, 'کسٹمر نمائندے آفیسر', 0, 1, 13, 'ur', '2018-04-12 04:40:24', NULL),
(74, 6, 'کمپیوٹر چلانے والا', 0, 1, 14, 'ur', '2018-04-12 04:40:24', NULL),
(75, 10, 'گرافک ڈیزائنر', 0, 1, 15, 'ur', '2018-04-12 04:40:24', NULL),
(76, 11, 'مارکیٹنگ ایگزیکٹو', 0, 1, 16, 'ur', '2018-04-12 04:40:24', NULL),
(77, 12, 'مارکیٹنگ مینیجر', 0, 1, 17, 'ur', '2018-04-12 04:40:24', NULL),
(78, 7, 'مواد مصنف', 0, 1, 18, 'ur', '2018-04-12 04:40:24', NULL),
(79, 19, 'موضوع ٹیچر', 0, 1, 19, 'ur', '2018-04-12 04:40:24', NULL),
(80, 20, 'ویب ڈویلپر', 0, 1, 20, 'ur', '2018-04-12 04:40:24', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `job_types`
--

CREATE TABLE `job_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_type_id` int(11) DEFAULT 0,
  `job_type` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `job_types`
--

INSERT INTO `job_types` (`id`, `job_type_id`, `job_type`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Contract', 1, 1, 1, 'en', '2018-04-06 09:24:38', '2018-04-08 23:18:35'),
(2, 2, 'Freelance', 1, 1, 2, 'en', '2018-04-06 09:25:25', '2018-04-08 23:18:35'),
(3, 3, 'Full Time/Permanent', 1, 1, 3, 'en', '2018-04-06 09:26:14', '2018-04-08 23:18:35'),
(4, 4, 'Internship', 1, 1, 4, 'en', '2018-04-06 09:26:58', '2018-04-08 23:18:27'),
(5, 5, 'Part Time', 1, 1, 5, 'en', '2018-04-06 09:29:17', '2018-04-08 23:18:35'),
(11, 1, 'Contrato', 0, 1, 1, 'es', '2018-04-12 04:49:44', NULL),
(12, 4, 'Internado', 0, 1, 2, 'es', '2018-04-12 04:49:44', NULL),
(13, 2, 'Lanza libre', 0, 1, 3, 'es', '2018-04-12 04:49:44', NULL),
(14, 5, 'Medio tiempo', 0, 1, 4, 'es', '2018-04-12 04:49:44', NULL),
(15, 3, 'Tiempo completo / permanente', 0, 1, 5, 'es', '2018-04-12 04:49:44', NULL),
(16, 2, 'حسابهم الخاص', 0, 1, 1, 'ar', '2018-04-12 04:51:20', NULL),
(17, 5, 'دوام جزئى', 0, 1, 2, 'ar', '2018-04-12 04:51:20', NULL),
(18, 3, 'دوام كامل', 0, 1, 3, 'ar', '2018-04-12 04:51:20', NULL),
(19, 1, 'عقد', 0, 1, 4, 'ar', '2018-04-12 04:51:20', NULL),
(20, 4, 'فترة تدريب', 0, 1, 5, 'ar', '2018-04-12 04:51:20', NULL),
(21, 4, 'انٹرنشپ', 0, 1, 1, 'ur', '2018-04-12 04:52:38', NULL),
(22, 5, 'حصہ وقت', 0, 1, 2, 'ur', '2018-04-12 04:52:38', NULL),
(23, 2, 'فری لانس', 0, 1, 3, 'ur', '2018-04-12 04:52:38', NULL),
(24, 1, 'معاہدہ', 0, 1, 4, 'ur', '2018-04-12 04:52:38', NULL),
(25, 3, 'مکمل وقت / مستقل', 0, 1, 5, 'ur', '2018-04-12 04:52:38', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `lang` varchar(250) DEFAULT NULL,
  `native` varchar(250) DEFAULT NULL,
  `iso_code` varchar(10) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT 0,
  `is_rtl` tinyint(1) NOT NULL DEFAULT 0,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `lang`, `native`, `iso_code`, `is_active`, `is_rtl`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', '英語', 'en', 1, 0, 0, '2018-06-24 18:16:38', '2023-06-07 08:19:28'),
(2, 'Japanese', '日本語', 'ja', 1, 0, 0, '2018-06-24 18:16:38', '2023-06-07 08:20:37');

-- --------------------------------------------------------

--
-- Table structure for table `languagetypes`
--

CREATE TABLE `languagetypes` (
  `id` int(11) NOT NULL,
  `lang_id` int(11) NOT NULL,
  `eng_title` varchar(55) NOT NULL,
  `jp_title` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `languagetypes`
--

INSERT INTO `languagetypes` (`id`, `lang_id`, `eng_title`, `jp_title`) VALUES
(1, 1, 'TOEFL', 'TOEFL（英語能力テスト）'),
(2, 1, 'IELTS', 'IELTS（国際英語検定システム）'),
(3, 1, 'Cambridge English Qualifications', 'ケンブリッジ英語資格'),
(4, 1, 'TOEIC', 'TOEIC'),
(5, 1, 'PTE Academic', 'ピーティーエー アカデミック'),
(6, 1, 'OET', 'OET'),
(7, 1, 'CELPIP', 'CELPIP'),
(8, 1, 'BULATS', 'BULATS（ビジネス言語テストサービス）'),
(9, 1, 'Trinity College London', 'トリニティ・カレッジ・ロンドン'),
(10, 1, 'Eiken', '英検（英語検定）'),
(11, 1, 'TESOL', 'TESOL'),
(12, 1, 'TEFL', 'TEFL'),
(13, 1, 'TKT', 'TKT'),
(14, 1, 'Cambridge TESOL', 'ケンブリッジTESOL'),
(15, 2, 'JLPT', '日本語能力試験'),
(16, 2, 'J-TEST', '日本語能力試験'),
(17, 2, 'JFT', '日本語教育能力検定試験'),
(18, 2, 'BJT', 'ビジネス日本語能力テスト'),
(19, 2, 'J-LEAP', '日本語能力試験特別対策プログラム'),
(20, 2, 'NAT-TEST', '日本語能力テスト'),
(21, 2, 'J-Check', '日本語能力評価試験'),
(22, 2, 'NAT-Test', '日本語総合能力テスト'),
(23, 2, 'J-PT', '日本語プロフィシェンシーテスト'),
(24, 2, 'EJU', '大学入学共通テスト'),
(25, 2, 'J-Top', '日本語テストオンラインプレースメントテスト'),
(26, 2, 'J-Check', '日本語能力評価試験'),
(27, 2, 'J-CAT', '日本語コンピュータアダプティブテスト'),
(28, 2, 'ECL', '日本語学習能力評価'),
(29, 2, 'J-STEP', '日本語教育能力検定試験');

-- --------------------------------------------------------

--
-- Table structure for table `language_converts`
--

CREATE TABLE `language_converts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `personal_information` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `education_history` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `working_experience` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `language_certification` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `other_certification` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language_converts`
--

INSERT INTO `language_converts` (`id`, `user_id`, `personal_information`, `education_history`, `working_experience`, `language_certification`, `other_certification`, `created_at`, `updated_at`) VALUES
(1, 6, '{\"first_name\":\"dsfsdf\",\"last_name\":\"sfdsfds\",\"birth_year\":\"1\",\"gender_id\":\"1\",\"email\":\"sdfsfd\",\"marital_status_id\":\"3\",\"country_id\":null,\"state_id\":null,\"city_id\":null,\"street_address\":null,\"jp_cell_phone\":null,\"emergency_contact_jp\":null,\"current_visa_status_id\":\"4\",\"emergency_cell_phone\":\"43543543\",\"jp_visa_expiry_year\":\"4\",\"jp_visa_expiry_month\":\"5\",\"jp_visa_expiry_day\":\"4\",\"country_id_bd\":null,\"state_id_bd\":null,\"city_id_bd\":null,\"bd_postal_code\":\"dfsdf\",\"bd_address\":\"dsfsd\",\"bd_cell_phone\":\"fsdf\",\"bd_children\":\"43534543\"}', '{\"ssc\":{\"entrance_year\":\"4\",\"entrance_month\":\"4\",\"pass_year\":\"3\",\"pass_month\":\"3\",\"institution_name\":\"4534543\"},\"hsc\":{\"entrance_year\":\"4\",\"entrance_month\":\"3\",\"pass_year\":\"3\",\"pass_month\":\"3\",\"institution_name\":\"435435\",\"major\":\"345435\"},\"university\":{\"entrance_year\":\"4\",\"entrance_month\":\"4\",\"pass_year\":\"3\",\"pass_month\":\"3\",\"institution_name\":\"45435\",\"major\":\"435345\"}}', '{\"0\":{\"title\":\"sdfds\"},\"1\":{\"company\":\"letvari\"},\"2\":{\"country_id\":\"Japan\"},\"3\":{\"entrance_year\":\"1\"},\"4\":{\"entrance_month\":\"1\"},\"5\":{\"pass_year\":\"1\"},\"6\":{\"pass_month\":\"1\"},\"7\":{\"description\":null},\"8\":{\"title\":null},\"9\":{\"company\":null},\"10\":{\"country_id\":null},\"11\":{\"entrance_year\":\"1\"},\"12\":{\"entrance_month\":\"1\"},\"13\":{\"pass_year\":\"1\"},\"14\":{\"pass_month\":\"1\"},\"15\":{\"description\":null},\"last_test_4cc\":{\"title\":\"sdfds\",\"company\":\"fdsf\",\"country_id\":\"sdfd\",\"entrance_year\":\"1\",\"entrance_month\":\"1\",\"pass_year\":\"1\",\"pass_month\":\"1\",\"description\":\"dsfdsfds\"}}', NULL, NULL, '2023-06-08 17:31:52', '2023-06-08 17:35:38');

-- --------------------------------------------------------

--
-- Table structure for table `language_level`
--

CREATE TABLE `language_level` (
  `id` int(11) NOT NULL,
  `title` varchar(10) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language_levels`
--

CREATE TABLE `language_levels` (
  `id` int(10) UNSIGNED NOT NULL,
  `language_level_id` int(11) DEFAULT 0,
  `language_level` varchar(40) NOT NULL,
  `jp_level` varchar(120) DEFAULT NULL,
  `is_default` int(11) DEFAULT 0,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 9999,
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `language_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `language_levels`
--

INSERT INTO `language_levels` (`id`, `language_level_id`, `language_level`, `jp_level`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`, `language_type_id`) VALUES
(1, 1, 'N 1', NULL, 1, 1, 2, 'en', '2018-07-02 14:10:45', '2023-06-07 08:40:04', 1),
(2, 1, 'N 2', NULL, 1, 1, 1, 'en', '2018-07-02 14:11:05', '2023-06-07 08:40:06', 1),
(3, 1, 'N 3', NULL, 1, 1, 3, 'en', '2018-07-02 14:11:22', '2023-06-07 08:40:07', 1),
(4, 1, 'N 4', NULL, 0, 1, 1, 'es', '2018-07-02 19:15:52', '2023-06-07 08:40:08', 1),
(5, 1, 'First', NULL, 0, 1, 2, 'es', '2018-07-02 19:15:52', '2023-06-07 08:53:20', 2),
(6, 1, 'Second', NULL, 0, 1, 3, 'es', '2018-07-02 19:15:52', '2023-06-07 08:53:26', 2),
(13, 0, 'Beginner', '初級', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 1),
(14, 0, 'Intermediate', '中級', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 1),
(15, 0, 'Advanced', '上級', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 1),
(16, 0, 'Band 5.0', 'バンド5.0', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 2),
(17, 0, 'Band 6.0', 'バンド6.0', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 2),
(18, 0, 'Band 7.0', 'バンド7.0', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 2),
(19, 0, 'A2', 'A2レベル', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 3),
(20, 0, 'B1', 'B1レベル', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 3),
(21, 0, 'B2', 'B2レベル', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 3),
(22, 0, 'Score 350', 'スコア350', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 4),
(23, 0, 'Score 500', 'スコア500', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 4),
(24, 0, 'Score 700', 'スコア700', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 4),
(25, 0, 'Level 1', 'レベル1', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 5),
(26, 0, 'Level 2', 'レベル2', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 5),
(27, 0, 'Level 3', 'レベル3', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 5),
(28, 0, 'Score 160', 'スコア160', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 6),
(29, 0, 'Score 180', 'スコア180', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 6),
(30, 0, 'Score 200', 'スコア200', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 6),
(31, 0, 'Level 1', 'レベル1', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 7),
(32, 0, 'Level 2', 'レベル2', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 7),
(33, 0, 'Level 3', 'レベル3', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 7),
(34, 0, 'Preliminary', 'プレリミナリー', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 8),
(35, 0, 'First', 'ファースト', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 8),
(36, 0, 'Advanced', 'アドバンスト', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 8),
(37, 0, 'Grade 5', '5級', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 9),
(38, 0, 'Grade 4', '4級', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 9),
(39, 0, 'Grade 3', '3級', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 9),
(40, 0, 'Grade 1', '1級', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 10),
(41, 0, 'Grade Pre-1', '準1級', 0, 1, 9999, 'en', '2023-06-08 05:07:08', NULL, 10),
(42, 0, 'JLPT N1', '日本語能力試験 N1級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 15),
(43, 0, 'JLPT N2', '日本語能力試験 N2級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 15),
(44, 0, 'JLPT N3', '日本語能力試験 N3級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 15),
(45, 0, 'JLPT N4', '日本語能力試験 N4級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 15),
(46, 0, 'JLPT N5', '日本語能力試験 N5級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 15),
(47, 0, 'J-TEST N1', '日本語能力試験 N1級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 16),
(48, 0, 'J-TEST N2', '日本語能力試験 N2級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 16),
(49, 0, 'J-TEST N3', '日本語能力試験 N3級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 16),
(50, 0, 'J-TEST N4', '日本語能力試験 N4級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 16),
(51, 0, 'J-TEST N5', '日本語能力試験 N5級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 16),
(52, 0, 'NAT N1', '日本語能力テスト N1級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 17),
(53, 0, 'NAT N2', '日本語能力テスト N2級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 17),
(54, 0, 'NAT N3', '日本語能力テスト N3級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 17),
(55, 0, 'NAT N4', '日本語能力テスト N4級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 17),
(56, 0, 'NAT N5', '日本語能力テスト N5級', 0, 1, 9999, 'en', '2023-06-08 05:33:36', NULL, 17);

-- --------------------------------------------------------

--
-- Table structure for table `major_subjects`
--

CREATE TABLE `major_subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `major_subject_id` int(11) DEFAULT 0,
  `major_subject` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `major_subjects`
--

INSERT INTO `major_subjects` (`id`, `major_subject_id`, `major_subject`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Abnormal Psychology', 1, 1, 1, 'en', '2018-06-23 20:01:47', NULL),
(2, 2, 'Accounting', 1, 1, 2, 'en', '2018-06-23 20:01:47', NULL),
(3, 3, 'Accounting & Finance', 1, 1, 3, 'en', '2018-06-23 20:01:47', NULL),
(4, 4, 'Acting and Performance', 1, 1, 4, 'en', '2018-06-23 20:01:47', NULL),
(5, 5, 'Addressing problems of learning through technology and pedagogy', 1, 1, 5, 'en', '2018-06-23 20:01:47', NULL),
(6, 6, 'Administrative Law and Accountability', 1, 1, 6, 'en', '2018-06-23 20:01:47', NULL),
(7, 7, 'Advance Computer Architecture', 1, 1, 7, 'en', '2018-06-23 20:01:47', NULL),
(8, 8, 'Advance Research Methods', 1, 1, 8, 'en', '2018-06-23 20:01:47', NULL),
(9, 9, 'Advanced Algorithms Analysis and Design', 1, 1, 9, 'en', '2018-06-23 20:01:47', NULL),
(10, 10, 'Advanced Bioinformatics', 1, 1, 10, 'en', '2018-06-23 20:01:47', NULL),
(11, 11, 'Advanced Computer Architecture-II', 1, 1, 11, 'en', '2018-06-23 20:01:47', NULL),
(12, 12, 'Advanced Computer Networks', 1, 1, 12, 'en', '2018-06-23 20:01:47', NULL),
(13, 13, 'Advanced Computing Approaches', 1, 1, 13, 'en', '2018-06-23 20:01:47', NULL),
(14, 14, 'Advanced Cost and Management Accounting', 1, 1, 14, 'en', '2018-06-23 20:01:47', NULL),
(15, 15, 'Advanced Financial Accounting', 1, 1, 15, 'en', '2018-06-23 20:01:47', NULL),
(16, 16, 'Advanced Operating Systems', 1, 1, 16, 'en', '2018-06-23 20:01:47', NULL),
(17, 17, 'Advertising', 1, 1, 17, 'en', '2018-06-23 20:01:47', NULL),
(18, 18, 'Advertising & Promotion', 1, 1, 18, 'en', '2018-06-23 20:01:47', NULL),
(19, 19, 'Advertising for Print and Electronic Media', 1, 1, 19, 'en', '2018-06-23 20:01:47', NULL),
(20, 20, 'Aeronautical & Manufacturing Engineering', 1, 1, 20, 'en', '2018-06-23 20:01:47', NULL),
(21, 21, 'Agribusiness', 1, 1, 21, 'en', '2018-06-23 20:01:47', NULL),
(22, 22, 'Agriculture & Forestry', 1, 1, 22, 'en', '2018-06-23 20:01:47', NULL),
(23, 23, 'Agriculture (general)', 1, 1, 23, 'en', '2018-06-23 20:01:47', NULL),
(24, 24, 'Agronomy & Plant Science', 1, 1, 24, 'en', '2018-06-23 20:01:47', NULL),
(25, 25, 'American Studies', 1, 1, 25, 'en', '2018-06-23 20:01:47', NULL),
(26, 26, 'Anatomy & Physiology', 1, 1, 26, 'en', '2018-06-23 20:01:47', NULL),
(27, 27, 'Animal Science', 1, 1, 27, 'en', '2018-06-23 20:01:47', NULL),
(28, 28, 'Anthropological Science', 1, 1, 28, 'en', '2018-06-23 20:01:47', NULL),
(29, 29, 'Anthropology', 1, 1, 29, 'en', '2018-06-23 20:01:47', NULL),
(30, 30, 'Aquaculture & Fisheries', 1, 1, 30, 'en', '2018-06-23 20:01:47', NULL),
(31, 31, 'Archaeology', 1, 1, 31, 'en', '2018-06-23 20:01:47', NULL),
(32, 32, 'Architecture', 1, 1, 32, 'en', '2018-06-23 20:01:47', NULL),
(33, 33, 'Art & Design', 1, 1, 33, 'en', '2018-06-23 20:01:47', NULL),
(34, 34, 'Art History & Theory', 1, 1, 34, 'en', '2018-06-23 20:01:47', NULL),
(35, 35, 'Artificial Intelligence', 1, 1, 35, 'en', '2018-06-23 20:01:47', NULL),
(36, 36, 'Asian Studies', 1, 1, 36, 'en', '2018-06-23 20:01:47', NULL),
(37, 37, 'Astronomy', 1, 1, 37, 'en', '2018-06-23 20:01:47', NULL),
(38, 38, 'Audio-Visual Editing', 1, 1, 38, 'en', '2018-06-23 20:01:47', NULL),
(39, 39, 'Aural & Oral Sciences', 1, 1, 39, 'en', '2018-06-23 20:01:47', NULL),
(40, 40, 'Aviation  ', 1, 1, 40, 'en', '2018-06-23 20:01:47', NULL),
(41, 41, 'Aviation Management', 1, 1, 41, 'en', '2018-06-23 20:01:47', NULL),
(42, 42, 'Banking Laws & Practices', 1, 1, 42, 'en', '2018-06-23 20:01:47', NULL),
(43, 43, 'Biblical Studies', 1, 1, 43, 'en', '2018-06-23 20:01:47', NULL),
(44, 44, 'Biochemistry', 1, 1, 44, 'en', '2018-06-23 20:01:47', NULL),
(45, 45, 'Biochemistry-I', 1, 1, 45, 'en', '2018-06-23 20:01:47', NULL),
(46, 46, 'Bioethics, Biosecurity and Biosafety', 1, 1, 46, 'en', '2018-06-23 20:01:47', NULL),
(47, 47, 'Bioinformatics', 1, 1, 47, 'en', '2018-06-23 20:01:47', NULL),
(48, 48, 'Bioinformatics I (Essentials of Genome Informatics)', 1, 1, 48, 'en', '2018-06-23 20:01:47', NULL),
(49, 49, 'Biological Sciences', 1, 1, 49, 'en', '2018-06-23 20:01:47', NULL),
(50, 50, 'Biology (general)', 1, 1, 50, 'en', '2018-06-23 20:01:47', NULL),
(51, 51, 'Biomedical Engineering', 1, 1, 51, 'en', '2018-06-23 20:01:47', NULL),
(52, 52, 'Biomedical Sciences (not elsewhere classified)', 1, 1, 52, 'en', '2018-06-23 20:01:47', NULL),
(53, 53, 'Biotechnology', 1, 1, 53, 'en', '2018-06-23 20:01:47', NULL),
(54, 54, 'Botany', 1, 1, 54, 'en', '2018-06-23 20:01:47', NULL),
(55, 55, 'Brand Management', 1, 1, 55, 'en', '2018-06-23 20:01:47', NULL),
(56, 56, 'Building', 1, 1, 56, 'en', '2018-06-23 20:01:47', NULL),
(57, 57, 'Business & Labor Law', 1, 1, 57, 'en', '2018-06-23 20:01:47', NULL),
(58, 58, 'Business & Management Studies', 1, 1, 58, 'en', '2018-06-23 20:01:47', NULL),
(59, 59, 'Business and Technical English Writing', 1, 1, 59, 'en', '2018-06-23 20:01:47', NULL),
(60, 60, 'Business Communication', 1, 1, 60, 'en', '2018-06-23 20:01:47', NULL),
(61, 61, 'Business Econometrics', 1, 1, 61, 'en', '2018-06-23 20:01:47', NULL),
(62, 62, 'Business Ethics', 1, 1, 62, 'en', '2018-06-23 20:01:47', NULL),
(63, 63, 'Business Finance', 1, 1, 63, 'en', '2018-06-23 20:01:47', NULL),
(64, 64, 'Business Mathematics & Statistics', 1, 1, 64, 'en', '2018-06-23 20:01:47', NULL),
(65, 65, 'Calculus And Analytical Geometry', 1, 1, 65, 'en', '2018-06-23 20:01:47', NULL),
(66, 66, 'Calculus II', 1, 1, 66, 'en', '2018-06-23 20:01:47', NULL),
(67, 67, 'Camera basics, principles and practices', 1, 1, 67, 'en', '2018-06-23 20:01:47', NULL),
(68, 68, 'Cell Biology', 1, 1, 68, 'en', '2018-06-23 20:01:47', NULL),
(69, 69, 'Celtic Studies', 1, 1, 69, 'en', '2018-06-23 20:01:47', NULL),
(70, 70, 'Change Management', 1, 1, 70, 'en', '2018-06-23 20:01:47', NULL),
(71, 71, 'Chemical & Process Engineering', 1, 1, 71, 'en', '2018-06-23 20:01:47', NULL),
(72, 72, 'Chemical Engineering', 1, 1, 72, 'en', '2018-06-23 20:01:47', NULL),
(73, 73, 'Chemistry', 1, 1, 73, 'en', '2018-06-23 20:01:47', NULL),
(74, 74, 'Child Development', 1, 1, 74, 'en', '2018-06-23 20:01:47', NULL),
(75, 75, 'Chinese', 1, 1, 75, 'en', '2018-06-23 20:01:47', NULL),
(76, 76, 'Chinese Studies', 1, 1, 76, 'en', '2018-06-23 20:01:47', NULL),
(77, 77, 'Christian Thought & History', 1, 1, 77, 'en', '2018-06-23 20:01:47', NULL),
(78, 78, 'Circuit Theory', 1, 1, 78, 'en', '2018-06-23 20:01:47', NULL),
(79, 79, 'Civil Engineering', 1, 1, 79, 'en', '2018-06-23 20:01:47', NULL),
(80, 80, 'Classical Studies', 1, 1, 80, 'en', '2018-06-23 20:01:47', NULL),
(81, 81, 'Classics & Ancient History', 1, 1, 81, 'en', '2018-06-23 20:01:47', NULL),
(82, 82, 'Classroom Assessment', 1, 1, 82, 'en', '2018-06-23 20:01:47', NULL),
(83, 83, 'Classroom Management', 1, 1, 83, 'en', '2018-06-23 20:01:47', NULL),
(84, 84, 'Clinical Psychology', 1, 1, 84, 'en', '2018-06-23 20:01:47', NULL),
(85, 85, 'Clothing & Textiles', 1, 1, 85, 'en', '2018-06-23 20:01:47', NULL),
(86, 86, 'Cognitive Psychology', 1, 1, 86, 'en', '2018-06-23 20:01:47', NULL),
(87, 87, 'Commercial Law', 1, 1, 87, 'en', '2018-06-23 20:01:47', NULL),
(88, 88, 'Communication & Media Studies', 1, 1, 88, 'en', '2018-06-23 20:01:47', NULL),
(89, 89, 'Communication & Professional Writing', 1, 1, 89, 'en', '2018-06-23 20:01:47', NULL),
(90, 90, 'Communication skills', 1, 1, 90, 'en', '2018-06-23 20:01:47', NULL),
(91, 91, 'Compiler Construction', 1, 1, 91, 'en', '2018-06-23 20:01:47', NULL),
(92, 92, 'Complementary Medicine', 1, 1, 92, 'en', '2018-06-23 20:01:47', NULL),
(93, 93, 'Computer Architecture and Assembly Language Programming', 1, 1, 93, 'en', '2018-06-23 20:01:47', NULL),
(94, 94, 'Computer Engineering', 1, 1, 94, 'en', '2018-06-23 20:01:47', NULL),
(95, 95, 'Computer Graphics', 1, 1, 95, 'en', '2018-06-23 20:01:47', NULL),
(96, 96, 'Computer Network', 1, 1, 96, 'en', '2018-06-23 20:01:47', NULL),
(97, 97, 'Computer Science', 1, 1, 97, 'en', '2018-06-23 20:01:47', NULL),
(98, 98, 'Conflict Management', 1, 1, 98, 'en', '2018-06-23 20:01:47', NULL),
(99, 99, 'Conflict Resolution', 1, 1, 99, 'en', '2018-06-23 20:01:47', NULL),
(100, 100, 'Construction & Project Management', 1, 1, 100, 'en', '2018-06-23 20:01:47', NULL),
(101, 101, 'Consumer Banking', 1, 1, 101, 'en', '2018-06-23 20:01:47', NULL),
(102, 102, 'Consumer Behaviour', 1, 1, 102, 'en', '2018-06-23 20:01:47', NULL),
(103, 103, 'Consumer Psychology', 1, 1, 103, 'en', '2018-06-23 20:01:47', NULL),
(104, 104, 'Corporate Finance', 1, 1, 104, 'en', '2018-06-23 20:01:47', NULL),
(105, 105, 'Corporate Law', 1, 1, 105, 'en', '2018-06-23 20:01:47', NULL),
(106, 106, 'Cost & Management Accounting', 1, 1, 106, 'en', '2018-06-23 20:01:47', NULL),
(107, 107, 'Counselling', 1, 1, 107, 'en', '2018-06-23 20:01:47', NULL),
(108, 108, 'Creative Writing', 1, 1, 108, 'en', '2018-06-23 20:01:47', NULL),
(109, 109, 'Credit & Risk Management', 1, 1, 109, 'en', '2018-06-23 20:01:47', NULL),
(110, 110, 'Criminology', 1, 1, 110, 'en', '2018-06-23 20:01:47', NULL),
(111, 111, 'Criminology & Justice', 1, 1, 111, 'en', '2018-06-23 20:01:47', NULL),
(112, 112, 'Crisis Management', 1, 1, 112, 'en', '2018-06-23 20:01:47', NULL),
(113, 113, 'Critical Thinking and reflective Practice', 1, 1, 113, 'en', '2018-06-23 20:01:47', NULL),
(114, 114, 'Cultural Anthropology', 1, 1, 114, 'en', '2018-06-23 20:01:47', NULL),
(115, 115, 'Cultural Studies', 1, 1, 115, 'en', '2018-06-23 20:01:47', NULL),
(116, 116, 'Curriculum Development', 1, 1, 116, 'en', '2018-06-23 20:01:47', NULL),
(117, 117, 'Customer Relationship Management', 1, 1, 117, 'en', '2018-06-23 20:01:47', NULL),
(118, 118, 'Dance', 1, 1, 118, 'en', '2018-06-23 20:01:47', NULL),
(119, 119, 'Data Communication', 1, 1, 119, 'en', '2018-06-23 20:01:47', NULL),
(120, 120, 'Data Structures', 1, 1, 120, 'en', '2018-06-23 20:01:47', NULL),
(121, 121, 'Data Warehousing', 1, 1, 121, 'en', '2018-06-23 20:01:47', NULL),
(122, 122, 'Database Management Systems', 1, 1, 122, 'en', '2018-06-23 20:01:47', NULL),
(123, 123, 'Database Modeling and Design', 1, 1, 123, 'en', '2018-06-23 20:01:47', NULL),
(124, 124, 'Defence Studies', 1, 1, 124, 'en', '2018-06-23 20:01:47', NULL),
(125, 125, 'Dental Technology', 1, 1, 125, 'en', '2018-06-23 20:01:47', NULL),
(126, 126, 'Dentistry', 1, 1, 126, 'en', '2018-06-23 20:01:47', NULL),
(127, 127, 'Design (general)', 1, 1, 127, 'en', '2018-06-23 20:01:47', NULL),
(128, 128, 'Development Economics', 1, 1, 128, 'en', '2018-06-23 20:01:47', NULL),
(129, 129, 'Differential Equations', 1, 1, 129, 'en', '2018-06-23 20:01:47', NULL),
(130, 130, 'Digital Logic Design', 1, 1, 130, 'en', '2018-06-23 20:01:47', NULL),
(131, 131, 'Discrete Mathematics', 1, 1, 131, 'en', '2018-06-23 20:01:47', NULL),
(132, 132, 'Distributed DBMS', 1, 1, 132, 'en', '2018-06-23 20:01:47', NULL),
(133, 133, 'Drama / Theatre Studies', 1, 1, 133, 'en', '2018-06-23 20:01:47', NULL),
(134, 134, 'Drama, Dance & Cinematics', 1, 1, 134, 'en', '2018-06-23 20:01:47', NULL),
(135, 135, 'Earth Science (general)', 1, 1, 135, 'en', '2018-06-23 20:01:47', NULL),
(136, 136, 'East & South Asian Studies', 1, 1, 136, 'en', '2018-06-23 20:01:47', NULL),
(137, 137, 'Ecology', 1, 1, 137, 'en', '2018-06-23 20:01:47', NULL),
(138, 138, 'E-Commerce', 1, 1, 138, 'en', '2018-06-23 20:01:47', NULL),
(139, 139, 'Economics', 1, 1, 139, 'en', '2018-06-23 20:01:47', NULL),
(140, 140, 'Education', 1, 1, 140, 'en', '2018-06-23 20:01:47', NULL),
(141, 141, 'Education Development in Pakistan', 1, 1, 141, 'en', '2018-06-23 20:01:47', NULL),
(142, 142, 'Education Studies', 1, 1, 142, 'en', '2018-06-23 20:01:47', NULL),
(143, 143, 'Educational Governance Policy and Practice', 1, 1, 143, 'en', '2018-06-23 20:01:47', NULL),
(144, 144, 'Educational Leadership and Management', 1, 1, 144, 'en', '2018-06-23 20:01:47', NULL),
(145, 145, 'Educational Psychology', 1, 1, 145, 'en', '2018-06-23 20:01:47', NULL),
(146, 146, 'Electrical & Electronic Engineering', 1, 1, 146, 'en', '2018-06-23 20:01:47', NULL),
(147, 147, 'Electrical Engineering', 1, 1, 147, 'en', '2018-06-23 20:01:47', NULL),
(148, 148, 'Electronics', 1, 1, 148, 'en', '2018-06-23 20:01:47', NULL),
(149, 149, 'Elementary English', 1, 1, 149, 'en', '2018-06-23 20:01:47', NULL),
(150, 150, 'Elementary Mathematics', 1, 1, 150, 'en', '2018-06-23 20:01:47', NULL),
(151, 151, 'Energy Studies & Management', 1, 1, 151, 'en', '2018-06-23 20:01:47', NULL),
(152, 152, 'Engineering Science', 1, 1, 152, 'en', '2018-06-23 20:01:47', NULL),
(153, 153, 'English', 1, 1, 153, 'en', '2018-06-23 20:01:47', NULL),
(154, 154, 'English as a Second Language', 1, 1, 154, 'en', '2018-06-23 20:01:47', NULL),
(155, 155, 'English Comprehension', 1, 1, 155, 'en', '2018-06-23 20:01:47', NULL),
(156, 156, 'Entrepreneurship', 1, 1, 156, 'en', '2018-06-23 20:01:47', NULL),
(157, 157, 'Environmental & Natural Resources Engineering', 1, 1, 157, 'en', '2018-06-23 20:01:47', NULL),
(158, 158, 'Environmental Health', 1, 1, 158, 'en', '2018-06-23 20:01:47', NULL),
(159, 159, 'Environmental Psychology', 1, 1, 159, 'en', '2018-06-23 20:01:47', NULL),
(160, 160, 'Environmental Science', 1, 1, 160, 'en', '2018-06-23 20:01:47', NULL),
(161, 161, 'Environmental Studies', 1, 1, 161, 'en', '2018-06-23 20:01:47', NULL),
(162, 162, 'Essentials of Genetics', 1, 1, 162, 'en', '2018-06-23 20:01:47', NULL),
(163, 163, 'Ethics', 1, 1, 163, 'en', '2018-06-23 20:01:47', NULL),
(164, 164, 'Ethics (for Non-Muslims)', 1, 1, 164, 'en', '2018-06-23 20:01:47', NULL),
(165, 165, 'European Languages & Cultures', 1, 1, 165, 'en', '2018-06-23 20:01:48', NULL),
(166, 166, 'European Studies', 1, 1, 166, 'en', '2018-06-23 20:01:48', NULL),
(167, 167, 'Fashion', 1, 1, 167, 'en', '2018-06-23 20:01:48', NULL),
(168, 168, 'Fashion Design', 1, 1, 168, 'en', '2018-06-23 20:01:48', NULL),
(169, 169, 'Feature & Column Writing', 1, 1, 169, 'en', '2018-06-23 20:01:48', NULL),
(170, 170, 'Film & Media Studies', 1, 1, 170, 'en', '2018-06-23 20:01:48', NULL),
(171, 171, 'Film Making', 1, 1, 171, 'en', '2018-06-23 20:01:48', NULL),
(172, 172, 'Film-making', 1, 1, 172, 'en', '2018-06-23 20:01:48', NULL),
(173, 173, 'Finance', 1, 1, 173, 'en', '2018-06-23 20:01:48', NULL),
(174, 174, 'Financial Accounting', 1, 1, 174, 'en', '2018-06-23 20:01:48', NULL),
(175, 175, 'Financial Accounting II', 1, 1, 175, 'en', '2018-06-23 20:01:48', NULL),
(176, 176, 'Financial Management', 1, 1, 176, 'en', '2018-06-23 20:01:48', NULL),
(177, 177, 'Financial Statement Analysis', 1, 1, 177, 'en', '2018-06-23 20:01:48', NULL),
(178, 178, 'Fine Arts', 1, 1, 178, 'en', '2018-06-23 20:01:48', NULL),
(179, 179, 'Food Science', 1, 1, 179, 'en', '2018-06-23 20:01:48', NULL),
(180, 180, 'Forensic Analytical Science', 1, 1, 180, 'en', '2018-06-23 20:01:48', NULL),
(181, 181, 'Forensic Psychology', 1, 1, 181, 'en', '2018-06-23 20:01:48', NULL),
(182, 182, 'Forensic Science', 1, 1, 182, 'en', '2018-06-23 20:01:48', NULL),
(183, 183, 'Forestry', 1, 1, 183, 'en', '2018-06-23 20:01:48', NULL),
(184, 184, 'Formal Methods for Software Engineering', 1, 1, 184, 'en', '2018-06-23 20:01:48', NULL),
(185, 185, 'Foundations of Education', 1, 1, 185, 'en', '2018-06-23 20:01:48', NULL),
(186, 186, 'French', 1, 1, 186, 'en', '2018-06-23 20:01:48', NULL),
(187, 187, 'Fundamentals of Algorithms', 1, 1, 187, 'en', '2018-06-23 20:01:48', NULL),
(188, 188, 'Fundamentals of Auditing', 1, 1, 188, 'en', '2018-06-23 20:01:48', NULL),
(189, 189, 'Fundamentals of Public Relations', 1, 1, 189, 'en', '2018-06-23 20:01:48', NULL),
(190, 190, 'Gender Issues in Psychology', 1, 1, 190, 'en', '2018-06-23 20:01:48', NULL),
(191, 191, 'Gender Studies', 1, 1, 191, 'en', '2018-06-23 20:01:48', NULL),
(192, 192, 'Gene Manipulation and Genetic Engineering', 1, 1, 192, 'en', '2018-06-23 20:01:48', NULL),
(193, 193, 'General Engineering', 1, 1, 193, 'en', '2018-06-23 20:01:48', NULL),
(194, 194, 'General Mathematics', 1, 1, 194, 'en', '2018-06-23 20:01:48', NULL),
(195, 195, 'General Methods of Teaching', 1, 1, 195, 'en', '2018-06-23 20:01:48', NULL),
(196, 196, 'General Science', 1, 1, 196, 'en', '2018-06-23 20:01:48', NULL),
(197, 197, 'Genetics', 1, 1, 197, 'en', '2018-06-23 20:01:48', NULL),
(198, 198, 'Geography', 1, 1, 198, 'en', '2018-06-23 20:01:48', NULL),
(199, 199, 'Geography & Environmental Sciences', 1, 1, 199, 'en', '2018-06-23 20:01:48', NULL),
(200, 200, 'Geology', 1, 1, 200, 'en', '2018-06-23 20:01:48', NULL),
(201, 201, 'German', 1, 1, 201, 'en', '2018-06-23 20:01:48', NULL),
(202, 202, 'Globalization of Media', 1, 1, 202, 'en', '2018-06-23 20:01:48', NULL),
(203, 203, 'Graphic Design', 1, 1, 203, 'en', '2018-06-23 20:01:48', NULL),
(204, 204, 'Greek', 1, 1, 204, 'en', '2018-06-23 20:01:48', NULL),
(205, 205, 'Health Promotion', 1, 1, 205, 'en', '2018-06-23 20:01:48', NULL),
(206, 206, 'Health Psychology', 1, 1, 206, 'en', '2018-06-23 20:01:48', NULL),
(207, 207, 'History', 1, 1, 207, 'en', '2018-06-23 20:01:48', NULL),
(208, 208, 'History & Systems of Psychology', 1, 1, 208, 'en', '2018-06-23 20:01:48', NULL),
(209, 209, 'History of Art, Architecture & Design', 1, 1, 209, 'en', '2018-06-23 20:01:48', NULL),
(210, 210, 'Hospitality Management', 1, 1, 210, 'en', '2018-06-23 20:01:48', NULL),
(211, 211, 'Hospitality, Leisure, Recreation & Tourism', 1, 1, 211, 'en', '2018-06-23 20:01:48', NULL),
(212, 212, 'Human Computer Interaction', 1, 1, 212, 'en', '2018-06-23 20:01:48', NULL),
(213, 213, 'Human Development Studies', 1, 1, 213, 'en', '2018-06-23 20:01:48', NULL),
(214, 214, 'Human Nutrition', 1, 1, 214, 'en', '2018-06-23 20:01:48', NULL),
(215, 215, 'Human Relations', 1, 1, 215, 'en', '2018-06-23 20:01:48', NULL),
(216, 216, 'Human Resource Development', 1, 1, 216, 'en', '2018-06-23 20:01:48', NULL),
(217, 217, 'Human Resource Management', 1, 1, 217, 'en', '2018-06-23 20:01:48', NULL),
(218, 218, 'Iberian Languages/Hispanic Studies', 1, 1, 218, 'en', '2018-06-23 20:01:48', NULL),
(219, 219, 'Information Retrieval Techniques', 1, 1, 219, 'en', '2018-06-23 20:01:48', NULL),
(220, 220, 'Information Science', 1, 1, 220, 'en', '2018-06-23 20:01:48', NULL),
(221, 221, 'Information Systems', 1, 1, 221, 'en', '2018-06-23 20:01:48', NULL),
(222, 222, 'International Business', 1, 1, 222, 'en', '2018-06-23 20:01:48', NULL),
(223, 223, 'International Communication', 1, 1, 223, 'en', '2018-06-23 20:01:48', NULL),
(224, 224, 'International Marketing', 1, 1, 224, 'en', '2018-06-23 20:01:48', NULL),
(225, 225, 'International Relations', 1, 1, 225, 'en', '2018-06-23 20:01:48', NULL),
(226, 226, 'International Studies', 1, 1, 226, 'en', '2018-06-23 20:01:48', NULL),
(227, 227, 'Interpreting & Translating', 1, 1, 227, 'en', '2018-06-23 20:01:48', NULL),
(228, 228, 'Introduction to Broadcasting', 1, 1, 228, 'en', '2018-06-23 20:01:48', NULL),
(229, 229, 'Introduction To Business', 1, 1, 229, 'en', '2018-06-23 20:01:48', NULL),
(230, 230, 'Introduction to Computing', 1, 1, 230, 'en', '2018-06-23 20:01:48', NULL),
(231, 231, 'Introduction to Guidance and Counseling', 1, 1, 231, 'en', '2018-06-23 20:01:48', NULL),
(232, 232, 'Introduction to Mass Communication', 1, 1, 232, 'en', '2018-06-23 20:01:48', NULL),
(233, 233, 'Introduction to Network Design & Analysis', 1, 1, 233, 'en', '2018-06-23 20:01:48', NULL),
(234, 234, 'Introduction to Programming', 1, 1, 234, 'en', '2018-06-23 20:01:48', NULL),
(235, 235, 'Introduction to Psychology', 1, 1, 235, 'en', '2018-06-23 20:01:48', NULL),
(236, 236, 'Introduction to Public Administration', 1, 1, 236, 'en', '2018-06-23 20:01:48', NULL),
(237, 237, 'Introduction to Sociology', 1, 1, 237, 'en', '2018-06-23 20:01:48', NULL),
(238, 238, 'Introduction to Web Services Development', 1, 1, 238, 'en', '2018-06-23 20:01:48', NULL),
(239, 239, 'Investment Analysis & Portfolio Management', 1, 1, 239, 'en', '2018-06-23 20:01:48', NULL),
(240, 240, 'Islamic Studies', 1, 1, 240, 'en', '2018-06-23 20:01:48', NULL),
(241, 241, 'Italian', 1, 1, 241, 'en', '2018-06-23 20:01:48', NULL),
(242, 242, 'Japanese', 1, 1, 242, 'en', '2018-06-23 20:01:48', NULL),
(243, 243, 'Japanese Studies', 1, 1, 243, 'en', '2018-06-23 20:01:48', NULL),
(244, 244, 'Journalism', 1, 1, 244, 'en', '2018-06-23 20:01:48', NULL),
(245, 245, 'Journalistic Writing', 1, 1, 245, 'en', '2018-06-23 20:01:48', NULL),
(246, 246, 'Knowledge Management', 1, 1, 246, 'en', '2018-06-23 20:01:48', NULL),
(247, 247, 'Korean', 1, 1, 247, 'en', '2018-06-23 20:01:48', NULL),
(248, 248, 'Labour & Industrial Relations', 1, 1, 248, 'en', '2018-06-23 20:01:48', NULL),
(249, 249, 'Land & Property Management', 1, 1, 249, 'en', '2018-06-23 20:01:48', NULL),
(250, 250, 'Land Use Planning & Management', 1, 1, 250, 'en', '2018-06-23 20:01:48', NULL),
(251, 251, 'Latin', 1, 1, 251, 'en', '2018-06-23 20:01:48', NULL),
(252, 252, 'Law', 1, 1, 252, 'en', '2018-06-23 20:01:48', NULL),
(253, 253, 'Leadership & Team Management', 1, 1, 253, 'en', '2018-06-23 20:01:48', NULL),
(254, 254, 'Learning Theories', 1, 1, 254, 'en', '2018-06-23 20:01:48', NULL),
(255, 255, 'Librarianship & Information Management', 1, 1, 255, 'en', '2018-06-23 20:01:48', NULL),
(256, 256, 'Lighting for TV Production', 1, 1, 256, 'en', '2018-06-23 20:01:48', NULL),
(257, 257, 'Linear Algebra', 1, 1, 257, 'en', '2018-06-23 20:01:48', NULL),
(258, 258, 'Linguistics', 1, 1, 258, 'en', '2018-06-23 20:01:48', NULL),
(259, 259, 'Macroeconomics', 1, 1, 259, 'en', '2018-06-23 20:01:48', NULL),
(260, 260, 'Management', 1, 1, 260, 'en', '2018-06-23 20:01:48', NULL),
(261, 261, 'Management of Financial Institutions', 1, 1, 261, 'en', '2018-06-23 20:01:48', NULL),
(262, 262, 'Management Skills', 1, 1, 262, 'en', '2018-06-23 20:01:48', NULL),
(263, 263, 'Managerial Accounting', 1, 1, 263, 'en', '2018-06-23 20:01:48', NULL),
(264, 264, 'Managerial Economics', 1, 1, 264, 'en', '2018-06-23 20:01:48', NULL),
(265, 265, 'Māori Development', 1, 1, 265, 'en', '2018-06-23 20:01:48', NULL),
(266, 266, 'Māori Health', 1, 1, 266, 'en', '2018-06-23 20:01:48', NULL),
(267, 267, 'Māori Language / Te Reo Māori', 1, 1, 267, 'en', '2018-06-23 20:01:48', NULL),
(268, 268, 'Māori Media Studies', 1, 1, 268, 'en', '2018-06-23 20:01:48', NULL),
(269, 269, 'Māori Studies', 1, 1, 269, 'en', '2018-06-23 20:01:48', NULL),
(270, 270, 'Māori Visual Arts', 1, 1, 270, 'en', '2018-06-23 20:01:48', NULL),
(271, 271, 'Marine Biology', 1, 1, 271, 'en', '2018-06-23 20:01:48', NULL),
(272, 272, 'Marine Science', 1, 1, 272, 'en', '2018-06-23 20:01:48', NULL),
(273, 273, 'Maritime Engineering', 1, 1, 273, 'en', '2018-06-23 20:01:48', NULL),
(274, 274, 'Marketing', 1, 1, 274, 'en', '2018-06-23 20:01:48', NULL),
(275, 275, 'Marketing Management', 1, 1, 275, 'en', '2018-06-23 20:01:48', NULL),
(276, 276, 'Marketing Research', 1, 1, 276, 'en', '2018-06-23 20:01:48', NULL),
(277, 277, 'Mass Communication Law & Ethics', 1, 1, 277, 'en', '2018-06-23 20:01:48', NULL),
(278, 278, 'Mass Media in Pakistan', 1, 1, 278, 'en', '2018-06-23 20:01:48', NULL),
(279, 279, 'Materials Technology', 1, 1, 279, 'en', '2018-06-23 20:01:48', NULL),
(280, 280, 'Mathematical Methods', 1, 1, 280, 'en', '2018-06-23 20:01:48', NULL),
(281, 281, 'Mathematics', 1, 1, 281, 'en', '2018-06-23 20:01:48', NULL),
(282, 282, 'Mechanical Engineering', 1, 1, 282, 'en', '2018-06-23 20:01:48', NULL),
(283, 283, 'Mechatronics', 1, 1, 283, 'en', '2018-06-23 20:01:48', NULL),
(284, 284, 'Medical Laboratory Science', 1, 1, 284, 'en', '2018-06-23 20:01:48', NULL),
(285, 285, 'Medical Technology', 1, 1, 285, 'en', '2018-06-23 20:01:48', NULL),
(286, 286, 'Medicine', 1, 1, 286, 'en', '2018-06-23 20:01:48', NULL),
(287, 287, 'Microbiology', 1, 1, 287, 'en', '2018-06-23 20:01:48', NULL),
(288, 288, 'Microeconomics', 1, 1, 288, 'en', '2018-06-23 20:01:48', NULL),
(289, 289, 'Middle Eastern & African Studies', 1, 1, 289, 'en', '2018-06-23 20:01:48', NULL),
(290, 290, 'Midwifery', 1, 1, 290, 'en', '2018-06-23 20:01:48', NULL),
(291, 291, 'Mobile and Pervasive Computing', 1, 1, 291, 'en', '2018-06-23 20:01:48', NULL),
(292, 292, 'Modern Biotechnology: Principles & Applications', 1, 1, 292, 'en', '2018-06-23 20:01:48', NULL),
(293, 293, 'Modern Programming Languages', 1, 1, 293, 'en', '2018-06-23 20:01:48', NULL),
(294, 294, 'Molecular Biology', 1, 1, 294, 'en', '2018-06-23 20:01:48', NULL),
(295, 295, 'Money & Banking', 1, 1, 295, 'en', '2018-06-23 20:01:48', NULL),
(296, 296, 'Multivariable Calculus', 1, 1, 296, 'en', '2018-06-23 20:01:48', NULL),
(297, 297, 'Music', 1, 1, 297, 'en', '2018-06-23 20:01:48', NULL),
(298, 298, 'Music Composition', 1, 1, 298, 'en', '2018-06-23 20:01:48', NULL),
(299, 299, 'Music Performance', 1, 1, 299, 'en', '2018-06-23 20:01:48', NULL),
(300, 300, 'Music Production', 1, 1, 300, 'en', '2018-06-23 20:01:48', NULL),
(301, 301, 'Music Studies', 1, 1, 301, 'en', '2018-06-23 20:01:48', NULL),
(302, 302, 'Nanoscience', 1, 1, 302, 'en', '2018-06-23 20:01:48', NULL),
(303, 303, 'Network Performance Evaluation', 1, 1, 303, 'en', '2018-06-23 20:01:48', NULL),
(304, 304, 'Network Security', 1, 1, 304, 'en', '2018-06-23 20:01:48', NULL),
(305, 305, 'Neurological Bases of Behavior', 1, 1, 305, 'en', '2018-06-23 20:01:48', NULL),
(306, 306, 'Neuroscience', 1, 1, 306, 'en', '2018-06-23 20:01:48', NULL),
(307, 307, 'New Zealand Sign Language', 1, 1, 307, 'en', '2018-06-23 20:01:48', NULL),
(308, 308, 'Numerical Analysis', 1, 1, 308, 'en', '2018-06-23 20:01:48', NULL),
(309, 309, 'Nursing', 1, 1, 309, 'en', '2018-06-23 20:01:48', NULL),
(310, 310, 'Object Oriented DBMS', 1, 1, 310, 'en', '2018-06-23 20:01:48', NULL),
(311, 311, 'Object Oriented Programming', 1, 1, 311, 'en', '2018-06-23 20:01:48', NULL),
(312, 312, 'Occupational Therapy', 1, 1, 312, 'en', '2018-06-23 20:01:48', NULL),
(313, 313, 'Occupational Therapy & Rehabilitation', 1, 1, 313, 'en', '2018-06-23 20:01:48', NULL),
(314, 314, 'Operating Systems', 1, 1, 314, 'en', '2018-06-23 20:01:48', NULL),
(315, 315, 'Operations Research', 1, 1, 315, 'en', '2018-06-23 20:01:48', NULL),
(316, 316, 'Optometry', 1, 1, 316, 'en', '2018-06-23 20:01:48', NULL),
(317, 317, 'Optometry, Ophthalmology & Orthoptics', 1, 1, 317, 'en', '2018-06-23 20:01:48', NULL),
(318, 318, 'Oral Health', 1, 1, 318, 'en', '2018-06-23 20:01:48', NULL),
(319, 319, 'Organization Theory & Design', 1, 1, 319, 'en', '2018-06-23 20:01:48', NULL),
(320, 320, 'Organizational Behaviour', 1, 1, 320, 'en', '2018-06-23 20:01:48', NULL),
(321, 321, 'Organizational Development', 1, 1, 321, 'en', '2018-06-23 20:01:48', NULL),
(322, 322, 'Organizational Psychology', 1, 1, 322, 'en', '2018-06-23 20:01:48', NULL),
(323, 323, 'Pacific Island Studies', 1, 1, 323, 'en', '2018-06-23 20:01:48', NULL),
(324, 324, 'Pakistan Studies', 1, 1, 324, 'en', '2018-06-23 20:01:48', NULL),
(325, 325, 'Paramedicine', 1, 1, 325, 'en', '2018-06-23 20:01:48', NULL),
(326, 326, 'Pastoral Studies', 1, 1, 326, 'en', '2018-06-23 20:01:48', NULL),
(327, 327, 'Performance Management', 1, 1, 327, 'en', '2018-06-23 20:01:48', NULL),
(328, 328, 'Personality Psychology', 1, 1, 328, 'en', '2018-06-23 20:01:48', NULL),
(329, 329, 'Pharmacology', 1, 1, 329, 'en', '2018-06-23 20:01:48', NULL),
(330, 330, 'Pharmacology & Pharmacy', 1, 1, 330, 'en', '2018-06-23 20:01:48', NULL),
(331, 331, 'Pharmacy', 1, 1, 331, 'en', '2018-06-23 20:01:48', NULL),
(332, 332, 'Philosophy', 1, 1, 332, 'en', '2018-06-23 20:01:48', NULL),
(333, 333, 'Philosophy of Education', 1, 1, 333, 'en', '2018-06-23 20:01:48', NULL),
(334, 334, 'Photography', 1, 1, 334, 'en', '2018-06-23 20:01:48', NULL),
(335, 335, 'Physics', 1, 1, 335, 'en', '2018-06-23 20:01:48', NULL),
(336, 336, 'Physics and Astronomy', 1, 1, 336, 'en', '2018-06-23 20:01:48', NULL),
(337, 337, 'Physiology', 1, 1, 337, 'en', '2018-06-23 20:01:48', NULL),
(338, 338, 'Physiotherapy', 1, 1, 338, 'en', '2018-06-23 20:01:48', NULL),
(339, 339, 'Podiatry', 1, 1, 339, 'en', '2018-06-23 20:01:48', NULL),
(340, 340, 'Political Studies', 1, 1, 340, 'en', '2018-06-23 20:01:48', NULL),
(341, 341, 'Politics', 1, 1, 341, 'en', '2018-06-23 20:01:48', NULL),
(342, 342, 'Population & Development Studies', 1, 1, 342, 'en', '2018-06-23 20:01:48', NULL),
(343, 343, 'Population Health', 1, 1, 343, 'en', '2018-06-23 20:01:48', NULL),
(344, 344, 'Positive Psychology', 1, 1, 344, 'en', '2018-06-23 20:01:48', NULL),
(345, 345, 'Principles of Management', 1, 1, 345, 'en', '2018-06-23 20:01:48', NULL),
(346, 346, 'Principles of Marketing', 1, 1, 346, 'en', '2018-06-23 20:01:48', NULL),
(347, 347, 'Probability and Stochastic Processes', 1, 1, 347, 'en', '2018-06-23 20:01:48', NULL),
(348, 348, 'Product & Industrial Design', 1, 1, 348, 'en', '2018-06-23 20:01:48', NULL),
(349, 349, 'Production / Operations Management', 1, 1, 349, 'en', '2018-06-23 20:01:48', NULL),
(350, 350, 'Project Management', 1, 1, 350, 'en', '2018-06-23 20:01:48', NULL),
(351, 351, 'Psychological Testing & Measurements', 1, 1, 351, 'en', '2018-06-23 20:01:48', NULL),
(352, 352, 'Psychology', 1, 1, 352, 'en', '2018-06-23 20:01:48', NULL),
(353, 353, 'Public International Law', 1, 1, 353, 'en', '2018-06-23 20:01:48', NULL),
(354, 354, 'Public Policy', 1, 1, 354, 'en', '2018-06-23 20:01:48', NULL),
(355, 355, 'Public Relations', 1, 1, 355, 'en', '2018-06-23 20:01:48', NULL),
(356, 356, 'Quantity Surveying', 1, 1, 356, 'en', '2018-06-23 20:01:48', NULL),
(357, 357, 'Radiation Therapy', 1, 1, 357, 'en', '2018-06-23 20:01:48', NULL),
(358, 358, 'Radio News Reporting & Production', 1, 1, 358, 'en', '2018-06-23 20:01:48', NULL),
(359, 359, 'Radio, TV & Studio Production', 1, 1, 359, 'en', '2018-06-23 20:01:48', NULL),
(360, 360, 'Religious Studies', 1, 1, 360, 'en', '2018-06-23 20:01:48', NULL),
(361, 361, 'Reporting and Sub-Editing', 1, 1, 361, 'en', '2018-06-23 20:01:48', NULL),
(362, 362, 'Research Methods', 1, 1, 362, 'en', '2018-06-23 20:01:48', NULL),
(363, 363, 'Robotics', 1, 1, 363, 'en', '2018-06-23 20:01:48', NULL),
(364, 364, 'Russian', 1, 1, 364, 'en', '2018-06-23 20:01:48', NULL),
(365, 365, 'Russian & East European Languages', 1, 1, 365, 'en', '2018-06-23 20:01:48', NULL),
(366, 366, 'Samoan Studies / Fa\'asamoa', 1, 1, 366, 'en', '2018-06-23 20:01:48', NULL),
(367, 367, 'School, Community and Teacher', 1, 1, 367, 'en', '2018-06-23 20:01:48', NULL),
(368, 368, 'Script Writing', 1, 1, 368, 'en', '2018-06-23 20:01:48', NULL),
(369, 369, 'Services Marketing', 1, 1, 369, 'en', '2018-06-23 20:01:48', NULL),
(370, 370, 'SME Management', 1, 1, 370, 'en', '2018-06-23 20:01:48', NULL),
(371, 371, 'Social Policy', 1, 1, 371, 'en', '2018-06-23 20:01:48', NULL),
(372, 372, 'Social Psychology', 1, 1, 372, 'en', '2018-06-23 20:01:48', NULL),
(373, 373, 'Social Science (general)', 1, 1, 373, 'en', '2018-06-23 20:01:48', NULL),
(374, 374, 'Social Work', 1, 1, 374, 'en', '2018-06-23 20:01:48', NULL),
(375, 375, 'Sociology', 1, 1, 375, 'en', '2018-06-23 20:01:48', NULL),
(376, 376, 'Software Design', 1, 1, 376, 'en', '2018-06-23 20:01:48', NULL),
(377, 377, 'Software Engineering - I', 1, 1, 377, 'en', '2018-06-23 20:01:48', NULL),
(378, 378, 'Software EngineeringII', 1, 1, 378, 'en', '2018-06-23 20:01:48', NULL),
(379, 379, 'Software Process Improvement', 1, 1, 379, 'en', '2018-06-23 20:01:48', NULL),
(380, 380, 'Software Project Management', 1, 1, 380, 'en', '2018-06-23 20:01:48', NULL),
(381, 381, 'Software Quality Assurance', 1, 1, 381, 'en', '2018-06-23 20:01:48', NULL),
(382, 382, 'Software Requirement Engineering', 1, 1, 382, 'en', '2018-06-23 20:01:48', NULL),
(383, 383, 'Spanish', 1, 1, 383, 'en', '2018-06-23 20:01:48', NULL),
(384, 384, 'Speech & Language Therapy', 1, 1, 384, 'en', '2018-06-23 20:01:48', NULL),
(385, 385, 'Sport & Exercise Science', 1, 1, 385, 'en', '2018-06-23 20:01:48', NULL),
(386, 386, 'Sport & Leisure Studies & Management', 1, 1, 386, 'en', '2018-06-23 20:01:48', NULL),
(387, 387, 'Sport Coaching', 1, 1, 387, 'en', '2018-06-23 20:01:48', NULL),
(388, 388, 'Sport Psychology', 1, 1, 388, 'en', '2018-06-23 20:01:48', NULL),
(389, 389, 'Sports Science', 1, 1, 389, 'en', '2018-06-23 20:01:48', NULL),
(390, 390, 'Statistics', 1, 1, 390, 'en', '2018-06-23 20:01:48', NULL),
(391, 391, 'Statistics and Probability', 1, 1, 391, 'en', '2018-06-23 20:01:48', NULL),
(392, 392, 'Strategic Management', 1, 1, 392, 'en', '2018-06-23 20:01:48', NULL),
(393, 393, 'Strategic Marketing Management', 1, 1, 393, 'en', '2018-06-23 20:01:48', NULL),
(394, 394, 'Supply Chain Management', 1, 1, 394, 'en', '2018-06-23 20:01:48', NULL),
(395, 395, 'Surveying', 1, 1, 395, 'en', '2018-06-23 20:01:48', NULL),
(396, 396, 'System Programming', 1, 1, 396, 'en', '2018-06-23 20:01:48', NULL),
(397, 397, 'Taxation', 1, 1, 397, 'en', '2018-06-23 20:01:48', NULL),
(398, 398, 'Taxation Management', 1, 1, 398, 'en', '2018-06-23 20:01:48', NULL),
(399, 399, 'Teaching – Early Childhood', 1, 1, 399, 'en', '2018-06-23 20:01:48', NULL),
(400, 400, 'Teaching – Māori Language', 1, 1, 400, 'en', '2018-06-23 20:01:48', NULL),
(401, 401, 'Teaching – Physical Education', 1, 1, 401, 'en', '2018-06-23 20:01:48', NULL),
(402, 402, 'Teaching – Primary', 1, 1, 402, 'en', '2018-06-23 20:01:48', NULL),
(403, 403, 'Teaching – Secondary', 1, 1, 403, 'en', '2018-06-23 20:01:48', NULL),
(404, 404, 'Teaching – Technology', 1, 1, 404, 'en', '2018-06-23 20:01:48', NULL),
(405, 405, 'Teaching of English', 1, 1, 405, 'en', '2018-06-23 20:01:48', NULL),
(406, 406, 'Teaching of General Science', 1, 1, 406, 'en', '2018-06-23 20:01:48', NULL),
(407, 407, 'Teaching of Geography', 1, 1, 407, 'en', '2018-06-23 20:01:48', NULL),
(408, 408, 'Teaching of Islamic Studies', 1, 1, 408, 'en', '2018-06-23 20:01:48', NULL),
(409, 409, 'Teaching of Literacy Skills', 1, 1, 409, 'en', '2018-06-23 20:01:48', NULL),
(410, 410, 'Teaching of Urdu', 1, 1, 410, 'en', '2018-06-23 20:01:48', NULL),
(411, 411, 'Theology', 1, 1, 411, 'en', '2018-06-23 20:01:48', NULL),
(412, 412, 'Theology & Religious Studies', 1, 1, 412, 'en', '2018-06-23 20:01:48', NULL),
(413, 413, 'Theories of Communication', 1, 1, 413, 'en', '2018-06-23 20:01:48', NULL),
(414, 414, 'Theory & Practice of Counseling', 1, 1, 414, 'en', '2018-06-23 20:01:48', NULL),
(415, 415, 'Theory of Automata', 1, 1, 415, 'en', '2018-06-23 20:01:48', NULL),
(416, 416, 'Theory of Computation', 1, 1, 416, 'en', '2018-06-23 20:01:48', NULL),
(417, 417, 'Total Quality Management', 1, 1, 417, 'en', '2018-06-23 20:01:48', NULL),
(418, 418, 'Tourism', 1, 1, 418, 'en', '2018-06-23 20:01:48', NULL),
(419, 419, 'Town & Country Planning and Landscape Design', 1, 1, 419, 'en', '2018-06-23 20:01:48', NULL),
(420, 420, 'Training and Development', 1, 1, 420, 'en', '2018-06-23 20:01:48', NULL),
(421, 421, 'TV Direction', 1, 1, 421, 'en', '2018-06-23 20:01:48', NULL),
(422, 422, 'TV News and Current Affairs', 1, 1, 422, 'en', '2018-06-23 20:01:48', NULL),
(423, 423, 'TV News Reporting & Production', 1, 1, 423, 'en', '2018-06-23 20:01:48', NULL),
(424, 424, 'Urdu', 1, 1, 424, 'en', '2018-06-23 20:01:48', NULL),
(425, 425, 'Valuation & Property Management', 1, 1, 425, 'en', '2018-06-23 20:01:48', NULL),
(426, 426, 'Veterinary Medicine', 1, 1, 426, 'en', '2018-06-23 20:01:48', NULL),
(427, 427, 'Veterinary Science & Technology', 1, 1, 427, 'en', '2018-06-23 20:01:48', NULL),
(428, 428, 'Visual Programming', 1, 1, 428, 'en', '2018-06-23 20:01:48', NULL),
(429, 429, 'Web & Digital Design', 1, 1, 429, 'en', '2018-06-23 20:01:48', NULL),
(430, 430, 'Web Design and Development', 1, 1, 430, 'en', '2018-06-23 20:01:48', NULL),
(431, 431, 'Wireless Networks', 1, 1, 431, 'en', '2018-06-23 20:01:48', NULL),
(432, 432, 'Youth Work', 1, 1, 432, 'en', '2018-06-23 20:01:48', NULL),
(433, 433, 'Zoology', 1, 1, 433, 'en', '2018-06-23 20:01:48', NULL),
(434, 1, 'Psicología anormal', 0, 1, 1, 'es', '2018-06-23 20:02:22', NULL),
(435, 2, 'Contabilidad', 0, 1, 2, 'es', '2018-06-23 20:02:22', NULL),
(436, 3, 'Cuentas y finanzas', 0, 1, 3, 'es', '2018-06-23 20:02:22', NULL),
(437, 4, 'Actuación y rendimiento', 0, 1, 4, 'es', '2018-06-23 20:02:22', NULL),
(438, 5, 'Abordar los problemas del aprendizaje a través de la tecnología y la pedagogía', 0, 1, 5, 'es', '2018-06-23 20:02:22', NULL),
(439, 6, 'Derecho Administrativo y Rendición de Cuentas', 0, 1, 6, 'es', '2018-06-23 20:02:22', NULL),
(440, 7, 'Advance Computer Architecture', 0, 1, 7, 'es', '2018-06-23 20:02:22', NULL),
(441, 8, 'Métodos avanzados de investigación', 0, 1, 8, 'es', '2018-06-23 20:02:22', NULL),
(442, 9, 'Análisis y Diseño de Algoritmos Avanzados', 0, 1, 9, 'es', '2018-06-23 20:02:22', NULL),
(443, 10, 'Bioinformática avanzada', 0, 1, 10, 'es', '2018-06-23 20:02:22', NULL),
(444, 11, 'Arquitectura Avanzada de Computadora-II', 0, 1, 11, 'es', '2018-06-23 20:02:22', NULL),
(445, 12, 'Redes de computadoras avanzadas', 0, 1, 12, 'es', '2018-06-23 20:02:22', NULL),
(446, 13, 'Enfoques de Computación Avanzada', 0, 1, 13, 'es', '2018-06-23 20:02:22', NULL),
(447, 14, 'Costo avanzado y contabilidad de gestión', 0, 1, 14, 'es', '2018-06-23 20:02:22', NULL),
(448, 15, 'Contabilidad financiera avanzada', 0, 1, 15, 'es', '2018-06-23 20:02:22', NULL),
(449, 16, 'Sistemas operativos avanzados', 0, 1, 16, 'es', '2018-06-23 20:02:22', NULL),
(450, 17, 'Publicidad', 0, 1, 17, 'es', '2018-06-23 20:02:22', NULL),
(451, 18, 'Publicidad y promoción', 0, 1, 18, 'es', '2018-06-23 20:02:22', NULL),
(452, 19, 'Publicidad para medios impresos y electrónicos', 0, 1, 19, 'es', '2018-06-23 20:02:22', NULL),
(453, 20, 'Ingeniería Aeronáutica y de Manufactura', 0, 1, 20, 'es', '2018-06-23 20:02:22', NULL),
(454, 21, 'Agronegocios', 0, 1, 21, 'es', '2018-06-23 20:02:22', NULL),
(455, 22, 'Agricultura y silvicultura', 0, 1, 22, 'es', '2018-06-23 20:02:22', NULL),
(456, 23, 'Agricultura (general)', 0, 1, 23, 'es', '2018-06-23 20:02:22', NULL),
(457, 24, 'Agronomía y Ciencia Vegetal', 0, 1, 24, 'es', '2018-06-23 20:02:22', NULL),
(458, 25, 'estudios Americanos', 0, 1, 25, 'es', '2018-06-23 20:02:22', NULL),
(459, 26, 'Anatomía y Fisiología', 0, 1, 26, 'es', '2018-06-23 20:02:22', NULL),
(460, 27, 'Ciencia Animal', 0, 1, 27, 'es', '2018-06-23 20:02:22', NULL),
(461, 28, 'Ciencia antropológica', 0, 1, 28, 'es', '2018-06-23 20:02:22', NULL),
(462, 29, 'Antropología', 0, 1, 29, 'es', '2018-06-23 20:02:22', NULL),
(463, 30, 'Acuacultura y pesca', 0, 1, 30, 'es', '2018-06-23 20:02:22', NULL),
(464, 31, 'Arqueología', 0, 1, 31, 'es', '2018-06-23 20:02:22', NULL),
(465, 32, 'Arquitectura', 0, 1, 32, 'es', '2018-06-23 20:02:22', NULL),
(466, 33, 'Diseño artístico', 0, 1, 33, 'es', '2018-06-23 20:02:22', NULL),
(467, 34, 'Historia del arte y teoría', 0, 1, 34, 'es', '2018-06-23 20:02:22', NULL),
(468, 35, 'Inteligencia artificial', 0, 1, 35, 'es', '2018-06-23 20:02:22', NULL),
(469, 36, 'estudios Asiáticos', 0, 1, 36, 'es', '2018-06-23 20:02:22', NULL),
(470, 37, 'Astronomía', 0, 1, 37, 'es', '2018-06-23 20:02:22', NULL),
(471, 38, 'Edición Audiovisual', 0, 1, 38, 'es', '2018-06-23 20:02:22', NULL),
(472, 39, 'Ciencias Aurales y Orales', 0, 1, 39, 'es', '2018-06-23 20:02:22', NULL),
(473, 40, 'Aviación', 0, 1, 40, 'es', '2018-06-23 20:02:22', NULL),
(474, 41, 'Gestión de aviación', 0, 1, 41, 'es', '2018-06-23 20:02:22', NULL),
(475, 42, 'Leyes y prácticas bancarias', 0, 1, 42, 'es', '2018-06-23 20:02:22', NULL),
(476, 43, 'Estudios Bíblicos', 0, 1, 43, 'es', '2018-06-23 20:02:22', NULL),
(477, 44, 'Bioquímica', 0, 1, 44, 'es', '2018-06-23 20:02:22', NULL),
(478, 45, 'Bioquímica-I', 0, 1, 45, 'es', '2018-06-23 20:02:22', NULL),
(479, 46, 'Bioética, Bioseguridad y Bioseguridad', 0, 1, 46, 'es', '2018-06-23 20:02:22', NULL),
(480, 47, 'Bioinformática', 0, 1, 47, 'es', '2018-06-23 20:02:22', NULL),
(481, 48, 'Bioinformática I (Fundamentos de la informática genómica)', 0, 1, 48, 'es', '2018-06-23 20:02:22', NULL),
(482, 49, 'Ciencias Biologicas', 0, 1, 49, 'es', '2018-06-23 20:02:22', NULL),
(483, 50, 'Biología (general)', 0, 1, 50, 'es', '2018-06-23 20:02:22', NULL),
(484, 51, 'Ingeniería Biomédica', 0, 1, 51, 'es', '2018-06-23 20:02:22', NULL),
(485, 52, 'Ciencias biomédicas (no clasificadas en otra parte)', 0, 1, 52, 'es', '2018-06-23 20:02:22', NULL),
(486, 53, 'Biotecnología', 0, 1, 53, 'es', '2018-06-23 20:02:22', NULL),
(487, 54, 'Botánica', 0, 1, 54, 'es', '2018-06-23 20:02:22', NULL),
(488, 55, 'Gestión de la marca', 0, 1, 55, 'es', '2018-06-23 20:02:22', NULL),
(489, 56, 'edificio', 0, 1, 56, 'es', '2018-06-23 20:02:22', NULL),
(490, 57, 'Derecho comercial y laboral', 0, 1, 57, 'es', '2018-06-23 20:02:22', NULL),
(491, 58, 'Negocios y estudios de gestión', 0, 1, 58, 'es', '2018-06-23 20:02:22', NULL),
(492, 59, 'Escritura comercial y técnica de inglés', 0, 1, 59, 'es', '2018-06-23 20:02:22', NULL),
(493, 60, 'Comunicacion de negocios', 0, 1, 60, 'es', '2018-06-23 20:02:22', NULL),
(494, 61, 'Econometría Empresarial', 0, 1, 61, 'es', '2018-06-23 20:02:22', NULL),
(495, 62, 'Ética de negocios', 0, 1, 62, 'es', '2018-06-23 20:02:22', NULL),
(496, 63, 'Financiación de las empresas', 0, 1, 63, 'es', '2018-06-23 20:02:22', NULL),
(497, 64, 'Matemática y Estadística Empresarial', 0, 1, 64, 'es', '2018-06-23 20:02:22', NULL),
(498, 65, 'Cálculo y Geometría Analítica', 0, 1, 65, 'es', '2018-06-23 20:02:22', NULL),
(499, 66, 'Cálculo II', 0, 1, 66, 'es', '2018-06-23 20:02:22', NULL),
(500, 67, 'Fundamentos, principios y prácticas de la cámara', 0, 1, 67, 'es', '2018-06-23 20:02:22', NULL),
(501, 68, 'Biología Celular', 0, 1, 68, 'es', '2018-06-23 20:02:22', NULL),
(502, 69, 'Estudios célticos', 0, 1, 69, 'es', '2018-06-23 20:02:22', NULL),
(503, 70, 'Gestión del cambio', 0, 1, 70, 'es', '2018-06-23 20:02:22', NULL),
(504, 71, 'Ingeniería química y de procesos', 0, 1, 71, 'es', '2018-06-23 20:02:22', NULL),
(505, 72, 'Ingeniería Química', 0, 1, 72, 'es', '2018-06-23 20:02:22', NULL),
(506, 73, 'Química', 0, 1, 73, 'es', '2018-06-23 20:02:22', NULL),
(507, 74, 'Desarrollo infantil', 0, 1, 74, 'es', '2018-06-23 20:02:22', NULL),
(508, 75, 'chino', 0, 1, 75, 'es', '2018-06-23 20:02:22', NULL),
(509, 76, 'Estudios chinos', 0, 1, 76, 'es', '2018-06-23 20:02:22', NULL),
(510, 77, 'Pensamiento e Historia Cristianos', 0, 1, 77, 'es', '2018-06-23 20:02:22', NULL),
(511, 78, 'Teoría del circuito', 0, 1, 78, 'es', '2018-06-23 20:02:22', NULL),
(512, 79, 'Ingeniero civil', 0, 1, 79, 'es', '2018-06-23 20:02:22', NULL),
(513, 80, 'Estudios clásicos', 0, 1, 80, 'es', '2018-06-23 20:02:22', NULL),
(514, 81, 'Clásicos e historia antigua', 0, 1, 81, 'es', '2018-06-23 20:02:22', NULL),
(515, 82, 'Evaluación del aula', 0, 1, 82, 'es', '2018-06-23 20:02:22', NULL),
(516, 83, 'La gestión del aula', 0, 1, 83, 'es', '2018-06-23 20:02:22', NULL),
(517, 84, 'Psicología clínica', 0, 1, 84, 'es', '2018-06-23 20:02:22', NULL),
(518, 85, 'Ropa y Textiles', 0, 1, 85, 'es', '2018-06-23 20:02:22', NULL),
(519, 86, 'Psicología cognitiva', 0, 1, 86, 'es', '2018-06-23 20:02:22', NULL),
(520, 87, 'Ley comercial', 0, 1, 87, 'es', '2018-06-23 20:02:22', NULL),
(521, 88, 'Comunicación y estudios de medios', 0, 1, 88, 'es', '2018-06-23 20:02:22', NULL),
(522, 89, 'Comunicación y escritura profesional', 0, 1, 89, 'es', '2018-06-23 20:02:22', NULL),
(523, 90, 'Habilidades de comunicación', 0, 1, 90, 'es', '2018-06-23 20:02:22', NULL),
(524, 91, 'Construcción del compilador', 0, 1, 91, 'es', '2018-06-23 20:02:22', NULL),
(525, 92, 'Medicina complementaria', 0, 1, 92, 'es', '2018-06-23 20:02:22', NULL),
(526, 93, 'Programación del lenguaje de ensamblaje y arquitectura de computadora', 0, 1, 93, 'es', '2018-06-23 20:02:22', NULL),
(527, 94, 'Ingeniería Informática', 0, 1, 94, 'es', '2018-06-23 20:02:22', NULL),
(528, 95, 'Gráficos de computadora', 0, 1, 95, 'es', '2018-06-23 20:02:22', NULL),
(529, 96, 'Red de computadoras', 0, 1, 96, 'es', '2018-06-23 20:02:22', NULL),
(530, 97, 'Ciencias de la Computación', 0, 1, 97, 'es', '2018-06-23 20:02:22', NULL),
(531, 98, 'Manejo de conflictos', 0, 1, 98, 'es', '2018-06-23 20:02:22', NULL),
(532, 99, 'La resolución de conflictos', 0, 1, 99, 'es', '2018-06-23 20:02:22', NULL),
(533, 100, 'Construcción y gestión de proyectos', 0, 1, 100, 'es', '2018-06-23 20:02:22', NULL),
(534, 101, 'Banca de consumo', 0, 1, 101, 'es', '2018-06-23 20:02:22', NULL),
(535, 102, 'Comportamiento del consumidor', 0, 1, 102, 'es', '2018-06-23 20:02:22', NULL),
(536, 103, 'Psicología del consumidor', 0, 1, 103, 'es', '2018-06-23 20:02:22', NULL),
(537, 104, 'Finanzas corporativas', 0, 1, 104, 'es', '2018-06-23 20:02:22', NULL),
(538, 105, 'Derecho Corporativo', 0, 1, 105, 'es', '2018-06-23 20:02:22', NULL),
(539, 106, 'Contabilidad de costos y gestión', 0, 1, 106, 'es', '2018-06-23 20:02:22', NULL),
(540, 107, 'Asesoramiento', 0, 1, 107, 'es', '2018-06-23 20:02:22', NULL),
(541, 108, 'Escritura creativa', 0, 1, 108, 'es', '2018-06-23 20:02:22', NULL),
(542, 109, 'Gestión de crédito y riesgo', 0, 1, 109, 'es', '2018-06-23 20:02:22', NULL),
(543, 110, 'Criminología', 0, 1, 110, 'es', '2018-06-23 20:02:22', NULL),
(544, 111, 'Criminología y justicia', 0, 1, 111, 'es', '2018-06-23 20:02:22', NULL),
(545, 112, 'Gestión de crisis', 0, 1, 112, 'es', '2018-06-23 20:02:22', NULL),
(546, 113, 'Pensamiento crítico y práctica reflexiva', 0, 1, 113, 'es', '2018-06-23 20:02:22', NULL),
(547, 114, 'Antropología cultural', 0, 1, 114, 'es', '2018-06-23 20:02:22', NULL),
(548, 115, 'Estudios culturales', 0, 1, 115, 'es', '2018-06-23 20:02:22', NULL),
(549, 116, 'Desarrollo curricular', 0, 1, 116, 'es', '2018-06-23 20:02:22', NULL),
(550, 117, 'Customer Relationship Management', 0, 1, 117, 'es', '2018-06-23 20:02:22', NULL),
(551, 118, 'Baile', 0, 1, 118, 'es', '2018-06-23 20:02:22', NULL),
(552, 119, 'Comunicación de datos', 0, 1, 119, 'es', '2018-06-23 20:02:22', NULL),
(553, 120, 'Estructuras de datos', 0, 1, 120, 'es', '2018-06-23 20:02:22', NULL),
(554, 121, 'Almacenamiento de datos', 0, 1, 121, 'es', '2018-06-23 20:02:22', NULL),
(555, 122, 'Sistemas de gestión de bases de datos', 0, 1, 122, 'es', '2018-06-23 20:02:22', NULL),
(556, 123, 'Modelado y diseño de bases de datos', 0, 1, 123, 'es', '2018-06-23 20:02:22', NULL),
(557, 124, 'Estudios de defensa', 0, 1, 124, 'es', '2018-06-23 20:02:22', NULL),
(558, 125, 'Tecnología dental', 0, 1, 125, 'es', '2018-06-23 20:02:22', NULL),
(559, 126, 'Odontología', 0, 1, 126, 'es', '2018-06-23 20:02:22', NULL),
(560, 127, 'Diseño (general)', 0, 1, 127, 'es', '2018-06-23 20:02:22', NULL),
(561, 128, 'La economía del desarrollo', 0, 1, 128, 'es', '2018-06-23 20:02:22', NULL),
(562, 129, 'Ecuaciones diferenciales', 0, 1, 129, 'es', '2018-06-23 20:02:22', NULL),
(563, 130, 'Diseño de lógica digital', 0, 1, 130, 'es', '2018-06-23 20:02:22', NULL),
(564, 131, 'Matemáticas discretas', 0, 1, 131, 'es', '2018-06-23 20:02:22', NULL),
(565, 132, 'DBMS distribuido', 0, 1, 132, 'es', '2018-06-23 20:02:22', NULL),
(566, 133, 'Drama / Estudios de teatro', 0, 1, 133, 'es', '2018-06-23 20:02:22', NULL),
(567, 134, 'Drama, Danza y Cinemática', 0, 1, 134, 'es', '2018-06-23 20:02:22', NULL),
(568, 135, 'Ciencias de la Tierra (general)', 0, 1, 135, 'es', '2018-06-23 20:02:22', NULL),
(569, 136, 'Estudios de Asia Oriental y del Sur', 0, 1, 136, 'es', '2018-06-23 20:02:22', NULL),
(570, 137, 'Ecología', 0, 1, 137, 'es', '2018-06-23 20:02:22', NULL),
(571, 138, 'E-Commerce', 0, 1, 138, 'es', '2018-06-23 20:02:22', NULL),
(572, 139, 'Ciencias económicas', 0, 1, 139, 'es', '2018-06-23 20:02:22', NULL),
(573, 140, 'Educación', 0, 1, 140, 'es', '2018-06-23 20:02:22', NULL),
(574, 141, 'Desarrollo de la educación en Pakistán', 0, 1, 141, 'es', '2018-06-23 20:02:22', NULL),
(575, 142, 'Estudios de educación', 0, 1, 142, 'es', '2018-06-23 20:02:22', NULL),
(576, 143, 'Política y práctica de gobernanza educativa', 0, 1, 143, 'es', '2018-06-23 20:02:22', NULL),
(577, 144, 'Liderazgo y gestión educativa', 0, 1, 144, 'es', '2018-06-23 20:02:22', NULL),
(578, 145, 'Psicología Educacional', 0, 1, 145, 'es', '2018-06-23 20:02:22', NULL),
(579, 146, 'Ingeniería Eléctrica y Electrónica', 0, 1, 146, 'es', '2018-06-23 20:02:22', NULL),
(580, 147, 'Ingenieria Eléctrica', 0, 1, 147, 'es', '2018-06-23 20:02:22', NULL),
(581, 148, 'Electrónica', 0, 1, 148, 'es', '2018-06-23 20:02:22', NULL),
(582, 149, 'Inglés elemental', 0, 1, 149, 'es', '2018-06-23 20:02:22', NULL),
(583, 150, 'Matemáticas elementales', 0, 1, 150, 'es', '2018-06-23 20:02:22', NULL),
(584, 151, 'Estudios de Energía y Gestión', 0, 1, 151, 'es', '2018-06-23 20:02:22', NULL),
(585, 152, 'Ciencia ingeniera', 0, 1, 152, 'es', '2018-06-23 20:02:22', NULL),
(586, 153, 'Inglés', 0, 1, 153, 'es', '2018-06-23 20:02:22', NULL),
(587, 154, 'Ingles como segundo lenguaje', 0, 1, 154, 'es', '2018-06-23 20:02:22', NULL),
(588, 155, 'Comprensión de inglés', 0, 1, 155, 'es', '2018-06-23 20:02:22', NULL),
(589, 156, 'Emprendimiento', 0, 1, 156, 'es', '2018-06-23 20:02:22', NULL),
(590, 157, 'Ingeniería de Recursos Naturales y Ambientales', 0, 1, 157, 'es', '2018-06-23 20:02:22', NULL),
(591, 158, 'Salud Ambiental', 0, 1, 158, 'es', '2018-06-23 20:02:22', NULL),
(592, 159, 'Psicología ambiental', 0, 1, 159, 'es', '2018-06-23 20:02:22', NULL),
(593, 160, 'Ciencia medioambiental', 0, 1, 160, 'es', '2018-06-23 20:02:22', NULL),
(594, 161, 'Estudios ambientales', 0, 1, 161, 'es', '2018-06-23 20:02:22', NULL),
(595, 162, 'Essentials of Genetics', 0, 1, 162, 'es', '2018-06-23 20:02:22', NULL),
(596, 163, 'Ética', 0, 1, 163, 'es', '2018-06-23 20:02:22', NULL),
(597, 164, 'Ética (para no musulmanes)', 0, 1, 164, 'es', '2018-06-23 20:02:22', NULL),
(598, 165, 'Lenguas y culturas europeas', 0, 1, 165, 'es', '2018-06-23 20:02:22', NULL),
(599, 166, 'estudios Europeos', 0, 1, 166, 'es', '2018-06-23 20:02:22', NULL),
(600, 167, 'Moda', 0, 1, 167, 'es', '2018-06-23 20:02:22', NULL),
(601, 168, 'Diseño de moda', 0, 1, 168, 'es', '2018-06-23 20:02:22', NULL),
(602, 169, 'Feature & Column Writing', 0, 1, 169, 'es', '2018-06-23 20:02:22', NULL),
(603, 170, 'Estudios de cine y medios', 0, 1, 170, 'es', '2018-06-23 20:02:22', NULL),
(604, 171, 'Realización de películas', 0, 1, 171, 'es', '2018-06-23 20:02:22', NULL),
(605, 172, 'Cinematografía', 0, 1, 172, 'es', '2018-06-23 20:02:22', NULL),
(606, 173, 'Financiar', 0, 1, 173, 'es', '2018-06-23 20:02:22', NULL),
(607, 174, 'Contabilidad financiera', 0, 1, 174, 'es', '2018-06-23 20:02:22', NULL),
(608, 175, 'Contabilidad financiera II', 0, 1, 175, 'es', '2018-06-23 20:02:22', NULL),
(609, 176, 'Gestión financiera', 0, 1, 176, 'es', '2018-06-23 20:02:22', NULL),
(610, 177, 'Análisis del estado financiero', 0, 1, 177, 'es', '2018-06-23 20:02:22', NULL),
(611, 178, 'Bellas Artes', 0, 1, 178, 'es', '2018-06-23 20:02:22', NULL),
(612, 179, 'Ciencia de los Alimentos', 0, 1, 179, 'es', '2018-06-23 20:02:22', NULL),
(613, 180, 'Ciencia analítica forense', 0, 1, 180, 'es', '2018-06-23 20:02:22', NULL),
(614, 181, 'Psicología Forense', 0, 1, 181, 'es', '2018-06-23 20:02:22', NULL),
(615, 182, 'Ciencia forense', 0, 1, 182, 'es', '2018-06-23 20:02:22', NULL),
(616, 183, 'Silvicultura', 0, 1, 183, 'es', '2018-06-23 20:02:22', NULL),
(617, 184, 'Métodos formales para la ingeniería de software', 0, 1, 184, 'es', '2018-06-23 20:02:22', NULL),
(618, 185, 'Fundamentos de la educación', 0, 1, 185, 'es', '2018-06-23 20:02:22', NULL);
INSERT INTO `major_subjects` (`id`, `major_subject_id`, `major_subject`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(619, 186, 'francés', 0, 1, 186, 'es', '2018-06-23 20:02:22', NULL),
(620, 187, 'Fundamentos de Algoritmos', 0, 1, 187, 'es', '2018-06-23 20:02:22', NULL),
(621, 188, 'Fundamentos de la auditoría', 0, 1, 188, 'es', '2018-06-23 20:02:22', NULL),
(622, 189, 'Fundamentos de Relaciones Públicas', 0, 1, 189, 'es', '2018-06-23 20:02:22', NULL),
(623, 190, 'Cuestiones de género en psicología', 0, 1, 190, 'es', '2018-06-23 20:02:22', NULL),
(624, 191, 'Estudios de género', 0, 1, 191, 'es', '2018-06-23 20:02:22', NULL),
(625, 192, 'Manipulación génica e ingeniería genética', 0, 1, 192, 'es', '2018-06-23 20:02:22', NULL),
(626, 193, 'Ingeniería general', 0, 1, 193, 'es', '2018-06-23 20:02:22', NULL),
(627, 194, 'Matemáticas generales', 0, 1, 194, 'es', '2018-06-23 20:02:22', NULL),
(628, 195, 'Métodos generales de enseñanza', 0, 1, 195, 'es', '2018-06-23 20:02:22', NULL),
(629, 196, 'Ciencia general', 0, 1, 196, 'es', '2018-06-23 20:02:22', NULL),
(630, 197, 'Genética', 0, 1, 197, 'es', '2018-06-23 20:02:22', NULL),
(631, 198, 'Geografía', 0, 1, 198, 'es', '2018-06-23 20:02:22', NULL),
(632, 199, 'Geografía y Ciencias del Medio Ambiente', 0, 1, 199, 'es', '2018-06-23 20:02:22', NULL),
(633, 200, 'Geología', 0, 1, 200, 'es', '2018-06-23 20:02:22', NULL),
(634, 201, 'alemán', 0, 1, 201, 'es', '2018-06-23 20:02:22', NULL),
(635, 202, 'Globalización de los medios', 0, 1, 202, 'es', '2018-06-23 20:02:22', NULL),
(636, 203, 'Diseño gráfico', 0, 1, 203, 'es', '2018-06-23 20:02:22', NULL),
(637, 204, 'griego', 0, 1, 204, 'es', '2018-06-23 20:02:22', NULL),
(638, 205, 'Promoción de la salud', 0, 1, 205, 'es', '2018-06-23 20:02:22', NULL),
(639, 206, 'Salud psicológica', 0, 1, 206, 'es', '2018-06-23 20:02:22', NULL),
(640, 207, 'Historia', 0, 1, 207, 'es', '2018-06-23 20:02:22', NULL),
(641, 208, 'Historia y Sistemas de Psicología', 0, 1, 208, 'es', '2018-06-23 20:02:22', NULL),
(642, 209, 'Historia del arte, arquitectura y diseño', 0, 1, 209, 'es', '2018-06-23 20:02:22', NULL),
(643, 210, 'Gestión de la hospitalidad', 0, 1, 210, 'es', '2018-06-23 20:02:22', NULL),
(644, 211, 'Hospitalidad, ocio, recreación y turismo', 0, 1, 211, 'es', '2018-06-23 20:02:22', NULL),
(645, 212, 'La interacción persona-ordenador', 0, 1, 212, 'es', '2018-06-23 20:02:22', NULL),
(646, 213, 'Estudios de Desarrollo Humano', 0, 1, 213, 'es', '2018-06-23 20:02:22', NULL),
(647, 214, 'Nutrición humana', 0, 1, 214, 'es', '2018-06-23 20:02:22', NULL),
(648, 215, 'Relaciones humanas', 0, 1, 215, 'es', '2018-06-23 20:02:22', NULL),
(649, 216, 'Desarrollo de recursos humanos', 0, 1, 216, 'es', '2018-06-23 20:02:22', NULL),
(650, 217, 'Gestión de recursos humanos', 0, 1, 217, 'es', '2018-06-23 20:02:22', NULL),
(651, 218, 'Lengua Ibérica / Estudios Hispánicos', 0, 1, 218, 'es', '2018-06-23 20:02:22', NULL),
(652, 219, 'Técnicas de recuperación de información', 0, 1, 219, 'es', '2018-06-23 20:02:22', NULL),
(653, 220, 'Ciencias de la Información', 0, 1, 220, 'es', '2018-06-23 20:02:22', NULL),
(654, 221, 'Sistemas de información', 0, 1, 221, 'es', '2018-06-23 20:02:22', NULL),
(655, 222, 'Negocios Internacionales', 0, 1, 222, 'es', '2018-06-23 20:02:22', NULL),
(656, 223, 'Comunicación internacional', 0, 1, 223, 'es', '2018-06-23 20:02:22', NULL),
(657, 224, 'Mercado internacional', 0, 1, 224, 'es', '2018-06-23 20:02:22', NULL),
(658, 225, 'Relaciones Internacionales', 0, 1, 225, 'es', '2018-06-23 20:02:22', NULL),
(659, 226, 'Estudios Internacionales', 0, 1, 226, 'es', '2018-06-23 20:02:22', NULL),
(660, 227, 'Interpretar y traducir', 0, 1, 227, 'es', '2018-06-23 20:02:22', NULL),
(661, 228, 'Introducción a la radiodifusión', 0, 1, 228, 'es', '2018-06-23 20:02:22', NULL),
(662, 229, 'Introducción a los negocios', 0, 1, 229, 'es', '2018-06-23 20:02:22', NULL),
(663, 230, 'Introducción a la informática', 0, 1, 230, 'es', '2018-06-23 20:02:22', NULL),
(664, 231, 'Introducción a la Orientación y Consejería', 0, 1, 231, 'es', '2018-06-23 20:02:22', NULL),
(665, 232, 'Introducción a la comunicación masiva', 0, 1, 232, 'es', '2018-06-23 20:02:22', NULL),
(666, 233, 'Introducción al diseño y análisis de redes', 0, 1, 233, 'es', '2018-06-23 20:02:22', NULL),
(667, 234, 'Introducción a la Programación', 0, 1, 234, 'es', '2018-06-23 20:02:22', NULL),
(668, 235, 'Introducción a la Psicología', 0, 1, 235, 'es', '2018-06-23 20:02:22', NULL),
(669, 236, 'Introducción a la administración pública', 0, 1, 236, 'es', '2018-06-23 20:02:22', NULL),
(670, 237, 'Introducción a la Sociología', 0, 1, 237, 'es', '2018-06-23 20:02:22', NULL),
(671, 238, 'Introducción al desarrollo de servicios web', 0, 1, 238, 'es', '2018-06-23 20:02:22', NULL),
(672, 239, 'Análisis de inversiones y gestión de cartera', 0, 1, 239, 'es', '2018-06-23 20:02:22', NULL),
(673, 240, 'Estudios Islámicos', 0, 1, 240, 'es', '2018-06-23 20:02:22', NULL),
(674, 241, 'italiano', 0, 1, 241, 'es', '2018-06-23 20:02:22', NULL),
(675, 242, 'japonés', 0, 1, 242, 'es', '2018-06-23 20:02:22', NULL),
(676, 243, 'Estudios japoneses', 0, 1, 243, 'es', '2018-06-23 20:02:22', NULL),
(677, 244, 'Periodismo', 0, 1, 244, 'es', '2018-06-23 20:02:22', NULL),
(678, 245, 'Escritura periodística', 0, 1, 245, 'es', '2018-06-23 20:02:22', NULL),
(679, 246, 'Conocimiento administrativo', 0, 1, 246, 'es', '2018-06-23 20:02:22', NULL),
(680, 247, 'coreano', 0, 1, 247, 'es', '2018-06-23 20:02:22', NULL),
(681, 248, 'Relaciones Laborales e Industriales', 0, 1, 248, 'es', '2018-06-23 20:02:22', NULL),
(682, 249, 'Gestión de tierras y propiedades', 0, 1, 249, 'es', '2018-06-23 20:02:22', NULL),
(683, 250, 'Manejo y planificación del uso de la tierra', 0, 1, 250, 'es', '2018-06-23 20:02:22', NULL),
(684, 251, 'latín', 0, 1, 251, 'es', '2018-06-23 20:02:23', NULL),
(685, 252, 'Ley', 0, 1, 252, 'es', '2018-06-23 20:02:23', NULL),
(686, 253, 'Liderazgo y gestión de equipos', 0, 1, 253, 'es', '2018-06-23 20:02:23', NULL),
(687, 254, 'Teorías de aprendizaje', 0, 1, 254, 'es', '2018-06-23 20:02:23', NULL),
(688, 255, 'Biblioteconomía y gestión de la información', 0, 1, 255, 'es', '2018-06-23 20:02:23', NULL),
(689, 256, 'Iluminación para producción de TV', 0, 1, 256, 'es', '2018-06-23 20:02:23', NULL),
(690, 257, 'Álgebra lineal', 0, 1, 257, 'es', '2018-06-23 20:02:23', NULL),
(691, 258, 'Lingüística', 0, 1, 258, 'es', '2018-06-23 20:02:23', NULL),
(692, 259, 'Macroeconómica', 0, 1, 259, 'es', '2018-06-23 20:02:23', NULL),
(693, 260, 'administración', 0, 1, 260, 'es', '2018-06-23 20:02:23', NULL),
(694, 261, 'Gestión de instituciones financieras', 0, 1, 261, 'es', '2018-06-23 20:02:23', NULL),
(695, 262, 'Habilidades de gestión', 0, 1, 262, 'es', '2018-06-23 20:02:23', NULL),
(696, 263, 'Contabilidad de gestión', 0, 1, 263, 'es', '2018-06-23 20:02:23', NULL),
(697, 264, 'Economía de la Empresa', 0, 1, 264, 'es', '2018-06-23 20:02:23', NULL),
(698, 265, 'Desarrollo maorí', 0, 1, 265, 'es', '2018-06-23 20:02:23', NULL),
(699, 266, 'La salud maorí', 0, 1, 266, 'es', '2018-06-23 20:02:23', NULL),
(700, 267, 'Lengua maorí / Te Reo maorí', 0, 1, 267, 'es', '2018-06-23 20:02:23', NULL),
(701, 268, 'Estudios mediáticos maoríes', 0, 1, 268, 'es', '2018-06-23 20:02:23', NULL),
(702, 269, 'Estudios maoríes', 0, 1, 269, 'es', '2018-06-23 20:02:23', NULL),
(703, 270, 'Artes visuales maoríes', 0, 1, 270, 'es', '2018-06-23 20:02:23', NULL),
(704, 271, 'Biología Marina', 0, 1, 271, 'es', '2018-06-23 20:02:23', NULL),
(705, 272, 'ciencia Marina', 0, 1, 272, 'es', '2018-06-23 20:02:23', NULL),
(706, 273, 'Ingeniería Marítima', 0, 1, 273, 'es', '2018-06-23 20:02:23', NULL),
(707, 274, 'Márketing', 0, 1, 274, 'es', '2018-06-23 20:02:23', NULL),
(708, 275, 'Dirección de marketing', 0, 1, 275, 'es', '2018-06-23 20:02:23', NULL),
(709, 276, 'Investigación de mercado', 0, 1, 276, 'es', '2018-06-23 20:02:23', NULL),
(710, 277, 'Ley de Comunicación Masiva y Ética', 0, 1, 277, 'es', '2018-06-23 20:02:23', NULL),
(711, 278, 'Medios de comunicación en Pakistán', 0, 1, 278, 'es', '2018-06-23 20:02:23', NULL),
(712, 279, 'Tecnología de materiales', 0, 1, 279, 'es', '2018-06-23 20:02:23', NULL),
(713, 280, 'Métodos Matemáticos', 0, 1, 280, 'es', '2018-06-23 20:02:23', NULL),
(714, 281, 'Matemáticas', 0, 1, 281, 'es', '2018-06-23 20:02:23', NULL),
(715, 282, 'Ingeniería mecánica', 0, 1, 282, 'es', '2018-06-23 20:02:23', NULL),
(716, 283, 'Mecatrónica', 0, 1, 283, 'es', '2018-06-23 20:02:23', NULL),
(717, 284, 'Ciencias de laboratorio médico', 0, 1, 284, 'es', '2018-06-23 20:02:23', NULL),
(718, 285, 'Tecnología Medica', 0, 1, 285, 'es', '2018-06-23 20:02:23', NULL),
(719, 286, 'Medicina', 0, 1, 286, 'es', '2018-06-23 20:02:23', NULL),
(720, 287, 'Microbiología', 0, 1, 287, 'es', '2018-06-23 20:02:23', NULL),
(721, 288, 'Microeconomía', 0, 1, 288, 'es', '2018-06-23 20:02:23', NULL),
(722, 289, 'Estudios de Medio Oriente y África', 0, 1, 289, 'es', '2018-06-23 20:02:23', NULL),
(723, 290, 'Partería', 0, 1, 290, 'es', '2018-06-23 20:02:23', NULL),
(724, 291, 'Computación móvil y generalizada', 0, 1, 291, 'es', '2018-06-23 20:02:23', NULL),
(725, 292, 'Biotecnología moderna: principios y aplicaciones', 0, 1, 292, 'es', '2018-06-23 20:02:23', NULL),
(726, 293, 'Lenguajes modernos de programación', 0, 1, 293, 'es', '2018-06-23 20:02:23', NULL),
(727, 294, 'Biología Molecular', 0, 1, 294, 'es', '2018-06-23 20:02:23', NULL),
(728, 295, 'Dinero y Banca', 0, 1, 295, 'es', '2018-06-23 20:02:23', NULL),
(729, 296, 'Cálculo multivariable', 0, 1, 296, 'es', '2018-06-23 20:02:23', NULL),
(730, 297, 'Música', 0, 1, 297, 'es', '2018-06-23 20:02:23', NULL),
(731, 298, 'Composición musical', 0, 1, 298, 'es', '2018-06-23 20:02:23', NULL),
(732, 299, 'Presentación musical', 0, 1, 299, 'es', '2018-06-23 20:02:23', NULL),
(733, 300, 'Producción musical', 0, 1, 300, 'es', '2018-06-23 20:02:23', NULL),
(734, 301, 'Estudios de música', 0, 1, 301, 'es', '2018-06-23 20:02:23', NULL),
(735, 302, 'Nanociencia', 0, 1, 302, 'es', '2018-06-23 20:02:23', NULL),
(736, 303, 'Evaluación del desempeño de la red', 0, 1, 303, 'es', '2018-06-23 20:02:23', NULL),
(737, 304, 'Seguridad de la red', 0, 1, 304, 'es', '2018-06-23 20:02:23', NULL),
(738, 305, 'Bases Neurológicas del Comportamiento', 0, 1, 305, 'es', '2018-06-23 20:02:23', NULL),
(739, 306, 'Neurociencia', 0, 1, 306, 'es', '2018-06-23 20:02:23', NULL),
(740, 307, 'Lenguaje de señas de Nueva Zelanda', 0, 1, 307, 'es', '2018-06-23 20:02:23', NULL),
(741, 308, 'Análisis numérico', 0, 1, 308, 'es', '2018-06-23 20:02:23', NULL),
(742, 309, 'Enfermería', 0, 1, 309, 'es', '2018-06-23 20:02:23', NULL),
(743, 310, 'DBMS orientado a objetos', 0, 1, 310, 'es', '2018-06-23 20:02:23', NULL),
(744, 311, 'Programación orientada a objetos', 0, 1, 311, 'es', '2018-06-23 20:02:23', NULL),
(745, 312, 'Terapia ocupacional', 0, 1, 312, 'es', '2018-06-23 20:02:23', NULL),
(746, 313, 'Terapia Ocupacional y Rehabilitación', 0, 1, 313, 'es', '2018-06-23 20:02:23', NULL),
(747, 314, 'Sistemas operativos', 0, 1, 314, 'es', '2018-06-23 20:02:23', NULL),
(748, 315, 'La investigación de operaciones', 0, 1, 315, 'es', '2018-06-23 20:02:23', NULL),
(749, 316, 'Optometría', 0, 1, 316, 'es', '2018-06-23 20:02:23', NULL),
(750, 317, 'Optometría, oftalmología y ortóptica', 0, 1, 317, 'es', '2018-06-23 20:02:23', NULL),
(751, 318, 'Salud bucal', 0, 1, 318, 'es', '2018-06-23 20:02:23', NULL),
(752, 319, 'Teoría y diseño de la organización', 0, 1, 319, 'es', '2018-06-23 20:02:23', NULL),
(753, 320, 'Comportamiento organizativo', 0, 1, 320, 'es', '2018-06-23 20:02:23', NULL),
(754, 321, 'Desarrollo organizacional', 0, 1, 321, 'es', '2018-06-23 20:02:23', NULL),
(755, 322, 'Psicología Organizacional', 0, 1, 322, 'es', '2018-06-23 20:02:23', NULL),
(756, 323, 'Estudios de las islas del Pacífico', 0, 1, 323, 'es', '2018-06-23 20:02:23', NULL),
(757, 324, 'Estudios de Pakistán', 0, 1, 324, 'es', '2018-06-23 20:02:23', NULL),
(758, 325, 'Paramedicina', 0, 1, 325, 'es', '2018-06-23 20:02:23', NULL),
(759, 326, 'Estudios Pastorales', 0, 1, 326, 'es', '2018-06-23 20:02:23', NULL),
(760, 327, 'Gestión del rendimiento', 0, 1, 327, 'es', '2018-06-23 20:02:23', NULL),
(761, 328, 'Psicología de la personalidad', 0, 1, 328, 'es', '2018-06-23 20:02:23', NULL),
(762, 329, 'Farmacología', 0, 1, 329, 'es', '2018-06-23 20:02:23', NULL),
(763, 330, 'Farmacología y Farmacia', 0, 1, 330, 'es', '2018-06-23 20:02:23', NULL),
(764, 331, 'Farmacia', 0, 1, 331, 'es', '2018-06-23 20:02:23', NULL),
(765, 332, 'Filosofía', 0, 1, 332, 'es', '2018-06-23 20:02:23', NULL),
(766, 333, 'Filosofía de la educación', 0, 1, 333, 'es', '2018-06-23 20:02:23', NULL),
(767, 334, 'Fotografía', 0, 1, 334, 'es', '2018-06-23 20:02:23', NULL),
(768, 335, 'Física', 0, 1, 335, 'es', '2018-06-23 20:02:23', NULL),
(769, 336, 'Física y Astronomía', 0, 1, 336, 'es', '2018-06-23 20:02:23', NULL),
(770, 337, 'Fisiología', 0, 1, 337, 'es', '2018-06-23 20:02:23', NULL),
(771, 338, 'Fisioterapia', 0, 1, 338, 'es', '2018-06-23 20:02:23', NULL),
(772, 339, 'Podiatría', 0, 1, 339, 'es', '2018-06-23 20:02:23', NULL),
(773, 340, 'Estudios Políticos', 0, 1, 340, 'es', '2018-06-23 20:02:23', NULL),
(774, 341, 'Política', 0, 1, 341, 'es', '2018-06-23 20:02:23', NULL),
(775, 342, 'Estudios de población y desarrollo', 0, 1, 342, 'es', '2018-06-23 20:02:23', NULL),
(776, 343, 'Salud de la población', 0, 1, 343, 'es', '2018-06-23 20:02:23', NULL),
(777, 344, 'Psicologia POSITIVA', 0, 1, 344, 'es', '2018-06-23 20:02:23', NULL),
(778, 345, 'Principios de la Gestión', 0, 1, 345, 'es', '2018-06-23 20:02:23', NULL),
(779, 346, 'Principios de Marketing', 0, 1, 346, 'es', '2018-06-23 20:02:23', NULL),
(780, 347, 'Probabilidad y procesos estocásticos', 0, 1, 347, 'es', '2018-06-23 20:02:23', NULL),
(781, 348, 'Producto y Diseño Industrial', 0, 1, 348, 'es', '2018-06-23 20:02:23', NULL),
(782, 349, 'Producción / Gestión de operaciones', 0, 1, 349, 'es', '2018-06-23 20:02:23', NULL),
(783, 350, 'Gestión de proyectos', 0, 1, 350, 'es', '2018-06-23 20:02:23', NULL),
(784, 351, 'Pruebas psicológicas y mediciones', 0, 1, 351, 'es', '2018-06-23 20:02:23', NULL),
(785, 352, 'Psicología', 0, 1, 352, 'es', '2018-06-23 20:02:23', NULL),
(786, 353, 'Ley internacional publica', 0, 1, 353, 'es', '2018-06-23 20:02:23', NULL),
(787, 354, 'Política pública', 0, 1, 354, 'es', '2018-06-23 20:02:23', NULL),
(788, 355, 'Relaciones públicas', 0, 1, 355, 'es', '2018-06-23 20:02:23', NULL),
(789, 356, 'Cantidad encuestada', 0, 1, 356, 'es', '2018-06-23 20:02:23', NULL),
(790, 357, 'Terapia de radiación', 0, 1, 357, 'es', '2018-06-23 20:02:23', NULL),
(791, 358, 'Reporting y producción de noticias de radio', 0, 1, 358, 'es', '2018-06-23 20:02:23', NULL),
(792, 359, 'Radio, TV y producción de estudio', 0, 1, 359, 'es', '2018-06-23 20:02:23', NULL),
(793, 360, 'Estudios religiosos', 0, 1, 360, 'es', '2018-06-23 20:02:23', NULL),
(794, 361, 'Informes y subediciones', 0, 1, 361, 'es', '2018-06-23 20:02:23', NULL),
(795, 362, 'Métodos de busqueda', 0, 1, 362, 'es', '2018-06-23 20:02:23', NULL),
(796, 363, 'Robótica', 0, 1, 363, 'es', '2018-06-23 20:02:23', NULL),
(797, 364, 'ruso', 0, 1, 364, 'es', '2018-06-23 20:02:23', NULL),
(798, 365, 'Idiomas de Rusia y Europa Oriental', 0, 1, 365, 'es', '2018-06-23 20:02:23', NULL),
(799, 366, 'Samoan Studies / Fa\'asamoa', 0, 1, 366, 'es', '2018-06-23 20:02:23', NULL),
(800, 367, 'Escuela, comunidad y maestro', 0, 1, 367, 'es', '2018-06-23 20:02:23', NULL),
(801, 368, 'La escritura de guiones', 0, 1, 368, 'es', '2018-06-23 20:02:23', NULL),
(802, 369, 'Servicios de Marketing', 0, 1, 369, 'es', '2018-06-23 20:02:23', NULL),
(803, 370, 'Gestión de PYME', 0, 1, 370, 'es', '2018-06-23 20:02:23', NULL),
(804, 371, 'Politica social', 0, 1, 371, 'es', '2018-06-23 20:02:23', NULL),
(805, 372, 'Psicología Social', 0, 1, 372, 'es', '2018-06-23 20:02:23', NULL),
(806, 373, 'Ciencias sociales (general)', 0, 1, 373, 'es', '2018-06-23 20:02:23', NULL),
(807, 374, 'Trabajo Social', 0, 1, 374, 'es', '2018-06-23 20:02:23', NULL),
(808, 375, 'Sociología', 0, 1, 375, 'es', '2018-06-23 20:02:23', NULL),
(809, 376, 'Diseño de software', 0, 1, 376, 'es', '2018-06-23 20:02:23', NULL),
(810, 377, 'Ingeniería de Software - I', 0, 1, 377, 'es', '2018-06-23 20:02:23', NULL),
(811, 378, 'Ingeniería de SoftwareII', 0, 1, 378, 'es', '2018-06-23 20:02:23', NULL),
(812, 379, 'Mejora del proceso de software', 0, 1, 379, 'es', '2018-06-23 20:02:23', NULL),
(813, 380, 'Gestión de proyectos de software', 0, 1, 380, 'es', '2018-06-23 20:02:23', NULL),
(814, 381, 'Garantía de calidad del software', 0, 1, 381, 'es', '2018-06-23 20:02:23', NULL),
(815, 382, 'Ingeniería de requisitos de software', 0, 1, 382, 'es', '2018-06-23 20:02:23', NULL),
(816, 383, 'Español', 0, 1, 383, 'es', '2018-06-23 20:02:23', NULL),
(817, 384, 'Terapia de habla y lenguaje', 0, 1, 384, 'es', '2018-06-23 20:02:23', NULL),
(818, 385, 'Ciencia del deporte y el ejercicio', 0, 1, 385, 'es', '2018-06-23 20:02:23', NULL),
(819, 386, 'Estudios y gestión de deporte y tiempo libre', 0, 1, 386, 'es', '2018-06-23 20:02:23', NULL),
(820, 387, 'Entrenamiento deportivo', 0, 1, 387, 'es', '2018-06-23 20:02:23', NULL),
(821, 388, 'Psicología del deporte', 0, 1, 388, 'es', '2018-06-23 20:02:23', NULL),
(822, 389, 'Ciencia deportiva', 0, 1, 389, 'es', '2018-06-23 20:02:23', NULL),
(823, 390, 'Estadística', 0, 1, 390, 'es', '2018-06-23 20:02:23', NULL),
(824, 391, 'Estadística y Probabilidad', 0, 1, 391, 'es', '2018-06-23 20:02:23', NULL),
(825, 392, 'Gestión estratégica', 0, 1, 392, 'es', '2018-06-23 20:02:23', NULL),
(826, 393, 'Dirección de Marketing Estratégico', 0, 1, 393, 'es', '2018-06-23 20:02:23', NULL),
(827, 394, 'Gestión de la cadena de suministro', 0, 1, 394, 'es', '2018-06-23 20:02:23', NULL),
(828, 395, 'Encuesta', 0, 1, 395, 'es', '2018-06-23 20:02:23', NULL),
(829, 396, 'Programación del sistema', 0, 1, 396, 'es', '2018-06-23 20:02:23', NULL),
(830, 397, 'Impuestos', 0, 1, 397, 'es', '2018-06-23 20:02:23', NULL),
(831, 398, 'Gestión Tributaria', 0, 1, 398, 'es', '2018-06-23 20:02:23', NULL),
(832, 399, 'Enseñanza - Primera Infancia', 0, 1, 399, 'es', '2018-06-23 20:02:23', NULL),
(833, 400, 'Enseñanza - Lenguaje maorí', 0, 1, 400, 'es', '2018-06-23 20:02:23', NULL),
(834, 401, 'Enseñanza - Educación Física', 0, 1, 401, 'es', '2018-06-23 20:02:23', NULL),
(835, 402, 'Enseñanza primaria', 0, 1, 402, 'es', '2018-06-23 20:02:23', NULL),
(836, 403, 'Enseñanza - Secundaria', 0, 1, 403, 'es', '2018-06-23 20:02:23', NULL),
(837, 404, 'Enseñanza - Tecnología', 0, 1, 404, 'es', '2018-06-23 20:02:23', NULL),
(838, 405, 'Enseñanza de Inglés', 0, 1, 405, 'es', '2018-06-23 20:02:23', NULL),
(839, 406, 'Enseñanza de la Ciencia General', 0, 1, 406, 'es', '2018-06-23 20:02:23', NULL),
(840, 407, 'Enseñanza de Geografía', 0, 1, 407, 'es', '2018-06-23 20:02:23', NULL),
(841, 408, 'Enseñanza de Estudios Islámicos', 0, 1, 408, 'es', '2018-06-23 20:02:23', NULL),
(842, 409, 'Enseñanza de Habilidades de Alfabetización', 0, 1, 409, 'es', '2018-06-23 20:02:23', NULL),
(843, 410, 'Enseñanza de Urdu', 0, 1, 410, 'es', '2018-06-23 20:02:23', NULL),
(844, 411, 'Teología', 0, 1, 411, 'es', '2018-06-23 20:02:23', NULL),
(845, 412, 'Teología y estudios religiosos', 0, 1, 412, 'es', '2018-06-23 20:02:23', NULL),
(846, 413, 'Teorías de la comunicación', 0, 1, 413, 'es', '2018-06-23 20:02:23', NULL),
(847, 414, 'Teoría y práctica de la consejería', 0, 1, 414, 'es', '2018-06-23 20:02:23', NULL),
(848, 415, 'Teoría de los autómatas', 0, 1, 415, 'es', '2018-06-23 20:02:23', NULL),
(849, 416, 'Teoría de la Computación', 0, 1, 416, 'es', '2018-06-23 20:02:23', NULL),
(850, 417, 'Gestión de calidad total', 0, 1, 417, 'es', '2018-06-23 20:02:23', NULL),
(851, 418, 'Turismo', 0, 1, 418, 'es', '2018-06-23 20:02:23', NULL),
(852, 419, 'Planificación urbana y rural y diseño paisajístico', 0, 1, 419, 'es', '2018-06-23 20:02:23', NULL),
(853, 420, 'Formación y desarrollo', 0, 1, 420, 'es', '2018-06-23 20:02:23', NULL),
(854, 421, 'Dirección de TV', 0, 1, 421, 'es', '2018-06-23 20:02:23', NULL),
(855, 422, 'Noticias de televisión y actualidad', 0, 1, 422, 'es', '2018-06-23 20:02:23', NULL),
(856, 423, 'Informes y producción de noticias de TV', 0, 1, 423, 'es', '2018-06-23 20:02:23', NULL),
(857, 424, 'Urdu', 0, 1, 424, 'es', '2018-06-23 20:02:23', NULL),
(858, 425, 'Valoración y administración de propiedades', 0, 1, 425, 'es', '2018-06-23 20:02:23', NULL),
(859, 426, 'Medicina Veterinaria', 0, 1, 426, 'es', '2018-06-23 20:02:23', NULL),
(860, 427, 'Ciencia y tecnología veterinaria', 0, 1, 427, 'es', '2018-06-23 20:02:23', NULL),
(861, 428, 'Programación visual', 0, 1, 428, 'es', '2018-06-23 20:02:23', NULL),
(862, 429, 'Diseño web y digital', 0, 1, 429, 'es', '2018-06-23 20:02:23', NULL),
(863, 430, 'Diseño web y desarrollo', 0, 1, 430, 'es', '2018-06-23 20:02:23', NULL),
(864, 431, 'Conexiones inalámbricas', 0, 1, 431, 'es', '2018-06-23 20:02:23', NULL),
(865, 432, 'Trabajo juvenil', 0, 1, 432, 'es', '2018-06-23 20:02:23', NULL),
(866, 433, 'Zoología', 0, 1, 433, 'es', '2018-06-23 20:02:23', NULL),
(867, 1, 'علم النفس غير طبيعي', 0, 1, 1, 'ar', '2018-06-23 20:03:13', NULL),
(868, 2, 'محاسبة', 0, 1, 2, 'ar', '2018-06-23 20:03:13', NULL),
(869, 3, 'المحاسبة والمالية', 0, 1, 3, 'ar', '2018-06-23 20:03:13', NULL),
(870, 4, 'التمثيل والأداء', 0, 1, 4, 'ar', '2018-06-23 20:03:13', NULL),
(871, 5, 'معالجة مشاكل التعلم من خلال التكنولوجيا والتربية', 0, 1, 5, 'ar', '2018-06-23 20:03:13', NULL),
(872, 6, 'القانون الإداري والمساءلة', 0, 1, 6, 'ar', '2018-06-23 20:03:13', NULL),
(873, 7, 'هندسة الكمبيوتر المتقدمة', 0, 1, 7, 'ar', '2018-06-23 20:03:13', NULL),
(874, 8, 'طرق البحث المتقدمة', 0, 1, 8, 'ar', '2018-06-23 20:03:13', NULL),
(875, 9, 'تحليل وتصميم الخوارزميات المتقدمة', 0, 1, 9, 'ar', '2018-06-23 20:03:13', NULL),
(876, 10, 'المعلوماتية الحيوية المتقدمة', 0, 1, 10, 'ar', '2018-06-23 20:03:13', NULL),
(877, 11, 'هندسة الكمبيوتر المتقدمة - II', 0, 1, 11, 'ar', '2018-06-23 20:03:13', NULL),
(878, 12, 'شبكات الكمبيوتر المتقدمة', 0, 1, 12, 'ar', '2018-06-23 20:03:13', NULL),
(879, 13, 'طرق الحوسبة المتقدمة', 0, 1, 13, 'ar', '2018-06-23 20:03:13', NULL),
(880, 14, 'محاسبة التكاليف والإدارة المتقدمة', 0, 1, 14, 'ar', '2018-06-23 20:03:13', NULL),
(881, 15, 'المحاسبة المالية المتقدمة', 0, 1, 15, 'ar', '2018-06-23 20:03:13', NULL),
(882, 16, 'أنظمة التشغيل المتقدمة', 0, 1, 16, 'ar', '2018-06-23 20:03:13', NULL),
(883, 17, 'إعلان', 0, 1, 17, 'ar', '2018-06-23 20:03:13', NULL),
(884, 18, 'الإعلان والترويج', 0, 1, 18, 'ar', '2018-06-23 20:03:13', NULL),
(885, 19, 'الإعلان عن الطباعة والوسائط الإلكترونية', 0, 1, 19, 'ar', '2018-06-23 20:03:13', NULL),
(886, 20, 'هندسة الطيران والتصنيع', 0, 1, 20, 'ar', '2018-06-23 20:03:13', NULL),
(887, 21, 'الأعمال الزراعية', 0, 1, 21, 'ar', '2018-06-23 20:03:13', NULL),
(888, 22, 'الزراعة و أمبير؛ الغابات', 0, 1, 22, 'ar', '2018-06-23 20:03:13', NULL),
(889, 23, 'الزراعة (عامة)', 0, 1, 23, 'ar', '2018-06-23 20:03:13', NULL),
(890, 24, 'علم الزراعة وعلوم النبات', 0, 1, 24, 'ar', '2018-06-23 20:03:13', NULL),
(891, 25, 'دراسات أمريكية', 0, 1, 25, 'ar', '2018-06-23 20:03:13', NULL),
(892, 26, 'علم التشريح وأمبير. علم وظائف الأعضاء', 0, 1, 26, 'ar', '2018-06-23 20:03:13', NULL),
(893, 27, 'علم الحيوان', 0, 1, 27, 'ar', '2018-06-23 20:03:13', NULL),
(894, 28, 'علم الأنثروبولوجيا', 0, 1, 28, 'ar', '2018-06-23 20:03:13', NULL),
(895, 29, 'علم الانسان', 0, 1, 29, 'ar', '2018-06-23 20:03:13', NULL),
(896, 30, 'تربية الأحياء المائية ومصايد الأسماك', 0, 1, 30, 'ar', '2018-06-23 20:03:13', NULL),
(897, 31, 'علم الآثار', 0, 1, 31, 'ar', '2018-06-23 20:03:13', NULL),
(898, 32, 'هندسة معمارية', 0, 1, 32, 'ar', '2018-06-23 20:03:13', NULL),
(899, 33, 'تصميم فني', 0, 1, 33, 'ar', '2018-06-23 20:03:13', NULL),
(900, 34, 'تاريخ الفن ونظريته', 0, 1, 34, 'ar', '2018-06-23 20:03:13', NULL),
(901, 35, 'الذكاء الاصطناعي', 0, 1, 35, 'ar', '2018-06-23 20:03:13', NULL),
(902, 36, 'الدراسات الآسيوية', 0, 1, 36, 'ar', '2018-06-23 20:03:13', NULL),
(903, 37, 'الفلك', 0, 1, 37, 'ar', '2018-06-23 20:03:13', NULL),
(904, 38, 'تحرير السمعية والبصرية', 0, 1, 38, 'ar', '2018-06-23 20:03:13', NULL),
(905, 39, 'علم السمع و الفم', 0, 1, 39, 'ar', '2018-06-23 20:03:13', NULL),
(906, 40, 'طيران', 0, 1, 40, 'ar', '2018-06-23 20:03:13', NULL),
(907, 41, 'ادارة الطيران', 0, 1, 41, 'ar', '2018-06-23 20:03:13', NULL),
(908, 42, 'القوانين والممارسات المصرفية', 0, 1, 42, 'ar', '2018-06-23 20:03:13', NULL),
(909, 43, 'دراسات الكتاب المقدس', 0, 1, 43, 'ar', '2018-06-23 20:03:13', NULL),
(910, 44, 'الكيمياء الحيوية', 0, 1, 44, 'ar', '2018-06-23 20:03:13', NULL),
(911, 45, 'الكيمياء الحيوية-I', 0, 1, 45, 'ar', '2018-06-23 20:03:13', NULL),
(912, 46, 'أخلاقيات البيولوجيا ، الأمن الحيوي والسلامة البيولوجية', 0, 1, 46, 'ar', '2018-06-23 20:03:13', NULL),
(913, 47, 'المعلوماتية الحيوية', 0, 1, 47, 'ar', '2018-06-23 20:03:13', NULL),
(914, 48, 'المعلوماتية الحيوية الأول (أساسيات المعلوماتية الجينومية)', 0, 1, 48, 'ar', '2018-06-23 20:03:13', NULL),
(915, 49, 'العلوم البيولوجية', 0, 1, 49, 'ar', '2018-06-23 20:03:13', NULL),
(916, 50, 'علم الأحياء (عام)', 0, 1, 50, 'ar', '2018-06-23 20:03:13', NULL),
(917, 51, 'الهندسة الطبية الحيوية', 0, 1, 51, 'ar', '2018-06-23 20:03:13', NULL),
(918, 52, 'العلوم الطبية الحيوية (غير مصنفة في مكان آخر)', 0, 1, 52, 'ar', '2018-06-23 20:03:13', NULL),
(919, 53, 'التكنولوجيا الحيوية', 0, 1, 53, 'ar', '2018-06-23 20:03:13', NULL),
(920, 54, 'علم النبات', 0, 1, 54, 'ar', '2018-06-23 20:03:13', NULL),
(921, 55, 'إدارة العلامات التجارية', 0, 1, 55, 'ar', '2018-06-23 20:03:13', NULL),
(922, 56, 'بناء', 0, 1, 56, 'ar', '2018-06-23 20:03:13', NULL),
(923, 57, 'قانون الأعمال والعمل', 0, 1, 57, 'ar', '2018-06-23 20:03:13', NULL),
(924, 58, 'دراسات الأعمال والإدارة', 0, 1, 58, 'ar', '2018-06-23 20:03:13', NULL),
(925, 59, 'الكتابة التجارية والفنية باللغة الإنجليزية', 0, 1, 59, 'ar', '2018-06-23 20:03:13', NULL),
(926, 60, 'علاقات عمل', 0, 1, 60, 'ar', '2018-06-23 20:03:13', NULL),
(927, 61, 'الاقتصاد القياسي للأعمال', 0, 1, 61, 'ar', '2018-06-23 20:03:13', NULL),
(928, 62, 'أخلاقيات العمل', 0, 1, 62, 'ar', '2018-06-23 20:03:13', NULL),
(929, 63, 'تمويل الأعمال التجارية', 0, 1, 63, 'ar', '2018-06-23 20:03:13', NULL),
(930, 64, 'الرياضيات التجارية والإحصاء', 0, 1, 64, 'ar', '2018-06-23 20:03:13', NULL),
(931, 65, 'حساب التفاضل والتكامل والهندسة التحليلية', 0, 1, 65, 'ar', '2018-06-23 20:03:13', NULL),
(932, 66, 'حساب التفاضل والتكامل الثاني', 0, 1, 66, 'ar', '2018-06-23 20:03:13', NULL),
(933, 67, 'أساسيات الكاميرا والمبادئ والممارسات', 0, 1, 67, 'ar', '2018-06-23 20:03:13', NULL),
(934, 68, 'بيولوجيا الخلية', 0, 1, 68, 'ar', '2018-06-23 20:03:13', NULL),
(935, 69, 'الدراسات السلتية', 0, 1, 69, 'ar', '2018-06-23 20:03:13', NULL),
(936, 70, 'تغيير الإدارة', 0, 1, 70, 'ar', '2018-06-23 20:03:13', NULL),
(937, 71, 'الهندسة الكيميائية والعمليات', 0, 1, 71, 'ar', '2018-06-23 20:03:13', NULL),
(938, 72, 'هندسة كيميائية', 0, 1, 72, 'ar', '2018-06-23 20:03:13', NULL),
(939, 73, 'كيمياء', 0, 1, 73, 'ar', '2018-06-23 20:03:13', NULL),
(940, 74, 'نمو الطفل', 0, 1, 74, 'ar', '2018-06-23 20:03:14', NULL),
(941, 75, 'صينى', 0, 1, 75, 'ar', '2018-06-23 20:03:14', NULL),
(942, 76, 'الدراسات الصينية', 0, 1, 76, 'ar', '2018-06-23 20:03:14', NULL),
(943, 77, 'الفكر المسيحي والتاريخ', 0, 1, 77, 'ar', '2018-06-23 20:03:14', NULL),
(944, 78, 'نظرية الدائرة', 0, 1, 78, 'ar', '2018-06-23 20:03:14', NULL),
(945, 79, 'هندسة مدنية', 0, 1, 79, 'ar', '2018-06-23 20:03:14', NULL),
(946, 80, 'الدراسات الكلاسيكية', 0, 1, 80, 'ar', '2018-06-23 20:03:14', NULL),
(947, 81, 'الكلاسيكية والتاريخ القديم', 0, 1, 81, 'ar', '2018-06-23 20:03:14', NULL),
(948, 82, 'تقييم الفصل الدراسي', 0, 1, 82, 'ar', '2018-06-23 20:03:14', NULL),
(949, 83, 'إدارة الفصل الدراسي', 0, 1, 83, 'ar', '2018-06-23 20:03:14', NULL),
(950, 84, 'علم النفس السريري', 0, 1, 84, 'ar', '2018-06-23 20:03:14', NULL),
(951, 85, 'الملابس والمنسوجات', 0, 1, 85, 'ar', '2018-06-23 20:03:14', NULL),
(952, 86, 'علم النفس المعرفي', 0, 1, 86, 'ar', '2018-06-23 20:03:14', NULL),
(953, 87, 'قانون تجاري', 0, 1, 87, 'ar', '2018-06-23 20:03:14', NULL),
(954, 88, 'دراسات الاتصالات والإعلام', 0, 1, 88, 'ar', '2018-06-23 20:03:14', NULL),
(955, 89, 'الاتصالات والكتابة المهنية', 0, 1, 89, 'ar', '2018-06-23 20:03:14', NULL),
(956, 90, 'مهارات التواصل', 0, 1, 90, 'ar', '2018-06-23 20:03:14', NULL),
(957, 91, 'بناء مترجم', 0, 1, 91, 'ar', '2018-06-23 20:03:14', NULL),
(958, 92, 'الطب التكميلي', 0, 1, 92, 'ar', '2018-06-23 20:03:14', NULL),
(959, 93, 'هندسة الكمبيوتر وبرمجة لغة التجميع', 0, 1, 93, 'ar', '2018-06-23 20:03:14', NULL),
(960, 94, 'هندسة الكمبيوتر', 0, 1, 94, 'ar', '2018-06-23 20:03:14', NULL),
(961, 95, 'رسومات الحاسوب', 0, 1, 95, 'ar', '2018-06-23 20:03:14', NULL),
(962, 96, 'شبكة الكمبيوتر', 0, 1, 96, 'ar', '2018-06-23 20:03:14', NULL),
(963, 97, 'علوم الكمبيوتر', 0, 1, 97, 'ar', '2018-06-23 20:03:14', NULL),
(964, 98, 'فض النزاعات', 0, 1, 98, 'ar', '2018-06-23 20:03:14', NULL),
(965, 99, 'حل النزاعات', 0, 1, 99, 'ar', '2018-06-23 20:03:14', NULL),
(966, 100, 'إدارة مشاريع البناء', 0, 1, 100, 'ar', '2018-06-23 20:03:14', NULL),
(967, 101, 'عميل البنك', 0, 1, 101, 'ar', '2018-06-23 20:03:14', NULL),
(968, 102, 'سلوك المستهلك', 0, 1, 102, 'ar', '2018-06-23 20:03:14', NULL),
(969, 103, 'علم المستهلك المستهلك', 0, 1, 103, 'ar', '2018-06-23 20:03:14', NULL),
(970, 104, 'تمويل الشركات', 0, 1, 104, 'ar', '2018-06-23 20:03:14', NULL),
(971, 105, 'قانون الشركات', 0, 1, 105, 'ar', '2018-06-23 20:03:14', NULL),
(972, 106, 'محاسبة التكاليف والإدارة', 0, 1, 106, 'ar', '2018-06-23 20:03:14', NULL),
(973, 107, 'تقديم المشورة', 0, 1, 107, 'ar', '2018-06-23 20:03:14', NULL),
(974, 108, 'كتابة إبداعية', 0, 1, 108, 'ar', '2018-06-23 20:03:14', NULL),
(975, 109, 'الائتمان وإدارة المخاطر', 0, 1, 109, 'ar', '2018-06-23 20:03:14', NULL),
(976, 110, 'علم الجريمة', 0, 1, 110, 'ar', '2018-06-23 20:03:14', NULL),
(977, 111, 'علم الجريمة والعدالة', 0, 1, 111, 'ar', '2018-06-23 20:03:14', NULL),
(978, 112, 'إدارة الأزمات', 0, 1, 112, 'ar', '2018-06-23 20:03:14', NULL),
(979, 113, 'التفكير الناقد والممارسة الانعكاسية', 0, 1, 113, 'ar', '2018-06-23 20:03:14', NULL),
(980, 114, 'الأنثروبولوجيا الثقافية', 0, 1, 114, 'ar', '2018-06-23 20:03:14', NULL),
(981, 115, 'دراسات ثقافية', 0, 1, 115, 'ar', '2018-06-23 20:03:14', NULL),
(982, 116, 'تطوير المناهج', 0, 1, 116, 'ar', '2018-06-23 20:03:14', NULL),
(983, 117, 'إدارة علاقات العملاء', 0, 1, 117, 'ar', '2018-06-23 20:03:14', NULL),
(984, 118, 'رقص', 0, 1, 118, 'ar', '2018-06-23 20:03:14', NULL),
(985, 119, 'اتصالات البيانات', 0, 1, 119, 'ar', '2018-06-23 20:03:14', NULL),
(986, 120, 'هياكل البيانات', 0, 1, 120, 'ar', '2018-06-23 20:03:14', NULL),
(987, 121, 'تخزين البيانات', 0, 1, 121, 'ar', '2018-06-23 20:03:14', NULL),
(988, 122, 'أنظمة إدارة قواعد البيانات', 0, 1, 122, 'ar', '2018-06-23 20:03:14', NULL),
(989, 123, 'نمذجة وتصميم قواعد البيانات', 0, 1, 123, 'ar', '2018-06-23 20:03:14', NULL),
(990, 124, 'دراسات الدفاع', 0, 1, 124, 'ar', '2018-06-23 20:03:14', NULL),
(991, 125, 'تقنية طب الأسنان', 0, 1, 125, 'ar', '2018-06-23 20:03:14', NULL),
(992, 126, 'طب الأسنان', 0, 1, 126, 'ar', '2018-06-23 20:03:14', NULL),
(993, 127, 'التصميم (عام)', 0, 1, 127, 'ar', '2018-06-23 20:03:14', NULL),
(994, 128, 'التطوير الاقتصادي', 0, 1, 128, 'ar', '2018-06-23 20:03:14', NULL),
(995, 129, 'المعادلات التفاضلية', 0, 1, 129, 'ar', '2018-06-23 20:03:14', NULL),
(996, 130, 'تصميم المنطق الرقمي', 0, 1, 130, 'ar', '2018-06-23 20:03:14', NULL),
(997, 131, 'الرياضيات المتقطعة', 0, 1, 131, 'ar', '2018-06-23 20:03:14', NULL),
(998, 132, 'توزيع DBMS', 0, 1, 132, 'ar', '2018-06-23 20:03:14', NULL),
(999, 133, 'الدراما / دراسات المسرح', 0, 1, 133, 'ar', '2018-06-23 20:03:14', NULL),
(1000, 134, 'دراما و رقص و سينماتيكا', 0, 1, 134, 'ar', '2018-06-23 20:03:14', NULL),
(1001, 135, 'علوم الأرض (عام)', 0, 1, 135, 'ar', '2018-06-23 20:03:14', NULL),
(1002, 136, 'دراسات شرق وجنوب آسيا', 0, 1, 136, 'ar', '2018-06-23 20:03:14', NULL),
(1003, 137, 'علم البيئة', 0, 1, 137, 'ar', '2018-06-23 20:03:14', NULL),
(1004, 138, 'التجارة الإلكترونية', 0, 1, 138, 'ar', '2018-06-23 20:03:14', NULL),
(1005, 139, 'اقتصاديات', 0, 1, 139, 'ar', '2018-06-23 20:03:14', NULL),
(1006, 140, 'التعليم', 0, 1, 140, 'ar', '2018-06-23 20:03:14', NULL),
(1007, 141, 'تطوير التعليم في باكستان', 0, 1, 141, 'ar', '2018-06-23 20:03:14', NULL),
(1008, 142, 'الدراسات التعليمية', 0, 1, 142, 'ar', '2018-06-23 20:03:14', NULL),
(1009, 143, 'سياسة وممارسات الحوكمة التعليمية', 0, 1, 143, 'ar', '2018-06-23 20:03:14', NULL),
(1010, 144, 'القيادة التربوية والإدارة', 0, 1, 144, 'ar', '2018-06-23 20:03:14', NULL),
(1011, 145, 'علم النفس التربوي', 0, 1, 145, 'ar', '2018-06-23 20:03:14', NULL),
(1012, 146, 'الهندسة الكهربائية والإلكترونية', 0, 1, 146, 'ar', '2018-06-23 20:03:14', NULL),
(1013, 147, 'الهندسة الكهربائية', 0, 1, 147, 'ar', '2018-06-23 20:03:14', NULL),
(1014, 148, 'إلكترونيات', 0, 1, 148, 'ar', '2018-06-23 20:03:14', NULL),
(1015, 149, 'الابتدائية الانجليزية', 0, 1, 149, 'ar', '2018-06-23 20:03:14', NULL),
(1016, 150, 'الرياضيات الابتدائية', 0, 1, 150, 'ar', '2018-06-23 20:03:14', NULL),
(1017, 151, 'دراسات الطاقة والإدارة', 0, 1, 151, 'ar', '2018-06-23 20:03:14', NULL),
(1018, 152, 'علم الهندسة', 0, 1, 152, 'ar', '2018-06-23 20:03:14', NULL),
(1019, 153, 'الإنجليزية', 0, 1, 153, 'ar', '2018-06-23 20:03:14', NULL),
(1020, 154, 'الإنجليزية كلغة ثانية', 0, 1, 154, 'ar', '2018-06-23 20:03:14', NULL),
(1021, 155, 'فهم اللغة الإنجليزية', 0, 1, 155, 'ar', '2018-06-23 20:03:14', NULL),
(1022, 156, 'ريادة الأعمال', 0, 1, 156, 'ar', '2018-06-23 20:03:14', NULL),
(1023, 157, 'هندسة الموارد البيئية والطبيعية', 0, 1, 157, 'ar', '2018-06-23 20:03:14', NULL),
(1024, 158, 'الصحة البيئية', 0, 1, 158, 'ar', '2018-06-23 20:03:14', NULL),
(1025, 159, 'علم نفس بيئي', 0, 1, 159, 'ar', '2018-06-23 20:03:14', NULL),
(1026, 160, 'علوم بيئية', 0, 1, 160, 'ar', '2018-06-23 20:03:14', NULL),
(1027, 161, 'دراسات بيئية', 0, 1, 161, 'ar', '2018-06-23 20:03:14', NULL),
(1028, 162, 'أساسيات علم الوراثة', 0, 1, 162, 'ar', '2018-06-23 20:03:14', NULL),
(1029, 163, 'أخلاق', 0, 1, 163, 'ar', '2018-06-23 20:03:14', NULL),
(1030, 164, 'الأخلاق (لغير المسلمين)', 0, 1, 164, 'ar', '2018-06-23 20:03:14', NULL),
(1031, 165, 'اللغات الأوروبية والثقافات', 0, 1, 165, 'ar', '2018-06-23 20:03:14', NULL),
(1032, 166, 'الدراسات الأوروبية', 0, 1, 166, 'ar', '2018-06-23 20:03:14', NULL),
(1033, 167, 'موضه', 0, 1, 167, 'ar', '2018-06-23 20:03:14', NULL),
(1034, 168, 'تصميم الأزياء', 0, 1, 168, 'ar', '2018-06-23 20:03:14', NULL),
(1035, 169, 'ميزة وكتابة العمود', 0, 1, 169, 'ar', '2018-06-23 20:03:14', NULL),
(1036, 170, 'دراسات الأفلام والإعلام', 0, 1, 170, 'ar', '2018-06-23 20:03:14', NULL),
(1037, 171, 'صناعة الأفلام', 0, 1, 171, 'ar', '2018-06-23 20:03:14', NULL),
(1038, 172, 'صناعة الأفلام', 0, 1, 172, 'ar', '2018-06-23 20:03:14', NULL),
(1039, 173, 'المالية', 0, 1, 173, 'ar', '2018-06-23 20:03:14', NULL),
(1040, 174, 'محاسبة مالية', 0, 1, 174, 'ar', '2018-06-23 20:03:14', NULL),
(1041, 175, 'المحاسبة المالية 2', 0, 1, 175, 'ar', '2018-06-23 20:03:14', NULL),
(1042, 176, 'ادارة مالية', 0, 1, 176, 'ar', '2018-06-23 20:03:14', NULL),
(1043, 177, 'تحليل القوائم المالية', 0, 1, 177, 'ar', '2018-06-23 20:03:14', NULL),
(1044, 178, 'الفنون الجميلة', 0, 1, 178, 'ar', '2018-06-23 20:03:14', NULL),
(1045, 179, 'علم الطعام', 0, 1, 179, 'ar', '2018-06-23 20:03:14', NULL),
(1046, 180, 'العلوم التحليلية الشرعية', 0, 1, 180, 'ar', '2018-06-23 20:03:14', NULL),
(1047, 181, 'علم النفس الشرعي', 0, 1, 181, 'ar', '2018-06-23 20:03:14', NULL),
(1048, 182, 'علم الطب الشرعي', 0, 1, 182, 'ar', '2018-06-23 20:03:14', NULL),
(1049, 183, 'الغابات', 0, 1, 183, 'ar', '2018-06-23 20:03:14', NULL),
(1050, 184, 'الطرق الرسمية لهندسة البرمجيات', 0, 1, 184, 'ar', '2018-06-23 20:03:14', NULL),
(1051, 185, 'أسس التربية', 0, 1, 185, 'ar', '2018-06-23 20:03:14', NULL),
(1052, 186, 'الفرنسية', 0, 1, 186, 'ar', '2018-06-23 20:03:14', NULL),
(1053, 187, 'أساسيات الخوارزميات', 0, 1, 187, 'ar', '2018-06-23 20:03:14', NULL),
(1054, 188, 'أساسيات التدقيق', 0, 1, 188, 'ar', '2018-06-23 20:03:14', NULL),
(1055, 189, 'أساسيات العلاقات العامة', 0, 1, 189, 'ar', '2018-06-23 20:03:14', NULL),
(1056, 190, 'قضايا النوع الاجتماعي في علم النفس', 0, 1, 190, 'ar', '2018-06-23 20:03:14', NULL),
(1057, 191, 'دراسات النوع', 0, 1, 191, 'ar', '2018-06-23 20:03:14', NULL),
(1058, 192, 'التلاعب الجيني والهندسة الوراثية', 0, 1, 192, 'ar', '2018-06-23 20:03:14', NULL),
(1059, 193, 'الهندسة العامة', 0, 1, 193, 'ar', '2018-06-23 20:03:14', NULL),
(1060, 194, 'الرياضيات العامة', 0, 1, 194, 'ar', '2018-06-23 20:03:14', NULL),
(1061, 195, 'طرق التدريس العامة', 0, 1, 195, 'ar', '2018-06-23 20:03:14', NULL),
(1062, 196, 'علوم عامة', 0, 1, 196, 'ar', '2018-06-23 20:03:14', NULL),
(1063, 197, 'علم الوراثة', 0, 1, 197, 'ar', '2018-06-23 20:03:14', NULL),
(1064, 198, 'جغرافية', 0, 1, 198, 'ar', '2018-06-23 20:03:14', NULL),
(1065, 199, 'الجغرافيا والعلوم البيئية', 0, 1, 199, 'ar', '2018-06-23 20:03:14', NULL),
(1066, 200, 'جيولوجيا', 0, 1, 200, 'ar', '2018-06-23 20:03:14', NULL),
(1067, 201, 'ألمانية', 0, 1, 201, 'ar', '2018-06-23 20:03:14', NULL),
(1068, 202, 'عولمة وسائل الإعلام', 0, 1, 202, 'ar', '2018-06-23 20:03:14', NULL),
(1069, 203, 'التصميم الجرافيكي', 0, 1, 203, 'ar', '2018-06-23 20:03:14', NULL),
(1070, 204, 'الإغريقي', 0, 1, 204, 'ar', '2018-06-23 20:03:14', NULL),
(1071, 205, 'تعزيز الصحة', 0, 1, 205, 'ar', '2018-06-23 20:03:14', NULL),
(1072, 206, 'علم نفس الصحة', 0, 1, 206, 'ar', '2018-06-23 20:03:14', NULL),
(1073, 207, 'التاريخ', 0, 1, 207, 'ar', '2018-06-23 20:03:14', NULL),
(1074, 208, 'تاريخ وأنظمة علم النفس', 0, 1, 208, 'ar', '2018-06-23 20:03:14', NULL),
(1075, 209, 'تاريخ الفن والهندسة المعمارية والتصميم', 0, 1, 209, 'ar', '2018-06-23 20:03:14', NULL),
(1076, 210, 'إدارة الضيافة', 0, 1, 210, 'ar', '2018-06-23 20:03:14', NULL),
(1077, 211, 'الضيافة والترفيه والاستجمام والسياحة', 0, 1, 211, 'ar', '2018-06-23 20:03:14', NULL),
(1078, 212, 'تفاعل الإنسان والحاسوب', 0, 1, 212, 'ar', '2018-06-23 20:03:14', NULL),
(1079, 213, 'دراسات التنمية البشرية', 0, 1, 213, 'ar', '2018-06-23 20:03:14', NULL),
(1080, 214, 'التغذية البشرية', 0, 1, 214, 'ar', '2018-06-23 20:03:14', NULL),
(1081, 215, 'العلاقات الإنسانية', 0, 1, 215, 'ar', '2018-06-23 20:03:14', NULL),
(1082, 216, 'تطوير الموارد البشرية', 0, 1, 216, 'ar', '2018-06-23 20:03:14', NULL),
(1083, 217, 'ادارة الموارد البشرية', 0, 1, 217, 'ar', '2018-06-23 20:03:14', NULL),
(1084, 218, 'اللغات الايبيرية / الدراسات الاسبانية', 0, 1, 218, 'ar', '2018-06-23 20:03:14', NULL),
(1085, 219, 'تقنيات استرجاع المعلومات', 0, 1, 219, 'ar', '2018-06-23 20:03:14', NULL),
(1086, 220, 'علوم المعلومات', 0, 1, 220, 'ar', '2018-06-23 20:03:14', NULL),
(1087, 221, 'نظم المعلومات', 0, 1, 221, 'ar', '2018-06-23 20:03:14', NULL),
(1088, 222, 'أعمال عالمية', 0, 1, 222, 'ar', '2018-06-23 20:03:14', NULL),
(1089, 223, 'اتصالات دولية', 0, 1, 223, 'ar', '2018-06-23 20:03:14', NULL),
(1090, 224, 'التسويق الدولي', 0, 1, 224, 'ar', '2018-06-23 20:03:14', NULL),
(1091, 225, 'علاقات دولية', 0, 1, 225, 'ar', '2018-06-23 20:03:14', NULL),
(1092, 226, 'الدراسات الدولية', 0, 1, 226, 'ar', '2018-06-23 20:03:14', NULL),
(1093, 227, 'الترجمة والترجمة', 0, 1, 227, 'ar', '2018-06-23 20:03:14', NULL),
(1094, 228, 'مقدمة في الإذاعة', 0, 1, 228, 'ar', '2018-06-23 20:03:14', NULL),
(1095, 229, 'مقدمة للأعمال', 0, 1, 229, 'ar', '2018-06-23 20:03:14', NULL),
(1096, 230, 'مقدمة في الحوسبة', 0, 1, 230, 'ar', '2018-06-23 20:03:14', NULL),
(1097, 231, 'مقدمة في التوجيه والإرشاد', 0, 1, 231, 'ar', '2018-06-23 20:03:14', NULL),
(1098, 232, 'مقدمة في الاتصال الجماهيري', 0, 1, 232, 'ar', '2018-06-23 20:03:14', NULL),
(1099, 233, 'مقدمة لتصميم وتحليل الشبكة', 0, 1, 233, 'ar', '2018-06-23 20:03:14', NULL),
(1100, 234, 'مقدمة في البرمجة', 0, 1, 234, 'ar', '2018-06-23 20:03:14', NULL),
(1101, 235, 'مدخل إلى علم النفس', 0, 1, 235, 'ar', '2018-06-23 20:03:14', NULL),
(1102, 236, 'مقدمة في الإدارة العامة', 0, 1, 236, 'ar', '2018-06-23 20:03:14', NULL),
(1103, 237, 'مدخل إلى علم الاجتماع', 0, 1, 237, 'ar', '2018-06-23 20:03:14', NULL),
(1104, 238, 'مقدمة لتطوير خدمات الويب', 0, 1, 238, 'ar', '2018-06-23 20:03:14', NULL),
(1105, 239, 'تحليل الاستثمار وإدارة المحافظ', 0, 1, 239, 'ar', '2018-06-23 20:03:14', NULL),
(1106, 240, 'الدراسات الإسلامية', 0, 1, 240, 'ar', '2018-06-23 20:03:14', NULL),
(1107, 241, 'الإيطالي', 0, 1, 241, 'ar', '2018-06-23 20:03:14', NULL),
(1108, 242, 'اليابانية', 0, 1, 242, 'ar', '2018-06-23 20:03:14', NULL),
(1109, 243, 'الدراسات اليابانية', 0, 1, 243, 'ar', '2018-06-23 20:03:14', NULL),
(1110, 244, 'صحافة', 0, 1, 244, 'ar', '2018-06-23 20:03:14', NULL),
(1111, 245, 'الكتابة الصحفية', 0, 1, 245, 'ar', '2018-06-23 20:03:14', NULL),
(1112, 246, 'إدارة المعرفة', 0, 1, 246, 'ar', '2018-06-23 20:03:14', NULL),
(1113, 247, 'الكورية', 0, 1, 247, 'ar', '2018-06-23 20:03:14', NULL),
(1114, 248, 'العلاقات العمالية والصناعية', 0, 1, 248, 'ar', '2018-06-23 20:03:14', NULL),
(1115, 249, 'إدارة الأراضي والعقارات', 0, 1, 249, 'ar', '2018-06-23 20:03:14', NULL),
(1116, 250, 'إدارة وتخطيط استخدام الأراضي', 0, 1, 250, 'ar', '2018-06-23 20:03:14', NULL),
(1117, 251, 'لاتينية', 0, 1, 251, 'ar', '2018-06-23 20:03:14', NULL),
(1118, 252, 'القانون', 0, 1, 252, 'ar', '2018-06-23 20:03:14', NULL),
(1119, 253, 'القيادة وإدارة الفريق', 0, 1, 253, 'ar', '2018-06-23 20:03:14', NULL),
(1120, 254, 'نظريات التعلم', 0, 1, 254, 'ar', '2018-06-23 20:03:14', NULL),
(1121, 255, 'أمانة المكتبة وإدارة المعلومات', 0, 1, 255, 'ar', '2018-06-23 20:03:14', NULL),
(1122, 256, 'الإضاءة للإنتاج التلفزيوني', 0, 1, 256, 'ar', '2018-06-23 20:03:14', NULL),
(1123, 257, 'الجبر الخطي', 0, 1, 257, 'ar', '2018-06-23 20:03:14', NULL),
(1124, 258, 'علم اللغة', 0, 1, 258, 'ar', '2018-06-23 20:03:14', NULL),
(1125, 259, 'الاقتصاد الكلي', 0, 1, 259, 'ar', '2018-06-23 20:03:14', NULL),
(1126, 260, 'إدارة', 0, 1, 260, 'ar', '2018-06-23 20:03:14', NULL),
(1127, 261, 'إدارة المؤسسات المالية', 0, 1, 261, 'ar', '2018-06-23 20:03:14', NULL),
(1128, 262, 'المهارات الإدارية', 0, 1, 262, 'ar', '2018-06-23 20:03:14', NULL),
(1129, 263, 'المحاسبة الإدارية', 0, 1, 263, 'ar', '2018-06-23 20:03:14', NULL),
(1130, 264, 'الاقتصاد الإداري', 0, 1, 264, 'ar', '2018-06-23 20:03:14', NULL),
(1131, 265, 'تنمية الماوري', 0, 1, 265, 'ar', '2018-06-23 20:03:14', NULL),
(1132, 266, 'صحة الماوري', 0, 1, 266, 'ar', '2018-06-23 20:03:14', NULL),
(1133, 267, 'لغة الماوري / تي ريو ماوري', 0, 1, 267, 'ar', '2018-06-23 20:03:14', NULL),
(1134, 268, 'دراسات وسائل الاعلام الماورية', 0, 1, 268, 'ar', '2018-06-23 20:03:14', NULL),
(1135, 269, 'دراسات الماوري', 0, 1, 269, 'ar', '2018-06-23 20:03:14', NULL),
(1136, 270, 'الفنون البصرية الماورية', 0, 1, 270, 'ar', '2018-06-23 20:03:14', NULL),
(1137, 271, 'علم الأحياء البحرية', 0, 1, 271, 'ar', '2018-06-23 20:03:14', NULL),
(1138, 272, 'العلوم البحرية', 0, 1, 272, 'ar', '2018-06-23 20:03:14', NULL),
(1139, 273, 'الهندسة البحرية', 0, 1, 273, 'ar', '2018-06-23 20:03:14', NULL),
(1140, 274, 'تسويق', 0, 1, 274, 'ar', '2018-06-23 20:03:14', NULL),
(1141, 275, 'ادارة التسويق', 0, 1, 275, 'ar', '2018-06-23 20:03:14', NULL),
(1142, 276, 'بحوث التسويق', 0, 1, 276, 'ar', '2018-06-23 20:03:14', NULL),
(1143, 277, 'قانون الاتصال الجماهيري و الأخلاق', 0, 1, 277, 'ar', '2018-06-23 20:03:14', NULL),
(1144, 278, 'وسائل الإعلام في باكستان', 0, 1, 278, 'ar', '2018-06-23 20:03:14', NULL),
(1145, 279, 'تكنولوجيا المواد', 0, 1, 279, 'ar', '2018-06-23 20:03:14', NULL),
(1146, 280, 'الطرق الرياضية', 0, 1, 280, 'ar', '2018-06-23 20:03:14', NULL),
(1147, 281, 'الرياضيات', 0, 1, 281, 'ar', '2018-06-23 20:03:14', NULL),
(1148, 282, 'مهندس ميكانيكى', 0, 1, 282, 'ar', '2018-06-23 20:03:14', NULL),
(1149, 283, 'الميكاترونيك', 0, 1, 283, 'ar', '2018-06-23 20:03:14', NULL),
(1150, 284, 'علم المختبرات الطبية', 0, 1, 284, 'ar', '2018-06-23 20:03:14', NULL),
(1151, 285, 'تكنولوجيا طبية', 0, 1, 285, 'ar', '2018-06-23 20:03:14', NULL),
(1152, 286, 'دواء', 0, 1, 286, 'ar', '2018-06-23 20:03:14', NULL),
(1153, 287, 'علم الاحياء المجهري', 0, 1, 287, 'ar', '2018-06-23 20:03:14', NULL),
(1154, 288, 'الاقتصاد الجزئي', 0, 1, 288, 'ar', '2018-06-23 20:03:14', NULL),
(1155, 289, 'دراسات الشرق الأوسط وأفريقيا', 0, 1, 289, 'ar', '2018-06-23 20:03:14', NULL),
(1156, 290, 'القبالة', 0, 1, 290, 'ar', '2018-06-23 20:03:14', NULL),
(1157, 291, 'الحوسبة المتنقلة والمتفشية', 0, 1, 291, 'ar', '2018-06-23 20:03:14', NULL),
(1158, 292, 'التكنولوجيا الحيوية الحديثة: المبادئ والتطبيقات', 0, 1, 292, 'ar', '2018-06-23 20:03:14', NULL),
(1159, 293, 'لغات البرمجة الحديثة', 0, 1, 293, 'ar', '2018-06-23 20:03:14', NULL),
(1160, 294, 'البيولوجيا الجزيئية', 0, 1, 294, 'ar', '2018-06-23 20:03:14', NULL),
(1161, 295, 'النقود والبنوك', 0, 1, 295, 'ar', '2018-06-23 20:03:14', NULL),
(1162, 296, 'التفاضل المتعدد المتغيرات', 0, 1, 296, 'ar', '2018-06-23 20:03:14', NULL),
(1163, 297, 'موسيقى', 0, 1, 297, 'ar', '2018-06-23 20:03:14', NULL),
(1164, 298, 'التأليف الموسيقي', 0, 1, 298, 'ar', '2018-06-23 20:03:14', NULL),
(1165, 299, 'عرض موسيقي', 0, 1, 299, 'ar', '2018-06-23 20:03:14', NULL),
(1166, 300, 'إنتاج موسيقي', 0, 1, 300, 'ar', '2018-06-23 20:03:14', NULL),
(1167, 301, 'دراسات الموسيقى', 0, 1, 301, 'ar', '2018-06-23 20:03:14', NULL),
(1168, 302, 'علم النانو', 0, 1, 302, 'ar', '2018-06-23 20:03:14', NULL),
(1169, 303, 'تقييم أداء الشبكة', 0, 1, 303, 'ar', '2018-06-23 20:03:14', NULL),
(1170, 304, 'أمن الشبكة', 0, 1, 304, 'ar', '2018-06-23 20:03:14', NULL),
(1171, 305, 'القواعد العصبية للسلوك', 0, 1, 305, 'ar', '2018-06-23 20:03:14', NULL),
(1172, 306, 'علم الأعصاب', 0, 1, 306, 'ar', '2018-06-23 20:03:14', NULL),
(1173, 307, 'لغة الإشارة في نيوزيلندا', 0, 1, 307, 'ar', '2018-06-23 20:03:14', NULL),
(1174, 308, 'التحليل العددي', 0, 1, 308, 'ar', '2018-06-23 20:03:14', NULL),
(1175, 309, 'تمريض', 0, 1, 309, 'ar', '2018-06-23 20:03:14', NULL),
(1176, 310, 'كائن التوجه DBMS', 0, 1, 310, 'ar', '2018-06-23 20:03:14', NULL),
(1177, 311, 'البرمجة الشيئية', 0, 1, 311, 'ar', '2018-06-23 20:03:14', NULL),
(1178, 312, 'علاج وظيفي', 0, 1, 312, 'ar', '2018-06-23 20:03:14', NULL),
(1179, 313, 'العلاج الوظيفي وإعادة التأهيل', 0, 1, 313, 'ar', '2018-06-23 20:03:14', NULL),
(1180, 314, 'أنظمة التشغيل', 0, 1, 314, 'ar', '2018-06-23 20:03:14', NULL),
(1181, 315, 'بحوث العمليات', 0, 1, 315, 'ar', '2018-06-23 20:03:14', NULL),
(1182, 316, 'قياس مدى البصر', 0, 1, 316, 'ar', '2018-06-23 20:03:14', NULL),
(1183, 317, 'البصريات ، طب وجراحة العيون وتقويم البصر', 0, 1, 317, 'ar', '2018-06-23 20:03:14', NULL),
(1184, 318, 'صحة الفم', 0, 1, 318, 'ar', '2018-06-23 20:03:14', NULL),
(1185, 319, 'نظرية المنظمة والتصميم', 0, 1, 319, 'ar', '2018-06-23 20:03:14', NULL),
(1186, 320, 'السلوك التنظيمي', 0, 1, 320, 'ar', '2018-06-23 20:03:14', NULL),
(1187, 321, 'التطوير التنظيمي', 0, 1, 321, 'ar', '2018-06-23 20:03:14', NULL),
(1188, 322, 'علم النفس التنظيمي', 0, 1, 322, 'ar', '2018-06-23 20:03:14', NULL),
(1189, 323, 'دراسات جزر المحيط الهادئ', 0, 1, 323, 'ar', '2018-06-23 20:03:14', NULL),
(1190, 324, 'دراسات الباكستان', 0, 1, 324, 'ar', '2018-06-23 20:03:14', NULL),
(1191, 325, 'Paramedicine', 0, 1, 325, 'ar', '2018-06-23 20:03:14', NULL),
(1192, 326, 'الدراسات الرعوية', 0, 1, 326, 'ar', '2018-06-23 20:03:14', NULL),
(1193, 327, 'ادارة الأداء', 0, 1, 327, 'ar', '2018-06-23 20:03:14', NULL),
(1194, 328, 'علم نفس الشخصية', 0, 1, 328, 'ar', '2018-06-23 20:03:14', NULL),
(1195, 329, 'علم العقاقير', 0, 1, 329, 'ar', '2018-06-23 20:03:14', NULL),
(1196, 330, 'الصيدلة والصيدلة', 0, 1, 330, 'ar', '2018-06-23 20:03:14', NULL),
(1197, 331, 'مقابل', 0, 1, 331, 'ar', '2018-06-23 20:03:14', NULL),
(1198, 332, 'فلسفة', 0, 1, 332, 'ar', '2018-06-23 20:03:14', NULL),
(1199, 333, 'فلسفة التربية', 0, 1, 333, 'ar', '2018-06-23 20:03:14', NULL),
(1200, 334, 'التصوير', 0, 1, 334, 'ar', '2018-06-23 20:03:14', NULL),
(1201, 335, 'علوم فيزيائية', 0, 1, 335, 'ar', '2018-06-23 20:03:14', NULL),
(1202, 336, 'الفيزياء وعلم الفلك', 0, 1, 336, 'ar', '2018-06-23 20:03:14', NULL),
(1203, 337, 'علم وظائف الأعضاء', 0, 1, 337, 'ar', '2018-06-23 20:03:14', NULL),
(1204, 338, 'العلاج الطبيعي', 0, 1, 338, 'ar', '2018-06-23 20:03:14', NULL),
(1205, 339, 'علاج الأرجل', 0, 1, 339, 'ar', '2018-06-23 20:03:14', NULL),
(1206, 340, 'الدراسات السياسية', 0, 1, 340, 'ar', '2018-06-23 20:03:14', NULL),
(1207, 341, 'سياسة', 0, 1, 341, 'ar', '2018-06-23 20:03:14', NULL),
(1208, 342, 'دراسات السكان والتنمية', 0, 1, 342, 'ar', '2018-06-23 20:03:14', NULL),
(1209, 343, 'صحة السكان', 0, 1, 343, 'ar', '2018-06-23 20:03:14', NULL),
(1210, 344, 'علم النفس الإيجابي', 0, 1, 344, 'ar', '2018-06-23 20:03:14', NULL),
(1211, 345, 'مبادئ الإدارة', 0, 1, 345, 'ar', '2018-06-23 20:03:14', NULL),
(1212, 346, 'مبادئ التسويق', 0, 1, 346, 'ar', '2018-06-23 20:03:14', NULL),
(1213, 347, 'الاحتمالية والعمليات العشوائية', 0, 1, 347, 'ar', '2018-06-23 20:03:14', NULL),
(1214, 348, 'المنتج والتصميم الصناعي', 0, 1, 348, 'ar', '2018-06-23 20:03:14', NULL),
(1215, 349, 'إدارة الإنتاج / العمليات', 0, 1, 349, 'ar', '2018-06-23 20:03:14', NULL),
(1216, 350, 'ادارة مشروع', 0, 1, 350, 'ar', '2018-06-23 20:03:14', NULL),
(1217, 351, 'الاختبارات النفسية والقياسات', 0, 1, 351, 'ar', '2018-06-23 20:03:14', NULL),
(1218, 352, 'علم النفس', 0, 1, 352, 'ar', '2018-06-23 20:03:14', NULL),
(1219, 353, 'قانون عالمي عام', 0, 1, 353, 'ar', '2018-06-23 20:03:14', NULL),
(1220, 354, 'سياسة عامة', 0, 1, 354, 'ar', '2018-06-23 20:03:14', NULL),
(1221, 355, 'العلاقات العامة', 0, 1, 355, 'ar', '2018-06-23 20:03:14', NULL),
(1222, 356, 'المسح الكمي', 0, 1, 356, 'ar', '2018-06-23 20:03:14', NULL),
(1223, 357, 'العلاج الإشعاعي', 0, 1, 357, 'ar', '2018-06-23 20:03:14', NULL),
(1224, 358, 'راديو أخبار الإبلاغ والإنتاج', 0, 1, 358, 'ar', '2018-06-23 20:03:14', NULL),
(1225, 359, 'إنتاج راديو وتليفزيون واستوديو', 0, 1, 359, 'ar', '2018-06-23 20:03:14', NULL),
(1226, 360, 'دراسات دينية', 0, 1, 360, 'ar', '2018-06-23 20:03:14', NULL),
(1227, 361, 'التقارير والتحرير الفرعي', 0, 1, 361, 'ar', '2018-06-23 20:03:14', NULL),
(1228, 362, 'طرق البحث', 0, 1, 362, 'ar', '2018-06-23 20:03:14', NULL),
(1229, 363, 'الروبوتات', 0, 1, 363, 'ar', '2018-06-23 20:03:14', NULL),
(1230, 364, 'الروسية', 0, 1, 364, 'ar', '2018-06-23 20:03:14', NULL),
(1231, 365, 'اللغات الروسية والشرقية الأوروبية', 0, 1, 365, 'ar', '2018-06-23 20:03:14', NULL),
(1232, 366, 'ساموا الدراسات / Fa\'asamoa', 0, 1, 366, 'ar', '2018-06-23 20:03:14', NULL),
(1233, 367, 'المدرسة والمجتمع والمعلم', 0, 1, 367, 'ar', '2018-06-23 20:03:14', NULL),
(1234, 368, 'كتابة السيناريو', 0, 1, 368, 'ar', '2018-06-23 20:03:14', NULL),
(1235, 369, 'تسويق الخدمات', 0, 1, 369, 'ar', '2018-06-23 20:03:14', NULL),
(1236, 370, 'إدارة الشركات الصغيرة والمتوسطة', 0, 1, 370, 'ar', '2018-06-23 20:03:14', NULL),
(1237, 371, 'السياسة الاجتماعية', 0, 1, 371, 'ar', '2018-06-23 20:03:14', NULL),
(1238, 372, 'علم النفس الاجتماعي', 0, 1, 372, 'ar', '2018-06-23 20:03:14', NULL),
(1239, 373, 'العلوم الاجتماعية (عام)', 0, 1, 373, 'ar', '2018-06-23 20:03:14', NULL),
(1240, 374, 'الخدمة الاجتماعية', 0, 1, 374, 'ar', '2018-06-23 20:03:14', NULL),
(1241, 375, 'علم الإجتماع', 0, 1, 375, 'ar', '2018-06-23 20:03:14', NULL),
(1242, 376, 'تصميم البرمجيات', 0, 1, 376, 'ar', '2018-06-23 20:03:14', NULL);
INSERT INTO `major_subjects` (`id`, `major_subject_id`, `major_subject`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1243, 377, 'هندسة البرمجيات - أنا', 0, 1, 377, 'ar', '2018-06-23 20:03:14', NULL),
(1244, 378, 'هندسة البرمجيات', 0, 1, 378, 'ar', '2018-06-23 20:03:14', NULL),
(1245, 379, 'تحسين عملية البرمجيات', 0, 1, 379, 'ar', '2018-06-23 20:03:14', NULL),
(1246, 380, 'إدارة مشاريع البرمجيات', 0, 1, 380, 'ar', '2018-06-23 20:03:14', NULL),
(1247, 381, 'ضمان جودة البرمجيات', 0, 1, 381, 'ar', '2018-06-23 20:03:14', NULL),
(1248, 382, 'هندسة متطلبات البرمجيات', 0, 1, 382, 'ar', '2018-06-23 20:03:14', NULL),
(1249, 383, 'الأسبانية', 0, 1, 383, 'ar', '2018-06-23 20:03:14', NULL),
(1250, 384, 'علاج النطق واللغة', 0, 1, 384, 'ar', '2018-06-23 20:03:14', NULL),
(1251, 385, 'علوم الرياضة والتمرين', 0, 1, 385, 'ar', '2018-06-23 20:03:14', NULL),
(1252, 386, 'إدارة الرياضة والترفيه وإدارة', 0, 1, 386, 'ar', '2018-06-23 20:03:14', NULL),
(1253, 387, 'التدريب الرياضي', 0, 1, 387, 'ar', '2018-06-23 20:03:14', NULL),
(1254, 388, 'علم النفس الرياضي', 0, 1, 388, 'ar', '2018-06-23 20:03:14', NULL),
(1255, 389, 'العلوم الرياضية', 0, 1, 389, 'ar', '2018-06-23 20:03:14', NULL),
(1256, 390, 'الإحصاء', 0, 1, 390, 'ar', '2018-06-23 20:03:14', NULL),
(1257, 391, 'الاحصائيات والاحتمالية', 0, 1, 391, 'ar', '2018-06-23 20:03:14', NULL),
(1258, 392, 'إدارة استراتيجية', 0, 1, 392, 'ar', '2018-06-23 20:03:14', NULL),
(1259, 393, 'إدارة التسويق الاستراتيجي', 0, 1, 393, 'ar', '2018-06-23 20:03:14', NULL),
(1260, 394, 'إدارة الأمدادات', 0, 1, 394, 'ar', '2018-06-23 20:03:14', NULL),
(1261, 395, 'مسح', 0, 1, 395, 'ar', '2018-06-23 20:03:14', NULL),
(1262, 396, 'برمجة النظام', 0, 1, 396, 'ar', '2018-06-23 20:03:14', NULL),
(1263, 397, 'فرض الضرائب', 0, 1, 397, 'ar', '2018-06-23 20:03:14', NULL),
(1264, 398, 'إدارة الضرائب', 0, 1, 398, 'ar', '2018-06-23 20:03:14', NULL),
(1265, 399, 'التدريس - الطفولة المبكرة', 0, 1, 399, 'ar', '2018-06-23 20:03:14', NULL),
(1266, 400, 'تعليم - لغة الماوري', 0, 1, 400, 'ar', '2018-06-23 20:03:14', NULL),
(1267, 401, 'التدريس - التربية البدنية', 0, 1, 401, 'ar', '2018-06-23 20:03:14', NULL),
(1268, 402, 'التدريس - الابتدائي', 0, 1, 402, 'ar', '2018-06-23 20:03:14', NULL),
(1269, 403, 'تدريس - ثانوي', 0, 1, 403, 'ar', '2018-06-23 20:03:14', NULL),
(1270, 404, 'تدريس - تكنولوجيا', 0, 1, 404, 'ar', '2018-06-23 20:03:14', NULL),
(1271, 405, 'تدريس اللغة الإنجليزية', 0, 1, 405, 'ar', '2018-06-23 20:03:14', NULL),
(1272, 406, 'تدريس العلوم العامة', 0, 1, 406, 'ar', '2018-06-23 20:03:14', NULL),
(1273, 407, 'تدريس الجغرافيا', 0, 1, 407, 'ar', '2018-06-23 20:03:14', NULL),
(1274, 408, 'تدريس الدراسات الاسلامية', 0, 1, 408, 'ar', '2018-06-23 20:03:14', NULL),
(1275, 409, 'تدريس مهارات محو الأمية', 0, 1, 409, 'ar', '2018-06-23 20:03:14', NULL),
(1276, 410, 'تعليم الأوردية', 0, 1, 410, 'ar', '2018-06-23 20:03:14', NULL),
(1277, 411, 'لاهوت', 0, 1, 411, 'ar', '2018-06-23 20:03:14', NULL),
(1278, 412, 'اللاهوت والدراسات الدينية', 0, 1, 412, 'ar', '2018-06-23 20:03:14', NULL),
(1279, 413, 'نظريات الاتصال', 0, 1, 413, 'ar', '2018-06-23 20:03:14', NULL),
(1280, 414, 'نظرية وممارسة تقديم المشورة', 0, 1, 414, 'ar', '2018-06-23 20:03:14', NULL),
(1281, 415, 'نظرية الأوتوماتا', 0, 1, 415, 'ar', '2018-06-23 20:03:15', NULL),
(1282, 416, 'نظرية الحساب', 0, 1, 416, 'ar', '2018-06-23 20:03:15', NULL),
(1283, 417, 'إدارة الجودة الكلية', 0, 1, 417, 'ar', '2018-06-23 20:03:15', NULL),
(1284, 418, 'السياحة', 0, 1, 418, 'ar', '2018-06-23 20:03:15', NULL),
(1285, 419, 'تخطيط المدن و الريف و تصميم المناظر الطبيعية', 0, 1, 419, 'ar', '2018-06-23 20:03:15', NULL),
(1286, 420, 'التدريب والتطوير', 0, 1, 420, 'ar', '2018-06-23 20:03:15', NULL),
(1287, 421, 'اتجاه التلفزيون', 0, 1, 421, 'ar', '2018-06-23 20:03:15', NULL),
(1288, 422, 'أخبار التلفزيون والشؤون الحالية', 0, 1, 422, 'ar', '2018-06-23 20:03:15', NULL),
(1289, 423, 'تقارير الأخبار التلفزيونية والإنتاج', 0, 1, 423, 'ar', '2018-06-23 20:03:15', NULL),
(1290, 424, 'الأردية', 0, 1, 424, 'ar', '2018-06-23 20:03:15', NULL),
(1291, 425, 'التقييم وإدارة العقارات', 0, 1, 425, 'ar', '2018-06-23 20:03:15', NULL),
(1292, 426, 'طب بيطري', 0, 1, 426, 'ar', '2018-06-23 20:03:15', NULL),
(1293, 427, 'العلوم البيطرية والتكنولوجيا', 0, 1, 427, 'ar', '2018-06-23 20:03:15', NULL),
(1294, 428, 'برمجة مرئية', 0, 1, 428, 'ar', '2018-06-23 20:03:15', NULL),
(1295, 429, 'تصميم الويب والرقمية', 0, 1, 429, 'ar', '2018-06-23 20:03:15', NULL),
(1296, 430, 'تصميم وتطوير المواقع', 0, 1, 430, 'ar', '2018-06-23 20:03:15', NULL),
(1297, 431, 'الشبكات اللاسلكية', 0, 1, 431, 'ar', '2018-06-23 20:03:15', NULL),
(1298, 432, 'عمل الشباب', 0, 1, 432, 'ar', '2018-06-23 20:03:15', NULL),
(1299, 433, 'علم الحيوان', 0, 1, 433, 'ar', '2018-06-23 20:03:15', NULL),
(1300, 1, 'غیر معمولی نفسیات', 0, 1, 1, 'ur', '2018-06-23 20:03:54', NULL),
(1301, 2, 'اکاؤنٹنگ', 0, 1, 2, 'ur', '2018-06-23 20:03:54', NULL),
(1302, 3, 'اکاؤنٹنگ اور فنانس', 0, 1, 3, 'ur', '2018-06-23 20:03:54', NULL),
(1303, 4, 'اداکاری اور کارکردگی', 0, 1, 4, 'ur', '2018-06-23 20:03:54', NULL),
(1304, 5, 'ٹیکنالوجی اور تدریس کے ذریعے سیکھنے کے مسائل کو حل کرنے', 0, 1, 5, 'ur', '2018-06-23 20:03:54', NULL),
(1305, 6, 'انتظامی قانون اور احتساب', 0, 1, 6, 'ur', '2018-06-23 20:03:54', NULL),
(1306, 7, 'ایڈوانس کمپیوٹر آرکیٹیکچر', 0, 1, 7, 'ur', '2018-06-23 20:03:54', NULL),
(1307, 8, 'ایڈوانس ریسرچ کے طریقوں', 0, 1, 8, 'ur', '2018-06-23 20:03:54', NULL),
(1308, 9, 'اعلی درجے کی الورتورتھم تجزیہ اور ڈیزائن', 0, 1, 9, 'ur', '2018-06-23 20:03:54', NULL),
(1309, 10, 'اعلی درجے کی بایوفارفاریٹکس', 0, 1, 10, 'ur', '2018-06-23 20:03:54', NULL),
(1310, 11, 'اعلی درجے کی کمپیوٹر فن تعمیر - II', 0, 1, 11, 'ur', '2018-06-23 20:03:54', NULL),
(1311, 12, 'اعلی درجے کی کمپیوٹر نیٹ ورکس', 0, 1, 12, 'ur', '2018-06-23 20:03:54', NULL),
(1312, 13, 'اعلی درجے کی کمپیوٹنگ کے نقطہ نظر', 0, 1, 13, 'ur', '2018-06-23 20:03:54', NULL),
(1313, 14, 'اعلی درجے کی لاگت اور مینجمنٹ اکاؤنٹنگ', 0, 1, 14, 'ur', '2018-06-23 20:03:54', NULL),
(1314, 15, 'اعلی درجے کی مالی اکاؤنٹنگ', 0, 1, 15, 'ur', '2018-06-23 20:03:54', NULL),
(1315, 16, 'اعلی درجے کی آپریٹنگ سسٹم', 0, 1, 16, 'ur', '2018-06-23 20:03:54', NULL),
(1316, 17, 'ایڈورٹائزنگ', 0, 1, 17, 'ur', '2018-06-23 20:03:54', NULL),
(1317, 18, 'اشتہاری اور فروغ', 0, 1, 18, 'ur', '2018-06-23 20:03:54', NULL),
(1318, 19, 'پرنٹ اور الیکٹرانک میڈیا کے لئے ایڈورٹائزنگ', 0, 1, 19, 'ur', '2018-06-23 20:03:54', NULL),
(1319, 20, 'ایرونٹیکل اور مینوفیکچرنگ انجنیئرنگ', 0, 1, 20, 'ur', '2018-06-23 20:03:54', NULL),
(1320, 21, 'زرعی کاروبار', 0, 1, 21, 'ur', '2018-06-23 20:03:54', NULL),
(1321, 22, 'زراعت اور جنگلات', 0, 1, 22, 'ur', '2018-06-23 20:03:54', NULL),
(1322, 23, 'زراعت (عام)', 0, 1, 23, 'ur', '2018-06-23 20:03:54', NULL),
(1323, 24, 'Agronomy اور پلانٹ سائنس', 0, 1, 24, 'ur', '2018-06-23 20:03:54', NULL),
(1324, 25, 'امریکی مطالعہ', 0, 1, 25, 'ur', '2018-06-23 20:03:54', NULL),
(1325, 26, 'اناتومی اور فیزولوجی', 0, 1, 26, 'ur', '2018-06-23 20:03:54', NULL),
(1326, 27, 'جانوروں کی سائنس', 0, 1, 27, 'ur', '2018-06-23 20:03:54', NULL),
(1327, 28, 'نظریاتی سائنس', 0, 1, 28, 'ur', '2018-06-23 20:03:54', NULL),
(1328, 29, 'سائنسدان', 0, 1, 29, 'ur', '2018-06-23 20:03:54', NULL),
(1329, 30, 'ایکوایکچر اور ماہی گیری', 0, 1, 30, 'ur', '2018-06-23 20:03:54', NULL),
(1330, 31, 'آثار قدیمہ', 0, 1, 31, 'ur', '2018-06-23 20:03:54', NULL),
(1331, 32, 'فن تعمیر', 0, 1, 32, 'ur', '2018-06-23 20:03:55', NULL),
(1332, 33, 'فن اور ڈیزائن', 0, 1, 33, 'ur', '2018-06-23 20:03:55', NULL),
(1333, 34, 'فن کی تاریخ اور تھیوری', 0, 1, 34, 'ur', '2018-06-23 20:03:55', NULL),
(1334, 35, 'مصنوعی انٹیلی جنس', 0, 1, 35, 'ur', '2018-06-23 20:03:55', NULL),
(1335, 36, 'ایشیا اسٹڈیز', 0, 1, 36, 'ur', '2018-06-23 20:03:55', NULL),
(1336, 37, 'فلسفہ', 0, 1, 37, 'ur', '2018-06-23 20:03:55', NULL),
(1337, 38, 'آڈیو بصری ترمیم', 0, 1, 38, 'ur', '2018-06-23 20:03:55', NULL),
(1338, 39, 'زبانی اور زبانی علوم', 0, 1, 39, 'ur', '2018-06-23 20:03:55', NULL),
(1339, 40, 'ایوی ایشن', 0, 1, 40, 'ur', '2018-06-23 20:03:55', NULL),
(1340, 41, 'ایوی ایشن مینجمنٹ', 0, 1, 41, 'ur', '2018-06-23 20:03:55', NULL),
(1341, 42, 'بینکنگ کے قوانین اور طرز عمل', 0, 1, 42, 'ur', '2018-06-23 20:03:55', NULL),
(1342, 43, 'بائبل اسٹڈیز', 0, 1, 43, 'ur', '2018-06-23 20:03:55', NULL),
(1343, 44, 'بایو کیمسٹری', 0, 1, 44, 'ur', '2018-06-23 20:03:55', NULL),
(1344, 45, 'بایو کیمسٹری I', 0, 1, 45, 'ur', '2018-06-23 20:03:55', NULL),
(1345, 46, 'بائیوتھٹکس، بائیو سیکورٹی اور بایوفافی', 0, 1, 46, 'ur', '2018-06-23 20:03:55', NULL),
(1346, 47, 'بائیوفارمیٹکس', 0, 1, 47, 'ur', '2018-06-23 20:03:55', NULL),
(1347, 48, 'بایوفارفاریٹکسکس I (جینیوم انفارمیشنکس کے ضروریات)', 0, 1, 48, 'ur', '2018-06-23 20:03:55', NULL),
(1348, 49, 'حیاتیاتی سائنس', 0, 1, 49, 'ur', '2018-06-23 20:03:55', NULL),
(1349, 50, 'حیاتیات (عام)', 0, 1, 50, 'ur', '2018-06-23 20:03:55', NULL),
(1350, 51, 'بائیو میڈیکل انجینیرنگ', 0, 1, 51, 'ur', '2018-06-23 20:03:55', NULL),
(1351, 52, 'بایڈیکلیکل سائنس (نہیں کہیں اور درجہ بندی)', 0, 1, 52, 'ur', '2018-06-23 20:03:55', NULL),
(1352, 53, 'جیو ٹیکنالوجی', 0, 1, 53, 'ur', '2018-06-23 20:03:55', NULL),
(1353, 54, 'بوٹنی', 0, 1, 54, 'ur', '2018-06-23 20:03:55', NULL),
(1354, 55, 'برانڈ مینجمنٹ', 0, 1, 55, 'ur', '2018-06-23 20:03:55', NULL),
(1355, 56, 'عمارت', 0, 1, 56, 'ur', '2018-06-23 20:03:55', NULL),
(1356, 57, 'کاروبار اور لیبر قانون', 0, 1, 57, 'ur', '2018-06-23 20:03:55', NULL),
(1357, 58, 'بزنس اینڈ مینجمنٹ سٹڈیز', 0, 1, 58, 'ur', '2018-06-23 20:03:55', NULL),
(1358, 59, 'بزنس اور تکنیکی انگریزی لکھنا', 0, 1, 59, 'ur', '2018-06-23 20:03:55', NULL),
(1359, 60, 'بزنس مواصلات', 0, 1, 60, 'ur', '2018-06-23 20:03:55', NULL),
(1360, 61, 'کاروباری اقتصادیات', 0, 1, 61, 'ur', '2018-06-23 20:03:55', NULL),
(1361, 62, 'کاروباری اخلاقیات', 0, 1, 62, 'ur', '2018-06-23 20:03:55', NULL),
(1362, 63, 'بزنس فنانس', 0, 1, 63, 'ur', '2018-06-23 20:03:55', NULL),
(1363, 64, 'بزنس ریاضی اور اعداد و شمار', 0, 1, 64, 'ur', '2018-06-23 20:03:55', NULL),
(1364, 65, 'کیلکولیشن اور تجزیاتی جیومیٹرری', 0, 1, 65, 'ur', '2018-06-23 20:03:55', NULL),
(1365, 66, 'کیلکولیشن II', 0, 1, 66, 'ur', '2018-06-23 20:03:55', NULL),
(1366, 67, 'کیمرے کی مبادیات، اصولوں اور طریقوں', 0, 1, 67, 'ur', '2018-06-23 20:03:55', NULL),
(1367, 68, 'سیل حیاتیات', 0, 1, 68, 'ur', '2018-06-23 20:03:55', NULL),
(1368, 69, 'کیٹک مطالعہ', 0, 1, 69, 'ur', '2018-06-23 20:03:55', NULL),
(1369, 70, 'انتظامیہ کی تبدیلی', 0, 1, 70, 'ur', '2018-06-23 20:03:55', NULL),
(1370, 71, 'کیمیائی اور پروسیسنگ انجینئرنگ', 0, 1, 71, 'ur', '2018-06-23 20:03:55', NULL),
(1371, 72, 'کیمیکل انجینئرنگ', 0, 1, 72, 'ur', '2018-06-23 20:03:55', NULL),
(1372, 73, 'کیمسٹری', 0, 1, 73, 'ur', '2018-06-23 20:03:55', NULL),
(1373, 74, 'بچے کی ترقی', 0, 1, 74, 'ur', '2018-06-23 20:03:55', NULL),
(1374, 75, 'چینی', 0, 1, 75, 'ur', '2018-06-23 20:03:55', NULL),
(1375, 76, 'چینی مطالعہ', 0, 1, 76, 'ur', '2018-06-23 20:03:55', NULL),
(1376, 77, 'عیسائی خیالات اور تاریخ', 0, 1, 77, 'ur', '2018-06-23 20:03:55', NULL),
(1377, 78, 'سرکٹ تھیوری', 0, 1, 78, 'ur', '2018-06-23 20:03:55', NULL),
(1378, 79, 'سول انجینرنگ کی', 0, 1, 79, 'ur', '2018-06-23 20:03:55', NULL),
(1379, 80, 'کلاسیکی مطالعہ', 0, 1, 80, 'ur', '2018-06-23 20:03:55', NULL),
(1380, 81, 'کلاسیکی اور قدیم تاریخ', 0, 1, 81, 'ur', '2018-06-23 20:03:55', NULL),
(1381, 82, 'کلاس روم کی تشخیص', 0, 1, 82, 'ur', '2018-06-23 20:03:55', NULL),
(1382, 83, 'کلاس روم مینجمنٹ', 0, 1, 83, 'ur', '2018-06-23 20:03:55', NULL),
(1383, 84, 'کلینکل نفسیات', 0, 1, 84, 'ur', '2018-06-23 20:03:55', NULL),
(1384, 85, 'کپڑے اور ٹیکسٹائل', 0, 1, 85, 'ur', '2018-06-23 20:03:55', NULL),
(1385, 86, 'سنجیدہ نفسیات', 0, 1, 86, 'ur', '2018-06-23 20:03:55', NULL),
(1386, 87, 'تجارتی قانون', 0, 1, 87, 'ur', '2018-06-23 20:03:55', NULL),
(1387, 88, 'مواصلات اور میڈیا اسٹڈیز', 0, 1, 88, 'ur', '2018-06-23 20:03:55', NULL),
(1388, 89, 'مواصلات اور پیشہ ورانہ تحریری', 0, 1, 89, 'ur', '2018-06-23 20:03:55', NULL),
(1389, 90, 'اظہار خیال سے متعلقہ مہارتیں', 0, 1, 90, 'ur', '2018-06-23 20:03:55', NULL),
(1390, 91, 'کمپائلر تعمیراتی', 0, 1, 91, 'ur', '2018-06-23 20:03:55', NULL),
(1391, 92, 'ضمنی دوا', 0, 1, 92, 'ur', '2018-06-23 20:03:55', NULL),
(1392, 93, 'کمپیوٹر فن تعمیر اور اسمبلی زبان پروگرامنگ', 0, 1, 93, 'ur', '2018-06-23 20:03:55', NULL),
(1393, 94, 'کمپیوٹر انجینئرنگ', 0, 1, 94, 'ur', '2018-06-23 20:03:55', NULL),
(1394, 95, 'کمپیوٹر گرافکس', 0, 1, 95, 'ur', '2018-06-23 20:03:55', NULL),
(1395, 96, 'کمپیوٹر نیٹ ورک', 0, 1, 96, 'ur', '2018-06-23 20:03:55', NULL),
(1396, 97, 'کمپیوٹر سائنس', 0, 1, 97, 'ur', '2018-06-23 20:03:55', NULL),
(1397, 98, 'تنازعات کے انتظام', 0, 1, 98, 'ur', '2018-06-23 20:03:55', NULL),
(1398, 99, 'تنازعات کے حل', 0, 1, 99, 'ur', '2018-06-23 20:03:55', NULL),
(1399, 100, 'تعمیراتی اور پراجیکٹ مینجمنٹ', 0, 1, 100, 'ur', '2018-06-23 20:03:55', NULL),
(1400, 101, 'صارفین بینکنگ', 0, 1, 101, 'ur', '2018-06-23 20:03:55', NULL),
(1401, 102, 'صارفین کے رویے', 0, 1, 102, 'ur', '2018-06-23 20:03:55', NULL),
(1402, 103, 'صارفین کی نفسیات', 0, 1, 103, 'ur', '2018-06-23 20:03:55', NULL),
(1403, 104, 'کمپنیوں کے مالی امور', 0, 1, 104, 'ur', '2018-06-23 20:03:55', NULL),
(1404, 105, 'کارپوریٹ قانون', 0, 1, 105, 'ur', '2018-06-23 20:03:55', NULL),
(1405, 106, 'لاگت اور مینجمنٹ اکاؤنٹنگ', 0, 1, 106, 'ur', '2018-06-23 20:03:55', NULL),
(1406, 107, 'مشاورت', 0, 1, 107, 'ur', '2018-06-23 20:03:55', NULL),
(1407, 108, 'تخلیقی تحریری', 0, 1, 108, 'ur', '2018-06-23 20:03:55', NULL),
(1408, 109, 'کریڈٹ اور خطرے کے انتظام', 0, 1, 109, 'ur', '2018-06-23 20:03:55', NULL),
(1409, 110, 'جرمانہ', 0, 1, 110, 'ur', '2018-06-23 20:03:55', NULL),
(1410, 111, 'جرمانہ اور جسٹس', 0, 1, 111, 'ur', '2018-06-23 20:03:55', NULL),
(1411, 112, 'بحران کا انتظام', 0, 1, 112, 'ur', '2018-06-23 20:03:55', NULL),
(1412, 113, 'تنقیدی سوچ اور عکاسی کی مشق', 0, 1, 113, 'ur', '2018-06-23 20:03:55', NULL),
(1413, 114, 'ثقافتی ادویات', 0, 1, 114, 'ur', '2018-06-23 20:03:55', NULL),
(1414, 115, 'ثقافتی مطالعہ', 0, 1, 115, 'ur', '2018-06-23 20:03:55', NULL),
(1415, 116, 'نصاب کی ترقی', 0, 1, 116, 'ur', '2018-06-23 20:03:55', NULL),
(1416, 117, 'صارف رابطہ کاری انتظام', 0, 1, 117, 'ur', '2018-06-23 20:03:55', NULL),
(1417, 118, 'رقص', 0, 1, 118, 'ur', '2018-06-23 20:03:55', NULL),
(1418, 119, 'ڈیٹا مواصلات', 0, 1, 119, 'ur', '2018-06-23 20:03:55', NULL),
(1419, 120, 'ڈیٹا ساخت', 0, 1, 120, 'ur', '2018-06-23 20:03:55', NULL),
(1420, 121, 'ڈیٹا سٹوریج', 0, 1, 121, 'ur', '2018-06-23 20:03:55', NULL),
(1421, 122, 'ڈیٹا بیس مینجمنٹ سسٹم', 0, 1, 122, 'ur', '2018-06-23 20:03:55', NULL),
(1422, 123, 'ڈیٹا بیس ماڈلنگ اور ڈیزائن', 0, 1, 123, 'ur', '2018-06-23 20:03:55', NULL),
(1423, 124, 'دفاع اسٹڈیز', 0, 1, 124, 'ur', '2018-06-23 20:03:55', NULL),
(1424, 125, 'دانتوں کی ٹیکنالوجی', 0, 1, 125, 'ur', '2018-06-23 20:03:55', NULL),
(1425, 126, 'دندان سازی', 0, 1, 126, 'ur', '2018-06-23 20:03:55', NULL),
(1426, 127, 'ڈیزائن (جنرل)', 0, 1, 127, 'ur', '2018-06-23 20:03:55', NULL),
(1427, 128, 'ترقیاتی معیشت', 0, 1, 128, 'ur', '2018-06-23 20:03:55', NULL),
(1428, 129, 'متنازعہ مساوات', 0, 1, 129, 'ur', '2018-06-23 20:03:55', NULL),
(1429, 130, 'ڈیجیٹل منطق ڈیزائن', 0, 1, 130, 'ur', '2018-06-23 20:03:55', NULL),
(1430, 131, 'مضر ریاضی', 0, 1, 131, 'ur', '2018-06-23 20:03:55', NULL),
(1431, 132, 'تقسیم شدہ ڈی بی ایم', 0, 1, 132, 'ur', '2018-06-23 20:03:55', NULL),
(1432, 133, 'ڈرامہ / تھیٹر سٹڈیز', 0, 1, 133, 'ur', '2018-06-23 20:03:55', NULL),
(1433, 134, 'ڈرامہ، رقص اور سینماٹکس', 0, 1, 134, 'ur', '2018-06-23 20:03:55', NULL),
(1434, 135, 'زمین سائنس (عام)', 0, 1, 135, 'ur', '2018-06-23 20:03:55', NULL),
(1435, 136, 'مشرقی اور جنوبی ایشیائی مطالعہ', 0, 1, 136, 'ur', '2018-06-23 20:03:55', NULL),
(1436, 137, 'ایکولوجی', 0, 1, 137, 'ur', '2018-06-23 20:03:55', NULL),
(1437, 138, 'ای کامرس', 0, 1, 138, 'ur', '2018-06-23 20:03:55', NULL),
(1438, 139, 'معیشت', 0, 1, 139, 'ur', '2018-06-23 20:03:55', NULL),
(1439, 140, 'تعلیم', 0, 1, 140, 'ur', '2018-06-23 20:03:55', NULL),
(1440, 141, 'پاکستان میں تعلیم کی ترقی', 0, 1, 141, 'ur', '2018-06-23 20:03:55', NULL),
(1441, 142, 'تعلیم کے مطالعہ', 0, 1, 142, 'ur', '2018-06-23 20:03:55', NULL),
(1442, 143, 'تعلیمی گورننس پالیسی اور عمل', 0, 1, 143, 'ur', '2018-06-23 20:03:55', NULL),
(1443, 144, 'تعلیمی قیادت اور انتظام', 0, 1, 144, 'ur', '2018-06-23 20:03:55', NULL),
(1444, 145, 'تعلیمی نفسیات', 0, 1, 145, 'ur', '2018-06-23 20:03:55', NULL),
(1445, 146, 'الیکٹریکل اور الیکٹرانک انجینئرنگ', 0, 1, 146, 'ur', '2018-06-23 20:03:55', NULL),
(1446, 147, 'الیکٹریکل انجینئرنگ', 0, 1, 147, 'ur', '2018-06-23 20:03:55', NULL),
(1447, 148, 'الیکٹرانکس', 0, 1, 148, 'ur', '2018-06-23 20:03:55', NULL),
(1448, 149, 'ابتدائی انگریزی', 0, 1, 149, 'ur', '2018-06-23 20:03:55', NULL),
(1449, 150, 'ابتدائی ریاضی', 0, 1, 150, 'ur', '2018-06-23 20:03:55', NULL),
(1450, 151, 'انرجی مطالعہ اور انتظام', 0, 1, 151, 'ur', '2018-06-23 20:03:55', NULL),
(1451, 152, 'انجینئرنگ سائنس', 0, 1, 152, 'ur', '2018-06-23 20:03:55', NULL),
(1452, 153, 'انگریزی', 0, 1, 153, 'ur', '2018-06-23 20:03:55', NULL),
(1453, 154, 'دوسری زبان کے طور پر انگریزی', 0, 1, 154, 'ur', '2018-06-23 20:03:55', NULL),
(1454, 155, 'انگریزی کی تفصیل', 0, 1, 155, 'ur', '2018-06-23 20:03:55', NULL),
(1455, 156, 'کاروبار کو فروغ', 0, 1, 156, 'ur', '2018-06-23 20:03:55', NULL),
(1456, 157, 'ماحولیاتی اور قدرتی وسائل انجینئرنگ', 0, 1, 157, 'ur', '2018-06-23 20:03:55', NULL),
(1457, 158, 'ماحولیاتی صحت', 0, 1, 158, 'ur', '2018-06-23 20:03:55', NULL),
(1458, 159, 'ماحولیاتی نفسیات', 0, 1, 159, 'ur', '2018-06-23 20:03:55', NULL),
(1459, 160, 'ماحولیاتی سائنس', 0, 1, 160, 'ur', '2018-06-23 20:03:55', NULL),
(1460, 161, 'ماحولیاتی مطالعہ', 0, 1, 161, 'ur', '2018-06-23 20:03:55', NULL),
(1461, 162, 'جینیات کی ضروریات', 0, 1, 162, 'ur', '2018-06-23 20:03:55', NULL),
(1462, 163, 'اخلاقیات', 0, 1, 163, 'ur', '2018-06-23 20:03:55', NULL),
(1463, 164, 'اخلاقیات (غیر مسلموں کے لئے)', 0, 1, 164, 'ur', '2018-06-23 20:03:55', NULL),
(1464, 165, 'یورپی زبانوں اور ثقافتوں', 0, 1, 165, 'ur', '2018-06-23 20:03:55', NULL),
(1465, 166, 'یورپی مطالعہ', 0, 1, 166, 'ur', '2018-06-23 20:03:55', NULL),
(1466, 167, 'فیشن', 0, 1, 167, 'ur', '2018-06-23 20:03:55', NULL),
(1467, 168, 'فیشن کا انداز', 0, 1, 168, 'ur', '2018-06-23 20:03:55', NULL),
(1468, 169, 'خصوصیت اور کالم لکھنا', 0, 1, 169, 'ur', '2018-06-23 20:03:55', NULL),
(1469, 170, 'فلم اور میڈیا سٹڈیز', 0, 1, 170, 'ur', '2018-06-23 20:03:55', NULL),
(1470, 171, 'فلم بنانا', 0, 1, 171, 'ur', '2018-06-23 20:03:55', NULL),
(1471, 172, 'فلم سازی', 0, 1, 172, 'ur', '2018-06-23 20:03:55', NULL),
(1472, 173, 'فنانس', 0, 1, 173, 'ur', '2018-06-23 20:03:55', NULL),
(1473, 174, 'مالی اکاؤنٹنگ', 0, 1, 174, 'ur', '2018-06-23 20:03:55', NULL),
(1474, 175, 'مالیاتی اکاؤنٹنگ II', 0, 1, 175, 'ur', '2018-06-23 20:03:55', NULL),
(1475, 176, 'مالی انتظام', 0, 1, 176, 'ur', '2018-06-23 20:03:55', NULL),
(1476, 177, 'مالی بیان تجزیہ', 0, 1, 177, 'ur', '2018-06-23 20:03:55', NULL),
(1477, 178, 'فنون لطیفہ', 0, 1, 178, 'ur', '2018-06-23 20:03:55', NULL),
(1478, 179, 'فوڈ سائنس', 0, 1, 179, 'ur', '2018-06-23 20:03:55', NULL),
(1479, 180, 'فارسنک تجزیاتی سائنس', 0, 1, 180, 'ur', '2018-06-23 20:03:55', NULL),
(1480, 181, 'فارنک نفسیات', 0, 1, 181, 'ur', '2018-06-23 20:03:55', NULL),
(1481, 182, 'فارسنک سائنس', 0, 1, 182, 'ur', '2018-06-23 20:03:55', NULL),
(1482, 183, 'جنگلات', 0, 1, 183, 'ur', '2018-06-23 20:03:55', NULL),
(1483, 184, 'سافٹ ویئر انجینئرنگ کے لئے رسمی طریقوں', 0, 1, 184, 'ur', '2018-06-23 20:03:55', NULL),
(1484, 185, 'تعلیم کی بنیادیں', 0, 1, 185, 'ur', '2018-06-23 20:03:55', NULL),
(1485, 186, 'فرانسیسی', 0, 1, 186, 'ur', '2018-06-23 20:03:55', NULL),
(1486, 187, 'الگورتھم کی بنیادیں', 0, 1, 187, 'ur', '2018-06-23 20:03:55', NULL),
(1487, 188, 'آڈیٹنگ کی بنیادیں', 0, 1, 188, 'ur', '2018-06-23 20:03:55', NULL),
(1488, 189, 'پبلک تعلقات کی بنیادیں', 0, 1, 189, 'ur', '2018-06-23 20:03:55', NULL),
(1489, 190, 'نفسیات میں صنفی مسائل', 0, 1, 190, 'ur', '2018-06-23 20:03:55', NULL),
(1490, 191, 'صنفی مطالعہ', 0, 1, 191, 'ur', '2018-06-23 20:03:55', NULL),
(1491, 192, 'جین ہیراپن اور جینیاتی انجینئرنگ', 0, 1, 192, 'ur', '2018-06-23 20:03:55', NULL),
(1492, 193, 'جنرل انجنیئرنگ', 0, 1, 193, 'ur', '2018-06-23 20:03:55', NULL),
(1493, 194, 'جنرل ریاضی', 0, 1, 194, 'ur', '2018-06-23 20:03:55', NULL),
(1494, 195, 'عمومی تدریس', 0, 1, 195, 'ur', '2018-06-23 20:03:55', NULL),
(1495, 196, 'جنرل سائنس', 0, 1, 196, 'ur', '2018-06-23 20:03:55', NULL),
(1496, 197, 'جینیات', 0, 1, 197, 'ur', '2018-06-23 20:03:55', NULL),
(1497, 198, 'جغرافیہ', 0, 1, 198, 'ur', '2018-06-23 20:03:55', NULL),
(1498, 199, 'جغرافیائی اور ماحولیاتی سائنس', 0, 1, 199, 'ur', '2018-06-23 20:03:55', NULL),
(1499, 200, 'جیولوجی', 0, 1, 200, 'ur', '2018-06-23 20:03:55', NULL),
(1500, 201, 'جرمن', 0, 1, 201, 'ur', '2018-06-23 20:03:55', NULL),
(1501, 202, 'میڈیا کا گلوبلائزیشن', 0, 1, 202, 'ur', '2018-06-23 20:03:55', NULL),
(1502, 203, 'گرافک ڈیزائن', 0, 1, 203, 'ur', '2018-06-23 20:03:55', NULL),
(1503, 204, 'یونانی', 0, 1, 204, 'ur', '2018-06-23 20:03:55', NULL),
(1504, 205, 'صحت کی ترقی', 0, 1, 205, 'ur', '2018-06-23 20:03:55', NULL),
(1505, 206, 'صحت نفسیات', 0, 1, 206, 'ur', '2018-06-23 20:03:55', NULL),
(1506, 207, 'ہسٹری', 0, 1, 207, 'ur', '2018-06-23 20:03:55', NULL),
(1507, 208, 'تاریخ اور نفسیات کے نظام', 0, 1, 208, 'ur', '2018-06-23 20:03:55', NULL),
(1508, 209, 'آرٹ، فن تعمیر اور ڈیزائن کی تاریخ', 0, 1, 209, 'ur', '2018-06-23 20:03:55', NULL),
(1509, 210, 'مہمان نوازی کا انتظام', 0, 1, 210, 'ur', '2018-06-23 20:03:55', NULL),
(1510, 211, 'مہم جوئی، تفریح، تفریح ​​اور سیاحت', 0, 1, 211, 'ur', '2018-06-23 20:03:55', NULL),
(1511, 212, 'انسانی کمپیوٹر تعامل', 0, 1, 212, 'ur', '2018-06-23 20:03:55', NULL),
(1512, 213, 'انسانی ترقی کے مطالعہ', 0, 1, 213, 'ur', '2018-06-23 20:03:55', NULL),
(1513, 214, 'انسانی غذائیت', 0, 1, 214, 'ur', '2018-06-23 20:03:55', NULL),
(1514, 215, 'انسانی تعلقات', 0, 1, 215, 'ur', '2018-06-23 20:03:55', NULL),
(1515, 216, 'انسانی وسائل کی ترقی', 0, 1, 216, 'ur', '2018-06-23 20:03:55', NULL),
(1516, 217, 'انسانی وسائل کے انتظام', 0, 1, 217, 'ur', '2018-06-23 20:03:55', NULL),
(1517, 218, 'ابربیان زبانیں / ہسپانوی مطالعہ', 0, 1, 218, 'ur', '2018-06-23 20:03:55', NULL),
(1518, 219, 'معلومات کی بازیابی کی تکنیک', 0, 1, 219, 'ur', '2018-06-23 20:03:55', NULL),
(1519, 220, 'معلومات سائنس', 0, 1, 220, 'ur', '2018-06-23 20:03:55', NULL),
(1520, 221, 'انفارمیشن سسٹم', 0, 1, 221, 'ur', '2018-06-23 20:03:55', NULL),
(1521, 222, 'بین الاقوامی کاروبار', 0, 1, 222, 'ur', '2018-06-23 20:03:55', NULL),
(1522, 223, 'بین الاقوامی مواصلات', 0, 1, 223, 'ur', '2018-06-23 20:03:55', NULL),
(1523, 224, 'بین الاقوامی مارکیٹنگ', 0, 1, 224, 'ur', '2018-06-23 20:03:55', NULL),
(1524, 225, 'بین الاقوامی تعلقات', 0, 1, 225, 'ur', '2018-06-23 20:03:55', NULL),
(1525, 226, 'بین الاقوامی مطالعہ', 0, 1, 226, 'ur', '2018-06-23 20:03:55', NULL),
(1526, 227, 'تفسیر اور ترجمہ', 0, 1, 227, 'ur', '2018-06-23 20:03:55', NULL),
(1527, 228, 'نشریات کا تعارف', 0, 1, 228, 'ur', '2018-06-23 20:03:55', NULL),
(1528, 229, 'کاروبار سے تعارف', 0, 1, 229, 'ur', '2018-06-23 20:03:55', NULL),
(1529, 230, 'کمپیوٹنگ کا تعارف', 0, 1, 230, 'ur', '2018-06-23 20:03:55', NULL),
(1530, 231, 'رہنمائی اور مشاورت کا تعارف', 0, 1, 231, 'ur', '2018-06-23 20:03:55', NULL),
(1531, 232, 'ماس مواصلات کا تعارف', 0, 1, 232, 'ur', '2018-06-23 20:03:55', NULL),
(1532, 233, 'نیٹ ورک ڈیزائن اور تجزیہ کا تعارف', 0, 1, 233, 'ur', '2018-06-23 20:03:55', NULL),
(1533, 234, 'پروگرامنگ کا تعارف', 0, 1, 234, 'ur', '2018-06-23 20:03:55', NULL),
(1534, 235, 'نفسیات کا تعارف', 0, 1, 235, 'ur', '2018-06-23 20:03:55', NULL),
(1535, 236, 'پبلک ایڈمنسٹریشن کا تعارف', 0, 1, 236, 'ur', '2018-06-23 20:03:55', NULL),
(1536, 237, 'سماجیولوجی کا تعارف', 0, 1, 237, 'ur', '2018-06-23 20:03:55', NULL),
(1537, 238, 'ویب سروس کی ترقی کا تعارف', 0, 1, 238, 'ur', '2018-06-23 20:03:55', NULL),
(1538, 239, 'سرمایہ کاری تجزیہ اور پورٹ فولیو مینجمنٹ', 0, 1, 239, 'ur', '2018-06-23 20:03:55', NULL),
(1539, 240, 'اسلامی مطالعہ', 0, 1, 240, 'ur', '2018-06-23 20:03:55', NULL),
(1540, 241, 'اطالوی', 0, 1, 241, 'ur', '2018-06-23 20:03:55', NULL),
(1541, 242, 'جاپانی', 0, 1, 242, 'ur', '2018-06-23 20:03:55', NULL),
(1542, 243, 'جاپانی مطالعہ', 0, 1, 243, 'ur', '2018-06-23 20:03:55', NULL),
(1543, 244, 'صحافت', 0, 1, 244, 'ur', '2018-06-23 20:03:55', NULL),
(1544, 245, 'صحافیوں کی تحریری', 0, 1, 245, 'ur', '2018-06-23 20:03:55', NULL),
(1545, 246, 'علم مینجمنٹ', 0, 1, 246, 'ur', '2018-06-23 20:03:55', NULL),
(1546, 247, 'کوریائی', 0, 1, 247, 'ur', '2018-06-23 20:03:55', NULL),
(1547, 248, 'لیبر اور صنعتی تعلقات', 0, 1, 248, 'ur', '2018-06-23 20:03:55', NULL),
(1548, 249, 'زمین اور پراپرٹی مینجمنٹ', 0, 1, 249, 'ur', '2018-06-23 20:03:55', NULL),
(1549, 250, 'زمین کا استعمال منصوبہ بندی اور انتظام', 0, 1, 250, 'ur', '2018-06-23 20:03:55', NULL),
(1550, 251, 'لاطینی', 0, 1, 251, 'ur', '2018-06-23 20:03:55', NULL),
(1551, 252, 'قانون', 0, 1, 252, 'ur', '2018-06-23 20:03:55', NULL),
(1552, 253, 'قیادت اور ٹیم مینجمنٹ', 0, 1, 253, 'ur', '2018-06-23 20:03:55', NULL),
(1553, 254, 'سیکھنے کے نظریات', 0, 1, 254, 'ur', '2018-06-23 20:03:55', NULL),
(1554, 255, 'لائبریریریپ اور انفارمیشن مینجمنٹ', 0, 1, 255, 'ur', '2018-06-23 20:03:55', NULL),
(1555, 256, 'ٹی وی کی پیداوار کے لئے لائٹنگ', 0, 1, 256, 'ur', '2018-06-23 20:03:55', NULL),
(1556, 257, 'لینر الجبرا', 0, 1, 257, 'ur', '2018-06-23 20:03:55', NULL),
(1557, 258, 'لسانیات', 0, 1, 258, 'ur', '2018-06-23 20:03:55', NULL),
(1558, 259, 'میکرو اقتصادیات', 0, 1, 259, 'ur', '2018-06-23 20:03:55', NULL),
(1559, 260, 'مینجمنٹ', 0, 1, 260, 'ur', '2018-06-23 20:03:55', NULL),
(1560, 261, 'مالیاتی اداروں کے انتظام', 0, 1, 261, 'ur', '2018-06-23 20:03:55', NULL),
(1561, 262, 'انتظامی مہارت', 0, 1, 262, 'ur', '2018-06-23 20:03:55', NULL),
(1562, 263, 'انتظاماتی اکاؤنٹنگ', 0, 1, 263, 'ur', '2018-06-23 20:03:55', NULL),
(1563, 264, 'انتظاماتی معاشیات', 0, 1, 264, 'ur', '2018-06-23 20:03:55', NULL),
(1564, 265, 'موری ترقی', 0, 1, 265, 'ur', '2018-06-23 20:03:55', NULL),
(1565, 266, 'موری صحت', 0, 1, 266, 'ur', '2018-06-23 20:03:55', NULL),
(1566, 267, 'موری زبان / تی ر مولا', 0, 1, 267, 'ur', '2018-06-23 20:03:55', NULL),
(1567, 268, 'موری میڈیا سٹڈیز', 0, 1, 268, 'ur', '2018-06-23 20:03:55', NULL),
(1568, 269, 'موروری مطالعہ', 0, 1, 269, 'ur', '2018-06-23 20:03:55', NULL),
(1569, 270, 'ماوری بصری آرٹس', 0, 1, 270, 'ur', '2018-06-23 20:03:55', NULL),
(1570, 271, 'میرین حیاتیات', 0, 1, 271, 'ur', '2018-06-23 20:03:55', NULL),
(1571, 272, 'میرین سائنس', 0, 1, 272, 'ur', '2018-06-23 20:03:55', NULL),
(1572, 273, 'سمندری انجینئرنگ', 0, 1, 273, 'ur', '2018-06-23 20:03:55', NULL),
(1573, 274, 'مارکیٹنگ', 0, 1, 274, 'ur', '2018-06-23 20:03:55', NULL),
(1574, 275, 'مارکیٹنگ مینجمنٹ', 0, 1, 275, 'ur', '2018-06-23 20:03:55', NULL),
(1575, 276, 'مارکیٹنگ ریسرچ', 0, 1, 276, 'ur', '2018-06-23 20:03:55', NULL),
(1576, 277, 'ماس مواصلات قانون اور اخلاقیات', 0, 1, 277, 'ur', '2018-06-23 20:03:55', NULL),
(1577, 278, 'پاکستان میں ماس میڈیا', 0, 1, 278, 'ur', '2018-06-23 20:03:55', NULL),
(1578, 279, 'مواد کی ٹیکنالوجی', 0, 1, 279, 'ur', '2018-06-23 20:03:55', NULL),
(1579, 280, 'ریاضی طریقوں', 0, 1, 280, 'ur', '2018-06-23 20:03:55', NULL),
(1580, 281, 'ریاضی', 0, 1, 281, 'ur', '2018-06-23 20:03:55', NULL),
(1581, 282, 'میکینکل انجینئرنگ', 0, 1, 282, 'ur', '2018-06-23 20:03:55', NULL),
(1582, 283, 'Mechatronics', 0, 1, 283, 'ur', '2018-06-23 20:03:55', NULL),
(1583, 284, 'میڈیکل لیبارٹری سائنس', 0, 1, 284, 'ur', '2018-06-23 20:03:55', NULL),
(1584, 285, 'طبی ٹیکنالوجی', 0, 1, 285, 'ur', '2018-06-23 20:03:55', NULL),
(1585, 286, 'طب', 0, 1, 286, 'ur', '2018-06-23 20:03:55', NULL),
(1586, 287, 'مائکرو بولوجیولوجی', 0, 1, 287, 'ur', '2018-06-23 20:03:55', NULL),
(1587, 288, 'مائیکرو اقتصادیات', 0, 1, 288, 'ur', '2018-06-23 20:03:55', NULL),
(1588, 289, 'مشرق وسطی اور افریقی مطالعہ', 0, 1, 289, 'ur', '2018-06-23 20:03:55', NULL),
(1589, 290, 'قابلیت', 0, 1, 290, 'ur', '2018-06-23 20:03:55', NULL),
(1590, 291, 'موبائل اور پرسکون کمپیوٹنگ', 0, 1, 291, 'ur', '2018-06-23 20:03:55', NULL),
(1591, 292, 'جدید جیو ٹیکنالوجی: اصول اور ایپلی کیشنز', 0, 1, 292, 'ur', '2018-06-23 20:03:55', NULL),
(1592, 293, 'جدید پروگرامنگ زبانیں', 0, 1, 293, 'ur', '2018-06-23 20:03:55', NULL),
(1593, 294, 'مالیکیولی حیاتیات', 0, 1, 294, 'ur', '2018-06-23 20:03:55', NULL),
(1594, 295, 'منی اور بینکنگ', 0, 1, 295, 'ur', '2018-06-23 20:03:55', NULL),
(1595, 296, 'کثیر قابل حساب حساب', 0, 1, 296, 'ur', '2018-06-23 20:03:55', NULL),
(1596, 297, 'موسیقی', 0, 1, 297, 'ur', '2018-06-23 20:03:55', NULL),
(1597, 298, 'موسیقی کی ساخت', 0, 1, 298, 'ur', '2018-06-23 20:03:55', NULL),
(1598, 299, 'موسیقی کی کارکردگی', 0, 1, 299, 'ur', '2018-06-23 20:03:55', NULL),
(1599, 300, 'موسیقی کی پیداوار', 0, 1, 300, 'ur', '2018-06-23 20:03:55', NULL),
(1600, 301, 'موسیقی مطالعہ', 0, 1, 301, 'ur', '2018-06-23 20:03:55', NULL),
(1601, 302, 'نانوسیسی', 0, 1, 302, 'ur', '2018-06-23 20:03:55', NULL),
(1602, 303, 'نیٹ ورک کی کارکردگی تشخیص', 0, 1, 303, 'ur', '2018-06-23 20:03:55', NULL),
(1603, 304, 'نیٹ ورک سیکورٹی', 0, 1, 304, 'ur', '2018-06-23 20:03:55', NULL),
(1604, 305, 'طرز عمل کے نیوروولوجی اڈوں', 0, 1, 305, 'ur', '2018-06-23 20:03:55', NULL),
(1605, 306, 'نیورسیسی', 0, 1, 306, 'ur', '2018-06-23 20:03:55', NULL),
(1606, 307, 'نیوزی لینڈ سائنسی زبان', 0, 1, 307, 'ur', '2018-06-23 20:03:55', NULL),
(1607, 308, 'تعداد میں تجزیہ', 0, 1, 308, 'ur', '2018-06-23 20:03:55', NULL),
(1608, 309, 'نرسنگ', 0, 1, 309, 'ur', '2018-06-23 20:03:55', NULL),
(1609, 310, 'آبجیکٹ مہیا شدہ ڈی بی ایم ایس', 0, 1, 310, 'ur', '2018-06-23 20:03:55', NULL),
(1610, 311, 'آبجیکٹ اورینٹڈ پروگرامنگ', 0, 1, 311, 'ur', '2018-06-23 20:03:55', NULL),
(1611, 312, 'پیشہ ورانہ تھراپی', 0, 1, 312, 'ur', '2018-06-23 20:03:55', NULL),
(1612, 313, 'پیشہ ورانہ تھراپی اور بحالی', 0, 1, 313, 'ur', '2018-06-23 20:03:55', NULL),
(1613, 314, 'آپریٹنگ سسٹم', 0, 1, 314, 'ur', '2018-06-23 20:03:55', NULL),
(1614, 315, 'آپریشنز ریسرچ', 0, 1, 315, 'ur', '2018-06-23 20:03:55', NULL),
(1615, 316, 'آپٹومیٹرری', 0, 1, 316, 'ur', '2018-06-23 20:03:55', NULL),
(1616, 317, 'آپٹومیٹرری، اوتھتھولوجی اور آرتھوٹکسکس', 0, 1, 317, 'ur', '2018-06-23 20:03:55', NULL),
(1617, 318, 'زبانی صحت', 0, 1, 318, 'ur', '2018-06-23 20:03:55', NULL),
(1618, 319, 'تنظیم تھیوری اور ڈیزائن', 0, 1, 319, 'ur', '2018-06-23 20:03:55', NULL),
(1619, 320, 'تنظیمی طرز عمل', 0, 1, 320, 'ur', '2018-06-23 20:03:55', NULL),
(1620, 321, 'تنظیمی ترقی', 0, 1, 321, 'ur', '2018-06-23 20:03:55', NULL),
(1621, 322, 'تنظیمی نفسیات', 0, 1, 322, 'ur', '2018-06-23 20:03:55', NULL),
(1622, 323, 'پیسفک جزیرہ مطالعہ', 0, 1, 323, 'ur', '2018-06-23 20:03:55', NULL),
(1623, 324, 'پاکستان اسٹڈیز', 0, 1, 324, 'ur', '2018-06-23 20:03:55', NULL),
(1624, 325, 'پیرامیڈین', 0, 1, 325, 'ur', '2018-06-23 20:03:55', NULL),
(1625, 326, 'Pastoral مطالعہ', 0, 1, 326, 'ur', '2018-06-23 20:03:55', NULL),
(1626, 327, 'کارکردگی کا انتظام', 0, 1, 327, 'ur', '2018-06-23 20:03:55', NULL),
(1627, 328, 'شخصیت نفسیات', 0, 1, 328, 'ur', '2018-06-23 20:03:55', NULL),
(1628, 329, 'فارمیولوجی', 0, 1, 329, 'ur', '2018-06-23 20:03:55', NULL),
(1629, 330, 'فارماسولوجی اور فارمیسی', 0, 1, 330, 'ur', '2018-06-23 20:03:55', NULL),
(1630, 331, 'فارمیسی', 0, 1, 331, 'ur', '2018-06-23 20:03:55', NULL),
(1631, 332, 'فلسفہ', 0, 1, 332, 'ur', '2018-06-23 20:03:55', NULL),
(1632, 333, 'تعلیم فلسفہ', 0, 1, 333, 'ur', '2018-06-23 20:03:55', NULL),
(1633, 334, 'فوٹوگرافی', 0, 1, 334, 'ur', '2018-06-23 20:03:55', NULL),
(1634, 335, 'طبیعیات', 0, 1, 335, 'ur', '2018-06-23 20:03:55', NULL),
(1635, 336, 'طبیعیات اور انتشار', 0, 1, 336, 'ur', '2018-06-23 20:03:55', NULL),
(1636, 337, 'فزیوولوجی', 0, 1, 337, 'ur', '2018-06-23 20:03:55', NULL),
(1637, 338, 'فزیو تھراپی', 0, 1, 338, 'ur', '2018-06-23 20:03:55', NULL),
(1638, 339, 'پوڈیٹریری', 0, 1, 339, 'ur', '2018-06-23 20:03:55', NULL),
(1639, 340, 'سیاسی مطالعہ', 0, 1, 340, 'ur', '2018-06-23 20:03:55', NULL),
(1640, 341, 'سیاست', 0, 1, 341, 'ur', '2018-06-23 20:03:55', NULL),
(1641, 342, 'آبادی اور ترقی کے مطالعہ', 0, 1, 342, 'ur', '2018-06-23 20:03:55', NULL),
(1642, 343, 'آبادی صحت', 0, 1, 343, 'ur', '2018-06-23 20:03:55', NULL),
(1643, 344, 'مثبت نفسیات', 0, 1, 344, 'ur', '2018-06-23 20:03:55', NULL),
(1644, 345, 'مینجمنٹ کے اصول', 0, 1, 345, 'ur', '2018-06-23 20:03:55', NULL),
(1645, 346, 'مارکیٹنگ کے اصول', 0, 1, 346, 'ur', '2018-06-23 20:03:55', NULL),
(1646, 347, 'امکانات اور سٹوچکچکاسی عمل', 0, 1, 347, 'ur', '2018-06-23 20:03:55', NULL),
(1647, 348, 'مصنوعات اور صنعتی ڈیزائن', 0, 1, 348, 'ur', '2018-06-23 20:03:55', NULL),
(1648, 349, 'پیداوار / آپریشنز مینجمنٹ', 0, 1, 349, 'ur', '2018-06-23 20:03:55', NULL),
(1649, 350, 'کام کی ترتیب لگانا', 0, 1, 350, 'ur', '2018-06-23 20:03:55', NULL),
(1650, 351, 'نفسیاتی امتحان اور پیمائش', 0, 1, 351, 'ur', '2018-06-23 20:03:55', NULL),
(1651, 352, 'نفسیات', 0, 1, 352, 'ur', '2018-06-23 20:03:55', NULL),
(1652, 353, 'عوامی بین الاقوامی قانون', 0, 1, 353, 'ur', '2018-06-23 20:03:55', NULL),
(1653, 354, 'پبلک پالیسی', 0, 1, 354, 'ur', '2018-06-23 20:03:55', NULL),
(1654, 355, 'تعلقات عامہ', 0, 1, 355, 'ur', '2018-06-23 20:03:55', NULL),
(1655, 356, 'مقدار کی سروے', 0, 1, 356, 'ur', '2018-06-23 20:03:55', NULL),
(1656, 357, 'تابکاری تھراپی', 0, 1, 357, 'ur', '2018-06-23 20:03:55', NULL),
(1657, 358, 'ریڈیو نیوز رپورٹنگ اور پروڈکشن', 0, 1, 358, 'ur', '2018-06-23 20:03:55', NULL),
(1658, 359, 'ریڈیو، ٹی وی اور سٹوڈیو پروڈکشن', 0, 1, 359, 'ur', '2018-06-23 20:03:55', NULL),
(1659, 360, 'مذہبی مطالعہ', 0, 1, 360, 'ur', '2018-06-23 20:03:55', NULL),
(1660, 361, 'رپورٹنگ اور ذیلی ترمیم', 0, 1, 361, 'ur', '2018-06-23 20:03:55', NULL),
(1661, 362, 'تحقیقی طریق کار', 0, 1, 362, 'ur', '2018-06-23 20:03:55', NULL),
(1662, 363, 'روبوٹکس', 0, 1, 363, 'ur', '2018-06-23 20:03:55', NULL),
(1663, 364, 'روسی', 0, 1, 364, 'ur', '2018-06-23 20:03:55', NULL),
(1664, 365, 'روسی اور مشرقی یورپی زبانیں', 0, 1, 365, 'ur', '2018-06-23 20:03:55', NULL),
(1665, 366, 'سامونائی مطالعہ / فاسامامو', 0, 1, 366, 'ur', '2018-06-23 20:03:55', NULL),
(1666, 367, 'سکول، کمیونٹی اور ٹیچر', 0, 1, 367, 'ur', '2018-06-23 20:03:55', NULL),
(1667, 368, 'سکرپٹ لکھنا', 0, 1, 368, 'ur', '2018-06-23 20:03:55', NULL),
(1668, 369, 'خدمات مارکیٹنگ', 0, 1, 369, 'ur', '2018-06-23 20:03:55', NULL),
(1669, 370, 'ایس ایم ای مینجمنٹ', 0, 1, 370, 'ur', '2018-06-23 20:03:55', NULL),
(1670, 371, 'سوشل پالیسی', 0, 1, 371, 'ur', '2018-06-23 20:03:55', NULL),
(1671, 372, 'سماجی نفسیات', 0, 1, 372, 'ur', '2018-06-23 20:03:55', NULL),
(1672, 373, 'سوشل سائنس (جنرل)', 0, 1, 373, 'ur', '2018-06-23 20:03:56', NULL),
(1673, 374, 'سماجی کام', 0, 1, 374, 'ur', '2018-06-23 20:03:56', NULL),
(1674, 375, 'سوشیالوجی', 0, 1, 375, 'ur', '2018-06-23 20:03:56', NULL),
(1675, 376, 'سافٹ ویئر ڈیزائن', 0, 1, 376, 'ur', '2018-06-23 20:03:56', NULL),
(1676, 377, 'سافٹ ویئر انجینئرنگ - I', 0, 1, 377, 'ur', '2018-06-23 20:03:56', NULL),
(1677, 378, 'سافٹ ویئر انجینئرنگ II', 0, 1, 378, 'ur', '2018-06-23 20:03:56', NULL),
(1678, 379, 'سافٹ ویئر کے عمل کو بہتر بنانے', 0, 1, 379, 'ur', '2018-06-23 20:03:56', NULL),
(1679, 380, 'سافٹ ویئر پراجیکٹ مینجمنٹ', 0, 1, 380, 'ur', '2018-06-23 20:03:56', NULL),
(1680, 381, 'سافٹ ویئر کی کوالٹی اشورینس', 0, 1, 381, 'ur', '2018-06-23 20:03:56', NULL),
(1681, 382, 'سافٹ ویئر کی ضرورت انجینئرنگ', 0, 1, 382, 'ur', '2018-06-23 20:03:56', NULL),
(1682, 383, 'ہسپانوی', 0, 1, 383, 'ur', '2018-06-23 20:03:56', NULL),
(1683, 384, 'تقریر اور زبان تھراپی', 0, 1, 384, 'ur', '2018-06-23 20:03:56', NULL),
(1684, 385, 'کھیل اور مشق سائنس', 0, 1, 385, 'ur', '2018-06-23 20:03:56', NULL),
(1685, 386, 'کھیل اور تفریح ​​اسٹڈیز اور مینجمنٹ', 0, 1, 386, 'ur', '2018-06-23 20:03:56', NULL),
(1686, 387, 'کھیل کوچنگ', 0, 1, 387, 'ur', '2018-06-23 20:03:56', NULL),
(1687, 388, 'کھیل نفسیات', 0, 1, 388, 'ur', '2018-06-23 20:03:56', NULL),
(1688, 389, 'کھیل سائنس', 0, 1, 389, 'ur', '2018-06-23 20:03:56', NULL),
(1689, 390, 'اعداد و شمار', 0, 1, 390, 'ur', '2018-06-23 20:03:56', NULL),
(1690, 391, 'اعداد و شمار اور امکانات', 0, 1, 391, 'ur', '2018-06-23 20:03:56', NULL),
(1691, 392, 'انتظامی حکمت عملی', 0, 1, 392, 'ur', '2018-06-23 20:03:56', NULL),
(1692, 393, 'اسٹریٹجک مارکیٹنگ مینجمنٹ', 0, 1, 393, 'ur', '2018-06-23 20:03:56', NULL),
(1693, 394, 'فراہمی کا سلسلہ انتظام', 0, 1, 394, 'ur', '2018-06-23 20:03:56', NULL),
(1694, 395, 'سروے کرنا', 0, 1, 395, 'ur', '2018-06-23 20:03:56', NULL),
(1695, 396, 'سسٹم پروگرامنگ', 0, 1, 396, 'ur', '2018-06-23 20:03:56', NULL),
(1696, 397, 'ٹیکس', 0, 1, 397, 'ur', '2018-06-23 20:03:56', NULL),
(1697, 398, 'ٹیکس مینجمنٹ', 0, 1, 398, 'ur', '2018-06-23 20:03:56', NULL),
(1698, 399, 'تعلیم - ابتدائی بچپن', 0, 1, 399, 'ur', '2018-06-23 20:03:56', NULL),
(1699, 400, 'درس - موری زبان', 0, 1, 400, 'ur', '2018-06-23 20:03:56', NULL),
(1700, 401, 'تدریس - جسمانی تعلیم', 0, 1, 401, 'ur', '2018-06-23 20:03:56', NULL),
(1701, 402, 'تعلیم - پرائمری', 0, 1, 402, 'ur', '2018-06-23 20:03:56', NULL),
(1702, 403, 'درس - سیکنڈری', 0, 1, 403, 'ur', '2018-06-23 20:03:56', NULL),
(1703, 404, 'تعلیم - ٹیکنالوجی', 0, 1, 404, 'ur', '2018-06-23 20:03:56', NULL),
(1704, 405, 'انگریزی کی تعلیم', 0, 1, 405, 'ur', '2018-06-23 20:03:56', NULL),
(1705, 406, 'جنرل سائنس کی تعلیم', 0, 1, 406, 'ur', '2018-06-23 20:03:56', NULL),
(1706, 407, 'جغرافیہ کی تعلیم', 0, 1, 407, 'ur', '2018-06-23 20:03:56', NULL),
(1707, 408, 'اسلامی مطالعہ کی تعلیم', 0, 1, 408, 'ur', '2018-06-23 20:03:56', NULL),
(1708, 409, 'سوادتی کی مہارت کی تعلیم', 0, 1, 409, 'ur', '2018-06-23 20:03:56', NULL),
(1709, 410, 'اردو کی تعلیم', 0, 1, 410, 'ur', '2018-06-23 20:03:56', NULL),
(1710, 411, 'نظریہ', 0, 1, 411, 'ur', '2018-06-23 20:03:56', NULL),
(1711, 412, 'نظریہ اور مذہبی مطالعہ', 0, 1, 412, 'ur', '2018-06-23 20:03:56', NULL),
(1712, 413, 'مواصلات کے نظریات', 0, 1, 413, 'ur', '2018-06-23 20:03:56', NULL),
(1713, 414, 'نظریات کا نظریہ اور عمل', 0, 1, 414, 'ur', '2018-06-23 20:03:56', NULL),
(1714, 415, 'آٹوٹا کے تھیوری', 0, 1, 415, 'ur', '2018-06-23 20:03:56', NULL),
(1715, 416, 'سنگت کی تھیوری', 0, 1, 416, 'ur', '2018-06-23 20:03:56', NULL),
(1716, 417, 'مکمل معیاری انتظامیہ', 0, 1, 417, 'ur', '2018-06-23 20:03:56', NULL),
(1717, 418, 'سیاحت', 0, 1, 418, 'ur', '2018-06-23 20:03:56', NULL),
(1718, 419, 'ٹاؤن اور ملک کی منصوبہ بندی اور زمین کی تزئین کی ڈیزائن', 0, 1, 419, 'ur', '2018-06-23 20:03:56', NULL),
(1719, 420, 'تربیت اور ترقی', 0, 1, 420, 'ur', '2018-06-23 20:03:56', NULL),
(1720, 421, 'ٹی وی کی سمت', 0, 1, 421, 'ur', '2018-06-23 20:03:56', NULL),
(1721, 422, 'ٹی وی نیوز اور موجودہ معاملات', 0, 1, 422, 'ur', '2018-06-23 20:03:56', NULL),
(1722, 423, 'ٹی وی نیوز رپورٹنگ اور پروڈکشن', 0, 1, 423, 'ur', '2018-06-23 20:03:56', NULL),
(1723, 424, 'اردو', 0, 1, 424, 'ur', '2018-06-23 20:03:56', NULL),
(1724, 425, 'تشخیص اور پراپرٹی مینجمنٹ', 0, 1, 425, 'ur', '2018-06-23 20:03:56', NULL),
(1725, 426, 'مویشیوں کے لئے ادویات', 0, 1, 426, 'ur', '2018-06-23 20:03:56', NULL),
(1726, 427, 'ویٹرنری سائنس اور ٹیکنالوجی', 0, 1, 427, 'ur', '2018-06-23 20:03:56', NULL),
(1727, 428, 'بصری پروگرامنگ', 0, 1, 428, 'ur', '2018-06-23 20:03:56', NULL),
(1728, 429, 'ویب اور ڈیجیٹل ڈیزائن', 0, 1, 429, 'ur', '2018-06-23 20:03:56', NULL),
(1729, 430, 'ویب ڈیزائن اور ترقی', 0, 1, 430, 'ur', '2018-06-23 20:03:56', NULL),
(1730, 431, 'وائرلیس نیٹ ورکس', 0, 1, 431, 'ur', '2018-06-23 20:03:56', NULL),
(1731, 432, 'نوجوانوں کا کام', 0, 1, 432, 'ur', '2018-06-23 20:03:56', NULL),
(1732, 433, 'زولوجی', 0, 1, 433, 'ur', '2018-06-23 20:03:56', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `manage_job_skills`
--

CREATE TABLE `manage_job_skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `job_id` int(11) DEFAULT 0,
  `job_skill_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `manage_job_skills`
--

INSERT INTO `manage_job_skills` (`id`, `job_id`, `job_skill_id`, `created_at`, `updated_at`) VALUES
(292, 20, 15, '2018-09-17 22:25:50', '2018-09-17 22:25:50'),
(293, 20, 16, '2018-09-17 22:25:50', '2018-09-17 22:25:50'),
(294, 20, 18, '2018-09-17 22:25:50', '2018-09-17 22:25:50'),
(308, 21, 2, '2018-09-18 21:23:47', '2018-09-18 21:23:47'),
(309, 21, 6, '2018-09-18 21:23:47', '2018-09-18 21:23:47'),
(310, 21, 8, '2018-09-18 21:23:47', '2018-09-18 21:23:47'),
(311, 22, 6, '2018-09-18 21:24:56', '2018-09-18 21:24:56'),
(312, 22, 8, '2018-09-18 21:24:56', '2018-09-18 21:24:56'),
(313, 22, 10, '2018-09-18 21:24:56', '2018-09-18 21:24:56'),
(314, 22, 11, '2018-09-18 21:24:56', '2018-09-18 21:24:56'),
(315, 6, 15, '2018-09-18 21:25:22', '2018-09-18 21:25:22'),
(316, 6, 16, '2018-09-18 21:25:22', '2018-09-18 21:25:22'),
(317, 6, 19, '2018-09-18 21:25:22', '2018-09-18 21:25:22'),
(318, 4, 5, '2018-09-18 21:26:48', '2018-09-18 21:26:48'),
(319, 4, 12, '2018-09-18 21:26:48', '2018-09-18 21:26:48'),
(320, 4, 17, '2018-09-18 21:26:48', '2018-09-18 21:26:48'),
(321, 5, 6, '2018-09-18 21:26:57', '2018-09-18 21:26:57'),
(322, 5, 8, '2018-09-18 21:26:57', '2018-09-18 21:26:57'),
(323, 5, 15, '2018-09-18 21:26:57', '2018-09-18 21:26:57'),
(324, 5, 16, '2018-09-18 21:26:57', '2018-09-18 21:26:57'),
(325, 23, 6, '2018-09-18 21:29:51', '2018-09-18 21:29:51'),
(326, 23, 8, '2018-09-18 21:29:51', '2018-09-18 21:29:51'),
(327, 23, 10, '2018-09-18 21:29:51', '2018-09-18 21:29:51'),
(328, 23, 19, '2018-09-18 21:29:51', '2018-09-18 21:29:51'),
(329, 24, 10, '2018-09-18 21:34:35', '2018-09-18 21:34:35'),
(330, 24, 11, '2018-09-18 21:34:35', '2018-09-18 21:34:35'),
(331, 24, 15, '2018-09-18 21:34:35', '2018-09-18 21:34:35'),
(332, 24, 16, '2018-09-18 21:34:35', '2018-09-18 21:34:35'),
(340, 26, 1, '2018-09-18 21:47:13', '2018-09-18 21:47:13'),
(341, 26, 2, '2018-09-18 21:47:13', '2018-09-18 21:47:13'),
(342, 26, 6, '2018-09-18 21:47:13', '2018-09-18 21:47:13'),
(343, 26, 8, '2018-09-18 21:47:13', '2018-09-18 21:47:13'),
(344, 25, 5, '2018-09-18 21:47:43', '2018-09-18 21:47:43'),
(345, 25, 7, '2018-09-18 21:47:43', '2018-09-18 21:47:43'),
(346, 25, 18, '2018-09-18 21:47:43', '2018-09-18 21:47:43'),
(347, 27, 5, '2018-09-18 21:51:39', '2018-09-18 21:51:39'),
(348, 27, 7, '2018-09-18 21:51:39', '2018-09-18 21:51:39'),
(349, 27, 12, '2018-09-18 21:51:39', '2018-09-18 21:51:39'),
(350, 28, 4, '2018-09-18 21:54:18', '2018-09-18 21:54:18'),
(351, 28, 6, '2018-09-18 21:54:18', '2018-09-18 21:54:18'),
(352, 28, 8, '2018-09-18 21:54:18', '2018-09-18 21:54:18'),
(353, 28, 12, '2018-09-18 21:54:18', '2018-09-18 21:54:18'),
(369, 31, 2, '2019-10-20 15:42:56', '2019-10-20 15:42:56'),
(370, 32, 2, '2019-10-20 15:43:52', '2019-10-20 15:43:52'),
(373, 33, 2, '2019-10-23 14:24:59', '2019-10-23 14:24:59'),
(374, 33, 4, '2019-10-23 14:24:59', '2019-10-23 14:24:59'),
(375, 34, 3, '2020-10-20 08:20:53', '2020-10-20 08:20:53'),
(376, 2, 6, '2021-02-21 10:30:46', '2021-02-21 10:30:46'),
(377, 2, 8, '2021-02-21 10:30:46', '2021-02-21 10:30:46'),
(378, 2, 10, '2021-02-21 10:30:46', '2021-02-21 10:30:46'),
(379, 35, 8, '2023-05-20 14:49:57', '2023-05-20 14:49:57'),
(380, 36, 2, '2023-05-20 17:12:58', '2023-05-20 17:12:58'),
(381, 37, 2, '2023-05-20 17:18:29', '2023-05-20 17:18:29');

-- --------------------------------------------------------

--
-- Table structure for table `marital_statuses`
--

CREATE TABLE `marital_statuses` (
  `id` int(10) UNSIGNED NOT NULL,
  `marital_status_id` int(11) DEFAULT 0,
  `marital_status` varchar(40) NOT NULL,
  `jp_marital_status` varchar(55) DEFAULT NULL,
  `is_default` int(11) DEFAULT 0,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 9999,
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `marital_statuses`
--

INSERT INTO `marital_statuses` (`id`, `marital_status_id`, `marital_status`, `jp_marital_status`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 0, 'Single', '独身', 0, 1, 9999, 'en', '2023-06-08 03:04:39', NULL),
(2, 0, 'Married', '既婚', 0, 1, 9999, 'en', '2023-06-08 03:04:39', NULL),
(3, 0, 'Divorced', '離婚', 0, 1, 9999, 'en', '2023-06-08 03:04:39', NULL),
(4, 0, 'Widowed', '未亡人/未亡人', 0, 1, 9999, 'en', '2023-06-08 03:04:39', NULL),
(5, 0, 'Separated', '別居', 0, 1, 9999, 'en', '2023-06-08 03:04:39', NULL),
(6, 0, 'Engaged', '婚約中', 0, 1, 9999, 'en', '2023-06-08 03:04:39', NULL),
(7, 0, 'In a relationship', '交際中', 0, 1, 9999, 'en', '2023-06-08 03:04:39', NULL),
(8, 0, 'Domestic partnership', '事実婚', 0, 1, 9999, 'en', '2023-06-08 03:04:39', NULL),
(9, 0, 'Civil union', '市民結合', 0, 1, 9999, 'en', '2023-06-08 03:04:39', NULL),
(10, 0, 'Other', 'その他', 0, 1, 9999, 'en', '2023-06-08 03:04:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `merits`
--

CREATE TABLE `merits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `merits`
--

INSERT INTO `merits` (`id`, `title`, `image`, `created_at`, `updated_at`) VALUES
(1, 'ビズリーチを使うメリット', '1680592654.jpg', '2023-04-04 01:17:34', '2023-04-06 22:39:36');

-- --------------------------------------------------------

--
-- Table structure for table `merit_details`
--

CREATE TABLE `merit_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `merit_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `details` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `merit_details`
--

INSERT INTO `merit_details` (`id`, `merit_id`, `date`, `details`, `created_at`, `updated_at`) VALUES
(1, 2, '2023-04-07', 'asdfasd sadfasdfsdfsdf', NULL, NULL),
(2, 1, '2022-02-01', '独自の審査を通過した人材のみが 登録しており、 即戦力人材と出会えます', NULL, NULL),
(3, 1, '2022-02-02', '自ら探して直接スカウトできるので、 書類選考や面談でのミスマッチを減らせます', NULL, NULL),
(4, 1, '2023-04-03', '候補者と直接やりとりできるので 素早く採用活動を進められます', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2018_03_26_195605_create_categories_table', 1),
(4, '2020_10_21_015802_create_payu_transactions_table', 2),
(5, '2023_04_03_223529_create_success_jobs_table', 3),
(6, '2023_04_04_065011_create_merits_table', 4),
(7, '2023_04_04_065922_create_merit_details_table', 4),
(8, '2023_04_06_044549_create_case_studies_table', 5),
(9, '2023_04_06_163032_create_about_us_table', 6),
(10, '2023_04_07_040422_create_about_detail_table', 7),
(11, '2023_04_07_053507_create_growths_table', 8),
(12, '2023_04_30_175805_create_job_services_table', 9),
(13, '2023_05_01_051114_create_job_categories_table', 10),
(14, '2023_05_01_051247_create_job_sub_categories_table', 10),
(15, '2023_05_01_051805_create_job_industries_table', 10),
(16, '2023_05_01_052532_create_job_places_table', 10),
(17, '2023_05_02_025351_create_featureds_table', 11),
(18, '2023_05_02_035559_create_faqcategories_table', 12),
(19, '2023_05_03_135342_add_google_id_column', 13),
(20, '2023_05_03_140534_add_facebook_id_column', 14),
(21, '2023_05_03_151943_add_yahoo_app_id_to_site_settings_table', 15);

-- --------------------------------------------------------

--
-- Table structure for table `months`
--

CREATE TABLE `months` (
  `id` int(11) NOT NULL,
  `eng_title` varchar(55) NOT NULL,
  `jp_title` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `months`
--

INSERT INTO `months` (`id`, `eng_title`, `jp_title`) VALUES
(1, 'January', '一月'),
(2, 'February', '二月'),
(3, 'March', '三月'),
(4, 'April', '四月'),
(5, 'May', '五月'),
(6, 'June', '六月'),
(7, 'July', '七月'),
(8, 'August', '八月'),
(9, 'September', '九月'),
(10, 'October', '十月'),
(11, 'November', '十一月'),
(12, 'December', '十二月');

-- --------------------------------------------------------

--
-- Table structure for table `ownership_types`
--

CREATE TABLE `ownership_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `ownership_type_id` int(11) DEFAULT 0,
  `ownership_type` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `ownership_types`
--

INSERT INTO `ownership_types` (`id`, `ownership_type_id`, `ownership_type`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Sole Proprietorship', 1, 1, 1, 'en', '2018-07-11 23:10:21', NULL),
(2, 2, 'Public', 1, 1, 2, 'en', '2018-07-11 23:10:54', NULL),
(3, 3, 'Private', 1, 1, 3, 'en', '2018-07-11 23:11:13', NULL),
(4, 4, 'Government', 1, 1, 4, 'en', '2018-07-11 23:11:32', NULL),
(5, 5, 'NGO', 1, 1, 5, 'en', '2018-07-11 23:12:45', NULL),
(6, 1, 'Propietario único', 0, 1, 1, 'es', '2018-07-11 23:13:16', NULL),
(7, 2, 'Público', 0, 1, 2, 'es', '2018-07-11 23:13:16', NULL),
(8, 3, 'Privado', 0, 1, 3, 'es', '2018-07-11 23:13:16', NULL),
(9, 4, 'Gobierno', 0, 1, 4, 'es', '2018-07-11 23:13:16', NULL),
(10, 5, 'Organización no gubernamental', 0, 1, 5, 'es', '2018-07-11 23:13:16', NULL),
(11, 1, 'ملكية فردية', 0, 1, 1, 'ar', '2018-07-11 23:14:10', NULL),
(12, 2, 'عامة', 0, 1, 2, 'ar', '2018-07-11 23:14:10', NULL),
(13, 3, 'نشر', 0, 1, 3, 'ar', '2018-07-11 23:14:10', NULL),
(14, 4, 'الحكومي', 0, 1, 4, 'ar', '2018-07-11 23:14:10', NULL),
(15, 5, 'منظمة غير حكومية', 0, 1, 5, 'ar', '2018-07-11 23:14:10', NULL),
(16, 1, 'تنہا ملکیت', 0, 1, 1, 'ur', '2018-07-11 23:14:14', NULL),
(17, 2, 'عوام', 0, 1, 2, 'ur', '2018-07-11 23:14:14', NULL),
(18, 3, 'نجی', 0, 1, 3, 'ur', '2018-07-11 23:14:14', NULL),
(19, 4, 'حکومت', 0, 1, 4, 'ur', '2018-07-11 23:14:14', NULL),
(20, 5, 'غیر سرکاری تنظیم', 0, 1, 5, 'ur', '2018-07-11 23:14:14', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(10) UNSIGNED NOT NULL,
  `package_title` varchar(150) DEFAULT NULL,
  `package_price` float(7,2) DEFAULT 0.00,
  `package_num_days` int(11) DEFAULT 0,
  `package_num_listings` int(11) DEFAULT 0,
  `package_for` enum('job_seeker','employer','cv_search') DEFAULT 'job_seeker',
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_title`, `package_price`, `package_num_days`, `package_num_listings`, `package_for`, `created_at`, `updated_at`) VALUES
(3, 'Basic', 9.99, 30, 10, 'employer', '2018-08-20 15:18:59', '2018-08-20 15:18:59'),
(4, 'Premium', 19.99, 90, 30, 'employer', '2018-08-20 15:19:32', '2018-08-20 15:19:32'),
(5, 'Basic', 9.99, 30, 10, 'job_seeker', '2018-10-19 00:44:15', '2018-10-19 00:44:15'),
(6, 'Premium', 19.99, 90, 30, 'job_seeker', '2018-10-19 00:44:53', '2018-10-19 00:44:53'),
(7, 'Free package', 0.00, 10, 5, 'employer', '2019-04-24 02:17:43', '2019-04-24 02:17:43'),
(8, 'Test CVS', 30.00, 30, 30, 'cv_search', '2021-02-22 13:35:27', '2021-02-25 11:46:44');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) NOT NULL,
  `token` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `payu_transactions`
--

CREATE TABLE `payu_transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `paid_for_id` int(10) UNSIGNED DEFAULT NULL,
  `paid_for_type` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) NOT NULL,
  `gateway` text NOT NULL,
  `body` text NOT NULL,
  `destination` varchar(255) NOT NULL,
  `hash` text NOT NULL,
  `response` text DEFAULT NULL,
  `status` enum('pending','failed','successful','invalid') NOT NULL DEFAULT 'pending',
  `verified_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payu_transactions`
--

INSERT INTO `payu_transactions` (`id`, `paid_for_id`, `paid_for_type`, `transaction_id`, `gateway`, `body`, `destination`, `hash`, `response`, `status`, `verified_at`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'PEW0CPeZiF', 'O:25:\"Tzsk\\Payu\\Gateway\\PayuBiz\":5:{s:3:\"key\";s:8:\"Aj9QVKLL\";s:4:\"salt\";s:10:\"qknGnvahLO\";s:4:\"base\";s:7:\"payu.in\";s:14:\"\0*\0processUrls\";a:2:{s:4:\"test\";s:24:\"https://test.%s/_payment\";s:4:\"live\";s:26:\"https://secure.%s/_payment\";}s:4:\"mode\";s:4:\"test\";}', 'O:30:\"Tzsk\\Payu\\Concerns\\Transaction\":6:{s:13:\"transactionId\";s:10:\"PEW0CPeZiF\";s:6:\"amount\";d:9.99;s:11:\"productInfo\";s:5:\"Basic\";s:5:\"payee\";O:27:\"Tzsk\\Payu\\Concerns\\Customer\":10:{s:9:\"firstName\";s:42:\"Multimedia Design(employer@jobsportal.com)\";s:8:\"lastName\";N;s:5:\"email\";s:23:\"employer@jobsportal.com\";s:5:\"phone\";N;s:10:\"addressOne\";N;s:10:\"addressTwo\";N;s:4:\"city\";N;s:5:\"state\";N;s:7:\"country\";N;s:7:\"zipCode\";N;}s:6:\"params\";O:29:\"Tzsk\\Payu\\Concerns\\Attributes\":10:{s:4:\"udf1\";s:1:\"3\";s:4:\"udf2\";N;s:4:\"udf3\";N;s:4:\"udf4\";N;s:4:\"udf5\";N;s:4:\"udf6\";N;s:4:\"udf7\";N;s:4:\"udf8\";N;s:4:\"udf9\";N;s:5:\"udf10\";N;}s:5:\"model\";N;}', 'http://sharjeelanjum.com/demos/jobnew/payu-order-package-status?type=new', 'd71e4c6d38c4f45610511ae4c976a21586fd28c44941ecbe97ba24268373274f9f7b3f053b77bd71daf94f3d1958b263280f2196497ed4b358b53d9d19b89fe1', NULL, 'pending', NULL, NULL, '2020-10-24 19:56:36', '2020-10-24 19:56:36'),
(2, NULL, NULL, '7cWPLbEzO4', 'O:25:\"Tzsk\\Payu\\Gateway\\PayuBiz\":5:{s:3:\"key\";s:8:\"Aj9QVKLL\";s:4:\"salt\";s:10:\"qknGnvahLO\";s:4:\"base\";s:7:\"payu.in\";s:14:\"\0*\0processUrls\";a:2:{s:4:\"test\";s:24:\"https://test.%s/_payment\";s:4:\"live\";s:26:\"https://secure.%s/_payment\";}s:4:\"mode\";s:4:\"test\";}', 'O:30:\"Tzsk\\Payu\\Concerns\\Transaction\":6:{s:13:\"transactionId\";s:10:\"7cWPLbEzO4\";s:6:\"amount\";d:9.99;s:11:\"productInfo\";s:5:\"Basic\";s:5:\"payee\";O:27:\"Tzsk\\Payu\\Concerns\\Customer\":10:{s:9:\"firstName\";s:42:\"Multimedia Design(employer@jobsportal.com)\";s:8:\"lastName\";N;s:5:\"email\";s:23:\"employer@jobsportal.com\";s:5:\"phone\";N;s:10:\"addressOne\";N;s:10:\"addressTwo\";N;s:4:\"city\";N;s:5:\"state\";N;s:7:\"country\";N;s:7:\"zipCode\";N;}s:6:\"params\";O:29:\"Tzsk\\Payu\\Concerns\\Attributes\":10:{s:4:\"udf1\";s:1:\"3\";s:4:\"udf2\";N;s:4:\"udf3\";N;s:4:\"udf4\";N;s:4:\"udf5\";N;s:4:\"udf6\";N;s:4:\"udf7\";N;s:4:\"udf8\";N;s:4:\"udf9\";N;s:5:\"udf10\";N;}s:5:\"model\";N;}', 'http://sharjeelanjum.com/demos/jobnew/payu-order-package-status?type=new', 'c68682bf5541cb901dcd5450ddd8bdeffc3eef46ebbb1e978163b6735f78f764ffd7996c4392819c06d55173aa9ee245f66edca1f6b5baa51b25563e6817e3a9', NULL, 'pending', NULL, NULL, '2020-10-24 19:56:45', '2020-10-24 19:56:45'),
(3, NULL, NULL, 'ZqQnIBLqhz', 'O:25:\"Tzsk\\Payu\\Gateway\\PayuBiz\":5:{s:3:\"key\";s:8:\"Aj9QVKLL\";s:4:\"salt\";s:10:\"qknGnvahLO\";s:4:\"base\";s:7:\"payu.in\";s:14:\"\0*\0processUrls\";a:2:{s:4:\"test\";s:24:\"https://test.%s/_payment\";s:4:\"live\";s:26:\"https://secure.%s/_payment\";}s:4:\"mode\";s:4:\"test\";}', 'O:30:\"Tzsk\\Payu\\Concerns\\Transaction\":6:{s:13:\"transactionId\";s:10:\"ZqQnIBLqhz\";s:6:\"amount\";d:9.99;s:11:\"productInfo\";s:5:\"Basic\";s:5:\"payee\";O:27:\"Tzsk\\Payu\\Concerns\\Customer\":10:{s:9:\"firstName\";s:42:\"Multimedia Design(employer@jobsportal.com)\";s:8:\"lastName\";N;s:5:\"email\";s:23:\"employer@jobsportal.com\";s:5:\"phone\";N;s:10:\"addressOne\";N;s:10:\"addressTwo\";N;s:4:\"city\";N;s:5:\"state\";N;s:7:\"country\";N;s:7:\"zipCode\";N;}s:6:\"params\";O:29:\"Tzsk\\Payu\\Concerns\\Attributes\":10:{s:4:\"udf1\";s:1:\"3\";s:4:\"udf2\";N;s:4:\"udf3\";N;s:4:\"udf4\";N;s:4:\"udf5\";N;s:4:\"udf6\";N;s:4:\"udf7\";N;s:4:\"udf8\";N;s:4:\"udf9\";N;s:5:\"udf10\";N;}s:5:\"model\";N;}', 'http://www.sharjeelanjum.com/demos/jobsportal-update/payu-order-package-status?type=new', '705289e0a4e5b3fcc0fa6a7ca03735ecb006edca507b39c13650d5d86c219bfc0653d05c11d3ec2c8d1ba7dd34912bfbb3ea660717fe1653e813b19d756f453d', NULL, 'pending', NULL, NULL, '2021-02-20 23:24:12', '2021-02-20 23:24:12'),
(4, NULL, NULL, 'uYlogpI6Ha', 'O:25:\"Tzsk\\Payu\\Gateway\\PayuBiz\":5:{s:3:\"key\";s:8:\"Aj9QVKLL\";s:4:\"salt\";s:10:\"qknGnvahLO\";s:4:\"base\";s:7:\"payu.in\";s:14:\"\0*\0processUrls\";a:2:{s:4:\"test\";s:24:\"https://test.%s/_payment\";s:4:\"live\";s:26:\"https://secure.%s/_payment\";}s:4:\"mode\";s:4:\"test\";}', 'O:30:\"Tzsk\\Payu\\Concerns\\Transaction\":6:{s:13:\"transactionId\";s:10:\"uYlogpI6Ha\";s:6:\"amount\";d:9.99;s:11:\"productInfo\";s:5:\"Basic\";s:5:\"payee\";O:27:\"Tzsk\\Payu\\Concerns\\Customer\":10:{s:9:\"firstName\";s:37:\"Sharjeel Anjum(seeker@jobsportal.com)\";s:8:\"lastName\";N;s:5:\"email\";s:21:\"seeker@jobsportal.com\";s:5:\"phone\";N;s:10:\"addressOne\";N;s:10:\"addressTwo\";N;s:4:\"city\";N;s:5:\"state\";N;s:7:\"country\";N;s:7:\"zipCode\";N;}s:6:\"params\";O:29:\"Tzsk\\Payu\\Concerns\\Attributes\":10:{s:4:\"udf1\";s:1:\"5\";s:4:\"udf2\";N;s:4:\"udf3\";N;s:4:\"udf4\";N;s:4:\"udf5\";N;s:4:\"udf6\";N;s:4:\"udf7\";N;s:4:\"udf8\";N;s:4:\"udf9\";N;s:5:\"udf10\";N;}s:5:\"model\";N;}', 'http://www.sharjeelanjum.com/demos/jobsportal-update/payu-order-package-status?type=new', '9460107bfb0188c6a717b6846e58c4316bb02a52c9accfa17889c9e4502754ad99c5db428284608dedb80da87afa8ba6476b3310a99ecd798ce026b7993337da', NULL, 'pending', NULL, NULL, '2021-02-21 10:04:33', '2021-02-21 10:04:33'),
(5, NULL, NULL, 'eCFVnc1fsU', 'O:25:\"Tzsk\\Payu\\Gateway\\PayuBiz\":5:{s:3:\"key\";s:8:\"Aj9QVKLL\";s:4:\"salt\";s:10:\"qknGnvahLO\";s:4:\"base\";s:7:\"payu.in\";s:14:\"\0*\0processUrls\";a:2:{s:4:\"test\";s:24:\"https://test.%s/_payment\";s:4:\"live\";s:26:\"https://secure.%s/_payment\";}s:4:\"mode\";s:4:\"test\";}', 'O:30:\"Tzsk\\Payu\\Concerns\\Transaction\":6:{s:13:\"transactionId\";s:10:\"eCFVnc1fsU\";s:6:\"amount\";d:30;s:11:\"productInfo\";s:8:\"Test CVS\";s:5:\"payee\";O:27:\"Tzsk\\Payu\\Concerns\\Customer\":10:{s:9:\"firstName\";s:42:\"Multimedia Design(employer@jobsportal.com)\";s:8:\"lastName\";N;s:5:\"email\";s:23:\"employer@jobsportal.com\";s:5:\"phone\";N;s:10:\"addressOne\";N;s:10:\"addressTwo\";N;s:4:\"city\";N;s:5:\"state\";N;s:7:\"country\";N;s:7:\"zipCode\";N;}s:6:\"params\";O:29:\"Tzsk\\Payu\\Concerns\\Attributes\":10:{s:4:\"udf1\";s:1:\"8\";s:4:\"udf2\";N;s:4:\"udf3\";N;s:4:\"udf4\";N;s:4:\"udf5\";N;s:4:\"udf6\";N;s:4:\"udf7\";N;s:4:\"udf8\";N;s:4:\"udf9\";N;s:5:\"udf10\";N;}s:5:\"model\";N;}', 'https://www.sharjeelanjum.com/demos/jobsportal-update/public/payu-order-package.cvsearch-status?type=upgrade', '065523f57d64c9e212324bcdd61ea9b48c1907c400cad2e7a29e7a1e5ea378edaeb87bbef7ff46decfb173de369542085e6342b4674320b633dafd31592ab56d', NULL, 'pending', NULL, NULL, '2021-04-12 16:22:21', '2021-04-12 16:22:21'),
(6, NULL, NULL, 'JvJ8avY9Fy', 'O:25:\"Tzsk\\Payu\\Gateway\\PayuBiz\":5:{s:4:\"mode\";s:4:\"test\";s:3:\"key\";s:8:\"Aj9QVKLL\";s:4:\"salt\";s:10:\"qknGnvahLO\";s:4:\"base\";s:7:\"payu.in\";s:14:\"\0*\0processUrls\";a:2:{s:4:\"test\";s:24:\"https://test.%s/_payment\";s:4:\"live\";s:26:\"https://secure.%s/_payment\";}}', 'O:30:\"Tzsk\\Payu\\Concerns\\Transaction\":6:{s:13:\"transactionId\";s:10:\"JvJ8avY9Fy\";s:6:\"amount\";d:19.99;s:11:\"productInfo\";s:7:\"Premium\";s:5:\"payee\";O:27:\"Tzsk\\Payu\\Concerns\\Customer\":10:{s:9:\"firstName\";s:42:\"Multimedia Design(employer@jobsportal.com)\";s:8:\"lastName\";N;s:5:\"email\";s:23:\"employer@jobsportal.com\";s:5:\"phone\";N;s:10:\"addressOne\";N;s:10:\"addressTwo\";N;s:4:\"city\";N;s:5:\"state\";N;s:7:\"country\";N;s:7:\"zipCode\";N;}s:6:\"params\";O:29:\"Tzsk\\Payu\\Concerns\\Attributes\":10:{s:4:\"udf1\";s:1:\"4\";s:4:\"udf2\";N;s:4:\"udf3\";N;s:4:\"udf4\";N;s:4:\"udf5\";N;s:4:\"udf6\";N;s:4:\"udf7\";N;s:4:\"udf8\";N;s:4:\"udf9\";N;s:5:\"udf10\";N;}s:5:\"model\";N;}', 'http://127.0.0.1:8000/payu-order-package-status?type=new', '054bd3213015a35bb4545d678373247023e68b2ccbcb2e6890d6775d472b9bc1cf927f5d8d0c6b24ed72b15b38d12256c0b723fd4dd63ae427fac02a7cec48ab', NULL, 'pending', NULL, NULL, '2023-05-21 15:40:59', '2023-05-21 15:40:59'),
(7, NULL, NULL, 'RhvChzZHL9', 'O:25:\"Tzsk\\Payu\\Gateway\\PayuBiz\":5:{s:4:\"mode\";s:4:\"test\";s:3:\"key\";s:8:\"Aj9QVKLL\";s:4:\"salt\";s:10:\"qknGnvahLO\";s:4:\"base\";s:7:\"payu.in\";s:14:\"\0*\0processUrls\";a:2:{s:4:\"test\";s:24:\"https://test.%s/_payment\";s:4:\"live\";s:26:\"https://secure.%s/_payment\";}}', 'O:30:\"Tzsk\\Payu\\Concerns\\Transaction\":6:{s:13:\"transactionId\";s:10:\"RhvChzZHL9\";s:6:\"amount\";d:19.99;s:11:\"productInfo\";s:7:\"Premium\";s:5:\"payee\";O:27:\"Tzsk\\Payu\\Concerns\\Customer\":10:{s:9:\"firstName\";s:42:\"Multimedia Design(employer@jobsportal.com)\";s:8:\"lastName\";N;s:5:\"email\";s:23:\"employer@jobsportal.com\";s:5:\"phone\";N;s:10:\"addressOne\";N;s:10:\"addressTwo\";N;s:4:\"city\";N;s:5:\"state\";N;s:7:\"country\";N;s:7:\"zipCode\";N;}s:6:\"params\";O:29:\"Tzsk\\Payu\\Concerns\\Attributes\":10:{s:4:\"udf1\";s:1:\"4\";s:4:\"udf2\";N;s:4:\"udf3\";N;s:4:\"udf4\";N;s:4:\"udf5\";N;s:4:\"udf6\";N;s:4:\"udf7\";N;s:4:\"udf8\";N;s:4:\"udf9\";N;s:5:\"udf10\";N;}s:5:\"model\";N;}', 'http://127.0.0.1:8000/payu-order-package-status?type=new', '4f3d0a91b1904315c149dbef2d2d1e140a4bea57533cd332629fd4fb84b9420b2a85a6722bb39a55d664a46385310c1ce25a35dc2d83a2e9c95c29f0817f45a6', NULL, 'pending', NULL, NULL, '2023-05-21 15:41:05', '2023-05-21 15:41:05');

-- --------------------------------------------------------

--
-- Table structure for table `profile_cvs`
--

CREATE TABLE `profile_cvs` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `cv_file` varchar(120) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_cvs`
--

INSERT INTO `profile_cvs` (`id`, `user_id`, `title`, `cv_file`, `is_default`, `created_at`, `updated_at`) VALUES
(4, 4, 'Jawad CV -1', 'jawad-cv-1-1533894081-29.doc', 0, '2018-08-10 14:41:21', '2018-09-01 11:11:26'),
(5, 5, 'my cv', 'my-cv-1536901935-235.pdf', 0, '2018-09-14 20:12:15', '2018-09-19 01:30:13'),
(7, 10, 'rew', 'rew-1603198188-465.docx', 0, '2020-10-20 16:49:48', '2021-08-10 05:10:40'),
(8, 6, 'test', 'test-1628590240-94.pdf', 1, '2021-08-10 05:10:40', '2021-08-10 05:10:40'),
(10, 6, 'dfasfadsfsdf', 'dfasfadsfsdf-1664961455-781.pdf', 0, '2022-10-05 04:17:35', '2022-10-05 04:17:35');

-- --------------------------------------------------------

--
-- Table structure for table `profile_educations`
--

CREATE TABLE `profile_educations` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `education_type` int(11) DEFAULT NULL COMMENT '1-ssc,2-hsc,3-versity',
  `degree_level_id` int(11) DEFAULT NULL,
  `entrance_year` varchar(255) DEFAULT NULL,
  `entrance_month` varchar(255) DEFAULT NULL,
  `pass_year` varchar(255) DEFAULT NULL,
  `pass_month` varchar(255) DEFAULT NULL,
  `institution_name` varchar(255) DEFAULT NULL,
  `major` varchar(255) DEFAULT NULL,
  `degree_type_id` int(11) DEFAULT NULL,
  `degree_title` varchar(150) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `date_completion` varchar(15) DEFAULT NULL,
  `institution` varchar(150) DEFAULT NULL,
  `degree_result` varchar(20) DEFAULT NULL,
  `result_type_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_educations`
--

INSERT INTO `profile_educations` (`id`, `user_id`, `education_type`, `degree_level_id`, `entrance_year`, `entrance_month`, `pass_year`, `pass_month`, `institution_name`, `major`, `degree_type_id`, `degree_title`, `country_id`, `state_id`, `city_id`, `date_completion`, `institution`, `degree_result`, `result_type_id`, `created_at`, `updated_at`) VALUES
(6, 4, NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, 110, 'MCS', 166, 2728, 31351, '2009', 'VU', '65', 3, '2018-08-10 14:44:41', '2018-08-10 14:44:41'),
(9, 6, 2, NULL, '3', '4', '3', '4', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 17:19:08', '2023-06-08 17:19:08'),
(10, 6, 3, NULL, '3', '4', '3', '4', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 17:19:16', '2023-06-08 17:19:16'),
(11, 6, 1, NULL, '3', '3', '2', '1', 'test', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-06-08 17:19:38', '2023-06-08 17:19:38');

-- --------------------------------------------------------

--
-- Table structure for table `profile_education_major_subjects`
--

CREATE TABLE `profile_education_major_subjects` (
  `id` int(10) UNSIGNED NOT NULL,
  `profile_education_id` int(11) DEFAULT NULL,
  `major_subject_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_education_major_subjects`
--

INSERT INTO `profile_education_major_subjects` (`id`, `profile_education_id`, `major_subject_id`, `created_at`, `updated_at`) VALUES
(15, 6, 7, '2018-08-10 14:44:41', '2018-08-10 14:44:41'),
(16, 6, 123, '2018-08-10 14:44:41', '2018-08-10 14:44:41');

-- --------------------------------------------------------

--
-- Table structure for table `profile_experiences`
--

CREATE TABLE `profile_experiences` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `company` varchar(120) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL,
  `state_id` int(11) DEFAULT NULL,
  `city_id` int(11) DEFAULT NULL,
  `date_start` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `date_end` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `entrance_year` varchar(255) DEFAULT NULL,
  `entrance_month` varchar(255) DEFAULT NULL,
  `pass_year` varchar(255) DEFAULT NULL,
  `pass_month` varchar(255) DEFAULT NULL,
  `is_currently_working` tinyint(1) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_experiences`
--

INSERT INTO `profile_experiences` (`id`, `user_id`, `title`, `slug`, `company`, `country_id`, `state_id`, `city_id`, `date_start`, `date_end`, `entrance_year`, `entrance_month`, `pass_year`, `pass_month`, `is_currently_working`, `description`, `created_at`, `updated_at`) VALUES
(4, 4, 'this is test', NULL, 'Company Name', 1, 42, 5909, '2018-08-17 05:00:00', '2018-08-17 05:00:00', NULL, NULL, NULL, NULL, 0, 'testing', '2018-08-10 14:42:55', '2018-08-10 14:42:55'),
(5, 5, 'Web Designer', NULL, 'Amoka Int', 166, 2728, 31439, '2010-12-14 17:00:00', '2011-02-14 17:00:00', NULL, NULL, NULL, NULL, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis nibh feugiat, suscipit enim quis, aliquam eros. Nam congue odio sit amet pellentesque ultrices. Morbi et felis vel lacus vestibulum euismod eu sit amet velit. Proin rhoncus auctor vehicula. Duis quis elit sapien. Cras convallis risus eu justo posuere varius. Cras a imperdiet nisi. Quisque urna enim, posuere ut pretium imperdiet, rhoncus quis ipsum. Ut nec congue dolor. Curabitur eu purus ut leo ultrices iaculis. Quisque ac finibus velit, quis malesuada ex.', '2018-08-29 19:13:07', '2018-08-29 19:13:07'),
(6, 6, 'Web Designer', NULL, 'My Test Company 1', 231, 3919, 42596, '2016-01-04 17:00:00', '2017-12-29 17:00:00', NULL, NULL, NULL, NULL, 0, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fringilla at enim quis tincidunt. Nulla condimentum dapibus efficitur. In massa felis, fringilla at urna vestibulum, mattis malesuada metus.', '2018-09-19 01:34:30', '2018-09-19 01:34:30'),
(7, 6, 'Senior Frontend Developer', NULL, 'My Test Company 2', 231, 3931, 43999, '2018-01-08 17:00:00', NULL, NULL, NULL, NULL, NULL, 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fringilla at enim quis tincidunt. Nulla condimentum dapibus efficitur. In massa felis, fringilla at urna vestibulum, mattis malesuada metus. Integer id lorem tortor. Pellentesque hendrerit sapien sit amet finibus pretium.', '2018-09-19 01:35:39', '2018-09-19 01:35:39'),
(8, 6, 'last test', 'last_test_4cc', 'test by company', 1, 2, 2, NULL, NULL, '3', '4', '3', '1', 0, 'test', '2023-06-08 17:20:53', '2023-06-08 17:20:53');

-- --------------------------------------------------------

--
-- Table structure for table `profile_languages`
--

CREATE TABLE `profile_languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pass_year` varchar(255) DEFAULT NULL,
  `pass_month` varchar(255) DEFAULT NULL,
  `entrance_year` varchar(255) DEFAULT NULL,
  `entrance_month` varchar(255) DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `language_type_id` int(11) DEFAULT NULL,
  `language_level_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_languages`
--

INSERT INTO `profile_languages` (`id`, `user_id`, `pass_year`, `pass_month`, `entrance_year`, `entrance_month`, `language_id`, `language_type_id`, `language_level_id`, `created_at`, `updated_at`) VALUES
(19, 6, '2', '2', '2', '2', 1, 2, 6, '2023-06-07 00:05:29', '2023-06-07 00:05:29'),
(20, 6, '2', '2', '2', '2', 1, 2, 6, '2023-06-07 00:35:43', '2023-06-07 00:35:43'),
(21, 8, '2', '2', '2', '2', 2, 16, 51, '2023-06-07 16:44:43', '2023-06-08 00:25:35'),
(22, 8, '4', '5', '5', '5', 2, 16, 50, '2023-06-07 21:01:42', '2023-06-07 21:01:42'),
(23, 6, '3', '4', '4', '1', 2, 16, 49, '2023-06-08 17:22:14', '2023-06-08 17:22:14');

-- --------------------------------------------------------

--
-- Table structure for table `profile_projects`
--

CREATE TABLE `profile_projects` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `image` varchar(120) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `url` tinytext DEFAULT NULL,
  `date_start` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `date_end` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp(),
  `is_on_going` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_projects`
--

INSERT INTO `profile_projects` (`id`, `user_id`, `name`, `image`, `description`, `url`, `date_start`, `date_end`, `is_on_going`, `created_at`, `updated_at`) VALUES
(5, 4, 'Job Portal', 'job-portal-ju9qr-19.jpg', 'testing', 'http://www.aquasureuae.com/about_us.php', '2018-08-10 19:42:17', '2018-08-10 19:42:17', 0, '2018-08-10 14:42:17', '2018-08-10 14:42:17'),
(6, 6, 'My test 1', 'my-test-1-xczub-967.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'http://www.google.com', '2021-08-15 16:38:15', '2021-08-15 16:38:15', 0, '2018-09-19 01:31:25', '2021-08-15 11:38:15'),
(7, 6, 'Test Project 2', 'test-project-2-cx7xg-421.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'http://www.yourdomain.com', '2021-08-15 16:38:31', '2021-08-15 16:38:31', 0, '2018-09-19 01:32:18', '2021-08-15 11:38:31'),
(8, 6, 'Test Project 3', 'test-project-3-o2whp-818.jpg', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', 'http://www.yourdomain.com', '2021-08-15 16:38:53', '2021-08-15 16:38:53', 0, '2018-09-19 01:33:06', '2021-08-15 11:38:53');

-- --------------------------------------------------------

--
-- Table structure for table `profile_skills`
--

CREATE TABLE `profile_skills` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `pass_year` varchar(255) DEFAULT NULL,
  `pass_month` varchar(255) DEFAULT NULL,
  `certificate_title` varchar(255) DEFAULT NULL,
  `slug` varchar(100) DEFAULT NULL,
  `job_skill_id` int(11) DEFAULT NULL,
  `job_experience_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_skills`
--

INSERT INTO `profile_skills` (`id`, `user_id`, `pass_year`, `pass_month`, `certificate_title`, `slug`, `job_skill_id`, `job_experience_id`, `created_at`, `updated_at`) VALUES
(9, 4, NULL, NULL, NULL, NULL, 16, 8, '2018-08-10 14:44:57', '2018-08-10 14:44:57'),
(11, 5, NULL, NULL, NULL, NULL, 1, 8, '2018-08-29 19:13:38', '2018-08-29 19:13:38'),
(12, 5, NULL, NULL, NULL, NULL, 2, 9, '2018-08-29 19:13:53', '2018-08-29 19:13:53'),
(13, 5, NULL, NULL, NULL, NULL, 9, 5, '2018-08-29 21:37:24', '2018-08-29 21:37:24'),
(22, 10, NULL, NULL, NULL, NULL, 1, 11, '2020-10-20 16:49:59', '2020-10-20 16:49:59'),
(23, 10, NULL, NULL, NULL, NULL, 2, 12, '2020-10-20 16:50:10', '2020-10-20 16:50:10'),
(24, 13, NULL, NULL, NULL, NULL, 4, 1, '2023-02-14 05:12:23', '2023-02-14 05:12:23'),
(25, 6, '3', '4', 'test', 'test_916', NULL, NULL, '2023-06-08 17:23:16', '2023-06-08 17:23:16');

-- --------------------------------------------------------

--
-- Table structure for table `profile_summaries`
--

CREATE TABLE `profile_summaries` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `summary` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `profile_summaries`
--

INSERT INTO `profile_summaries` (`id`, `user_id`, `summary`, `created_at`, `updated_at`) VALUES
(17, 4, 'yahoo', '2018-08-10 14:57:22', '2018-08-10 14:57:22'),
(25, 5, 'gfhdfLorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc quis nibh feugiat, suscipit enim quis, aliquam eros. Nam congue odio sit amet pellentesque ultrices. Morbi et felis vel lacus vestibulum euismod eu sit amet velit. Proin rhoncus auctor vehicula. Duis quis elit sapien. Cras convallis risus eu justo posuere varius. Cras a imperdiet nisi. Quisque urna enim, posuere ut pretium imperdiet, rhoncus quis ipsum. Ut nec congue dolor. Curabitur eu purus ut leo ultrices iaculis. Quisque ac finibus velit, quis malesuada ex. Mauris lobortis condimentum urna, nec convallis tortor scelerisque porttitor. Ut consequat hendrerit nibh, vitae molestie quam tempus a. Maecenas eget malesuada tortor. Quisque lacinia, mauris ut placerat porttitor, orci erat interdum dolor, et porta mi ipsum sed mi.', '2018-08-29 19:15:48', '2018-08-29 19:15:48'),
(27, 13, 'sdfsdfds', '2023-02-14 05:22:18', '2023-02-14 05:22:18'),
(29, 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam fringilla at enim quis tincidunt. Nulla condimentum dapibus efficitur. In massa felis, fringilla at urna vestibulum, mattis malesuada metus. Integer id lorem tortor. Pellentesque hendrerit sapien sit amet finibus pretium. Fusce eu sagittis orci. Quisque urna velit, facilisis interdum nisl nec, commodo tristique leo. Maecenas turpis augue, vulputate ac lorem in, euismod euismod tortor. Phasellus vitae lacinia est, ut porta leo. Morbi sit amet quam in risus gravida mattis. Suspendisse wwsodales massa et odio mollis, id ultricies ipsum semper. Duis pretium vestibulum dui at scelerisque.', '2023-05-21 06:45:42', '2023-05-21 06:45:42');

-- --------------------------------------------------------

--
-- Table structure for table `queue_jobs`
--

CREATE TABLE `queue_jobs` (
  `id` int(10) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report_abuse_company_messages`
--

CREATE TABLE `report_abuse_company_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `your_name` varchar(100) DEFAULT NULL,
  `your_email` varchar(100) DEFAULT NULL,
  `company_url` mediumtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `report_abuse_company_messages`
--

INSERT INTO `report_abuse_company_messages` (`id`, `your_name`, `your_email`, `company_url`, `created_at`, `updated_at`) VALUES
(1, 'jobseeker14', 'jobseeker14@hotmail.com', 'http://localhost/job_portal/public/company/future-now-pvt-limited-1', '2018-08-01 17:24:04', '2018-08-01 17:24:04'),
(2, 'jobseeker14', 'jobseeker14@hotmail.com', 'http://localhost/job_portal/public/company/future-now-pvt-limited-1', '2018-08-01 17:24:56', '2018-08-01 17:24:56'),
(3, 'jobseeker14', 'jobseeker14@hotmail.com', 'http://localhost/job_portal/public/company/future-now-pvt-limited-1', '2018-08-01 17:26:36', '2018-08-01 17:26:36'),
(4, 'jobseeker14', 'jobseeker14@hotmail.com', 'http://localhost/job_portal/public/company/future-now-pvt-limited-1', '2018-08-01 17:27:42', '2018-08-01 17:27:42'),
(5, 'jobseeker14', 'jobseeker14@hotmail.com', 'http://localhost/job_portal/public/company/future-now-pvt-limited-1', '2018-08-01 17:31:29', '2018-08-01 17:31:29'),
(6, 'jobseeker14', 'jobseeker14@hotmail.com', 'http://localhost/job_portal/public/company/future-now-pvt-limited-1', '2018-08-01 17:34:17', '2018-08-01 17:34:17');

-- --------------------------------------------------------

--
-- Table structure for table `report_abuse_messages`
--

CREATE TABLE `report_abuse_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `your_name` varchar(100) DEFAULT NULL,
  `your_email` varchar(100) DEFAULT NULL,
  `job_url` tinytext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `result_types`
--

CREATE TABLE `result_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `result_type_id` int(11) DEFAULT 0,
  `result_type` varchar(40) NOT NULL,
  `is_default` int(11) DEFAULT 0,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 9999,
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `result_types`
--

INSERT INTO `result_types` (`id`, `result_type_id`, `result_type`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'GPA', 1, 1, 1, 'en', '2018-07-02 14:10:45', '2018-07-02 14:10:45'),
(2, 2, 'Grade', 1, 1, 2, 'en', '2018-07-02 14:11:05', '2018-07-02 14:11:05'),
(3, 3, 'Percentage', 1, 1, 3, 'en', '2018-07-02 14:11:22', '2018-07-02 14:11:22'),
(4, 1, 'GPA', 0, 1, 1, 'es', '2018-07-02 19:15:52', '2018-07-02 19:16:48'),
(5, 2, 'Grado', 0, 1, 2, 'es', '2018-07-02 19:15:52', '2018-07-02 19:17:30'),
(6, 3, 'Porcentaje', 0, 1, 3, 'es', '2018-07-02 19:15:52', '2018-07-02 19:17:30'),
(7, 1, 'GPA', 0, 1, 1, 'ar', '2018-07-02 19:16:02', '2018-07-02 19:19:39'),
(8, 2, 'درجة', 0, 1, 2, 'ar', '2018-07-02 19:16:02', '2018-07-02 19:19:33'),
(9, 3, 'نسبة مئوية', 0, 1, 3, 'ar', '2018-07-02 19:16:02', '2018-07-02 19:19:33'),
(10, 1, 'جی پی اے', 0, 1, 1, 'ur', '2018-07-02 19:16:05', '2018-07-02 19:19:06'),
(11, 2, 'گریڈ', 0, 1, 2, 'ur', '2018-07-02 19:16:05', '2018-07-02 19:19:06'),
(12, 3, 'فی صد', 0, 1, 3, 'ur', '2018-07-02 19:16:05', '2018-07-02 19:19:06');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `role_abbreviation` varchar(30) NOT NULL,
  `role_description` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `role_name`, `role_abbreviation`, `role_description`) VALUES
(1, 'Super Admin', 'SUP_ADM', 'Super Admin'),
(2, 'Sub Admin', 'SUB_ADM', 'Sub Admin');

-- --------------------------------------------------------

--
-- Table structure for table `salary_periods`
--

CREATE TABLE `salary_periods` (
  `id` int(10) UNSIGNED NOT NULL,
  `salary_period_id` int(11) DEFAULT 0,
  `salary_period` varchar(200) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `salary_periods`
--

INSERT INTO `salary_periods` (`id`, `salary_period_id`, `salary_period`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Monthly', 1, 1, 2, 'en', '2018-08-15 19:55:46', '2018-08-15 15:08:45'),
(2, 2, 'Yearly', 1, 1, 3, 'en', '2018-08-15 19:56:23', '2018-08-15 15:08:45'),
(3, 3, 'Weekly', 1, 1, 1, 'en', '2018-08-15 15:08:09', '2018-08-15 15:08:45');

-- --------------------------------------------------------

--
-- Table structure for table `send_to_friend_messages`
--

CREATE TABLE `send_to_friend_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `your_name` varchar(100) DEFAULT NULL,
  `your_email` varchar(100) DEFAULT NULL,
  `job_url` mediumtext DEFAULT NULL,
  `friend_name` varchar(100) DEFAULT NULL,
  `friend_email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `seo`
--

CREATE TABLE `seo` (
  `id` int(10) UNSIGNED NOT NULL,
  `page_title` text DEFAULT NULL,
  `seo_title` text DEFAULT NULL,
  `seo_description` text DEFAULT NULL,
  `seo_keywords` text DEFAULT NULL,
  `seo_other` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `seo`
--

INSERT INTO `seo` (`id`, `page_title`, `seo_title`, `seo_description`, `seo_keywords`, `seo_other`, `created_at`, `updated_at`) VALUES
(1, 'front_index_page', 'Jobs In United States of America', 'Find best Jobs in United States of America, jobs listings and job opportunities on Jobs Portal. Browse more than 100K jobs in United States of America and apply for free! Jobs Portal is USA\'s leading job website where more than 52K top companies are posting jobs', 'Jobs in USA, Jobs uae, Jobs, Careers, Recruitment, Employment, Hiring, Banking, CVs, Career, Finance, IT, Marketing, Online Jobs, Opportunity,usa, Resume, Work, naukri, rizq, Rozi', '<meta name=\"robots\" content=\"ALL, FOLLOW,INDEX\" />\r\n<meta name=\"author\" content=\"JobPortal.PK\" />', '2018-08-25 20:01:47', '2019-01-01 06:03:00'),
(2, 'email_to_friend', 'Jobs In Pakistan', 'Find best Jobs in Pakistan, jobs listings and job opportunities on ROZEE.PK. Browse more than 100K jobs in Pakistan and apply for free! ROZEE.PK is Pakistan\'s leading job website where more than 52K top companies are posting jobs', 'Jobs in Pakistan, Jobs Pakistan, Jobs, Careers, Recruitment, Employment, Hiring, Banking, CVs, Career, Finance, IT, Marketing, Online Jobs, Opportunity,Pakistan, Resume, Work, naukri, rizq, Rozi', '<meta name=\"robots\" content=\"ALL, FOLLOW,INDEX\" />', '2018-08-25 20:03:08', NULL),
(3, 'report_abuse', 'Jobs In Pakistan', 'Find best Jobs in Pakistan, jobs listings and job opportunities on ROZEE.PK. Browse more than 100K jobs in Pakistan and apply for free! ROZEE.PK is Pakistan\'s leading job website where more than 52K top companies are posting jobs', 'Jobs in Pakistan, Jobs Pakistan, Jobs, Careers, Recruitment, Employment, Hiring, Banking, CVs, Career, Finance, IT, Marketing, Online Jobs, Opportunity,Pakistan, Resume, Work, naukri, rizq, Rozi', '<meta name=\"robots\" content=\"ALL, FOLLOW,INDEX\" />', '2018-08-25 20:03:26', NULL),
(4, 'faq', 'Jobs In Pakistan', 'Find best Jobs in Pakistan, jobs listings and job opportunities on ROZEE.PK. Browse more than 100K jobs in Pakistan and apply for free! ROZEE.PK is Pakistan\'s leading job website where more than 52K top companies are posting jobs', 'Jobs in Pakistan, Jobs Pakistan, Jobs, Careers, Recruitment, Employment, Hiring, Banking, CVs, Career, Finance, IT, Marketing, Online Jobs, Opportunity,Pakistan, Resume, Work, naukri, rizq, Rozi', '<meta name=\"robots\" content=\"ALL, FOLLOW,INDEX\" />', '2018-08-25 20:03:41', NULL),
(5, 'contact', 'Jobs In Pakistan', 'Find best Jobs in Pakistan, jobs listings and job opportunities on ROZEE.PK. Browse more than 100K jobs in Pakistan and apply for free! ROZEE.PK is Pakistan\'s leading job website where more than 52K top companies are posting jobs', 'Jobs in Pakistan, Jobs Pakistan, Jobs, Careers, Recruitment, Employment, Hiring, Banking, CVs, Career, Finance, IT, Marketing, Online Jobs, Opportunity,Pakistan, Resume, Work, naukri, rizq, Rozi', '<meta name=\"robots\" content=\"ALL, FOLLOW,INDEX\" />', '2018-08-25 20:03:50', NULL),
(6, 'jobs', 'Jobs In Pakistan', 'Find best Jobs in Pakistan, jobs listings and job opportunities on ROZEE.PK. Browse more than 100K jobs in Pakistan and apply for free! Jobsportal is Pakistan\'s leading job website where more than 52K top companies are posting jobs', 'Jobs in Pakistan, Jobs Pakistan, Jobs, Careers, Recruitment, Employment, Hiring, Banking, CVs, Career, Finance, IT, Marketing, Online Jobs, Opportunity,Pakistan, Resume, Work, naukri, rizq, Rozi', '<meta name=\"robots\" content=\"ALL, FOLLOW,INDEX\" />', '2018-08-25 20:03:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `slug` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `name`, `slug`) VALUES
(1, '海外にいる人材向け', 'For-overseas-personnel'),
(2, '国内にいる人材向け', 'For-human-resources-in-japan'),
(3, '日本国内企業', 'Japanese-domestic-company'),
(4, '日本国内学校向け', 'For-schools-in-japan');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE `site_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `site_name` varchar(100) DEFAULT NULL,
  `site_slogan` varchar(150) DEFAULT NULL,
  `site_logo` varchar(100) DEFAULT NULL,
  `site_phone_primary` varchar(20) DEFAULT NULL,
  `site_phone_secondary` varchar(20) DEFAULT NULL,
  `default_country_id` int(11) DEFAULT NULL,
  `default_currency_code` varchar(4) DEFAULT NULL,
  `site_street_address` varchar(250) DEFAULT NULL,
  `site_google_map` mediumtext DEFAULT NULL,
  `mail_driver` enum('array','log','sparkpost','ses','mandrill','mailgun','sendmail','smtp','mail') DEFAULT 'smtp',
  `mail_host` varchar(100) DEFAULT NULL,
  `mail_port` int(11) DEFAULT NULL,
  `mail_from_address` varchar(100) DEFAULT NULL,
  `mail_from_name` varchar(100) DEFAULT NULL,
  `mail_to_address` varchar(100) DEFAULT NULL,
  `mail_to_name` varchar(100) DEFAULT NULL,
  `mail_encryption` varchar(10) DEFAULT NULL,
  `mail_username` varchar(100) DEFAULT NULL,
  `mail_password` varchar(100) DEFAULT NULL,
  `mail_sendmail` varchar(50) DEFAULT NULL,
  `mail_pretend` varchar(50) DEFAULT NULL,
  `mailgun_domain` varchar(100) DEFAULT NULL,
  `mailgun_secret` varchar(100) DEFAULT NULL,
  `mandrill_secret` varchar(100) DEFAULT NULL,
  `sparkpost_secret` varchar(100) DEFAULT NULL,
  `ses_key` varchar(100) DEFAULT NULL,
  `ses_secret` varchar(100) DEFAULT NULL,
  `ses_region` varchar(100) DEFAULT NULL,
  `facebook_address` text DEFAULT NULL,
  `twitter_address` text DEFAULT NULL,
  `google_plus_address` text DEFAULT NULL,
  `youtube_address` text DEFAULT NULL,
  `instagram_address` text DEFAULT NULL,
  `pinterest_address` text DEFAULT NULL,
  `linkedin_address` text DEFAULT NULL,
  `tumblr_address` text DEFAULT NULL,
  `flickr_address` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `index_page_below_top_employes_ad` mediumtext DEFAULT NULL,
  `above_footer_ad` mediumtext DEFAULT NULL,
  `dashboard_page_ad` mediumtext DEFAULT NULL,
  `cms_page_ad` mediumtext DEFAULT NULL,
  `listing_page_vertical_ad` mediumtext DEFAULT NULL,
  `listing_page_horizontal_ad` mediumtext DEFAULT NULL,
  `nocaptcha_sitekey` varchar(150) DEFAULT NULL,
  `nocaptcha_secret` varchar(150) DEFAULT NULL,
  `facebook_app_id` varchar(150) DEFAULT NULL,
  `facebeek_app_secret` varchar(150) DEFAULT NULL,
  `google_app_id` varchar(150) DEFAULT NULL,
  `google_app_secret` varchar(150) DEFAULT NULL,
  `yahoo_app_id` varchar(120) DEFAULT NULL,
  `twitter_app_id` varchar(150) DEFAULT NULL,
  `twitter_app_secret` varchar(150) DEFAULT NULL,
  `paypal_account` varchar(250) DEFAULT NULL,
  `paypal_client_id` varchar(250) DEFAULT NULL,
  `paypal_secret` varchar(250) DEFAULT NULL,
  `paypal_live_sandbox` enum('live','sandbox') DEFAULT 'sandbox',
  `stripe_key` varchar(250) DEFAULT NULL,
  `stripe_secret` varchar(250) DEFAULT NULL,
  `bank_details` mediumtext DEFAULT NULL,
  `listing_age` int(11) NOT NULL DEFAULT 15,
  `country_specific_site` tinyint(1) DEFAULT 0,
  `is_paypal_active` tinyint(1) DEFAULT 1,
  `is_bank_transfer_active` tinyint(1) DEFAULT 1,
  `is_jobseeker_package_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_stripe_active` tinyint(1) DEFAULT 1,
  `is_slider_active` tinyint(1) DEFAULT 0,
  `user_reviews_title` varchar(255) DEFAULT NULL,
  `user_reviews_short_title` varchar(255) DEFAULT NULL,
  `mailchimp_api_key` tinytext DEFAULT NULL,
  `mailchimp_list_name` tinytext DEFAULT NULL,
  `mailchimp_list_id` tinytext DEFAULT NULL,
  `is_company_package_active` tinyint(1) NOT NULL DEFAULT 1,
  `is_payu_active` tinyint(1) DEFAULT 1,
  `payu_money_mode` varchar(255) DEFAULT NULL,
  `payu_money_key` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `check_time` timestamp NULL DEFAULT NULL,
  `ganalytics` mediumtext DEFAULT NULL,
  `google_tag_manager_for_body` text DEFAULT NULL,
  `google_tag_manager_for_head` text DEFAULT NULL,
  `username_jobg8` varchar(255) DEFAULT NULL,
  `password_jobg8` varchar(255) DEFAULT NULL,
  `accountnumber_jobg8` varchar(255) DEFAULT NULL,
  `yahoo_app_secret` varchar(120) DEFAULT NULL,
  `linkedin_app_id` varchar(120) DEFAULT NULL,
  `linkedin_app_secret` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `site_settings`
--

INSERT INTO `site_settings` (`id`, `site_name`, `site_slogan`, `site_logo`, `site_phone_primary`, `site_phone_secondary`, `default_country_id`, `default_currency_code`, `site_street_address`, `site_google_map`, `mail_driver`, `mail_host`, `mail_port`, `mail_from_address`, `mail_from_name`, `mail_to_address`, `mail_to_name`, `mail_encryption`, `mail_username`, `mail_password`, `mail_sendmail`, `mail_pretend`, `mailgun_domain`, `mailgun_secret`, `mandrill_secret`, `sparkpost_secret`, `ses_key`, `ses_secret`, `ses_region`, `facebook_address`, `twitter_address`, `google_plus_address`, `youtube_address`, `instagram_address`, `pinterest_address`, `linkedin_address`, `tumblr_address`, `flickr_address`, `created_at`, `updated_at`, `index_page_below_top_employes_ad`, `above_footer_ad`, `dashboard_page_ad`, `cms_page_ad`, `listing_page_vertical_ad`, `listing_page_horizontal_ad`, `nocaptcha_sitekey`, `nocaptcha_secret`, `facebook_app_id`, `facebeek_app_secret`, `google_app_id`, `google_app_secret`, `yahoo_app_id`, `twitter_app_id`, `twitter_app_secret`, `paypal_account`, `paypal_client_id`, `paypal_secret`, `paypal_live_sandbox`, `stripe_key`, `stripe_secret`, `bank_details`, `listing_age`, `country_specific_site`, `is_paypal_active`, `is_bank_transfer_active`, `is_jobseeker_package_active`, `is_stripe_active`, `is_slider_active`, `user_reviews_title`, `user_reviews_short_title`, `mailchimp_api_key`, `mailchimp_list_name`, `mailchimp_list_id`, `is_company_package_active`, `is_payu_active`, `payu_money_mode`, `payu_money_key`, `salt`, `check_time`, `ganalytics`, `google_tag_manager_for_body`, `google_tag_manager_for_head`, `username_jobg8`, `password_jobg8`, `accountnumber_jobg8`, `yahoo_app_secret`, `linkedin_app_id`, `linkedin_app_secret`) VALUES
(1272, 'バロージョブ', 'Chances to all', 'jobs-portal-updated-1684645975-255.png', '+818095694531', '+819072611873', 1, '123', '神奈川県大和市大和東3-12-22', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d415898.11286030966!2d138.85522878906252!3d35.474496!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x601856151701615f%3A0x63f5685e63b4f06e!2zSklOWkHmoKrlvI_kvJrnpL4!5e0!3m2!1sen!2sjp!4v1685847221882!5m2!1sen!2sjp\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>', 'mail', 'smtp.gmail.com', 587, 'support@bhalojob.com', 'バロージョブ求人サイトより', 'support@bhalojob.com', 'バロージョブ求人サイトより', NULL, 'support@jobsportal.com', 'youremailpassword', '/usr/sbin/sendmail -bs', 'true', 'your-mailgun-domain', 'your-mailgun-secret', 'your-mandrill-secret', 'your-sparkpost-secret', 'your-ses-key', 'your-ses-secret', 'your-ses-region', 'https://www.facebook.com/', 'https://www.twitter.com', 'https://plus.google.com/', 'https://www.youtube.com', 'https://www.instagram.com/', 'https://www.pinterest.com/', 'https://linkedin.com/', 'https://www.tumblr.com/', 'https://www.flickr.com/', '2017-09-24 08:27:10', '2023-06-09 05:44:39', '<img src=\"https://www.sharjeelanjum.com/demos/jobsportal-update/images/google-ad-wide.jpg\">', '<img src=\"https://www.sharjeelanjum.com/demos/jobsportal-update/images/google-ad-wide.jpg\">', '<img src=\"https://www.sharjeelanjum.com/demos/jobsportal-update/images/large-ad.jpg\">', '<img src=\"https://www.sharjeelanjum.com/demos/jobsportal-update/images/google-ad-wide.jpg\">', '<img src=\"https://www.sharjeelanjum.com/demos/jobsportal-update/images/large-ad.jpg\">', '<img src=\"https://www.sharjeelanjum.com/demos/jobsportal-update/images/google-ad-wide.jpg\">', '6LefOWcmAAAAAMTR_nw6nrVrxk2yAhElOY-By8A9', '6LefOWcmAAAAAJbPhremrVQ8vGMJud3pMNWgA4ga', '246689387914322', '11cb55abe5a47659fea62bc359f0a5c1', '6LenNWcmAAAAAM-_40MThtBO8ONnnS2ponYJSsdy', '6LenNWcmAAAAABy1IQspKrHiPWidABrtStoyaMT5', 'yahooid', NULL, NULL, 'jobseeker14business@hotmail.com', 'AWuIi1J_QCuTudnhU3-TKNLYg1GHuGz-y8nsdh5Cosa9rPL7StMKjTdBTahjyOt95_3HPwPKPHZziA9r', 'EOQpru3Ee-topJnnm8fvz70qkS3uQxSynLqGeUZ2l-DG4XW9wEJOELzaMUKfegWFXAE917WYFkkOqiuU', 'sandbox', 'pk_test_qZrL4iEhRiW0xVy1X3HRDtnp', 'sk_test_Jc5YJMkPz81EuYgEy2eGPMdp', '<h5>Bank Details</h5>\r\n<br />\r\n<p>Lorem ipsum dolor sit amet,<br /><br />consectetur adipiscing elit.</p>\r\n<br />\r\n<p><strong>Account Number:</strong> 123456789130</p>\r\n<br />\r\n<p><strong>Branch Code:</strong> 123456789130</p>\r\n<br />\r\n<p><strong>Bank Name:</strong> Bank of America</p>\r\n<br />\r\n<p><strong>Bank Address:</strong> New York</p>', 15, 0, 1, 1, 0, 1, 1, '仕事をお探しの方に対する様々な就職 仕事をお探し', '仕事をお探しの方に対する様々な就職 仕事をお探しの方に対する様々な就職 仕事をお探しの方に対する様々な就職', 'e018ea311537eaa81c2a22e894064f4d-us19', 'subscribers', 'df624b23e2', 1, 1, 'test', 'gtKFFx', 'eCwWELxi', '2023-06-09 05:44:39', NULL, NULL, NULL, 'test', 'test', 'test', 'yahooapp', 'linkedinid', 'linkdinapp');

-- --------------------------------------------------------

--
-- Table structure for table `sliders`
--

CREATE TABLE `sliders` (
  `id` int(10) UNSIGNED NOT NULL,
  `slider_id` int(11) DEFAULT 0,
  `slider_image` varchar(150) DEFAULT NULL,
  `slider_heading` varchar(250) DEFAULT NULL,
  `slider_description` tinytext DEFAULT NULL,
  `slider_link` tinytext DEFAULT NULL,
  `slider_link_text` varchar(100) DEFAULT NULL,
  `lang` varchar(10) DEFAULT 'en',
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT 1,
  `sort_order` int(11) DEFAULT 99999,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sliders`
--

INSERT INTO `sliders` (`id`, `slider_id`, `slider_image`, `slider_heading`, `slider_description`, `slider_link`, `slider_link_text`, `lang`, `is_default`, `is_active`, `sort_order`, `created_at`, `updated_at`) VALUES
(1, 1, '-1685806307-793.jpg', 'バロジョブ・サポートは世界をつなぐ未来へのパートナー', '<p><strong>バロジョブアカウントへの登録<br /></strong></p>\r\n<p>より速く、より簡単に自分にあった求人を探し未来への扉を開く鍵となる</p>\r\n<p> </p>', 'register', 'this is link text', 'ja', 1, 1, 1, '2023-06-03 10:31:17', '2023-06-04 05:45:16'),
(2, 2, '1-1685806342-98.jpg', 'バロジョブ・サポートは世界をつなぐ未来へのパートナー1', '<br />\r\n<p><strong>バロジョブアカウントへの登録<br /></strong><strong>日本で夢の仕事に就くために履歴書作成からお手伝い致します</strong></p>', 'register', '#', 'ja', 1, 1, 2, '2023-06-03 14:02:03', '2023-06-04 05:45:29');

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(10) UNSIGNED NOT NULL,
  `state_id` int(11) DEFAULT 0,
  `state` varchar(40) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT 1,
  `is_default` int(11) DEFAULT 0,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `sort_order` int(11) NOT NULL DEFAULT 9999,
  `lang` varchar(10) NOT NULL DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `states`
--

INSERT INTO `states` (`id`, `state_id`, `state`, `country_id`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Rajshahi', 1, 1, 1, 1, 'en', '2023-05-20 11:20:02', '2023-05-20 11:20:24'),
(2, 2, 'Dhaka', 1, 1, 1, 2, 'en', '2023-05-20 11:25:42', '2023-05-20 11:47:24'),
(3, 3, 'sylhet', 1, 1, 1, 3, 'en', '2023-05-20 11:46:00', '2023-05-20 11:46:00');

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_title` varchar(255) DEFAULT NULL,
  `statistics_ratio` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(150) DEFAULT NULL,
  `name` varchar(150) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `email`, `name`, `created_at`, `updated_at`) VALUES
(6, 'monu@synram.co', 'wqe eqw', '2020-10-20 16:49:10', '2020-10-20 16:49:10'),
(8, 'pumpoosh99@gmail.com', 'Automatic Traffic Bot', '2021-02-21 14:34:53', '2021-02-21 14:34:53'),
(16, 'seeker@jobsportal.com', 'Sharjeel Anjum', '2023-05-21 13:10:10', '2023-05-21 13:10:10');

-- --------------------------------------------------------

--
-- Table structure for table `success_jobs`
--

CREATE TABLE `success_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` enum('Male','Female') NOT NULL,
  `image` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `pri_position` varchar(255) DEFAULT NULL,
  `curr_position` varchar(255) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `is_feature` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `success_jobs`
--

INSERT INTO `success_jobs` (`id`, `name`, `age`, `gender`, `image`, `description`, `pri_position`, `curr_position`, `is_active`, `is_feature`, `created_at`, `updated_at`) VALUES
(1, 'ALさん', 28, 'Male', '1686053032.png', '私自身のキャリアと私の経験を必要とする企業とのマッチングを可能にしてくれたらBhalojob.comは多くの選択肢と情報を提供してくれました。本当にサイト登録してよかったと思っています。一つのチャンスを得る事が出来たことで今の日本でのITエンジニアとして、さらなる経験とキャリアを積む事ができる環境で仕事ができていることはとても嬉しく思います。Bhalojob.comを利用して夢を掴みました。', 'ITエンジニア', 'ITエンジニア', 1, 1, '2023-06-04 05:29:17', '2023-06-06 16:07:47'),
(2, 'Aさん', 25, 'Male', '1686052114.png', '私は人文知識・国際業務ビザで日本に滞在しています。 Bhalojob.comを通して日本での仕事を得ることが出来、夢が叶いました。Bhalojob.comは私の希望の職種の企業とマッチングすることが出来、今の日本での経験を手に入れる事ができました。私は2018年にファッションデザイン学科を卒業し、その後アパレル分野で2年間の勤務経験を積みました。 Bhalojob.comのおかげで、日本で希望の仕事に就くことができ他事に感謝しています。', 'ファッション業', '物流', 1, 1, '2023-06-06 15:48:14', '2023-06-06 15:57:54'),
(3, 'Rさん', 26, 'Male', '1686052200.png', 'チッタゴン大学で修士号を取得した後、自分自身の力を試したいと思い、海外でチャレンジをして見たいという思いが出てきました。私はどの国でキャリアを築くことができるかをネットで調べたところBhalojob.com を見つけました。日本での就職、在留資格、語学教育などを扱うサイトです。 その後、Bhalojob.comに登録したあとにサイトからのアドバイスに従って、自分自身の希望が叶う方向で方向性を決めました。私は一番望みに合う語学学校で日本語を学びました。その後Bhalojob.comを通して就職を得る事ができ、5年間のビザを取得し大好きな日本で毎日仕事をしています。本当にBhalojob.comを利用してよかったです。', 'ファッション業', '物流', 1, 1, '2023-06-06 15:50:00', '2023-06-06 15:58:37');

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(10) UNSIGNED NOT NULL,
  `testimonial_id` int(11) DEFAULT 0,
  `testimonial_by` varchar(100) DEFAULT NULL,
  `testimonial` varchar(600) DEFAULT NULL,
  `company` varchar(150) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `testimonials`
--

INSERT INTO `testimonials` (`id`, `testimonial_id`, `testimonial_by`, `testimonial`, `company`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Garry Miller Jr', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem.', 'CEO - Gates Inc', 1, 1, 1, 'en', '2018-09-11 17:30:10', '2018-09-19 01:18:31'),
(2, 2, 'John Doe', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed pretium nunc non justo placerat pulvinar. Vestibulum ac ullamcorper sapien, nec scelerisque ipsum. Aliquam in tempus nulla. Curabitur ac pulvinar elit. Donec sed iaculis lorem.', 'PM, Google.com', 1, 1, 2, 'en', '2018-09-11 17:31:43', '2018-09-19 01:18:43');

-- --------------------------------------------------------

--
-- Table structure for table `unlocked_users`
--

CREATE TABLE `unlocked_users` (
  `id` int(10) UNSIGNED NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `unlocked_users_ids` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `first_name` varchar(100) DEFAULT NULL,
  `middle_name` varchar(100) DEFAULT NULL,
  `last_name` varchar(100) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `father_name` varchar(100) DEFAULT NULL,
  `date_of_birth` date DEFAULT NULL,
  `gender_id` int(11) DEFAULT NULL,
  `marital_status_id` int(11) DEFAULT NULL,
  `nationality_id` int(11) DEFAULT NULL,
  `national_id_card_number` varchar(100) DEFAULT NULL,
  `country_id` varchar(50) DEFAULT NULL,
  `state_id` varchar(50) DEFAULT NULL,
  `city_id` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `mobile_num` varchar(25) DEFAULT NULL,
  `job_experience_id` int(11) DEFAULT NULL,
  `career_level_id` int(11) DEFAULT NULL,
  `industry_id` int(11) DEFAULT NULL,
  `functional_area_id` int(11) DEFAULT NULL,
  `current_salary` varchar(100) DEFAULT NULL,
  `expected_salary` varchar(100) DEFAULT NULL,
  `salary_currency` varchar(10) DEFAULT NULL,
  `street_address` tinytext DEFAULT NULL,
  `is_active` int(11) DEFAULT 0,
  `verified` tinyint(1) NOT NULL DEFAULT 0,
  `verification_token` varchar(255) DEFAULT NULL,
  `provider` varchar(35) DEFAULT NULL,
  `provider_id` varchar(255) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `image` varchar(100) DEFAULT NULL,
  `cover_image` varchar(100) DEFAULT NULL,
  `lang` varchar(10) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_immediate_available` tinyint(1) DEFAULT 1,
  `num_profile_views` int(11) DEFAULT 0,
  `package_id` int(11) DEFAULT 0,
  `package_start_date` timestamp NULL DEFAULT NULL,
  `package_end_date` timestamp NULL DEFAULT NULL,
  `jobs_quota` int(11) DEFAULT 0,
  `availed_jobs_quota` int(11) DEFAULT 0,
  `search` text DEFAULT NULL,
  `permanent_address` tinytext DEFAULT NULL,
  `jplanguage_level` tinyint(4) DEFAULT NULL,
  `last_education` tinyint(4) DEFAULT NULL,
  `is_subscribed` tinyint(1) DEFAULT 1,
  `video_link` text DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `google_id` varchar(255) DEFAULT NULL,
  `facebook_id` varchar(255) DEFAULT NULL,
  `birth_year` varchar(255) DEFAULT NULL,
  `birth_month` varchar(255) DEFAULT NULL,
  `birth_day` varchar(255) DEFAULT NULL,
  `jp_cell_phone` varchar(255) DEFAULT NULL,
  `emergency_contact_jp` varchar(255) DEFAULT NULL,
  `current_visa_status_id` int(11) DEFAULT NULL,
  `emergency_cell_phone` varchar(255) DEFAULT NULL,
  `jp_visa_expiry_year` varchar(255) DEFAULT NULL,
  `jp_visa_expiry_month` varchar(255) DEFAULT NULL,
  `jp_visa_expiry_day` varchar(255) DEFAULT NULL,
  `country_id_bd` int(11) DEFAULT NULL,
  `state_id_bd` int(11) DEFAULT NULL,
  `city_id_bd` int(11) DEFAULT NULL,
  `bd_postal_code` varchar(255) DEFAULT NULL,
  `bd_address` varchar(255) DEFAULT NULL,
  `bd_cell_phone` varchar(255) DEFAULT NULL,
  `bd_children` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `middle_name`, `last_name`, `name`, `email`, `father_name`, `date_of_birth`, `gender_id`, `marital_status_id`, `nationality_id`, `national_id_card_number`, `country_id`, `state_id`, `city_id`, `phone`, `mobile_num`, `job_experience_id`, `career_level_id`, `industry_id`, `functional_area_id`, `current_salary`, `expected_salary`, `salary_currency`, `street_address`, `is_active`, `verified`, `verification_token`, `provider`, `provider_id`, `password`, `remember_token`, `image`, `cover_image`, `lang`, `created_at`, `updated_at`, `is_immediate_available`, `num_profile_views`, `package_id`, `package_start_date`, `package_end_date`, `jobs_quota`, `availed_jobs_quota`, `search`, `permanent_address`, `jplanguage_level`, `last_education`, `is_subscribed`, `video_link`, `email_verified_at`, `google_id`, `facebook_id`, `birth_year`, `birth_month`, `birth_day`, `jp_cell_phone`, `emergency_contact_jp`, `current_visa_status_id`, `emergency_cell_phone`, `jp_visa_expiry_year`, `jp_visa_expiry_month`, `jp_visa_expiry_day`, `country_id_bd`, `state_id_bd`, `city_id_bd`, `bd_postal_code`, `bd_address`, `bd_cell_phone`, `bd_children`) VALUES
(5, 'jobseeker14', NULL, 'no', 'jobseeker14 no', 'jameswilliam6252@gmail.com', 'NA', '1989-03-08', 2, 2, 4, '1234567890', '231', '3924', '43242', '132456789', '1324564798', 9, 3, 1, 23, '90000', '120000', 'USD', 'testet San Joes', 1, 1, '0a7be120dcca05e401c6a240f5953a063b30422a43f4ce11c8718ac9252c8662', NULL, NULL, '$2y$10$QNkxVp57f4XziVCfJA3yAeWMCnmVt.Xd5qdLkfivZARYKN/FarVie', 'ERMVgmE05HUeop38bBru8iAcjE15znIhq4NxjUvDK2c01qo4TFx0rLZWZ3j4', NULL, NULL, NULL, '2018-08-29 05:12:54', '2021-08-11 11:33:32', 1, 61, 5, '2018-10-19 00:47:49', '2018-11-18 01:47:49', 10, 0, 'jobseeker14 no United States of America California San Jose NA 1989-03-08 132456789 1324564798 Male 8 Year 90000 - 120000 Experienced Professional Information Technology Creative Design testet San Joes  Adobe Illustrator Adobe Photoshop Java', '', 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(6, 'Sharjeel', NULL, 'Anjum', 'Sharjeel Anjum', 'seeker@jobsportal.com', 'test', '2009-06-09', 2, 4, 1, '1234567890', '1', NULL, NULL, '+1234567890', '+1324564798', 7, 3, 8, 2, '6000', '10000', 'USD', 'Dummy Street Address 123 USA', 1, 1, NULL, NULL, NULL, '$2y$10$aCqC6qD5vp/awpubO3Brv.NmvgXaFUQuhI5gPGo3rXVmlEsCK3erq', '2moknePrb44FiFTskzR5NMryclaz0y0SPijktiMMjN2WX8oLyDbVVoCR2n2a', '-1684707009-551.jpeg', '-1614188466-122.jpg', NULL, '2018-09-19 01:28:41', '2023-06-08 17:15:00', 1, 105, 5, '2021-08-10 05:09:21', '2021-09-09 05:09:21', 10, 1, 'Sharjeel Anjum bangladesh Dhaka Tangail test 2009-06-09 +1234567890 +1324564798 Male 6 Year 6000 - 10000 Experienced Professional Accounting/Taxation Accounts, Finance & Financial Services Dummy Street Address 123 USA  Adobe Illustrator Adobe Photoshop Communication Skills CSS HTML JavaScript Jquery WordPress', '', 0, 0, 1, 'https://www.youtube.com/embed/538cRSPrwZU', NULL, NULL, NULL, 'Year', '1', '1', NULL, NULL, 1, NULL, '1', '1', '1', 1, NULL, NULL, 'sdfsdfd', 'dsfsdf', '43543543', '4353534'),
(7, NULL, NULL, NULL, '', 'hello@moin.tokyo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, NULL, '$2y$10$ZH1yK0G5D88wbvIOPhUwsO.KDcPsdZZOhhGNhiF5.xL6jdyZfd/cC', NULL, NULL, NULL, NULL, '2023-06-05 10:15:58', '2023-06-05 10:15:58', 1, 0, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_messages`
--

CREATE TABLE `user_messages` (
  `id` int(10) UNSIGNED NOT NULL,
  `listing_id` int(11) DEFAULT NULL,
  `listing_title` varchar(150) DEFAULT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `to_email` varchar(100) DEFAULT NULL,
  `to_name` varchar(100) DEFAULT NULL,
  `from_name` varchar(100) DEFAULT NULL,
  `from_email` varchar(100) DEFAULT NULL,
  `from_phone` varchar(20) DEFAULT NULL,
  `message_txt` mediumtext DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(10) UNSIGNED NOT NULL,
  `video_id` int(11) DEFAULT 0,
  `video_title` tinytext DEFAULT NULL,
  `video_text` text DEFAULT NULL,
  `video_link` text DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 0,
  `is_active` tinyint(1) DEFAULT NULL,
  `sort_order` int(11) DEFAULT 99999,
  `lang` varchar(10) DEFAULT 'en',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci ROW_FORMAT=COMPACT;

--
-- Dumping data for table `videos`
--

INSERT INTO `videos` (`id`, `video_id`, `video_title`, `video_text`, `video_link`, `is_default`, `is_active`, `sort_order`, `lang`, `created_at`, `updated_at`) VALUES
(1, 1, 'Turn a challenge into a chance', 'Our partners make Milestone products more dynamic and integrations push the limits of what is possible. XProtect® software protects animals from known poachers and protects the city of Minneapolis.', 'https://www.youtube.com/embed/FxiskmF16gU?rel=0&modestbranding=1&autohide=1&showinfo=0&controls=0', 1, 1, 1, 'en', '2018-09-11 11:41:33', '2019-10-21 01:06:52'),
(2, 1, 'تحويل التحدي إلى فرصة', 'يعمل شركاؤنا على جعل منتجات Milestone أكثر ديناميكية وتكاملًا يدفع حدود ما هو ممكن. يحمي برنامج XProtect® الحيوانات من الصيادين المعروفين ويحمي مدينة مينيابوليس.', 'https://youtu.be/EU7PRmCpx-0', 0, 1, 2, 'ar', '2018-09-11 11:45:04', '2018-09-19 01:21:03'),
(3, 1, 'Convierta un desafío en una oportunidad', 'Nuestros socios hacen que los productos de Milestone sean más dinámicos y las integraciones superan los límites de lo que es posible. El software XProtect® protege a los animales de los cazadores furtivos conocidos y protege la ciudad de Minneapolis.', 'https://youtu.be/EU7PRmCpx-0', 0, 1, 3, 'es', '2018-09-11 11:46:14', '2018-09-19 01:21:07'),
(4, 1, 'چیلنج کو ایک موقع میں تبدیل کریں', 'ہمارا شراکت دار میل میلون کی مصنوعات کو زیادہ متحرک اور انضمام بناتا ہے جو ممکن ہے اس کی حدود کو فروغ دیں. XProtect ® سافٹ ویئر جانوروں کو معروف خلیوں سے محفوظ رکھتا ہے اور منینیپولیس شہر کی حفاظت کرتا ہے.', 'https://youtu.be/EU7PRmCpx-0', 0, 1, 4, 'ur', '2018-09-11 11:46:19', '2018-09-19 01:21:11');

-- --------------------------------------------------------

--
-- Table structure for table `widgets`
--

CREATE TABLE `widgets` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `widget_page_id` int(10) UNSIGNED NOT NULL,
  `is_description` longtext DEFAULT NULL,
  `extra_fields` longtext DEFAULT NULL,
  `extra_field_title_1` varchar(255) DEFAULT NULL,
  `extra_field_title_2` varchar(255) DEFAULT NULL,
  `extra_field_title_3` varchar(255) DEFAULT NULL,
  `extra_field_title_4` varchar(255) DEFAULT NULL,
  `extra_field_title_5` varchar(255) DEFAULT NULL,
  `extra_field_title_6` varchar(255) DEFAULT NULL,
  `extra_field_title_7` varchar(255) DEFAULT NULL,
  `is_extra_image_title_1` varchar(255) DEFAULT NULL,
  `extra_image_title_1` varchar(255) DEFAULT NULL,
  `extra_image_1_height` varchar(255) DEFAULT NULL,
  `extra_image_1_width` varchar(255) DEFAULT NULL,
  `is_extra_image_title_2` varchar(255) DEFAULT NULL,
  `extra_image_title_2` varchar(255) DEFAULT NULL,
  `extra_image_2_height` varchar(255) DEFAULT NULL,
  `extra_image_2_width` varchar(255) DEFAULT NULL,
  `status` enum('active','blocked') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widgets_data`
--

CREATE TABLE `widgets_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `widget_id` int(10) UNSIGNED NOT NULL,
  `description` longtext DEFAULT NULL,
  `extra_field_1` varchar(255) DEFAULT NULL,
  `extra_field_2` varchar(255) DEFAULT NULL,
  `extra_field_3` varchar(255) DEFAULT NULL,
  `extra_field_4` varchar(255) DEFAULT NULL,
  `extra_field_5` varchar(255) DEFAULT NULL,
  `extra_field_6` varchar(255) DEFAULT NULL,
  `extra_field_7` varchar(255) DEFAULT NULL,
  `extra_field_8` varchar(255) DEFAULT NULL,
  `extra_field_9` varchar(255) DEFAULT NULL,
  `extra_field_10` varchar(255) DEFAULT NULL,
  `extra_field_11` varchar(255) DEFAULT NULL,
  `extra_field_12` varchar(255) DEFAULT NULL,
  `extra_field_13` varchar(255) DEFAULT NULL,
  `extra_field_14` varchar(255) DEFAULT NULL,
  `extra_field_15` varchar(255) DEFAULT NULL,
  `extra_field_16` varchar(255) DEFAULT NULL,
  `extra_field_17` varchar(255) DEFAULT NULL,
  `extra_field_18` varchar(255) DEFAULT NULL,
  `extra_field_19` varchar(255) DEFAULT NULL,
  `extra_field_20` varchar(255) DEFAULT NULL,
  `extra_image_1` varchar(255) DEFAULT NULL,
  `extra_image_2` varchar(255) DEFAULT NULL,
  `radio_button_1` tinyint(4) DEFAULT 0,
  `radio_button_2` tinyint(4) DEFAULT 0,
  `radio_button_3` tinyint(4) DEFAULT 0,
  `status` enum('active','blocked') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `widget_pages`
--

CREATE TABLE `widget_pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `status` enum('active','blocked') NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `widget_pages`
--

INSERT INTO `widget_pages` (`id`, `title`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Home Page Content', 'home-page-content', 'active', '2021-08-11 06:39:24', '2021-08-11 06:39:24');

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE `years` (
  `id` int(11) NOT NULL,
  `year_value` varchar(33) DEFAULT NULL,
  `jp_year_value` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `years`
--

INSERT INTO `years` (`id`, `year_value`, `jp_year_value`) VALUES
(1, '2000', '二千'),
(2, '2001', '二千一'),
(3, '2002', '二千二'),
(4, '2003', '二千三'),
(5, '2004', '二千四'),
(6, '2005', '二千五'),
(7, '2006', '二千六'),
(8, '2007', '二千七'),
(9, '2008', '二千八'),
(10, '2009', '二千九'),
(11, '2010', '二千十'),
(12, '2011', '二千十一'),
(13, '2012', '二千十二'),
(14, '2013', '二千十三'),
(15, '2014', '二千十四'),
(16, '2015', '二千十五'),
(17, '2016', '二千十六'),
(18, '2017', '二千十七'),
(19, '2018', '二千十八'),
(20, '2019', '二千十九'),
(21, '2020', '二千二十'),
(22, '2021', '二千二十一'),
(23, '2022', '二千二十二'),
(24, '2023', '二千二十三'),
(25, '2024', '二千二十四'),
(26, '2025', '二千二十五'),
(27, '2026', '二千二十六'),
(28, '2027', '二千二十七'),
(29, '2028', '二千二十八'),
(30, '2029', '二千二十九');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_detail`
--
ALTER TABLE `about_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD KEY `admin_password_resets_email_index` (`email`),
  ADD KEY `admin_password_resets_token_index` (`token`);

--
-- Indexes for table `applicant_messages`
--
ALTER TABLE `applicant_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `career_levels`
--
ALTER TABLE `career_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `case_studies`
--
ALTER TABLE `case_studies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms_content`
--
ALTER TABLE `cms_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_messages`
--
ALTER TABLE `company_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company_password_resets`
--
ALTER TABLE `company_password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries_details`
--
ALTER TABLE `countries_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currentVisas`
--
ALTER TABLE `currentVisas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `degree_levels`
--
ALTER TABLE `degree_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `degree_types`
--
ALTER TABLE `degree_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqcategories`
--
ALTER TABLE `faqcategories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourites_company`
--
ALTER TABLE `favourites_company`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourites_job`
--
ALTER TABLE `favourites_job`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favourite_applicants`
--
ALTER TABLE `favourite_applicants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `featureds`
--
ALTER TABLE `featureds`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `functional_areas`
--
ALTER TABLE `functional_areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `genders`
--
ALTER TABLE `genders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `growths`
--
ALTER TABLE `growths`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `industries`
--
ALTER TABLE `industries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`);
ALTER TABLE `jobs` ADD FULLTEXT KEY `full_search` (`search`);

--
-- Indexes for table `job_alerts`
--
ALTER TABLE `job_alerts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_apply`
--
ALTER TABLE `job_apply`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_apply_rejected`
--
ALTER TABLE `job_apply_rejected`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_experiences`
--
ALTER TABLE `job_experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_industries`
--
ALTER TABLE `job_industries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_places`
--
ALTER TABLE `job_places`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_services`
--
ALTER TABLE `job_services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_shifts`
--
ALTER TABLE `job_shifts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_skills`
--
ALTER TABLE `job_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_sub_categories`
--
ALTER TABLE `job_sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_titles`
--
ALTER TABLE `job_titles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_types`
--
ALTER TABLE `job_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languagetypes`
--
ALTER TABLE `languagetypes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_converts`
--
ALTER TABLE `language_converts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_level`
--
ALTER TABLE `language_level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `language_levels`
--
ALTER TABLE `language_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `major_subjects`
--
ALTER TABLE `major_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `manage_job_skills`
--
ALTER TABLE `manage_job_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merits`
--
ALTER TABLE `merits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `merit_details`
--
ALTER TABLE `merit_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `months`
--
ALTER TABLE `months`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ownership_types`
--
ALTER TABLE `ownership_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payu_transactions`
--
ALTER TABLE `payu_transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_cvs`
--
ALTER TABLE `profile_cvs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_educations`
--
ALTER TABLE `profile_educations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_education_major_subjects`
--
ALTER TABLE `profile_education_major_subjects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_experiences`
--
ALTER TABLE `profile_experiences`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_languages`
--
ALTER TABLE `profile_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_projects`
--
ALTER TABLE `profile_projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_skills`
--
ALTER TABLE `profile_skills`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profile_summaries`
--
ALTER TABLE `profile_summaries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `queue_jobs`
--
ALTER TABLE `queue_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_abuse_company_messages`
--
ALTER TABLE `report_abuse_company_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report_abuse_messages`
--
ALTER TABLE `report_abuse_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `result_types`
--
ALTER TABLE `result_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_periods`
--
ALTER TABLE `salary_periods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `send_to_friend_messages`
--
ALTER TABLE `send_to_friend_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `seo`
--
ALTER TABLE `seo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sliders`
--
ALTER TABLE `sliders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `success_jobs`
--
ALTER TABLE `success_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unlocked_users`
--
ALTER TABLE `unlocked_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);
ALTER TABLE `users` ADD FULLTEXT KEY `full_search` (`search`);

--
-- Indexes for table `user_messages`
--
ALTER TABLE `user_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `widgets`
--
ALTER TABLE `widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_widget_page_id_foreign` (`widget_page_id`);

--
-- Indexes for table `widgets_data`
--
ALTER TABLE `widgets_data`
  ADD PRIMARY KEY (`id`),
  ADD KEY `widgets_data_widget_id_foreign` (`widget_id`);

--
-- Indexes for table `widget_pages`
--
ALTER TABLE `widget_pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `years`
--
ALTER TABLE `years`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_detail`
--
ALTER TABLE `about_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `applicant_messages`
--
ALTER TABLE `applicant_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `career_levels`
--
ALTER TABLE `career_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `case_studies`
--
ALTER TABLE `case_studies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cms_content`
--
ALTER TABLE `cms_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company_messages`
--
ALTER TABLE `company_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `countries_details`
--
ALTER TABLE `countries_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `currentVisas`
--
ALTER TABLE `currentVisas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `days`
--
ALTER TABLE `days`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `degree_levels`
--
ALTER TABLE `degree_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `degree_types`
--
ALTER TABLE `degree_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faqcategories`
--
ALTER TABLE `faqcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `favourites_company`
--
ALTER TABLE `favourites_company`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `favourites_job`
--
ALTER TABLE `favourites_job`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `favourite_applicants`
--
ALTER TABLE `favourite_applicants`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `featureds`
--
ALTER TABLE `featureds`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `functional_areas`
--
ALTER TABLE `functional_areas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=587;

--
-- AUTO_INCREMENT for table `genders`
--
ALTER TABLE `genders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `growths`
--
ALTER TABLE `growths`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `industries`
--
ALTER TABLE `industries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=230;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `job_alerts`
--
ALTER TABLE `job_alerts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `job_apply`
--
ALTER TABLE `job_apply`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `job_apply_rejected`
--
ALTER TABLE `job_apply_rejected`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `job_experiences`
--
ALTER TABLE `job_experiences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `job_industries`
--
ALTER TABLE `job_industries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job_places`
--
ALTER TABLE `job_places`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `job_services`
--
ALTER TABLE `job_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `job_shifts`
--
ALTER TABLE `job_shifts`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `job_skills`
--
ALTER TABLE `job_skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=77;

--
-- AUTO_INCREMENT for table `job_sub_categories`
--
ALTER TABLE `job_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `job_titles`
--
ALTER TABLE `job_titles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `job_types`
--
ALTER TABLE `job_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `languagetypes`
--
ALTER TABLE `languagetypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `language_converts`
--
ALTER TABLE `language_converts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `language_level`
--
ALTER TABLE `language_level`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language_levels`
--
ALTER TABLE `language_levels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT for table `major_subjects`
--
ALTER TABLE `major_subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1733;

--
-- AUTO_INCREMENT for table `manage_job_skills`
--
ALTER TABLE `manage_job_skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=382;

--
-- AUTO_INCREMENT for table `marital_statuses`
--
ALTER TABLE `marital_statuses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `merits`
--
ALTER TABLE `merits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `merit_details`
--
ALTER TABLE `merit_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `months`
--
ALTER TABLE `months`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `ownership_types`
--
ALTER TABLE `ownership_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `payu_transactions`
--
ALTER TABLE `payu_transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `profile_cvs`
--
ALTER TABLE `profile_cvs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `profile_educations`
--
ALTER TABLE `profile_educations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `profile_education_major_subjects`
--
ALTER TABLE `profile_education_major_subjects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `profile_experiences`
--
ALTER TABLE `profile_experiences`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `profile_languages`
--
ALTER TABLE `profile_languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `profile_projects`
--
ALTER TABLE `profile_projects`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `profile_skills`
--
ALTER TABLE `profile_skills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `profile_summaries`
--
ALTER TABLE `profile_summaries`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `queue_jobs`
--
ALTER TABLE `queue_jobs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report_abuse_company_messages`
--
ALTER TABLE `report_abuse_company_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `report_abuse_messages`
--
ALTER TABLE `report_abuse_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `result_types`
--
ALTER TABLE `result_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `salary_periods`
--
ALTER TABLE `salary_periods`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `send_to_friend_messages`
--
ALTER TABLE `send_to_friend_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `seo`
--
ALTER TABLE `seo`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `site_settings`
--
ALTER TABLE `site_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1273;

--
-- AUTO_INCREMENT for table `sliders`
--
ALTER TABLE `sliders`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `statistics`
--
ALTER TABLE `statistics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `success_jobs`
--
ALTER TABLE `success_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `unlocked_users`
--
ALTER TABLE `unlocked_users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_messages`
--
ALTER TABLE `user_messages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `widgets`
--
ALTER TABLE `widgets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `widgets_data`
--
ALTER TABLE `widgets_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `widget_pages`
--
ALTER TABLE `widget_pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `years`
--
ALTER TABLE `years`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
