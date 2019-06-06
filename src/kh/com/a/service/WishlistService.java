package kh.com.a.service;

import java.util.List;

import kh.com.a.model.CartDto;
import kh.com.a.model.ProductDto;

public interface WishlistService {

	// 위시리스트
	public List<CartDto> wishList();
	
	// p리스트 
	public List<ProductDto> pList();
		
	// 삭제
	int wishdel(int seq) throws Exception;
	
	// 삭제
	int wishdeltt(int seqq) throws Exception;

	
}
