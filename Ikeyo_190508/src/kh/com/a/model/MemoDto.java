package kh.com.a.model;

import java.io.Serializable;
import java.util.Date;



/*
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
*/


public class MemoDto implements Serializable {

	private int memo_seq; // 메모 시퀀스!
	private String id;    // id  멤버 테이블 id  참조  외래키 
	private String content;  //  메모 내용 
	private int del;         //   삭제 
	private Date rdate;      // 등록 날짜 
	private String model_id; // 모델명
	
	public MemoDto() {
		
	}
	
	
	

	public MemoDto(int memo_seq, int del) {
		super();
		this.memo_seq = memo_seq;
		this.del = del;
	}




	public MemoDto(int memo_seq, String id, String content, int del, Date rdate, String model_id) {
		super();
		this.memo_seq = memo_seq;
		this.id = id;
		this.content = content;
		this.del = del;
		this.rdate = rdate;
		this.model_id = model_id;
	}




	public int getMemo_seq() {
		return memo_seq;
	}

	public void setMemo_seq(int memo_seq) {
		this.memo_seq = memo_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	public String getModel_id() {
		return model_id;
	}

	public void setModel_id(String model_id) {
		this.model_id = model_id;
	}




	@Override
	public String toString() {
		return "MemoDto [memo_seq=" + memo_seq + ", id=" + id + ", content=" + content + ", del=" + del + ", rdate="
				+ rdate + ", model_id=" + model_id + "]";
	}



	
	
	
	
}
