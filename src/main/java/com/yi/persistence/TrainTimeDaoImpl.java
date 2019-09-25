package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.TrainTime;

@Repository
public class TrainTimeDaoImpl implements TrainTimeDao {
	private static final String namespace = "com.yi.mapper.TrainTimeMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<TrainTime> listTrainTime() throws Exception {
		return sqlsession.selectList(namespace + ".listTrainTime");
	}

	@Override
	public List<TrainTime> ListStartTimeByPno(String nodeidS, String nodeidA) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("startname", nodeidS);
		map.put("arrivename", nodeidA);
		
		return sqlsession.selectList(namespace + ".ListStartTimeByPno", map);
	}

}
