package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.CustomDto;
import kh.com.a.model.NoticeParam;

public interface CustomDao {
	
	// 리스트불러오기
	public List<CustomDto> getCustomList(NoticeParam param);
	public int getCustomCount(NoticeParam param);
	// 글쓰기
	public boolean uploadCustom(CustomDto cust);
	// 디테일
	public CustomDto getCustom(int seq);
	// 조회수
	public boolean custReadCount(int seq);
	// 답글쓰기
	public boolean stepUpCustom(int seq);
	public boolean writeCustAnswer(CustomDto cust);
	// 글 삭제
	public boolean deleteCustom(int seq);
	// 글 수정
	public boolean updateCustom(CustomDto cust);
	
	
}
