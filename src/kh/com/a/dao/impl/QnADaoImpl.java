package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.QnADao;
import kh.com.a.model.BbsParam;
import kh.com.a.model.QnADto;

@Repository
public class QnADaoImpl implements QnADao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "QnA.";

	@Override
	public boolean qnaWrite(QnADto dto) {
		int n = sqlSession.insert(ns + "qnaWrite", dto);
		return n>0?true:false;
	}

	@Override
	public List<QnADto> qnaList(int parent) {
		List<QnADto> qlist = sqlSession.selectList(ns + "qnaList", parent);
		return qlist;
	}

	@Override
	public List<QnADto> qnaListAll() {
		List<QnADto> qlist = sqlSession.selectList(ns + "qnaListAll");
		return qlist;
	}

	@Override
	public boolean qnaAnswer(QnADto dto) {
		int n = sqlSession.update(ns + "qnaAnswer", dto);
		return n>0?true:false;
	}

	@Override
	public List<QnADto> getQnAPagingList(BbsParam param) {
		
		return sqlSession.selectList(ns + "getQnAPagingList", param);
	}

	@Override
	public int getQnACount(BbsParam param) {
		
		return sqlSession.selectOne(ns + "getQnACount", param);
	}

	@Override
	public String getModel_id(int parent) {
		
		return sqlSession.selectOne(ns + "getModel_id", parent);
	}
	
	
	
	
	
	
	
}
