package com.yi.persistence;

import java.util.List;

import com.yi.domain.CityTrain;

public interface CityTrainDao {
	
	public List<CityTrain> listCityTrain() throws Exception;
	public void insertCityTrain(CityTrain ct) throws Exception;
	public String searchNodeid(String nodename) throws Exception;
	public CityTrain selectCityTrain(String nodename) throws Exception;
}
