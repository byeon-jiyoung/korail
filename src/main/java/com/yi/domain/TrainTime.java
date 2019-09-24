package com.yi.domain;

import java.util.Date;

public class TrainTime {
	private int ttNo;
	private Date ttStartTime;
	private String tCode;
	private Price pNo;
	
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
	public String gettCode() {
		return tCode;
	}
	public void settCode(String tCode) {
		this.tCode = tCode;
	}
	public Price getpNo() {
		return pNo;
	}
	public void setpNo(Price pNo) {
		this.pNo = pNo;
	}

	@Override
	public String toString() {
		return "TrainTime [ttNo=" + ttNo + ", ttStartTime=" + ttStartTime + ", tCode=" + tCode + ", pNo=" + pNo + "]";
	}
}
