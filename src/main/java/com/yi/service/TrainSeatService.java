package com.yi.service;

import java.util.List;

import com.yi.domain.Train;
import com.yi.domain.TrainSeat;

public interface TrainSeatService {
	
	public List<TrainSeat> listTrainSeat(TrainSeat ts) throws Exception;

}
