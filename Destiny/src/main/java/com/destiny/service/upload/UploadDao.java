package com.destiny.service.upload;

import java.util.List;

import com.destiny.common.Search;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;
import com.destiny.service.domain.Upload;

public interface UploadDao {
	
	//���� ���
	public void addUload(Upload upload) throws Exception;
	
	//���� ����
	public void updateUpload(Upload upload) throws Exception;
	
	//���� �󼼺���
	public Upload getUpload(int communityNo) throws Exception;

}
