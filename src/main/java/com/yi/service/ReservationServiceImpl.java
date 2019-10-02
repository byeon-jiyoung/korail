package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yi.domain.Reservation;
import com.yi.domain.Train;
import com.yi.domain.TrainInfo;
import com.yi.domain.TrainSeat;
import com.yi.persistence.ReservationDao;
import com.yi.persistence.TrainSeatDao;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	ReservationDao rDao;
	
	@Autowired
	TrainSeatDao tsDao;
	
	@Override
	public List<Reservation> listReservation() throws Exception {
		return rDao.listReservation();
	}
	
	@Override
	@Transactional
	public void insertReservation(int resNo, int resClaNum, int people, String start, String arrive, String startTime, String tCode, int tsCar, int tsNo) throws Exception {
		rDao.insertReservation(resNo, resClaNum, people, start, arrive, startTime, tCode, tsCar, tsNo);
		
		Train t = new Train(tCode);
		t.gettCode();
		
		TrainSeat ts = new TrainSeat(tsCar, tsNo, t);
		tsDao.updateTsChoice(ts);
	}

	@Override
	public List<Reservation> listReservationByResClaNum(int resClaNum) throws Exception {
		return rDao.listReservationByResClaNum(resClaNum);
	}

	@Override
	public int selectResNo() throws Exception {
		return rDao.selectResNo();
	}

	@Override
	public int selectResClaNum() throws Exception {
		return rDao.selectResClaNum();
	}

}
