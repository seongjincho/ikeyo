package kh.com.a.model;

import java.io.Serializable;
/*
-- 출석체크 테이블
DROP TABLE CALENDAR
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_CAL;

CREATE TABLE CALENDAR(
CAL_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
RDATE DATE NOT NULL
);

CREATE SEQUENCE SEQ_CAL
START WITH 1
INCREMENT BY 1;

ALTER TABLE CALENDAR
ADD CONSTRAINT FK_CAL_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);

// RDATE Date -> String 으로 변경 
ALTER TABLE calendar MODIFY(RDATE VARCHAR2(30));

 */
import java.util.Date;
public class CalendarDto implements Serializable {
	
	private int cal_seq;	// 출석체크 seq
	private String id;		// 멤버 id
	private String rdate;   // 등록일
	
	public CalendarDto() {
	}

	public CalendarDto(int cal_seq, String id, String rdate) {
		super();
		this.cal_seq = cal_seq;
		this.id = id;
		this.rdate = rdate;
	}

	public int getCal_seq() {
		return cal_seq;
	}

	public void setCal_seq(int cal_seq) {
		this.cal_seq = cal_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRdate() {
		return rdate;
	}

	public void setRdate(String rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "CalendarDto [cal_seq=" + cal_seq + ", id=" + id + ", rdate=" + rdate + "]";
	}

	
}
