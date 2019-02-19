package com.destiny.web.act;

import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.time.Period;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpRequest;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.common.Page;
import com.destiny.common.Search;
import com.destiny.service.Act.ActService;
import com.destiny.service.chatting.ChattingService;
import com.destiny.service.community.CommunityService;
import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Comment;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Meeting;
import com.destiny.service.domain.Upload;
import com.destiny.service.domain.User;
import com.destiny.service.info.InfoService;
import com.destiny.service.meeting.MeetingService;
import com.destiny.service.review.ReviewService;
import com.destiny.service.upload.UploadService;
import com.destiny.service.user.UserService;

@Controller
@RequestMapping("/act/*")
public class ActController {

	//Field
	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("infoServiceImpl")
	private InfoService infoService;
	
	@Autowired
	@Qualifier("reviewServiceImpl")
	private ReviewService reviewService;
	
	@Autowired
	@Qualifier("actServiceImpl")
	private ActService actService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	@Autowired
	@Qualifier("uploadServiceImpl")
	private UploadService uploadService;
	
	public ActController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping(value="getWriteCommunityList/{userId}", method=RequestMethod.GET )
	public ModelAndView getWriteCommunityList(@PathVariable("userId") String userId, @ModelAttribute("search") Search search) throws Exception {
		
		System.out.println("/act/getWriteCommunityList : GET + "+ userId);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = actService.getCommunityListByWriter(search, userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("getTotalCountByWriter")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/writeCommunityList.jsp");
		modelAndView.addObject("list",  map.get("list"));
		modelAndView.addObject("listCommentCount", map.get("listCommentCount"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
	
	@RequestMapping(value="getOpenMeetingList/{userId}", method=RequestMethod.GET)
	public ModelAndView getOpenMeetingList(@PathVariable("userId") String userId, @ModelAttribute("search") Search search) throws Exception {
		
		System.out.println("act/getOpenMeetingList : GET + " + userId);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = actService.getMeetingListByMaster(search, userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCountByMaster")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getOpenMeetingList.jsp");
		modelAndView.addObject("list",  map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
	
	@RequestMapping(value="getCrewList/{meetingNo}", method=RequestMethod.GET)
	public ModelAndView getCrewList(@PathVariable("meetingNo") int meetingNo, HttpServletRequest request) throws Exception {
		System.out.println("act/getCrewList : GET + " + meetingNo);
		
		Meeting meeting = meetingService.getMeeting(meetingNo);
		int limit = meeting.getMeetingCrewLimit();
		
		List<Meeting> list = actService.getCrewAll(meetingNo);
		
		List<Meeting> listAPL = new ArrayList<Meeting>();
		List<User> listAPLUser = new ArrayList<User>();
		List<Meeting> listYES = new ArrayList<Meeting>();
		List<User> listYESUser = new ArrayList<User>();
		
		for(Meeting v : list) {
			if(!v.getRole().equals("MST"))
			{
				if(v.getCrewCondition().equals("APL")) {
					listAPL.add(v);
					listAPLUser.add(userService.getUser(v.getMeetingMasterId()));
				} else if (v.getCrewCondition().equals("YES")) {
					listYES.add(v);
					listYESUser.add(userService.getUser(v.getMeetingMasterId()));
				}
			}
		}
		String reason = "";
		if(request.getAttribute("judgmentApplyReason") != null ) {
			reason = (String) request.getAttribute("judgmentApplyReason");
			request.removeAttribute("judgmentApplyReason");
		}else if(limit == listYES.size()+1) {
			reason = "모집 인원이 마감되었습니다.";
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getCrewList.jsp");
		modelAndView.addObject("listAPL", listAPL);
		modelAndView.addObject("listAPLUser", listAPLUser);
		modelAndView.addObject("listYES", listYES);
		modelAndView.addObject("listYESUser", listYESUser);
		modelAndView.addObject("meetingNo", meetingNo);
		modelAndView.addObject("limit", limit);
		modelAndView.addObject("reason", reason);
		modelAndView.addObject("contextMeeting", meetingService.getMeeting(meetingNo));
		modelAndView.addObject("contextMeetingAct", meetingService.getAct(meetingNo));
		return modelAndView;
	}
	
	@RequestMapping(value="judgmentApply/{judgment}/{meetingNo}/{userId}", method=RequestMethod.GET)
	public ModelAndView judgmentApply(@PathVariable("judgment") String judgment, @PathVariable("meetingNo") int meetingNo, @PathVariable("userId") String userId, HttpServletRequest request) throws Exception{
		
		System.out.println("act/judgmentApply : GET + " + judgment + " + " + meetingNo);
		
		Meeting meeting = new Meeting();
		Meeting contextMeeting = meetingService.getMeeting(meetingNo);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/act/getCrewList/"+meetingNo);
		
		
		
			
		if(judgment.equals("yes")) {
			if(contextMeeting.getMeetingCrewLimit() == meetingService.getCrewCount(meetingNo)) {
				request.setAttribute("judgmentApplyReason", "가입 인원을 초과하셨습니다.");
			} else {
				meeting.setCrewCondition("YES");
				meeting.setMeetingMasterId(userId);
				meeting.setMeetingNo(meetingNo);
				actService.updateCrewCondition(meeting);
			}
		} else if(judgment.equals("no")) {
			actService.delectCrew(userId);
		}
		
		
		
		return modelAndView;
	}
	
	
	@RequestMapping(value="getMeetingAct/{userId}/{meetingNo}", method=RequestMethod.GET)
	public ModelAndView getMeetingAct(@PathVariable("userId") String userId, @PathVariable("meetingNo") int meetingNo, @ModelAttribute("search") Search search) throws Exception{
		
		System.out.println("act/getMeetingAct : GET + " + meetingNo);
		/* =============모임원 Start================================= */
		List<Meeting> listCrew = actService.getCrewAll(meetingNo);
		List<Meeting> listYES = new ArrayList<Meeting>();
		List<User> listYESUser = new ArrayList<User>();
		
		for(Meeting v : listCrew) {
			if(!v.getRole().equals("MST")){
				if (v.getCrewCondition().equals("YES")) {
					listYES.add(v);
					listYESUser.add(userService.getUser(v.getMeetingMasterId()));
				}
			}
		}
		/* =============모임원 End================================= */
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Meeting contextMeeting = meetingService.getMeeting(meetingNo);
		Map<String , Object> map = actService.getMeetingAct(search, meetingNo,userId);
		System.out.println("contextMeeting : " + meetingService.getAct(meetingNo));
		System.out.println("mapppppppppppp2 : " + map.get("list"));
		
		/* ============모임 회차 참여인원 Start===================== */

			List<Meeting>listMeeting = (List<Meeting>)map.get("list");
			List<List> actCrewList = new ArrayList<List>();
			
			if( listMeeting.size() != 0) {
				Meeting meetingAct = listMeeting.get(0);
				System.out.println("모임 회차 참여인원 meetingAct : " + meetingAct);
				
				int meetingActNo = meetingAct.getMeetingActNo();
				int meetingCount = meetingService.getAct(meetingNo).getMeetingActCount();
				System.out.println("meetingCount : " + meetingCount);

				for(int i = 1; i<=meetingCount;i++) {
					
					Meeting meeting = new Meeting();
					meeting.setMeetingActNo(meetingActNo);
					meeting.setMeetingActCount(i);
					
					List<String> listString = actService.getActCrew(meeting);
					List<User> listUser = new ArrayList<User>();
					
					for(String v : listString) {
						listUser.add(userService.getUser(v));
						System.out.println("listUser : " + v  +"=====================");
					}
					
					actCrewList.add(listUser);
					
				}
			}
			
			
		/* ===============모임 회차 참여인원 End=================== */
		
		/* =================차트 Start========================= */
		
		//============================================가입한 회원들의 주요 관심사=============================================
			
		Map<String, Object> meetingCrewMap = meetingService.getCrew(meetingNo);
		List<Meeting> meetingCrew = (List<Meeting>) meetingCrewMap.get("crewList");
		
		int[] personalInterestArray = new int[3];
		User user = new User();
		List<String> personalInterestList = new ArrayList<String>();
		List<String> globalInterestList = new ArrayList<String>();
		
		for(Meeting m : meetingCrew) {
			System.out.println("여기는?");
			user = userService.getUser(m.getMeetingMasterId());
			//meetingCrewUser.add(user);
			
			System.out.println("여긴 오나?");
			
			personalInterestArray[0] = user.getFirstInterest();
			personalInterestArray[1] = user.getSecondInterest();
			personalInterestArray[2] = user.getThirdInterest();
			
			personalInterestList = userService.getInterestByUser(personalInterestArray);
			for(String s : personalInterestList) {
				globalInterestList.add(s);
			}
		}
		
		List<String> interestList = userService.getInterestList();
		
		int[] numOfInterest = new int[19];
		int i = 0;
		
		for(String s : interestList) {
			for(String ss : globalInterestList) {
				if(s.equals(ss)) {
					System.out.println("the globalInterestList element : " + ss);
					numOfInterest[i]++;
				}
			}
			i++;
		}
		
		for(int j = 0; j<=18; j++) {
			System.out.println(interestList.get(j) + " : " + numOfInterest[j]);
		}
		
		int[] fiveTOP = new int[5];
		String[] fiveTOPInerest = new String[5];
		
		int max = 0;
		String maxInterest = "";
		
		int temporarily = 0;
		
		for(int k = 0; k<=4; k++){
			
			for(int j = 0; j<=18; j++) {
				if(numOfInterest[j] > max) {
					max = numOfInterest[j];
					maxInterest = interestList.get(j);
					
					temporarily = j;
				}
			}
			numOfInterest[temporarily] = 0;
			temporarily = 0;
			
			fiveTOP[k] = max;
			fiveTOPInerest[k] = maxInterest;
			
			max= 0;
			maxInterest = "";
		}
		//===================================================================================================
		
		//==========================================모임 성비, 연령대=============================================
		List<User> meetingCrewUser = new ArrayList<User>();
		int femaleNum = 0;
		int maleNum = 0;
		
		int firstGeneration = 0;	//20~24
		int secondGeneration = 0;	//25~29
		int thirdGeneration = 0;	//30~34
		int fourthGeneration = 0;	//35~39
		int fifthGeneration = 0;	//40~
		
		int age = 0;
		
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
		
		for(Meeting m : meetingCrew) {
			user = userService.getUser(m.getMeetingMasterId());
			
			if(user.getGender().equals("M")) {
				maleNum++;
			} else {
				femaleNum++;
			}
			
			LocalDate generation = new Date((user.getBirthday()).getTime()).toLocalDate();
			LocalDate sqlDateLocal = new Date(sqlDate.getTime()).toLocalDate();
			
			Period period = Period.between(generation, sqlDateLocal);
			age = period.getYears() + 2;
			System.out.println("이사람은 몇짤???" + age);
			
			if(19 < age && age <= 24) {
				firstGeneration++;
			} else if(24 < age && age <= 29) {
				secondGeneration++;
			} else if(29 < age && age <= 34) {
				thirdGeneration++;
			} else if(34 < age && age <= 39) {
				fourthGeneration++;
			} else if(39 < age) {
				fifthGeneration++;
			}
		}
		
		
		//===================================================================================================
		
		/* =====================차트 end============================= */
		
		
		
		/*페이지 처리 Start*/
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("getMeetingActCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		/*페이지 처리 End*/
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getMeetingAct.jsp");
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("listYES", listYES);
		modelAndView.addObject("listYESUser", listYESUser);
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("actCrewList",actCrewList);
		modelAndView.addObject("search", search);
		modelAndView.addObject("contextMeeting", contextMeeting);
		modelAndView.addObject("contextMeetingAct", meetingService.getAct(meetingNo));
		
		modelAndView.addObject("fiveTOP", fiveTOP);
		modelAndView.addObject("fiveTOPInerest", fiveTOPInerest);
		modelAndView.addObject("maleNum", maleNum);
		modelAndView.addObject("femaleNum", femaleNum);
		modelAndView.addObject("firstGeneration", firstGeneration);
		modelAndView.addObject("secondGeneration", secondGeneration);
		modelAndView.addObject("thirdGeneration", thirdGeneration);
		modelAndView.addObject("fourthGeneration", fourthGeneration);
		modelAndView.addObject("fifthGeneration", fifthGeneration);
		return modelAndView;
	}
	
	@RequestMapping(value="getActCrew/{meetingActNo}/{meetingActCount}/{meetingNo}", method=RequestMethod.GET)
	public ModelAndView getActCrew(@PathVariable("meetingActNo") int meetingActNo,
									@PathVariable("meetingActCount") int meetingActCount,
									@PathVariable("meetingNo") int meetingNo) throws Exception{
		
		System.out.println("act/getActCrew : GET + "+meetingActNo+" + "+meetingActCount +" + "+ meetingNo);
		
		Meeting meeting = new Meeting();
		meeting.setMeetingActNo(meetingActNo);
		meeting.setMeetingActCount(meetingActCount);
		
		List<String> listString = actService.getActCrew(meeting);
		List<User> list = new ArrayList<User>();
		
		for(String v : listString) {
			list.add(userService.getUser(v));
		}
		
		Meeting contextMeeting = meetingService.getMeeting(meetingNo);

		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getActCrew.jsp");
		modelAndView.addObject("list", list);
		modelAndView.addObject("contextMeeting", contextMeeting);
		return modelAndView;
	}
	
	@RequestMapping(value="getJoinMeetingList/{userId}", method=RequestMethod.GET)
	public ModelAndView getJoinMeetingList(@PathVariable("userId") String userId, @ModelAttribute("search") Search search) throws Exception {
		
		System.out.println("act/getJoinMeetingList : GET + " + userId);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = actService.getMeetingListByApply(search, userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("getTotalCountByApply")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getJoinMeetingList.jsp");
		modelAndView.addObject("list",  map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
	
	@RequestMapping(value="getCommentListByWriter/{userId}", method=RequestMethod.GET)
	public ModelAndView getCommentListByWriter(@PathVariable("userId") String userId, @ModelAttribute("search") Search search) throws Exception {
		
		System.out.println("act/getCommentListByWriter : GET + " + userId);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = actService.getCommentListByWriter(search, userId);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("getTotalCountByCommentSwiter")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		List<String> stringList = new ArrayList<String>();
		List<Comment> list = (List<Comment>)map.get("list");
		
		System.out.println("Comment : " + list +"============================================");
		
		for(Comment comment : list) {
			Community community = communityService.getCommunity(comment.getCommentComuNo());
			String communityTilte = community.getTitle();
			stringList.add(communityTilte);
			System.out.println("stringList : " + communityTilte);
		}
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getWriteCommentList.jsp");
		modelAndView.addObject("list",  map.get("list"));
		modelAndView.addObject("stringList", stringList);
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
	
	@RequestMapping(value="getContactList/{userId}", method=RequestMethod.GET)
	public ModelAndView getContactList(@PathVariable("userId") String userId, @ModelAttribute("search") Search search) throws Exception {
		
		System.out.println("act/getContactList : GET + " + userId);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String , Object> map = actService.getContactList(search, userId);
		
		List<String> fileList = new ArrayList<String>();
		
		for(Chatting  v : (List<Chatting>)map.get("list")) {
			if(v.getManId().equals(userId)) {
				fileList.add(userService.getUser(v.getWomanId()).getProfile());
			} else {
				fileList.add(userService.getUser(v.getManId()).getProfile());
			}
		}
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("getTotalContact")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/getContactList.jsp");
		modelAndView.addObject("list",  map.get("list"));
		modelAndView.addObject("fileList", fileList);
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
	
	@RequestMapping(value="addStoryView/{Category}/{MeetingNo}", method=RequestMethod.GET)
	public ModelAndView addStoryView(@PathVariable("Category") String Category, @PathVariable("MeetingNo") String MeetingNo) throws Exception{
		
		System.out.println(":: Category : "+Category);
	
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userAct/addStory.jsp");
		
		if(Category.equals(""))
		System.out.println(":: MeetingNo : "+MeetingNo );
		modelAndView.addObject("MeetingNo", MeetingNo);
		
		modelAndView.addObject("Category", Category);
		return modelAndView;
	}
	
	/*addRestaurantInfo : start*/
	@RequestMapping(value="addStory/{Category}/{MeetingNo}", method=RequestMethod.POST)
	public ModelAndView addStory(@ModelAttribute("community") Community community, HttpSession session, @PathVariable("Category") String Category, @PathVariable("MeetingNo") String MeetingNo, @RequestParam("uploadFile")MultipartFile fileName, MultipartHttpServletRequest mtfRequest, @ModelAttribute("upload")Upload upload) throws Exception{
		System.out.println(":: ActController/addStory/post : 실행");
		
		System.out.println(":::: MeetingNo : "+MeetingNo);
		
		if(fileName.getOriginalFilename() == "") {
			System.out.println("이미지 없음");
			upload.setFileName("basic.gif");
		}else {
			/*대표이미지 업로드 : start*/
			String path = "C:\\Users\\Bitcamp\\git\\Destiny\\Destiny\\WebContent\\resources\\images\\uploadImg\\";
			String name = System.currentTimeMillis()+"."+fileName.getOriginalFilename().split("\\.")[1];
			
			File file = new File(path + name);

			fileName.transferTo(file);
			/*대표이미지 업로드 : end*/
			
			upload.setFileName(name);
		}
		
		
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		String nickName = user.getNickName();
		String userGrade = user.getUserGrade();
		System.out.println("userId :: " + userId);
		System.out.println("nickName : "+nickName);
		System.out.println("userGrade : "+userGrade);
		
		community.setMeetingNo(Integer.parseInt(MeetingNo));
		community.setWriterId(userId);
		community.setCategory(Category);
		community.setUserGrade(userGrade);
		community.setWriterNickName(nickName);
		community.setViews(0);
		community.setLike(0);
		community.setImportRank("N");
		community.setViewCondition("DEF");
		
		System.out.println(":: ActController/addStory/post의 community : "+community);
		
		ModelAndView modelAndView = new ModelAndView();
		communityService.addMetCommunity(community);
		
		System.out.println("community : "+community);
		/*업로드 테이블 : start*/
		upload.setCommunityNo(community.getCommunityNo());
		/*upload.setFileName(name);*/
		upload.setFileCode("IMG");
		uploadService.addUload(upload);
		System.out.println("upload : "+upload);
		/*업로드 테이블 : end*/
		/*modelAndView.setViewName("/user/userAct/addStoryConfirm.jsp");*/
		modelAndView.setViewName("redirect:/act/getWriteCommunityList/"+userId);
		return modelAndView;
	}
	/*addRestaurantInfo : end*/
	
	@RequestMapping(value="meetingChart/{meetingNo}", method=RequestMethod.GET)
	public ModelAndView meetingChart(@PathVariable("meetingNo") int meetingNo) throws Exception{
		
		System.out.println("act/meetingChart/+"+meetingNo);
		
		Meeting meeting = meetingService.getMeeting(meetingNo);
		
		//============================================가입한 회원들의 주요 관심사=============================================
		Map<String, Object> meetingCrewMap = meetingService.getCrew(meetingNo);
		List<Meeting> meetingCrew = (List<Meeting>) meetingCrewMap.get("crewList");
		
		int[] personalInterestArray = new int[3];
		User user = new User();
		List<String> personalInterestList = new ArrayList<String>();
		List<String> globalInterestList = new ArrayList<String>();
		
		for(Meeting m : meetingCrew) {
			System.out.println("여기는?");
			user = userService.getUser(m.getMeetingMasterId());
			//meetingCrewUser.add(user);
			
			System.out.println("여긴 오나?");
			
			personalInterestArray[0] = user.getFirstInterest();
			personalInterestArray[1] = user.getSecondInterest();
			personalInterestArray[2] = user.getThirdInterest();
			
			personalInterestList = userService.getInterestByUser(personalInterestArray);
			for(String s : personalInterestList) {
				globalInterestList.add(s);
			}
		}
		
		List<String> interestList = userService.getInterestList();
		
		int[] numOfInterest = new int[19];
		int i = 0;
		
		for(String s : interestList) {
			for(String ss: globalInterestList) {
				if(s.equals(ss)) {
					numOfInterest[i]++;
				}
			}
			i++;
		}
		
		for(int j = 0; j<=18; j++) {
			System.out.println(interestList.get(j) + " : " + numOfInterest[j]);
		}
		
		int[] fiveTOP = new int[5];
		String[] fiveTOPInerest = new String[5];
		
		int max = 0;
		String maxInterest = "";
		
		int temporarily = 0;
		
		for(int k = 0; k<=4; k++){
			
			for(int j = 0; j<=18; j++) {
				if(numOfInterest[j] > max) {
					max = numOfInterest[j];
					maxInterest = interestList.get(j);
					
					temporarily = j;
				}
			}
			numOfInterest[temporarily] = 0;
			temporarily = 0;
			
			fiveTOP[k] = max;
			fiveTOPInerest[k] = maxInterest;
			
			max= 0;
			maxInterest = "";
		}
		//===================================================================================================
		
		//==========================================모임 성비, 연령대=============================================
		List<User> meetingCrewUser = new ArrayList<User>();
		int femaleNum = 0;
		int maleNum = 0;
		
		int firstGeneration = 0;	//0~19
		int secondGeneration = 0;	//20~39
		int thirdGeneration = 0;	//40~59
		int fourthGeneration = 0;	//60~79
		int fifthGeneration = 0;	//80~99
		
		int age = 0;
		
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
		
		for(Meeting m : meetingCrew) {
			user = userService.getUser(m.getMeetingMasterId());
			
			if(user.getGender().equals("M")) {
				maleNum++;
			} else {
				femaleNum++;
			}
			
			LocalDate generation = new Date((user.getBirthday()).getTime()).toLocalDate();
			LocalDate sqlDateLocal = new Date(sqlDate.getTime()).toLocalDate();
			
			Period period = Period.between(generation, sqlDateLocal);
			age = period.getYears() + 2;
			System.out.println("이사람은 몇짤???" + age);
			
			if(0 < age && age <= 19) {
				firstGeneration++;
			} else if(19 < age && age <= 39) {
				secondGeneration++;
			} else if(39 < age && age <= 59) {
				thirdGeneration++;
			} else if(59 < age && age <= 79) {
				fourthGeneration++;
			} else if(79 < age && age <= 99) {
				fifthGeneration++;
			}
		}
		
		
		//===================================================================================================
		
		
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("/user/userAct/meetingchart.jsp");
		modelAndView.addObject("Meeting", meeting);
		
		modelAndView.addObject("fiveTOP", fiveTOP);
		modelAndView.addObject("fiveTOPInerest", fiveTOPInerest);
		
		modelAndView.addObject("maleNum", maleNum);
		modelAndView.addObject("femaleNum", femaleNum);
		
		modelAndView.addObject("firstGeneration", firstGeneration);
		modelAndView.addObject("secondGeneration", secondGeneration);
		modelAndView.addObject("thirdGeneration", thirdGeneration);
		modelAndView.addObject("fourthGeneration", fourthGeneration);
		modelAndView.addObject("fifthGeneration", fifthGeneration);
		
		return modelAndView;
	}
	
}
