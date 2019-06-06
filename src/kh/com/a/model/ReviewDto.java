package kh.com.a.model;

import java.io.Serializable;
import java.util.Date;

/*
-- 상품평
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
 */
public class ReviewDto implements Serializable {
	
	private int rev_seq;		// 시퀀스
	private String model_id;	// 상품id
	private String id;			// 작성자 id
	private String title;		// 제목
	private String content;		// 내용
	private int starpoint;		// 별점
	private String photo_bf;	// 원본파일이름
	private String photo_af;	// 업로드파일이름
	private Date wdate;			// 작성일
	private int parent;			// 상품디테일번호
	private int del;			// 삭제여부
	
	public ReviewDto() {
	}

	public ReviewDto(int rev_seq, String model_id, String id, String title, String content, int starpoint, String photo_bf,
			String photo_af, Date wdate, int parent, int del) {
		super();
		this.rev_seq = rev_seq;
		this.model_id = model_id;
		this.id = id;
		this.title = title;
		this.content = content;
		this.starpoint = starpoint;
		this.photo_bf = photo_bf;
		this.photo_af = photo_af;
		this.wdate = wdate;
		this.parent = parent;
		this.del = del;
	}

	public int getRev_seq() {
		return rev_seq;
	}

	public void setRev_seq(int rev_seq) {
		this.rev_seq = rev_seq;
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

	public int getStarpoint() {
		return starpoint;
	}

	public void setStarpoint(int starpoint) {
		this.starpoint = starpoint;
	}

	public String getPhoto_bf() {
		return photo_bf;
	}

	public void setPhoto_bf(String photo_bf) {
		this.photo_bf = photo_bf;
	}

	public String getPhoto_af() {
		return photo_af;
	}

	public void setPhoto_af(String photo_af) {
		this.photo_af = photo_af;
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

	@Override
	public String toString() {
		return "ReviewDto [rev_seq=" + rev_seq + ", model_id=" + model_id + ", id=" + id + ", title=" + title + ", content=" + content
				+ ", starpoint=" + starpoint + ", photo_bf=" + photo_bf + ", photo_af=" + photo_af + ", wdate=" + wdate
				+ ", parent=" + parent + ", del=" + del + "]";
	}
	
}
