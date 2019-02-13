package com.destiny.service.upload;

import com.destiny.service.domain.Community;
import com.destiny.service.domain.Upload;

public interface UploadService {

	//���� ���
	public void addUload(Upload upload) throws Exception;
	
	//���� ����
	public void updateUpload(Upload upload) throws Exception;
	
	//���� �󼼺���
	public Upload getUpload(int communityNo) throws Exception;
	
}
