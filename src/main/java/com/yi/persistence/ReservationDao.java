package com.yi.persistence;

import java.util.List;

import com.yi.domain.Reservation;

public interface ReservationDao {
	
	public List<Reservation> listReservation() throws Exception;
	public void insertReservation(int resNo, int resClaNum, int people, String start, String arrive, String startTime, String tCode, int tsCar, int tsNo) throws Exception;
	public void insertReservationMember(int resNo, int resClaNum, String memId, int people, String start, String arrive, String startTime, String tCode, int tsCar, int tsNo) throws Exception;
	public List<Reservation> listReservationByResClaNum(int resClaNum) throws Exception;
	public int selectResNo() throws Exception;
	public int selectResClaNum() throws Exception;
	public List<Reservation> listReservationForGet() throws Exception;
	public void updateResCancel(String resClaNum) throws Exception;
	public List<Reservation> selectResByClassNum(String resClaNum) throws Exception;
	public void updateSalNo(int salNo, int resClaNum) throws Exception;
	
}
