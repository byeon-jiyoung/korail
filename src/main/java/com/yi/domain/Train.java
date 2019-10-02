package com.yi.domain;

import java.util.Date;

public class Train {
	private String tCode;
	private TrainInfo tTiNo;
	private Date tStartTime;
	private Date tArriveTime;
	private CityTrain tStart;
	private CityTrain tArrive;
	
	public Train() {}
	
	public Train(String tCode) {
		super();
		this.tCode = tCode;
	}

	public String gettCode() {
		return tCode;
	}
	public void settCode(String tCode) {
		this.tCode = tCode;
	}
	public TrainInfo gettTiNo() {
		return tTiNo;
	}
	public void settTiNo(TrainInfo tTiNo) {
		this.tTiNo = tTiNo;
	}
	public Date gettStartTime() {
		return tStartTime;
	}
	public void settStartTime(Date tStartTime) {
		this.tStartTime = tStartTime;
	}
	public Date gettArriveTime() {
		return tArriveTime;
	}
	public void settArriveTime(Date tArriveTime) {
		this.tArriveTime = tArriveTime;
	}
	public CityTrain gettStart() {
		return tStart;
	}
	public void settStart(CityTrain tStart) {
		this.tStart = tStart;
	}
	public CityTrain gettArrive() {
		return tArrive;
	}
	public void settArrive(CityTrain tArrive) {
		this.tArrive = tArrive;
	}
	
	@Override
	public String toString() {
		return "Train [tCode=" + tCode + ", tTiNo=" + tTiNo + ", tStartTime=" + tStartTime + ", tArriveTime="
				+ tArriveTime + ", tStart=" + tStart + ", tArrive=" + tArrive + "]";
	}
}
