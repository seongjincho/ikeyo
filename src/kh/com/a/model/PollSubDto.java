package kh.com.a.model;

import java.io.Serializable;


/*
DROP TABLE POLLSUB
CASCADE CONSTRAINT;

DROP SEQUENCE POLLSUB_SEQ;

CREATE TABLE POLLSUB(
    POLLSUBID NUMBER NOT NULL,
    POLLID NUMBER NOT NULL,
    ANSWER VARCHAR2(1000) NOT NULL,
    ACOUNT NUMBER NOT NULL,
    CONSTRAINT POLLSUB_PK PRIMARY KEY(POLLSUBID)
);

CREATE SEQUENCE POLLSUB_SEQ
START WITH 1
INCREMENT BY 1;

ALTER TABLE POLLSUB ADD CONSTRAINT POLLSUB_FK
FOREIGN KEY(POLLID)
REFERENCES POLL(POLLID);
*/






// 투표 보기들  
public class PollSubDto implements Serializable {

	private int pollsubid;  // 보기등록 번호 ex) 1사과 2배 3귤  sequnce가 들어간다 
	private int pollid;     // 질문번호         ex) 1 번 질문에 대한 1번 보기 사과  2번 배 3번 귤
	private String answer;  // 보기(1사과 2배 3귤 이 여기 들어간다 )
	private int acount;     // 현재 이 보기를 선택 사람 수   ex) 사과는 몇명  배는 몇명 귤은 몇명 선택 했는지 
 	
	
	public PollSubDto() {
		// TODO Auto-generated constructor stub
	}


	public PollSubDto(int pollsubid, int pollid, String answer, int acount) {
		super();
		this.pollsubid = pollsubid;
		this.pollid = pollid;
		this.answer = answer;
		this.acount = acount;
	}


	public int getPollsubid() {
		return pollsubid;
	}


	public void setPollsubid(int pollsubid) {
		this.pollsubid = pollsubid;
	}


	public int getPollid() {
		return pollid;
	}


	public void setPollid(int pollid) {
		this.pollid = pollid;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public int getAcount() {
		return acount;
	}


	public void setAcount(int acount) {
		this.acount = acount;
	}
	
	
}
