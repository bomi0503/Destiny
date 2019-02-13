package com.destiny.service.find.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.common.Search;
import com.destiny.service.domain.Find;
import com.destiny.service.domain.Meeting;
import com.destiny.service.find.FindDao;
import com.destiny.service.find.FindService;

@Service("findServiceImpl")
public class FindServiceImpl implements FindService {
	
	///Field
	@Autowired
	@Qualifier("findDaoImpl")
	private FindDao findDao;
	public void setFindeDao(FindDao findDao) {
		this.findDao = findDao;
	}
	
	public FindServiceImpl() {
		System.out.println(this.getClass());
	}
	
	@Override
	public int getUserResult(Find find) throws Exception {
		return findDao.getUserResult(find);
	}

	@Override
	public List<Meeting> getMeetingResult(String town) throws Exception {
		List<Meeting> list = findDao.getMeetingResult(town);
		
		//Map<String, Object> map = new HashMap<String, Object>();
		//map.put("list", list );
		
		return list;
	}

	/*@Override
	public Map<String, Object> getMeetingResultList(Search search) throws Exception {
		List<Meeting> list = findDao.getMeetingResultList(search);
		int totalCount = findDao.getTotalCount(search);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("totalCount", new Integer(totalCount));
		
		return map;
	}*/

}
