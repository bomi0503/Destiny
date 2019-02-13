package com.destiny.service.domain;

public class Upload {

	private int uploadNo;
	private int communityNo;
	private String fileName;
	private String fileCode;
	public int getUploadNo() {
		return uploadNo;
	}
	
	
	public void setUploadNo(int uploadNo) {
		this.uploadNo = uploadNo;
	}
	public int getCommunityNo() {
		return communityNo;
	}
	public void setCommunityNo(int communityNo) {
		this.communityNo = communityNo;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileCode() {
		return fileCode;
	}
	public void setFileCode(String fileCode) {
		this.fileCode = fileCode;
	}


	@Override
	public String toString() {
		return "Upload [uploadNo=" + uploadNo + ", communityNo=" + communityNo + ", fileName=" + fileName
				+ ", fileCode=" + fileCode + "]";
	}
	
	
	
}
