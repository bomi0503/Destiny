package com.destiny.service.complain.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.common.Search;
import com.destiny.service.complain.ComplainDao;
import com.destiny.service.domain.Complain;

@Repository("complainDaoImpl")
public class ComplainDaoImpl implements ComplainDao {
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	///Constructor
	public ComplainDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addComplain(Complain complain) throws Exception {
		sqlSession.insert("ComplainMapper.addComplain", complain);
	}

	@Override
	public List<Complain> getComplainList(Search search) throws Exception {
		return sqlSession.selectList("ComplainMapper.getComplainList", search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("ComplainMapper.getTotalCount", search);
	}

	@Override
	public Complain getComplain(int complainNo) throws Exception {
		return sqlSession.selectOne("ComplainMapper.getComplain", complainNo);
	}

	@Override
	public void updateComplain(Complain complain) throws Exception {
		sqlSession.update("ComplainMapper.updateComplain", complain);
	}

	
}
