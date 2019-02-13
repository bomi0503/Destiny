package com.destiny.service.chatting.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.service.chatting.ChattingDao;
import com.destiny.service.chatting.ChattingService;
import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Telepathy;


@Service("chattingServiceImpl")
public class ChattingServiceImpl implements ChattingService {
	@Autowired
	@Qualifier("chattingDaoImpl")
	private ChattingDao chattingDao;
	
	public void setChattingtDao(ChattingDao chattingDao) {
		this.chattingDao = chattingDao;
	}	
	
	public ChattingServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addRandomChatting(Chatting chatting) throws Exception {
		chattingDao.addRandomChatting(chatting);
		System.out.println("addRandomChatting");
	}

	@Override
	public void addPerfectChatting(Chatting chatting) throws Exception {
		chattingDao.addPerfectChatting(chatting);
		System.out.println("addPerfectChatting");
		
	}
	
	@Override
	public Chatting getChatting(String userId) throws Exception {
		chattingDao.getChatting(userId);
		System.out.println("getChatting");
		return chattingDao.getChatting(userId);
	}
	
	@Override
	public Chatting getChatting2(int roomNo) throws Exception {
		chattingDao.getChatting2(roomNo);
		System.out.println("getChatting2");
		return chattingDao.getChatting2(roomNo);
	}


	@Override
	public Map<String, Object> listContactMeeting(Chatting chatting) throws Exception {
		List<Chatting> list = chattingDao.listContactMeeting(chatting);
		int totalCount = chattingDao.getTotalCount(chatting);
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		System.out.println("listContactMeeting : "+chattingDao.listContactMeeting(chatting));
		return map;
	}

	@Override
	public String addVoice(String voiceFileName) throws Exception {
		chattingDao.addVoice(voiceFileName);
		return null;
	}

	@Override
	public String addImage(String imageFileName) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateContactMeeting(Chatting chatting) throws Exception {
		chattingDao.updateContactMeeting(chatting);
		System.out.println("updateContactMeeting");
	}

	@Override
	public Map<String, Object> listTelepathy(int chattingNo) throws Exception {
		List<Telepathy> list = chattingDao.listTelepathy(chattingNo);
		
		Map<String, Object> map= new HashMap<String, Object>();
		map.put("list", list);
		map.put("roomNo", chattingNo);
		System.out.println("listTelepathy : "+list);
		return map;
	}

	
	@Override
	public String getTelepathyResult(Telepathy telepathy) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
}
