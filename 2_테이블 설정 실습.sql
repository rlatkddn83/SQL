#날짜 : 2022/06/14
#이름 : 김상우
#내용 : 테이블 설정 실습

#실습하기 2-1
CREATE TABLE `user2` (
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`hp` CHAR(13) ,
	`age` TINYINT
);

INSERT INTO `user2` VALUES ('A101','김유신','010-1234-1111',25);
INSERT INTO `user2` VALUES ('A102','김춘추','010-1234-2222',23);
INSERT INTO `user2` VALUES ('A103','장보고','010-1234-3333',35);
INSERT INTO `user2` VALUES ('A104','강감찬','010-1234-4444',45);
INSERT INTO `user2` VALUES ('A105','이순신','010-1234-5555',51);
INSERT INTO `user2` VALUES ('A106','정약용','010-1234-3333',42);

#실습하기 2-2
CREATE TABLE `user3` (
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`hp` CHAR(13) UNIQUE,
	`age` TINYINT
);

INSERT INTO `user3` VALUES ('A101','김유신','010-1234-1111',25);
INSERT INTO `user3` VALUES ('A102','김춘추','010-1234-2222',23);
INSERT INTO `user3` VALUES ('A103','장보고','010-1234-3333',35);
INSERT INTO `user3` VALUES ('A104','강감찬','010-1234-4444',45);
INSERT INTO `user3` VALUES ('A105','이순신','010-1234-5555',51);
INSERT INTO `user3` VALUES ('A106','정약용','010-1234-6666',42);


#실습하기 2-3
CREATE TABLE `parent` (
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`hp` CHAR(13) UNIQUE
);

INSERT INTO `parent` VALUES ('P101','김유신','010-1234-1001');
INSERT INTO `parent` VALUES ('P102','장보고','010-1234-1002');
INSERT INTO `parent` VALUES ('P103','이순신','010-1234-1003');

CREATE TABLE `user4` (
	`uid` VARCHAR(10) PRIMARY KEY,
	`name` VARCHAR(10),
	`hp` CHAR(13) UNIQUE,
	`pid` VARCHAR(10),
	FOREIGN KEY (`pid`) REFERENCES `parent` (`uid`)
);

INSERT INTO `user4` VALUES ('C101', '김철수', '010-1234-1001', 'P101');
INSERT INTO `user4` VALUES ('C102', '장철수', '010-1234-1002', 'P102');
INSERT INTO `user4` VALUES ('C103', '이철수', '010-1234-1003', 'P103');
INSERT INTO `user4` VALUES ('C104', '김영희', '010-1234-1004', 'P101');



#실습하기 2-4
CREATE TABLE `user5` (
	`seq` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(10),
	`gender` TINYINT,
	`age` INT,
	`addr` VARCHAR(255)
);

INSERT INTO `user5` (`name`,`gender`,`age`,`addr`) VALUES ('김유신', 1,25, '김해시');
INSERT INTO `user5` (`name`,`gender`,`age`,`addr`) VALUES ('김춘추', 1,21, '경주시');
INSERT INTO `user5` (`name`,`gender`,`age`,`addr`) VALUES ('선덕여왕', 2,35, '경주시');
INSERT INTO `user5` (`name`,`gender`,`age`,`addr`) VALUES ('장보고', 1,31, '완도시');
INSERT INTO `user5` (`name`,`gender`,`age`,`addr`) VALUES ('신사임당', 2,42, '강릉시');
INSERT INTO `user5` (`name`,`gender`,`age`,`addr`) VALUES ('허난설헌', 2,27, '광주시');
INSERT INTO `user5` (`gender`,`addr`) VALUES ( 2, '서울시');


#실습하기 2-5
CREATE TABLE `user6` (
	`seq` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(10) NOT NULL,
	`gender` TINYINT,
	`age` INT DEFAULT 1,
	`addr` VARCHAR(255)
);

INSERT INTO `user6` (`name`,`gender`,`age`,`addr`) VALUES ('김유신', 1,25, '김해시');
INSERT INTO `user6` (`name`,`gender`,`age`,`addr`) VALUES ('김춘추', 1,21, '경주시');
INSERT INTO `user6` (`name`,`gender`,`age`,`addr`) VALUES ('선덕여왕', 2,35, '경주시');
INSERT INTO `user6` (`name`,`gender`,`age`,`addr`) VALUES ('장보고', 1,31, '완도시');
INSERT INTO `user6` (`name`,`gender`,`age`,`addr`) VALUES ('신사임당', 2,42, '강릉시');
INSERT INTO `user6` (`name`,`gender`,`age`,`addr`) VALUES ('허난설헌', 2,27, '광주시');
INSERT INTO `user6` (`name`,`gender`,`addr`) VALUES ( '이순신', 1, '서울시');
INSERT INTO `user6` (`gender`,`addr`) VALUES ( 1, '부산시');


#실습하기 2-6
CREATE TABLE `user8` LIKE `user4`;


#실습하기 2-7
INSERT INTO `user7` SELECT * FROM `user6`;

INSERT INTO `user7` (`name`,`gender`,`age`,`addr`)
				SELECT `name`,`gender`,`age`,`addr` FROM `user6`;
