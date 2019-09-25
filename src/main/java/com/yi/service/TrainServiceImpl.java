package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.Train;
import com.yi.persistence.TrainDao;

@Service
public class TrainServiceImpl implements TrainService {
	
	@Autowired
	TrainDao dao;
	
	@Override
	public List<Train> listTrain() throws Exception {
		return dao.listTrain();
	}

}
