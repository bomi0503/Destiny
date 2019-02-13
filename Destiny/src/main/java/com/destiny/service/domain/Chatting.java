package com.destiny.service.domain;


import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class Chatting {
	
	private int 				chattingNo;
	private String			beforeTranslationText;
	private String			afterTranslationText;
	private Date				chattingDate;
	private String			chattingTime;
	private String			manId;
	private String 			womanId;
	private String			language;
	private int				favorability;
	private List<String>	telepathyResult;
	private String		contactMeeting;
	private MultipartFile  imgFile;
	private MultipartFile  voiceFile;
	
	
	public int getChattingNo() {
		return chattingNo;
	}
	public String getBeforeTranslationText() {
		return beforeTranslationText;
	}
	public String getAfterTranslationText() {
		return afterTranslationText;
	}
	public Date getChattingDate() {
		return chattingDate;
	}
	public String getChattingTime() {
		return chattingTime;
	}
	public String getManId() {
		return manId;
	}
	public String getWomanId() {
		return womanId;
	}
	public String getLanguage() {
		return language;
	}
	public int getFavorability() {
		return favorability;
	}
	public List<String> getTelepathyResult() {
		return telepathyResult;
	}
	public String getContactMeeting() {
		return contactMeeting;
	}
	public MultipartFile getImgFile() {
		return imgFile;
	}
	public MultipartFile getVoiceFile() {
		return voiceFile;
	}
	public void setChattingNo(int chattingNo) {
		this.chattingNo = chattingNo;
	}
	public void setBeforeTranslationText(String beforeTranslationText) {
		this.beforeTranslationText = beforeTranslationText;
	}
	public void setAfterTranslationText(String afterTranslationText) {
		this.afterTranslationText = afterTranslationText;
	}
	public void setChattingDate(Date chattingDate) {
		this.chattingDate = chattingDate;
	}
	public void setChattingTime(String chattingTime) {
		this.chattingTime = chattingTime;
	}
	public void setManId(String manId) {
		this.manId = manId;
	}
	public void setWomanId(String womanId) {
		this.womanId = womanId;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public void setFavorability(int favorability) {
		this.favorability = favorability;
	}
	public void setTelepathyResult(List<String> telepathyResult) {
		this.telepathyResult = telepathyResult;
	}
	public void setContactMeeting(String contactMeeting) {
		this.contactMeeting = contactMeeting;
	}
	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}
	public void setVoiceFile(MultipartFile voiceFile) {
		this.voiceFile = voiceFile;
	}
	@Override
	public String toString() {
		return "Chatting [chattingNo=" + chattingNo + ", beforeTranslationText=" + beforeTranslationText
				+ ", afterTranslationText=" + afterTranslationText + ", chattingDate=" + chattingDate
				+ ", chattingTime=" + chattingTime + ", manId=" + manId + ", womanId=" + womanId + ", language="
				+ language + ", favorability=" + favorability + ", telepathyResult=" + telepathyResult
				+ ", contactMeeting=" + contactMeeting + ", imgFile=" + imgFile + ", voiceFile=" + voiceFile + "]";
	}
	

	
	






	
	
}
