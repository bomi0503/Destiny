package com.destiny.service.chatting.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import com.destiny.service.chatting.ChattingDao;
import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Telepathy;

@Repository("chattingDaoImpl")
public class ChattingDaoImpl implements ChattingDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	public ChattingDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addRandomChatting(Chatting chatting) throws Exception {
		sqlSession.insert("ChattingMapper.addChatting", chatting);
		System.out.println("ChattingDaoImpl.addRandomChatting() : "+chatting);
	}

	@Override
	public void addPerfectChatting(Chatting chatting) throws Exception {
		sqlSession.insert("ChattingMapper.addChatting", chatting);
		System.out.println("ChattingDaoImpl.addPerfectChatting() : "+chatting);
	}
	
	@Override
	public Chatting getChatting(String userId) throws Exception {
		sqlSession.selectOne("ChattingMapper.getChatting", userId);
		System.out.println("ChattingDaoImpl.getChatting() : "+sqlSession.selectOne("ChattingMapper.getChatting", userId));
		return sqlSession.selectOne("ChattingMapper.getChatting", userId);
	}
	
	@Override
	public Chatting getChatting2(int roomNo) throws Exception {
		sqlSession.selectOne("ChattingMapper.getChatting2", roomNo);
		System.out.println("ChattingDaoImpl.getChatting2() : "+sqlSession.selectOne("ChattingMapper.getChatting2", roomNo));
		return sqlSession.selectOne("ChattingMapper.getChatting2", roomNo);
	}
	

	@Override
	public void updateContactMeeting(Chatting chatting) throws Exception {
		System.out.println("ChattingDaoImpl.updateContactMeeting() : "+chatting);
		
		sqlSession.update("ChattingMapper.updateContactMeeting",chatting);
		
	}

	@Override
	public List<Telepathy> listTelepathy(int chattingNo) throws Exception {
		
		Map<String , Object>  map = new HashMap<String, Object>();
		map.put("chattingNo", chattingNo);
		System.out.println("listTelepathy dao map"+map);
		
		System.out.println("ChattingDaoImpl.listTelepathy() : "+sqlSession.selectList("ChattingMapper.listTelepathy", map));
		return sqlSession.selectList("ChattingMapper.listTelepathy", map);
	}	
	
}
