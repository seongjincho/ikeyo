package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.CartDao;
import kh.com.a.model.CartDto;
import kh.com.a.model.ProductDto;

@Repository
public class CartDaoImpl implements CartDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Cart.";
	
	// 리스트
	@Override
	public List<CartDto> cartlist() {
		
		return sqlSession.selectList(ns + "cartlist");
	}

	// p리스트
	@Override
	public List<ProductDto> pList() {
		
		return sqlSession.selectList(ns + "pList");
	}

	// 삭제
	@Override
	public int cartdel(int seq) throws Exception {
		
		int n = sqlSession.delete(ns+"cartdel", seq);
		return n;
	}

	// 선택삭제
	@Override
	public int cartdeltt(int seqq) throws Exception {
		
		int n = sqlSession.delete(ns+"cartdeltt", seqq);
		return n;
	}
	
	
	

}
