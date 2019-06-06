package kh.com.a.model;

import java.io.Serializable;

public class BbsParam implements Serializable {

	// search
	private String s_category; // 제목, 내용, 작성자
	private String s_keyword;  // 검색어 
	
	// paging
	private int recordCountPerPage = 20; // 표현할 한 페이지의 글수 10개씩 표현한다   
	private int pageNumber = 0;  		 // 페이지 번호  현재페이지 넘버 ?
	
	
	// start, end
	private int start = 1;
	private int end = 10;
	
	public BbsParam() {
		
	}

	public BbsParam(String s_category, String s_keyword) {
		super();
		this.s_category = s_category;
		this.s_keyword = s_keyword;
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

	@Override
	public String toString() {
		return "BbsParam [s_category=" + s_category + ", s_keyword=" + s_keyword + ", recordCountPerPage="
				+ recordCountPerPage + ", pageNumber=" + pageNumber + ", start=" + start + ", end=" + end + "]";
	}
	
	
	
	
}
