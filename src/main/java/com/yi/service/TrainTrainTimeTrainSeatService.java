package com.yi.service;

import com.yi.domain.TrainTrainTimeTrainSeat;

public interface TrainTrainTimeTrainSeatService {
	
	public TrainTrainTimeTrainSeat selectReservation(String start, String arrive, String tCode) throws Exception;
	
}
