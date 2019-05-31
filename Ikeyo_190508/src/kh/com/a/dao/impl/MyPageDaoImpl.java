package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.MyPageDao;
import kh.com.a.model.MemberDto;
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
	
}
