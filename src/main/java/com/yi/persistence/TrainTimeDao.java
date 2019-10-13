package com.yi.persistence;

import java.util.List;

import com.yi.domain.Train;
import com.yi.domain.TrainTime;

public interface TrainTimeDao {
	
	public List<TrainTime> listTrainTime() throws Exception;
	/*public List<TrainTime> listNodeByTCode(String train) throws Exception;*/
	public List<TrainTime> listTrainTimeNodeName() throws Exception;
	public void insertTrainTime(TrainTime tt) throws Exception;
}
