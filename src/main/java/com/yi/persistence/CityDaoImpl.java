package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.City;

@Repository
public class CityDaoImpl implements CityDao {
	private static final String namespace = "com.yi.mapper.CityMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<City> listCity() throws Exception {
		return sqlsession.selectList(namespace + ".listCity");
	}

	@Override
	public void insertCity(City city) throws Exception {
		sqlsession.insert(namespace + ".insertCity", city);
	}

	@Override
	public int searchCityCode(String cityname) throws Exception {
		return sqlsession.selectOne(namespace + ".searchCityCode", cityname);
	}

}
