package com.yi.persistence;

import java.util.List;

import com.yi.domain.TrainSeat;

public interface TrainSeatDao {
	
	public List<TrainSeat> listTrainSeat(TrainSeat ts) throws Exception;
	public void updateTsChoice(TrainSeat ts) throws Exception;
}
