package com.destiny.service.domain;

public class Location {
	
	private int locationNo;
	private String cityName;
	private String townName;
	
	
	public int getLocationNo() {
		return locationNo;
	}
	public void setLocationNo(int locationNo) {
		this.locationNo = locationNo;
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getTownName() {
		return townName;
	}
	public void setTownName(String townName) {
		this.townName = townName;
	}
	
	@Override
	public String toString() {
		return "Location [locationNo=" + locationNo + ", cityName=" + cityName + ", townName=" + townName + "]";
	}
	
	

}
