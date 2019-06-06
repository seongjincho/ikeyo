package kh.com.a.model;

import java.io.Serializable;
import java.util.Date;

/*
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
 */

public class NoticeDto implements Serializable {

	
	private int noti_seq;	// 공지사항 시퀀스
	private String id;		// 멤버id
	private String title;	// 제목
	private String content;	// 내용
	private int readcount;	// 조회수
	private Date rdate;		// 등록일
	
	public NoticeDto() {
	}

	public NoticeDto(int noti_seq, String id, String title, String content, int readcount, Date rdate) {
		super();
		this.noti_seq = noti_seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.readcount = readcount;
		this.rdate = rdate;
	}

	public int getNoti_seq() {
		return noti_seq;
	}

	public void setNoti_seq(int noti_seq) {
		this.noti_seq = noti_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public Date getRdate() {
		return rdate;
	}

	public void setRdate(Date rdate) {
		this.rdate = rdate;
	}

	@Override
	public String toString() {
		return "NoticeDto [noti_seq=" + noti_seq + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", readcount=" + readcount + ", rdate=" + rdate + "]";
	}
	
	
}
