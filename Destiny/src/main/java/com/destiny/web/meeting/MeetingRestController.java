package com.destiny.web.meeting;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.destiny.common.Coolsms;
import com.destiny.common.Page;
import com.destiny.common.Search;
import com.destiny.service.domain.Meeting;
import com.destiny.service.domain.User;
import com.destiny.service.meeting.MeetingService;
import com.destiny.service.user.UserService;
import com.destiny.common.Page;
import com.destiny.common.Search;

@RestController
@RequestMapping("/meetingRest/*")
public class MeetingRestController {
	
	///Field
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	public MeetingRestController(){
		
		System.out.println(this.getClass());
		
	}
	
	@RequestMapping( value="meetingRest/addCrewM", method=RequestMethod.POST)
	public int addCrewM(@RequestBody Meeting meeting)throws Exception{
		System.out.println("시작함");
		boolean flag = false;
		
		if(flag==false){
			int result = meetingService.checkDuplicationCrew(meeting);
			System.out.println(result);
			if(result==0) {
				flag=true;
				System.out.println(result);
			}
			
		}
		System.out.println(flag);
		
		if(flag==true) {
			User user =userService.getUser(meeting.getMeetingMasterId());
			
			System.out.println("유저내용을 가져와랏!!"+user);
			meeting.setMasterProfileImg(user.getProfile());
			meeting.setCrewNickName(user.getNickName());
			
			int susses= meetingService.addCrewM(meeting);
			//System.out.println("미팅내용 가져와랏"+meeting);
			
			//================================================SMS로 가입신청 전송==============================================
			Meeting contextMeeting = meetingService.getMeeting(meeting.getMeetingNo());
			
			//모임장 획득. 
			Map<String, Object> reMap = meetingService.getCrew(meeting.getMeetingNo());
			List<Meeting> crewList = (List<Meeting>)reMap.get("crewList");
			User masterUser = new User();
			for(Meeting m : crewList) {
				if(m.getRole().equals("MST")) {
					masterUser = userService.getUser(m.getMeetingMasterId());
				}
			}
			
			//모임장의 폰 번호로 가입신청자 전송
			String phone = masterUser.getPhone();
					
			System.out.println("SMS part 진입 완료. 받은 모임장 phone 번호 : " +  phone);
			
			String api_key = "NCSVNPXGDXR313KS";
			String api_secret = "J7K4C3WVID3LHZ4YUR6USDB9VBF8WMMU";
			Coolsms coolsms = new Coolsms(api_key, api_secret);
			
			//String key = RandomNum();
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			//map.put("to", phone);
			map.put("to", "01086032406");
			map.put("from", "01086032406");
			map.put("text", "[우연] 모임 : [" + contextMeeting.getMeetingName() + "] \n가입신청자 : [" + user.getUserId() + "]");
			map.put("type", "sms");
			
			System.out.println("여까지오긴하니?");
			
			
			
			JSONObject result = coolsms.send(map);
			if((boolean) result.get("status") == true) {
				System.out.println("성공");
				System.out.println(result.get("group_id")); // 그룹아이디
				System.out.println(result.get("result_code")); // 결과코드
				System.out.println(result.get("result_message")); // 결과 메시지
				System.out.println(result.get("success_count")); // 메시지아이디
				System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
				//reMap.put("authNum", key);
				//reMap.put("result", "success");
			} else {
				System.out.println("실패");
				System.out.println(result.get("code"));
				System.out.println(result.get("message"));
				//reMap.put("result", "fail");
			}
			
			//================================================SMS로 가입신청 전송 End===========================================
			
			System.out.println("끝냄");
			return susses;
		}else {
			return 5018;
		}
		
	}
	
	

	@RequestMapping( value="meetingRest/addActList", method=RequestMethod.POST)
	public int addActList(@RequestBody Meeting meeting)throws Exception{
		System.out.println("참여하기시작함");
		// 모임원인지 체크 
		int result = meetingService.checkDuplicationCrew(meeting);
		System.out.println(result);
		if(result < 1) return 5018;/*모임원 아님*/
		//유저정보확인
		User user =userService.getUser(meeting.getMeetingMasterId());
		meeting.setMasterProfileImg(user.getProfile());
		meeting.setCrewNickName(user.getNickName());
		
		meeting.setMeetingActNo(meetingService.getActNo(meeting).getMeetingActNo());
		meeting.setMeetingCrewNo(meetingService.getCrewNo(meeting).getMeetingCrewNo());
		
		// 참여했는지 체크
		int duplicationAct = meetingService.DuplicationAct(meeting);
		System.out.println("참여중복값은"+duplicationAct);
		if(duplicationAct >0 ) return 486; /*이미참여함*/
		
		meeting.setMeetingDate(meetingService.getAct(meeting.getMeetingNo()).getMeetingDate());
	    meeting.setMeetingTime(meetingService.getAct(meeting.getMeetingNo()).getMeetingTime());
	    meeting.setMeetingLocation(meetingService.getAct(meeting.getMeetingNo()).getMeetingLocation());

		meeting.setMeetingDate(meetingService.getAct(meeting.getMeetingNo()).getMeetingDate());
		meeting.setMeetingTime(meetingService.getAct(meeting.getMeetingNo()).getMeetingTime());
		meeting.setMeetingLocation(meetingService.getAct(meeting.getMeetingNo()).getMeetingLocation());
		
		System.out.println("데이트"+meetingService.getAct(meeting.getMeetingNo()).getMeetingDate());
		System.out.println("타임"+meetingService.getAct(meeting.getMeetingNo()).getMeetingTime());
		System.out.println("장소"+meetingService.getAct(meeting.getMeetingNo()).getMeetingLocation());
		//회차에 추가 
		int success= meetingService.addCrewAct(meeting);
		//System.out.println("미팅내용 가져와랏"+meeting);
		System.out.println("끝냄");
		
		if (success == 1) {
			return success;
		} else {
			return 5018;
		}
		
	}
	
	@RequestMapping( value="meetingRest/getActCrew", method=RequestMethod.POST)
	public Map<String , Object> getActCrew(@RequestBody Meeting meeting, Model model)throws Exception{
		System.out.println("참여자목록  시작함");
		int result = meetingService.checkDuplicationCrew(meeting);
		System.out.println("리저트도 없는거냐?"+result);
		if(result < 1) {
			System.out.println("여기들어옴");
			Map<String, Object> notCrewMap = new HashMap<String, Object>();
			notCrewMap.put("result", result);
			return notCrewMap; /*모임원아님*/
		}else {
			System.out.println("여기나옴");
			Map<String, Object> actmap = new HashMap<String, Object>();
			actmap = meetingService.getActCrew(meeting);
			
			actmap.put("actCrewList", actmap.get("list"));
			return actmap;
		}
		
	}
	
	@RequestMapping( value="meetingRest/getCrewrole", method=RequestMethod.POST)
	public String getCrewrole(@RequestBody Meeting meeting)throws Exception{
		System.out.println("모인장인지 확인  시작함");
		String result = meetingService.getCrewrole(meeting);
		System.out.println("확인끝 결과는 ======"+result);
		
		return result;
	}
	
	@RequestMapping( value="meetingRest/kickOut", method=RequestMethod.POST)
	public int kickOut(@RequestBody Meeting meeting)throws Exception{
		System.out.println("강퇴  시작함");
		System.out.println(meeting);
		User userId = userService.getUserByNickName(meeting.getCrewNickName());
		meeting.setMeetingMasterId(userId.getUserId());
		
		int result = meetingService.kickOut(meeting);
		
		if(result==1) {
			int duplicationAct = meetingService.DuplicationAct(meeting);
			if(duplicationAct > 0) {
				meeting.setMeetingActNo(meetingService.getActNo(meeting).getMeetingActNo());
				meeting.setCrewCondition("OUT");
				int actremovResult = meetingService.kickOutAct(meeting);
				System.out.println("회차 모임에서 삭제 되었나"+actremovResult);
				result = 2;
			}
		}
		
		return result;
	}
	
	@RequestMapping( value="meetingRest/passto", method=RequestMethod.POST)
	public int passto(@RequestBody Meeting meeting)throws Exception{
		System.out.println("위임 시작함");
		System.out.println(meeting);
		User targetId = userService.getUserByNickName(meeting.getTargetId()); /*모임원을 모임장으로 변경*/
		meeting.setMeetingMasterId(targetId.getUserId());
		
		int result = meetingService.passto(meeting);
		
		if(result==1) {
			User userId = userService.getUserByNickName(meeting.getCrewNickName()); /*모임장을 일반으로 변경*/
			meeting.setMeetingMasterId(userId.getUserId());
			meeting.setRole("MEM");
			
			int seconResult = meetingService.passto(meeting);
			
			if(seconResult==1) result = 2;	
		}else {
			return 1;
		}
		
		return result;
	}
	
	@RequestMapping( value="meetingRest/dropMeeting", method=RequestMethod.POST)
	public int dropMeeting(@RequestBody Meeting meeting)throws Exception{ 
		System.out.println("탈퇴  시작함");
		System.out.println("여기미팅에 미팅회차 있어야함 "+meeting);
		
		int result = meetingService.checkDuplicationCrew(meeting);
		System.out.println("모임원인지 확인 "+result);
		if(result < 1) return 5018;/*모임원 아님*/
		
		System.out.println("모임장인가요?"+meeting.getMeetingCondition());
		if(meeting.getMeetingCondition().equals("MST")) {
			System.out.println("모임장 탈퇴중입니다.");
			meeting.setMeetingCondition("EMP");
			meetingService.updateMeeting(meeting);
			meetingService.shutdown(meeting);
		}

		if(result==1) {
			
			System.out.println("왔음???");
			meeting.setMeetingActNo(meetingService.getActNo(meeting).getMeetingActNo());
				int duplicationAct = meetingService.DuplicationAct(meeting);
				
				if(duplicationAct>0) {
					System.out.println("여기도??왔음???");
					
					int actremovResult = meetingService.kickOutAct(meeting);
					System.out.println("회차 모임에서 삭제 되었나"+actremovResult);
					
				}
			
			meetingService.dropMeeting(meeting);
			
			result = 2;
		}

		return result;
	}
	
	@RequestMapping( value="meetingRest/nextMeeting", method=RequestMethod.POST)
	public Map<String , Object> nextMeeting(@RequestBody Meeting meeting)throws Exception{
		System.out.println("다음 모임 등록  시작함");
		int meetingActCount = meeting.getMeetingActCount()+1;
		meeting.setMeetingActCount(meetingActCount);
		//String date =(meeting.getMeetingDate()).substring(2);
		//meeting.setMeetingDate(date);
		
		int result = meetingService.nextMeeting(meeting);
		if(result==1) {
			System.out.println("어디서 에러냐");
			Meeting actMeeting = meetingService.getAct(meeting.getMeetingNo());
			Map<String, Object> changeAct = new HashMap<String, Object>();
			changeAct.put("changeList", actMeeting);
			System.out.println(changeAct);
			return changeAct;
		}else {
			System.out.println("여기서 에러냐");
			Map<String, Object> notcollect = new HashMap<String, Object>();
			notcollect.put("result", "5018");
			return notcollect;/*실패*/
		}
			
	}
	
	@RequestMapping(value="meetingRest/meetingListByAndroid/{currentPage}", method=RequestMethod.GET)
	public Map<String, Object> meetingListByAndroid(@PathVariable("currentPage") int currentPage) throws Exception{
		System.out.println("안드로이드에서 meetingListByAndroid 로");
		
		Search search = new Search();
		
		if(currentPage == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(currentPage);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = meetingService.getMeetingList(search);
		
		//List<Meeting> list = (List<Meeting>)map.get("list");
		
		//Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		//System.out.println(resultPage);
		
		//Map<String, Object> returnMap = new HashMap<String, Object>();
		
		//returnMap.put("list", (List<Meeting>)map.get("list"));
		//returnMap.put("resultPage", resultPage);
		//returnMap.put("search", search);
		
		//System.out.println("안드로이드로 전달될 객체 : " + returnMap);
		return map;
	}

	@RequestMapping( value="meetingRest/takeOver", method=RequestMethod.POST)
	public Map<String , Object> takeOver(@RequestBody Meeting meeting)throws Exception{
		System.out.println("승계 시작함");
		
		int result = meetingService.checkDuplicationCrew(meeting);
		
		if(result < 1) {
			Map<String, Object> notCrewMap = new HashMap<String, Object>();
			notCrewMap.put("result", result);
			return notCrewMap; /*모임원아님*/
		}

			
			meetingService.passto(meeting); /*모임장으로 변경*/
			
			int crewCount = meetingService.getCrewCount(meeting.getMeetingNo());
			Map<String , Object> crewMap2=meetingService.getCrew(meeting.getMeetingNo());
			
			crewMap2.put("crewCount", crewCount);
			crewMap2.put("crewList", crewMap2.get("crewList"));
			
			return crewMap2;
	}
	
	@RequestMapping( value="meetingRest/listMeeting",method=RequestMethod.GET)
	public Map<String , Object> listMeeting(@RequestParam("startNo") int startNo) throws Exception{
		System.out.println("리스트시작함");
		System.out.println("스타트넘버"+startNo);
		//System.out.println(request.getAttribute("startNo"));
		System.out.println(startNo);
		int currentPage = startNo;
		
		Search search = new Search();
		int pageSize = 3;
		search.setPageSize(pageSize);
		System.out.println(pageSize);
		search.setCurrentPage(currentPage);
		Map<String , Object> map=meetingService.getMeetingList(search);
	    Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(),3, pageSize);
		System.out.println("리절트페이지"+resultPage);
		
		System.out.println("리스트끝냄");
		
		return map;
		
	}
	
	@RequestMapping( value="meetingRest/nearMeeting", method=RequestMethod.GET)
	public Map<String , Object> getActCrew(@RequestParam("address") String address)throws Exception{
		System.out.println("근처모임  시작함");
		String tutu = URLEncoder.encode(address , "utf-8");
		System.out.println("어드레스 tutu?"+tutu);
		System.out.println("어드레스 모냐??"+address);
		Map<String , Object> bestMap=meetingService.getNearMeeting(address);
		System.out.println(bestMap);
		
		return bestMap;
	}
	
	@RequestMapping( value="meetingRest/todayTogeterMeeting", method=RequestMethod.GET)
	public Map<String , Object> todayTogeterMeeting(@RequestParam("today") String today)throws Exception{
		System.out.println("오늘의 함께해요  시작함");
		System.out.println(today);
		//String tutu = URLEncoder.encode(today , "utf-8");
		//System.out.println("어드레스 tutu?"+tutu);
		//System.out.println("어드레스 모냐??"+address);
		
		Map<String , Object> todayTogeterMap=meetingService.todayTogeterMeeting(today);
		System.out.println(todayTogeterMap);
		
		return todayTogeterMap;
	}
	

}
