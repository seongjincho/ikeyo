package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.MyPageDao;
import kh.com.a.model.MemberDto;
import kh.com.a.model.PagingParam;
import kh.com.a.model.ProductDto;
import kh.com.a.model.QnADto;
import kh.com.a.model.ReviewDto;
import kh.com.a.service.MyPageService;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	MyPageDao myPageDao;

	@Override
	public MemberDto myInfo(MemberDto dto) {
		
		return myPageDao.myInfo(dto);
	}

	@Override
	public MemberDto checkPwd(MemberDto dto) {
		
		return myPageDao.checkPwd(dto);
	}

	@Override
	public boolean myInfoUpdate(MemberDto dto) {
		
		return myPageDao.myInfoUpdate(dto);
	}

	@Override
	public String phoneCheck(MemberDto dto) {
		
		return myPageDao.phoneCheck(dto);
	}

	@Override
	public MemberDto myPhone(MemberDto dto) {
		
		return myPageDao.myPhone(dto);
	}

	@Override
	public boolean myInfoUp(MemberDto dto) {
		
		return myPageDao.myInfoUp(dto);
	}

	@Override
	public List<ReviewDto> getReviewList(MemberDto dto) {
		
		return myPageDao.getReviewList(dto);
	}

	@Override
	public ProductDto getProductList(ReviewDto dto) {
		
		return myPageDao.getProductList(dto);
	}

	@Override
	public List<QnADto> getQnAList(MemberDto dto) {
		
		return myPageDao.getQnAList(dto);
	}

	@Override
	public ProductDto getProdList(QnADto dto) {
		
		return myPageDao.getProdList(dto);
	}

	@Override
	public int getReviewCount(MemberDto dto) {
		
		return myPageDao.getReviewCount(dto);
	}

	@Override
	public List<ReviewDto> getReviewPagingList(PagingParam param) {
		
		return myPageDao.getReviewPagingList(param);
	}

	@Override
	public int getQnACount(MemberDto dto) {
		
		return myPageDao.getQnACount(dto);
	}

	@Override
	public List<QnADto> getQnAPagingList(PagingParam param) {
		
		return myPageDao.getQnAPagingList(param);
	}
	
}
