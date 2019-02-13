package com.destiny.common;

import org.springframework.web.multipart.MultipartFile;

public class Photo {
	
	///Field
	private MultipartFile fileData; //photo_uploader.html 페이지의 form 태그내에 존재하는 file 태그의 name명과 일치시켜준다
	private String callBack; //callBack URL
	private String callBackFunc; // 콜백함수
	
	///Method
	public MultipartFile getFileData() {
		return fileData;
	}
	public void setFileData(MultipartFile fileData) {
		this.fileData = fileData;
	}
	public String getCallBack() {
		return callBack;
	}
	public void setCallBack(String callBack) {
		this.callBack = callBack;
	}
	public String getCallBackFunc() {
		return callBackFunc;
	}
	public void setCallBackFunc(String callBackFunc) {
		this.callBackFunc = callBackFunc;
	}
	
	
	@Override
	public String toString() {
		return "Photo [fileData=" + fileData + ", callBack=" + callBack + ", callBackFunc=" + callBackFunc + "]";
	}

}
