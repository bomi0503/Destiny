package com.destiny.service.find.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.common.Search;
import com.destiny.service.domain.Find;
import com.destiny.service.domain.Meeting;
import com.destiny.service.find.FindDao;

@Repository("findDaoImpl")
public class FindDaoImpl implements FindDao{
	
	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public FindDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public int getUserResult(Find find) throws Exception {
		return sqlSession.selectOne("FindMapper.getUserResult", find);
	}

	@Override
	public List<Meeting> getMeetingResult(String town) throws Exception {
		return sqlSession.selectList("FindMapper.getMeetingResult", town);
	}

	/*@Override
	public int getTotalCount(Find find) throws Exception {
		return sqlSession.selectOne("FindMapper.getTotalCount", find);
	}*/

	/*@Override
	public List<Meeting> getMeetingResultList(Search search) throws Exception {
		return sqlSession.selectList("FindMapper.getMeetingResultList", search);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("FindMapper.getTotalCount", search);
	}*/

}
