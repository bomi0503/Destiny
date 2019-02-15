package com.destiny.service.domain;

import java.util.List;

public class Find {

	private	 String		selectGender;
	private	 String		selectAge;
	private	 String		selectInterest;
	private	 String		selectInterest01;
	private	 String		selectInterest02;
	private String		selectInterest03;
	private	 String		town;


	public Find() {
	}


	public String getSelectGender() {
		return selectGender;
	}


	public void setSelectGender(String selectGender) {
		this.selectGender = selectGender;
	}


	public String getSelectAge() {
		return selectAge;
	}


	public void setSelectAge(String selectAge) {
		this.selectAge = selectAge;
	}


	public String getSelectInterest() {
		return selectInterest;
	}


	public void setSelectInterest(String selectInterest) {
		this.selectInterest = selectInterest;
	}


	public String getSelectInterest01() {
		return selectInterest01;
	}


	public void setSelectInterest01(String selectInterest01) {
		this.selectInterest01 = selectInterest01;
	}


	public String getSelectInterest02() {
		return selectInterest02;
	}


	public void setSelectInterest02(String selectInterest02) {
		this.selectInterest02 = selectInterest02;
	}


	public String getSelectInterest03() {
		return selectInterest03;
	}


	public void setSelectInterest03(String selectInterest03) {
		this.selectInterest03 = selectInterest03;
	}


	public String getTown() {
		return town;
	}


	public void setTown(String town) {
		this.town = town;
	}


	@Override
	public String toString() {
		return "Find [selectGender=" + selectGender + ", selectAge=" + selectAge + ", selectInterest=" + selectInterest
				+ ", selectInterest01=" + selectInterest01 + ", selectInterest02=" + selectInterest02
				+ ", selectInterest03=" + selectInterest03 + ", town=" + town + "]";
	}

	
	
}
