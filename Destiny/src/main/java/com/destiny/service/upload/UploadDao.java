package com.destiny.service.upload;

import java.util.List;

import com.destiny.common.Search;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;
import com.destiny.service.domain.Upload;

public interface UploadDao {
	
	//파일 등록
	public void addUload(Upload upload) throws Exception;
	
	//파일 수정
	public void updateUpload(Upload upload) throws Exception;
	
	//파일 상세보기
	public Upload getUpload(int communityNo) throws Exception;

}
