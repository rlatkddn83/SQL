#날짜 : 2022/06/14
#이름 : 김상우
#내용 : SQL 확인문제 실습

#실습하기 4-1
DROP TABLE `tbl_member`;
CREATE TABLE `tbl_member` (
	`memberID` VARCHAR(10) PRIMARY KEY,
	`membername` VARCHAR(10) NOT NULL,
	`memberhp` CHAR(13) UNIQUE,
	`memberage` INT,
	`memberaddr` VARCHAR(20)
);

CREATE TABLE `tbl_product` (
	`productcode` INT AUTO_INCREMENT PRIMARY KEY,
	`productname` VARCHAR(10) NOT NULL,
	`price` INT NOT NULL,
	`amount` INT DEFAULT 0,
	`company` VARCHAR(10),
	`makedate` DATE
);

	

#실습하기 4-2
INSERT INTO `tbl_member` VALUES ('p101','김유신','010-1234-1001',25,'신라');
INSERT INTO `tbl_member` VALUES ('p102','김춘추','010-1234-1002',23,'신라');
INSERT INTO `tbl_member` VALUES ('p103','장보고',null,31,'통일신라');
INSERT INTO `tbl_member` VALUES ('p104','강감찬',null,null,'고려');
INSERT INTO `tbl_member` VALUES ('p105','이순신','010-1234-1005',50,NULL);

INSERT INTO `tbl_product`(`productname`,`price`,`amount`,`company`,`makedate`) VALUES ('냉장고',800,10,'LG','2022-06-14');
INSERT INTO `tbl_product`(`productname`,`price`,`amount`,`company`,`makedate`) VALUES ('노트북',1200,20,'삼성',NOW());
INSERT INTO `tbl_product`(`productname`,`price`,`amount`,`company`,`makedate`) VALUES ('TV',1400,6,'LG',NOW());
INSERT INTO `tbl_product`(`productname`,`price`,`amount`,`company`,`makedate`) VALUES ('세탁기',1000,8,'LG',NOW());
INSERT INTO `tbl_product`(`productname`,`price`,`amount`,`company`,`makedate`) VALUES ('컴퓨터',1100,0,null,null);
INSERT INTO `tbl_product`(`productname`,`price`,`amount`,`company`,`makedate`) VALUES ('휴대폰',900,102,'삼성',NOW());

#실습하기 4-3
SELECT `membername` FROM `tbl_member`;
SELECT `membername`,`memberhp` FROM `tbl_member`;
SELECT * FROM `tbl_member` WHERE `memberid`='p102';
SELECT * FROM `tbl_member` WHERE `memberid`='p102' OR `memberid`='p104';
SELECT * FROM `tbl_member` WHERE `memberaddr`='신라';
SELECT * FROM `tbl_member` WHERE `memberage`>30;
SELECT * FROM `tbl_member` WHERE `memberhp`IS NULL;
UPDATE `tbl_member` SET `memberage`=42 WHERE `memberid`='p104';
UPDATE `tbl_member` SET `memberaddr`='조선' WHERE `memberid`='p105';
DELETE FROM `tbl_member` WHERE `memberid`='p103';
SELECT * FROM `tbl_member`;

SELECT `productname` FROM `tbl_product`;
SELECT `productname`,`price` FROM `tbl_product`;
SELECT * FROM `tbl_product` WHERE `company`='LG';
SELECT * FROM `tbl_product` WHERE `company`='삼성';
UPDATE `tbl_product` SET
								`company`='삼성',
								`makedate`='2021-01-01'
							WHERE
								`productcode`=5;
SELECT * FROM `tbl_product`;
