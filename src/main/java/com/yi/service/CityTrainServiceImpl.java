package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.CityTrain;
import com.yi.persistence.CityTrainDao;

@Service
public class CityTrainServiceImpl implements CityTrainService {
	
	@Autowired
	CityTrainDao dao;
	
	@Override
	public List<CityTrain> listCityTrain() throws Exception {
		return dao.listCityTrain();
	}

	@Override
	public void insertCityTrain(CityTrain ct) throws Exception {
		dao.insertCityTrain(ct);
	}

	@Override
	public String searchNodeid(String nodename) throws Exception {
		return dao.searchNodeid(nodename);
	}

}
