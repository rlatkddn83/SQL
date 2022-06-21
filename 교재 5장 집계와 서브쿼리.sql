#날짜 : 2022/06/21
#이름 : 김상우
#내용 : 교재 5장 집계와 서브쿼리

###############################
#20강 행 개수 구하기
###############################
#테이블 생성/데이터 저장
CREATE TABLE `sample51` (
	`no` INT AUTO_INCREMENT PRIMARY KEY,
	`name` VARCHAR(10),
	`quantity` INT
);

INSERT INTO `sample51`(NAME,quantity) VALUES('A',1);
INSERT INTO `sample51`(NAME,quantity) VALUES('A',2);
INSERT INTO `sample51`(NAME,quantity) VALUES('B',10);
INSERT INTO `sample51`(NAME,quantity) VALUES('C',3);
INSERT INTO `sample51`(NAME,quantity) VALUES(NULL, NULL);
#p183
SELECT * FROM sample51;
SELECT COUNT(*) FROM sample51;

#p185
SELECT * FROM sample51 WHERE NAME='A';
SELECT COUNT(*) FROM sample51 WHERE NAME='A';

#p186
SELECT COUNT(NO),COUNT(NAME) FROM sample51;

#p187
SELECT * FROM sample51;

#p188
SELECT ALL NAME FROM Sample51;
SELECT DISTINCT NAME FROM sample51;

#p189
SELECT COUNT(ALL NAME), COUNT(DISTINCT NAME) FROM sample51;

###############################
#21강 COUNT 이외의 집계함수
###############################
#p191
SELECT * FROM sample51;
SELECT SUM(quantity) FROM sample51;

#p192
SELECT AVG(quantity), SUM(quantity)/COUNT(quantity) FROM sample51;

#p193
SELECT AVG(case when quantity IS NULL then 0 ELSE quantity END) AS angnull0 FROM sample51;
SELECT MIN(quantity), MAX(quantity), MIN(name), MAX(NAME) FROM sample51;



###############################
#22강 그룹화-GROUP BY
###############################
#p195
SELECT * FROM sample51;
SELECT NAME FROM sample51 GROUP BY NAME;

#p197
SELECT NAME,COUNT(NAME),SUM(quantity) FROM sample51 GROUP BY NAME;

#p199
SELECT NAME,count(NAME) from sample51 GROUP BY NAME;
SELECT NAME,count(NAME) from sample51 GROUP BY NAME HAVING COUNT(NAME)=1;

#p202
SELECT NAME, COUNT(NAME),SUM(quantity) FROM sample51 GROUP BY NAME ORDER BY SUM(quantity) DESC;

###############################
#23강 서브쿼리
###############################
#테이블 생성/데이터 저장
CREATE TABLE `sample54` (
	`no` INT AUTO_INCREMENT PRIMARY KEY,
	`a` INT
);

INSERT INTO sample54(`a`) VALUES(100);
INSERT INTO sample54(`a`) VALUES(900);
INSERT INTO sample54(`a`) VALUES(20);
INSERT INTO sample54(`a`) VALUES(80);

#p205
SELECT * FROM sample54;
SELECT MIN(a) FROM sample54;
#p206
DELETE FROM sample54 WHERE a = (SELECT MIN(a) FROM sample54);

#p207
SELECT MIN(a) FROM sample54;
SELECT NO FROM sample54;
SELECT MIN(a), MAX(NO) FROM sample54;
#p208
SELECT NO,a FROM sample54;

#p210
SELECT 
	(SELECT COUNT(*) FROM sample51) AS sq1,
	(SELECT COUNT(*) FROM sample54) AS sq2;
SELECT 
	(SELECT COUNT(*) FROM sample51) AS sq1,
	(SELECT COUNT(*) FROM sample54) AS sq2 FROM DUAL;

#p211
UPDATE sample54 SET a=(SELECT MAX(a) FROM sample54);
SELECT * FROM sample54;

#p212
SELECT * FROM(SELECT*FROM sample54)sq;
SELECT * FROM(SELECT*FROM sample54) as sq;

#p213
SELECT * FROM(SELECT*FROM (SELECT*FROM sample54) sq1) sq2;
SELECT * FROM (
	SELECT * FROM sample54 ORDER BY a DESC
) sq
WHERE ROWNUM <= 2;

#테이블 생성/데이터 저장
CREATE TABLE `sample541` (
	`a` INT,
	`b` INT
);

#p214
INSERT INTO sample541 VALUES(
	(SELECT COUNT(*) FROM sample51),
	(SELECT COUNT(*) FROM sample54)
);
SELECT * FROM sample541;

INSERT INTO sample541 SELECT 1,2;
SELECT * FROM sample541;
#p215
INSERT INTO sample542 SELECT * FROM sample543;

###############################
#24강 상관 서브쿼리
###############################
#테이블 생성/데이터 저장
CREATE TABLE `sample551` (
	`no` INT AUTO_INCREMENT PRIMARY KEY,
	`a` VARCHAR(10)
);
CREATE TABLE `sample552` (
	`no 2` INT
);

INSERT INTO sample551(a) VALUES(NULL);
INSERT INTO sample551(a) VALUES(NULL);
INSERT INTO sample551(a) VALUES(NULL);
INSERT INTO sample551(a) VALUES(NULL);
INSERT INTO sample551(a) VALUES(NULL);

INSERT INTO sample552 VALUES(3);
INSERT INTO sample552 VALUES(5);

#p217
SELECT * FROM sample551;
SELECT * FROM sample552;

#p218
UPDATE sample551 SET a='있음' WHERE
	EXISTS (SELECT * FROM sample552 WHERE `no 2` = NO);
	
SELECT * FROM sample551;

#p219
UPDATE sample551 SET a='없음' WHERE
	NOT EXISTS (SELECT * FROM sample552 WHERE `no 2` = NO);
	
SELECT * FROM sample551;

#p221
UPDATE sample551 SET a='없음' WHERE
	NOT EXISTS (SELECT * FROM sample552 WHERE sample552.`no 2` = sample551.no);
	
SELECT * FROM sample551;


#p222
SELECT * FROM sample551 WHERE NO IN (3,5);
SELECT * FROM sample551 WHERE NO IN 
	(SELECT `no 2` FROM sample552);