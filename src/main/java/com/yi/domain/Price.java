package com.yi.domain;

public class Price {
	private int pNo;
	private int price;
	private CityTrain nodeidS;
	private CityTrain nodeidA;
	
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public CityTrain getNodeidS() {
		return nodeidS;
	}
	public void setNodeidS(CityTrain nodeidS) {
		this.nodeidS = nodeidS;
	}
	public CityTrain getNodeidA() {
		return nodeidA;
	}
	public void setNodeidA(CityTrain nodeidA) {
		this.nodeidA = nodeidA;
	}
	
	@Override
	public String toString() {
		return "Price [pNo=" + pNo + ", price=" + price + ", nodeidS=" + nodeidS + ", nodeidA=" + nodeidA + "]";
	}
}
