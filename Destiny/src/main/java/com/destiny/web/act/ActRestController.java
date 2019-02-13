package com.destiny.web.act;

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
import com.destiny.service.community.CommunityService;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.Meeting;
import com.destiny.service.meeting.MeetingService;

@RestController
@RequestMapping("/act/*")
public class ActRestController {
	
	@Autowired
	@Qualifier("meetingServiceImpl")
	private MeetingService meetingService;
	
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;

	public ActRestController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value="json/getAdviceistByAndroid/{currentPage}", method=RequestMethod.GET)
	public List<Community> getAdviceistByAndroid(@PathVariable int currentPage) throws Exception{
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
		return list;
	}
	
	@RequestMapping(value="json/getDateReviewListByAndroid/{currentPage}", method=RequestMethod.GET)
	public List<Community> getDateReviewListByAndroid(@PathVariable int currentPage) throws Exception{
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
		return list;
	}
	
	@RequestMapping(value="json/getMeetingReviewListByAndroid/{currentPage}", method=RequestMethod.GET)
	public List<Community> getMeetingReviewListByAndroid(@PathVariable int currentPage) throws Exception{
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
		return list;
	}
	
	
	
	@RequestMapping(value="json/getInfoListByAndroid/{currentPage}", method=RequestMethod.GET)
	public List<Community> getInfoListByAndroid(@PathVariable int currentPage) throws Exception{
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
		return list;
	}
	
	@RequestMapping(value="json/getInfoByAndroid/{communityNo}", method=RequestMethod.GET)
	public Community getInfoByAndroid(@PathVariable("communityNo") int communityNo) throws Exception{
		System.out.println("act/json/getInfoByAndroid/"+communityNo);
		
		Community community = communityService.getCommunity(communityNo);
		communityService.updateViews(communityNo);
		System.out.println(community);
		
		return community;
	}
	
	@RequestMapping(value="json/getAdvcieByAndroid/{communityNo}", method=RequestMethod.GET)
	public Community getAdvcieByAndroid(@PathVariable("communityNo") int communityNo) throws Exception{
		System.out.println("act/json/getInfoByAndroid/"+communityNo);
		
		Community community = communityService.getCommunity(communityNo);
		communityService.updateViews(communityNo);
		System.out.println(community);
		
		return community;
	}
	
	@RequestMapping(value="json/getNoticeListByAndroid/{currentPage}", method=RequestMethod.GET)
	public List<Community> getNoticeListByAndroid(@PathVariable int currentPage) throws Exception{
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
		return list;
	}
	
	
	
	@RequestMapping(value="json/getMeetingByAndroid/{meetingNo}", method=RequestMethod.GET)
	public Meeting getMeeting(@PathVariable int meetingNo) throws Exception{
		System.out.println("json/getMeeting/"+meetingNo);
		Meeting meeting = meetingService.getMeeting(meetingNo);
		System.out.println("안드로이드로 전달되는 meeting : " + meeting);
		return meeting;
	}
	
	@RequestMapping(value="json/inquiry/{propose}", method=RequestMethod.GET)
	public Map<String, Object> inquiry(@PathVariable("propose") String propose) throws Exception{
		
		System.out.println("act/inquiry/"+ propose);
		
		String host = "smtp.naver.com";
		String subject = "인증정보 전달";
		String fromName = "전달자";
		String from = "ABC";
		String to1 = "pischa@naver.com";
		
		//String user = "pischa@naver.com";
		String password = "sunnydays15358";
		
		String content = "다음과 같은 건의사항이 접수되었습니다. ["+propose+"]";
		
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
			msg.setText(content);
			
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
