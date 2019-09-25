package com.yi.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.CityTrain;
import com.yi.domain.Price;
import com.yi.domain.TrainInfo;
import com.yi.domain.TrainTime;
import com.yi.service.CityTrainService;
import com.yi.service.PriceService;
import com.yi.service.ReservationService;
import com.yi.service.TrainInfoServivce;
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
	@Autowired
	TrainInfoServivce tiService;
	
	@RequestMapping(value="reservation", method=RequestMethod.GET)
	public void reserveGet(Model model) throws Exception {
		logger.info("------------------- reserveGet --------------------");
		List<TrainTime> ttList = ttService.listTrainTime();
		List<TrainInfo> tiList = tiService.listTrainInfo();
		
		List<Price> pList = new ArrayList<Price>();
		
		for(TrainTime tt : ttList) {
			//logger.info(tt.toString());
			Price p = pService.selectPriceByPno(tt.getpNo().getpNo());
			pList.add(p);
		}
		
		model.addAttribute("pList", pList);
		model.addAttribute("tiList", tiList);
	}
	
	@ResponseBody
	@RequestMapping(value="reservation", method=RequestMethod.POST)
	public List<TrainTime> reservePost(TrainInfo ti, String nodeidS, String nodeidA, Model model) throws Exception {
		logger.info("------------------- reservePost --------------------");
		logger.info("nodeidS : " + nodeidS);
		logger.info("nodeidA : " + nodeidA);
		
		CityTrain ctA = ctService.searchNodeid(nodeidA);
		CityTrain ctS = ctService.searchNodeid(nodeidS);
		
		List<Integer> pnoList = pService.selectPnoBynodeId(nodeidS, nodeidA);
		
		for(int i : pnoList) {
			logger.info(i+"");
		}
		
		List<TrainTime> ttList = ttService.ListStartTimeByPno(nodeidS, nodeidA);
		for(TrainTime tt : ttList) {
			logger.info(tt.toString());
		}
		
		return ttList;
	}
}
