package com.yi.domain;

public class City {
	private int citycode;
	private String cityname;
	
	public int getCitycode() {
		return citycode;
	}
	public void setCitycode(int citycode) {
		this.citycode = citycode;
	}
	public String getCityname() {
		return cityname;
	}
	public void setCityname(String cityname) {
		this.cityname = cityname;
	}
	
	@Override
	public String toString() {
		return "City [citycode=" + citycode + ", cityname=" + cityname + "]";
	}
}
