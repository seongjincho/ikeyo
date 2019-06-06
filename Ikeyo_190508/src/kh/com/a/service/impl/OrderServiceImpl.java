package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.OrderDao;
import kh.com.a.model.CartDto;
import kh.com.a.model.Order_Dto;
import kh.com.a.model.Order_Sub_Dto;
import kh.com.a.model.ProductDto;
import kh.com.a.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderDao orderDao;

	// 하나만 주문
	@Override
	public List<CartDto> oneOrderlist(int seq) {
		
		return orderDao.oneOrderlist(seq);
	}

	// p리스트
	@Override
	public List<ProductDto> orderpList() {
	
		return orderDao.orderpList();
	}

	@Override
	public int twoOrderlist(int seqq) throws Exception {
		// return cartDao.cartdeltt(seqq);
		return orderDao.twoOrderlist(seqq);
	}

	@Override
	public CartDto getOrder(int seq) {
		return orderDao.getOrder(seq);
	}

	// 주문정보
	@Override
	public void order(Order_Dto dto) throws Exception {		
		orderDao.order(dto);
	}

	@Override
	public void orderdetail(Order_Sub_Dto sdto) throws Exception {
		orderDao.orderdetail(sdto);
	}

		
	// 카트비우기
	@Override
	public void cartdelete(int sseq) throws Exception {
		orderDao.cartdelete(sseq);	
	}
	/*
	// 결제 정보
	@Override
	public List<Order_Dto> paymentlist(String id) throws Exception {
		
		return orderDao.paymentlist(id);
	}*/
	
	@Override
   public List<Order_Dto> paymentlistto(String order_num) throws Exception {
      
      return orderDao.paymentlistto(order_num);
   }

	// 결제완료 : deli_info -> 1 변경
	@Override
	public boolean dellinfo(int ord_seq) {
			
		return orderDao.dellinfo(ord_seq);
	}
	
	@Override
	public boolean minusCountInven(Order_Sub_Dto sdto) {
		return orderDao.minusCountInven(sdto);
	}
	

}
