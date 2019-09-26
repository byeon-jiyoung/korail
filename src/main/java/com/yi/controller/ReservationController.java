package com.yi.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.Train;
import com.yi.domain.TrainInfo;
import com.yi.domain.TrainTime;
import com.yi.service.TrainInfoServivce;
import com.yi.service.TrainService;
import com.yi.service.TrainTimeService;

@Controller
@RequestMapping("/res/*")
public class ReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	TrainService tService;
	@Autowired
	TrainInfoServivce tiService;
	@Autowired
	TrainTimeService ttService;
	
	@RequestMapping(value="reservation", method=RequestMethod.GET)
	public void reserveGet(Model model) throws Exception {
		logger.info("------------------- reserveGet --------------------");
		
		List<Train> tList = tService.listTrain();
		List<TrainInfo> tiList = tiService.listTrainInfo();
		List<TrainTime> ttList = ttService.listTrainTime();
		
		for(Train t : tList) {
			logger.info(t.toString());
		}
		
		for(TrainTime tt : ttList) {
			logger.info(tt.toString());
		}
		
		model.addAttribute("tList", tList);
		model.addAttribute("tiList", tiList);
		model.addAttribute("ttList", ttList);
	}
	
	@ResponseBody
	@RequestMapping(value="reservation", method=RequestMethod.POST)
	public List<Train> reservePost(int tTiNo, String startStation, String arriveStation, Model model) throws Exception {
		logger.info("------------------- reservePost --------------------");
		logger.info("startStation : " + startStation);
		logger.info("arriveStation : " + arriveStation);
		logger.info("tTiNo : " + tTiNo);
		
		List<Train> tList = new ArrayList<Train>();
		
		if(tTiNo == 0) {
			logger.info("0000000000");
			tList = tService.listTrainByTStart(startStation);
			for(Train t : tList) {
				logger.info(t.toString());
			}
		}else {
			logger.info("123456789");
			tList = tService.listTrainByTStartAndPNo(startStation, tTiNo);
			for(Train t : tList) {
				logger.info(t.toString());
			}
		}
		return tList;
	}
	
	@ResponseBody
	@RequestMapping(value="seat", method=RequestMethod.POST)
	public List<TrainTime> seatPost(int tTiNo, String startStation, String arriveStation, String startTime, Model model) throws Exception {
		logger.info("------------------- seatPost --------------------");
		logger.info("startStation : " + startStation);
		logger.info("arriveStation : " + arriveStation);
		logger.info("tTiNo : " + tTiNo);
		logger.info("startTime" + startTime);
		
		return null;
	}
	
}
