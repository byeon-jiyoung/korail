package com.yi.service;

import java.util.Date;
import java.util.List;

import com.yi.domain.TrainSeatTrainTime;

public interface TrainSeatTrainTimeService {
	
	public List<TrainSeatTrainTime> listTrainSeat(String start, String arrive, String tCode, String StartTime) throws Exception;
}