package com.destiny.service.community.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.common.Search;
import com.destiny.service.community.CommunityDao;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;

@Repository("communityDaoImpl")
public class CommunityDaoImpl implements CommunityDao{

	///Field
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	///Constructor
	public CommunityDaoImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addCommunity(Community community) throws Exception {
		sqlSession.insert("CommunityMapper.addCommunity", community);
	}

	@Override
	public Community getCommunity(int communityNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getCommunity", communityNo);
	}

	@Override
	public List<Community> getCommunityList(Search search) throws Exception {
		return sqlSession.selectList("CommunityMapper.getCommunityList", search);
	}

	@Override
	public void updateCommunity(Community community) throws Exception {
		sqlSession.update("CommunityMapper.updateCommunity", community);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getTotalCount", search);
	}

	@Override
	public void deleteCommunity(Community community) throws Exception {
		sqlSession.delete("CommunityMapper.deleteCommunity", community);		
	}

	@Override
	public void updateViews(int communityNo) throws Exception {
		sqlSession.update("CommunityMapper.updateViews", communityNo);
		
	}

	@Override
	public void addLikeCommunity(int communityNo) throws Exception {
		sqlSession.update("CommunityMapper.addLikeCommunity", communityNo);
	}
	
	@Override
	public void subLikeCommunity(int communityNo) throws Exception {
		sqlSession.update("CommunityMapper.subLikeCommunity", communityNo);
	}
	
	@Override
	public LikeCount checkId(LikeCount likeCount) throws Exception {
		return sqlSession.selectOne("LikeCountMapper.checkId", likeCount);
	}

	@Override
	public void addLikeCount(LikeCount likeCount) throws Exception {
		sqlSession.insert("LikeCountMapper.addLikeCount", likeCount);
	}

	@Override
	public void updateLikeCount(LikeCount likeCount) throws Exception {
		sqlSession.update("LikeCountMapper.updateLikeCount", likeCount);
	}

	@Override
	public LikeCount getLikeCount(LikeCount likeCount) throws Exception {
		return sqlSession.selectOne("LikeCountMapper.getLikeCount", likeCount);
	}

	@Override
	public void updateViewsCondition(Community community) throws Exception {
		sqlSession.update("CommunityMapper.updateViewsCondition", community);
	}
	
	@Override
	public void updateViewsConditionAdmin(Community community) throws Exception {
		sqlSession.update("CommunityMapper.updateViewsConditionAdmin", community);
	}

	@Override
	public Community getPreCommunity(int communityNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getPreCommunity", communityNo);
	}

	@Override
	public Community getNextCommunity(int communityNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getNextCommunity", communityNo);
	}

	@Override
	public List<Community> getLoveAdviceList(Search search) throws Exception {
		return sqlSession.selectList("CommunityMapper.getLoveAdviceList", search);
	}

	@Override
	public List<Community> getMeetingStoryList(Search search) throws Exception {
		return sqlSession.selectList("CommunityMapper.getMeetingStoryList", search);
	}

	@Override
	public List<Community> getNoticeList(Search search) throws Exception {
		return sqlSession.selectList("CommunityMapper.getNoticeList", search);
	}

	@Override
	public List<Community> getDateStoryList(Search search) throws Exception {
		return sqlSession.selectList("CommunityMapper.getDateStoryList", search);
	}

	@Override
	public Community getNotice(int communityNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getNotice", communityNo);
	}

	@Override
	public int getNoitceTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getNoticeTotalCount", search);
	}

	@Override
	public Community getPreLoveAdvice(int communityNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getPreLoveAdvice", communityNo);
	}

	@Override
	public Community getNextLoveAdvice(int communityNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getNextLoveAdvice", communityNo);
	}

	@Override
	public Community getPreNotice(int communityNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getPreNotice", communityNo);
	}

	@Override
	public Community getNextNotice(int communityNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getNextNotice", communityNo);
	}

	@Override
	public Community getPreMeetingStory(int communityNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getPreMeetingStory", communityNo);
	}

	@Override
	public Community getNextMeetingStory(int communityNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getNextMeetingStory", communityNo);
	}

	@Override
	public Community getPreDateStory(int communityNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getPreDateStory", communityNo);
	}

	@Override
	public Community getNextDateStory(int communityNo) throws Exception {
		return sqlSession.selectOne("CommunityMapper.getNextDateStory", communityNo);
	}

	@Override
	public List<Community> getIndexDateStoryList(Search search) throws Exception {
		return sqlSession.selectList("CommunityMapper.getIndexDateStoryList", search);
	}

	@Override
	public void addMetCommunity(Community community) throws Exception {
		sqlSession.insert("CommunityMapper.addMetCommunity", community);
	}

}
