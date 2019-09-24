package com.yi.domain;

public class CityTrain {
	private String nodeid;
	private String nodename;
	private City citycode;
	
	public String getNodeid() {
		return nodeid;
	}
	public void setNodeid(String nodeid) {
		this.nodeid = nodeid;
	}
	public String getNodename() {
		return nodename;
	}
	public void setNodename(String nodename) {
		this.nodename = nodename;
	}
	public City getCitycode() {
		return citycode;
	}
	public void setCitycode(City citycode) {
		this.citycode = citycode;
	}
	
	@Override
	public String toString() {
		return "CityTrain [nodeid=" + nodeid + ", nodename=" + nodename + ", citycode=" + citycode + "]";
	}
}
