package com.yi.service;

import java.util.List;

import com.yi.domain.CityTrain;

public interface CityTrainService {
	
	public List<CityTrain> listCityTrain() throws Exception;
	public void insertCityTrain(CityTrain ct) throws Exception;
	public List<CityTrain> searchNodeid(String nodename) throws Exception;
}
