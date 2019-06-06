package kh.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.com.a.dao.NoticeDao;
import kh.com.a.model.NoticeDto;
import kh.com.a.model.NoticeParam;
import kh.com.a.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDao noticeDao;
	
	@Override
	public List<NoticeDto> getNoticeList(NoticeParam param) {
		return noticeDao.getNoticeList(param);
	}
	
	@Override
	public int getNoticeCount(NoticeParam param) {
		return noticeDao.getNoticeCount(param);
	}
	
	@Override
	public boolean writeNotice(NoticeDto dto) {
		return noticeDao.writeNotice(dto);
	}
	
	@Override
	public NoticeDto updateNotice(int seq) {
		return noticeDao.updateNotice(seq);
	}

	@Override
	public boolean updateNoticeAf(NoticeDto dto) {
		return noticeDao.updateNoticeAf(dto);
	}

	@Override
	public boolean deleteNotice(int seq) {
		return noticeDao.deleteNotice(seq);
	}

	@Override
	public boolean noticeRead(int seq) {
		return noticeDao.noticeRead(seq);
	}

	@Override
	public int getNoticeReadcount(int seq) {
		return noticeDao.getNoticeReadcount(seq);
	}
	
}
