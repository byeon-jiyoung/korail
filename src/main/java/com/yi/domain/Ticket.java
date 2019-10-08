package com.yi.domain;

import java.util.Date;

public class Ticket {
	private int salPrice;
	private int salDiscount;
	private boolean salClassify;
	private Member memId;
	private Date resDate;
	private int resPeople;
	private TrainSeat tsCar;
	private TrainSeat tsNo;
	private CityTrain tStart;
	private CityTrain nodeid;
	private Date tStartTime;
	private Date ttStartTime;
	
	public int getSalPrice() {
		return salPrice;
	}
	public void setSalPrice(int salPrice) {
		this.salPrice = salPrice;
	}
	public int getSalDiscount() {
		return salDiscount;
	}
	public void setSalDiscount(int salDiscount) {
		this.salDiscount = salDiscount;
	}
	public boolean isSalClassify() {
		return salClassify;
	}
	public void setSalClassify(boolean salClassify) {
		this.salClassify = salClassify;
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
	public CityTrain gettStart() {
		return tStart;
	}
	public void settStart(CityTrain tStart) {
		this.tStart = tStart;
	}
	public CityTrain getNodeid() {
		return nodeid;
	}
	public void setNodeid(CityTrain nodeid) {
		this.nodeid = nodeid;
	}
	public Date gettStartTime() {
		return tStartTime;
	}
	public void settStartTime(Date tStartTime) {
		this.tStartTime = tStartTime;
	}
	public Date getTtStartTime() {
		return ttStartTime;
	}
	public void setTtStartTime(Date ttStartTime) {
		this.ttStartTime = ttStartTime;
	}
	
	@Override
	public String toString() {
		return "Ticket [salPrice=" + salPrice + ", salDiscount=" + salDiscount + ", salClassify=" + salClassify
				+ ", memId=" + memId + ", resDate=" + resDate + ", resPeople=" + resPeople + ", tsCar=" + tsCar
				+ ", tsNo=" + tsNo + ", tStart=" + tStart + ", nodeid=" + nodeid + ", tStartTime=" + tStartTime
				+ ", ttStartTime=" + ttStartTime + "]";
	}
}
