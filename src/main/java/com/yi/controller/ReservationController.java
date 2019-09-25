package com.yi.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.yi.domain.CityTrain;
import com.yi.domain.Price;
import com.yi.domain.TrainTime;
import com.yi.service.CityTrainService;
import com.yi.service.PriceService;
import com.yi.service.ReservationService;
import com.yi.service.TrainTimeService;

@Controller
@RequestMapping("/res/*")
public class ReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	ReservationService rService;
	
	@Autowired
	TrainTimeService ttService;
	
	@Autowired
	PriceService pService;
	
	@Autowired
	CityTrainService ctService;
	
	@RequestMapping(value="reservation", method=RequestMethod.GET)
	public void reserveGet(Model model) throws Exception {
		logger.info("------------------- reserveGet --------------------");
		List<TrainTime> ttList = ttService.listTrainTime();
		
		List<Price> pList = new ArrayList<Price>();
		
		for(TrainTime tt : ttList) {
			//logger.info("------------------- " + tt.getpNo().getpNo());
			Price p = pService.selectPriceByPno(tt.getpNo().getpNo());
			pList.add(p);
		}
		
		model.addAttribute("ttList", ttList);
		model.addAttribute("pList", pList);
	}
	
	@RequestMapping(value="reservation", method=RequestMethod.POST)
	public void reservePost(String nodeidA, String nodeidS, Model model) {
		logger.info("------------------- reservePost --------------------");
		logger.info(nodeidA + "," + nodeidS);
	
	}
}
