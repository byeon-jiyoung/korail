package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yi.domain.Criteria;
import com.yi.domain.Notice;
import com.yi.persistence.NoticeDao;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeDao dao;
	
	@Override
	public List<Notice> listNotice(Criteria cri) throws Exception {
		return dao.listNotice(cri);
	}

	@Override
	public void insertNotice(Notice notice) throws Exception {
		dao.insertNotice(notice);
	}

	@Override
	@Transactional
	public Notice readNotice(int noNo) throws Exception {
		Notice notice = dao.readNotice(noNo);
		
		int readCnt = notice.getNoReadcnt();
		notice.setNoReadcnt(++readCnt);
		dao.noticeReadcnt(notice);
		
		return notice;
	}
	
	@Override
	public List<Notice> top6Notice() throws Exception {
		return dao.top6Notice();
	}

	@Override
	public int listNoticeCount() throws Exception {
		return dao.listNoticeCount();
	}

}
