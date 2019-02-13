package com.destiny.service.complain;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Complain;

public interface ComplainService {
	
	//게시글 등록
	public void addComplain(Complain complain) throws Exception;
	
	public Map<String, Object> getComplainList(Search search) throws Exception;
	
	//게시글 상세보기
	public Complain getComplain(int complainNo) throws Exception;
	
	//게시글 수정
	public void updateComplain(Complain complain) throws Exception;

}
