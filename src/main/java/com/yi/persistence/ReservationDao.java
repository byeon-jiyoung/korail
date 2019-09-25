package com.yi.persistence;

import java.util.List;

import com.yi.domain.Reservation;

public interface ReservationDao {
	
	public List<Reservation> listReservation() throws Exception;
}
