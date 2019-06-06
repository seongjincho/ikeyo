package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.OrderDao;
import kh.com.a.model.CartDto;
import kh.com.a.model.Order_Dto;
import kh.com.a.model.Order_Sub_Dto;
import kh.com.a.model.ProductDto;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Order.";

	// 하나만 주문
	@Override
	public List<CartDto> oneOrderlist(int seq) {
		
		return sqlSession.selectList(ns + "oneOrderlist", seq);
	}

	// p리스트
	@Override
	public List<ProductDto> orderpList() {

		return sqlSession.selectList(ns + "orderpList");
	}

	
	@Override
	public int twoOrderlist(int seqq) throws Exception {
	
		return sqlSession.selectOne(ns + "twoOrderlist", seqq);
		
	}


	@Override
	public CartDto getOrder(int seq) {
		CartDto dto = sqlSession.selectOne(ns + "twoOrderlist", seq);
		return dto;
	}

	// 주문정보                         
	@Override
	public void order(Order_Dto dto) throws Exception {
		
		sqlSession.insert(ns + "order", dto);
		
	}

	// 상세
	@Override
	public void orderdetail(Order_Sub_Dto sdto) throws Exception {
		sqlSession.insert(ns + "orderdetail", sdto);
		
	}

	
	// 카트비우기
	@Override
	public void cartdelete(int sseq) throws Exception {
		sqlSession.delete(ns + "cartdelete", sseq);
		
	}
	/*
	// 결제정보
	@Override
	public List<Order_Dto> paymentlist(String id) throws Exception {
		return sqlSession.selectList(ns + "paymentlist", id);
	}
	*/
	@Override
	   public List<Order_Dto> paymentlistto(String order_num) throws Exception {
	      
	      return sqlSession.selectList(ns + "paymentlistto", order_num);
	   }

	
	// 결제완료 : deli_info -> 1 변경
	@Override
	public boolean dellinfo(int ord_seq) {
			
		int b = sqlSession.update(ns + "dellinfo", ord_seq);
			
		return b>0?true:false;
			
	}
	
	@Override
	public boolean minusCountInven(Order_Sub_Dto sdto) {
		int n = sqlSession.update(ns + "minusCountInven", sdto);
		return n>0?true:false;
	}
	


}
