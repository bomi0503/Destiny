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
		System.out.println("restController ���� ����. json/getUser/"+userId);
		Map<String, Object> map = new HashMap<String, Object>();
		
		User user = userService.getUser(userId);
		
		map.put("user", user);
		//������ ����
		user.setProfile(user.getProfile().replace("[", ""));
		user.setProfile(user.getProfile().replace("]", ""));
		String[] filelist = user.getProfile().split(", ");
		map.put("filelist", filelist);
		
		System.out.println("���� ����?");
		return map;
	}
	
	@RequestMapping(value="json/getUserByAndroid/{userId}", method=RequestMethod.GET)
	public User getUserByAndroid(@PathVariable String userId) throws Exception{
		System.out.println("restController ���� ����. json/getUserByAndroid/"+userId);
		User user = userService.getUser(userId);
		return user;
	}
	
	@RequestMapping(value="json/getUserByNickName/{nickName}", method=RequestMethod.GET)
	public Map<String, Object> getUserByNickName(@PathVariable String nickName, HttpSession session) throws Exception{
		System.out.println("restController ���� ����. json/getUserByNickName/"+nickName);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", userService.getUserByNickName(nickName));
		map.put("me", session.getAttribute("me"));
		System.out.println("���� ����?");
		return map;
	}
	
	@RequestMapping(value="json/getUserByEmail/{email}", method=RequestMethod.GET)
	public User getUserByEmail(@PathVariable("email") String email) throws Exception{
		System.out.println("�⺻ email : " + email);
		email += ".com";
		System.out.println("restController ���� ����. json/getUserByEmail/"+email);
		Map<String, Object> map = new HashMap<String, Object>();
		//map.put("user", userService.getUserByEmail(email));
		//map.put("me", session.getAttribute("me"));
		
		User user = new User();
		
		if(userService.getUserByEmail(email) != null) {
			user = userService.getUserByEmail(email);
		}
		
		System.out.println("���� ����?");
		return user;
	}
	
	@RequestMapping(value="json/getUserByPhone/{phone}", method=RequestMethod.GET)
	public Map<String, Object> getUserByPhone(@PathVariable String phone, HttpSession session) throws Exception{
		System.out.println("restController ���� ����. json/getUserByPhone/"+phone);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", userService.getUserByPhone(phone));
		//map.put("me", session.getAttribute("me"));
		System.out.println("���� ����?");
		return map;
	}
	
	@RequestMapping(value="json/getLocationList/{city}", method=RequestMethod.GET)
	public Map<String, Object> getLocationList(@PathVariable String city) throws Exception{
		System.out.println("restController ���� ����. json/getLocationList/"+city);
	
		System.out.println("���� ����?");
		
		Map<String, Object> map = userService.getLocationList(city);
		
		
		System.out.println("��");
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
        } else {  // ���� �߻�
            br = new BufferedReader(new InputStreamReader(con.getErrorStream(),"UTF-8"));
        }
		
		//JSON Data �б�
        String jsonData = "";
        StringBuffer response = new StringBuffer();
        
        while ((jsonData = br.readLine()) != null) {
            response.append(jsonData);
        }
        
        br.close();
        
        // Console Ȯ��
        System.out.println(response.toString());
        
        String returnString = response.toString();
        JSONObject answer = (JSONObject)JSONValue.parse(returnString);
        System.out.println("json���� �޸� answer : "  + answer);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("answer", answer);
		
		return map;
	}
	

	@RequestMapping(value="json/SMSAuth/{phone}", method=RequestMethod.POST)
	public Map SMSAuth(@PathVariable String phone, HttpSession session) throws Exception{
		System.out.println("SMSAuth ���� �Ϸ�. ���� �� ��ȣ : " + phone);
		
		String api_key = "NCSVNPXGDXR313KS";
		String api_secret = "J7K4C3WVID3LHZ4YUR6USDB9VBF8WMMU";
		Coolsms coolsms = new Coolsms(api_key, api_secret);
		
		String key = RandomNum();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("to", phone);
		map.put("from", "01086032406");
		map.put("text", "[�쿬] ����Ȯ�� ������ȣ [" + key + "] �� ȭ�鿡 �Է����ּ���.");
		map.put("type", "sms");
		
		System.out.println("�����������ϴ�?");
		
		Map reMap = new HashMap();
		
		JSONObject result = coolsms.send(map);
		if((boolean) result.get("status") == true) {
			System.out.println("����");
			System.out.println(result.get("group_id")); // �׷���̵�
			System.out.println(result.get("result_code")); // ����ڵ�
			System.out.println(result.get("result_message")); // ��� �޽���
			System.out.println(result.get("success_count")); // �޽������̵�
			System.out.println(result.get("error_count")); // ������ ������ ������ �޽��� ��
			reMap.put("authNum", key);
			reMap.put("result", "success");
		} else {
			System.out.println("����");
			System.out.println(result.get("code"));
			System.out.println(result.get("message"));
			reMap.put("result", "fail");
		}
			
		return reMap;
	}
	
	@RequestMapping(value="json/emailAuth/{email}", method=RequestMethod.POST)
	public Map emailAuth(@PathVariable String email, HttpSession session) throws Exception {
		System.out.println("emailAuth ���� �Ϸ�");
		//String email = request.getParameter("email");

		String authNum = "";
		email += ".com";
		System.out.println("�̸��� ȹ�� : " + email);
		
		authNum = RandomNum();
		System.out.println("���� �ż��� ���� : " +  authNum);
		
		sendEmail(email.toString().trim(), authNum);
		System.out.println("sendEmail �޼��� ����");
		
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
		String subject = "�������� ����";
		String fromName = "pischa";
		String from = "ABC";
		String to1 = email;
		
		String user = "pischa@naver.com";
		String password = "sunnydays15358";

		
		/*String content = "������ȣ�� �Է��Ͽ� �ּ���. ������ȣ ["+authNum+"]";*/
		String content = authNum;
		
		try {
			
			System.out.println("sendEmail try ����. email : " + email);
			Properties props = new Properties();
			
			props.put("mail.transport.protocol", "smtp");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 587);
			props.put("mail.smtp.ssl.trust", host);
			props.put("mail.smtp.auth", "true");
			//props.put("mail.smtp.ssl.enable", "true"); 
			//props.put("mail.smtp.ssl.trust", "smtp.naver.com");

			System.out.println("Properties ����  : " + props.toString());
			
			Session session = Session.getInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("pischa",password);
					}
			});
			
			System.out.println("session ���� " + session.toString());
			
			
			
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
					"�ȳ��ϼ���!<br><br>\n" + 
					"<strong style=\"font-size:20px;\">�쿬</strong>�� �پ��� ���Ӱ�, �̻����� ���� �� �ִ� Ȩ�������Դϴ�.<br>\n" + 
					"<br>\n" + 
					"  '�쿬'���� ���� �̸��� ������ȣ�� ���۵Ǿ����ϴ�.\n" + 
					"  <br><br>\n" + 
					"  \n" + 
					" ȸ������ <strong>������ȣ</strong>�� <br><br>\n" + 
					"\n" + 
					"  &nbsp;   &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; &nbsp;  &nbsp;  &nbsp;  &nbsp;  &nbsp; [ <strong style=\"font-size:20px; color:#fd5d7c;\">"+content+"</strong> ]�Դϴ�.<br>\n" + 
					"<br>\n" + 
					"    *������ȣ ĭ�� �Է��� �ֽñ� �ٶ��ϴ�.<br>\n" + 
					"\n" + 
					"</p>\n" + 
					"<p style=\"text-align:center\"><a style=\"background: #fd5d7c; color: #ddd; padding: 10px 50px; border-radius: 3px;text-decoration:none;\" href=\"http://127.0.0.1:8080/\">Ȯ��</a>\n" + 
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
			
			
			System.out.println("msg ���� : " + msg.toString());
			
			Transport.send(msg);

			
		} catch(MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="json/getTypeList", method=RequestMethod.GET)
	public Map<String, Object> getTypeList() throws Exception{
		System.out.println("restController ���� ����. json/getTypeList/");
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user", userService.getTypeList());
		
		System.out.println("type map list�� : "+map);
		
		return map;
	}
	
}



