package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.TrainSeatTrainTime;

@Repository
public class TrainSeatTrainTimeDaoImpl implements TrainSeatTrainTimeDao {
	private static final String namespace = "com.yi.mapper.TrainSeatTrainTimeMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<TrainSeatTrainTime> listTrainSeat(String tCode, String startTime) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tCode", tCode);
		map.put("startTime", startTime);
		
		return sqlsession.selectList(namespace + ".listTrainSeat", map);
	}

}
