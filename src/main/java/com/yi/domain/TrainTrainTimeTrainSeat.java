package com.yi.domain;

import java.util.Date;

public class TrainTrainTimeTrainSeat {
	private String tCode;
	private TrainInfo tTiNo;
	private CityTrain tStart;
	private CityTrain tArrive;
	private Date tStartTime;
	private CityTrain nodeid;
	private int price;
	private Date ttStartTime;
	private int tsCar;
	private int tsNo;
	
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
	public Date gettStartTime() {
		return tStartTime;
	}
	public void settStartTime(Date tStartTime) {
		this.tStartTime = tStartTime;
	}
	public CityTrain getNodeid() {
		return nodeid;
	}
	public void setNodeid(CityTrain nodeid) {
		this.nodeid = nodeid;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public Date getTtStartTime() {
		return ttStartTime;
	}
	public void setTtStartTime(Date ttStartTime) {
		this.ttStartTime = ttStartTime;
	}
	public int getTsCar() {
		return tsCar;
	}
	public void setTsCar(int tsCar) {
		this.tsCar = tsCar;
	}
	public int getTsNo() {
		return tsNo;
	}
	public void setTsNo(int tsNo) {
		this.tsNo = tsNo;
	}
	
	@Override
	public String toString() {
		return "TrainTrainTimeTrainSeat [tCode=" + tCode + ", tTiNo=" + tTiNo + ", tStart=" + tStart + ", tArrive="
				+ tArrive + ", tStartTime=" + tStartTime + ", nodeid=" + nodeid + ", price=" + price + ", ttStartTime="
				+ ttStartTime + ", tsCar=" + tsCar + ", tsNo=" + tsNo + "]";
	}
}
