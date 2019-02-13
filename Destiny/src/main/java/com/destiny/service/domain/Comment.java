package com.destiny.service.domain;

import java.sql.Date;

public class Comment {
	
	private int commentNo;
	private int commentComuNo;
	private String commentWriterId;
	private String commentDetail;
	private Date commentDate;
	private int targetNo;
	private String viewCondition;
	private String profile;
	
	
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getCommentComuNo() {
		return commentComuNo;
	}
	public void setCommentComuNo(int commentComuNo) {
		this.commentComuNo = commentComuNo;
	}
	public String getCommentWriterId() {
		return commentWriterId;
	}
	public void setCommentWriterId(String commentWriterId) {
		this.commentWriterId = commentWriterId;
	}
	public String getCommentDetail() {
		return commentDetail;
	}
	public void setCommentDetail(String commentDetail) {
		this.commentDetail = commentDetail;
	}
	public Date getCommentDate() {
		return commentDate;
	}
	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}
	public int getTargetNo() {
		return targetNo;
	}
	public void setTargetNo(int targetNo) {
		this.targetNo = targetNo;
	}
	public String getViewCondition() {
		return viewCondition;
	}
	public void setViewCondition(String viewCondition) {
		this.viewCondition = viewCondition;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", commentComuNo=" + commentComuNo + ", commentWriterId="
				+ commentWriterId + ", commentDetail=" + commentDetail + ", commentDate=" + commentDate + ", targetNo="
				+ targetNo + ", viewCondition=" + viewCondition + ", profile=" + profile + "]";
	}

}
