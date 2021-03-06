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
	public void insertReservation(int resNo, int resClaNum, int people, String memPhone, String start, String arrive, String startTime, String tCode, int tsCar, int tsNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resNo", resNo);
		map.put("resClaNum", resClaNum);
		map.put("people", people);
		map.put("nomemPhone", memPhone);
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
	public void insertReservationMember(int resNo, int resClaNum, String memId, int people, String memPhone, String start, String arrive, String startTime, String tCode, int tsCar, int tsNo) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("resNo", resNo);
		map.put("resClaNum", resClaNum);
		map.put("memId", memId);
		map.put("people", people);
		map.put("memPhone", memPhone);
		map.put("start", start);
		map.put("arrive", arrive);
		map.put("startTime", startTime);
		map.put("tCode", tCode);
		map.put("tsCar", tsCar);
		map.put("tsNo", tsNo);
		
		System.out.println("----------------------------------------------------------------------------------------------------" + map);
		System.out.println("///////////////////////////////////"+memId+"///////////////////////////////////");
		
		sqlsession.insert(namespace + ".insertReservationMember", map);
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
	public List<Reservation> selecResBySalNo(int salNo, String tName, int ttNo, String tCode, int resClaNum) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("salNo", salNo);
		map.put("tName", tName);
		map.put("ttNo", ttNo);
		map.put("tCode", tCode);
		map.put("resClaNum", resClaNum);
		
		return sqlsession.selectList(namespace + ".selecResBySalNo", map);
	}

	@Override
	public void minute20ResCancel() throws Exception {
		sqlsession.update(namespace + ".minute20ResCancel");
	}

	@Override
	public List<Reservation> selectTsCarTsNoTCode() throws Exception {
		return sqlsession.selectList(namespace + ".selectTsCarTsNoTCode");
	}

	@Override
	public List<Reservation> selectTicket(String id) throws Exception {
		return sqlsession.selectList(namespace + ".selectTicket", id);
	}

	@Override
	public void updateNoMember(String nomemPhone, int salNo) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("nomemPhone", nomemPhone);
		map.put("salNo", salNo);
		
		sqlsession.update(namespace + ".updateNoMember", map);
	}

	@Override
	public int lastSalNo() throws Exception {
		try {
			return sqlsession.selectOne(namespace + ".lastSalNo");
		} catch (NullPointerException e) {
			return 1;
		}
		
	}

	@Override
	public List<Reservation> selectResByNomemPhone(Reservation res) throws Exception {
		return sqlsession.selectList(namespace + ".selectResByNomemPhone", res);
	}

	@Override
	public List<Reservation> selectTsCarTsNoTCode2() throws Exception {
		return sqlsession.selectList(namespace + ".selectTsCarTsNoTCode2");
	}

	@Override
	public void updateSalNoNull(String resClaNum) throws Exception {
		sqlsession.update(namespace + ".updateSalNoNull", resClaNum);
	}

}
