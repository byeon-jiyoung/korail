package com.yi.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.TrainTrainTimeTrainSeat;

@Repository
public class TrainTrainTimeTrainSeatDaoImpl implements TrainTrainTimeTrainSeatDao {
	private static final String namespace = "com.yi.mapper.TrainTrainTimeTrainSeatMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public TrainTrainTimeTrainSeat selectReservation(String start, String arrive, String tCode) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("arrive", arrive);
		map.put("tCode", tCode);
		
		return sqlsession.selectOne(namespace + ".selectReservation" + map);
	}

}
