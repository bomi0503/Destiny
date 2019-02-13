package com.destiny.web.find;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.service.domain.Find;
import com.destiny.service.domain.Meeting;
import com.destiny.service.domain.User;
import com.destiny.service.find.FindService;

@Controller
@RequestMapping("/find/*")
public class FindController {
	
	///Field
		@Autowired
		@Qualifier("findServiceImpl")
		private FindService findService;
		
		///Constructor
		public FindController() {
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		int pageSize;
		
		///Method
		@RequestMapping(value="mainFind", method=RequestMethod.GET)
		public ModelAndView mainFind() throws Exception{
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("redirect:/find/mainFind.jsp");
			return modelAndView;
		}
		
		@RequestMapping(value="selectUser", method=RequestMethod.GET)
		public ModelAndView selectUser() throws Exception{
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("redirect:/find/selectUser.jsp");
			return modelAndView;
		}
		
		@RequestMapping(value="getUserResult", method=RequestMethod.POST)
		public ModelAndView getUserResult(@ModelAttribute("find") Find find, HttpServletRequest request) throws Exception{
			System.out.println("/find/getUserResult : POST");
			System.out.println("FIND : "+ find +"======================");
			
			System.out.println("?!?! : " + find.getSelectInterest());
			
			find.setSelectInterest01(find.getSelectInterest().split(",")[0]);
			find.setSelectInterest02(find.getSelectInterest().split(",")[1]);
			find.setSelectInterest03(find.getSelectInterest().split(",")[2]);
			
			System.out.println("first : " +find.getSelectInterest01());
			System.out.println("second : " + find.getSelectInterest02());
			System.out.println("third : " + find.getSelectInterest03());
			
			//////////////// ���� ������ �� �߰� ���� ��////////////////////////////////////////////////////////////////
			ServletContext applicationScope = request.getSession().getServletContext();
			
			List<User> loginList = new ArrayList<User>();
			
			if(applicationScope.getAttribute("loginList") != null) {
				loginList = (List<User>) applicationScope.getAttribute("loginList");
			}
			
			int numberOfLogin = 0;
			
			if(applicationScope.getAttribute("numberOfLogin") != null) {
				numberOfLogin = (int) applicationScope.getAttribute("numberOfLogin");
			}
			
			System.out.println("���� ������" + numberOfLogin);
			/////////////////////////////////////////////////////////////////////////////////////////////////////
			
			int totalCount = findService.getUserResult(find);
			
			System.out.println("FindMapper.getUserResult ���ٿ� / totalCount: " + totalCount);
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("totalCount",totalCount);
			modelAndView.addObject("numberOfLogin",numberOfLogin);
			modelAndView.setViewName("forward:/find/getUserResult.jsp");
			return modelAndView;
		}
		
		@RequestMapping(value="selectMeeting", method=RequestMethod.GET)
		public ModelAndView selectMeeting() throws Exception{
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.setViewName("redirect:/find/selectMeeting.jsp");
			return modelAndView;
		}
				
		@RequestMapping(value="getMeetingResult", method=RequestMethod.POST)
		public ModelAndView getMeetingResult(@RequestParam("town") String town) throws Exception{
			System.out.println("/find/getMeetingResult : POST");
			System.out.println("FIND : "+ town +"======================");
			
			List<Meeting> list = findService.getMeetingResult(town);

			ModelAndView modelAndView = new ModelAndView();
			//modelAndView.addObject("list",map.get("list"));
			modelAndView.addObject("list",list);
			modelAndView.setViewName("forward:/find/getMeetingResult.jsp");
			
			return modelAndView;
		}

}
