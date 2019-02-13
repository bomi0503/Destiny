package com.destiny.service.complain.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.common.Search;
import com.destiny.service.complain.ComplainDao;
import com.destiny.service.complain.ComplainService;
import com.destiny.service.domain.Complain;

@Service("complainServiceImpl")
public class ComplainServiceImpl implements ComplainService{
	
	///Field
	@Autowired
	@Qualifier("complainDaoImpl")
	private ComplainDao complainDao;

	public void setComplainDao(ComplainDao complainDao) {
		this.complainDao = complainDao;
	}

	///Constructor
	public ComplainServiceImpl() {
		System.out.println(this.getClass());
	}

	///Method
	@Override
	public void addComplain(Complain complain) throws Exception {
		complainDao.addComplain(complain);
	}

	@Override
	public Map<String, Object> getComplainList(Search search) throws Exception {
		
		List<Complain> list = complainDao.getComplainList(search);
		int totalCount = complainDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}

	@Override
	public Complain getComplain(int complainNo) throws Exception {
		return complainDao.getComplain(complainNo);
	}

	@Override
	public void updateComplain(Complain complain) throws Exception {
		complainDao.updateComplain(complain);
	}
	
	
}
