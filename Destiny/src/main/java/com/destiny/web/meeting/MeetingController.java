package com.destiny.web.meeting;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.destiny.common.Search;
import com.destiny.service.domain.Meeting;
import com.destiny.service.domain.User;
import com.destiny.service.meeting.MeetingService;
import com.destiny.common.Page;

@Controller
@RequestMapping("/meeting/*")
public class MeetingController {
	
	///Field
	
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	///Constructor
	public MeetingController() {
		System.out.println(this.getClass());
	}
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	
	///Method
	@RequestMapping(value="listMeeting" )
	public ModelAndView listMeeting(Model model) throws Exception{
		
		System.out.println("하이rpt리스트");
		
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());

		
		System.out.println(sqlDate);
		
		//System.out.println(search.getSearchCondition());
		Search search = new Search();
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		Map<String , Object> map = meetingService.getMeetingList(search);
		Map<String , Object> interestmap = meetingService.getInterestList();
		Map<String , Object> todayTogeterMap = meetingService.todayTogeterMeeting(sqlDate.toString());
		Map<String , Object> whatsHotMap = meetingService.hotMeeting();
		
		System.out.println("투데이 가따옴");
		System.out.println(todayTogeterMap);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("토탈 카운트는??"+((Integer)map.get("totalCount")).intValue());
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("interlist", interestmap.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("todaylist", todayTogeterMap.get("todaylist"));
		model.addAttribute("hotlist", whatsHotMap.get("hotlist"));
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/meeting/getMeetingList.jsp");
		return modelAndView;
		
	}
	
	@RequestMapping(value="listMeeting/{meetingCenter}", method=RequestMethod.POST)
	public ModelAndView listMeeting(Model model, @PathVariable("meetingCenter") String meetingCenter,
			@ModelAttribute("search") Search search) throws Exception{

		System.out.println("하이리스트");
		System.out.println(search);
		System.out.println(meetingCenter);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		if(meetingCenter !=null) {
			if(search.getSearchCondition()=="시/군/구 선택" || meetingCenter.length()==2) {
				System.out.println("시군구 선택");
				search.setSearchCondition("");
			}else {
				System.out.println("시군구 아님아님아님");
				search.setSearchCondition(meetingCenter);
			}
		}
		
		Map<String , Object> interestmap=meetingService.getInterestList();
		Map<String , Object> map=meetingService.getMeetingList(search);
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("토탈 카운트는??"+((Integer)map.get("totalCount")).intValue());
		model.addAttribute("list", map.get("list"));
		model.addAttribute("interlist", interestmap.get("list"));
		model.addAttribute("resultPage", resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/meeting/getMeetingList.jsp");
		return modelAndView;
		
	}
	
	@RequestMapping(value="addMeeting", method=RequestMethod.GET)
	public ModelAndView addMeetingView(Model model,@ModelAttribute("meeting") Meeting meeting) throws Exception{
		//단순 페이지 이동
		System.out.println("개설하기");
		
		//Map<String , Object> map=meetingService.getInterestList();
		
		//model.addAttribute("list", map.get("list"));
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/meeting/addMeeting.jsp");
		
		System.out.println("끝");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addMeeting", method=RequestMethod.POST)
	public ModelAndView addMeeting(@ModelAttribute("meeting") Meeting meeting, HttpSession session) throws Exception{
		System.out.println("하이에드포스트");
		//개설하기 페이지에서 개설하기 하면 오는곳
		
		meeting.setMeetingMasterId(((User)session.getAttribute("me")).getUserId());
		
		meetingService.addMeeting(meeting);
		meetingService.addAct(meeting);
		meetingService.addCrewList(meeting);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/meeting/waiting.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="getMeeting", method=RequestMethod.GET)
	public ModelAndView getMeeting(Model model, @RequestParam("meetingNo") int meetingNo) throws Exception{
		System.out.println("하이 겟 미팅");
		System.out.println(meetingNo);
		
		Map<String , Object> map=meetingService.getInterestList();
		model.addAttribute("list", map.get("list"));
		
		Meeting meeting = meetingService.getMeeting(meetingNo);
		System.out.println("모임정원???"+meeting.getMeetingCrewLimit());
		meetingService.updateViews(meetingNo);
		Meeting meetingAct = meetingService.getAct(meetingNo);
		int crewCount = meetingService.getCrewCount(meetingNo);
		Map<String , Object> crewMap=meetingService.getCrew(meetingNo);
		Map<String , Object> postMap=meetingService.getMeetingPost(meetingNo);
		
		model.addAttribute("meeting", meeting);
		model.addAttribute("meetingAct", meetingAct);
		model.addAttribute("crewCount", crewCount);
		model.addAttribute("crewList", crewMap.get("crewList"));
		model.addAttribute("postList", postMap.get("postList"));
		//System.out.println(crewMap.get("crewList"));
		//System.out.println("이러나ㅣㅇ러ㅣ만어라ㅣㄴ얼민ㄹㅇ"+crewMap.get("crewList"));
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/meeting/getMeeting.jsp");
		return modelAndView;
//		return null;
	}
	
	@RequestMapping(value="updateMeeting", method=RequestMethod.POST)
	public ModelAndView updateMeeting(@ModelAttribute("meeting") Meeting meeting,HttpServletRequest request) throws Exception{
		System.out.println("하이 업데이트 업데이트 업데이트 ");
		
		ModelAndView modelAndView = new ModelAndView();
		String Referer = request.getHeader("referer");
	
		String referer = Referer.split("8080/")[1];
		System.out.println("refere ==="+Referer);
		System.out.println("이것은 자른것"+referer);
		
		//String name = "";
		/*if(meeting.getImgFile().getOriginalFilename() == "") {
			System.out.println("파일업로드 안함");
			meeting.setTitleImg(meetingService.getMeeting(meeting.getMeetingNo()).getTitleImg()); 
			return null;
		}*/
		
		//Meeting meeting = new Meeting();
		System.out.println("미팅컨디션은"+meeting.getMeetingCondition());
		//System.out.println(meeting.getMeetingNo());
		//Meeting meeting = meetingService.getMeeting(meetingNo);
		
		if(meeting.getMeetingCondition()!="DEF" && meeting.getMeetingCondition()!=null) {
			System.out.println("def가 아니다");
			//개시물 삭제 플래그 처리 
			meetingService.updateMeeting(meeting);
			modelAndView.setViewName("redirect:/meeting/listMeeting");
		}else {
			//개시물 내용 수정
			meetingService.updateContentsMeeting(meeting);
			meetingService.updateContentsAct(meeting);
			modelAndView.setViewName("redirect:/"+referer);
		}
		
		
		//model.addAttribute("meeting", meeting);
		
		
		//modelAndView.setViewName("redirect:/index.jsp");
		//modelAndView.setViewName("redirect:/"+referer);
		return modelAndView;
		//return null;
	}
}
