package com.destiny.service.community;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;

public interface CommunityService {

	//�Խñ� ���
	public void addCommunity(Community community) throws Exception;
	
	//�����ı� �Խñ� ���
	public void addMetCommunity(Community community) throws Exception;
	
	//�Խñ� �󼼺���
	public Community getCommunity(int communityNo) throws Exception;
	
	//�������� �󼼺���
	public Community getNotice(int communityNo) throws Exception;
	
	//������ �󼼺���
	public Community getPreCommunity(int communityNo) throws Exception;
	
	//������ �󼼺���
	public Community getNextCommunity(int communityNo) throws Exception;
	
	//�������� ������ �󼼺���
	public Community getPreLoveAdvice(int communityNo) throws Exception;
		
	//�������� ������ �󼼺���
	public Community getNextLoveAdvice(int communityNo) throws Exception;
	
	//�����ı� ������ �󼼺���
	public Community getPreMeetingStory(int communityNo) throws Exception;
		
	//�����ı� ������ �󼼺���
	public Community getNextMeetingStory(int communityNo) throws Exception;
	
	//�����ı� ������ �󼼺���
	public Community getPreDateStory(int communityNo) throws Exception;
		
	//�����ı� ������ �󼼺���
	public Community getNextDateStory(int communityNo) throws Exception;
	
	//�������� ������ �󼼺���
	public Community getPreNotice(int communityNo) throws Exception;
		
	//�������� ������ �󼼺���
	public Community getNextNotice(int communityNo) throws Exception;
	
	//�������� �Խñ� ����Ʈ
	public Map<String, Object> getCommunityList(Search search) throws Exception;
	
	//�������� �Խñ� ����Ʈ
	public Map<String, Object> getLoveAdviceList(Search search) throws Exception;
	
	//�����ı� �Խñ� ����Ʈ
	public Map<String, Object> getMeetingStoryList(Search search) throws Exception;
	
	//�����ı� �Խñ� ����Ʈ
	public Map<String, Object> getDateStoryList(Search search) throws Exception;
	
	//index.jsp �����ı� �Խñ� ����Ʈ
	public Map<String, Object> getIndexDateStoryList(Search search) throws Exception;
	
	//�������� �Խñ� ����Ʈ
	public Map<String, Object> getNoticeList(Search search) throws Exception;
	
	//�Խñ� ����
	public void updateCommunity(Community community) throws Exception;
	
	//�Խñ� ������ ����
	public void deleteCommunity(Community community) throws Exception;
	
	//�Խù� ��ȸ��
	public void updateViews(int communityNo) throws Exception;
	
	//�Խù� ������
	public void addLikeCommunity(int communityNo) throws Exception;
	
	//�Խù� ������
	public void subLikeCommunity(int communityNo) throws Exception;
	
	//����id üũ
	public  LikeCount checkId(LikeCount likeCount) throws Exception;
	
	//���� ���
	public void addLikeCount(LikeCount likeCount) throws Exception;
	
	//���� ����
	public void updateLikeCount(LikeCount likeCount) throws Exception;

	//���� �󼼺���
	public LikeCount getLikeCount(LikeCount likeCount) throws Exception;
	
	//viewCondition ����
	public void updateViewsCondition(Community community) throws Exception;
	
	//viewCondition ���� (Admin)
	public void updateViewsConditionAdmin(Community community) throws Exception;
}
