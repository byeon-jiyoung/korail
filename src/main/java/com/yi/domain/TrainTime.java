package com.yi.domain;

import java.util.Date;

public class TrainTime {
	private int ttNo;
	private Date ttStartTime;
	private Train tCode;
	private int price;
	private CityTrain nodeid;
	
	public TrainTime() {
		super();
	}
	
	public TrainTime(Date ttStartTime, Train tCode, int price, CityTrain nodeid) {
		this.ttStartTime = ttStartTime;
		this.tCode = tCode;
		this.price = price;
		this.nodeid = nodeid;
	}

	public int getTtNo() {
		return ttNo;
	}
	public void setTtNo(int ttNo) {
		this.ttNo = ttNo;
	}
	public Date getTtStartTime() {
		return ttStartTime;
	}
	public void setTtStartTime(Date ttStartTime) {
		this.ttStartTime = ttStartTime;
	}
	public Train gettCode() {
		return tCode;
	}
	public void settCode(Train tCode) {
		this.tCode = tCode;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public CityTrain getNodeid() {
		return nodeid;
	}
	public void setNodeid(CityTrain nodeid) {
		this.nodeid = nodeid;
	}
	
	@Override
	public String toString() {
		return "TrainTime [ttNo=" + ttNo + ", ttStartTime=" + ttStartTime + ", tCode=" + tCode + ", price=" + price
				+ ", nodeid=" + nodeid + "]";
	}
}
