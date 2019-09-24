package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.CityTrain;

@Repository
public class CityTrainDaoImpl implements CityTrainDao {
	private static final String namespace = "com.yi.mapper.CityTrainMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<CityTrain> listCityTrain() throws Exception {
		return sqlsession.selectList(namespace + ".listCityTrain");
	}

	@Override
	public void insertCityTrain(CityTrain ct) throws Exception {
		sqlsession.insert(namespace + ".insertCityTrain", ct);
	}

	@Override
	public List<CityTrain> searchNodeid(String nodename) throws Exception {
		return sqlsession.selectList(namespace + ".searchNodeid", nodename);
	}

}
