package com.destiny.service.chatting;

import java.util.List;
import java.util.Map;

import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Telepathy;

public interface ChattingDao {
	
	public void addRandomChatting(Chatting chatting) throws Exception;
	
	public void addPerfectChatting(Chatting chatting) throws Exception;
	
	public Chatting getChatting(String userId) throws Exception;
	
	public Chatting getChatting2(int roomNo) throws Exception;
	
	public List<Chatting> listContactMeeting(Chatting chatting) throws Exception;
	
	public void updateContactMeeting(Chatting chatting) throws Exception;
	
	public List<Telepathy> listTelepathy(int chattingNo) throws Exception;
	
}
