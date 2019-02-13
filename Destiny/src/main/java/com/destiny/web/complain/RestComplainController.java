package com.destiny.web.complain;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.common.Page;
import com.destiny.common.Search;
import com.destiny.service.community.CommunityService;
import com.destiny.service.complain.ComplainService;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Complain;
import com.destiny.service.domain.Meeting;
import com.destiny.service.domain.User;
import com.destiny.service.meeting.MeetingService;
import com.destiny.service.user.UserService;

@RestController
@RequestMapping("/complain/*")
public class RestComplainController {
	
	///Field
		@Autowired
		@Qualifier("complainServiceImpl")
		private ComplainService complainService;
		
		@Autowired
		@Qualifier("meetingServiceImpl")
		private MeetingService meetingService;
		
		@Autowired
		@Qualifier("userServiceImpl")
		private UserService userService;
		
		@Autowired
		@Qualifier("communityServiceImpl")
		private CommunityService communityService;
		
		///Constructor
		public RestComplainController() {
			System.out.println(this.getClass());
		}
		
		@Value("#{commonProperties['pageUnit']}")
		int pageUnit;
		
		@Value("#{commonProperties['pageSize']}")
		int pageSize;

		
		/*updateComplain/POST : start*/
		@RequestMapping(value="json/updateComplain/{complainNo}/{complainCondition}", method=RequestMethod.GET)
		public Complain updateComplain( @PathVariable("complainNo") int complainNo,@PathVariable("complainCondition") String complainCondition) throws Exception{
			
			System.out.println(":: ComplainController/updateComplain/json/POST : ����");
			
			Complain complain = complainService.getComplain(complainNo);
			complain.setComplainCondition(complainCondition);
			int meetingNo = complain.getMeetingNo();
			int communityNo = complain.getCommunityNo();
			
			User user = userService.getUser(complain.getDefendantId());
			Community community = communityService.getCommunity(complain.getCommunityNo());
			Meeting meeting = meetingService.getMeeting(complain.getMeetingNo());
			
			
			if(complain.getComplainCondition().equals("WAR") ) {
				userService.updateWarningCount(user);
				
				if(userService.getUser(complain.getDefendantId()).getWarningCount() >= 5) {
					System.out.println("��� 5ȸ �̻� ���� �� ������Ʈ�� �����");
					user.setUserGrade("BLK");
					userService.updateGrade(user);
					
					if(meetingNo == 0) {
						System.out.println("������Ʈ���� ȸ���� ��� �Խù��� ����ε� ó����");
						community = communityService.getCommunity(complain.getCommunityNo());
						community.setViewCondition("BLD");
						communityService.updateViewsConditionAdmin(community);
					} else if(communityNo == 0) {
						System.out.println("������Ʈ���� ������ ����ε� ó����");
						meeting = meetingService.getMeeting(complain.getMeetingNo());
						meeting.setMeetingCondition("BLD");
						meetingService.updateMeeting(meeting);
					}
					
				}
			}
			
			if(complain.getComplainCondition().equals("BLK")) {
				
				System.out.println("�Ű�ó���� ������Ʈ�� ��� USER_GRADE ������Ʈ ��");
				user.setUserGrade("BLK");
				userService.updateGrade(user);
				
				if(meetingNo == 0) {
					System.out.println("������Ʈ���� ȸ���� ��� �Խù��� ����ε� ó����");
					community.setViewCondition("BLD");
					communityService.updateViewsConditionAdmin(community);
				} else if(communityNo == 0) {
					System.out.println("������Ʈ���� ȸ���� ��� ������ ����ε� ó����");
					meeting.setMeetingCondition("BLD");
					meetingService.updateMeeting(meeting);
				}
				
			}
			
			complainService.updateComplain(complain);
			Complain complain1=complainService.getComplain(complain.getComplainNo());
			
			return complain1;
		}
		/*updateComplain/POST : end*/

}
