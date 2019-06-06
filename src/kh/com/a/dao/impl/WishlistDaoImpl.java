package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.model.CartDto;
import kh.com.a.model.ProductDto;


@Repository
public class WishlistDaoImpl implements kh.com.a.dao.WishlistDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Wish.";
	
	// 리스트
	@Override
	public List<CartDto> wishList() {
		
		return sqlSession.selectList(ns + "wishList");
		
	}

	// p리스트
	@Override
	public List<ProductDto> pList() {
	
		return sqlSession.selectList(ns + "pList");
	}

	// 삭제
	@Override
	public int wishdel(int seq) throws Exception {
		int n = sqlSession.delete(ns+"wishdel", seq);
		return n;
	}

	@Override
	public int wishdeltt(int seqq) throws Exception {
		
		int n = sqlSession.delete(ns+"wishdeltt", seqq);
		return n;
	}

	
	


}
