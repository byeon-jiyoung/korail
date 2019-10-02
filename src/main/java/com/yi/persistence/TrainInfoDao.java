package com.yi.persistence;

import java.util.List;

import com.yi.domain.TrainInfo;

public interface TrainInfoDao {
	
	public void insertTrainInfo(TrainInfo ti) throws Exception;
	public List<TrainInfo> listTrainInfo() throws Exception;
	public TrainInfo selectTrainInfo(int tiNo) throws Exception;
}
