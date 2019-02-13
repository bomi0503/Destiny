package com.destiny.service.upload;

import com.destiny.service.domain.Community;
import com.destiny.service.domain.Upload;

public interface UploadService {

	//파일 등록
	public void addUload(Upload upload) throws Exception;
	
	//파일 수정
	public void updateUpload(Upload upload) throws Exception;
	
	//파일 상세보기
	public Upload getUpload(int communityNo) throws Exception;
	
}
