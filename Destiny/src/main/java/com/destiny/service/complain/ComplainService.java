package com.destiny.service.complain;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Complain;

public interface ComplainService {
	
	//�Խñ� ���
	public void addComplain(Complain complain) throws Exception;
	
	public Map<String, Object> getComplainList(Search search) throws Exception;
	
	//�Խñ� �󼼺���
	public Complain getComplain(int complainNo) throws Exception;
	
	//�Խñ� ����
	public void updateComplain(Complain complain) throws Exception;

}
