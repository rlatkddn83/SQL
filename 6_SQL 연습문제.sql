#날짜 : SQL연습문제
#이름 : 김상우
#내용 : SQL 연습문제

#문제1
CREATE TABLE `book` (
	`bookid` INT AUTO_INCREMENT PRIMARY KEY,
	`bookname` VARCHAR(50),
	`publisher` VARCHAR(50),
	`price` INT
);

INSERT INTO `book` (bookname,publisher,price) VALUES ('축구의 역사','굿스포츠',7000);
INSERT INTO `book` (bookname,publisher,price) VALUES ('축구아는 여자','나무수',13000);
INSERT INTO `book` (bookname,publisher,price) VALUES ('축구의 이해','대한미디어',22000);
INSERT INTO `book` (bookname,publisher,price) VALUES ('골프 바이블','대한미디어',35000);
INSERT INTO `book` (bookname,publisher,price) VALUES ('피겨 교본','굿스포츠',8000);
INSERT INTO `book` (bookname,publisher,price) VALUES ('역도 단계별기술','굿스포츠',6000);
INSERT INTO `book` (bookname,publisher,price) VALUES ('야구의 추억','이상미디어',20000);
INSERT INTO `book` (bookname,publisher,price) VALUES ('야구를 부탁해','이상미디어',13000);
INSERT INTO `book` (bookname,publisher,price) VALUES ('올림픽 이야기','삼성당',7500);
INSERT INTO `book` (bookname,publisher,price) VALUES ('Olympic Champpions','Pearson',13000);

#문제2
CREATE TABLE `customer` (
	`custid` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(10),
	`address` VARCHAR(255),
	`phone` CHAR(13)
);

INSERT INTO `customer` (name,address,phone) VALUES ('박지성','영국 맨체스타','000-5000-0001');
INSERT INTO `customer` (name,address,phone) VALUES ('김연아','대한민국 서울','000-6000-0001');
INSERT INTO `customer` (name,address,phone) VALUES ('장미란','대한민국 강원도','000-7000-0001');
INSERT INTO `customer` (name,address,phone) VALUES ('추신수','미국 클리블랜드','000-8000-0001');
INSERT INTO `customer` (name,address) VALUES ('박세리','대한민국 대전');

#문제3
CREATE TABLE `orders` (
	`orderid` INT AUTO_INCREMENT PRIMARY KEY,
	`custid` INT,
	`bookid` INT,
	`saleprice` INT,
	`orderdate` DATE
);

INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES (1,1,6000,'2014-07-01');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES (1,3,21000,'2014-07-03');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES (2,5,8000,'2014-07-03');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES (3,6,6000,'2014-07-04');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES (4,7,20000,'2014-07-05');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES (1,2,12000,'2014-07-07');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES (4,8,13000,'2014-07-07');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES (3,10,12000,'2014-07-08');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES (2,10,7000,'2014-07-09');
INSERT INTO `orders` (custid,bookid,saleprice,orderdate) VALUES (3,8,13000,'2014-07-10');

#문제4
SELECT `custid`,`NAME`,`address` FROM `customer`;

#문제5
SELECT `bookNAME`,`price` FROM `book`;

#문제6
SELECT `price`,`bookNAME` FROM `book`;

#문제7
SELECT * FROM `book`;

#문제8
SELECT `publisher` FROM `book`;

#문제9
SELECT `publisher` FROM `book` GROUP BY `publisher`;
SELECT DISTINCT `publisher` FROM `book`;

#문제10
SELECT * FROM `book` WHERE `price`>=20000;

#문제11
SELECT * FROM `book` WHERE `price`<20000;

#문제12
SELECT * FROM `book` WHERE 10000<=`price` AND `price`<=20000;
SELECT * FROM `book` WHERE `price` BETWEEN 10000 AND 20000;

#문제13
SELECT `bookid`,`bookname`,`price` FROM `book` WHERE 15000<=`price` AND `price`<=30000;
SELECT `bookid`,`bookname`,`price` FROM `book` WHERE `price` BETWEEN 15000 AND 30000;

#문제14
SELECT * FROM `book` WHERE `bookid` = 2 OR `bookid` = 3 OR `bookid` = 5;
SELECT * FROM `book` WHERE `bookid` IN(2,3,5);

#문제15
SELECT * FROM `book` WHERE `bookid` % 2 = 0;

#문제16
SELECT * FROM `customer` WHERE `name` LIKE '박%';

#문제17
SELECT * FROM `customer` WHERE `address` LIKE '대한민국%';

#문제18
SELECT * FROM `customer` WHERE `phone` IS NOT NULL;
SELECT * FROM `customer` WHERE NOT `phone` IS NULL;

#문제19
SELECT * FROM `book` WHERE `publisher` = '굿스포츠' OR `publisher` = '대한미디어';
SELECT * FROM `book` WHERE `publisher` IN('굿스포츠', '대한미디어');

#문제20
SELECT publisher FROM `book` WHERE `bookname` = '축구의 역사';


#문제21
SELECT publisher FROM `book` WHERE `bookname` LIKE '%축구%';

#문제22
SELECT * FROM `book` WHERE `bookname` LIKE '_구%';

#문제23
SELECT * FROM `book` WHERE `bookname` LIKE '%축구%' AND price>=20000;

#문제24
SELECT * FROM `book` ORDER BY `bookname`;

#문제25
SELECT * FROM `book` ORDER BY `price`,`bookname`;

#문제26
SELECT * FROM `book` ORDER BY `price` DESC, `publisher` ASC;

#문제27
SELECT * FROM `book` ORDER BY `price` DESC LIMIT 3;

#문제28
SELECT * FROM `book` ORDER BY `price` ASC LIMIT 3;

#문제29
SELECT SUM(saleprice) AS '총판매액' FROM `orders`;

#문제30
SELECT 
	SUM(saleprice) AS '총판매액',
	AVG(saleprice) AS '평균값',
	MIN(saleprice) AS '최저가',
	MAX(saleprice) AS '최고가'
FROM `orders`;


#문제31
SELECT COUNT(saleprice) AS '판매건수' FROM `orders`;

#문제32
SELECT `bookid`,REPLACE(bookname,'야구','농구') AS `bookname`,`publisher`,`price` FROM `book`;

#문제33
SELECT custid,COUNT(custid) AS '수량' 
	FROM `orders` AS a
	JOIN `book` AS b
	USING(bookid)
WHERE saleprice >= 8000
GROUP BY custid
HAVING `수량`>=2;

#문제34
SELECT * 
	FROM `customer` AS a
	JOIN `orders` AS b
	ON a.custid = b.custid
ORDER BY a.custid ASC;

#문제35
SELECT * 
	FROM `customer` AS a
	JOIN `orders` AS b
	ON a.custid = b.custid
ORDER BY a.custid ASC;

#문제36
SELECT NAME,saleprice 
	FROM `customer` AS a
	JOIN `orders` AS b
	ON a.custid = b.custid
ORDER BY a.custid ASC;

#문제37
SELECT NAME,sum(saleprice)
	FROM `customer` AS a
	JOIN `orders` AS b
	ON a.custid = b.custid
GROUP BY a.custid;

#문제38
SELECT NAME,bookname 
	FROM `customer` AS a
	JOIN `orders` AS b ON a.custid = b.custid
	JOIN `book` AS c ON b.bookid = c.bookid
ORDER BY a.custid ASC;

#문제39
SELECT NAME,bookname 
	FROM `customer` AS a
	JOIN `orders` AS b ON a.custid = b.custid
	JOIN `book` AS c ON b.bookid = c.bookid
WHERE saleprice = 20000
ORDER BY a.custid ASC;


#문제40
SELECT NAME,saleprice 
	FROM `customer` AS a
	LEFT JOIN `orders` AS b
	ON a.custid = b.custid
ORDER BY a.custid ASC;


#문제41
SELECT bookname FROM book ORDER BY price DESC LIMIT 1;

#문제42
SELECT `name` 
	FROM `customer` AS a
	LEFT JOIN `orders` AS b
	ON a.custid = b.custid
WHERE saleprice IS NULL;

#문제43
SELECT SUM(saleprice) AS '총매출'
	FROM `customer` AS a
	LEFT JOIN `orders` AS b
	ON a.custid = b.custid
WHERE `name` = '김연아';

#문제44
INSERT INTO `book`(`bookname`,`publisher`) VALUES ('스포츠의학','한솔의학서적');

#문제45
UPDATE `customer` SET `address` = '대한민국 부산' WHERE `custid` = 5;

#문제46
DELETE FROM `customer` WHERE `custid` = 5;