-- 멤버 테이블
DROP TABLE MEMBER
CASCADE CONSTRAINTS;

CREATE TABLE MEMBER(
ID VARCHAR2(50) PRIMARY KEY,
PWD VARCHAR2(50) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
EMAIL VARCHAR2(50) UNIQUE NOT NULL,
ADDRESS1 VARCHAR2(50) NOT NULL,
ADDRESS2 VARCHAR2(50),
AUTH NUMBER(1) NOT NULL,
PHONE VARCHAR2(50) UNIQUE NOT NULL,
GRADE VARCHAR2(50) NOT NULL,
POINT NUMBER(20),
PAYPWD NUMBER(6) NOT NULL,
DEL NUMBER(1) NOT NULL,
AUTHKEY VARCHAR2(50),
AUTHSTATUS NUMBER(1) NOT NULL
);

--  추가 컬럼 사용할때
-- ALTER TABLE MEMBER ADD(GRADE VARCHAR2(50) NOT NULL);
-- ALTER TABLE MEMBER ADD(POINT NUMBER(20));

-- ALTER TABLE MEMBER ADD(AUTHKEY VARCHAR2(50));
-- ALTER TABLE MEMBER ADD(AUTHSTATUS NUMBER(1));
-- UPDATE MEMBER SET AUTHSTATUS = 0;
-- ALTER TABLE MEMBER MODIFY(AUTHSTATUS NUMBER(1) NOT NULL);

-- SELECT * FROM MEMBER;

----------------------------------------
-- 재고 테이블
DROP TABLE INVENTORY
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_INVEN;

CREATE TABLE INVENTORY(
INVEN_SEQ NUMBER(8) PRIMARY KEY,
MODEL_ID VARCHAR2(50) UNIQUE NOT NULL,
CATEGORY VARCHAR2(200) NOT NULL,
COUNT NUMBER(8) NOT NULL,
PRICE NUMBER(20) NOT NULL,
RDATE DATE NOT NULL,
DEL NUMBER(1) NOT NULL
);

CREATE SEQUENCE SEQ_INVEN
START WITH 1
INCREMENT BY 1;
-----------------------------------------
-- 상품테이블
DROP TABLE PRODUCT
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_PROD;

CREATE TABLE PRODUCT(
PROD_SEQ NUMBER(8) PRIMARY KEY,
MODEL_ID VARCHAR2(50) NOT NULL,
P_NAME VARCHAR2(200) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
PHOTO_BF1 VARCHAR2(50),
PHOTO_BF2 VARCHAR2(50),
PHOTO_BF3 VARCHAR2(50),
PHOTO_AF1 VARCHAR2(50),
PHOTO_AF2 VARCHAR2(50),
PHOTO_AF3 VARCHAR2(50),
PDF_BF VARCHAR2(50),
PDF_AF VARCHAR2(50),
READCOUNT NUMBER(8) NOT NULL,
PRICE NUMBER(20) NOT NULL,
RDATE DATE NOT NULL,
LIKECOUNT NUMBER(10) NOT NULL
);

-- 추가 컬럼
-- ALTER TABLE PRODUCT ADD(LIKECOUNT NUMBER(10));
-- UPDATE PRODUCT SET LIKECOUNT = 0;
-- ALTER TABLE PRODUCT MODIFY(LIKECOUNT NUMBER(10) NOT NULL);

CREATE SEQUENCE SEQ_PROD
START WITH 1
INCREMENT BY 1;

ALTER TABLE PRODUCT
ADD CONSTRAINT FK_PROD_MD FOREIGN KEY(MODEL_ID)
REFERENCES INVENTORY(MODEL_ID);

------------------------------------------
-- QNA
DROP TABLE QNA
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_QNA;

CREATE TABLE QNA(
QNA_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
WDATE DATE NOT NULL,
ANSWER VARCHAR2(2000),
ADATE DATE,
READCOUNT NUMBER(8) NOT NULL,
PARENT NUMBER(8) NOT NULL,
DEL NUMBER(1) NOT NULL
);

CREATE SEQUENCE SEQ_QNA
START WITH 1
INCREMENT BY 1;

ALTER TABLE QNA
ADD CONSTRAINT FK_QNA_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);
------------------------------------------
-- 상품후기
DROP TABLE REVIEW
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_REV;

CREATE TABLE REVIEW(
REV_SEQ NUMBER(8) PRIMARY KEY,
MODEL_ID VARCHAR2(50) NOT NULL,
ID VARCHAR2(50) NOT NULL,
TITLE VARCHAR2(200) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
STARPOINT NUMBER(5),
PHOTO_BF VARCHAR2(50),
PHOTO_AF VARCHAR2(50),
WDATE DATE NOT NULL,
PARENT NUMBER(8) NOT NULL,
DEL NUMBER(1) NOT NULL
);

CREATE SEQUENCE SEQ_REV
START WITH 1
INCREMENT BY 1;

ALTER TABLE REVIEW
ADD CONSTRAINT FK_REV_MD FOREIGN KEY(MODEL_ID)
REFERENCES INVENTORY(MODEL_ID);

ALTER TABLE REVIEW
ADD CONSTRAINT FK_REV_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);
-----------------------------------------
-- 주문관리 테이블
DROP TABLE ORDER_
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_ORDER;
DROP SEQUENCE ORDER_NUM_SEQ;

CREATE TABLE ORDER_(
ORD_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
TOTAL_PRICE NUMBER(20) NOT NULL,
ORDER_NUM NUMBER(20) UNIQUE NOT NULL,
DELI_INFO NUMBER(1) NOT NULL,
REGDATE DATE NOT NULL,
RNAME VARCHAR2(50) NOT NULL,
ADDRESS1 VARCHAR2(50) NOT NULL,
ADDRESS2 VARCHAR2(50),
PHONE VARCHAR2(50) NOT NULL,
CONTENT VARCHAR2(2000)
);

CREATE SEQUENCE SEQ_ORDER
START WITH 1
INCREMENT BY 1;

CREATE SEQUENCE ORDER_NUM_SEQ
START WITH 1000
INCREMENT BY 1;

ALTER TABLE ORDER_
ADD CONSTRAINT FK_ORD_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);

ALTER TABLE ORDER_ MODIFY(REGDATE DATE DEFAULT sysdate);

--ALTER TABLE ORDER_ MODIFY(ORDER_NUM VARCHAR2(30));

ALTER table ORDER_ MODIFY(ADDRESS1 VARCHAR2(70));

ALTER table ORDER_ MODIFY(ADDRESS2 VARCHAR2(70));

ALTER TABLE ORDER_ ADD(CARTSEQ NUMBER(8));
-------------------------------------
-- ORDER_SUB 테이블
DROP TABLE ORDER_SUB
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_ORDER_SUB;

CREATE TABLE ORDER_SUB(
ORDER_SUB_SEQ NUMBER(8) PRIMARY KEY,
MODEL_ID VARCHAR2(50) NOT NULL,
COUNT NUMBER(10) NOT NULL,
ORDER_NUM NUMBER(20) NOT NULL
);

CREATE SEQUENCE SEQ_ORDER_SUB
START WITH 1
INCREMENT BY 1;

ALTER TABLE ORDER_SUB
ADD CONSTRAINT FK_ORDER_NUM FOREIGN KEY(ORDER_NUM)
REFERENCES ORDER_(ORDER_NUM);

ALTER TABLE ORDER_SUB
ADD CONSTRAINT FK_ORDERSUB_ID FOREIGN KEY(MODEL_ID)
REFERENCES INVENTORY(MODEL_ID);


--ALTER TABLE ORDER_SUB DROP COLUMN RDATE;
--ALTER TABLE ORDER_SUB DROP COLUMN DEL;
--ALTER TABLE ORDER_SUB DROP COLUMN PRICE;

-------------------------------------------
-- 장바구니/위시리스트
DROP TABLE CART
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CART;

CREATE TABLE CART(
CART_SEQ NUMBER(8) PRIMARY KEY,
MODEL_ID VARCHAR2(50) NOT NULL,
ID VARCHAR2(50) NOT NULL,
CART_TYPE NUMBER(1) NOT NULL,
COUNT NUMBER(10) NOT NULL
);

CREATE SEQUENCE SEQ_CART
START WITH 1
INCREMENT BY 1;

ALTER TABLE CART
ADD CONSTRAINT FK_CART_MD FOREIGN KEY(MODEL_ID)
REFERENCES INVENTORY(MODEL_ID);

ALTER TABLE CART
ADD CONSTRAINT FK_CART_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);
----------------------------------------------
-- 출석체크 테이블
DROP TABLE CALENDAR
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CAL;

CREATE TABLE CALENDAR(
CAL_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
RDATE VARCHAR2(30) NOT NULL
);

CREATE SEQUENCE SEQ_CAL
START WITH 1
INCREMENT BY 1;

ALTER TABLE CALENDAR
ADD CONSTRAINT FK_CAL_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);
-----------------------------------------
-- 공지사항 테이블
DROP TABLE NOTICE
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_NOTI;

CREATE TABLE NOTICE(
NOTI_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
TITLE VARCHAR2(200) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
READCOUNT NUMBER(8) NOT NULL,
RDATE DATE NOT NULL
);

CREATE SEQUENCE SEQ_NOTI
START WITH 1
INCREMENT BY 1;

ALTER TABLE NOTICE
ADD CONSTRAINT FK_NOTI_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);
-------------------------------------------------
-- 상품문의 테이블
DROP TABLE CUSTOM
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CUST;

CREATE TABLE CUSTOM(
CUST_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
REF NUMBER(8) NOT NULL,
STEP NUMBER(8) NOT NULL,
DEPTH NUMBER(8) NOT NULL,
TITLE VARCHAR2(200) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
WDATE DATE NOT NULL,
PARENT NUMBER(8) NOT NULL,
DEL NUMBER(1) NOT NULL,
LOCK_ NUMBER(1) NOT NULL,
READCOUNT NUMBER(8) NOT NULL,
FILENAME VARCHAR2(50)
);

-- 추가 컬럼
-- ALTER TABLE CUSTOM ADD(FILENAME VARCHAR2(50));

CREATE SEQUENCE SEQ_CUST
START WITH 1
INCREMENT BY 1;

ALTER TABLE CUSTOM
ADD CONSTRAINT FK_CUST_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);
---------------------------------------------------
-- 설문조사 테이블(POLL, POLLSUB, VOTER)
-- POLL
DROP TABLE POLL
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_POLL;

CREATE TABLE POLL(
POLLID NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
QUESTION VARCHAR2(1000) NOT NULL,
SDATE DATE NOT NULL,
EDATE DATE NOT NULL,
ITEMCOUNT NUMBER NOT NULL,
POLLTOTAL NUMBER NOT NULL,
REGDATE DATE NOT NULL
);

CREATE SEQUENCE SEQ_POLL
START WITH 1
INCREMENT BY 1;

ALTER TABLE POLL
ADD CONSTRAINT FK_POLL_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);

-- POLLSUB
DROP TABLE POLLSUB
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_POLLSUB;

CREATE TABLE POLLSUB(
POLLSUBID NUMBER NOT NULL,
POLLID NUMBER NOT NULL,
ANSWER VARCHAR2(1000) NOT NULL,
ACOUNT NUMBER NOT NULL,
CONSTRAINT POLLSUB_PK PRIMARY KEY(POLLSUBID)
);

CREATE SEQUENCE SEQ_POLLSUB
START WITH 1
INCREMENT BY 1;

ALTER TABLE POLLSUB
ADD CONSTRAINT FK_POLLSUB_ID FOREIGN KEY(POLLID)
REFERENCES POLL(POLLID);
------------------------------------------------
DROP TABLE VOTER
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_VOTER;

CREATE TABLE VOTER(
VOTERID NUMBER NOT NULL,
POLLID NUMBER NOT NULL,
POLLSUBID NUMBER NOT NULL,
ID VARCHAR2(50) NOT NULL,
REGDATE DATE NOT NULL,
CONSTRAINT VOTER_PK PRIMARY KEY(VOTERID)
);

CREATE SEQUENCE SEQ_VOTER
START WITH 1
INCREMENT BY 1;

ALTER TABLE VOTER ADD CONSTRAINT VOTER_FK
FOREIGN KEY(POLLID)
REFERENCES POLL(POLLID);

ALTER TABLE VOTER ADD CONSTRAINT VOTER_FK2
FOREIGN KEY(POLLSUBID)
REFERENCES POLLSUB(POLLSUBID);

ALTER TABLE VOTER ADD CONSTRAINT VOTER_FK3
FOREIGN KEY(ID)
REFERENCES MEMBER(ID);
------------------------------------------------
-- 메모 테이블
DROP TABLE MEMO
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_MEMO;

CREATE TABLE MEMO(
MEMO_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
DEL NUMBER(1) NOT NULL,
RDATE DATE NOT NULL,
MODEL_ID VARCHAR2(50) NOT NULL
);

CREATE SEQUENCE SEQ_MEMO
START WITH 1
INCREMENT BY 1;

ALTER TABLE MEMO
ADD CONSTRAINT FK_MEMO_MD FOREIGN KEY(MODEL_ID)
REFERENCES INVENTORY(MODEL_ID);
--------------------------------------------------------


