package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.TrainTrainTime;

@Repository
public class TrainTrainTimeDaoImpl implements TrainTrainTimeDao {
	private static final String namespace = "com.yi.mapper.TrainTrainTimeMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<TrainTrainTime> listTrainByStartArrive(String start, String arrive, String searchTime, String endTime) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("arrive", arrive);
		map.put("searchTime", searchTime);
		map.put("endTime", endTime);
		
		return sqlsession.selectList(namespace + ".listTrainByStartArrive", map);
	}

	@Override
	public List<TrainTrainTime> listTrainByStartArriveByTiNo(String start, String arrive, int tiNo, String searchTime, String endTime) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", start);
		map.put("arrive", arrive);
		map.put("tiNo", tiNo);
		map.put("searchTime", searchTime);
		map.put("endTime", endTime);
		
		return sqlsession.selectList(namespace + ".listTrainByStartArriveByTiNo", map);
	}

}
