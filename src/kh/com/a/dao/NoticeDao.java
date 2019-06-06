package kh.com.a.dao;

import java.util.List;

import kh.com.a.model.NoticeDto;
import kh.com.a.model.NoticeParam;

public interface NoticeDao {
	// 공지사항 리스트 불러오기
	public List<NoticeDto> getNoticeList(NoticeParam param);
	public int getNoticeCount(NoticeParam param);
	
	// 글쓰기
	public boolean writeNotice(NoticeDto dto);
	
	// 공지사항(수정할 글 가져오기)
	public NoticeDto updateNotice(int seq);
	// 글 수정
	public boolean updateNoticeAf(NoticeDto dto);
	// 글 삭제
	public boolean deleteNotice(int seq);
	// 공지사항 조회수
	public boolean noticeRead(int seq);
	public int getNoticeReadcount(int seq);
	
	
	
	
	
	
}
