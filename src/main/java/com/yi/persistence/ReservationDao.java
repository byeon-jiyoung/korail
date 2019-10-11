package com.yi.persistence;

import java.util.List;

import com.yi.domain.Reservation;

public interface ReservationDao {
	
	public List<Reservation> listReservation() throws Exception;
	public void insertReservation(int resNo, int resClaNum, int people, String memPhone, String start, String arrive, String startTime, String tCode, int tsCar, int tsNo) throws Exception;
	public void insertReservationMember(int resNo, int resClaNum, String memId, int people, String start, String arrive, String startTime, String tCode, int tsCar, int tsNo) throws Exception;
	public List<Reservation> listReservationByResClaNum(int resClaNum) throws Exception;
	public int selectResNo() throws Exception;
	public int selectResClaNum() throws Exception;
	public List<Reservation> listReservationForGet() throws Exception;
	public void updateResCancel(String resClaNum) throws Exception;
	public List<Reservation> selectResByClassNum(String resClaNum) throws Exception;
	public void updateSalNo(int salNo, int resClaNum) throws Exception;
	public List<Reservation> selecResBySalNo(int salNo, String tName, int ttNo, String tCode, int resClaNum) throws Exception;
	public void minute20ResCancel() throws Exception;
	public List<Reservation> selectTsCarTsNoTCode() throws Exception;
	public List<Reservation> selectTsCarTsNoTCode2() throws Exception;
	public List<Reservation> selectTicket(String id) throws Exception;
	public void updateNoMember(String nomemPhone, int salNo) throws Exception;
	public int lastSalNo() throws Exception;
	public List<Reservation> selectResByNomemPhone(Reservation res) throws Exception;
	
}
