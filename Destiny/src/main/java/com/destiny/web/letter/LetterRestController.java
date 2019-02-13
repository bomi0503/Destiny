package com.destiny.web.letter;

import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.destiny.common.Page;
import com.destiny.common.Search;
import com.destiny.service.domain.Letter;
import com.destiny.service.domain.User;
import com.destiny.service.letter.LetterService;
import com.destiny.service.user.UserService;

@RestController
@RequestMapping("/letter/")
public class LetterRestController {
	
	@Autowired
	@Qualifier("letterServiceImpl")
	private LetterService letterService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public LetterRestController() {
	}
	
	@RequestMapping(value="getLetterByAndroid/{letterNo}/{userId}", method=RequestMethod.GET)
	public Letter getLetter(@PathVariable("letterNo") int letterNo, @PathVariable("userId") String userId) throws Exception{
		System.out.println("letter/getLetterByAndroid/"+letterNo);
		
		User receiverUser = userService.getUser(userId);
		
		Letter letter = letterService.getLetter(letterNo);
		if(letter.getReceiverId().equals(receiverUser.getUserId())) {
			letterService.updateReceiveDate(letterNo);
		}
		
		String letterMetaDataTitle = letter.getLetterDetail();
		//"C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\letterDetail\\";
		File temDirText = new File("C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\letterDetail\\"+letterMetaDataTitle+".txt");
		
		Scanner scan = new Scanner(temDirText);
		String receiveLetterText = "";
		while(scan.hasNextLine()) {
			receiveLetterText += scan.nextLine() + "\n";
		}
		
		letter.setLetterDetail(receiveLetterText);
		
		System.out.println("완성된 letter : " +letter);
		
		return letter;
	}
	
	@RequestMapping(value="getLetterListByAndroid/{currentPage}/{userId}", method=RequestMethod.GET)
	public List<Letter> getLetterListByAndroid(@PathVariable("currentPage") int currentPage, 
												@PathVariable("userId") String userId,
												HttpSession session) throws Exception{
		System.out.println("letter/getLetterListByAndroid/"+currentPage);
		
		Search search = new Search();
		
		if(currentPage == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(currentPage);
		}
		
		search.setPageSize(pageSize);
		
		
		
		System.out.println(":: search : "+search);
		
		Map<String, Object> map = letterService.getLetterList(search, userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalReceiveCount")).intValue(), pageUnit, pageSize);
		System.out.println("아이시때루 : " + resultPage);
		
		List<Letter> list = (List<Letter>)map.get("listReceive");
		
		return list;
	}
	
	@RequestMapping(value="sendLetterListByAndroid/{currentPage}/{userId}", method=RequestMethod.GET)
	public List<Letter> sendLetterListByAndroid(@PathVariable("currentPage") int currentPage, 
												HttpSession session, 
												@PathVariable("userId") String userId) throws Exception{
		System.out.println("letter/sendLetterListByAndroid/"+currentPage);
		
		Search search = new Search();
		
		if(currentPage == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(currentPage);
		}
		
		search.setPageSize(pageSize);
		
		
		
		System.out.println(":: search : "+search);
		
		Map<String, Object> map = letterService.getLetterList(search, userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalSendCount")).intValue(), pageUnit, pageSize);
		System.out.println("아이시때루 : " + resultPage);
		
		List<Letter> list = (List<Letter>)map.get("listSend");
		
		return list;
	}
	
	
}
