package kh.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.com.a.dao.CalendarDao;
import kh.com.a.model.CalendarDto;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Calendar.";

	// 출석체크
	@Override
	public boolean calwrite(CalendarDto dto) {
		
		int n = sqlSession.insert(ns + "calwrite", dto);
		
		return n>0?true:false;
	}

	// 출석확인
	@Override
	public List<CalendarDto> getCalendarList(CalendarDto dto) {
	
		return sqlSession.selectList(ns + "getCalendarList", dto);
	}

	// 같은 ID 몇개인지 찾기
	@Override
	public int getIdCount(String id) {
		
		return sqlSession.selectOne(ns + "getIdCount", id);
	}

	// 포인트 지급
	@Override
	public boolean upPoint(String id) {
		
		int n = sqlSession.insert(ns + "upPoint", id);
		
		return n>0?true:false;
	}

	// today
	@Override
	public CalendarDto gettoday(CalendarDto mem) {
		
		CalendarDto dto = sqlSession.selectOne(ns + "gettoday", mem);
		return dto;
	}


	
	

	
	
	
	
	

}
