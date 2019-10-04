package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.Train;
import com.yi.domain.TrainSeat;
import com.yi.persistence.TrainSeatDao;

@Service
public class TrainSeatServiceImpl implements TrainSeatService {
	
	@Autowired
	TrainSeatDao dao;
	
	@Override
	public List<TrainSeat> listTrainSeat(TrainSeat ts) throws Exception {
		return dao.listTrainSeat(ts);
	}

}
