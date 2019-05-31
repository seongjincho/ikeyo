package kh.com.a.model;

import java.io.Serializable;

public class PagingParam implements Serializable {
	private String s_category;
	private String s_keyword;
	private String category;
	private int recordCountPerPage = 8;	// 표현할 한 페이지의 글수
	private int pageNumber = 0;	// 페이지 번호
	private int start = 1;
	private int end = 10;
	private	String id;
	
	public PagingParam() { }

	public PagingParam(String s_category, String s_keyword, String category, int recordCountPerPage, int pageNumber, int start,
			int end) {
		super();
		this.s_category = s_category;
		this.s_keyword = s_keyword;
		this.category = category;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
}
