package com.yi.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yi.domain.Reservation;
import com.yi.persistence.ReservationDao;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	ReservationDao dao;
	
	@Override
	public List<Reservation> listReservation() throws Exception {
		return dao.listReservation();
	}

}
