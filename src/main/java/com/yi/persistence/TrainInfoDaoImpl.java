package com.yi.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.TrainInfo;

@Repository
public class TrainInfoDaoImpl implements TrainInfoDao {
	private static final String namespace = "com.yi.mapper.TrainInfoMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public void insertTrainInfo(TrainInfo ti) throws Exception {
		sqlsession.insert(namespace + ".insertTrainInfo", ti);
	}

	@Override
	public List<TrainInfo> listTrainInfo() throws Exception {
		return sqlsession.selectList(namespace + ".listTrainInfo");
	}

}
