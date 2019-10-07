package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yi.domain.CityTrain;
import com.yi.domain.Reservation;
import com.yi.domain.Train;
import com.yi.domain.TrainInfo;
import com.yi.domain.TrainSeat;
import com.yi.domain.TrainSeatTrainTime;
import com.yi.domain.TrainTime;
import com.yi.domain.TrainTrainTime;
import com.yi.persistence.CityTrainDao;
import com.yi.persistence.ReservationDao;
import com.yi.persistence.TrainDao;
import com.yi.persistence.TrainInfoDao;
import com.yi.persistence.TrainSeatDao;
import com.yi.persistence.TrainSeatTrainTimeDao;
import com.yi.persistence.TrainTimeDao;
import com.yi.persistence.TrainTrainTimeDao;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	ReservationDao rDao;
	@Autowired
	TrainSeatDao tsDao;
	@Autowired
	TrainDao tDao;
	@Autowired
	TrainInfoDao tiDao;
	@Autowired
	TrainTimeDao ttDao;
	@Autowired
	CityTrainDao ctDao;
	@Autowired
	TrainTrainTimeDao tttDao;
	@Autowired
	TrainSeatTrainTimeDao tsttDao;
	
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
	@Transactional
	public void insertReservationMember(int resNo, int resClaNum, String memId, int people, String start, String arrive, String startTime, String tCode, int tsCar, int tsNo) throws Exception {
		rDao.insertReservationMember(resNo, resClaNum, memId, people, start, arrive, startTime, tCode, tsCar, tsNo);
		
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

	@Override
	public List<Train> listTrain() throws Exception {
		return tDao.listTrain();
	}

	@Override
	public List<Train> listTrainNodeName() throws Exception {
		return tDao.listTrainNodeName();
	}

	@Override
	public void insertTrainInfo(TrainInfo ti) throws Exception {
		tiDao.insertTrainInfo(ti);
	}

	@Override
	public List<TrainInfo> listTrainInfo() throws Exception {
		return tiDao.listTrainInfo();
	}

	@Override
	public TrainInfo selectTrainInfo(int tiNo) throws Exception {
		return tiDao.selectTrainInfo(tiNo);
	}

	@Override
	public List<TrainTime> listTrainTime() throws Exception {
		return ttDao.listTrainTime();
	}

	@Override
	public List<TrainTime> listTrainTimeNodeName() throws Exception {
		return ttDao.listTrainTimeNodeName();
	}

	@Override
	public List<CityTrain> listCityTrain() throws Exception {
		return ctDao.listCityTrain();
	}

	@Override
	public CityTrain selectCityTrain(String nodename) throws Exception {
		return ctDao.selectCityTrain(nodename);
	}

	@Override
	public List<TrainTrainTime> listTrainByStartArrive(String start, String arrive, String searchTime, String endTime) throws Exception {
		return tttDao.listTrainByStartArrive(start, arrive, searchTime, endTime);
	}

	@Override
	public List<TrainTrainTime> listTrainByStartArriveByTiNo(String start, String arrive, int tiNo, String searchTime, String endTime) throws Exception {
		return tttDao.listTrainByStartArriveByTiNo(start, arrive, tiNo, searchTime, endTime);
	}

	@Override
	@Transactional
	public List<TrainSeatTrainTime> listTrainSeat(String start, String arrive, String tCode, String startTime) throws Exception {
		tsDao.updateTrainSeatByNow(tCode, arrive);
		return tsttDao.listTrainSeat(start, arrive, tCode, startTime);
	}

	@Override
	public List<Reservation> listReservationForGet() throws Exception {
		return rDao.listReservationForGet();
	}

	@Override
	@Transactional
	public void updateResCancel(String resClaNum) throws Exception {
		rDao.updateResCancel(resClaNum);
		
		List<Reservation> rList = rDao.selectResByClassNum(resClaNum);
		
		for(Reservation r : rList) {
			System.out.println(r.getTsCar().getTsCar());
			System.out.println(r.getTsCar().getTsNo());
			System.out.println(r.getTsCar().gettCode());
			TrainSeat ts = new TrainSeat(r.getTsCar().getTsCar(), r.getTsCar().getTsNo(), r.getTsCar().gettCode());
			tsDao.updateTsChoiceCancel(ts);
		}
	}
}
