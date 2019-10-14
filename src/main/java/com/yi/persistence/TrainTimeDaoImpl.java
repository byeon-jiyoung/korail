package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Train;
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
	public List<TrainTime> listTrainTimeNodeName() throws Exception {
		return sqlsession.selectList(namespace + ".listTrainTimeNodeName");
	}

	@Override
	public void insertTrainTime(TrainTime tt) throws Exception {
		sqlsession.insert(namespace + ".insertTrainTime", tt);
	}

	@Override
	public List<TrainTime> selectTrainTimeByCode(String tCode) throws Exception {
		return sqlsession.selectList(namespace + ".selectTrainTimeByCode", tCode);
	}

	/*@Override
	public List<TrainTime> listNodeByTCode(String train) throws Exception {
		return sqlsession.selectList(namespace + ".listNodeByTCode", train);
	}*/
}
