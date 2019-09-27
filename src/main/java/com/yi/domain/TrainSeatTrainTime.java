package com.yi.domain;

import java.util.Date;

public class TrainSeatTrainTime {
	private int tsCar;
	private int tsNo;
	private Train tCode;
	private boolean tsChoice;
	private CityTrain nodeid;
	private Date ttStartTime;
	
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
	public Train gettCode() {
		return tCode;
	}
	public void settCode(Train tCode) {
		this.tCode = tCode;
	}
	public boolean isTsChoice() {
		return tsChoice;
	}
	public void setTsChoice(boolean tsChoice) {
		this.tsChoice = tsChoice;
	}
	public CityTrain getNodeid() {
		return nodeid;
	}
	public void setNodeid(CityTrain nodeid) {
		this.nodeid = nodeid;
	}
	public Date getTtStartTime() {
		return ttStartTime;
	}
	public void setTtStartTime(Date ttStartTime) {
		this.ttStartTime = ttStartTime;
	}
	
	@Override
	public String toString() {
		return "TrainSeatTrainTime [tsCar=" + tsCar + ", tsNo=" + tsNo + ", tCode=" + tCode + ", tsChoice=" + tsChoice
				+ ", nodeid=" + nodeid + ", ttStartTime=" + ttStartTime + "]";
	}
}
