package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.CityTrain;
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

	/*@Override
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

	@Override
	public List<Train> listTrainByArriveS(String tArrive) throws Exception {
		return sqlsession.selectList(namespace + ".listTrainByTStart", tArrive);
	}*/

	@Override
	public List<Train> listTrainNodeName() throws Exception {
		return sqlsession.selectList(namespace + ".listTrainNodeName");
	}

	@Override
	public void insertTrain(Train train) throws Exception {
		sqlsession.insert(namespace + ".insertTrain", train);
	}

	@Override
	public Train selectTrainByTCode(String tCode) throws Exception {
		return sqlsession.selectOne(namespace + ".selectTrainByTCode", tCode);
	}

	@Override
	public List<Train> listTrainBiggerNow() throws Exception {
		return sqlsession.selectList(namespace + ".listTrainBiggerNow");
	}

}
