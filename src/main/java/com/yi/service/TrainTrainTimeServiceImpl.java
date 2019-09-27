package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.TrainTrainTime;
import com.yi.persistence.TrainTrainTimeDao;

@Service
public class TrainTrainTimeServiceImpl implements TrainTrainTimeService {
	
	@Autowired
	TrainTrainTimeDao dao;
	
	@Override
	public List<TrainTrainTime> listTrainByStartArrive(String start, String arrive) throws Exception {
		return dao.listTrainByStartArrive(start, arrive);
	}

	@Override
	public List<TrainTrainTime> listTrainByStartArriveByTiNo(String start, String arrive, int tiNo) throws Exception {
		return dao.listTrainByStartArriveByTiNo(start, arrive, tiNo);
	}

}
