select * from all_users;

-- cbq_0925
create table tbl_customer(
	c_id varchar2(30) not null primary key,
	c_name varchar2(30) not null,
	c_mail varchar2(30) not null,
	c_phone varchar2(30) not null,
	c_reg_date timestamp
);

select * from tbl_customer;

INSERT INTO tbl_customer VALUES('gildong', '홍길동', 'gildong@gmail.com', '010-1234-5678', SYSTIMESTAMP);
INSERT INTO tbl_customer VALUES('chanho', '박찬호', 'chanho@naver.com', '010-9012-3456', SYSTIMESTAMP);
INSERT INTO tbl_customer VALUES('saeri', '박세리', 'saeri@daum.net', '010-7890-1234', SYSTIMESTAMP);
INSERT INTO tbl_customer VALUES('byeonggyu', '이병규', 'byeonggyu@gmail.com', '010-5678-9012', SYSTIMESTAMP);
INSERT INTO tbl_customer VALUES('heungmin', '손흥민', 'heungmin@naver.com', '010-3456-7890', SYSTIMESTAMP);

CREATE TABLE tbl_product (
	p_no 		NUMBER(4) NOT NULL PRIMARY KEY, 
	m_no 		NUMBER(4) NOT NULL, 
	p_name		VARCHAR2(30) NOT NULL,
	p_price 	NUMBER(10), 
	p_quantity 	NUMBER(10), 
	p_reg_date 	TIMESTAMP,
	p_mod_date 	TIMESTAMP
);

SELECT * FROM tbl_product;
DELETE FROM tbl_product;
DROP TABLE tbl_product;

CREATE SEQUENCE seq_product START WITH 1 INCREMENT by 1;
DROP SEQUENCE seq_product;

INSERT INTO tbl_product VALUES(SEQ_PRODUCT.NEXTVAL, 1, 'A상품', 10000, 50, SYSTIMESTAMP, SYSTIMESTAMP);
INSERT INTO tbl_product VALUES(SEQ_PRODUCT.NEXTVAL, 2, 'B상품', 500, 100, SYSTIMESTAMP, SYSTIMESTAMP);
INSERT INTO tbl_product VALUES(SEQ_PRODUCT.NEXTVAL, 3, 'C상품', 15000, 20, SYSTIMESTAMP, SYSTIMESTAMP);
INSERT INTO tbl_product VALUES(SEQ_PRODUCT.NEXTVAL, 4, 'D상품', 20000, 10, SYSTIMESTAMP, SYSTIMESTAMP);
INSERT INTO tbl_product VALUES(SEQ_PRODUCT.NEXTVAL, 5, 'E상품', 30000, 30, SYSTIMESTAMP, SYSTIMESTAMP);

CREATE TABLE tbl_manufacture (
	m_no			NUMBER(4) NOT NULL PRIMARY KEY,
	m_name 			VARCHAR2(20) NOT NULL, 
	m_address		VARCHAR2(30) NOT NULL, 
	m_phone			VARCHAR2(20) NOT NULL, 
	m_manager		VARCHAR2(20) NOT NULL, 
	m_reg_date 		TIMESTAMP,
	m_mod_date 		TIMESTAMP
);

SELECT * FROM tbl_manufacture;
DELETE FROM tbl_manufacture;
DROP TABLE tbl_manufacture;

CREATE SEQUENCE seq_manufacture START WITH 1 INCREMENT by 1;
DROP SEQUENCE seq_manufacture;

INSERT INTO tbl_manufacture VALUES(SEQ_MANUFACTURE.NEXTVAL, 'A제조사', 'AAA시 aaa구 123-456', '010-1478-5236', 'A대리', SYSTIMESTAMP, SYSTIMESTAMP);
INSERT INTO tbl_manufacture VALUES(SEQ_MANUFACTURE.NEXTVAL, 'B제조사', 'BBB시 bbb구 789-123', '010-9147-8523', 'B대리', SYSTIMESTAMP, SYSTIMESTAMP);
INSERT INTO tbl_manufacture VALUES(SEQ_MANUFACTURE.NEXTVAL, 'C제조사', 'CCC시 ccc구 456-789', '010-6901-4785', 'C대리', SYSTIMESTAMP, SYSTIMESTAMP);
INSERT INTO tbl_manufacture VALUES(SEQ_MANUFACTURE.NEXTVAL, 'D제조사', 'DDD시 ddd구 120-345', '010-2369-0123', 'D대리', SYSTIMESTAMP, SYSTIMESTAMP);
INSERT INTO tbl_manufacture VALUES(SEQ_MANUFACTURE.NEXTVAL, 'E제조사', 'EEE시 eee구 678-901', '010-4782-9514', 'E대리', SYSTIMESTAMP, SYSTIMESTAMP);


CREATE TABLE tbl_sales (
	s_no			NUMBER(4) NOT NULL PRIMARY KEY, 
	c_id			VARCHAR2(30) NOT NULL,
	p_no 			NUMBER(4) NOT NULL,
	s_price			NUMBER(10) NOT NULL,
	s_reg_date		TIMESTAMP,
	s_mod_date		TIMESTAMP
);

SELECT * FROM tbl_sales;
DELETE FROM tbl_sales;
DROP TABLE tbl_sales;

CREATE SEQUENCE seq_sales START WITH 1 INCREMENT by 1;
DROP SEQUENCE seq_sales;

SELECT * FROM tbl_sales s
JOIN tbl_customer c 
ON s.c_id = c.c_id 
JOIN tbl_product p 
ON s.p_no = p.p_no 
JOIN tbl_manufacture m 
ON p.m_no = m.m_no 
ORDER BY s.s_reg_date DESC;
	