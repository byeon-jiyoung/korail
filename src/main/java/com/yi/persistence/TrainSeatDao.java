package com.yi.persistence;

import java.util.List;

import com.yi.domain.TrainSeat;

public interface TrainSeatDao {
	
	public List<TrainSeat> listTrainSeat(TrainSeat ts) throws Exception;
	public void updateTsChoice(TrainSeat ts) throws Exception;
	public void updateTrainSeatByNow(String tCode, String arrive) throws Exception;
	public void updateTsChoiceFalse(TrainSeat ts) throws Exception;
}
