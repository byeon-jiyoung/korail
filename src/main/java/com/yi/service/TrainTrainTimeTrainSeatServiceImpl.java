package com.yi.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.TrainTrainTimeTrainSeat;
import com.yi.persistence.TrainTrainTimeTrainSeatDao;

@Service
public class TrainTrainTimeTrainSeatServiceImpl implements TrainTrainTimeTrainSeatService {
	
	@Autowired
	TrainTrainTimeTrainSeatDao dao;
	
	@Override
	public TrainTrainTimeTrainSeat selectReservation(String start, String arrive, String tCode) throws Exception {
		return dao.selectReservation(start, arrive, tCode);
	}

}
