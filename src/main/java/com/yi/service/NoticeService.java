package com.yi.service;

import java.util.List;

import com.yi.domain.Criteria;
import com.yi.domain.Notice;

public interface NoticeService {
	
	public List<Notice> listNotice(Criteria cri) throws Exception;
	public void insertNotice(Notice notice) throws Exception;
	public Notice readNotice(int noNo) throws Exception;
	public List<Notice> top6Notice() throws Exception;
	public int listNoticeCount() throws Exception;
}
