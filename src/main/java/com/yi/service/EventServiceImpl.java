package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yi.domain.Criteria;
import com.yi.domain.Event;
import com.yi.persistence.EventDao;

@Service
public class EventServiceImpl implements EventService {
	
	@Autowired
	EventDao dao;
	
	@Override
	public List<Event> listEvent(Criteria cri) throws Exception {
		return dao.listEvent(cri);
	}

	@Override
	public int listEventCount() throws Exception {
		return dao.listEventCount();
	}

	@Override
	public void insertEvent(Event event) throws Exception {
		dao.insertEvent(event);
	}

	@Override
	@Transactional
	public Event readEvent(int eNo) throws Exception {
		Event event = dao.readEvent(eNo);
		
		int readCnt = event.geteReadcnt();
		event.seteReadcnt(++readCnt);
		dao.eventReadcnt(event);
		
		return event;
	}

	@Override
	public List<Event> top2Event() throws Exception {
		return dao.top2Event();
	}

}
