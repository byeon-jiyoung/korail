package com.yi.persistence;

import java.util.List;

import com.yi.domain.TrainSeatTrainTime;

public interface TrainSeatTrainTimeDao {
	
	public List<TrainSeatTrainTime> listTrainSeat(String start, String arrive, String tCode, String startTime) throws Exception;
	
}
