package com.destiny.service.letter.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.destiny.common.Search;
import com.destiny.service.domain.Letter;
import com.destiny.service.letter.LetterDao;
import com.destiny.service.letter.LetterService;

@Service("letterServiceImpl")
public class LetterServiceImpl implements LetterService{
	@Autowired
	@Qualifier("letterDaoImpl")
	private LetterDao letterDao;

	public void setLetterDao(LetterDao letterDao) {
		this.letterDao = letterDao;
	}
	
	public LetterServiceImpl() {
		System.out.println(this.getClass());
	}
	
	///Method
		public void sendLetter(Letter letter) throws Exception{
			letterDao.sendLetter(letter);
		}
		
		public Letter getLetter(int no) throws Exception{
			return letterDao.getLetter(no);
		}
		
		@Override
		public Map<String, Object> getLetterList(Search search, String Id) throws Exception {
			Map<String, Object> map = letterDao.getLetterList(search, Id);
			
			
			System.out.println("ServiceImpl ¿¡¼­ÀÇ map : " + map);
			
			int totalReceiveCount = letterDao.getReceiveLetterTotalCount(Id);
			int totalSendCount = letterDao.getSendLetterTotalCount(Id);
			
			//Map<String, Object> map = new HashMap<String, Object>();
			//map.put("list", list );
			
			map.put("totalReceiveCount", new Integer(totalReceiveCount));
			map.put("totalSendCount", new Integer(totalSendCount));
			
			return map;
		}

		@Override
		public void updateReceiveDate(int no) throws Exception {
			letterDao.updateReceiveDate(no);
		}

		@Override
		public int getCountNetReadReceive(String Id) throws Exception {
			return letterDao.getCountNetReadReceive(Id);
		}
		
		
}
