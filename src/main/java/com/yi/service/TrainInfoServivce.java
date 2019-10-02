package com.yi.service;

import java.util.List;

import com.yi.domain.TrainInfo;

public interface TrainInfoServivce {
	
	public void insertTrainInfo(TrainInfo ti) throws Exception;
	public List<TrainInfo> listTrainInfo() throws Exception;
	public TrainInfo selectTrainInfo(int tiNo) throws Exception;
}
