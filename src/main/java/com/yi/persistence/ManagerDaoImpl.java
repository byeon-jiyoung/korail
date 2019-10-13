package com.yi.persistence;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Manager;

@Repository
public class ManagerDaoImpl implements ManagerDao {
	private static final String namespace = "com.yi.mapper.ManagerMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public Manager selectManagerByIdPw(String id, String pw) throws Exception {
		Map<String, String> map = new HashMap<String, String>();
		map.put("manId", id);
		map.put("manPw", pw);
		
		return sqlsession.selectOne(namespace + ".selectManagerByIdPw", map);
	}

}
