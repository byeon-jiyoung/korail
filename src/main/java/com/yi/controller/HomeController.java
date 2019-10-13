package com.yi.controller;

import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.CityTrain;
import com.yi.domain.Event;
import com.yi.domain.Notice;
import com.yi.domain.Train;
import com.yi.domain.TrainInfo;
import com.yi.domain.TrainTime;
import com.yi.service.EventService;
import com.yi.service.NoticeService;
import com.yi.service.ReservationService;

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
	@Autowired
	ReservationService rService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		List<Notice> noticeList = noService.top6Notice();
		List<Event> eventList = eService.top2Event();
		List<Train> tList = rService.listTrainNodeName();
		List<TrainTime> ttList = rService.listTrainTimeNodeName();
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("eventList", eventList);
		model.addAttribute("tList", tList);
		model.addAttribute("ttList", ttList);
		
		return "korail";
//		return "home";
	}
	
	@RequestMapping(value = "/manager/korail", method = RequestMethod.GET)
	public String manager(Locale locale, Model model) throws Exception {
		logger.info("매니저다!!!!!!!!!!!!!!!!");
		
		List<Train> tList = rService.listTrain();
		for(Train t : tList) {
			logger.info(t.toString());
		}
		
		model.addAttribute("tList", tList);
		
		return "manager/korail";
	}
	
}
