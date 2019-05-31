package kh.com.a.service;

import java.util.List;

import kh.com.a.model.NoticeDto;
import kh.com.a.model.NoticeParam;

public interface NoticeService {
	
	public List<NoticeDto> getNoticeList(NoticeParam param);
	public int getNoticeCount(NoticeParam param);
	
	public boolean writeNotice(NoticeDto dto);
	
	public NoticeDto updateNotice(int seq);
	public boolean updateNoticeAf(NoticeDto dto);
	
	public boolean deleteNotice(int seq);
	// 조회수
	public boolean noticeRead(int seq);
	public int getNoticeReadcount(int seq);
	
	
}
