package com.yi.domain;

import java.util.Date;

public class Reservation {
	private int resNo;
	private String memId;
	private Date resDate;
	private boolean resCancel;
	private Sale salNo;
	private TrainTime ttNoS;
	private TrainTime ttNoA;
	private TrainSeat tsCar;
	private TrainSeat tsNo;
	
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public Date getResDate() {
		return resDate;
	}
	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}
	public boolean isResCancel() {
		return resCancel;
	}
	public void setResCancel(boolean resCancel) {
		this.resCancel = resCancel;
	}
	public Sale getSalNo() {
		return salNo;
	}
	public void setSalNo(Sale salNo) {
		this.salNo = salNo;
	}
	public TrainTime getTtNoS() {
		return ttNoS;
	}
	public void setTtNoS(TrainTime ttNoS) {
		this.ttNoS = ttNoS;
	}
	public TrainTime getTtNoA() {
		return ttNoA;
	}
	public void setTtNoA(TrainTime ttNoA) {
		this.ttNoA = ttNoA;
	}
	public TrainSeat getTsCar() {
		return tsCar;
	}
	public void setTsCar(TrainSeat tsCar) {
		this.tsCar = tsCar;
	}
	public TrainSeat getTsNo() {
		return tsNo;
	}
	public void setTsNo(TrainSeat tsNo) {
		this.tsNo = tsNo;
	}
	
	@Override
	public String toString() {
		return "Reservation [resNo=" + resNo + ", memId=" + memId + ", resDate=" + resDate + ", resCancel=" + resCancel
				+ ", salNo=" + salNo + ", ttNoS=" + ttNoS + ", ttNoA=" + ttNoA + ", tsCar=" + tsCar + ", tsNo=" + tsNo
				+ "]";
	}
}
