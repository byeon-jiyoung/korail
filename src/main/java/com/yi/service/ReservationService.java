package com.yi.service;

import java.util.List;

import com.yi.domain.CityTrain;
import com.yi.domain.Reservation;
import com.yi.domain.Train;
import com.yi.domain.TrainInfo;
import com.yi.domain.TrainSeatTrainTime;
import com.yi.domain.TrainTime;
import com.yi.domain.TrainTrainTime;

public interface ReservationService {
	//reservation
	public List<Reservation> listReservation() throws Exception;
	public void insertReservation(int resNo, int resClaNum, int people, String start, String arrive, String startTime, String tCode, int tsCar, int tsNo) throws Exception;
	public List<Reservation> listReservationByResClaNum(int resClaNum) throws Exception;
	public int selectResNo() throws Exception;
	public int selectResClaNum() throws Exception;
	
	//train
	public List<Train> listTrain() throws Exception;
	/*public List<Train> listTrainByTStart(String tStart) throws Exception;
	public List<Train> listTrainByTStartAndPNo(String tStart, int tTiNo) throws Exception;
	public List<Train> listTrainByArriveS(String tArrive) throws Exception;*/
	public List<Train> listTrainNodeName() throws Exception;
	
	//trainInfo
	public void insertTrainInfo(TrainInfo ti) throws Exception;
	public List<TrainInfo> listTrainInfo() throws Exception;
	public TrainInfo selectTrainInfo(int tiNo) throws Exception;
	
	//trainTime
	public List<TrainTime> listTrainTime() throws Exception;
	/*public List<TrainTime> listNodeByTCode(String train) throws Exception;*/
	public List<TrainTime> listTrainTimeNodeName() throws Exception;
	
	//cityTrain
	public List<CityTrain> listCityTrain() throws Exception;
	/*public void insertCityTrain(CityTrain ct) throws Exception;
	public String searchNodeid(String nodename) throws Exception;*/
	public CityTrain selectCityTrain(String nodename) throws Exception;
	
	//train + trainTime
	public List<TrainTrainTime> listTrainByStartArrive(String start, String arrive) throws Exception;
	public List<TrainTrainTime> listTrainByStartArriveByTiNo(String start, String arrive, int tiNo) throws Exception;
	
	//trainSeat + trainTime
	public List<TrainSeatTrainTime> listTrainSeat(String start, String arrive, String tCode, String startTime) throws Exception;
}
