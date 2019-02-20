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
		System.out.println("������");
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
			
			System.out.println("���������� �����Ͷ�!!"+user);
			meeting.setMasterProfileImg(user.getProfile());
			meeting.setCrewNickName(user.getNickName());
			
			int susses= meetingService.addCrewM(meeting);
			//System.out.println("���ó��� �����Ͷ�"+meeting);
			
			//================================================SMS�� ���Խ�û ����==============================================
			Meeting contextMeeting = meetingService.getMeeting(meeting.getMeetingNo());
			
			//������ ȹ��. 
			Map<String, Object> reMap = meetingService.getCrew(meeting.getMeetingNo());
			List<Meeting> crewList = (List<Meeting>)reMap.get("crewList");
			User masterUser = new User();
			for(Meeting m : crewList) {
				if(m.getRole().equals("MST")) {
					masterUser = userService.getUser(m.getMeetingMasterId());
				}
			}
			
			//�������� �� ��ȣ�� ���Խ�û�� ����
			String phone = masterUser.getPhone();
					
			System.out.println("SMS part ���� �Ϸ�. ���� ������ phone ��ȣ : " +  phone);
			
			String api_key = "NCSVNPXGDXR313KS";
			String api_secret = "J7K4C3WVID3LHZ4YUR6USDB9VBF8WMMU";
			Coolsms coolsms = new Coolsms(api_key, api_secret);
			
			//String key = RandomNum();
			
			HashMap<String, String> map = new HashMap<String, String>();
			
			//map.put("to", phone);
			map.put("to", "01086032406");
			map.put("from", "01086032406");
			map.put("text", "[�쿬] ���� : [" + contextMeeting.getMeetingName() + "] \n���Խ�û�� : [" + user.getUserId() + "]");
			map.put("type", "sms");
			
			System.out.println("�����������ϴ�?");
			
			
			
			JSONObject result = coolsms.send(map);
			if((boolean) result.get("status") == true) {
				System.out.println("����");
				System.out.println(result.get("group_id")); // �׷���̵�
				System.out.println(result.get("result_code")); // ����ڵ�
				System.out.println(result.get("result_message")); // ��� �޽���
				System.out.println(result.get("success_count")); // �޽������̵�
				System.out.println(result.get("error_count")); // ������ ������ ������ �޽��� ��
				//reMap.put("authNum", key);
				//reMap.put("result", "success");
			} else {
				System.out.println("����");
				System.out.println(result.get("code"));
				System.out.println(result.get("message"));
				//reMap.put("result", "fail");
			}
			
			//================================================SMS�� ���Խ�û ���� End===========================================
			
			System.out.println("����");
			return susses;
		}else {
			return 5018;
		}
		
	}
	
	

	@RequestMapping( value="meetingRest/addActList", method=RequestMethod.POST)
	public int addActList(@RequestBody Meeting meeting)throws Exception{
		System.out.println("�����ϱ������");
		// ���ӿ����� üũ 
		int result = meetingService.checkDuplicationCrew(meeting);
		System.out.println(result);
		if(result < 1) return 5018;/*���ӿ� �ƴ�*/
		//��������Ȯ��
		User user =userService.getUser(meeting.getMeetingMasterId());
		meeting.setMasterProfileImg(user.getProfile());
		meeting.setCrewNickName(user.getNickName());
		
		meeting.setMeetingActNo(meetingService.getActNo(meeting).getMeetingActNo());
		meeting.setMeetingCrewNo(meetingService.getCrewNo(meeting).getMeetingCrewNo());
		
		// �����ߴ��� üũ
		int duplicationAct = meetingService.DuplicationAct(meeting);
		System.out.println("�����ߺ�����"+duplicationAct);
		if(duplicationAct >0 ) return 486; /*�̹�������*/
		
		meeting.setMeetingDate(meetingService.getAct(meeting.getMeetingNo()).getMeetingDate());
	    meeting.setMeetingTime(meetingService.getAct(meeting.getMeetingNo()).getMeetingTime());
	    meeting.setMeetingLocation(meetingService.getAct(meeting.getMeetingNo()).getMeetingLocation());

		meeting.setMeetingDate(meetingService.getAct(meeting.getMeetingNo()).getMeetingDate());
		meeting.setMeetingTime(meetingService.getAct(meeting.getMeetingNo()).getMeetingTime());
		meeting.setMeetingLocation(meetingService.getAct(meeting.getMeetingNo()).getMeetingLocation());
		
		System.out.println("����Ʈ"+meetingService.getAct(meeting.getMeetingNo()).getMeetingDate());
		System.out.println("Ÿ��"+meetingService.getAct(meeting.getMeetingNo()).getMeetingTime());
		System.out.println("���"+meetingService.getAct(meeting.getMeetingNo()).getMeetingLocation());
		//ȸ���� �߰� 
		int success= meetingService.addCrewAct(meeting);
		//System.out.println("���ó��� �����Ͷ�"+meeting);
		System.out.println("����");
		
		if (success == 1) {
			return success;
		} else {
			return 5018;
		}
		
	}
	
	@RequestMapping( value="meetingRest/getActCrew", method=RequestMethod.POST)
	public Map<String , Object> getActCrew(@RequestBody Meeting meeting, Model model)throws Exception{
		System.out.println("�����ڸ��  ������");
		int result = meetingService.checkDuplicationCrew(meeting);
		System.out.println("����Ʈ�� ���°ų�?"+result);
		if(result < 1) {
			System.out.println("�������");
			Map<String, Object> notCrewMap = new HashMap<String, Object>();
			notCrewMap.put("result", result);
			return notCrewMap; /*���ӿ��ƴ�*/
		}else {
			System.out.println("���⳪��");
			Map<String, Object> actmap = new HashMap<String, Object>();
			actmap = meetingService.getActCrew(meeting);
			
			actmap.put("actCrewList", actmap.get("list"));
			return actmap;
		}
		
	}
	
	@RequestMapping( value="meetingRest/getCrewrole", method=RequestMethod.POST)
	public String getCrewrole(@RequestBody Meeting meeting)throws Exception{
		System.out.println("���������� Ȯ��  ������");
		String result = meetingService.getCrewrole(meeting);
		System.out.println("Ȯ�γ� ����� ======"+result);
		
		return result;
	}
	
	@RequestMapping( value="meetingRest/kickOut", method=RequestMethod.POST)
	public int kickOut(@RequestBody Meeting meeting)throws Exception{
		System.out.println("����  ������");
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
				System.out.println("ȸ�� ���ӿ��� ���� �Ǿ���"+actremovResult);
				result = 2;
			}
		}
		
		return result;
	}
	
	@RequestMapping( value="meetingRest/passto", method=RequestMethod.POST)
	public int passto(@RequestBody Meeting meeting)throws Exception{
		System.out.println("���� ������");
		System.out.println(meeting);
		User targetId = userService.getUserByNickName(meeting.getTargetId()); /*���ӿ��� ���������� ����*/
		meeting.setMeetingMasterId(targetId.getUserId());
		
		int result = meetingService.passto(meeting);
		
		if(result==1) {
			User userId = userService.getUserByNickName(meeting.getCrewNickName()); /*�������� �Ϲ����� ����*/
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
		System.out.println("Ż��  ������");
		System.out.println("������ÿ� ����ȸ�� �־���� "+meeting);
		
		int result = meetingService.checkDuplicationCrew(meeting);
		System.out.println("���ӿ����� Ȯ�� "+result);
		if(result < 1) return 5018;/*���ӿ� �ƴ�*/
		
		System.out.println("�������ΰ���?"+meeting.getMeetingCondition());
		if(meeting.getMeetingCondition().equals("MST")) {
			System.out.println("������ Ż�����Դϴ�.");
			meeting.setMeetingCondition("EMP");
			meetingService.updateMeeting(meeting);
			meetingService.shutdown(meeting);
		}

		if(result==1) {
			
			System.out.println("����???");
			meeting.setMeetingActNo(meetingService.getActNo(meeting).getMeetingActNo());
				int duplicationAct = meetingService.DuplicationAct(meeting);
				
				if(duplicationAct>0) {
					System.out.println("���⵵??����???");
					
					int actremovResult = meetingService.kickOutAct(meeting);
					System.out.println("ȸ�� ���ӿ��� ���� �Ǿ���"+actremovResult);
					
				}
			
			meetingService.dropMeeting(meeting);
			
			result = 2;
		}

		return result;
	}
	
	@RequestMapping( value="meetingRest/nextMeeting", method=RequestMethod.POST)
	public Map<String , Object> nextMeeting(@RequestBody Meeting meeting)throws Exception{
		System.out.println("���� ���� ���  ������");
		int meetingActCount = meeting.getMeetingActCount()+1;
		meeting.setMeetingActCount(meetingActCount);
		//String date =(meeting.getMeetingDate()).substring(2);
		//meeting.setMeetingDate(date);
		
		int result = meetingService.nextMeeting(meeting);
		if(result==1) {
			System.out.println("��� ������");
			Meeting actMeeting = meetingService.getAct(meeting.getMeetingNo());
			Map<String, Object> changeAct = new HashMap<String, Object>();
			changeAct.put("changeList", actMeeting);
			System.out.println(changeAct);
			return changeAct;
		}else {
			System.out.println("���⼭ ������");
			Map<String, Object> notcollect = new HashMap<String, Object>();
			notcollect.put("result", "5018");
			return notcollect;/*����*/
		}
			
	}
	
	@RequestMapping(value="meetingRest/meetingListByAndroid/{currentPage}", method=RequestMethod.GET)
	public Map<String, Object> meetingListByAndroid(@PathVariable("currentPage") int currentPage) throws Exception{
		System.out.println("�ȵ���̵忡�� meetingListByAndroid ��");
		
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
		
		//System.out.println("�ȵ���̵�� ���޵� ��ü : " + returnMap);
		return map;
	}

	@RequestMapping( value="meetingRest/takeOver", method=RequestMethod.POST)
	public Map<String , Object> takeOver(@RequestBody Meeting meeting)throws Exception{
		System.out.println("�°� ������");
		
		int result = meetingService.checkDuplicationCrew(meeting);
		
		if(result < 1) {
			Map<String, Object> notCrewMap = new HashMap<String, Object>();
			notCrewMap.put("result", result);
			return notCrewMap; /*���ӿ��ƴ�*/
		}

			
			meetingService.passto(meeting); /*���������� ����*/
			
			int crewCount = meetingService.getCrewCount(meeting.getMeetingNo());
			Map<String , Object> crewMap2=meetingService.getCrew(meeting.getMeetingNo());
			
			crewMap2.put("crewCount", crewCount);
			crewMap2.put("crewList", crewMap2.get("crewList"));
			
			return crewMap2;
	}
	
	@RequestMapping( value="meetingRest/listMeeting",method=RequestMethod.GET)
	public Map<String , Object> listMeeting(@RequestParam("startNo") int startNo) throws Exception{
		System.out.println("����Ʈ������");
		System.out.println("��ŸƮ�ѹ�"+startNo);
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
		System.out.println("����Ʈ������"+resultPage);
		
		System.out.println("����Ʈ����");
		
		return map;
		
	}
	
	@RequestMapping( value="meetingRest/nearMeeting", method=RequestMethod.GET)
	public Map<String , Object> getActCrew(@RequestParam("address") String address)throws Exception{
		System.out.println("��ó����  ������");
		String tutu = URLEncoder.encode(address , "utf-8");
		System.out.println("��巹�� tutu?"+tutu);
		System.out.println("��巹�� ���??"+address);
		Map<String , Object> bestMap=meetingService.getNearMeeting(address);
		System.out.println(bestMap);
		
		return bestMap;
	}
	
	@RequestMapping( value="meetingRest/todayTogeterMeeting", method=RequestMethod.GET)
	public Map<String , Object> todayTogeterMeeting(@RequestParam("today") String today)throws Exception{
		System.out.println("������ �Բ��ؿ�  ������");
		System.out.println(today);
		//String tutu = URLEncoder.encode(today , "utf-8");
		//System.out.println("��巹�� tutu?"+tutu);
		//System.out.println("��巹�� ���??"+address);
		
		Map<String , Object> todayTogeterMap=meetingService.todayTogeterMeeting(today);
		System.out.println(todayTogeterMap);
		
		return todayTogeterMap;
	}
	

}
