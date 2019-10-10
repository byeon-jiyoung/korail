package com.yi.domain;

import java.util.Date;

public class Reservation {
	private int resNo;
	private Member memId;
	private Date resDate;
	private int resPeople;
	private boolean resCancel;
	private Sale salNo;
	private TrainTime ttNo;
	private TrainSeat tsCar;
	private TrainSeat tsNo;
	private TrainSeat tCode;
	private int resClaNum;
	private String nomemPhone;

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
	public int getResPeople() {
		return resPeople;
	}
	public void setResPeople(int resPeople) {
		this.resPeople = resPeople;
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
	public TrainSeat gettCode() {
		return tCode;
	}
	public void settCode(TrainSeat tCode) {
		this.tCode = tCode;
	}
	public int getResClaNum() {
		return resClaNum;
	}
	public void setResClaNum(int resClaNum) {
		this.resClaNum = resClaNum;
	}
	public String getNomemPhone() {
		return nomemPhone;
	}
	public void setNomemPhone(String nomemPhone) {
		this.nomemPhone = nomemPhone;
	}
	
	@Override
	public String toString() {
		return "Reservation [resNo=" + resNo + ", memId=" + memId + ", resDate=" + resDate + ", resPeople=" + resPeople
				+ ", resCancel=" + resCancel + ", salNo=" + salNo + ", ttNo=" + ttNo + ", tsCar=" + tsCar + ", tsNo="
				+ tsNo + ", tCode=" + tCode + ", resClaNum=" + resClaNum + ", nomemPhone=" + nomemPhone + "]";
	}
}
