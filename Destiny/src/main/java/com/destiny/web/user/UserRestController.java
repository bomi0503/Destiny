package com.destiny.web.user;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Date;
import java.time.LocalDate;
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
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.messaging.MessagingException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.common.Coolsms;
import com.destiny.service.domain.Location;
import com.destiny.service.domain.User;
import com.destiny.service.user.UserService;


@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	public UserRestController() {	
	}
	
	@RequestMapping(value="json/getUser/{userId}", method=RequestMethod.GET)
	public Map<String, Object> getUser(@PathVariable String userId) throws Exception{
		System.out.println("restController 진입 성공. json/getUser/"+userId);
		Map<String, Object> map = new HashMap<String, Object>();
		
		User user = userService.getUser(userId);
		
		map.put("user", user);
		//프로필 사진
		user.setProfile(user.getProfile().replace("[", ""));
		user.setProfile(user.getProfile().replace("]", ""));
		String[] filelist = user.getProfile().split(", ");
		map.put("filelist", filelist);
		
		System.out.println("여긴 오냐?");
		return map;
	}
	
	@RequestMapping(value="json/getUserByAndroid/{userId}", method=RequestMethod.GET)
	public User getUserByAndroid(@PathVariable String userId) throws Exception{
		System.out.println("restController 진입 성공. json/getUserByAndroid/"+userId);
		User user = userService.getUser(userId);
		return user;
	}
	
	@RequestMapping(value="json/getUserByNickName/{nickName}", method=RequestMethod.GET)
	public Map<String, Object> getUserByNickName(@PathVariable String nickName, HttpSession session) throws Exception{
		System.out.println("restController 진입 성공. json/getUserByNickName/"+nickName);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", userService.getUserByNickName(nickName));
		map.put("me", session.getAttribute("me"));
		System.out.println("여긴 오냐?");
		return map;
	}
	
	@RequestMapping(value="json/getUserByEmail/{email}", method=RequestMethod.GET)
	public User getUserByEmail(@PathVariable("email") String email) throws Exception{
		System.out.println("기본 email : " + email);
		email += ".com";
		System.out.println("restController 진입 성공. json/getUserByEmail/"+email);
		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("user", userService.getUserByEmail(email));
		//map.put("me", session.getAttribute("me"));
		
		User user = new User();
		
		if(userService.getUserByEmail(email) != null) {
			user = userService.getUserByEmail(email);
		}
		
		System.out.println("여긴 오냐?");
		return user;
	}
	
	@RequestMapping(value="json/getUserByPhone/{phone}", method=RequestMethod.GET)
	public Map<String, Object> getUserByPhone(@PathVariable String phone, HttpSession session) throws Exception{
		System.out.println("restController 진입 성공. json/getUserByPhone/"+phone);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", userService.getUserByPhone(phone));
		//map.put("me", session.getAttribute("me"));
		System.out.println("여긴 오냐?");
		return map;
	}
	
	@RequestMapping(value="json/getLocationList/{city}", method=RequestMethod.GET)
	public Map<String, Object> getLocationList(@PathVariable String city) throws Exception{
		System.out.println("restController 진입 성공. json/getLocationList/"+city);
	
		System.out.println("여긴 오냐?");
		
		Map<String, Object> map = userService.getLocationList(city);
		
		
		System.out.println("끝");
		return map;
	}
	
	
	@RequestMapping(value="json/getAnswer/{question}", method=RequestMethod.GET)
	public Map getAnswer(@PathVariable("question") String question) throws Exception{
		System.out.println("json/getAnswer/ + " + question);
		String requestURL = "http://api.adams.ai/datamixiApi/deepqa?key=3758962826504551960&answerType=0&question=";
		
		String text = URLEncoder.encode(question, "UTF-8");
		requestURL += text;
		URL url = new URL(requestURL);
		HttpURLConnection con = (HttpURLConnection)url.openConnection();
		con.setRequestMethod("GET");
		
		int responseCode = con.getResponseCode();
		BufferedReader br = null;
		
		if(responseCode==200) { 
            br = new BufferedReader(new InputStreamReader(con.getInputStream(),"UTF-8"));
        } else {  // 에러 발생
            br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
        }
		
		//JSON Data 읽기
        String jsonData = "";
        StringBuffer response = new StringBuffer();
        
        while ((jsonData = br.readLine()) != null) {
            response.append(jsonData);
        }
        
        br.close();
        
        // Console 확인
        System.out.println(response.toString());
        
        String returnString = response.toString();
        JSONObject answer = (JSONObject)JSONValue.parse(returnString);
        System.out.println("json으로 달린 answer : "  + answer);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("answer", answer);
		
		return map;
	}
	

	@RequestMapping(value="json/SMSAuth/{phone}", method=RequestMethod.POST)
	public Map SMSAuth(@PathVariable String phone, HttpSession session) throws Exception{
		System.out.println("SMSAuth 진입 완료. 받은 폰 번호 : " + phone);
		
		String api_key = "NCS14Y4JAMHE1URY";
		String api_secret = "PGIB0ZOIVBL9IHYLZP7QIMNWHSSWP9F9";
		Coolsms coolsms = new Coolsms(api_key, api_secret);
		
		String key = RandomNum();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("to", phone);
		map.put("from", "01076679328");
		map.put("text", "하이 헬로우 안녕? 인증번호는 [" + key + "] 이야");
		map.put("type", "sms");
		
		System.out.println("여까지오긴하니?");
		
		Map reMap = new HashMap();
		
		JSONObject result = coolsms.send(map);
		if((boolean) result.get("status") == true) {
			System.out.println("성공");
			System.out.println(result.get("group_id")); // 그룹아이디
			System.out.println(result.get("result_code")); // 결과코드
			System.out.println(result.get("result_message")); // 결과 메시지
			System.out.println(result.get("success_count")); // 메시지아이디
			System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수
			reMap.put("authNum", key);
			reMap.put("result", "success");
		} else {
			System.out.println("실패");
			System.out.println(result.get("code"));
			System.out.println(result.get("message"));
			reMap.put("result", "fail");
		}
			
		return reMap;
	}
	
	@RequestMapping(value="json/emailAuth/{email}", method=RequestMethod.POST)
	public Map emailAuth(@PathVariable String email, HttpSession session) throws Exception {
		System.out.println("emailAuth 진입 완료");
		//String email = request.getParameter("email");

		String authNum = "";
		email += ".com";
		System.out.println("이메일 획득 : " + email);
		
		authNum = RandomNum();
		System.out.println("난수 매서드 수행 : " +  authNum);
		
		sendEmail(email.toString().trim(), authNum);
		System.out.println("sendEmail 메서드 수행");
		
		Map map = new HashMap();
		//map.put("email", email);
		map.put("authNum", authNum);
		session.setAttribute("authNum", authNum);
		//model.addAttribute("email", email);
		//model.addAttribute("authNum", authNum);
		
		return map;
	}
	
	public String RandomNum() {
		StringBuffer buffer = new StringBuffer();
		for (int i = 0;i <= 6; i++) {
			int n = (int)(Math.random() * 10);
			buffer.append(n);
		}
		return buffer.toString();
	}
	
	private void sendEmail(String email, String authNum) {
		String host = "smtp.naver.com";
		String subject = "인증정보 전달";
		String fromName = "pischa";
		String from = "ABC";
		String to1 = email;
		
		String user = "pischa@naver.com";
		String password = "sunnydays15358";

		
		/*String content = "인증번호를 입력하여 주세요. 인증번호 ["+authNum+"]";*/
		String content = authNum;
		
		try {
			
			System.out.println("sendEmail try 진입. email : " + email);
			Properties props = new Properties();
			
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 587);
			props.put("mail.smtp.ssl.trust", host);
			props.put("mail.smtp.auth", "true");
			//props.put("mail.smtp.ssl.enable", "true"); 
			//props.put("mail.smtp.ssl.trust", "smtp.naver.com");

			System.out.println("Properties 선언  : " + props.toString());
			
			Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("pischa",password);
					}
			});
			
			System.out.println("session 선언 " + session.toString());
			
			
			
			Message msg = new MimeMessage(session);
			
			
			msg.setFrom(new InternetAddress(user));
			msg.setRecipient(Message.RecipientType.TO, new InternetAddress(to1));
			msg.setSubject("Confirm Mail");
			/*msg.setText(content);*/
			
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
					"  '우연'으로 부터 이메일 인증번호가 전송되었습니다.\n" + 
					"  <br><br>\n" + 
					"  \n" + 
					" 회원님의 <strong>인증번호</strong>는 <br><br>\n" + 
					"\n" + 
					"  &nbsp;   &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; [ <strong style=\"font-size:20px; color:#fd5d7c;\">"+content+"</strong> ]입니다.<br>\n" + 
					"<br>\n" + 
					"    *인증번호 칸에 입력해 주시길 바랍니다.<br>\n" + 
					"\n" + 
					"</p>\n" + 
					"<p style=\"text-align:center\"><a style=\"background: #fd5d7c; color: #ddd; padding: 10px 50px; border-radius: 3px;text-decoration:none;\" href=\"http://127.0.0.1:8080/\">확인</a>\n" + 
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
	}
	
	/*@RequestMapping( value="login", method=RequestMethod.POST )
	public ModelAndView login(@ModelAttribute("user") User user, HttpSession session, HttpServletRequest request) throws Exception{
		
		System.out.println("/user/login : GET");
	      
	      //Business Logic
	      User dbUser = new User();
	       
	      
	      ModelAndView modelAndView = new ModelAndView();
	      modelAndView.setViewName("redirect:/index.jsp");
	      
	      String Referer = request.getHeader("referer");
	      
	      String[] referarray = Referer.split("8080/");
	      System.out.println(referarray.length);
	      
	      if(referarray.length>1) {
	      String referer = Referer.split("8080/")[1];
	      System.out.println("refere ==="+Referer);
	      System.out.println("이것은 자른것"+referer);
	      System.out.println("userId : " + user.getUserId());
	      System.out.println("password : " + user.getPassword());

	      modelAndView.setViewName("redirect:/"+referer);
	      }
		
		//만일 유저가 없다면
		if(userService.getUser( user.getUserId()) == null) {
			System.out.println("가입되지 않은 아이디입니다.");
			modelAndView.addObject("result", "Fail");
			modelAndView.addObject("reason", "가입되지 않은 아이디입니다.");
			modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
		} else {
			System.out.println("유저정보 가져오기");
			dbUser=userService.getUser( user.getUserId());
		
			//만일 탈퇴한 유저라면
			if(dbUser.getUserState().equals("O")) {
				modelAndView.addObject("result", "Fail");
				modelAndView.addObject("reason", "탈퇴한 회원입니다. 다시 이용하고 싶으시면 계정을 복구해 주십시요.");
				modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
			//만일 블랙리스트라면
			} else if(dbUser.getUserGrade().equals("BLK")) {
				modelAndView.addObject("result", "Fail");
				modelAndView.addObject("reason", "블랙 리스트입니다. 다시 이용하고 싶으시면 새로운 이메일로 입력해 주십시요.");
				modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
			} else {
				//===========================================로그인 + 현제 접속자 구현 로직 part=================================================
				System.out.println("로그인 + 현제 접속자 구현 로직 part");
				ServletContext applicationScope = request.getSession().getServletContext();
				
				//String Ip = request.getRemoteAddr();
				
				
				String ip = request.getHeader("X-Forwarded-For");
				 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
				     ip = request.getHeader("Proxy-Client-IP"); 
				 } 
				 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
				     ip = request.getHeader("WL-Proxy-Client-IP"); 
				 } 
				 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
				     ip = request.getHeader("HTTP_CLIENT_IP"); 
				 } 
				 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
				     ip = request.getHeader("HTTP_X_FORWARDED_FOR"); 
				 } 
				 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
				     ip = request.getHeader("X-Real-IP"); 
				 } 
				 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
				     ip = request.getHeader("X-RealIP"); 
				 } 
				 if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) { 
				     ip = request.getRemoteAddr(); 
				 }
				
				
				List<String> ipLoginList = new ArrayList<String>();
				
				if(applicationScope.getAttribute("ipLoginList") != null) {
					ipLoginList = (List<String>)applicationScope.getAttribute("ipLoginList");
				}
				
				List<User> loginList = new ArrayList<User>();
				
				if(applicationScope.getAttribute("loginList") != null) {
					loginList = (List<User>) applicationScope.getAttribute("loginList");
				}
				
				int numberOfLogin = 0;
				
				if(applicationScope.getAttribute("numberOfLogin") != null) {
					numberOfLogin = (int) applicationScope.getAttribute("numberOfLogin");
				}
				
				boolean appendScope = false;
				
				System.out.println("현 접속자 중 지금 로그인 시도한 사람이 있습니까? ");
				boolean checkDe = false;
				for(int i = 0; i < loginList.size(); i++) {
					if(loginList.get(i).toString().equals(dbUser.toString())) {
						System.out.println("어 있엉~~~~~~~~~~~~~~~~~~~~~~~");
						System.out.println("두 사람의 IP가 동일합니까?");
						System.out.println("접속 시도자 IP : " + ip);
						System.out.println("기존 로그인 IP : " + ipLoginList.get(i));
						if(ipLoginList.get(i).equals(ip)) {
							System.out.println("같은 ip에서의 접근입니다. ");
						} else {
							System.out.println("다른 ip에서의 접근입니다. ");
							checkDe = true;
						}
					} else {
						appendScope = true;
					}
				}
				
				//비밀번호가 일치하는가?
				if(user.getPassword().equals(dbUser.getPassword())){
					//중복 로그인이 아닌가?
					if(!checkDe) {
						
						session.setAttribute("me", dbUser);
						
						//applicationScope에 올려도 되는가?
						if(appendScope || loginList.size() == 0) { 
							loginList.add(dbUser);
							
							numberOfLogin++;
							
							ipLoginList.add(ip);
							
							applicationScope.setAttribute("loginList", loginList);
							applicationScope.setAttribute("numberOfLogin", numberOfLogin);
							applicationScope.setAttribute("ipLoginList", ipLoginList);
						}
						for(User v : loginList) {
							System.out.println("현제 접속자 목록 : " + v);
						}
						for(String v : ipLoginList) {
							System.out.println("접속한 유저의 ip : " + v);
						}
						System.out.println("현제 접속자 : " + numberOfLogin);
						
						modelAndView.addObject("result", "Success");
						modelAndView.addObject(dbUser.getUserId(), dbUser);
						
						//=========================================출석체크 로직 구현 part===========================================
						int numAttendCount = dbUser.getAttendCount();
						Date lastLoginDate = dbUser.getLastLoginDay();
						System.out.println(dbUser.getUserId() + "의 마지막 로그인 날자 : " + lastLoginDate);
						
						java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
				
						System.out.println("현제 날짜(sql) : " + sqlDate);
						
						LocalDate lastLoginDateLocal = new Date(lastLoginDate.getTime()).toLocalDate();
						LocalDate sqlDateLocal = new Date(sqlDate.getTime()).toLocalDate();
						
						if(lastLoginDateLocal.isBefore(sqlDateLocal)) {
							System.out.println("다른날 접속입니다. 마지막 접속 : " + lastLoginDate + " 오늘 접속 : " + sqlDate + " 출석 횟수 : " + numAttendCount);
							
							dbUser.setLastLoginDay(sqlDate);
							numAttendCount++;
							dbUser.setAttendCount(numAttendCount);
							
							userService.attendLogin(dbUser);
							
							//==========================================등급 업!(일단 출석일로만)===================================
							if(numAttendCount == 2) {
								dbUser.setUserGrade("NOR");
								userService.updateGrade(dbUser);
							}
							if(numAttendCount == 20) {
								dbUser.setUserGrade("VIP");
								userService.updateGrade(dbUser);
							}
							//==============================================================================================
							
						} else {
							System.out.println("같은날 접속입니다. 마지막 접속 : " + lastLoginDate+ " 오늘 접속 : " + sqlDate);
						}
						
						//=======================================================================================================
						
					
					} else {
						
						
						
						modelAndView.addObject("reason", "이미 로그인된 계정입니다.");
						modelAndView.addObject("result", "Fail");
						modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
					}
					
				} else {
					System.out.println("비밀번호가 다릅니다.");
					modelAndView.addObject("reason", "비밀번호가 다릅니다.");
					modelAndView.addObject("result", "Fail");
					modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
				}
				//====================================================================================================
			}
		}
		return modelAndView;
	}*/
	
	
	
}



