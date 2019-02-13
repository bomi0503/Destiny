package com.destiny.service.find;

import java.util.List;
import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Find;
import com.destiny.service.domain.Meeting;

 
public interface FindService {
	
	//회원 수 찾기
	public int getUserResult(Find find) throws Exception;
	
	//모임찾기
	public List<Meeting> getMeetingResult(String town) throws Exception;

}