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
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.Train;
import com.yi.domain.TrainInfo;
import com.yi.domain.TrainSeatTrainTime;
import com.yi.domain.TrainTime;
import com.yi.domain.TrainTrainTime;
import com.yi.service.CityTrainService;
import com.yi.service.TrainInfoServivce;
import com.yi.service.TrainSeatTrainTimeService;
import com.yi.service.TrainService;
import com.yi.service.TrainTimeService;
import com.yi.service.TrainTrainTimeService;

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
	@Autowired
	CityTrainService ctService;
	@Autowired
	TrainTrainTimeService tttService;
	@Autowired
	TrainSeatTrainTimeService tsttService;
	
	@RequestMapping(value="reservation", method=RequestMethod.GET)
	public void reserveGet(String start, String arrive, String people, Model model) throws Exception {
		logger.info("------------------- reserveGet --------------------");
		logger.info(start + "," + arrive + "," + people);
		
		List<Train> tList = tService.listTrainNodeName();
		List<TrainInfo> tiList = tiService.listTrainInfo();
		List<TrainTime> ttList = ttService.listTrainTimeNodeName();
		List<TrainTrainTime> tttList = tttService.listTrainByStartArrive(start, arrive);
		
		for(Train t : tList) {
			logger.info(t.toString());
		}
		
		for(TrainTime tt : ttList) {
			logger.info(tt.toString());
		}
		
		for(TrainTrainTime ttt : tttList) {
			logger.info(ttt.toString());
		}
		
		model.addAttribute("tList", tList);
		model.addAttribute("tiList", tiList);
		model.addAttribute("ttList", ttList);
		model.addAttribute("tttList", tttList);
		model.addAttribute("ss", start);
		model.addAttribute("as", arrive);
		model.addAttribute("people", people);
	}
	
	@ResponseBody
	@RequestMapping(value="reservation", method=RequestMethod.POST)
	public List<TrainTrainTime> reservePost(int tTiNo, String startStation, String arriveStation, Model model) throws Exception {
		logger.info("------------------- reservePost --------------------");
		logger.info("startStation : " + startStation);
		logger.info("arriveStation : " + arriveStation);
		logger.info("tTiNo : " + tTiNo);
		
		List<TrainTrainTime> tttList = new ArrayList<TrainTrainTime>();
		
		if(tTiNo == 0) {
			tttList = tttService.listTrainByStartArrive(startStation, arriveStation);
			for(TrainTrainTime t : tttList) {
				logger.info(t.toString());
			}
		}else {
			tttList = tttService.listTrainByStartArriveByTiNo(startStation, arriveStation, tTiNo);
			for(TrainTrainTime t : tttList) {
				logger.info(t.toString());
			}
		}
		return tttList;
	}
	
	@ResponseBody
	@RequestMapping(value="seat", method=RequestMethod.POST)
	public List<TrainSeatTrainTime> seatPost(int tTiNo, String startStation, String arriveStation, String startTime, String tCode, Model model) throws Exception {
		logger.info("------------------- seatPost --------------------");
		logger.info("startStation : " + startStation);
		logger.info("arriveStation : " + arriveStation);
		logger.info("tTiNo : " + tTiNo);
		logger.info("startTime : " + startTime);
		logger.info("tCode : " + tCode);
		
//		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(startTime);
		
		List<TrainSeatTrainTime> tsttList = tsttService.listTrainSeat(startStation, arriveStation, tCode, startTime);
		
		for(TrainSeatTrainTime tstt : tsttList) {
			logger.info(tstt.toString());
		}
		
		return tsttList;
	}
	
	@RequestMapping(value="finishRes", method=RequestMethod.POST)
	public void finishResPost(TrainTrainTime ttt) {
		logger.info("------------------- finishResPost --------------------");
		
	/*	logger.info(tCode);
		logger.info(tArrive);
		logger.info(ttStartTime);*/
		logger.info(ttt.toString());
		
	}
}
