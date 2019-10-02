package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.TrainInfo;
import com.yi.persistence.TrainInfoDao;

@Service
public class TrainInfoServiceImpl implements TrainInfoServivce {

	@Autowired
	TrainInfoDao dao;
	
	@Override
	public void insertTrainInfo(TrainInfo ti) throws Exception {
		dao.insertTrainInfo(ti);
	}

	@Override
	public List<TrainInfo> listTrainInfo() throws Exception {
		return dao.listTrainInfo();
	}

	@Override
	public TrainInfo selectTrainInfo(int tiNo) throws Exception {
		return dao.selectTrainInfo(tiNo);
	}

}
