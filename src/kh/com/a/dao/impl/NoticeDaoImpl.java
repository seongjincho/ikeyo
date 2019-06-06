package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.NoticeDao;
import kh.com.a.model.NoticeDto;
import kh.com.a.model.NoticeParam;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	
	@Autowired
	SqlSession sqlSession;
	
	String ns = "Notice.";
	
	@Override
	public List<NoticeDto> getNoticeList(NoticeParam param) {
		return sqlSession.selectList(ns + "getNoticeList", param);
	}

	@Override
	public int getNoticeCount(NoticeParam param) {
		return sqlSession.selectOne(ns + "getNoticeCount", param);
	}

	@Override
	public boolean writeNotice(NoticeDto dto) {
		int n = sqlSession.insert(ns + "writeNotice", dto);
		return n>0?true:false;
	}

	@Override
	public NoticeDto updateNotice(int seq) {
		return sqlSession.selectOne(ns + "getNotice", seq);
	}

	@Override
	public boolean updateNoticeAf(NoticeDto dto) {
		int n = sqlSession.update(ns + "updateNotice", dto);
		return n>0?true:false;
	}

	@Override
	public boolean deleteNotice(int seq) {
		int n = sqlSession.delete(ns + "deleteNotice", seq);
		return n>0?true:false;
	}

	@Override
	public boolean noticeRead(int seq) {
		int n = sqlSession.update(ns + "noticeRead", seq);
		return n>0?true:false;
	}

	@Override
	public int getNoticeReadcount(int seq) {
		return sqlSession.selectOne(ns + "getNoticeReadcount", seq);
	}
	
}
