package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Criteria;
import com.yi.domain.Notice;

@Repository
public class NoticeDaoImpl implements NoticeDao {
	private static final String namespace = "com.yi.mapper.NoticeMapper";
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Notice> listNotice(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listNotice", cri);
	}

	@Override
	public void insertNotice(Notice notice) throws Exception {
		sqlSession.insert(namespace + ".insertNotice", notice);
	}

	@Override
	public Notice readNotice(int noNo) throws Exception {
		return sqlSession.selectOne(namespace + ".readNotice", noNo);
	}

	@Override
	public List<Notice> top6Notice() throws Exception {
		return sqlSession.selectList(namespace + ".top6Notice");
	}

	@Override
	public int listNoticeCount() throws Exception {
		return sqlSession.selectOne(namespace + ".listNoticeCount");
	}

	@Override
	public void noticeReadcnt(Notice notice) throws Exception {
		sqlSession.update(namespace + ".noticeReadcnt", notice);
	}

}
