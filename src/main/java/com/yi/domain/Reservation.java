package com.yi.domain;

import java.util.Date;

public class Reservation {
	private int resNo;
	private Member memId;
	private Date resDate;
	private boolean resCancel;
	private Sale salNo;
	private TrainTime ttNo;
	private TrainSeat tsCar;
	private TrainSeat tsNo;
	
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public Member getMemId() {
		return memId;
	}
	public void setMemId(Member memId) {
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
	public TrainTime getTtNo() {
		return ttNo;
	}
	public void setTtNo(TrainTime ttNo) {
		this.ttNo = ttNo;
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
				+ ", salNo=" + salNo + ", ttNo=" + ttNo + ", tsCar=" + tsCar + ", tsNo=" + tsNo + "]";
	}
}
