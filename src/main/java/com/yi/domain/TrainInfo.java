package com.yi.domain;

public class TrainInfo {
	private int tiNo;
	private String tiName;
	
	public int getTiNo() {
		return tiNo;
	}
	public void setTiNo(int tiNo) {
		this.tiNo = tiNo;
	}
	public String getTiName() {
		return tiName;
	}
	public void setTiName(String tiName) {
		this.tiName = tiName;
	}

	@Override
	public String toString() {
		return "TrainInfo [tiNo=" + tiNo + ", tiName=" + tiName + "]";
	}
}
