package com.yi.persistence;

import com.yi.domain.TrainTrainTimeTrainSeat;

public interface TrainTrainTimeTrainSeatDao {
	
	public TrainTrainTimeTrainSeat selectReservation(String start, String arrive, String tCode) throws Exception;
	
}
