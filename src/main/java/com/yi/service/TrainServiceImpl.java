package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.CityTrain;
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

	@Override
	public List<Train> listTrainByTStart(String tStart) throws Exception {
		return dao.listTrainByTStart(tStart);
	}

	@Override
	public List<Train> listTrainByTStartAndPNo(String tStart, int tTiNo) throws Exception {
		return dao.listTrainByTStartAndPNo(tStart, tTiNo);
	}

	@Override
	public List<Train> listTrainByArriveS(String tArrive) throws Exception {
		return dao.listTrainByArriveS(tArrive);
	}

}
