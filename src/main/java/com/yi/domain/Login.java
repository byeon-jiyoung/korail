package com.yi.domain;

public class Login {
	private String memId;
	private String memPw;
	private String memName;
	private int memMileage;
	private String memPhone;
	
	public Login() {}
	
	public Login(String memId, String memPw, String memName, int memMileage, String memPhone) {
		super();
		this.memId = memId;
		this.memPw = memPw;
		this.memName = memName;
		this.memMileage = memMileage;
		this.memPhone = memPhone;
	}

	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getMemMileage() {
		return memMileage;
	}
	public void setMemMileage(int memMileage) {
		this.memMileage = memMileage;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}

	@Override
	public String toString() {
		return "Login [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + ", memMileage=" + memMileage
				+ ", memPhone=" + memPhone + "]";
	}
	
}
