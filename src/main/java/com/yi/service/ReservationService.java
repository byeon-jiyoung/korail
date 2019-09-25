package com.yi.service;

import java.util.List;

import com.yi.domain.Reservation;

public interface ReservationService {
	
	public List<Reservation> listReservation() throws Exception;
}
