package com.destiny.service.info.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.service.info.InfoDao;
import com.destiny.service.info.InfoService;

@Service("infoServiceImpl")
public class InfoServiceImpl implements InfoService{
	
	@Autowired
	@Qualifier("infoDaoImpl")
	private InfoDao infoDao;

	public void setInfoDao(InfoDao infoDao) {
		this.infoDao = infoDao;
	}
	
	public InfoServiceImpl() {
		System.out.println(this.getClass());
	}
}
