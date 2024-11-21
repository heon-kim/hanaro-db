-- create view vw_emp20
-- as (select empno, ename, job, deptno from emp where deptno = 20);

-- select * from vw_emp20;

-- create view vw_book
-- as select * from book where bookname like "%축구%";

-- select * from vw_book;

-- insert into vw_emp20
-- values(8001, 'TEST_USER1','MANAGER', 30);

-- insert into vw_emp20
-- values(8002, 'TEST_USER2', 'CLERK', 20);

-- select * from vw_emp20;

-- rollback

-- select * from vw_emp20;

# 주소에 '대한민국'을 포함하는 고객들로 구성된 뷰를 만들고 조회하시오.
# 뷰의 이름은 vw_Customer로 설정하시오.
-- create view vw_Customer
-- as (select custid, name, address, phone from customer where address like "%대한민국%");
-- select * from vw_Customer

# 주문정보, 고객이름과 도서이름을 바로 확인할 수 있는 뷰를 생성한 후, '김연아' 고객이 구입한 도서의 주문번호, 도서인름, 주문액을 조회하시오.
-- create view vw_reciept
-- as 
-- select o.orderid, b.bookname, o.saleprice, c.name as customerName
-- from orders o 
-- join book b on o.bookid=b.bookid 
-- join customer c on c.custid = o.custid;

-- SELECT * FROM vw_reciept WHERE customerName = '김연아';

-- drop view vw_reciept-- 

# 판매가격이 20000원 이상인 도서의 도서번호, 도서이름, 고객이름, 출판사, 판매가격을 보여주는 highorders 뷰를 생성하시오.
-- create view vw_highorders
-- as 
-- select b.bookid, b.bookname, c.name as customerName, b.publisher, o.saleprice
-- from orders o 
-- join book b on o.bookid=b.bookid 
-- join customer c on c.custid = o.custid
-- where o.saleprice >= 20000;

# 생성한 뷰를 이용하여 판매된 도서의 이름과 고객의 이름을 출력하는 sql 문을 작성하시오.
-- select bookname, customerName from vw_highorders

# highorders 뷰를 변경하고자 한다. 판매가격 속성을 삭제하는 명령을 수행하시오.
# 삭제 후 위의 도서 이름과 고객의 이름을 출력하는 sql 문을 다시 수행하시오.
-- create or replace view vw_highorders
-- as 
-- select b.bookid, b.bookname, c.name as customerName, b.publisher
-- from orders o 
-- join book b on o.bookid=b.bookid 
-- join customer c on c.custid = o.custid
-- where o.saleprice >= 20000;

-- select bookname, customerName from vw_highorders