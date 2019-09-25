package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Train;

@Repository
public class TrainDaoImpl implements TrainDao {
	private static final String namespace = "com.yi.mapper.TrainMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<Train> listTrain() throws Exception {
		return sqlsession.selectList(namespace + ".listTrain");
	}

}
