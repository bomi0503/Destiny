package com.destiny.web.chatting;

import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.service.chatting.ChattingService;
import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Telepathy;
import com.destiny.service.domain.User;
import com.destiny.service.user.UserService;

@Controller
@RequestMapping("/chatting/*")
public class ChattingController {
	
	///Field
	
	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
////���� ����Ʈ�� ���� ����Ʈ�� ���� ��ü ����
	private List<User> womanList = new ArrayList<User>();
	private List<User> manList = new ArrayList<User>();
	private List<Telepathy> telepathyList=new  ArrayList<Telepathy>();

	///Constructor
	public ChattingController() {
		System.out.println(this.getClass());
	}
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	
	///Method
	
	@RequestMapping(value="mainChatting", method=RequestMethod.GET)
	public ModelAndView mainChatting() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/chatting/mainChatting.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getTelepathyTest/{roomNo}", method=RequestMethod.GET)
	public ModelAndView getTelepathyTest(@PathVariable int roomNo,HttpSession session, HttpServletRequest request) throws Exception{
			System.out.println("telepathyTest����");
		
			//===========================================���� ������ ���� ���� part=================================================
				
			//getChatting NO
			Chatting resultChatting=chattingService.getChatting2(roomNo);
			//roomName�� ChattingNo�� ����
			String man=null;
			String woman=null;
			man=resultChatting.getManId();
			woman=resultChatting.getWomanId();
			
			System.out.println("resultChatting : "+resultChatting);
			System.out.println("roomNo : "+roomNo);
			
			
			/////////////////////////////////////////
			//�̽����ɹ���	
			String a="";
			String telepathyQ=a+roomNo;//roomNo=chattingNo
			ServletContext applicationScope = request.getSession().getServletContext();
			System.out.println("telepathyQ : "+telepathyQ);
			if(applicationScope.getAttribute(telepathyQ) == null) {
				
				Map<String, Object> map=chattingService.listTelepathy(roomNo);
				telepathyList=(List<Telepathy>)map.get("list");
				System.out.println("�̽����� ���� ���� : "+telepathyList);
				applicationScope.setAttribute(telepathyQ, telepathyList);
				
			}else {
				telepathyList=(List<Telepathy>)applicationScope.getAttribute(telepathyQ);
				System.out.println("�̽����� ���� get : "+telepathyList);
			}
			
			
			
			System.out.println("telepathyList : "+telepathyList);
			/////////////////////////////////////
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("/chatting/getTelepathyTest.jsp");
			modelAndView.addObject("result", "Success");
			modelAndView.addObject("womanId", woman);
			modelAndView.addObject("manId", man);
			modelAndView.addObject("chattingNo", roomNo);
		
			modelAndView.addObject("telepathyList", telepathyList);
			
			/////���� chatting�濡 �������� ����� ���� ������ ���;� ��
			
				
				
				
					
				
				
				
				//====================================================================================================
				
		//��Ī(Ŭ���� ����� �� ���� �Ѹ� ����) �� telepathy�� navigation ����3���� user�θ��� ���̵� ���� ������.
		//getTelepathy()
		
		
		
		return modelAndView;
	}
	
	@RequestMapping(value="getRandomChatting", method=RequestMethod.POST)
	public ModelAndView getRandomChatting(HttpSession session, HttpServletRequest request) throws Exception{
			System.out.println("getRandomChatting����");
			ServletContext applicationScope = request.getSession().getServletContext();
			ModelAndView modelAndView = new ModelAndView();
			User user=(User)session.getAttribute("me");
			String userId=user.getUserId();
			String roomNo=(String)request.getParameter("roomNo");
			telepathyList=(List<Telepathy>)applicationScope.getAttribute(roomNo);
			
			System.out.println(telepathyList);
			
			System.out.println("one ����");
			String one=(String)request.getParameter("1");
			String two=(String)request.getParameter("2");
			String three=(String)request.getParameter("3");
			List<String[]> tResult=new ArrayList<String[]>();
			System.out.println("one ����"+one+"two"+two+"three"+three);
			if (one.equals("1")||one.equals(null)||one=="") {
				one=telepathyList.get(0).getExOne();
			}else {
				one=telepathyList.get(0).getExTwo();
			}
			if (two.equals("1")||two.equals(null)||two=="") {
				two=telepathyList.get(1).getExOne();
			}else {
				two=telepathyList.get(1).getExTwo();
			}
			if (three.equals("1")||three.equals(null)||three=="") {
				three=telepathyList.get(2).getExOne();
			}else {
				three=telepathyList.get(2).getExTwo();
			}
			 Map<String, Object> result= new HashMap<String, Object>();
			 
			 System.out.println(result);
			if (user.getGender().equals("W")) {
				
				
				telepathyList.get(0).setWomanTelepathyResult(one);
				telepathyList.get(1).setWomanTelepathyResult(two);
				telepathyList.get(2).setWomanTelepathyResult(three);
				
				
			}else {
				
			
				telepathyList.get(0).setManTelepathyResult(one);
				telepathyList.get(1).setManTelepathyResult(two);
				telepathyList.get(2).setManTelepathyResult(three);
				
			}
			
			System.out.println("roomNo : "+roomNo);
			System.out.println("telepathyList : "+telepathyList);
			System.out.println("one : "+one);
			System.out.println("two : "+two);
			System.out.println("three : "+three);
			System.out.println("tResult : "+tResult.toString());

			modelAndView.setViewName("/chatting/getRandomChatting.jsp");
			modelAndView.addObject("result", "Success");
			modelAndView.addObject("one", one);
			modelAndView.addObject("two", two);
			modelAndView.addObject("three", three);
			modelAndView.addObject("telepathyList", telepathyList);
		return modelAndView;
	}
	
	@RequestMapping(value="getPerfectChatting", method=RequestMethod.GET)
	public ModelAndView getPerfectChatting() throws Exception{
		System.out.println("getPerfectChatting ����");
		ModelAndView modelAndView = new ModelAndView();
		
		
		
		modelAndView.setViewName("/chatting/getPerfectChatting.jsp");
		
		return modelAndView;
	}
	
	
	
	
}
