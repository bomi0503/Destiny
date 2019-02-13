package com.destiny.service.find;

import java.util.List;
import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Find;
import com.destiny.service.domain.Meeting;
import com.destiny.service.domain.User;

public interface FindDao {
	
	//ȸ���� ã��
	public int getUserResult(Find find) throws Exception;
	
	//���Ӹ���Ʈ ã��
	public List<Meeting> getMeetingResult(String town) throws Exception;
	
	//���Ӹ���Ʈ ã��
	/*public List<Meeting> getMeetingResultList(Search search) throws Exception;*/
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	/*public int getTotalCount(Search search) throws Exception ;*/
	
}