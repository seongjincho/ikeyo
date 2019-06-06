package kh.com.a.model;

import java.io.Serializable;

public class NoticeParam implements Serializable {
	
	// search
	private String s_category;	// 제목, 내용, 작성자
	private String s_keyword;	// 검색어
	
	// paging
	private int recordCountPerPage = 10;	// 표현할 한 페이지의 글수
	private int pageNumber = 0;				// 페이지 번호
	
	// start, end
	private int start = 1;
	private int end = 10;
	
	public NoticeParam() {
	}

	public NoticeParam(String s_category, String s_keyword) {
		super();
		this.s_category = s_category;
		this.s_keyword = s_keyword;
	}

	public NoticeParam(String s_category, String s_keyword, int recordCountPerPage, int pageNumber, int start, int end) {
		super();
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.recordCountPerPage = recordCountPerPage;
		this.pageNumber = pageNumber;
		this.start = start;
		this.end = end;
	}

	public String getS_category() {
		return s_category;
	}

	public void setS_category(String s_category) {
		this.s_category = s_category;
	}

	public String getS_keyword() {
		return s_keyword;
	}

	public void setS_keyword(String s_keyword) {
		this.s_keyword = s_keyword;
	}

	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}

	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}

	public int getPageNumber() {
		return pageNumber;
	}

	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
	
	
	
}



















