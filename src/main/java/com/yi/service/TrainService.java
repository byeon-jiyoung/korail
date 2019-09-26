package com.yi.service;

import java.util.List;

import com.yi.domain.Train;

public interface TrainService {
	
	public List<Train> listTrain() throws Exception;
	public List<Train> listTrainByTStart(String tStart) throws Exception;
	public List<Train> listTrainByTStartAndPNo(String tStart, int tTiNo) throws Exception;
	public List<Train> listTrainByArriveS(String tArrive) throws Exception;
}
