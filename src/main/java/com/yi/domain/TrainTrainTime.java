package com.yi.domain;

import java.util.Date;

public class TrainTrainTime {
	private String tCode;
	private TrainInfo tTiNo;
	private CityTrain tStart;
	private Date tStartTime;
	private CityTrain nodeid;
	private int price;
	private Date ttStartTime;
	
	public TrainTrainTime() {}

	public TrainTrainTime(String tCode, TrainInfo tTiNo, CityTrain tStart, Date tStartTime, CityTrain nodeid, int price,
			Date ttStartTime) {
		super();
		this.tCode = tCode;
		this.tTiNo = tTiNo;
		this.tStart = tStart;
		this.tStartTime = tStartTime;
		this.nodeid = nodeid;
		this.price = price;
		this.ttStartTime = ttStartTime;
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
	public CityTrain gettStart() {
		return tStart;
	}
	public void settStart(CityTrain tStart) {
		this.tStart = tStart;
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
	
	@Override
	public String toString() {
		return "TrainTrainTime [tCode=" + tCode + ", tTiNo=" + tTiNo + ", tStart=" + tStart + ", tStartTime="
				+ tStartTime + ", nodeid=" + nodeid + ", price=" + price + ", ttStartTime=" + ttStartTime + "]";
	}
}
