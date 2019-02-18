package com.destiny.service.community;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;

public interface CommunityService {

	//게시글 등록
	public void addCommunity(Community community) throws Exception;
	
	//모임후기 게시글 등록
	public void addMetCommunity(Community community) throws Exception;
	
	//게시글 상세보기
	public Community getCommunity(int communityNo) throws Exception;
	
	//공지사항 상세보기
	public Community getNotice(int communityNo) throws Exception;
	
	//이전글 상세보기
	public Community getPreCommunity(int communityNo) throws Exception;
	
	//다음글 상세보기
	public Community getNextCommunity(int communityNo) throws Exception;
	
	//연애조언 이전글 상세보기
	public Community getPreLoveAdvice(int communityNo) throws Exception;
		
	//연애조언 다음글 상세보기
	public Community getNextLoveAdvice(int communityNo) throws Exception;
	
	//모임후기 이전글 상세보기
	public Community getPreMeetingStory(int communityNo) throws Exception;
		
	//모임후기 다음글 상세보기
	public Community getNextMeetingStory(int communityNo) throws Exception;
	
	//만남후기 이전글 상세보기
	public Community getPreDateStory(int communityNo) throws Exception;
		
	//만남후기 다음글 상세보기
	public Community getNextDateStory(int communityNo) throws Exception;
	
	//공지사항 이전글 상세보기
	public Community getPreNotice(int communityNo) throws Exception;
		
	//공지사항 다음글 상세보기
	public Community getNextNotice(int communityNo) throws Exception;
	
	//맛집정보 게시글 리스트
	public Map<String, Object> getCommunityList(Search search) throws Exception;
	
	//연애조언 게시글 리스트
	public Map<String, Object> getLoveAdviceList(Search search) throws Exception;
	
	//모임후기 게시글 리스트
	public Map<String, Object> getMeetingStoryList(Search search) throws Exception;
	
	//만남후기 게시글 리스트
	public Map<String, Object> getDateStoryList(Search search) throws Exception;
	
	//index.jsp 만남후기 게시글 리스트
	public Map<String, Object> getIndexDateStoryList(Search search) throws Exception;
	
	//공지사항 게시글 리스트
	public Map<String, Object> getNoticeList(Search search) throws Exception;
	
	//게시글 수정
	public void updateCommunity(Community community) throws Exception;
	
	//게시글 삭제로 변경
	public void deleteCommunity(Community community) throws Exception;
	
	//게시물 조회수
	public void updateViews(int communityNo) throws Exception;
	
	//게시물 공감수
	public void addLikeCommunity(int communityNo) throws Exception;
	
	//게시물 공감수
	public void subLikeCommunity(int communityNo) throws Exception;
	
	//공감id 체크
	public  LikeCount checkId(LikeCount likeCount) throws Exception;
	
	//공감 등록
	public void addLikeCount(LikeCount likeCount) throws Exception;
	
	//공감 수정
	public void updateLikeCount(LikeCount likeCount) throws Exception;

	//공감 상세보기
	public LikeCount getLikeCount(LikeCount likeCount) throws Exception;
	
	//viewCondition 수정
	public void updateViewsCondition(Community community) throws Exception;
	
	//viewCondition 수정 (Admin)
	public void updateViewsConditionAdmin(Community community) throws Exception;
}
