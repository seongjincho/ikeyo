package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.CalendarDao;
import kh.com.a.model.CalendarDto;
import kh.com.a.service.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	CalendarDao calendarDao;
	
	// 출석체크
	@Override
	public boolean calwrite(CalendarDto dto) {
		
		return calendarDao.calwrite(dto);
		
	}

	// 출석확인
	@Override
	public List<CalendarDto> getCalendarList(CalendarDto dto) {
		
		return calendarDao.getCalendarList(dto);
	}

	// 같은 ID 몇개인지 찾기 
	@Override
	public int getIdCount(String id) {
		
		return calendarDao.getIdCount(id);
	}

	// 포인트 지급
	@Override
	public boolean upPoint(String id) {
		
		return calendarDao.upPoint(id);
	}

	// today
	@Override
	public CalendarDto gettoday(CalendarDto mem) {
	
		return calendarDao.gettoday(mem);
	}

	


	
	
	
	
	
	

}
