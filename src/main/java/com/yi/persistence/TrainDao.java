package com.yi.persistence;

import java.util.List;

import com.yi.domain.CityTrain;
import com.yi.domain.Train;

public interface TrainDao {
	
	public List<Train> listTrain() throws Exception;
	/*public List<Train> listTrainByTStart(String tStart) throws Exception;
	public List<Train> listTrainByTStartAndPNo(String tStart, int tTiNo) throws Exception;
	public List<Train> listTrainByArriveS(String tArrive) throws Exception;*/
	public List<Train> listTrainNodeName() throws Exception;
}
