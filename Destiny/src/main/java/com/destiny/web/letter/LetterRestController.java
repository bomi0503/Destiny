package com.destiny.web.letter;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.destiny.common.Page;
import com.destiny.common.Search;
import com.destiny.service.domain.Letter;
import com.destiny.service.domain.User;
import com.destiny.service.letter.LetterService;
import com.destiny.service.user.UserService;

@Controller
@RequestMapping("/letterRest/*")
public class LetterRestController {
	//Field
		@Autowired
		@Qualifier("letterServiceImpl")
		private LetterService letterService;
		
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		
		public LetterRestController() {
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
		@Value("#{commonProperties['pageSize']}")
		int pageSize;
		
		@RequestMapping( value="letterRest/sendLetter", method=RequestMethod.POST)
		public int sendLetter(@RequestBody Letter letter, HttpSession session, Model model) throws Exception{
			
			System.out.println("/userRest/sendLetter : POST");
			System.out.println("찍어보자 레터 : "+letter);
			int result = 0;
			if(userService.getUser(letter.getReceiverId()) == null) {
				//result ="입력한 수신자 아이디가 존재하지 않습니다.";
				result = 2;
			} else {
			
				User senderUser = (User) session.getAttribute("me");
				
				letter.setSenderId(senderUser.getUserId());
				
				//=================================user별 letter meta-data생성============================================
				String letterMetaDataTitle = letter.getLetterTitle()+System.currentTimeMillis();
				
				String temDirText = "C:\\Users\\Bitcamp\\git\\Destiny02\\Destiny\\WebContent\\letterDetail\\"+letterMetaDataTitle+".txt";
				File sendLetter = new File(temDirText);
				
				//FileWriter fw = new FileWriter(detailProduct, true);
				BufferedWriter fw = new BufferedWriter(new FileWriter(sendLetter, true));
				fw.write(letter.getLetterDetail());
				fw.flush();
				fw.close();
				
				letter.setLetterDetail(letterMetaDataTitle);
				//===================================================================================================
				
				System.out.println(letter);
				
				//==============================================DB 운용===============================================
				letterService.sendLetter(letter);
				//===================================================================================================
				//model.addAttribute("reason", "쪽지가 정상적으로 전송되었습니다.");
				result = 1;	}
			
			return result;
		}
		

		@RequestMapping(value="sendLetterByAndroid", method=RequestMethod.POST)
		public String sendLetter(@RequestBody Letter letter) throws Exception{
			System.out.println("/letter/sendLetterByAndroid : POST");
			System.out.println("찍어보자 레터 : "+letter);
			
			
				User senderUser = userService.getUser(letter.getSenderId());
				
				letter.setSenderId(senderUser.getUserId());
				
				//=================================user별 letter meta-data생성============================================
				String letterMetaDataTitle = letter.getLetterTitle()+System.currentTimeMillis();
				
				String temDirText = "C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\letterDetail\\"+letterMetaDataTitle+".txt";
				File sendLetter = new File(temDirText);
				
				//FileWriter fw = new FileWriter(detailProduct, true);
				BufferedWriter fw = new BufferedWriter(new FileWriter(sendLetter, true));
				fw.write(letter.getLetterDetail());
				fw.flush();
				fw.close();
				
				letter.setLetterDetail(letterMetaDataTitle);
				//===================================================================================================
				
				System.out.println(letter);
				
				//==============================================DB 운용===============================================
				letterService.sendLetter(letter);
				//===================================================================================================
				
			
			return "complete!";
		}
		
		@RequestMapping(value="getLetterByAndroid/{letterNo}/{userId}", method=RequestMethod.GET)
		public Letter getLetter(@PathVariable("letterNo") int letterNo, @PathVariable("userId") String userId) throws Exception{
			System.out.println("letter/getLetterByAndroid/"+letterNo+"/"+userId);
			
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
		public Map<String, Object> getLetterListByAndroid(@PathVariable("currentPage") int currentPage, 
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
			
			return map;
		}
		
		@RequestMapping(value="sendLetterListByAndroid/{currentPage}/{userId}", method=RequestMethod.GET)
		public Map<String, Object> sendLetterListByAndroid(@PathVariable("currentPage") int currentPage, 
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
			
			return map;
		}
		
}
