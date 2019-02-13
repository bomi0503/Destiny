package com.destiny.common;

import org.springframework.web.multipart.MultipartFile;

public class Photo {
	
	///Field
	private MultipartFile fileData; //photo_uploader.html �������� form �±׳��� �����ϴ� file �±��� name��� ��ġ�����ش�
	private String callBack; //callBack URL
	private String callBackFunc; // �ݹ��Լ�
	
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
