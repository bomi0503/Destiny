package com.destiny.service.complain;

import java.util.List;

import com.destiny.common.Search;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Complain;

public interface ComplainDao {
	
	//insert
	public void addComplain(Complain complain) throws Exception;
	
	//select list
	public List<Complain> getComplainList(Search search) throws Exception;
	
	//�Խ��� page ó���� ���� ��ü row(totalCount) return
	public int getTotalCount(Search search) throws Exception;
	
	//select one
	public Complain getComplain(int complainNo) throws Exception;
	
	//update
	public void updateComplain(Complain complain) throws Exception;

}
