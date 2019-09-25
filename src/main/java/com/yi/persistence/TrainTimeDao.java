package com.yi.persistence;

import java.util.List;

import com.yi.domain.TrainTime;

public interface TrainTimeDao {
	
	public List<TrainTime> listTrainTime() throws Exception;
	public List<TrainTime> ListStartTimeByPno(String nodeidS, String nodeidA) throws Exception;
}
