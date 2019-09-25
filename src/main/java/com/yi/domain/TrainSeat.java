package com.yi.domain;

public class TrainSeat {
	private int tsCar;
	private int tsNo;
	private boolean tsChoice;
	private Train tCode;
	
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
	public boolean isTsChoice() {
		return tsChoice;
	}
	public void setTsChoice(boolean tsChoice) {
		this.tsChoice = tsChoice;
	}
	public Train gettCode() {
		return tCode;
	}
	public void settCode(Train tCode) {
		this.tCode = tCode;
	}

	@Override
	public String toString() {
		return "TrainSeat [tsCar=" + tsCar + ", tsNo=" + tsNo + ", tsChoice=" + tsChoice + ", tCode=" + tCode + "]";
	}
}
