package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.yi.domain.TrainSeatTrainTime;
import com.yi.persistence.TrainSeatDao;
import com.yi.persistence.TrainSeatTrainTimeDao;

@Service
public class TrainSeatTrainTimeServiceImpl implements TrainSeatTrainTimeService {
	
	@Autowired
	TrainSeatTrainTimeDao tsttDao;
	@Autowired
	TrainSeatDao tsDao;
	
	@Override
	@Transactional
	public List<TrainSeatTrainTime> listTrainSeat(String start, String arrive, String tCode, String startTime) throws Exception {
		tsDao.updateTrainSeatByNow(tCode, arrive);
		return tsttDao.listTrainSeat(start, arrive, tCode, startTime);
	}

}
