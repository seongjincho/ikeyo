package kh.com.a.model;

import java.io.Serializable;
import java.util.Date;

/*
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
 */

public class Order_Dto implements Serializable {

	private int ord_seq;		// 주문관리 시퀀스
	private String id;			// 멤버 id
	private int total_price;	// 총 가격
	private String order_num;		// 주문번호
	private int deli_info;		// 배송상태
	private Date regdate;		// 주문일
	private String rname;		// 배송자이름
	private String address1;	// 배송지 주소1
	private String address2;	// 배송지 주소2
	private String phone;		// 배송자 폰번호
	private String content;		// 주문요청사항
	private int cartseq;  

	
	public Order_Dto() {
		// TODO Auto-generated constructor stub
	}


	public Order_Dto(int ord_seq, String id, int total_price, String order_num, int deli_info, Date regdate,
			String rname, String address1, String address2, String phone, String content, int cartseq) {
		super();
		this.ord_seq = ord_seq;
		this.id = id;
		this.total_price = total_price;
		this.order_num = order_num;
		this.deli_info = deli_info;
		this.regdate = regdate;
		this.rname = rname;
		this.address1 = address1;
		this.address2 = address2;
		this.phone = phone;
		this.content = content;
		this.cartseq = cartseq;
	}


	public int getOrd_seq() {
		return ord_seq;
	}


	public void setOrd_seq(int ord_seq) {
		this.ord_seq = ord_seq;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public int getTotal_price() {
		return total_price;
	}


	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}


	public String getOrder_num() {
		return order_num;
	}


	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}


	public int getDeli_info() {
		return deli_info;
	}


	public void setDeli_info(int deli_info) {
		this.deli_info = deli_info;
	}


	public Date getRegdate() {
		return regdate;
	}


	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}


	public String getRname() {
		return rname;
	}


	public void setRname(String rname) {
		this.rname = rname;
	}


	public String getAddress1() {
		return address1;
	}


	public void setAddress1(String address1) {
		this.address1 = address1;
	}


	public String getAddress2() {
		return address2;
	}


	public void setAddress2(String address2) {
		this.address2 = address2;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getCartseq() {
		return cartseq;
	}


	public void setCartseq(int cartseq) {
		this.cartseq = cartseq;
	}


	@Override
	public String toString() {
		return "Order_Dto [ord_seq=" + ord_seq + ", id=" + id + ", total_price=" + total_price + ", order_num="
				+ order_num + ", deli_info=" + deli_info + ", regdate=" + regdate + ", rname=" + rname + ", address1="
				+ address1 + ", address2=" + address2 + ", phone=" + phone + ", content=" + content + ", cartseq="
				+ cartseq + "]";
	}


	
}
