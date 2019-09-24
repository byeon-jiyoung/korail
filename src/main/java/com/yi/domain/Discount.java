package com.yi.domain;

public class Discount {
	private int disNo;
	private String disName;
	private int disRate;
	
	public int getDisNo() {
		return disNo;
	}
	public void setDisNo(int disNo) {
		this.disNo = disNo;
	}
	public String getDisName() {
		return disName;
	}
	public void setDisName(String disName) {
		this.disName = disName;
	}
	public int getDisRate() {
		return disRate;
	}
	public void setDisRate(int disRate) {
		this.disRate = disRate;
	}
	
	@Override
	public String toString() {
		return "Discount [disNo=" + disNo + ", disName=" + disName + ", disRate=" + disRate + "]";
	}
}
