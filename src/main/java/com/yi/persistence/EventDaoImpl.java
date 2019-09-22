package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Criteria;
import com.yi.domain.Event;

@Repository
public class EventDaoImpl implements EventDao {
	private static final String namespace = "com.yi.mapper.EventMapper";
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<Event> listEvent(Criteria cri) throws Exception {
		return sqlSession.selectList(namespace + ".listEvent", cri);
	}

	@Override
	public int listEventCount() throws Exception {
		return sqlSession.selectOne(namespace + ".listEventCount");
	}

	@Override
	public void insertEvent(Event event) throws Exception {
		sqlSession.insert(namespace + ".insertEvent", event);
	}

	@Override
	public Event readEvent(int eNo) throws Exception {
		return sqlSession.selectOne(namespace + ".readEvent", eNo);
	}

	@Override
	public void eventReadcnt(Event event) throws Exception {
		sqlSession.update(namespace + ".eventReadcnt", event);
	}

	@Override
	public List<Event> top2Event() throws Exception {
		return sqlSession.selectList(namespace + ".top2Event");
	}

}
