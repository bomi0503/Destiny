package com.destiny.service.Act;

import java.util.List;

import com.destiny.common.Search;
import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Comment;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Meeting;

//==> 회원관리에서 CRUD 추상화/캡슐화한 DAO Interface Definition
public interface ActDao {
	
	public List<Meeting> getMeetingListByMaster(Search search, String userId) throws Exception;
	
	public int getTotalCountByMaster(String userId) throws Exception;
	
	public List<Meeting> getCrewAll(int meetingNo) throws Exception;
	
	public void updateCrewCondition(Meeting meeting) throws Exception;
	
	public void delectCrew(String userId) throws Exception;
	
	public List<Meeting> getMeetingAct(Search search, int meetingNo, String userId) throws Exception;
	
	public int getMeetingActCount(int meetingNo) throws Exception;
	
	public List<Meeting> getMeetingActAll(int meetingNo) throws Exception;
	
	public List<String> getActCrew(Meeting meeting) throws Exception;
	
	public List<Meeting> getMeetingListByApply(Search search, String userId) throws Exception;
	
	public int getTotalCountByApply(String userId) throws Exception;
	
	public List<Community> getCommunityListByWriter(Search search, String userId) throws Exception;
	
	public int getTotalCountByWriter(String userId) throws Exception;
	
	public List<Comment> getCommentListByWriter(Search search, String userId) throws Exception;
	
	public int getTotalCountByCommentSwiter(String userId) throws Exception;
	
	public List<Chatting> getContactList(Search search, String userId) throws Exception;
	
	public int getTotalContact(String userId) throws Exception;
	
	public int getCommunityComentCount(int communityNo) throws Exception;
	
}