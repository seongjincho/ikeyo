package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.AllOrderDao;
import kh.com.a.model.BbsParam;
import kh.com.a.model.Order_Dto;
import kh.com.a.model.Order_Sub_Dto;


@Repository
public class AllOrderDaoImpl implements AllOrderDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "AllOrder.";

	@Override
	public List<Order_Dto> allOrderList(BbsParam param) {
		
		return sqlSession.selectList(ns + "allOrderList", param);
	}

	@Override
	public int getAllOrderCount(BbsParam param) {
	
		return sqlSession.selectOne(ns + "getAllOrderCount", param);
	}

	@Override
	public Order_Dto getDetail(String order_num) {
		
		return sqlSession.selectOne(ns + "getDetail", order_num);
	}

	@Override
	public List<Order_Sub_Dto> getDetail_sub(String order_num) {
		
		return sqlSession.selectList(ns + "getDetail_sub", order_num);
	}

	@Override
	public boolean deliInfoUpdate(String ord_seq) {
		
		int n =sqlSession.update(ns + "deliInfoUpdate", ord_seq);
		
		return n>0?true:false;
	}

	@Override
	public boolean deliInfoFix(String ord_seq) {
		
		int n = sqlSession.update(ns + "deliInfoFix", ord_seq);
		return n>0?true:false;
	}
	
	
	
	
	
}
