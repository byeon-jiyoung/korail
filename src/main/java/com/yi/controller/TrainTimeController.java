package com.yi.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.CityTrain;
import com.yi.domain.Train;
import com.yi.domain.TrainInfo;
import com.yi.domain.TrainTime;
import com.yi.service.ReservationService;

@Controller
@RequestMapping("/manager/*")
public class TrainTimeController {
	private static final Logger logger = LoggerFactory.getLogger(TrainTimeController.class);
	
	@Autowired
	ReservationService rService;
	
	@RequestMapping(value="train", method=RequestMethod.GET)
	public void trainGet(Model model) throws Exception {
		logger.info("---------- trainGet ----------");
		
		List<TrainInfo> tiList = rService.listTrainInfo();
		List<CityTrain> ctList = rService.listCityTrain();
		
		model.addAttribute("tiList", tiList);
		model.addAttribute("ctList", ctList);
	}
	
	@ResponseBody
	@RequestMapping(value="train", method=RequestMethod.POST)
	public Train trainPost(String tCode, String tTiNo, String startTime, String arriveTime, String tStart, String tArrive, String price) throws Exception {
		logger.info("---------- trainPost ----------");
		logger.info(tStart);
		logger.info(tArrive);
		
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(startTime);
		Date date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(arriveTime);
		
		TrainInfo ti = rService.selectTrainInfo(Integer.parseInt(tTiNo));
		CityTrain ct1 = rService.selectCityTrain(tStart);
		CityTrain ct2 = rService.selectCityTrain(tArrive);
		
		Train train = new Train(tCode, ti, date, date2, ct1, ct2);
		logger.info(train.toString());
		logger.info("train =========> " + train.toString());
		
		rService.insertTrain(train);
		
		TrainTime tt = new TrainTime(date2, train, Integer.parseInt(price), ct2);
		rService.insertTrainTime(tt);
		
		logger.info("TrainTime =========> " + tt.toString());
		
		/*return "redirect:/manager/train";*/
		return train;
	}
	
	/*
	@RequestMapping(value="traintime", method=RequestMethod.GET)
	public String traintimeGet(String tCode, Model model) throws Exception {
		logger.info("---------- traintimeGet ----------");
		
		List<Train> tList = rService.listTrain();
		for(Train t : tList) {
			logger.info(t.toString());
		}
		List<CityTrain> ctList = rService.listCityTrain();
		
		model.addAttribute("tList", tList);
		model.addAttribute("ctList", ctList);
		
		return "/manager/train";
	}
	*/
	
	@RequestMapping(value="traintime", method=RequestMethod.POST)
	public String traintimePost(TrainTime tt, String ttstartTime) throws Exception {
		logger.info("---------- traintimePost ----------");
		logger.info(tt.toString());
		Date date = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(ttstartTime);
		
		tt.setTtStartTime(date);
		logger.info("=================>"+tt.toString());
		rService.insertTrainTime(tt);
		
		return "/manager/train";
	}
}
