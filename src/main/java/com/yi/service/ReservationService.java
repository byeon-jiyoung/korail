package com.yi.service;

import java.util.List;

import com.yi.domain.CityTrain;
import com.yi.domain.Reservation;
import com.yi.domain.Sale;
import com.yi.domain.Train;
import com.yi.domain.TrainInfo;
import com.yi.domain.TrainSeat;
import com.yi.domain.TrainSeatTrainTime;
import com.yi.domain.TrainTime;
import com.yi.domain.TrainTrainTime;

public interface ReservationService {
	//reservation
	public List<Reservation> listReservation() throws Exception;
	public void insertReservation(int resNo, int resClaNum, int people, String memPhone, String start, String arrive, String startTime, String tCode, int tsCar, int tsNo) throws Exception;
	public void insertReservationMember(int resNo, int resClaNum, String memId, int people, String memPhone, String start, String arrive, String startTime, String tCode, int tsCar, int tsNo) throws Exception;
	public List<Reservation> listReservationByResClaNum(int resClaNum) throws Exception;
	public int selectResNo() throws Exception;
	public int selectResClaNum() throws Exception;
	public List<Reservation> listReservationForGet() throws Exception;
	public void updateResCancel(String resClaNum) throws Exception;
	public void minute20ResCancel(TrainSeat ts) throws Exception;
	public List<Reservation> selectTsCarTsNoTCode() throws Exception;
	public List<Reservation> selectTsCarTsNoTCode2() throws Exception;
	public List<Reservation> selectTicket(String id) throws Exception;
	public List<Reservation> selectResByNomemPhone(Reservation res) throws Exception;
	public void updateSalNoNull(String resClaNum, String salNo) throws Exception;
	
	//train
	public List<Train> listTrain() throws Exception;
	/*public List<Train> listTrainByTStart(String tStart) throws Exception;
	public List<Train> listTrainByTStartAndPNo(String tStart, int tTiNo) throws Exception;
	public List<Train> listTrainByArriveS(String tArrive) throws Exception;*/
	public List<Train> listTrainNodeName() throws Exception;
	public void insertTrain(Train train) throws Exception;
	public Train selectTrainByTCode(String tCode) throws Exception;
	public List<Train> listTrainBiggerNow() throws Exception;
	
	//trainInfo
	public void insertTrainInfo(TrainInfo ti) throws Exception;
	public List<TrainInfo> listTrainInfo() throws Exception;
	public TrainInfo selectTrainInfo(int tiNo) throws Exception;
	
	//trainTime
	public List<TrainTime> listTrainTime() throws Exception;
	/*public List<TrainTime> listNodeByTCode(String train) throws Exception;*/
	public List<TrainTime> listTrainTimeNodeName() throws Exception;
	public void insertTrainTime(TrainTime tt) throws Exception;
	public List<TrainTime> selectTrainTimeByCode(String tCode) throws Exception;
	
	//cityTrain
	public List<CityTrain> listCityTrain() throws Exception;
	/*public void insertCityTrain(CityTrain ct) throws Exception;
	public String searchNodeid(String nodename) throws Exception;*/
	public CityTrain selectCityTrain(String nodename) throws Exception;
	
	//train + trainTime
	public List<TrainTrainTime> listTrainByStartArrive(String start, String arrive, String searchTime, String endTime) throws Exception;
	public List<TrainTrainTime> listTrainByStartArriveByTiNo(String start, String arrive, int tiNo, String searchTime, String endTime) throws Exception;
	
	//trainSeat + trainTime
	public List<TrainSeatTrainTime> listTrainSeat(String start, String arrive, String tCode, String startTime) throws Exception;
	
	//trainSeat
	public void updateTsChoice(TrainSeat ts) throws Exception;
}
