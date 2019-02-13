package com.destiny.service.upload.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.common.Search;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;
import com.destiny.service.domain.Upload;
import com.destiny.service.upload.UploadDao;

@Repository("uploadDaoImpl")
public class UploadDaoImpl implements UploadDao{
	
	//Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//Constructor
	public UploadDaoImpl() {
		System.out.println(this.getClass());
	}
	
	//Method
	@Override
	public void addUload(Upload upload) throws Exception {
		sqlSession.insert("UploadMapper.addUpload", upload);
	}

	@Override
	public void updateUpload(Upload upload) throws Exception {
		sqlSession.update("UploadMapper.updateUpload", upload);
	}

	@Override
	public Upload getUpload(int communityNo) throws Exception {
		return sqlSession.selectOne("UploadMapper.getUpload", communityNo);
	}
	
	

}
