package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MyPageDao;
import kh.com.a.model.MemberDto;
import kh.com.a.model.Order_Dto;
import kh.com.a.model.Order_Sub_Dto;
import kh.com.a.model.PagingParam;
import kh.com.a.model.ProductDto;
import kh.com.a.model.QnADto;
import kh.com.a.model.ReviewDto;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	@Autowired
	SqlSession sqlSession;
	String ns = "MyPage.";
	
	@Override
	public MemberDto myInfo(MemberDto dto) {
		
		return sqlSession.selectOne(ns + "myInfo", dto);
	}

	@Override
	public MemberDto checkPwd(MemberDto dto) {
		
		return sqlSession.selectOne(ns + "checkPwd", dto);
	}

	@Override
	public boolean myInfoUpdate(MemberDto dto) {
		int n = sqlSession.update(ns + "myInfoUpdate", dto);
		
		return n>0 ? true : false;
	}

	@Override
	public String phoneCheck(MemberDto dto) {
		
		return sqlSession.selectOne(ns + "phoneCheck", dto);
	}

	@Override
	public MemberDto myPhone(MemberDto dto) {
		
		return sqlSession.selectOne(ns + "myPhone", dto);
	}

	@Override
	public boolean myInfoUp(MemberDto dto) {
		int n = sqlSession.update(ns + "myInfoUp", dto);
		
		return n>0 ? true : false;
	}

	@Override
	public List<ReviewDto> getReviewList(MemberDto dto) {
		
		return sqlSession.selectList(ns + "getReviewList", dto);
	}

	@Override
	public ProductDto getProductList(ReviewDto dto) {
		
		return sqlSession.selectOne(ns + "getProductList", dto);
	}

	@Override
	public List<QnADto> getQnAList(MemberDto dto) {
		
		return sqlSession.selectList(ns + "getQnAList", dto);
	}

	@Override
	public ProductDto getProdList(QnADto dto) {
		
		return sqlSession.selectOne(ns + "getProdList", dto);
	}

	@Override
	public int getReviewCount(MemberDto dto) {
		
		return sqlSession.selectOne(ns + "getReviewCount", dto);
	}

	@Override
	public List<ReviewDto> getReviewPagingList(PagingParam param) {
		
		return sqlSession.selectList(ns + "getReviewPagingList", param);
	}

	@Override
	public int getQnACount(MemberDto dto) {
	
		return sqlSession.selectOne(ns + "getQnACount", dto);
	}

	@Override
	public List<QnADto> getQnAPagingList(PagingParam param) {
		
		return sqlSession.selectList(ns + "getQnAPagingList", param);
	}
	//주문내역 페이지
	@Override
	public List<Order_Dto> myorderpage(String id) {
		return sqlSession.selectList(ns + "myOrderpage", id);
	}

	@Override
	public List<Order_Sub_Dto> getMySubOrder(String order_num) {
		System.out.println("오더넘버: " + order_num);
		return sqlSession.selectList(ns + "mySubOrder", order_num);
	}

	@Override
	public ReviewDto getReviewModal(int seq) {
		
		return sqlSession.selectOne(ns + "getReviewModal", seq);
	}
	
	@Override
	public List<Order_Dto> paymentlist_(String order_num) {
		return sqlSession.selectList(ns + "paymentlist_", order_num);
	}

	@Override
	public boolean plusCountInven(Order_Sub_Dto dto) {
		int n = sqlSession.update(ns + "plusCountInven", dto);
		return n>0?true:false;
	}

	@Override
	public boolean deleteOrderSub(String order_num) {
		int n = sqlSession.delete(ns + "deleteOrderSub", order_num);
		return n>0?true:false;
	}

	@Override
	public boolean deleteOrder(String order_num) {
		int n = sqlSession.delete(ns + "deleteOrder", order_num);
		return n>0?true:false;
	}

	@Override
	public boolean orderFix(String order_num) {
		int n = sqlSession.update(ns + "orderFix", order_num);
		return n>0?true:false;
	}
	
	   @Override
	   public boolean pointGradeUp(MemberDto dto) {
	      
	      int n = sqlSession.update(ns + "pointGradeUp", dto);
	      
	      return  n>0?true:false;
	   }

	   @Override
	   public MemberDto newSession(MemberDto dto) {
	      
	      return sqlSession.selectOne(ns + "newSession", dto);
	   }
	
}
