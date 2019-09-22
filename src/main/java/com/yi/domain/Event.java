package com.yi.domain;

import java.util.Date;

public class Event {
	public int eNo;
	public String eWriter;
	public String eTitle;
	public String eContent;
	public int eReadcnt;
	public Date eRegdate;
	public Date eModdate;
	public boolean eDelete;
	public String eImg;
	public int geteNo() {
		return eNo;
	}
	public void seteNo(int eNo) {
		this.eNo = eNo;
	}
	public String geteWriter() {
		return eWriter;
	}
	public void seteWriter(String eWriter) {
		this.eWriter = eWriter;
	}
	public String geteTitle() {
		return eTitle;
	}
	public void seteTitle(String eTitle) {
		this.eTitle = eTitle;
	}
	public String geteContent() {
		return eContent;
	}
	public void seteContent(String eContent) {
		this.eContent = eContent;
	}
	public int geteReadcnt() {
		return eReadcnt;
	}
	public void seteReadcnt(int eReadcnt) {
		this.eReadcnt = eReadcnt;
	}
	public Date geteRegdate() {
		return eRegdate;
	}
	public void seteRegdate(Date eRegdate) {
		this.eRegdate = eRegdate;
	}
	public Date geteModdate() {
		return eModdate;
	}
	public void seteModdate(Date eModdate) {
		this.eModdate = eModdate;
	}
	public boolean iseDelete() {
		return eDelete;
	}
	public void seteDelete(boolean eDelete) {
		this.eDelete = eDelete;
	}
	public String geteImg() {
		return eImg;
	}
	public void seteImg(String eImg) {
		this.eImg = eImg;
	}
	
	@Override
	public String toString() {
		return "Event [eNo=" + eNo + ", eWriter=" + eWriter + ", eTitle=" + eTitle + ", eContent=" + eContent
				+ ", eReadcnt=" + eReadcnt + ", eRegdate=" + eRegdate + ", eModdate=" + eModdate + ", eDelete="
				+ eDelete + ", eImg=" + eImg + "]";
	}
}
