package com.destiny.service.community.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.common.Search;
import com.destiny.service.community.CommunityDao;
import com.destiny.service.community.CommunityService;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;

@Service("communityServiceImpl")
public class CommunityServiceImpl implements CommunityService {

	///Field
	@Autowired
	@Qualifier("communityDaoImpl")
	private CommunityDao communityDao;
	public void setCommunityDao(CommunityDao communityDao) {
		this.communityDao = communityDao;
	}
	
	///Constructor
	public CommunityServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addCommunity(Community community) throws Exception {
		communityDao.addCommunity(community);
	}

	@Override
	public Community getCommunity(int communityNo) throws Exception {
		return communityDao.getCommunity(communityNo);
	}

	@Override
	public Map<String, Object> getCommunityList(Search search) throws Exception {
		
		List<Community> list = communityDao.getCommunityList(search);
		int totalCount = communityDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public void updateCommunity(Community community) throws Exception {
		communityDao.updateCommunity(community);
	}

	@Override
	public void deleteCommunity(Community community) throws Exception {
		communityDao.deleteCommunity(community);		
	}

	@Override
	public void updateViews(int communityNo) throws Exception {
		communityDao.updateViews(communityNo);		
	}

	@Override
	public void addLikeCommunity(int communityNo) throws Exception {
		communityDao.addLikeCommunity(communityNo);
	}
	
	@Override
	public void subLikeCommunity(int communityNo) throws Exception {
		communityDao.subLikeCommunity(communityNo);
	}
	
	@Override
	public LikeCount checkId(LikeCount likeCount) throws Exception {
		return communityDao.checkId(likeCount);
	}

	@Override
	public void addLikeCount(LikeCount likeCount) throws Exception {
		communityDao.addLikeCount(likeCount);
	}

	@Override
	public void updateLikeCount(LikeCount likeCount) throws Exception {
		communityDao.updateLikeCount(likeCount);
	}

	@Override
	public LikeCount getLikeCount(LikeCount likeCount) throws Exception {
		return communityDao.getLikeCount(likeCount);
	}

	@Override
	public void updateViewsCondition(Community community) throws Exception {
		communityDao.updateViewsCondition(community);
	}
	
	@Override
	public void updateViewsConditionAdmin(Community community) throws Exception {
		communityDao.updateViewsConditionAdmin(community);
	}

	@Override
	public Community getPreCommunity(int communityNo) throws Exception {
		return communityDao.getPreCommunity(communityNo);
	}

	@Override
	public Community getNextCommunity(int communityNo) throws Exception {
		return communityDao.getNextCommunity(communityNo);
	}

	@Override
	public Map<String, Object> getLoveAdviceList(Search search) throws Exception {
		List<Community> list = communityDao.getLoveAdviceList(search);
		int totalCount = communityDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Map<String, Object> getMeetingStoryList(Search search) throws Exception {
		List<Community> list = communityDao.getMeetingStoryList(search);
		int totalCount = communityDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Map<String, Object> getDateStoryList(Search search) throws Exception {
		List<Community> list = communityDao.getDateStoryList(search);
		int totalCount = communityDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Map<String, Object> getIndexDateStoryList(Search search) throws Exception {
		List<Community> list = communityDao.getIndexDateStoryList(search);
		int totalCount = communityDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}	

	@Override
	public Map<String, Object> getNoticeList(Search search) throws Exception {
		List<Community> list = communityDao.getNoticeList(search);
		int totalCount = communityDao.getNoitceTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Community getNotice(int communityNo) throws Exception {
		return communityDao.getNotice(communityNo);
	}

	@Override
	public Community getPreLoveAdvice(int communityNo) throws Exception {
		return communityDao.getPreLoveAdvice(communityNo);
	}

	@Override
	public Community getNextLoveAdvice(int communityNo) throws Exception {
		return communityDao.getNextLoveAdvice(communityNo);
	}

	@Override
	public Community getPreNotice(int communityNo) throws Exception {
		return communityDao.getPreNotice(communityNo);
	}

	@Override
	public Community getNextNotice(int communityNo) throws Exception {
		return communityDao.getNextNotice(communityNo);
	}

	@Override
	public Community getPreMeetingStory(int communityNo) throws Exception {
		return communityDao.getPreMeetingStory(communityNo);
	}

	@Override
	public Community getNextMeetingStory(int communityNo) throws Exception {
		return communityDao.getNextMeetingStory(communityNo);
	}

	@Override
	public Community getPreDateStory(int communityNo) throws Exception {
		return communityDao.getPreDateStory(communityNo);
	}

	@Override
	public Community getNextDateStory(int communityNo) throws Exception {
		return communityDao.getNextDateStory(communityNo);
	}

}
