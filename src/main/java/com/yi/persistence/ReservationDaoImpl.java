package com.yi.persistence;

import java.util.List;

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

}
