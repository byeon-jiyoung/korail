package com.yi.service;

import java.util.List;

import com.yi.domain.TrainTrainTime;

public interface TrainTrainTimeService {
	
	public List<TrainTrainTime> listTrainByStartArrive(String start, String arrive) throws Exception;
	public List<TrainTrainTime> listTrainByStartArriveByTiNo(String start, String arrive, int tiNo) throws Exception;
	
}
