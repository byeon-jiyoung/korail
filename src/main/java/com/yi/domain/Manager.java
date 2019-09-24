package com.yi.domain;

public class Manager {
	private String manId;
	private String manPw;
	
	public String getManId() {
		return manId;
	}
	public void setManId(String manId) {
		this.manId = manId;
	}
	public String getManPw() {
		return manPw;
	}
	public void setManPw(String manPw) {
		this.manPw = manPw;
	}
	
	@Override
	public String toString() {
		return "Manager [manId=" + manId + ", manPw=" + manPw + "]";
	}
}
