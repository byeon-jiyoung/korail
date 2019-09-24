package com.yi.domain;

import java.util.Date;
import java.util.List;

public class Member {
	private String memId;
	private String memPw;
	private String memName;
	private Date memBirth;
	private String memPhone;
	private String memAddress;
	private String memdetailaddr;
	private int memMileage;
	private Date memJoin;
	private boolean memWithdrawal;
	private List<Discount> discount;
	
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
	public Date getMemBirth() {
		return memBirth;
	}
	public void setMemBirth(Date memBirth) {
		this.memBirth = memBirth;
	}
	public String getMemPhone() {
		return memPhone;
	}
	public void setMemPhone(String memPhone) {
		this.memPhone = memPhone;
	}
	public String getMemAddress() {
		return memAddress;
	}
	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	public String getMemdetailaddr() {
		return memdetailaddr;
	}
	public void setMemdetailaddr(String memdetailaddr) {
		this.memdetailaddr = memdetailaddr;
	}
	public int getMemMileage() {
		return memMileage;
	}
	public void setMemMileage(int memMileage) {
		this.memMileage = memMileage;
	}
	public Date getMemJoin() {
		return memJoin;
	}
	public void setMemJoin(Date memJoin) {
		this.memJoin = memJoin;
	}
	public boolean isMemWithdrawal() {
		return memWithdrawal;
	}
	public void setMemWithdrawal(boolean memWithdrawal) {
		this.memWithdrawal = memWithdrawal;
	}
	public List<Discount> getDiscount() {
		return discount;
	}
	public void setDiscount(List<Discount> discount) {
		this.discount = discount;
	}
	
	@Override
	public String toString() {
		return "Member [memId=" + memId + ", memPw=" + memPw + ", memName=" + memName + ", memBirth=" + memBirth
				+ ", memPhone=" + memPhone + ", memAddress=" + memAddress + ", memdetailaddr=" + memdetailaddr
				+ ", memMileage=" + memMileage + ", memJoin=" + memJoin + ", memWithdrawal=" + memWithdrawal
				+ ", discount=" + discount + "]";
	}
}
