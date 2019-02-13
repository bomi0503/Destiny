package com.destiny.service.domain;

import java.sql.Date;

public class Community {
	
	private int	communityNo;
	private String	writerId;
	private int	meetingNo;
	private String category;
	private String userGrade;
	private String title;
	private String writerNickName;
	private String detail;
	private Date writeDate;
	private int views;
	private int like;
	private String importRank;
	private String viewCondition;
	private String fileName;
	
	
	public int getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}
	public String getWriterId() {
		return writerId;
	}
	public void setWriterId(String writerId) {
		this.writerId = writerId;
	}
	public int getMeetingNo() {
		return meetingNo;
	}
	public void setMeetingNo(int meetingNo) {
		this.meetingNo = meetingNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getUserGrade() {
		return userGrade;
	}
	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriterNickName() {
		return writerNickName;
	}
	public void setWriterNickName(String writerNickName) {
		this.writerNickName = writerNickName;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public String getImportRank() {
		return importRank;
	}
	public void setImportRank(String importRank) {
		this.importRank = importRank;
	}
	public String getViewCondition() {
		return viewCondition;
	}
	public void setViewCondition(String viewCondition) {
		this.viewCondition = viewCondition;
	}
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	@Override
	public String toString() {
		return "Community [communityNo=" + communityNo + ", writerId=" + writerId + ", meetingNo=" + meetingNo
				+ ", category=" + category + ", userGrade=" + userGrade + ", title=" + title + ", writerNickName="
				+ writerNickName + ", detail=" + detail + ", writeDate=" + writeDate + ", views=" + views + ", like="
				+ like + ", importRank=" + importRank + ", viewCondition=" + viewCondition + ", fileName=" + fileName
				+ "]";
	}
	

}
