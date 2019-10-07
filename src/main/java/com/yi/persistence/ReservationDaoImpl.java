package com.yi.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.yi.domain.Reservation;

@Repository
public class ReservationDaoImpl implements ReservationDao {
	private static final String namespace = "com.yi.mapper.ReservationMapper";
	
	@Autowired
	SqlSession sqlsession;
	
	@Override
	public List<Reservation> listReservation() throws Exception {
		return sqlsession.selectList(namespace + ".listReservation");
	}

	@Override
	public void insertReservation(int resNo, int resClaNum, int people, String start, String arrive, String startTime, String tCode, int tsCar, int tsNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resNo", resNo);
		map.put("resClaNum", resClaNum);
		map.put("people", people);
		map.put("start", start);
		map.put("arrive", arrive);
		map.put("startTime", startTime);
		map.put("tCode", tCode);
		map.put("tsCar", tsCar);
		map.put("tsNo", tsNo);
		
		System.out.println("----------------------------------------------------------------------------------------------------" + map);
		
		sqlsession.insert(namespace + ".insertReservation", map);
	}

	@Override
	public List<Reservation> listReservationByResClaNum(int resClaNum) throws Exception {
		return sqlsession.selectList(namespace + ".listReservationByResClaNum", resClaNum);
	}

	@Override
	public int selectResNo() throws Exception {
		try {
			return sqlsession.selectOne(namespace + ".selectResNo");
		} catch (NullPointerException e) {
			return 0;
		}
	}

	@Override
	public int selectResClaNum() throws Exception {
		try {
			return sqlsession.selectOne(namespace + ".selectResClaNum");
		} catch (NullPointerException e) {
			return 0;
		}
	}

	@Override
	public void insertReservationMember(int resNo, int resClaNum, String memId, int people, String start, String arrive, String startTime, String tCode, int tsCar, int tsNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resNo", resNo);
		map.put("resClaNum", resClaNum);
		map.put("memId", memId);
		map.put("people", people);
		map.put("start", start);
		map.put("arrive", arrive);
		map.put("startTime", startTime);
		map.put("tCode", tCode);
		map.put("tsCar", tsCar);
		map.put("tsNo", tsNo);
		
		System.out.println("----------------------------------------------------------------------------------------------------" + map);
		
		sqlsession.insert(namespace + ".insertReservation", map);
	}

	@Override
	public List<Reservation> listReservationForGet() throws Exception {
		return sqlsession.selectList(namespace + ".listReservationForGet");
	}

	@Override
	public void updateResCancel(String resClaNum) throws Exception {
		sqlsession.update(namespace + ".updateResCancel", resClaNum);
	}

	@Override
	public List<Reservation> selectResByClassNum(String resClaNum) throws Exception {
		return sqlsession.selectList(namespace + ".selectResByClassNum", resClaNum);
	}

	@Override
	public void updateSalNo(int salNo, int resClaNum) throws Exception {
		Map<String, Integer> map = new HashMap<>();
		map.put("salNo", salNo);
		map.put("resClaNum", resClaNum);
		
		sqlsession.update(namespace + ".updateSalNo", map);
	}

	@Override
	public List<Reservation> selecResBySalNo(int salNo) throws Exception {
		return sqlsession.selectList(namespace + ".selecResBySalNo", salNo);
	}

}
