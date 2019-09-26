package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public List<Train> listTrainByTStart(String tStart) throws Exception {
		return sqlsession.selectList(namespace + ".listTrainByTStart", tStart);
	}

	@Override
	public List<Train> listTrainByTStartAndPNo(String tStart, int tTiNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tStart", tStart);
		map.put("tTiNo", tTiNo);
		
		return sqlsession.selectList(namespace + ".listTrainByTStartAndPNo", map);
	}

}
