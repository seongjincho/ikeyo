package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.AllOrderDao;
import kh.com.a.model.BbsParam;
import kh.com.a.model.Order_Dto;
import kh.com.a.model.Order_Sub_Dto;
import kh.com.a.service.AllOrderService;


@Service
public class AllOrderServiceImpl implements AllOrderService {

	@Autowired
	AllOrderDao allOrderDao;

	@Override
	public List<Order_Dto> allOrderList(BbsParam param) {
		
		return allOrderDao.allOrderList(param);
	}

	@Override
	public int getAllOrderCount(BbsParam param) {
		
		return allOrderDao.getAllOrderCount(param);
	}

	@Override
	public Order_Dto getDetail(String order_num) {
		
		return allOrderDao.getDetail(order_num);
	}

	@Override
	public List<Order_Sub_Dto> getDetail_sub(String order_num) {
		
		return allOrderDao.getDetail_sub(order_num);
	}

	@Override
	public boolean deliInfoUpdate(String ord_seq) {
		
		return allOrderDao.deliInfoUpdate(ord_seq);
	}

	@Override
	public boolean deliInfoFix(String ord_seq) {
		
		return allOrderDao.deliInfoFix(ord_seq);
	}
	
	
	
	
}
