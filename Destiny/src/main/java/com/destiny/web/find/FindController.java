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

import oracle.jdbc.util.Login;

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
			
			//////////////// 현재 접속자 수 추가 진행 중////////////////////////////////////////////////////////////////
			ServletContext applicationScope = request.getSession().getServletContext();
			
			List<User> loginList = new ArrayList<User>();
			
			if(applicationScope.getAttribute("loginList") != null) {
				loginList = (List<User>) applicationScope.getAttribute("loginList");
				System.out.println("loginList : " + loginList);
			}
			String checkGender = find.getSelectGender();
			String checkAge = find.getSelectAge();
			String checkTown = find.getTown();
			String check01 = find.getSelectInterest01();
			String check02 = find.getSelectInterest02();
			String check03 = find.getSelectInterest03();
			System.out.println("선택값 : " + checkGender +" ,"+checkAge+" ,"+checkTown+", "+check01+" ,"+check02+" ,"+check03);

			List<User> checkUser = new ArrayList<User>();
			
			int loginUser = 0; /* 회원찾기 현재 로그인 접속 회원 수*/
			
			for(int i=0; i<loginList.size(); i++) {
				String checkInterest01 = loginList.get(i).getFirstInterest()+"";
				String checkInterest02 = loginList.get(i).getSecondInterest()+"";
				String checkInterest03= loginList.get(i).getThirdInterest()+"";
				//address에서 town찾기
				String checkAddress = loginList.get(i).getAddress();
				checkAddress = checkAddress.split(" ")[1];

				if(loginList.get(i).getGender().equals(checkGender) && checkAddress.equals(checkTown) &&checkInterest01.equals(check01) &&checkInterest02.equals(check02) &&checkInterest03.equals(check03) ) {
					checkUser.add(loginList.get(i));
					System.out.println("checkUser : " + checkUser);
					System.out.println("checkUser 명:  " + checkUser.size());
				}
				
				loginUser = checkUser.size();
				
			}
			
			int numberOfLogin = 0;
			
			if(applicationScope.getAttribute("numberOfLogin") != null) {
				numberOfLogin = (int) applicationScope.getAttribute("numberOfLogin");
			}
			
			System.out.println("현재 접속자" + numberOfLogin);
			/////////////////////////////////////////////////////////////////////////////////////////////////////
			
			int totalCount = findService.getUserResult(find);
			
			System.out.println("FindMapper.getUserResult 갔다옴 / totalCount: " + totalCount);
			
			ModelAndView modelAndView = new ModelAndView();
			modelAndView.addObject("totalCount",totalCount);
			modelAndView.addObject("numberOfLogin",numberOfLogin);
			modelAndView.addObject("loginUser",loginUser);
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
			
			List<String> placeList = new ArrayList<String>();
			
			for(int i=0; i<list.size() ; i++) {
				
				/*System.out.println("list [ "+i+" ] : " + list.get(i).getMeetingLocation());*/
				String place = list.get(i).getMeetingLocation();
				String newPlace = "";
				
				if(place.length() >10) {
					
					System.out.println("장소 : " + place);
					
					newPlace = place.substring(0,15)+"....";
					
					System.out.println("newPlace : " + newPlace);
					
				}else {
					newPlace = place;
					System.out.println("newPlace작은거 : " + newPlace);
				}
				placeList.add((String)newPlace);
				System.out.println("======================== placeList : " + placeList);
			}

			
			
			ModelAndView modelAndView = new ModelAndView();
			//modelAndView.addObject("list",map.get("list"));
			modelAndView.addObject("list",list);
			modelAndView.addObject("placeList",placeList);
			modelAndView.setViewName("forward:/find/getMeetingResult.jsp");
			
			return modelAndView;
		}

}
