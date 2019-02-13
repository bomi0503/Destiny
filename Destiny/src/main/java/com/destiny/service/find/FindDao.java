package com.destiny.service.find;

import java.util.List;
import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Find;
import com.destiny.service.domain.Meeting;
import com.destiny.service.domain.User;

public interface FindDao {
	
	//회원수 찾기
	public int getUserResult(Find find) throws Exception;
	
	//모임리스트 찾기
	public List<Meeting> getMeetingResult(String town) throws Exception;
	
	//모임리스트 찾기
	/*public List<Meeting> getMeetingResultList(Search search) throws Exception;*/
	
	// 게시판 Page 처리를 위한 전체Row(totalCount)  return
	/*public int getTotalCount(Search search) throws Exception ;*/
	
}