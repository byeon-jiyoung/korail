package com.yi.persistence;

import java.util.List;

import com.yi.domain.Criteria;
import com.yi.domain.Event;

public interface EventDao {
	
	public List<Event> listEvent(Criteria cri) throws Exception;
	public int listEventCount() throws Exception;
	public void insertEvent(Event event) throws Exception;
	public Event readEvent(int eNo) throws Exception;
	public void eventReadcnt(Event event) throws Exception;
	public List<Event> top2Event() throws Exception;
}
