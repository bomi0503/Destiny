package com.destiny.service.upload.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.service.domain.Upload;
import com.destiny.service.upload.UploadDao;
import com.destiny.service.upload.UploadService;

@Service("uploadServiceImpl")
public class UploadServiceImpl implements UploadService{

	//Field
	@Autowired
	@Qualifier("uploadDaoImpl")
	private UploadDao uploadDao;
	public void setUploadDao(UploadDao uploadDao) {
		this.uploadDao = uploadDao;
	}
	
	//Contructor
	public UploadServiceImpl() {
		System.out.println(this.getClass());
	}
	
	//Method
	@Override
	public void addUload(Upload upload) throws Exception {
		uploadDao.addUload(upload);
	}

	@Override
	public void updateUpload(Upload upload) throws Exception {
		uploadDao.updateUpload(upload);
	}

	@Override
	public Upload getUpload(int communityNo) throws Exception {
		return uploadDao.getUpload(communityNo);
	}
	
	
}
