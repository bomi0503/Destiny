package com.destiny.service.info.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.service.info.InfoDao;

@Repository("infoDaoImpl")
public class InfoDaoImpl implements InfoDao {
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	public InfoDaoImpl() {
		System.out.println(this.getClass());
	}
}
