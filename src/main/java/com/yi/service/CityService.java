package com.yi.service;

import java.util.List;

import com.yi.domain.City;

public interface CityService {
	
	public List<City> listCity() throws Exception;
	public void insertCity(City city) throws Exception;
	public int searchCityCode(String cityname) throws Exception;
}
