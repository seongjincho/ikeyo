package kh.com.a.model;

import java.io.Serializable;
import java.util.Date;

/*
 -- QNA
DROP TABLE QNA
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_QNA;

CREATE TABLE QNA(
QNA_SEQ NUMBER(8) PRIMARY KEY,
ID VARCHAR2(50) NOT NULL,
TITLE VARCHAR2(200) NOT NULL,
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
 */
public class QnADto implements Serializable {

	private int qna_seq;		// 시퀀스
	private String id;			// 아이디
	private String title;		// 제목
	private String content;		// 내용
	private Date wdate;			// 작성일
	private String answer;		// 답글
	private Date adate;			// 답글작성일
	private int readcount;		// 조회수
	private int parent;			// 상품글 시퀀스
	private int del;			// 삭제여부
	
	public QnADto() {
	}

	public QnADto(int qna_seq, String id, String title, String content, Date wdate, String answer, Date adate, int readcount,
			int parent, int del) {
		super();
		this.qna_seq = qna_seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.wdate = wdate;
		this.answer = answer;
		this.adate = adate;
		this.readcount = readcount;
		this.parent = parent;
		this.del = del;
	}

	public int getQna_seq() {
		return qna_seq;
	}

	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
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

	public Date getWdate() {
		return wdate;
	}

	public void setWdate(Date wdate) {
		this.wdate = wdate;
	}

	public String getAnswer() {
		return answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

	public Date getAdate() {
		return adate;
	}

	public void setAdate(Date adate) {
		this.adate = adate;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
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

	@Override
	public String toString() {
		return "QnADto [qna_seq=" + qna_seq + ", id=" + id + ", title=" + title + ", content=" + content + ", wdate="
				+ wdate + ", answer=" + answer + ", adate=" + adate + ", readcount=" + readcount + ", parent=" + parent
				+ ", del=" + del + "]";
	}
	
}
