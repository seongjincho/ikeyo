package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.CustomDao;
import kh.com.a.model.CustomDto;
import kh.com.a.model.NoticeParam;

@Repository
public class CustomDaoImpl implements CustomDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String ns = "Custom.";

	@Override
	public List<CustomDto> getCustomList(NoticeParam param) {
		return sqlSession.selectList(ns + "getCustomList", param);
	}

	@Override
	public int getCustomCount(NoticeParam param) {
		return sqlSession.selectOne(ns + "getCustomCount", param);
	}

	@Override
	public boolean uploadCustom(CustomDto cust) {
		int n = sqlSession.insert(ns + "customupload", cust);
		return n>0?true:false;
	}

	@Override
	public CustomDto getCustom(int seq) {
		return sqlSession.selectOne(ns + "getCustom", seq);
	}

	@Override
	public boolean custReadCount(int seq) {
		int n = sqlSession.update(ns + "custReadcount", seq);
		return n>0?true:false;
	}

	@Override
	public boolean stepUpCustom(int seq) {
		int n = sqlSession.update(ns + "custStepUp", seq);
		return n>0?true:false;
	}

	@Override
	public boolean writeCustAnswer(CustomDto cust) {
		int n = sqlSession.insert(ns + "writeCustAnswer", cust);
		return n>0?true:false;
	}

	@Override
	public boolean deleteCustom(int seq) {
		int n = sqlSession.update(ns + "customdelete", seq);
		return n>0?true:false;
	}

	@Override
	public boolean updateCustom(CustomDto cust) {
		int n = sqlSession.update(ns + "customupdate", cust);
		return n>0?true:false;
	}
	
	
	
	
	
	
}
