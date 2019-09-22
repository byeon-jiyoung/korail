package com.yi.domain;

import java.util.Date;

public class Notice {
	public int noNo;
	public String noWriter;
	public String noTitle;
	public String noContent;
	public int noReadcnt;
	public Date noRegdate;
	public Date noModdate;
	public boolean noDelete;
	public String noImg;
	
	public int getNoNo() {
		return noNo;
	}
	public void setNoNo(int noNo) {
		this.noNo = noNo;
	}
	public String getNoWriter() {
		return noWriter;
	}
	public void setNoWriter(String noWriter) {
		this.noWriter = noWriter;
	}
	public String getNoTitle() {
		return noTitle;
	}
	public void setNoTitle(String noTitle) {
		this.noTitle = noTitle;
	}
	public String getNoContent() {
		return noContent;
	}
	public void setNoContent(String noContent) {
		this.noContent = noContent;
	}
	public int getNoReadcnt() {
		return noReadcnt;
	}
	public void setNoReadcnt(int noReadcnt) {
		this.noReadcnt = noReadcnt;
	}
	public Date getNoRegdate() {
		return noRegdate;
	}
	public void setNoRegdate(Date noRegdate) {
		this.noRegdate = noRegdate;
	}
	public Date getNoModdate() {
		return noModdate;
	}
	public void setNoModdate(Date noModdate) {
		this.noModdate = noModdate;
	}
	public boolean isNoDelete() {
		return noDelete;
	}
	public void setNoDelete(boolean noDelete) {
		this.noDelete = noDelete;
	}
	public String getNoImg() {
		return noImg;
	}
	public void setNoImg(String noImg) {
		this.noImg = noImg;
	}
	
	@Override
	public String toString() {
		return "Notice [noNo=" + noNo + ", noWriter=" + noWriter + ", noTitle=" + noTitle + ", noCentent=" + noContent
				+ ", noReadcnt=" + noReadcnt + ", noRegdate=" + noRegdate + ", noModdate=" + noModdate + ", noDelete="
				+ noDelete + ", noImg=" + noImg + "]";
	}
	
}
