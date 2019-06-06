package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.MemberDto;
import kh.com.a.model.Order_Dto;
import kh.com.a.model.Order_Sub_Dto;
import kh.com.a.model.PagingParam;
import kh.com.a.model.ProductDto;
import kh.com.a.model.QnADto;
import kh.com.a.model.ReviewDto;

public interface MyPageDao {
	public MemberDto myInfo(MemberDto dto);
	public MemberDto checkPwd(MemberDto dto);
	public boolean myInfoUpdate(MemberDto dto);
	public String phoneCheck(MemberDto dto);
	public MemberDto myPhone(MemberDto dto);
	public boolean myInfoUp(MemberDto dto);
	
	public List<ReviewDto> getReviewList(MemberDto dto);
	public ProductDto getProductList(ReviewDto dto);
	public List<QnADto> getQnAList(MemberDto dto);
	public ProductDto getProdList(QnADto dto);
	
	public int getReviewCount(MemberDto dto);
	public List<ReviewDto> getReviewPagingList(PagingParam param);
	
	public int getQnACount(MemberDto dto);
	public List<QnADto> getQnAPagingList(PagingParam param);
	// 마이페이지 주문내역
	public List<Order_Dto> myorderpage(String id);
	public List<Order_Sub_Dto> getMySubOrder(String order_num);
	
	// pdReview.jsp modal
	public ReviewDto getReviewModal(int seq);
	
	// 마이페이지 결제진행
	public List<Order_Dto> paymentlist_(String order_num);
	// 주문 취소
	public boolean plusCountInven(Order_Sub_Dto dto);
	public boolean deleteOrderSub(String order_num);
	public boolean deleteOrder(String order_num);
	// 구매 확정
	public boolean orderFix(String order_num);
	
	   public boolean pointGradeUp(MemberDto dto);
	   public MemberDto newSession(MemberDto dto);
	
}
