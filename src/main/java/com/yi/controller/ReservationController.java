package com.yi.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yi.domain.CityTrain;
import com.yi.domain.Login;
import com.yi.domain.Member;
import com.yi.domain.Reservation;
import com.yi.domain.Train;
import com.yi.domain.TrainInfo;
import com.yi.domain.TrainSeat;
import com.yi.domain.TrainSeatTrainTime;
import com.yi.domain.TrainTime;
import com.yi.domain.TrainTrainTime;
import com.yi.service.ReservationService;

@Controller
@RequestMapping("/res/*")
public class ReservationController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);
	
	@Autowired
	ReservationService rService;
	
	@RequestMapping(value="reservation", method=RequestMethod.GET)
	public void reserveGet(String start, String arrive, String people, String date, String time, Model model) throws Exception {
		logger.info("------------------- reserveGet --------------------");
		logger.info(start + "," + arrive + "," + people);
		logger.info(date + "," + time);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date today = new Date();
		String strToday = df.format(today);
		
		if(start == null || arrive == null || people == null || date == null || time == null) {
			start = "동대구";
			arrive = "부산";
			people = "1";
			date = strToday;
			time = "00:00";
		}
		
		String searchTime = date.concat(" ").concat(time);
		String endTime = date.concat(" ").concat("23:59:59");
		logger.info("==========>"+searchTime+" & "+endTime);
		
		Date date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(searchTime);
		
		if(date2.getTime() < today.getTime()) {
			logger.info("--------------------------------" + date2.getTime() + "&" + date2);
			logger.info("--------------------------------" + today.getTime() + "&" + today);
			date = strToday;
			searchTime = date;
			logger.info("=====2=====>"+searchTime+" & "+endTime);
		}
		
		List<Train> tList = rService.listTrainNodeName();
		List<TrainInfo> tiList = rService.listTrainInfo();
		List<TrainTime> ttList = rService.listTrainTimeNodeName();
		List<TrainTrainTime> tttList = rService.listTrainByStartArrive(start, arrive, searchTime, endTime);
		
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
	public List<TrainTrainTime> reservePost(int tTiNo, String startStation, String arriveStation, String date, String time, Model model) throws Exception {
		logger.info("------------------- reservePost --------------------");
		logger.info("startStation : " + startStation);
		logger.info("arriveStation : " + arriveStation);
		logger.info("tTiNo : " + tTiNo);
		logger.info(date);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		Date today = new Date();
		String strToday = df.format(today);
		
		List<TrainTrainTime> tttList = new ArrayList<TrainTrainTime>();
		
		String searchTime = date.concat(" ").concat(time);
		String endTime = date.concat(" ").concat("23:59:59");
		
		Date date2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(searchTime);
		
		if(date2.getTime() < today.getTime()) {
			logger.info("--------------------------------" + date2.getTime() + "&" + date2);
			logger.info("--------------------------------" + today.getTime() + "&" + today);
			date = strToday;
			searchTime = date;
			logger.info("=====2=====>"+searchTime+" & "+endTime);
		}
		
		if(tTiNo == 0) {
			tttList = rService.listTrainByStartArrive(startStation, arriveStation, searchTime, endTime);
			for(TrainTrainTime t : tttList) {
				logger.info(t.toString());
			}
		}else {
			tttList = rService.listTrainByStartArriveByTiNo(startStation, arriveStation, tTiNo, searchTime, endTime);
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
		
		List<Reservation> rList = rService.selectTsCarTsNoTCode();
		logger.info("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr =>" + rList.toString());
		for(Reservation r : rList) {
			logger.info(r.getTsCar() + " & " + r.getTsNo() + " & " + r.gettCode());
			rService.minute20ResCancel(r.getTsCar());
		}
		
		List<TrainSeatTrainTime> tsttList = rService.listTrainSeat(startStation, arriveStation, tCode, startTime);
		
		for(TrainSeatTrainTime tstt : tsttList) {
			logger.info(tstt.toString());
		}
		
		return tsttList;
	}
	
	@RequestMapping(value="finishRes", method=RequestMethod.POST)
	public void finishResPost(HttpSession session, String tCode, int tTiNo, String tStart, String memId, String tArrive, String tStartTime, String price, String tArriveTime, String peoA, String peoC, String peoO, String tsCar, String tsNo, Model model) throws Exception {
		logger.info("------------------- finishResPost --------------------");
		logger.info("tCode : " + tCode + ", tTiNo : " + tTiNo);
		logger.info("tStart : " + tStart + ", tArrive : " + tArrive);
		logger.info("tStartTime : " + tStartTime + ", tArriveTime : " + tArriveTime);
		logger.info("price : " + price);
		logger.info("tsCar : " + tsCar + ", tsNo : " + tsNo);
		logger.info("memId : " + memId);
		logger.info("peoA : " + peoA + ", peoC : " + peoC + ", peoO : " + peoO);
		
		int people = Integer.parseInt(peoA) + Integer.parseInt(peoC) + Integer.parseInt(peoO);
		
		TrainInfo ti = rService.selectTrainInfo(tTiNo);
		CityTrain ctS = rService.selectCityTrain(tStart);
		CityTrain ctA = rService.selectCityTrain(tArrive);
		
		Date dateS = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(tStartTime);
		Date dateA = new SimpleDateFormat("yyyy-MM-dd HH:mm").parse(tArriveTime);
		
		TrainTrainTime ttt = new TrainTrainTime(tCode, ti, ctS, dateS, ctA, Integer.parseInt(price), dateA);
		model.addAttribute("ttt", ttt);
		
		logger.info("ttt => " + ttt);
		
		int resNo = rService.selectResNo();
		int resClaNum = rService.selectResClaNum();
		resClaNum++;
		
		
		//session으로 받는방법
		Login member = (Login) session.getAttribute("login");
		logger.info(member+"000000000000000000000000000000000000");
		String memPhone = "sale";
		
		if(member != null) {
			memPhone = member.getMemPhone();
		}
		
		logger.info(memPhone);
		
		String[] c = tsNo.split("석");
		for(String s : c) {
			if(memId == "") {
				rService.insertReservation(++resNo, resClaNum, people, memPhone, tStart, tArrive, tStartTime, tCode, Integer.parseInt(tsCar), Integer.parseInt(s.trim()));
				logger.info("비회원");
			}else {
				rService.insertReservationMember(++resNo, resClaNum, memId, people, tStart, tArrive, tStartTime, tCode, Integer.parseInt(tsCar), Integer.parseInt(s.trim()));
				logger.info("회원"+memId);
			}
		}
		
		logger.info(resClaNum + "---------------------------------------------");
		
		List<Reservation> resList = rService.listReservationByResClaNum(resClaNum);
		model.addAttribute("resList", resList);
		model.addAttribute("a", peoA);
		model.addAttribute("c", peoC);
		model.addAttribute("o", peoO);
		model.addAttribute("resClaNum", resClaNum);

		for(Reservation r : resList) {
			logger.info("r => " + r);
			model.addAttribute("nomemPhone", r.getNomemPhone());
		}
		
		//return "redirect:/res/finishRes";
		//이미 예약테이블에 insert가 된 상태라서 get으로 리다이렉트시킨다음에 예약테이블에서 값을 불러오는 방식으로 하면 계속 insert되는 문제를 해결할 수 있다
	}

	@RequestMapping(value="resCancel", method=RequestMethod.GET)
	public void resCancelGet(String resClaNum) throws Exception {
		logger.info("------------------- resCancelGet --------------------");
		logger.info("resClaNum : " + resClaNum);
		
		rService.updateResCancel(resClaNum);
	}
	
	@RequestMapping(value="resticket", method=RequestMethod.GET)
	public void resticketGet(String id, Model model) throws Exception {
		logger.info("------------------- resticketGet --------------------");
		logger.info("id : " + id);
		
		List<Reservation> rList = rService.selectTicket(id);
		
		for(Reservation r : rList) {
			logger.info(r.toString());
		}
		
		model.addAttribute("rList", rList);
	}
}
