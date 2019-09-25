package com.yi.persistence;

import java.util.List;

import com.yi.domain.TrainSeat;

public interface TrainSeatDao {
	
	public List<TrainSeat> listTrainSeat() throws Exception;
}
