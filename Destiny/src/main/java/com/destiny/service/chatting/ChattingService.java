package com.destiny.service.chatting;

import java.util.Map;

import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Telepathy;

public interface ChattingService {
	
	public void addRandomChatting(Chatting chatting) throws Exception;
	
	public void addPerfectChatting(Chatting chatting) throws Exception;
	
	public Chatting getChatting(String userId) throws Exception;
	
	public Chatting getChatting2(int roomNo) throws Exception;
	
	public void updateContactMeeting(Chatting chatting) throws Exception;
	
	public Map<String, Object> listTelepathy(int chattingNo) throws Exception;
	
}
