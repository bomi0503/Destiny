package com.destiny.service.domain;

public class LikeCount {
	
	private int likeCountNo;
	private String likeCountId;
	private int likeCountCommunityNo;
	private String likeCountCheck;
	
	public int getLikeCountNo() {
		return likeCountNo;
	}
	public void setLikeCountNo(int likeCountNo) {
		this.likeCountNo = likeCountNo;
	}
	public String getLikeCountId() {
		return likeCountId;
	}
	public void setLikeCountId(String likeCountId) {
		this.likeCountId = likeCountId;
	}
	public int getLikeCountCommunityNo() {
		return likeCountCommunityNo;
	}
	public void setLikeCountCommunityNo(int likeCountCommunityNo) {
		this.likeCountCommunityNo = likeCountCommunityNo;
	}
	public String getLikeCountCheck() {
		return likeCountCheck;
	}
	public void setLikeCountCheck(String likeCountCheck) {
		this.likeCountCheck = likeCountCheck;
	}
	
	@Override
	public String toString() {
		return "LikeCount [likeCountNo=" + likeCountNo + ", likeCountId=" + likeCountId + ", likeCountCommunityNo="
				+ likeCountCommunityNo + ", likeCountCheck=" + likeCountCheck + "]";
	}
	
	
	
}
