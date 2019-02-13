package com.destiny.service.notice.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.service.notice.NoticeDao;

@Repository("noticeDaoImpl")
public class NoticeDaoImpl implements NoticeDao{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	public NoticeDaoImpl() {
		System.out.println(this.getClass());
	}
}
