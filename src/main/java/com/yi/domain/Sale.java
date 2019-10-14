package com.yi.domain;

public class Sale {
	private int salNo;
	private int salPrice;
	private int salDiscount;
	private boolean salClassify;
	private boolean salCancel;
	
	public int getSalNo() {
		return salNo;
	}
	public void setSalNo(int salNo) {
		this.salNo = salNo;
	}
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
	public boolean isSalCancel() {
		return salCancel;
	}
	public void setSalCancel(boolean salCancel) {
		this.salCancel = salCancel;
	}
	
	@Override
	public String toString() {
		return String.format("Sale [salNo=%s, salPrice=%s, salDiscount=%s, salClassify=%s, salCancel=%s]", salNo,
				salPrice, salDiscount, salClassify, salCancel);
	}
}
