package kh.com.a.model;

import java.io.Serializable;
import java.util.Date;

/*
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

CREATE SEQUENCE SEQ_CUST
START WITH 1
INCREMENT BY 1;

ALTER TABLE CUSTOM
ADD CONSTRAINT FK_CUST_ID FOREIGN KEY(ID)
REFERENCES MEMBER(ID);
 */

public class CustomDto implements Serializable {

	private int cust_seq; //상품문의 시퀀스
	private String id;    // 아이디 
	private int ref;      // ref
	private int step;     // step
	private int depth;    // depth
	private String title; // 상품문의 제목
	private String content; // 상품문의 내용
	private Date wdate;     // 작성날짜 
	private int parent;     // parent
	private int del;        //  삭제유무 
	private int lock_;      //  공개 ,비공개
	private int readcount;  // 조회수 
	private String filename;	// 파일경로
	
	public CustomDto() {
		// TODO Auto-generated constructor stub
	}

	public CustomDto(int cust_seq, String id, int ref, int step, int depth, String title, String content, Date wdate,
			int parent, int del, int lock_, int readcount, String filename) {
		super();
		this.cust_seq = cust_seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.parent = parent;
		this.del = del;
		this.lock_ = lock_;
		this.readcount = readcount;
		this.filename = filename;
	}

	public int getCust_seq() {
		return cust_seq;
	}

	public void setCust_seq(int cust_seq) {
		this.cust_seq = cust_seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
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

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public int getParent() {
		return parent;
	}

	public void setParent(int parent) {
		this.parent = parent;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getLock_() {
		return lock_;
	}

	public void setLock_(int lock_) {
		this.lock_ = lock_;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	@Override
	public String toString() {
		return "CustomDto [cust_seq=" + cust_seq + ", id=" + id + ", ref=" + ref + ", step=" + step + ", depth=" + depth
				+ ", title=" + title + ", content=" + content + ", wdate=" + wdate + ", parent=" + parent + ", del="
				+ del + ", lock_=" + lock_ + ", readcount=" + readcount + ", filename=" + filename + "]";
	}
	
	
	
	
	
}
