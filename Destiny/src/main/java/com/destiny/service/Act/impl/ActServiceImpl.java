package com.destiny.service.Act.impl;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;


import com.destiny.service.user.UserDao;
import com.destiny.common.Search;
import com.destiny.service.Act.ActDao;
import com.destiny.service.Act.ActService;
import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Comment;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Meeting;


@Service("actServiceImpl")
public class ActServiceImpl implements ActService {

	@Autowired
	@Qualifier("actDaoImpl")
	private ActDao actDao;

	public void setUserDao(ActDao actDao) {
		this.actDao = actDao;
	}
	
	public ActServiceImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public Map<String, Object> getMeetingListByMaster(Search search, String userId) throws Exception {
		List<Meeting> list = actDao.getMeetingListByMaster(search, userId);
		System.out.println("ServiceImpl 에서의 list : " + list);
		
		int totalCountByMaster = actDao.getTotalCountByMaster(userId);
		System.out.println("ServiceImpl 에서의 totalCountByMaster : " + totalCountByMaster);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCountByMaster", totalCountByMaster);
		
		return map;
	}
	

	@Override
	public List<Meeting> getCrewAll(int meetingNo) throws Exception {
		List<Meeting> list = actDao.getCrewAll(meetingNo);
		System.out.println("ServiceImpl 에서의 list : " + list);
		
		return list;
	}

	@Override
	public void updateCrewCondition(Meeting meeting) throws Exception {
		actDao.updateCrewCondition(meeting);
	}

	@Override
	public void delectCrew(String userId) throws Exception {
		actDao.delectCrew(userId);
	}
	
	@Override
	public Map<String, Object> getMeetingAct(Search search, int meetingNo,String userId) throws Exception {
		List<Meeting> list = actDao.getMeetingAct(search, meetingNo, userId);
		System.out.println("ServiceImpl 에서의 list : " + list);
		
		int getMeetingActCount = actDao.getMeetingActCount(meetingNo);
		System.out.println("getMeetingActCount : " + getMeetingActCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("getMeetingActCount", getMeetingActCount);
		return map;
	}
	
	@Override
	public Map<String, Object> getMeetingActAll(int meetingNo) throws Exception {
		List<Meeting> list = actDao.getMeetingActAll(meetingNo);
		System.out.println("ServiceImpl 에서의 list : " + list);
		
		int getMeetingActCount = actDao.getMeetingActCount(meetingNo);
		System.out.println("getMeetingActCount : " + getMeetingActCount);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("getMeetingActCount", getMeetingActCount);
		
		return map;
	}

	@Override
	public List<String> getActCrew(Meeting meeting) throws Exception {
		return actDao.getActCrew(meeting);
	}

	@Override
	public Map<String, Object> getMeetingListByApply(Search search, String userId) throws Exception {
		List<Meeting> list = actDao.getMeetingListByApply(search, userId);
		System.out.println("ServiceImpl 에서의 list : " + list);
		
		int getTotalCountByApply = actDao.getTotalCountByApply(userId);
		System.out.println("ServiceImpl 에서의 getTotalCountByApply : " + getTotalCountByApply);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("getTotalCountByApply", getTotalCountByApply);
		
		return map;
	}

	@Override
	public Map<String, Object> getCommunityListByWriter(Search search, String userId) throws Exception {
		List<Community> list = actDao.getCommunityListByWriter(search, userId);
		System.out.println("ServiceImpl 에서의 list : " + list);
		
		int[] listCommentCount = new int[list.size()];
		
		for(int i = 0; i < list.size(); i++) {
			listCommentCount[i] = actDao.getCommunityComentCount(list.get(i).getCommunityNo());
		}
		
		int getTotalCountByWriter = actDao.getTotalCountByWriter(userId);
		System.out.println("ServiceImpl 에서의 getTotalCountByWriter : " + getTotalCountByWriter);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("listCommentCount", listCommentCount);
		map.put("getTotalCountByWriter", getTotalCountByWriter);
		
		return map;
	}

	@Override
	public Map<String, Object> getCommentListByWriter(Search search, String userId) throws Exception {
		List<Comment> list = actDao.getCommentListByWriter(search, userId);
		System.out.println("ServiceImpl 에서의 list : " + list);
		
		int getTotalCountByCommentSwiter = actDao.getTotalCountByCommentSwiter(userId);
		System.out.println("ServiceImpl 에서의 getTotalCountByCommentSwiter : " + getTotalCountByCommentSwiter);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("getTotalCountByCommentSwiter", getTotalCountByCommentSwiter);
		
		return map;
	}

	@Override
	public Map<String, Object> getContactList(Search search, String userId) throws Exception {
		List<Chatting> list = actDao.getContactList(search, userId);
		System.out.println("ServiceImpl 에서의 list : " + list);
		
		int getTotalContact = actDao.getTotalContact(userId);
		System.out.println("ServiceImpl 에서의 getTotalContact : " + getTotalContact);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("getTotalContact", getTotalContact);
		
		return map;
	}

	@Override
	public int getCommunityComentCount(int communityNo) throws Exception {
		return actDao.getCommunityComentCount(communityNo);
	}
	
	
	
	

}
