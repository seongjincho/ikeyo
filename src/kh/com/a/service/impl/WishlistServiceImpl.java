package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.WishlistDao;
import kh.com.a.model.CartDto;
import kh.com.a.model.ProductDto;
import kh.com.a.service.WishlistService;

@Service
public class WishlistServiceImpl implements WishlistService {

	@Autowired
	WishlistDao wishlistDao;
	
	// 리스트
	@Override
	public List<CartDto> wishList() {
		
		return wishlistDao.wishList();
	}

	// p리스트
	@Override
	public List<ProductDto> pList() {
	
		return wishlistDao.pList();
	}

	// 삭제
	@Override
	public int wishdel(int seq) throws Exception {
		
		return wishlistDao.wishdel(seq);
	}

	// 삭제
	@Override
	public int wishdeltt(int seqq) throws Exception {
		return wishlistDao.wishdeltt(seqq);
	}

	



}
