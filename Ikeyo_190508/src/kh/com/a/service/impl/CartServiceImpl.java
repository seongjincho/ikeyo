package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.CartDao;
import kh.com.a.model.CartDto;
import kh.com.a.model.ProductDto;
import kh.com.a.service.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	CartDao cartDao;
	
	// 리스트
	@Override
	public List<CartDto> cartlist() {
		return cartDao.cartlist();
	}

	// p리스트
	@Override
	public List<ProductDto> pList() {
		
		return cartDao.pList();
	}

	// 삭제
	@Override
	public int cartdel(int seq) throws Exception {
		
		return cartDao.cartdel(seq);
	}

	// 선택삭제
	@Override
	public int cartdeltt(int seqq) throws Exception {
		
		return cartDao.cartdeltt(seqq);
	}

	
	
}
