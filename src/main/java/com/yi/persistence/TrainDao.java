package com.yi.persistence;

import java.util.List;

import com.yi.domain.Train;

public interface TrainDao {
	
	public List<Train> listTrain() throws Exception;
}
