package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List<TrainSeat> listTrainSeat(TrainSeat ts) throws Exception {
		return sqlsession.selectList(namespace + ".listTrainSeat",ts);
	}

	@Override
	public void updateTsChoice(TrainSeat ts) throws Exception {
		sqlsession.update(namespace + ".updateTsChoice", ts);
	}

	@Override
	public void updateTrainSeatByNow(String tCode, String arrive) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("tCode", tCode);
		map.put("arrive", arrive);
		
		sqlsession.update(namespace + ".updateTrainSeatByNow", map);
	}

	@Override
	public void updateTsChoiceCancel(TrainSeat ts) throws Exception {
		sqlsession.update(namespace + ".updateTsChoiceCancel", ts);
	}

}
