package kh.com.a.model;

import java.util.Date;

/*
-- ORDER_SUB 테이블
DROP TABLE ORDER_SUB
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_ORDER_SUB;

CREATE TABLE ORDER_SUB(
ORDER_SUB_SEQ NUMBER(8) PRIMARY KEY,
MODEL_ID VARCHAR2(50) NOT NULL,
COUNT NUMBER(10) NOT NULL,
PRICE NUMBER(20) NOT NULL,
DEL NUMBER(1) NOT NULL,
RDATE DATE NOT NULL,
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


ALTER TABLE ORDER_SUB DROP COLUMN RDATE;
ALTER TABLE ORDER_SUB DROP COLUMN DEL;
ALTER TABLE ORDER_SUB DROP COLUMN PRICE;
*/
public class Order_Sub_Dto {

	private int order_sub_seq;  // 서브 시퀀즈
	private String model_id;    // 모델id
	private int count;       // 총 수량
	private String order_num; // 주문번호
			
	public Order_Sub_Dto() {
		// TODO Auto-generated constructor stub
	}

	public Order_Sub_Dto(int order_sub_seq, String model_id, int count, String order_num) {
		super();
		this.order_sub_seq = order_sub_seq;
		this.model_id = model_id;
		this.count = count;
		this.order_num = order_num;
	}

	public int getOrder_sub_seq() {
		return order_sub_seq;
	}

	public void setOrder_sub_seq(int order_sub_seq) {
		this.order_sub_seq = order_sub_seq;
	}

	public String getModel_id() {
		return model_id;
	}

	public void setModel_id(String model_id) {
		this.model_id = model_id;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getOrder_num() {
		return order_num;
	}

	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}

	@Override
	public String toString() {
		return "Order_Sub_Dto [order_sub_seq=" + order_sub_seq + ", model_id=" + model_id + ", count=" + count
				+ ", order_num=" + order_num + "]";
	}


}
