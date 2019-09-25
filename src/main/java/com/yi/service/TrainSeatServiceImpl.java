package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.yi.domain.TrainSeat;
import com.yi.persistence.TrainSeatDao;

public class TrainSeatServiceImpl implements TrainSeatService {
	
	@Autowired
	TrainSeatDao dao;
	
	@Override
	public List<TrainSeat> listTrainSeat() throws Exception {
		return dao.listTrainSeat();
	}

}
