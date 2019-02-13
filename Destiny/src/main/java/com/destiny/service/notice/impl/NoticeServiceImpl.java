package com.destiny.service.notice.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.service.notice.NoticeDao;
import com.destiny.service.notice.NoticeService;

@Service("noticeServiceImpl")
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	@Qualifier("noticeDaoImpl")
	private NoticeDao noticeDao;

	public void setNoticeDao(NoticeDao noticeDao) {
		this.noticeDao = noticeDao;
	}
	
	public NoticeServiceImpl() {
		System.out.println(this.getClass());
	}
}
