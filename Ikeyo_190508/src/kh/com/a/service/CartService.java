package kh.com.a.service;

import java.util.List;

import kh.com.a.model.CartDto;
import kh.com.a.model.ProductDto;

public interface CartService {

	// 위시리스트
	public List<CartDto> cartlist();
		
	// p리스트 
	public List<ProductDto> pList();
	
	// 삭제
	int cartdel(int seq) throws Exception;
			
	// 선택삭제
	int cartdeltt(int seqq) throws Exception;
	
}
