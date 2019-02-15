package com.destiny.web.letter;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.common.Page;
import com.destiny.common.Search;
import com.destiny.service.domain.Letter;
import com.destiny.service.domain.User;
import com.destiny.service.letter.LetterService;
import com.destiny.service.user.UserService;

@Controller
@RequestMapping("/letter/*")
public class LetterController {

	//Field
	@Autowired
	@Qualifier("letterServiceImpl")
	private LetterService letterService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	public LetterController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	

	@RequestMapping( value="getLetter", method=RequestMethod.GET)
	public String getLetter( @RequestParam int no, Model model, HttpSession session, @RequestParam String from) throws Exception{
		System.out.println("/user/getLetter : GET");
		
		User receiverUser = (User) session.getAttribute("me");
		Letter letter = letterService.getLetter(no);
		
		//쪽지 수신자가 본인일때만 수신일 업데이트
		if(letter.getReceiverId().equals(receiverUser.getUserId())) {
			letterService.updateReceiveDate(no);
		}

		String letterMetaDataTitle = letter.getLetterDetail();
		//"C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\letterDetail\\";
		File temDirText = new File("C:\\Users\\Bit\\git\\Destiny\\Destiny\\WebContent\\letterDetail\\"+letterMetaDataTitle+".txt");
		
		Scanner scan = new Scanner(temDirText);
		String receiveLetterText = "";
		while(scan.hasNextLine()) {
			receiveLetterText += scan.nextLine() + "\n";
		}
		
		letter.setLetterDetail(receiveLetterText);
		
		System.out.println("완성된 letter : " +letter);
		
		model.addAttribute("letter", letter);
		model.addAttribute("from", from);
		
		
		return "forward:/letter/getletter.jsp";
	}
	
	@RequestMapping( value="sendLetterView/{senderId}", method=RequestMethod.GET)
	public ModelAndView sendLetterView(@PathVariable String senderId)throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/letter/sendletter.jsp");
		modelAndView.addObject("senderId", senderId);
		return modelAndView;
	}
	
	@RequestMapping( value="sendLetter", method=RequestMethod.POST)
	public String sendLetter(@ModelAttribute("letter") Letter letter, HttpSession session, Model model) throws Exception{
		System.out.println("/user/sendLetter : POST");
		System.out.println("찍어보자 레터 : "+letter);
		if(userService.getUser(letter.getReceiverId()) == null) {
			model.addAttribute("reason", "입력한 수신자 아이디가 존재하지 않습니다.");
		} else {
		
			User senderUser = (User) session.getAttribute("me");
			
			letter.setSenderId(senderUser.getUserId());
			
			//=================================user별 letter meta-data생성============================================
			String letterMetaDataTitle = letter.getLetterTitle()+System.currentTimeMillis();
			
			String temDirText = "C:\\Users\\Bit\\git\\Destiny\\Destiny\\WebContent\\letterDetail\\"+letterMetaDataTitle+".txt";
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
			model.addAttribute("reason", "쪽지가 정상적으로 전송되었습니다.");
		}
		/*return "forward:/letter/getlettercomplete.jsp";*/
		return "redirect:/letter/getLetterList";
	}
	
	@RequestMapping( value="getLetterList", method=RequestMethod.GET)
	public String getReceiveLetterList(@ModelAttribute("search") Search search , Model model, HttpSession session) throws Exception{
		System.out.println("/user/getLetterList : GET");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		User user = (User) session.getAttribute("me");
		String Id = user.getUserId();
		
		Map<String , Object> map = letterService.getLetterList(search, Id);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalReceiveCount")).intValue(), pageUnit, pageSize);
		System.out.println("아이시때루 : " + resultPage);
		
		// Model 과 View 연결

		model.addAttribute("listReceive", map.get("listReceive"));

		model.addAttribute("totalReceiveCount", map.get("totalReceiveCount"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		/*return "forward:/letter/getLetterList.jsp";*/
		return "forward:/letter/getLetterList2.jsp";
	}
	
	@RequestMapping( value="sendLetterList", method=RequestMethod.GET)
	public String getSendLetterList(@ModelAttribute("search") Search search , Model model, HttpSession session) throws Exception{
		System.out.println("/user/sendLetterList : GET");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		User user = (User) session.getAttribute("me");
		String Id = user.getUserId();
		
		Map<String , Object> map = letterService.getLetterList(search, Id);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalSendCount")).intValue(), pageUnit, pageSize);
		System.out.println("아이시때루 : " + resultPage);
		
		// Model 과 View 연결
		model.addAttribute("listSend", map.get("listSend"));

		model.addAttribute("totalSendCount", map.get("totalSendCount"));

		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		/*return "forward:/letter/sendLetterList.jsp";*/
		return "forward:/letter/sendLetterList2.jsp";
	}
	
}
