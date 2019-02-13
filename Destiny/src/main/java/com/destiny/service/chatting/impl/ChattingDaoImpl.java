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
		
	}

	@Override
	public void addPerfectChatting(Chatting chatting) throws Exception {
		sqlSession.insert("ChattingMapper.addChatting", chatting);
		
	}
	
	@Override
	public Chatting getChatting(String userId) throws Exception {
		sqlSession.selectOne("ChattingMapper.getChatting", userId);
		return sqlSession.selectOne("ChattingMapper.getChatting", userId);
	}
	
	@Override
	public Chatting getChatting2(int roomNo) throws Exception {
		sqlSession.selectOne("ChattingMapper.getChatting2", roomNo);
		return sqlSession.selectOne("ChattingMapper.getChatting2", roomNo);
	}
	

	@Override
	public List<Chatting> listContactMeeting(Chatting chatting) throws Exception {
		sqlSession.selectList("ChattingMapper.listChatting", chatting);
		return sqlSession.selectList("ChattingMapper.listChatting", chatting);
	}

	@Override
	public String addVoice(String voiceFileName) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String addImage(String imageFileName) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateContactMeeting(Chatting chatting) throws Exception {
		System.out.println("updateContactMeeting : "+chatting);
		sqlSession.update("ChattingMapper.updateContactMeeting",chatting);
		
	}

	@Override
	public List<Telepathy> listTelepathy(int chattingNo) throws Exception {
		
		Map<String , Object>  map = new HashMap<String, Object>();
				
				map.put("chattingNo", chattingNo);
				
				System.out.println("listTelepathy dao map"+map);
				
		return sqlSession.selectList("ChattingMapper.listTelepathy", map);
	}

	@Override
	public int getTotalCount(Chatting chatting) {
		// TODO Auto-generated method stub
		return 0;
	}

	

	@Override
	public String getTelepathyResult(Telepathy telepathy) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	
}
