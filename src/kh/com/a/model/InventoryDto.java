package kh.com.a.model;

import java.io.Serializable;
import java.util.Date;

/*
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
 */
public class InventoryDto implements Serializable {

	private int inven_seq;		// 재고시퀀스
	private String model_id;	// 제품id
	private String category;	// 제품 카테고리
	private int count;			// 수량
	private int price;			// 가격
	private Date rdate; 		// 등록일
	private int del;			// 삭제여부
	
	public InventoryDto() {
	}

	public InventoryDto(int inven_seq, String model_id, String category, int count, int price, Date rdate, int del) {
		super();
		this.inven_seq = inven_seq;
		this.model_id = model_id;
		this.category = category;
		this.count = count;
		this.price = price;
		this.rdate = rdate;
		this.del = del;
	}
	
	public int getInven_seq() {
		return inven_seq;
	}

	public void setInven_seq(int inven_seq) {
		this.inven_seq = inven_seq;
	}

	public String getModel_id() {
		return model_id;
	}

	public void setModel_id(String model_id) {
		this.model_id = model_id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	@Override
	public String toString() {
		return "InventoryDto [inven_seq=" + inven_seq + ", model_id=" + model_id + ", category=" + category + ", count="
				+ count + ", price=" + price + ", rdate=" + rdate + ", del=" + del + "]";
	}

	
	
	
	
	
}

