-- DELIMITER $$
-- CREATE PROCEDURE proc_if()
-- BEGIN
-- DECLARE X INT;
-- DECLARE Y INT DEFAULT 5;
-- SET X = 10;
-- IF X>Y THEN
-- SELECT 'X는 Y보다 큽니다.' AS 결과;
-- ELSE
-- SELECT 'X는 Y보다 작거나 같습니다.' AS 결과;
-- END IF;
-- END $$proc_ifproc_if
-- DELIMITER;
-- CALL proc_if();

-- DELIMITER $$

-- CREATE PROCEDURE proc_case()
-- BEGIN
-- 	DECLARE X INT DEFAULT 10;
-- 	DECLARE Y INT;
--     SET y = 10 mod 2;
-- 	CASE
-- 		WHEN y = 0 THEN
-- 			SELECT 'x는 짝수입니다' AS '결과';
-- 		ELSE
-- 			SELECT 'x는 홀수입니다' AS '결과';
-- 	END CASE;
-- END $$

-- DELIMITER;
-- CALL proc_case();

-- DELIMITER $$
-- CREATE PROCEDURE proc_while()
-- BEGIN
-- 	DECLARE x INT DEFAULT 0;
--     DECLARE y INT DEFAULT 0;
--     WHILE x < 10 DO
-- 		SET x = x+1;
--         SET y = y+x;
-- 	END WHILE;
--     SELECT x, y;
-- END $$
-- DELIMITER;

-- CALL proc_while();

-- DELIMITER $$
-- CREATE PROCEDURE GETEMP()
-- BEGIN
-- 	SELECT EMPNO, ENAME, SAL, E.DEPTNO, LOC
--     FROM EMP E INNER JOIN DEPT D
--     ON E.DEPTNO = D.DEPTNO;
-- END $$
-- DELIMITER;

-- CALL GETEMP();

USE madang;
-- DELIMITER $$
-- CREATE PROCEDURE InsertBook(
-- 	IN MYBOOKID INTEGER,
--     IN MYBOOKNAME VARCHAR(40),
--     IN MYPUBLISHER VARCHAR(40),
--     IN MYPRICE INTEGER)
-- BEGIN
-- 	INSERT INTO Book(BOOKID, BOOKNAME, PUBLISHER, PRICE)
--     VALUES(MYBOOKID, MYBOOKNAME,  MYPUBLISHER, MYPRICE);
-- END $$
-- DELIMITER;
-- CALL INSERTBOOK(100, '도리안그레이의 초상','몰라', 12000);

-- DELIMITER //
-- CREATE PROCEDURE BookInsertOrUpdate(
-- 	MYBOOKID INTEGER,
--     MYBOOKNAME VARCHAR(40),
--     MYPUBLISHER VARCHAR(40),
--     MYPRICE INT)
-- BEGIN
-- DECLARE MYCOUNT INTEGER;
-- SELECT COUNT(*) INTO MYCOUNT FROM BOOK 
-- WHERE BOOKNAME LIKE MYBOOKNAME;
-- IF MYCOUNT != 0 THEN
--     SET SQL_SAFE_UPDATES = 0;
--     UPDATE Book SET price = MYPRICE
--     WHERE BOOKNAME LIKE MYBOOKNAME;
-- ELSE
-- 	INSERT INTO Book(bookid, bookname, publisher, price)
--     VALUES(MYBOOKID, MYBOOKNAME, MYPUBLISHER, MYPRICE);
-- END IF;
-- END // 
-- DELIMITER;

-- CALL BOOKINSERTORUPDATE(15, '스포츠 즐거움', '코난과학서적', 25000);
-- SELECT * FROM BOOK;

-- CALL BOOKINSERTORUPDATE(15, '스포츠 즐거움', '코난과학서적', 20000);
-- SELECT * FROM BOOK;

-- DELIMITER //
-- CREATE PROCEDURE AVERAGEPRICE(
-- 	OUT AVERAGEVAL INTEGER)
-- BEGIN
-- 	SELECT AVG(PRICE) INTO AVERAGEVAL FROM BOOK
--     WHERE PRICE IS NOT NULL;
-- END;
-- // 
-- DELMITER;

-- CALL AVERAGEPRICE(@MYVALUE);
-- SELECT @MYVALUE;

-- DELIMITER //
-- CREATE PROCEDURE INTEREST()
-- BEGIN
-- 	DECLARE MYINTEREST INTEGER DEFAULT 0.0;
--     DECLARE PRICE INTEGER;
--     DECLARE ENDOFROW BOOLEAN DEFAULT FALSE;
--     DECLARE INTERESTCURSOR CURSOR FOR SELECT SALEPRICE FROM ORDERS;
--     DECLARE CONTINUE HANDLER FOR NOT FOUND SET ENDOFROW=TRUE;
--     OPEN INTERESTCURSOR;
--     CURSOR_LOOP:LOOP
-- 		FETCH INTERESTCURSOR INTO PRICE;
--         IF ENDOFROW THEN LEAVE CURSOR_LOOP;
--         END IF;
--         IF PRICE >= 30000 THEN SET MYINTEREST = MYINTEREST + PRICE*0.1;
--         ELSE SET MYINTEREST = MYINTEREST + PRICE * 0.05;
--         END IF;
-- 	END LOOP CURSOR_LOOP;
--     CLOSE INTERESTCURSOR;
--     SELECT CONCAT("전체 이익 금액 = ", MYINTEREST);
-- END;
-- //
-- DELIMITER;

-- CALL INTEREST()

-- CREATE TABLE Book_log(
-- bookid_l INTEGER,
-- bookname_l VARCHAR(40),
-- publisher_l VARCHAR(40),
-- price_l INTEGER
-- );

-- SELECT * FROM Book_log

-- CREATE TRIGGER AfterInsertBook
-- 	AFTER INSERT ON Book
--     FOR EACH ROW
-- BEGIN
-- 	INSERT INTO Book_log VALUES(new.bookid, new.bookname, new.publisher, new.price);
-- END;

-- DELIMITER //
-- CREATE FUNCTION fnc_Interest(Price INTEGER) RETURNS INT
-- BEGIN
-- DECLARE myInterest INTEGER;
-- IF Price >= 30000 THEN
-- 	SET myInterest = Price * 0.1;
-- ELSE
-- 	SET myInterest := Price * 0.05;
-- END IF;
-- RETURN myInterest;
-- END;
-- //
-- DELIMITER;


-- CREATE PROCEDURE InsertCustomer(
-- 	IN myCustid INTEGER,
--     IN myName VARCHAR(40),
--     IN myAddress VARCHAR(40),
--     IN myPhone INTEGER)
-- BEGIN
-- 	INSERT INTO Book(custid, name, address, phone)
--     VALUES(myCustid, myName,  myAddress, myPhone);
-- END;

-- CREATE TABLE Customer_log(
-- custid_l INTEGER,
-- name_l VARCHAR(40),
-- address_l VARCHAR(40),
-- phone_l INTEGER
-- );

-- CREATE TRIGGER AfterDeleteCustomer
-- 	AFTER DELETE ON Customer
--     FOR EACH ROW
-- BEGIN
-- 	INSERT INTO Customer_log VALUES(old.custid, old.name, old.address, old.phone);
-- END;
-- SELECT * FROM Customer;

