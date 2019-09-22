package com.yi.persistence;

import java.util.List;

import com.yi.domain.Criteria;
import com.yi.domain.Notice;

public interface NoticeDao {
	
	public List<Notice> listNotice(Criteria cri) throws Exception;
	public void insertNotice(Notice notice) throws Exception;
	public Notice readNotice(int noNo) throws Exception;
	public List<Notice> top6Notice() throws Exception;
	public int listNoticeCount() throws Exception;
	public void noticeReadcnt(Notice notice) throws Exception;
}
