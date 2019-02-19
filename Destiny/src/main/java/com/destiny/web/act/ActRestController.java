package com.destiny.web.act;

import java.util.ArrayList;
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.MessagingException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.destiny.common.Search;
import com.destiny.service.comment.CommentService;
import com.destiny.service.community.CommunityService;
import com.destiny.service.domain.Comment;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Meeting;
import com.destiny.service.domain.User;
import com.destiny.service.meeting.MeetingService;
import com.destiny.service.user.UserService;

@RestController
@RequestMapping("/act/*")
public class ActRestController {
	
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	public ActRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="json/getAdviceistByAndroid/{currentPage}", method=RequestMethod.GET)
	public Map<String, Object> getAdviceistByAndroid(@PathVariable int currentPage) throws Exception{
		System.out.println("act/json/getAdviceistByAndroid/"+currentPage);
		
		Search search = new Search();
		
		if(currentPage == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(currentPage);
		}
		
		
		search.setPageSize(pageSize);
		
		System.out.println(":: search : "+search);
		
		Map<String, Object> map = communityService.getLoveAdviceList(search);
		
		System.out.println("MAP : "+map);
		
		List<Community> list = (List<Community>)map.get("list");
		return map;
	}
	
	@RequestMapping(value="json/getDateReviewListByAndroid/{currentPage}", method=RequestMethod.GET)
	public Map<String, Object> getDateReviewListByAndroid(@PathVariable int currentPage) throws Exception{
		System.out.println("act/json/getReviewListByAndroid/"+currentPage);
		
		Search search = new Search();
		
		if(currentPage == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(currentPage);
		}
		
		
		search.setPageSize(pageSize);
		
		System.out.println(":: search : "+search);
		
		Map<String, Object> map = communityService.getDateStoryList(search);
		
		System.out.println("MAP : "+map);
		
		List<Community> list = (List<Community>)map.get("list");
		return map;
	}
	
	@RequestMapping(value="json/getMeetingReviewListByAndroid/{currentPage}", method=RequestMethod.GET)
	public Map<String, Object> getMeetingReviewListByAndroid(@PathVariable int currentPage) throws Exception{
		System.out.println("act/json/getMeetingReviewListByAndroid/"+currentPage);
		
		Search search = new Search();
		
		if(currentPage == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(currentPage);
		}
		
		
		search.setPageSize(pageSize);
		
		System.out.println(":: search : "+search);
		
		Map<String, Object> map = communityService.getMeetingStoryList(search);
		
		System.out.println("MAP : "+map);
		
		List<Community> list = (List<Community>)map.get("list");
		return map;
	}
	
	
	
	@RequestMapping(value="json/getInfoListByAndroid/{currentPage}", method=RequestMethod.GET)
	public Map<String, Object> getInfoListByAndroid(@PathVariable int currentPage) throws Exception{
		System.out.println("act/json/getInfoListByAndroid/"+currentPage);
		
		Search search = new Search();
		
		if(currentPage == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(currentPage);
		}
		
		search.setPageSize(pageSize);
		System.out.println(":: search : "+search);

		Map<String, Object> map = communityService.getCommunityList(search);
		
		System.out.println("MAP : "+map);
		
		List<Community> list = (List<Community>)map.get("list");
		return map;
	}
	
	@RequestMapping(value="json/getInfoByAndroid/{communityNo}", method=RequestMethod.GET)
	public Map<String, Object> getInfoByAndroid(@PathVariable("communityNo") int communityNo) throws Exception{
		System.out.println("act/json/getInfoByAndroid/"+communityNo);
		
		Community community = communityService.getCommunity(communityNo);
		communityService.updateViews(communityNo);
		System.out.println(community);
		
		List<Comment> commentList = commentService.getCommentList(community.getCommunityNo());
		
		System.out.println(commentList);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("community", community);
		map.put("commentList", commentList);
		
		return map;
	}
	
	@RequestMapping(value="json/getAdvcieByAndroid/{communityNo}", method=RequestMethod.GET)
	public Community getAdvcieByAndroid(@PathVariable("communityNo") int communityNo) throws Exception{
		System.out.println("act/json/getInfoByAndroid/"+communityNo);
		
		Community community = communityService.getCommunity(communityNo);
		communityService.updateViews(communityNo);
		System.out.println(community);
		
		return community;
	}
	
	@RequestMapping(value="json/getNoticeByAndroid/{communityNo}", method=RequestMethod.GET)
	public Community getNoticeByAndroid(@PathVariable("communityNo") int communityNo) throws Exception{
		System.out.println("act/json/getInfoByAndroid/"+communityNo);
		
		Community community = communityService.getNotice(communityNo);
		communityService.updateViews(communityNo);
		System.out.println(community);
		
		return community;
	}
	
	@RequestMapping(value="json/getNoticeListByAndroid/{currentPage}", method=RequestMethod.GET)
	public Map<String, Object> getNoticeListByAndroid(@PathVariable int currentPage) throws Exception{
		System.out.println("act/json/getNoticeListByAndroid/"+currentPage);
		
		Search search = new Search();
		
		if(currentPage == 0) {
			search.setCurrentPage(1);
		} else {
			search.setCurrentPage(currentPage);
		}
		
		search.setPageSize(pageSize);
		System.out.println(":: search : "+search);

		Map<String, Object> map = communityService.getNoticeList(search);
		
		System.out.println("MAP : "+map);
		
		List<Community> list = (List<Community>)map.get("list");
		return map;
	}
	
	
	
	@RequestMapping(value="json/getMeetingByAndroid/{meetingNo}", method=RequestMethod.GET)
	public Map<String, Object> getMeeting(@PathVariable int meetingNo) throws Exception{
		System.out.println("json/getMeeting/"+meetingNo);
		Meeting meeting = meetingService.getMeeting(meetingNo);
		
		Map<String, Object> map = meetingService.getCrew(meetingNo);
		List<Meeting> crewList= (List<Meeting>)map.get("crewList");
		
		List<User> userList = new ArrayList<User>();
		for(Meeting m : crewList) {
			userList.add(userService.getUser(m.getMeetingMasterId()));
		}
		
		System.out.println("안드로이드로 전달되는 meeting : " + meeting);
		System.out.println("안드로이드로 전달되는 crewList : " + userList);
		
		Map<String, Object> returnMap  = new HashMap<String, Object>();
		
		returnMap.put("meeting", meeting);
		returnMap.put("crewList", userList);
		
		return returnMap;
	}
	
	@RequestMapping(value="json/inquiry/{propose}", method=RequestMethod.GET)
	public Map<String, Object> inquiry(@PathVariable("propose") String propose) throws Exception{
		
		System.out.println("act/inquiry/"+ propose);
		
		String host = "smtp.naver.com";
		String subject = "인증정보 전달";
		String fromName = "전달자";
		String from = "ABC";
		String to1 = "kbm4853@naver.com";
		
		//String user = "pischa@naver.com";
		String password = "!Bomi0417!";
		
		/*String content = "다음과 같은 건의사항이 접수되었습니다. ["+propose+"]";*/
		String content = propose;
		
		try {
			
			System.out.println("sendEmail try 진입. email : " + to1);
			Properties props = new Properties();
			
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.user", 587);
			props.put("mail.smtp.auth", "true");
			System.out.println("Properties 선언  : " + props.toString());
			
			Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication(to1,password);
					}
			});
			
			System.out.println("session 선언 " + session.toString());
			
			Message msg = new MimeMessage(session);
			
			
			msg.setFrom(new InternetAddress(to1));
			
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to1));
			msg.setSubject("Inquiry Mail");
			//msg.setText(content);
			
			msg.setContent(   "<div style=\"margin: 0 auto; width:30%; font-family:'ubuntu',proxima_nova,'Open Sans','Segoe UI',Arial,Verdana,'Lucida Sans Unicode',Tahoma,'Sans Serif'; border: 2px solid #ddd\">\n" + 
					"  <div style=\"text-align:center; margin-top:30px;\">\n" + 
					"    <img src=\"https://i.imgur.com/mWJS8jQ.png\" width=\"200px\" height=\"auto\"/>\n" + 
					"  </div>\n" + 
					"  <br/><br/>\n" + 
					" \n" + 
					"<p style=\"padding:50px \">\n" + 
					"안녕하세요!<br><br>\n" + 
					"<strong style=\"font-size:20px;\">우연</strong>은 다양한 모임과, 이상형을 만날 수 있는 홈페이지입니다.<br>\n" + 
					"<br>\n" + 
					"  우연 회원으로 부터 문의사항이 접수되었습니다.\n" + 
					"  <br><br>\n" + 
					"  \n" + 
					" <strong>문의내용</strong><br><br>\n" + 
					"\n" + 
					"  <strong style=\"font-size:20px; color:#fd5d7c;\">"+propose+"</strong><br>\n" + 
					"<br>\n" + 
					"\n" + 
					"</p>\n" + 
					"<p style=\"text-align:center\"><a style=\"background: #fd5d7c; color: #ddd; padding: 10px 50px; border-radius: 3px;text-decoration:none;\" href=\"http://127.0.0.1:8080/\">답변하기</a>\n" + 
					"</p>\n" + 
					"<br/><br/>\n" + 
					"<p style=\"border-bottom:1px solid #eee\"></p><br>\n" + 
					"<p style=\"text-align: center;color:#666;font-size:12px\">\n" + 
					"F: +971.442.7130 &nbsp;&nbsp;&nbsp; E: info@fantastay.com &nbsp;&nbsp;&nbsp;W: www.fantastay.com\n" + 
					"</p>\n" + 
					"<p>\n" + 
					"	&nbsp;\n" + 
					"</p>\n" + 
					"</div>", 
                    "text/html;charset=utf-8");
			
			System.out.println("msg 구축 : " + msg.toString());
			
			Transport.send(msg);
			
		} catch(MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("result", "ok");
		
		return map;
	}
}
