package com.destiny.service.letter;

import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Letter;

public interface LetterDao {
	public void sendLetter(Letter letter) throws Exception;
	public Letter getLetter(int no) throws Exception;
	
	public Map<String, Object> getLetterList(Search search, String Id) throws Exception;
	
	public int getReceiveLetterTotalCount(String Id) throws Exception;
	public int getSendLetterTotalCount(String Id) throws Exception;
	
	public void updateReceiveDate(int no) throws Exception;
	
	public int getCountNetReadReceive(String Id) throws Exception;
}
