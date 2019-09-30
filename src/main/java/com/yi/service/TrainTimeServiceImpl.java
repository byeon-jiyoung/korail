package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.Train;
import com.yi.domain.TrainTime;
import com.yi.persistence.TrainTimeDao;

@Service
public class TrainTimeServiceImpl implements TrainTimeService {
	
	@Autowired
	TrainTimeDao dao;
	
	@Override
	public List<TrainTime> listTrainTime() throws Exception {
		return dao.listTrainTime();
	}

	@Override
	public List<TrainTime> listTrainTimeNodeName() throws Exception {
		return dao.listTrainTimeNodeName();
	}

	/*@Override
	public List<TrainTime> listNodeByTCode(String train) throws Exception {
		return dao.listNodeByTCode(train);
	}*/

}
