package com.yi.service;

import java.util.List;

import com.yi.domain.Criteria;
import com.yi.domain.Event;

public interface EventService {
	
	public List<Event> listEvent(Criteria cri) throws Exception;
	public int listEventCount() throws Exception;
	public void insertEvent(Event event) throws Exception;
	public Event readEvent(int eNo) throws Exception;
	public List<Event> top2Event() throws Exception;
}
