package kh.com.a.model;

import java.io.Serializable;

/*
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
 */
public class CartDto implements Serializable {

	private int cart_seq;		// 장바구니/위시리스트 시퀀스
	private String model_id;	// 상품id
	private String id;			// 멤버id
	private int cart_type;		// 장바구니(2) / 위시리스트(1) 구분 
	private int count;			// 상품갯수
	
	public CartDto() {
	}

	public CartDto(int cart_seq, String model_id, String id, int cart_type, int count, int price) {
		super();
		this.cart_seq = cart_seq;
		this.model_id = model_id;
		this.id = id;
		this.cart_type = cart_type;
		this.count = count;
	
	}

	public int getCart_seq() {
		return cart_seq;
	}

	public void setCart_seq(int cart_seq) {
		this.cart_seq = cart_seq;
	}

	public String getModel_id() {
		return model_id;
	}

	public void setModel_id(String model_id) {
		this.model_id = model_id;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getCart_type() {
		return cart_type;
	}

	public void setCart_type(int cart_type) {
		this.cart_type = cart_type;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "CartDto [cart_seq=" + cart_seq + ", model_id=" + model_id + ", id=" + id + ", cart_type=" + cart_type
				+ ", count=" + count + "]";
	}
	
	
}
