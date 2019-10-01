package com.yi.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.TrainSeatTrainTime;
import com.yi.persistence.TrainSeatTrainTimeDao;

@Service
public class TrainSeatTrainTimeServiceImpl implements TrainSeatTrainTimeService {
	
	@Autowired
	TrainSeatTrainTimeDao dao;
	
	@Override
	public List<TrainSeatTrainTime> listTrainSeat(String start, String arrive, String tCode, String startTime) throws Exception {
		return dao.listTrainSeat(start, arrive, tCode, startTime);
	}

}
