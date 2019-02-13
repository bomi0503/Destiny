package com.destiny.service.community;

import java.util.List;
import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;

public interface CommunityDao {
	
	//insert
	public void addCommunity(Community community) throws Exception;
	
	//select one
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
	
	//�������� list
	public List<Community> getCommunityList(Search search) throws Exception;
	
	//�������� �Խñ� ����Ʈ
	public List<Community> getLoveAdviceList(Search search) throws Exception;
	
	//�������� �Խñ� ����Ʈ
	public List<Community> getMeetingStoryList(Search search) throws Exception;
	
	//�����ı� �Խñ� ����Ʈ
	public List<Community> getDateStoryList(Search search) throws Exception;
	
	//index.jsp �����ı� �Խñ� ����Ʈ
	public List<Community> getIndexDateStoryList(Search search) throws Exception;
	
	//�������� �Խñ� ����Ʈ
	public List<Community> getNoticeList(Search search) throws Exception;
	
	//update
	public void updateCommunity(Community community) throws Exception;
	
	//delete
	public void deleteCommunity(Community community) throws Exception;
	
	//�Խ��� page ó���� ���� ��ü row(totalCount) return
	public int getTotalCount(Search search) throws Exception;
	
	//�������װԽ��� page ó���� ���� ��ü row(totalCount) return
	public int getNoitceTotalCount(Search search) throws Exception;
	
	//��ȸ��
	public void updateViews(int communityNo)throws Exception;
	
	//������(+1)
	public void addLikeCommunity(int communityNo)throws Exception;
	
	//������(-1)
	public void subLikeCommunity(int communityNo)throws Exception;
	
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
