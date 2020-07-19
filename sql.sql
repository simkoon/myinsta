-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- insta 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `insta` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `insta`;

-- 테이블 insta.tb_blockid 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_blockid` (
  `bl_idx` bigint(20) NOT NULL AUTO_INCREMENT,
  `bl_useridx` bigint(20) NOT NULL,
  `bl_followingid` varchar(20) NOT NULL,
  PRIMARY KEY (`bl_idx`),
  UNIQUE KEY `bl_followingid` (`bl_followingid`),
  KEY `bl_useridx` (`bl_useridx`),
  CONSTRAINT `tb_blockid_ibfk_1` FOREIGN KEY (`bl_useridx`) REFERENCES `tb_member` (`m_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 insta.tb_blockid:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_blockid` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_blockid` ENABLE KEYS */;

-- 테이블 insta.tb_comment 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_comment` (
  `co_idx` bigint(20) NOT NULL AUTO_INCREMENT,
  `co_useridx` bigint(20) NOT NULL,
  `co_mcidx` bigint(20) NOT NULL,
  `co_text` text NOT NULL,
  `co_regdate` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`co_idx`),
  KEY `co_useridx` (`co_useridx`),
  KEY `co_mcidx` (`co_mcidx`),
  CONSTRAINT `tb_comment_ibfk_1` FOREIGN KEY (`co_useridx`) REFERENCES `tb_member` (`m_idx`),
  CONSTRAINT `tb_comment_ibfk_2` FOREIGN KEY (`co_mcidx`) REFERENCES `tb_mycontent` (`mc_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- 테이블 데이터 insta.tb_comment:~71 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_comment` DISABLE KEYS */;
INSERT INTO `tb_comment` (`co_idx`, `co_useridx`, `co_mcidx`, `co_text`, `co_regdate`) VALUES
	(1, 1, 5, '첫번째 댓글', '2020-07-08 00:00:00'),
	(2, 4, 5, '2th comment', '2020-07-08 00:00:00'),
	(3, 3, 5, 'hihi', '2020-07-08 14:27:56'),
	(4, 4, 2, '', '2020-07-09 17:10:33'),
	(5, 4, 2, '', '2020-07-09 17:12:48'),
	(6, 4, 2, '', '2020-07-09 17:12:54'),
	(7, 4, 2, '', '2020-07-09 17:13:39'),
	(8, 4, 2, '', '2020-07-09 17:14:35'),
	(9, 4, 4, '123', '2020-07-09 17:17:01'),
	(10, 4, 4, '123', '2020-07-09 17:26:11'),
	(11, 4, 4, '123', '2020-07-09 17:27:01'),
	(12, 4, 4, '123', '2020-07-09 17:27:04'),
	(13, 4, 4, '123', '2020-07-09 17:27:05'),
	(14, 4, 4, '123', '2020-07-09 17:27:06'),
	(15, 4, 4, '123', '2020-07-09 17:27:07'),
	(16, 4, 6, '123', '2020-07-09 17:28:31'),
	(17, 4, 6, '123', '2020-07-09 17:28:34'),
	(18, 4, 2, '123', '2020-07-09 17:32:58'),
	(19, 4, 2, '123', '2020-07-09 17:35:32'),
	(20, 4, 2, '123', '2020-07-09 18:00:30'),
	(21, 4, 2, '123', '2020-07-09 18:00:31'),
	(22, 4, 2, '123', '2020-07-09 18:00:32'),
	(23, 4, 2, '123', '2020-07-09 18:00:41'),
	(24, 4, 2, '123123', '2020-07-09 18:01:18'),
	(25, 4, 2, '123', '2020-07-09 18:03:57'),
	(26, 4, 2, '123123', '2020-07-09 18:11:34'),
	(27, 4, 2, '123123', '2020-07-09 18:11:39'),
	(28, 4, 2, '123123', '2020-07-09 18:11:56'),
	(29, 4, 2, '123', '2020-07-09 18:12:12'),
	(30, 4, 2, '123', '2020-07-10 18:44:16'),
	(31, 4, 2, '', '2020-07-10 18:46:00'),
	(32, 4, 2, '', '2020-07-10 18:46:00'),
	(33, 4, 2, '', '2020-07-10 18:46:01'),
	(34, 4, 2, '', '2020-07-10 18:46:01'),
	(35, 4, 2, '', '2020-07-10 18:46:01'),
	(36, 4, 2, '', '2020-07-10 18:46:02'),
	(37, 4, 2, '', '2020-07-10 18:46:02'),
	(38, 4, 2, '', '2020-07-10 18:46:02'),
	(39, 4, 2, '', '2020-07-10 18:46:02'),
	(40, 4, 2, '', '2020-07-10 18:46:02'),
	(41, 4, 2, '', '2020-07-10 18:46:23'),
	(42, 4, 2, '', '2020-07-10 18:46:23'),
	(43, 4, 4, '', '2020-07-10 18:46:56'),
	(44, 4, 4, '', '2020-07-10 18:46:58'),
	(45, 4, 4, '', '2020-07-10 18:46:58'),
	(46, 4, 4, '', '2020-07-10 18:46:59'),
	(47, 4, 4, '', '2020-07-10 18:46:59'),
	(48, 4, 4, '', '2020-07-10 18:46:59'),
	(49, 4, 4, '', '2020-07-10 18:46:59'),
	(50, 4, 4, '', '2020-07-10 18:47:00'),
	(51, 4, 4, '', '2020-07-10 18:47:00'),
	(52, 4, 4, '', '2020-07-10 18:47:00'),
	(53, 4, 4, '', '2020-07-10 18:47:20'),
	(54, 4, 4, '', '2020-07-10 18:47:20'),
	(55, 4, 4, '', '2020-07-10 18:47:20'),
	(56, 4, 4, '', '2020-07-10 18:47:20'),
	(57, 4, 4, '', '2020-07-10 18:47:20'),
	(58, 4, 4, '', '2020-07-10 18:47:21'),
	(59, 4, 4, '', '2020-07-10 18:47:21'),
	(60, 4, 4, '', '2020-07-10 18:47:21'),
	(61, 4, 4, '', '2020-07-10 18:47:21'),
	(62, 4, 2, '123', '2020-07-10 19:07:14'),
	(63, 4, 2, '123123', '2020-07-10 19:17:13'),
	(64, 4, 2, '444444', '2020-07-10 19:17:16'),
	(65, 4, 4, 'hihi', '2020-07-10 19:26:08'),
	(66, 4, 8, 'hihi', '2020-07-10 19:28:55'),
	(67, 4, 8, '#hihi 안녕하세요', '2020-07-10 19:29:36'),
	(68, 4, 6, '#ㅗㅑㅑ', '2020-07-10 19:29:54'),
	(69, 4, 7, '#ㅗㅑㅗㅑ', '2020-07-10 19:30:28'),
	(70, 4, 4, '123123', '2020-07-10 19:41:17'),
	(71, 4, 55, 'hi', '2020-07-13 11:06:23'),
	(72, 4, 55, 'hi', '2020-07-13 11:06:41'),
	(73, 4, 96, 'hi', '2020-07-14 14:00:30'),
	(74, 4, 96, 'dfwefwe', '2020-07-14 14:02:20'),
	(75, 4, 96, 'qweqe', '2020-07-14 14:02:22'),
	(76, 4, 96, 'wqewqewqe', '2020-07-14 14:02:24'),
	(77, 4, 96, 'wqeqwe', '2020-07-14 14:02:25');
/*!40000 ALTER TABLE `tb_comment` ENABLE KEYS */;

-- 테이블 insta.tb_directmsg 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_directmsg` (
  `dm_idx` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_useridx` bigint(20) NOT NULL,
  `dm_content` text DEFAULT NULL,
  `dm_touseridx` bigint(20) NOT NULL,
  PRIMARY KEY (`dm_idx`),
  KEY `dm_useridx` (`dm_useridx`),
  KEY `dm_touseridx` (`dm_touseridx`),
  CONSTRAINT `tb_directmsg_ibfk_1` FOREIGN KEY (`dm_useridx`) REFERENCES `tb_member` (`m_idx`),
  CONSTRAINT `tb_directmsg_ibfk_2` FOREIGN KEY (`dm_touseridx`) REFERENCES `tb_member` (`m_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 insta.tb_directmsg:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_directmsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_directmsg` ENABLE KEYS */;

-- 테이블 insta.tb_follower 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_follower` (
  `fr_idx` bigint(20) NOT NULL AUTO_INCREMENT,
  `fr_useridx` bigint(20) NOT NULL,
  `fr_followerid` varchar(20) NOT NULL,
  `fr_regdate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`fr_idx`),
  UNIQUE KEY `fr_followerid` (`fr_followerid`),
  KEY `fr_useridx` (`fr_useridx`),
  CONSTRAINT `tb_follower_ibfk_1` FOREIGN KEY (`fr_useridx`) REFERENCES `tb_member` (`m_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 insta.tb_follower:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_follower` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_follower` ENABLE KEYS */;

-- 테이블 insta.tb_following 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_following` (
  `fi_idx` bigint(20) NOT NULL AUTO_INCREMENT,
  `fi_useridx` bigint(20) NOT NULL,
  `fi_followingid` bigint(20) NOT NULL,
  `fi_regdate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`fi_idx`),
  KEY `fi_useridx` (`fi_useridx`),
  KEY `fi_followingid` (`fi_followingid`) USING BTREE,
  CONSTRAINT `FK_tb_following_tb_member` FOREIGN KEY (`fi_followingid`) REFERENCES `tb_member` (`m_idx`),
  CONSTRAINT `tb_following_ibfk_1` FOREIGN KEY (`fi_useridx`) REFERENCES `tb_member` (`m_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- 테이블 데이터 insta.tb_following:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_following` DISABLE KEYS */;
INSERT INTO `tb_following` (`fi_idx`, `fi_useridx`, `fi_followingid`, `fi_regdate`) VALUES
	(1, 4, 1, '2020-07-13 09:31:41'),
	(2, 4, 5, '2020-07-13 09:37:29');
/*!40000 ALTER TABLE `tb_following` ENABLE KEYS */;

-- 테이블 insta.tb_hiddenid 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_hiddenid` (
  `hi_idx` bigint(20) NOT NULL AUTO_INCREMENT,
  `hi_useridx` bigint(20) NOT NULL,
  `hi_followingid` varchar(20) NOT NULL,
  PRIMARY KEY (`hi_idx`),
  UNIQUE KEY `hi_followingid` (`hi_followingid`),
  KEY `hi_useridx` (`hi_useridx`),
  CONSTRAINT `tb_hiddenid_ibfk_1` FOREIGN KEY (`hi_useridx`) REFERENCES `tb_follower` (`fr_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 insta.tb_hiddenid:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_hiddenid` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_hiddenid` ENABLE KEYS */;

-- 테이블 insta.tb_like 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_like` (
  `l_idx` bigint(20) NOT NULL AUTO_INCREMENT,
  `l_useridx` bigint(20) NOT NULL,
  `l_mcidx` bigint(20) NOT NULL,
  PRIMARY KEY (`l_idx`),
  KEY `l_useridx` (`l_useridx`),
  KEY `l_mcidx` (`l_mcidx`),
  CONSTRAINT `tb_like_ibfk_1` FOREIGN KEY (`l_useridx`) REFERENCES `tb_member` (`m_idx`),
  CONSTRAINT `tb_like_ibfk_2` FOREIGN KEY (`l_mcidx`) REFERENCES `tb_mycontent` (`mc_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8;

-- 테이블 데이터 insta.tb_like:~7 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_like` DISABLE KEYS */;
INSERT INTO `tb_like` (`l_idx`, `l_useridx`, `l_mcidx`) VALUES
	(34, 4, 63),
	(38, 4, 67),
	(118, 5, 5),
	(122, 4, 11),
	(136, 4, 6),
	(145, 4, 7),
	(154, 4, 5),
	(157, 4, 87);
/*!40000 ALTER TABLE `tb_like` ENABLE KEYS */;

-- 테이블 insta.tb_logintime 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_logintime` (
  `lt_userid` varchar(20) NOT NULL,
  `lt_useridx` bigint(20) NOT NULL,
  `lt_regdate` datetime DEFAULT current_timestamp(),
  KEY `lt_useridx` (`lt_useridx`),
  CONSTRAINT `tb_logintime_ibfk_1` FOREIGN KEY (`lt_useridx`) REFERENCES `tb_member` (`m_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 insta.tb_logintime:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_logintime` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_logintime` ENABLE KEYS */;

-- 테이블 insta.tb_member 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_member` (
  `m_idx` bigint(20) NOT NULL AUTO_INCREMENT,
  `m_userid` varchar(20) NOT NULL,
  `m_password` varchar(70) NOT NULL,
  `m_username` varchar(20) NOT NULL,
  `m_email` varchar(100) NOT NULL,
  PRIMARY KEY (`m_idx`),
  UNIQUE KEY `m_userid` (`m_userid`),
  UNIQUE KEY `m_phmail` (`m_email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 테이블 데이터 insta.tb_member:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_member` DISABLE KEYS */;
INSERT INTO `tb_member` (`m_idx`, `m_userid`, `m_password`, `m_username`, `m_email`) VALUES
	(1, 'apple', '*A4B6157319038724E3560894F7F932C8886EBFCF', '사과', 'q1w2e3123@naver.com'),
	(3, 'banana', '*A4B6157319038724E3560894F7F932C8886EBFCF', '바나나', 'banana@naver.com'),
	(4, 'root1', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'root1', 'root1@naver.com'),
	(5, 'root2', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'root2', 'root2@naver.com'),
	(6, 'root3', '*A4B6157319038724E3560894F7F932C8886EBFCF', 'root3', 'root3@naver.com');
/*!40000 ALTER TABLE `tb_member` ENABLE KEYS */;

-- 테이블 insta.tb_mycontent 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_mycontent` (
  `mc_idx` bigint(20) NOT NULL AUTO_INCREMENT,
  `mc_useridx` bigint(20) NOT NULL,
  `mc_content` text DEFAULT NULL,
  `mc_taggedid` varchar(500) DEFAULT NULL,
  `mc_taggedname` varchar(500) DEFAULT NULL,
  `mc_regdate` datetime DEFAULT current_timestamp(),
  `mc_location` varchar(130) DEFAULT NULL,
  `mc_imageurl` text DEFAULT NULL,
  PRIMARY KEY (`mc_idx`),
  KEY `mc_useridx` (`mc_useridx`),
  CONSTRAINT `tb_mycontent_ibfk_1` FOREIGN KEY (`mc_useridx`) REFERENCES `tb_member` (`m_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- 테이블 데이터 insta.tb_mycontent:~70 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_mycontent` DISABLE KEYS */;
INSERT INTO `tb_mycontent` (`mc_idx`, `mc_useridx`, `mc_content`, `mc_taggedid`, `mc_taggedname`, `mc_regdate`, `mc_location`, `mc_imageurl`) VALUES
	(2, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 13:41:46', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(4, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 13:44:11', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(5, 4, '#한강 #한강공원 #돈까스 근처 #친구들  @root1 @root3', ' @root1,@root3,', '#한강,#돈까스,#친구들,', '2020-07-06 13:45:42', NULL, ''),
	(6, 6, '#한강 근처 #친구들  @root1 @root2', '@root1,@root2', '#한강,#친구들,', '2020-07-06 13:46:01', NULL, 'https://t1.daumcdn.net/cfile/tistory/27302B4B591E4EC630'),
	(7, 5, '#한강 #한강돈까스 #친구들 근처 #친구들  @root1 @root3', '@root1,@root3', '#한강,#한강돈까스,#친구들,', '2020-07-06 13:46:04', NULL, 'https://th3.tmon.kr/thumbs/image/6ea/082/d57/2906e06a0_700x700_95_FIT.jpg'),
	(8, 3, '#남산 #남산돈까스 #돈까스 에 놀러왔다 @apple @banana', '@apple,@banana,', '#남산,#남산돈까스,#돈까스, ', '2020-07-06 13:49:33', NULL, 'https://www.kgdm.co.kr/news/photo/201909/658936_229391_5343.png'),
	(9, 3, '#남산 에 놀러왔다 @apple @banana', '@apple,@banana,', '#남산,', '2020-07-06 13:49:34', NULL, 'https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1618,h_1080,f_auto/w_80,x_15,y_15,g_south_west,l_klook_water/activities/syrkebq2zythgnm6auob/[%EC%97%AC%EB%A6%84%ED%95%9C%EC%A0%95%ED%8A%B9%EA%B0%80]N%EC%84%9C%EC%9A%B8%ED%83%80%EC%9B%8C%EC%9E%85%EC%9E%A5%EA%B6%8C.jpg'),
	(10, 3, '#남산돈까스 놀러왔다 @apple @banana', '@apple,@banana,', '#남산돈까스,', '2020-07-06 13:49:35', NULL, 'data:image/jpeg;base64,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'),
	(11, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 13:49:35', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(42, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 13:49:40', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(43, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:39', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(44, 1, '#한강#한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:39', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(45, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:39', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(46, 4, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:39', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(47, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:39', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(48, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:39', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(49, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:39', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(50, 4, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:39', NULL, ''),
	(51, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:40', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(52, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:40', NULL, ''),
	(53, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:40', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(54, 4, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:40', NULL, ''),
	(55, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:40', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(56, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:40', NULL, ''),
	(57, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:40', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(58, 4, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:40', NULL, ''),
	(59, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:40', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(60, 5, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:40', NULL, ''),
	(61, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:40', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(62, 4, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:40', NULL, ''),
	(63, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:41', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(64, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:41', NULL, ''),
	(65, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:41', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(66, 4, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:41', NULL, ''),
	(67, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:41', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(68, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:41', NULL, ''),
	(69, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:41', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(70, 4, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:41', NULL, ''),
	(71, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:41', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(72, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:41', NULL, ''),
	(73, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:41', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(74, 4, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:41', NULL, ''),
	(75, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:41', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(76, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:41', NULL, ''),
	(77, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:41', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(78, 4, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:41', NULL, ''),
	(79, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:41', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(80, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:41', NULL, ''),
	(81, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:41', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(82, 4, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:41', NULL, ''),
	(83, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:42', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(84, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:42', NULL, ''),
	(85, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:42', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(86, 4, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:42', NULL, ''),
	(87, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:42', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(88, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:42', NULL, ''),
	(89, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:42', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(90, 4, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:42', NULL, ''),
	(91, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:42', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(92, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:42', NULL, ''),
	(93, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:42', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(94, 4, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:42', NULL, ''),
	(95, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강,#한강공원,', '2020-07-06 18:53:42', NULL, 'https://post-phinf.pstatic.net/MjAxOTA1MjhfMTQw/MDAxNTU5MDU1MzUzOTQz.Lvz18du_dAZpP6ZR5JvEO8socYpDWGudlaLQnZpDxcYg.oVRJGvcEmR5Z6tXFa4fiKI4yabBimoKm3sSSrke7fwAg.JPEG/%ED%95%9C%EA%B0%95_%EC%B9%B4%EC%95%BD712641853.jpg?type=w1200'),
	(96, 1, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:42', NULL, ''),
	(97, 3, '#한강 #한강공원 한강에 놀러왔다 @apple @banana', '@apple,@banana,', '#한강에선물놀이,#한강공원,', '2020-07-06 18:53:42', NULL, 'https://health.chosun.com/site/data/img_dir/2017/06/27/2017062702248_0.jpg'),
	(98, 6, '#한강 #한강공원 근처 #친구들  @root1 @root3', '@apple,@banana,', '#한강,#한강돈까스,#친구들,', '2020-07-06 18:53:42', NULL, ''),
	(99, 1, '#제육볶음 #한강공원 근처 #친구들  @root3', '@root3,', '#제육볶음,#한강공원,#친구들', '2020-07-14 17:51:53', NULL, 'data:image/jpeg;base64,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');
/*!40000 ALTER TABLE `tb_mycontent` ENABLE KEYS */;

-- 테이블 insta.tb_save 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_save` (
  `s_idx` bigint(20) NOT NULL AUTO_INCREMENT,
  `s_useridx` bigint(20) NOT NULL,
  `s_mcidx` bigint(20) NOT NULL,
  PRIMARY KEY (`s_idx`),
  KEY `s_useridx` (`s_useridx`),
  KEY `s_mcidx` (`s_mcidx`),
  CONSTRAINT `tb_save_ibfk_1` FOREIGN KEY (`s_useridx`) REFERENCES `tb_member` (`m_idx`),
  CONSTRAINT `tb_save_ibfk_2` FOREIGN KEY (`s_mcidx`) REFERENCES `tb_mycontent` (`mc_idx`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- 테이블 데이터 insta.tb_save:~5 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_save` DISABLE KEYS */;
INSERT INTO `tb_save` (`s_idx`, `s_useridx`, `s_mcidx`) VALUES
	(15, 4, 7),
	(21, 3, 2),
	(22, 4, 11),
	(33, 4, 6);
/*!40000 ALTER TABLE `tb_save` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
