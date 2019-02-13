package com.destiny.service.letter.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.common.Search;
import com.destiny.service.domain.Letter;
import com.destiny.service.letter.LetterDao;

@Repository("letterDaoImpl")
public class LetterDaoImpl implements LetterDao{
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	public LetterDaoImpl() {
		System.out.println(this.getClass());
	}
	
	public void sendLetter(Letter letter) throws Exception{
		sqlSession.insert("LetterMapper.sendLetter", letter);
	}
	
	public Letter getLetter(int no) throws Exception{
		return sqlSession.selectOne("LetterMapper.getLetter", no);
	}
	
	public void updateReceiveDate(int no) throws Exception{
		sqlSession.update("LetterMapper.updateReceiveDate", no);
	}
	
	public Map<String, Object> getLetterList(Search search, String Id) throws Exception{
		Map<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("Id", Id);
		inputMap.put("search", search);
		
		List<Letter> listReceive = sqlSession.selectList("LetterMapper.getReceiveLetterList", inputMap);
		List<Letter> listSend = sqlSession.selectList("LetterMapper.getSendLetterList", inputMap);
		
		Map<String, Object> getMap = new HashMap<String, Object>();
		
		getMap.put("listReceive", listReceive);
		getMap.put("listSend", listSend);
		
		System.out.println("dao에서 전달된 값들 : " + Id + search);
		System.out.println("dao에 매핑된 값 : " + inputMap);
		System.out.println("dao에서 확보한 map : " + getMap);
		
		return getMap;
	}
	
	public int getReceiveLetterTotalCount(String Id) throws Exception{
		return sqlSession.selectOne("LetterMapper.getReceiveLetterTotalCount", Id);
	}
	
	public int getSendLetterTotalCount(String Id) throws Exception{
		return sqlSession.selectOne("LetterMapper.getSendLetterTotalCount", Id);
	}

	@Override
	public int getCountNetReadReceive(String Id) throws Exception {
		return sqlSession.selectOne("LetterMapper.getCountNetReadReceive", Id);
	}
	
	
}
