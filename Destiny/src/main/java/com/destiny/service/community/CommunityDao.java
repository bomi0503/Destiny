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
	
	//맛집정보 list
	public List<Community> getCommunityList(Search search) throws Exception;
	
	//연애조언 게시글 리스트
	public List<Community> getLoveAdviceList(Search search) throws Exception;
	
	//연애조언 게시글 리스트
	public List<Community> getMeetingStoryList(Search search) throws Exception;
	
	//만남후기 게시글 리스트
	public List<Community> getDateStoryList(Search search) throws Exception;
	
	//index.jsp 만남후기 게시글 리스트
	public List<Community> getIndexDateStoryList(Search search) throws Exception;
	
	//공지사항 게시글 리스트
	public List<Community> getNoticeList(Search search) throws Exception;
	
	//update
	public void updateCommunity(Community community) throws Exception;
	
	//delete
	public void deleteCommunity(Community community) throws Exception;
	
	//게시판 page 처리를 위한 전체 row(totalCount) return
	public int getTotalCount(Search search) throws Exception;
	
	//공지사항게시판 page 처리를 위한 전체 row(totalCount) return
	public int getNoitceTotalCount(Search search) throws Exception;
	
	//조회수
	public void updateViews(int communityNo)throws Exception;
	
	//공감수(+1)
	public void addLikeCommunity(int communityNo)throws Exception;
	
	//공감수(-1)
	public void subLikeCommunity(int communityNo)throws Exception;
	
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
