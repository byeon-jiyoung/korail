package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.City;
import com.yi.persistence.CityDao;

@Service
public class CityServiceImpl implements CityService {

	@Autowired
	CityDao dao;
	
	@Override
	public List<City> listCity() throws Exception {
		return dao.listCity();
	}

	@Override
	public void insertCity(City city) throws Exception {
		dao.insertCity(city);
	}

	@Override
	public int searchCityCode(String cityname) throws Exception {
		return dao.searchCityCode(cityname);
	}

}
