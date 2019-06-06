package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.ReviewDto;

public interface ReviewDao {
	public boolean reviewWrite(ReviewDto dto);
	
	public List<ReviewDto> reviewList(String model_id);
	public ReviewDto getreview(int rev_seq);
	
	public boolean reviewUpdate(ReviewDto dto);
	
	// 마이페이지 상품평 삭제
	public void reviewDeleteMy(ReviewDto dto);
}
