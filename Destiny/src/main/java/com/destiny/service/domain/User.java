package com.destiny.service.domain;

import java.sql.Date;

public class User {
	
	private String	userId;
	private String	password;
	private String	email;
	private String	address;
	private Date		birthday;
	private String	profile;
	private String	nickName;
	private String	gender;
	private String	phone;
	private int		attendCount;
	private Date		lastLoginDay;
	private	int		warningCount;
	private String	userGrade;
	private int		myType;
	private int		firstType;
	private int		secondType;
	private int		thirdType;
	private int		firstInterest;
	private int		secondInterest;
	private int		thirdInterest;
	private String	userState;
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getAttendCount() {
		return attendCount;
	}
	public void setAttendCount(int attendCount) {
		this.attendCount = attendCount;
	}
	public Date getLastLoginDay() {
		return lastLoginDay;
	}
	public void setLastLoginDay(Date lastLoginDay) {
		this.lastLoginDay = lastLoginDay;
	}
	public int getWarningCount() {
		return warningCount;
	}
	public void setWarningCount(int warningCount) {
		this.warningCount = warningCount;
	}
	public int getFirstInterest() {
		return firstInterest;
	}
	public void setFirstInterest(int firstInterest) {
		this.firstInterest = firstInterest;
	}
	public int getSecondInterest() {
		return secondInterest;
	}
	public void setSecondInterest(int secondInterest) {
		this.secondInterest = secondInterest;
	}
	public int getThirdInterest() {
		return thirdInterest;
	}
	public void setThirdInterest(int thirdInterest) {
		this.thirdInterest = thirdInterest;
	}
	public String getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}
	public int getMyType() {
		return myType;
	}
	public void setMyType(int myType) {
		this.myType = myType;
	}
	public int getFirstType() {
		return firstType;
	}
	public void setFirstType(int firstType) {
		this.firstType = firstType;
	}
	public int getSecondType() {
		return secondType;
	}
	public void setSecondType(int secondType) {
		this.secondType = secondType;
	}
	public int getThirdType() {
		return thirdType;
	}
	public void setThirdType(int thirdType) {
		this.thirdType = thirdType;
	}

	
	public String getUserState() {
		return userState;
	}
	public void setUserState(String userState) {
		this.userState = userState;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", password=" + password + ", email=" + email + ", address=" + address
				+ ", birthday=" + birthday + ", profile=" + profile + ", nickName=" + nickName + ", gender=" + gender
				+ ", phone=" + phone + ", attendCount=" + attendCount + ", lastLoginDay=" + lastLoginDay
				+ ", warningCount=" + warningCount + ", userGrade=" + userGrade + ", myType=" + myType + ", firstType="
				+ firstType + ", secondType=" + secondType + ", thirdType=" + thirdType + ", firstInterest="
				+ firstInterest + ", secondInterest=" + secondInterest + ", thirdInterest=" + thirdInterest
				+ ", userState=" + userState + "]";
	}
	
	
	
	

}
