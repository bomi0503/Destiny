package com.destiny.service.push.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.service.push.PushDao;
import com.destiny.service.push.PushService;

@Service("pushServiceImpl")
public class PushServiceImpl implements PushService{
	@Autowired
	@Qualifier("pushDaoImpl")
	private PushDao pushDao;

	public void setPushDao(PushDao pushDao) {
		this.pushDao = pushDao;
	}
	
	public PushServiceImpl() {
		System.out.println(this.getClass());
	}
}
