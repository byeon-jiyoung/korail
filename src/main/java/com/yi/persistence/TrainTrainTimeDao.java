package com.yi.persistence;

import java.util.List;

import com.yi.domain.TrainTrainTime;

public interface TrainTrainTimeDao {
	
	public List<TrainTrainTime> listTrainByStartArrive(String start, String arrive) throws Exception;
	public List<TrainTrainTime> listTrainByStartArriveByTiNo(String start, String arrive, int tiNo) throws Exception;
}
