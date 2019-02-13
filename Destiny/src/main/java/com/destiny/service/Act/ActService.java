package com.destiny.service.Act;

import java.util.List;
import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Meeting;

//==> ȸ���������� ������ ���� �߻�ȭ/ĸ��ȭ�� Service  Interface Definition  
public interface ActService {
	
	public Map<String, Object> getMeetingListByMaster(Search search, String userId) throws Exception;
	
	public List<Meeting> getCrewAll(int meetingNo) throws Exception;
	
	public void updateCrewCondition(Meeting meeting) throws Exception;
	
	public void delectCrew(String userId) throws Exception;
	
	public Map<String, Object> getMeetingAct(Search search, int meetingNo, String userId) throws Exception;
	
	public Map<String, Object> getMeetingActAll(int meetingNo) throws Exception;
	
	public List<String> getActCrew(Meeting meeting) throws Exception;
	
	public Map<String, Object> getMeetingListByApply(Search search, String userId) throws Exception;
	
	public Map<String, Object> getCommunityListByWriter(Search search, String userId) throws Exception;
	
	public Map<String, Object> getCommentListByWriter(Search search, String userId) throws Exception;
	
	public Map<String, Object> getContactList(Search search, String userId) throws Exception;
	
	public int getCommunityComentCount(int communityNo) throws Exception;
}