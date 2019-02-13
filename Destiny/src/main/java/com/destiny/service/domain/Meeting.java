package com.destiny.service.domain;

import org.springframework.web.multipart.MultipartFile;

public class Meeting {
	
	private	int		meetingNo;
	private	String	role;
	private	String	meetingMasterId;
	private	String	masterProfileImg;
	private String	meetingCenter;
	private String 	meetingName;
	private	String	titleImg;
	private	String	meetingDetail;
	private	String	meetingRule;
	private String	interestName;
	private	String	meetingLocation;
	private	String	meetingDate;
	private	String	meetingDay;
	private	String	meetingTime;
	private	String	snooze;
	private	String	meetingDues;
	private	int		meetingViews;
	private	String	meetingCondition;
	private	String	shutDownDate;
	private	int		meetingCrewLimit;
	private int		interestNo;
	private	String	crewNickName;
	private	String	interview;
	private MultipartFile  imgFile;
	private	String	crewCondition;
	private int		meetingActCount;
	private String	interviewTitle;
	private int		meetingActNo;
	private int		meetingCrewNo;
	private String	targetId;
	
	public int getMeetingNo() {
		return meetingNo;
	}
	public void setMeetingNo(int meetingNo) {
		this.meetingNo = meetingNo;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getMeetingMasterId() {
		return meetingMasterId;
	}
	public void setMeetingMasterId(String meetingMasterId) {
		this.meetingMasterId = meetingMasterId;
	}
	public String getMasterProfileImg() {
		return masterProfileImg;
	}
	public void setMasterProfileImg(String masterProfileImg) {
		this.masterProfileImg = masterProfileImg;
	}
	public String getMeetingCenter() {
		return meetingCenter;
	}
	public void setMeetingCenter(String meetingCenter) {
		this.meetingCenter = meetingCenter;
	}
	public String getMeetingName() {
		return meetingName;
	}
	public void setMeetingName(String meetingName) {
		this.meetingName = meetingName;
	}
	public String getTitleImg() {
		return titleImg;
	}
	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}
	public String getMeetingDetail() {
		return meetingDetail;
	}
	public void setMeetingDetail(String meetingDetail) {
		this.meetingDetail = meetingDetail;
	}
	public String getMeetingRule() {
		return meetingRule;
	}
	public void setMeetingRule(String meetingRule) {
		this.meetingRule = meetingRule;
	}
	public String getInterestName() {
		return interestName;
	}
	public void setInterestName(String interestName) {
		this.interestName = interestName;
	}
	public String getMeetingLocation() {
		return meetingLocation;
	}
	public void setMeetingLocation(String meetingLocation) {
		this.meetingLocation = meetingLocation;
	}
	public String getMeetingDate() {
		if(meetingDate != null) {
		return meetingDate.substring(0,10);
		}else {
			return meetingDate;
		}
	}
	public void setMeetingDate(String meetingDate) {
		if(meetingDate != null) {
			this.meetingDate = meetingDate.substring(0,10);
		}else {
			this.meetingDate = meetingDate;
		}
		
	}
	public String getMeetingDay() {
		return meetingDay;
	}
	public void setMeetingDay(String meetingDay) {
		this.meetingDay = meetingDay;
	}
	public String getMeetingTime() {
		return meetingTime;
	}
	public void setMeetingTime(String meetingTime) {
		this.meetingTime = meetingTime;
	}
	public String getSnooze() {
		return snooze;
	}
	public void setSnooze(String snooze) {
		this.snooze = snooze;
	}
	public String getMeetingDues() {
		return meetingDues;
	}
	public void setMeetingDues(String meetingDues) {
		this.meetingDues = meetingDues;
	}
	public int getMeetingViews() {
		return meetingViews;
	}
	public void setMeetingViews(int meetingViews) {
		this.meetingViews = meetingViews;
	}
	
	public String getShutDownDate() {
		if(shutDownDate != null) {
			return shutDownDate.substring(0,10);
		}else {
			return shutDownDate;
		}
	}
	public void setShutDownDate(String shutDownDate) {
		
		this.shutDownDate = shutDownDate;
	}
	public int getMeetingCrewLimit() {
		return meetingCrewLimit;
	}
	public void setMeetingCrewLimit(int meetingCrewLimit) {
		this.meetingCrewLimit = meetingCrewLimit;
	}
	public int getInterestNo() {
		return interestNo;
	}
	public void setInterestNo(int interestNo) {
		this.interestNo = interestNo;
	}
	public String getCrewNickName() {
		return crewNickName;
	}
	public void setCrewNickName(String crewNickName) {
		this.crewNickName = crewNickName;
	}
	public String getInterview() {
		return interview;
	}
	public void setInterview(String interview) {
		this.interview = interview;
	}
	
	public String getMeetingCondition() {
		return meetingCondition;
	}
	public void setMeetingCondition(String meetingCondition) {
		this.meetingCondition = meetingCondition;
	}
	public MultipartFile getImgFile() {
		return imgFile;
	}
	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}
	
	
	public String getCrewCondition() {
		return crewCondition;
	}
	public void setCrewCondition(String crewCondition) {
		this.crewCondition = crewCondition;
	}
	
	public int getMeetingActCount() {
		return meetingActCount;
	}
	
	public void setMeetingActCount(int meetingActCount) {
		this.meetingActCount = meetingActCount;
	}
	public String getInterviewTitle() {
		return interviewTitle;
	}
	
	public void setInterviewTitle(String interviewTitle) {
		this.interviewTitle = interviewTitle;
	}
	public int getMeetingActNo() {
		return meetingActNo;
	}
	public void setMeetingActNo(int meetingActNo) {
		this.meetingActNo = meetingActNo;
	}
	public int getMeetingCrewNo() {
		return meetingCrewNo;
	}
	public void setMeetingCrewNo(int meetingCrewNo) {
		this.meetingCrewNo = meetingCrewNo;
	}
	public String getTargetId() {
		return targetId;
	}
	
	public void setTargetId(String targetId) {
		this.targetId = targetId;
	}
	@Override
	public String toString() {
		return "Meeting [meetingNo=" + meetingNo + ", role=" + role + ", meetingMasterId=" + meetingMasterId
				+ ", masterProfileImg=" + masterProfileImg + ", meetingCenter=" + meetingCenter + ", meetingName="
				+ meetingName + ", titleImg=" + titleImg + ", meetingDetail=" + meetingDetail + ", meetingRule="
				+ meetingRule + ", interestName=" + interestName + ", meetingLocation=" + meetingLocation
				+ ", meetingDate=" + meetingDate + ", meetingDay=" + meetingDay + ", meetingTime=" + meetingTime
				+ ", snooze=" + snooze + ", meetingDues=" + meetingDues + ", meetingViews=" + meetingViews
				+ ", meetingCondition=" + meetingCondition + ", shutDownDate=" + shutDownDate + ", meetingCrewLimit="
				+ meetingCrewLimit + ", interestNo=" + interestNo + ", crewNickName=" + crewNickName + ", interview="
				+ interview + ", imgFile=" + imgFile + ", crewCondition=" + crewCondition + ", meetingActCount="
				+ meetingActCount + ", interviewTitle=" + interviewTitle + ", meetingActNo=" + meetingActNo
				+ ", meetingCrewNo=" + meetingCrewNo + ", targetId=" + targetId + "]";
	}
	
	
	
}
