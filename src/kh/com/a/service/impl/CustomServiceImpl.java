package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.CustomDao;
import kh.com.a.model.CustomDto;
import kh.com.a.model.NoticeParam;
import kh.com.a.service.CustomService;

@Service
public class CustomServiceImpl implements CustomService {
	
	@Autowired
	CustomDao customDao;

	@Override
	public List<CustomDto> getCustomList(NoticeParam param) {
		return customDao.getCustomList(param);
	}

	@Override
	public int getCustomCount(NoticeParam param) {
		return customDao.getCustomCount(param);
	}

	@Override
	public boolean uploadCustom(CustomDto cust) {
		return customDao.uploadCustom(cust);
	}

	@Override
	public CustomDto getCustom(int seq) {
		return customDao.getCustom(seq);
	}

	@Override
	public boolean custReadCount(int seq) {
		return customDao.custReadCount(seq);
	}

	@Override
	public boolean writeCustAnswer(CustomDto cust) {
		customDao.stepUpCustom(cust.getCust_seq());
		return customDao.writeCustAnswer(cust);
	}

	@Override
	public boolean deleteCustom(int seq) {
		return customDao.deleteCustom(seq);
	}
	
	@Override
	public boolean updateCustom(CustomDto cust) {
		return customDao.updateCustom(cust);
	}
	
	
	
	
}
