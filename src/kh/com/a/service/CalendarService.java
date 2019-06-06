package kh.com.a.service;

import java.util.List;

import kh.com.a.model.CalendarDto;

public interface CalendarService {

	// 출석체크
    boolean calwrite(CalendarDto dto);
	
    // 출석확인
 	public List<CalendarDto> getCalendarList(CalendarDto dto);
 	
 	// 같은 ID 몇개인지 찾기
 	public int getIdCount(String id);
 		
 	// 포인트 지급
 	public boolean upPoint(String id);
 	
 	// today
 	public CalendarDto gettoday(CalendarDto mem);
 	
 	
}
