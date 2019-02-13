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
	
	@RequestMapping(value="telepathyTest/{roomNo}", method=RequestMethod.GET)
	public ModelAndView telepathyTest(@PathVariable int roomNo,HttpSession session, HttpServletRequest request) throws Exception{
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
	
	@RequestMapping(value="telepathyResult", method=RequestMethod.POST)
	public ModelAndView telepathyResult(HttpSession session, HttpServletRequest request) throws Exception{
			System.out.println("telepathyResult����");
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
	
	@RequestMapping(value="addRandomChatting", method=RequestMethod.GET)
	public ModelAndView addRandomChatting(HttpSession session) throws Exception{
		System.out.println("addRandomChatting����");
		//telepathy ���� ��Ȱ� user�θ��� ���̵� ���� ������. ä�ù� ����
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/chatting/getRandomChatting.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addRandomChatting", method=RequestMethod.POST, consumes = "application/json")
	public ModelAndView addRandomChattingPost(HttpSession session, @RequestBody String body) throws Exception{
		
		//telepathy ���� ��Ȱ� user�θ��� ���̵� ���� ������. ä�ù� ����
		System.out.println("node"+body);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/chatting/getRandomChatting.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addPerfectChatting", method=RequestMethod.GET)
	public ModelAndView addPerfectChatting(HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("addPerfectChatting ����");
		
		//===========================================���� ������ ���� ���� part=================================================
		
		//ä�ù� ����
		Chatting chatting=new Chatting();
		
		ServletContext applicationScope = request.getSession().getServletContext();
		if(applicationScope.getAttribute("womanList") != null) {
			womanList = (List<User>) applicationScope.getAttribute("womanList");
		}
		if(applicationScope.getAttribute("manList") != null) {
			manList = (List<User>) applicationScope.getAttribute("manList");
		}
		User user=(User)session.getAttribute("me");
		String userId=user.getUserId();
		System.out.println("user"+user);
		ModelAndView modelAndView = new ModelAndView();
		////user���α��� �� ���
		if (user.getUserId()!=null) {
			////���̵�� user������ �����´�.
			User dbUser=userService.getUser(user.getUserId());
			
		
			
			//////////////////////////////
			////�̻��� ��Ī
			//////////////////////////////
			String man=null;
			String woman=null;
			int roomNo=0;
			System.out.println("manList.size() : "+manList.size()+"womanList.size() : "+womanList.size());
			System.out.println("manList : "+manList+"womanList : "+womanList);
		
			//�����Ī////////////////////////
//			
					if(manList.size()>0 && womanList.size()>0) {
						////////��Ī�� ���̵� 2�� �ֱ�
					
						try{ 
							System.out.println("manList==womanList");
							woman=womanList.get(0).getUserId();
							man=manList.get(0).getUserId();
							//addChatting
							System.out.println("man  : "+man+"  woman : "+woman);
							chatting.setManId(man);
							chatting.setWomanId(woman);
							chatting.setContactMeeting("N");
							
							chattingService.addPerfectChatting(chatting);
							
							//getChatting NO
							Chatting resultChatting=chattingService.getChatting(userId);
							//roomName�� ChattingNo�� ����
							roomNo=resultChatting.getChattingNo();
							System.out.println("resultChatting : "+resultChatting);
							System.out.println("roomNo : "+roomNo);
							
							modelAndView.setViewName("/chatting/getPerfectChatting.jsp");
							modelAndView.addObject("result", "Success");
							modelAndView.addObject("womanId", woman);
							modelAndView.addObject("manId", man);
							modelAndView.addObject("roomNo", roomNo);
							womanList.remove(0);
							manList.remove(0);
							
					     } catch (Exception e){
					      e.printStackTrace();
					      
					     }
					
				
					
				
			}
			
			
			////////////////////////
			

				
			
			
			
							
		}else { 
			////�α��� ���� ���� ���
			System.out.println("�α��� ����");
			modelAndView.setViewName("index.jsp");
		}
		
		
		
		//====================================================================================================
		
		// user�� ���̵��ʿ� ������ ��������, �̻��� ������ ���� ��Ī
		
		
		return modelAndView;
	}
	
	@RequestMapping(value="getPerfectChatting/{roomNo}", method=RequestMethod.GET)
	public ModelAndView getPerfectChatting(@PathVariable int roomNo,HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("getPerfectChatting ����");
		ModelAndView modelAndView = new ModelAndView();
		
		//getChatting NO
		Chatting resultChatting=chattingService.getChatting2(roomNo);
		//roomName�� ChattingNo�� ����
		String man=null;
		String woman=null;
		man=resultChatting.getManId();
		woman=resultChatting.getWomanId();
		
		System.out.println("resultChatting : "+resultChatting);
		System.out.println("roomNo : "+roomNo);
		
		modelAndView.setViewName("chatting/getPerfectChatting.jsp");
		modelAndView.addObject("result", "Success");
		modelAndView.addObject("womanId", woman);
		modelAndView.addObject("manId", man);
		modelAndView.addObject("roomNo", roomNo);
		return modelAndView;
	}
	
	@RequestMapping(value="endChatting", method=RequestMethod.GET)
	public ModelAndView endChatting(@PathVariable int roomNo,HttpSession session,HttpServletRequest request) throws Exception{
		System.out.println("endChatting ����");
		ModelAndView modelAndView = new ModelAndView();
		Chatting emptyChatting=new Chatting();
		session.setAttribute("chatting", emptyChatting);
		modelAndView.addObject("ä�ù� ����");
		return modelAndView;
	}
	
	
}
