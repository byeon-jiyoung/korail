package com.yi.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.Event;
import com.yi.domain.Notice;
import com.yi.service.EventService;
import com.yi.service.NoticeService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private NoticeService noService;
	
	@Autowired
	private EventService eService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<Notice> noticeList = noService.top6Notice();
		List<Event> eventList = eService.top2Event();
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("eventList", eventList);
		
//		return "korail";
		return "home";
	}
	
}
