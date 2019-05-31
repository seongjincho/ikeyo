package kh.com.a.model;

import java.io.Serializable;

/*
DROP TABLE MEMBER
CASCADE CONSTRAINTS;

CREATE TABLE MEMBER(
ID VARCHAR2(50) PRIMARY KEY,
PWD VARCHAR2(50) NOT NULL,
NAME VARCHAR2(50) NOT NULL,
EMAIL VARCHAR2(50) UNIQUE NOT NULL,
ADDRESS1 VARCHAR2(50) NOT NULL,
ADDRESS2 VARCHAR2(50),
AUTH NUMBER(1) NOT NULL,
PHONE VARCHAR2(50) UNIQUE NOT NULL,
PAYPWD NUMBER(6) NOT NULL,
DEL NUMBER(1) NOT NULL
);
 */

public class MemberDto implements Serializable {
	 private String id;         // 아이디
	   private String pwd;         // 비밀번호
	   private String name;      // 이름
	   private String email;      // 이메일
	   private String address1;   // 주소1
	   private String address2;   // 주소2
	   private int auth;         // 회원등급
	   private String phone;      // 전화번호
	   private int paypwd;         // 결제비밀번호
	   private int del;         // 회원탈퇴
	   private String grade;	// 등급
	   private int point;		// 포인트
	   private String authkey;	// 인증키생성
	   private int authstatus;	// 인증값(0, 1)
	   private int naver=0;
	   
	   public MemberDto() {
	   }

	   public MemberDto(String id, String pwd, String name, String email, String address1, String address2, int auth,
			String phone, int paypwd, int del, String grade, int point) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.address1 = address1;
		this.address2 = address2;
		this.auth = auth;
		this.phone = phone;
		this.paypwd = paypwd;
		this.del = del;
		this.grade = grade;
		this.point = point;
	}

	public String getId() {
	      return id;
	   }

	   public void setId(String id) {
	      this.id = id;
	   }

	   public String getPwd() {
	      return pwd;
	   }

	   public void setPwd(String pwd) {
	      this.pwd = pwd;
	   }

	   public String getName() {
	      return name;
	   }

	   public void setName(String name) {
	      this.name = name;
	   }

	   public String getEmail() {
	      return email;
	   }

	   public void setEmail(String email) {
	      this.email = email;
	   }

	   public String getAddress1() {
	      return address1;
	   }

	   public void setAddress1(String address1) {
	      this.address1 = address1;
	   }

	   public String getAddress2() {
	      return address2;
	   }

	   public void setAddress2(String address2) {
	      this.address2 = address2;
	   }

	   public int getAuth() {
	      return auth;
	   }

	   public void setAuth(int auth) {
	      this.auth = auth;
	   }

	   public String getPhone() {
	      return phone;
	   }

	   public void setPhone(String phone) {
	      this.phone = phone;
	   }

	   public int getPaypwd() {
	      return paypwd;
	   }

	   public void setPaypwd(int paypwd) {
	      this.paypwd = paypwd;
	   }

	   public int getDel() {
	      return del;
	   }

	   public void setDel(int del) {
	      this.del = del;
	   }

	   public String getGrade() {
		   return grade;
	   }

	 public void setGrade(String grade) {
		this.grade = grade;
	 }

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}

	public int getAuthstatus() {
		return authstatus;
	}

	public void setAuthstatus(int authstatus) {
		this.authstatus = authstatus;
	}

	public int getNaver() {
		return naver;
	}

	public void setNaver(int naver) {
		this.naver = naver;
	}

	@Override
	   public String toString() {
	      return "MemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", address1=" + address1
	            + ", address2=" + address2 + ", auth=" + auth + ", phone=" + phone + ", paypwd=" + paypwd + ", del="
	            + del + "]";
	   }

}
