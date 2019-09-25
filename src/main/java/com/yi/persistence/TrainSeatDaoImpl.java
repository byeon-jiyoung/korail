package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.TrainSeat;

@Repository
public class TrainSeatDaoImpl implements TrainSeatDao {
	private static final String namespace = "com.yi.mapper.TrainSeatMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<TrainSeat> listTrainSeat() throws Exception {
		return sqlsession.selectList(namespace + ".listTrainSeat");
	}

}
