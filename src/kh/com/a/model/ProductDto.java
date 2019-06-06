package kh.com.a.model;

import java.io.Serializable;
import java.util.Date;

/*
 -----------------------------------------
-- 상품테이블
DROP TABLE PRODUCT
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_PROD;

CREATE TABLE PRODUCT(
PROD_SEQ NUMBER(8) PRIMARY KEY,
MODEL_ID VARCHAR2(50) NOT NULL,
P_NAME VARCHAR2(200) NOT NULL,
CONTENT VARCHAR2(2000) NOT NULL,
PHOTO_BF1 VARCHAR2(50),
PHOTO_BF2 VARCHAR2(50),
PHOTO_BF3 VARCHAR2(50),
PHOTO_AF1 VARCHAR2(50),
PHOTO_AF2 VARCHAR2(50),
PHOTO_AF3 VARCHAR2(50),
PDF_BF VARCHAR2(50),
PDF_AF VARCHAR2(50),
READCOUNT NUMBER(8) NOT NULL,
PRICE NUMBER(20) NOT NULL,
RDATE DATE NOT NULL
);

CREATE SEQUENCE SEQ_PROD
START WITH 1
INCREMENT BY 1;

ALTER TABLE PRODUCT
ADD CONSTRAINT FK_PROD_MD FOREIGN KEY(MODEL_ID)
REFERENCES INVENTORY(MODEL_ID);
 */

public class ProductDto implements Serializable {

	private int prod_seq;		// 상품 시퀀스
	private String model_id;	// 상품 id
	private String p_name;		// 상품이름
	private String content;		// 상품정보
	private String photo_bf1;	// 원본사진1
	private String photo_bf2;	// 원본사진2
	private String photo_bf3;	// 원본사진3
	private String photo_af1;	// 수정사진1
	private String photo_af2;	// 수정사진2
	private String photo_af3;	// 수정사진3
	private String pdf_bf;		// 원본파일이름(메뉴얼pdf)
	private String pdf_af;		// 수정파일이름(메뉴얼pdf)
	private int readcount;		// 조회수
	private int price;			// 가격
	private Date rdate;			// 등록일
	private int likecount;			// 좋아요수
	
	private String category;	// 정보이동용 카테고리
	
	public ProductDto() {
	}
	
	public ProductDto(int prod_seq, String model_id, String p_name, String content, String photo_bf1, String photo_bf2,
			String photo_bf3, String photo_af1, String photo_af2, String photo_af3, String pdf_bf, String pdf_af,
			int readcount, int price, Date rdate, int likecount , String category) {
		super();
		this.prod_seq = prod_seq;
		this.model_id = model_id;
		this.p_name = p_name;
		this.content = content;
		this.photo_bf1 = photo_bf1;
		this.photo_bf2 = photo_bf2;
		this.photo_bf3 = photo_bf3;
		this.photo_af1 = photo_af1;
		this.photo_af2 = photo_af2;
		this.photo_af3 = photo_af3;
		this.pdf_bf = pdf_bf;
		this.pdf_af = pdf_af;
		this.readcount = readcount;
		this.price = price;
		this.rdate = rdate;
		this.likecount = likecount;
		this.category = category;
	}

	public int getProd_seq() {
		return prod_seq;
	}
	public void setProd_seq(int prod_seq) {
		this.prod_seq = prod_seq;
	}
	public String getModel_id() {
		return model_id;
	}
	public void setModel_id(String model_id) {
		this.model_id = model_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getPhoto_bf1() {
		return photo_bf1;
	}
	public void setPhoto_bf1(String photo_bf1) {
		this.photo_bf1 = photo_bf1;
	}
	public String getPhoto_bf2() {
		return photo_bf2;
	}
	public void setPhoto_bf2(String photo_bf2) {
		this.photo_bf2 = photo_bf2;
	}
	public String getPhoto_bf3() {
		return photo_bf3;
	}
	public void setPhoto_bf3(String photo_bf3) {
		this.photo_bf3 = photo_bf3;
	}
	public String getPhoto_af1() {
		return photo_af1;
	}
	public void setPhoto_af1(String photo_af1) {
		this.photo_af1 = photo_af1;
	}
	public String getPhoto_af2() {
		return photo_af2;
	}
	public void setPhoto_af2(String photo_af2) {
		this.photo_af2 = photo_af2;
	}
	public String getPhoto_af3() {
		return photo_af3;
	}
	public void setPhoto_af3(String photo_af3) {
		this.photo_af3 = photo_af3;
	}
	public String getPdf_bf() {
		return pdf_bf;
	}
	public void setPdf_bf(String pdf_bf) {
		this.pdf_bf = pdf_bf;
	}
	public String getPdf_af() {
		return pdf_af;
	}
	public void setPdf_af(String pdf_af) {
		this.pdf_af = pdf_af;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
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

	public int getLikecount() {
		return likecount;
	}

	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "ProductDto [prod_seq=" + prod_seq + ", model_id=" + model_id + ", p_name=" + p_name + ", content="
				+ content + ", photo_bf1=" + photo_bf1 + ", photo_bf2=" + photo_bf2 + ", photo_bf3=" + photo_bf3
				+ ", photo_af1=" + photo_af1 + ", photo_af2=" + photo_af2 + ", photo_af3=" + photo_af3 + ", pdf_bf="
				+ pdf_bf + ", pdf_af=" + pdf_af + ", readcount=" + readcount + ", price=" + price + ", rdate=" + rdate
				+ ", likecount=" + likecount + ", category=" + category + "]";
	}

	
	
}
