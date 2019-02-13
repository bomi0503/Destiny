package com.destiny.web.user;

import java.io.File;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.common.Search;
import com.destiny.service.domain.User;
import com.destiny.service.letter.LetterService;
import com.destiny.service.user.UserService;
import com.destiny.common.Page;



@Controller
@RequestMapping("/user/*")
public class UserController {
	
	//Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	
	@Autowired
	@Qualifier("letterServiceImpl")
	private LetterService letterService;
	
	public UserController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	@RequestMapping( value="login", method=RequestMethod.GET )
	public ModelAndView login() throws Exception{
		
		System.out.println("/user/login : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/userInfo/loginView.jsp");

		return modelAndView;
	}
	
	@RequestMapping( value="login", method=RequestMethod.POST )
	public ModelAndView login(@ModelAttribute("user") User user, HttpSession session, HttpServletRequest request) throws Exception{

		System.out.println("/user/login : POST");
		
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
		System.out.println("�̰��� �ڸ���"+referer);
		System.out.println("userId : " + user.getUserId());
		System.out.println("password : " + user.getPassword());

		modelAndView.setViewName("redirect:/"+referer);
		}
		
		//���� ������ ���ٸ�
		if(userService.getUser( user.getUserId()) == null) {
			System.out.println("���Ե��� ���� ���̵��Դϴ�.");
			modelAndView.addObject("result", "Fail");
			modelAndView.addObject("reason", "���Ե��� ���� ���̵��Դϴ�.");
			modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
		} else {
			System.out.println("�������� ��������");
			dbUser=userService.getUser( user.getUserId());
		
			//���� Ż���� �������
			if(dbUser.getUserState().equals("O")) {
				modelAndView.addObject("result", "Fail");
				modelAndView.addObject("reason", "Ż���� ȸ���Դϴ�. �ٽ� �̿��ϰ� �����ø� ������ ������ �ֽʽÿ�.");
				modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
			//���� ������Ʈ���
			} else if(dbUser.getUserGrade().equals("BLK")) {
				modelAndView.addObject("result", "Fail");
				modelAndView.addObject("reason", "�� ����Ʈ�Դϴ�. �ٽ� �̿��ϰ� �����ø� ���ο� �̸��Ϸ� �Է��� �ֽʽÿ�.");
				modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
			} else {
				//===========================================�α��� + ���� ������ ���� ���� part=================================================
				System.out.println("�α��� + ���� ������ ���� ���� part");
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
				
				System.out.println("�� ������ �� ���� �α��� �õ��� ����� �ֽ��ϱ�? ");
				boolean checkDe = false;
				for(int i = 0; i < loginList.size(); i++) {
					if(loginList.get(i).toString().equals(dbUser.toString())) {
						System.out.println("�� �־�~~~~~~~~~~~~~~~~~~~~~~~");
						System.out.println("�� ����� IP�� �����մϱ�?");
						System.out.println("���� �õ��� IP : " + ip);
						System.out.println("���� �α��� IP : " + ipLoginList.get(i));
						if(ipLoginList.get(i).equals(ip)) {
							System.out.println("���� ip������ �����Դϴ�. ");
						} else {
							System.out.println("�ٸ� ip������ �����Դϴ�. ");
							checkDe = true;
						}
					} else {
						appendScope = true;
					}
				}
				
				//��й�ȣ�� ��ġ�ϴ°�?
				if(user.getPassword().equals(dbUser.getPassword())){
					//�ߺ� �α����� �ƴѰ�?
					if(!checkDe) {
						
						session.setAttribute("me", dbUser);
						int notRead = letterService.getCountNetReadReceive(((User)session.getAttribute("me")).getUserId());
						session.setAttribute("notRead", notRead);
						
						//applicationScope�� �÷��� �Ǵ°�?
						if(appendScope || loginList.size() == 0) { 
							loginList.add(dbUser);
							
							numberOfLogin++;
							
							ipLoginList.add(ip);
							
							applicationScope.setAttribute("loginList", loginList);
							applicationScope.setAttribute("numberOfLogin", numberOfLogin);
							applicationScope.setAttribute("ipLoginList", ipLoginList);
						}
						for(User v : loginList) {
							System.out.println("���� ������ ��� : " + v);
						}
						for(String v : ipLoginList) {
							System.out.println("������ ������ ip : " + v);
						}
						System.out.println("���� ������ : " + numberOfLogin);
						
						modelAndView.addObject("result", "Success");
						modelAndView.addObject(dbUser.getUserId(), dbUser);
						
						//=========================================�⼮üũ ���� ���� part===========================================
						int numAttendCount = dbUser.getAttendCount();
						Date lastLoginDate = dbUser.getLastLoginDay();
						System.out.println(dbUser.getUserId() + "�� ������ �α��� ���� : " + lastLoginDate);
						
						java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
				
						System.out.println("���� ��¥(sql) : " + sqlDate);
						
						LocalDate lastLoginDateLocal = new Date(lastLoginDate.getTime()).toLocalDate();
						LocalDate sqlDateLocal = new Date(sqlDate.getTime()).toLocalDate();
						
						if(lastLoginDateLocal.isBefore(sqlDateLocal)) {
							System.out.println("�ٸ��� �����Դϴ�. ������ ���� : " + lastLoginDate + " ���� ���� : " + sqlDate + " �⼮ Ƚ�� : " + numAttendCount);
							
							dbUser.setLastLoginDay(sqlDate);
							numAttendCount++;
							dbUser.setAttendCount(numAttendCount);
							
							userService.attendLogin(dbUser);
							
							//==========================================��� ��!(�ϴ� �⼮�Ϸθ�)===================================
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
							System.out.println("������ �����Դϴ�. ������ ���� : " + lastLoginDate+ " ���� ���� : " + sqlDate);
						}
						
						//=======================================================================================================
						
					
					} else {
						
						
						
						modelAndView.addObject("reason", "�̹� �α��ε� �����Դϴ�.");
						modelAndView.addObject("result", "Fail");
						modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
					}
					
				} else {
					System.out.println("��й�ȣ�� �ٸ��ϴ�.");
					modelAndView.addObject("reason", "��й�ȣ�� �ٸ��ϴ�.");
					modelAndView.addObject("result", "Fail");
					modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
				}
				//====================================================================================================
			}
		}
		return modelAndView;
	}
	
	@RequestMapping(value="logout/{userId}" , method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session, HttpServletRequest request, @PathVariable String userId) throws Exception{
		
		System.out.println("/user/logout : GET");
		
		session.invalidate();
		
		//========================================���� �����ڿ��� �ش� ȸ�� remove, �����ڼ� update====================================
		ServletContext applicationScope = request.getSession().getServletContext();
		List<User> loginList = new ArrayList<User>();
		
		if(applicationScope.getAttribute("loginList") != null) {
			loginList = (List<User>) applicationScope.getAttribute("loginList");
		}
		
		List<String> ipLoginList = new ArrayList<String>();
		
		if(applicationScope.getAttribute("ipLoginList") != null) {
			ipLoginList = (List<String>) applicationScope.getAttribute("ipLoginList");
		}
		
		User user = userService.getUser(userId);
		
		for(int i = 0; i < loginList.size(); i++) {
			if(loginList.get(i).toString().equals(user.toString())) {
				System.out.println("�� �־�~~~~~~~~~~~~~~~~~~~~~~~");
				loginList.remove(i);
				ipLoginList.remove(i);
			}
		}
		
		//loginList.remove(user);
		
		int numberOfLogin = 0;
		
		if(applicationScope.getAttribute("numberOfLogin") != null) {
			numberOfLogin = (int) applicationScope.getAttribute("numberOfLogin");
		}
		
		numberOfLogin--;
		
		applicationScope.setAttribute("loginList", loginList);
		applicationScope.setAttribute("numberOfLogin", numberOfLogin);
		applicationScope.setAttribute("ipLoginList", ipLoginList);
		//==================================================================================================================
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/index.jsp");
		
		return modelAndView;
	}
	
	@RequestMapping(value="addUser", method=RequestMethod.GET)
	public ModelAndView addUser() throws Exception{
		System.out.println("/user/addUser : GET");
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/userInfo/addUserView.jsp");
		return modelAndView;
	}
	
	@RequestMapping(value="addUser", method=RequestMethod.POST)
	public ModelAndView addUser(@ModelAttribute("user") User user, @RequestParam("uploadFile")MultipartFile profileName) throws Exception{
		System.out.println("/user/addUser : POST");
		
		System.out.println("������ user���� : " + user);
		ModelAndView modelAndView = new ModelAndView();
		
		//=====================Ż���� ȸ������ ��ȸ�ؼ� Ż���� ȸ���̸� �ű�ȸ������ ��ȯ=========================
	
		if(userService.getUser(user.getUserId()) != null) {
			/*User dbUser = userService.getUser(user.getUserId());
			if(user.getUserState().equals("O")) {
				user.setUserState("I");
				userService.updateState(user);
				user.setUserGrade("NEW");
				userService.updateGrade(user);
			}*/
		} else {
			
			String name = "";
			
			if(profileName.getOriginalFilename() == "") {
				System.out.println("�̹��� ����");
				user.setProfile("basic.gif");
			}else {
				System.out.println("profileName : " + profileName);
				
				/*�������̹��� ���ε� : start*/
				String path = "C:\\Users\\Bit\\git\\Destiny\\Destiny\\WebContent\\resources\\images\\userprofile\\";
				name = System.currentTimeMillis()+"."+profileName.getOriginalFilename().split("\\.")[1];
				
				System.out.println("profilenameName : " + name);
				
				File file = new File(path + name);

				profileName.transferTo(file);
				/*�������̹��� ���ε� : end*/
				
				user.setProfile(name);
			}
			
			userService.addUser(user);
			
		}

		modelAndView.setViewName("redirect:/index.jsp");

		
		
		return modelAndView;
	}
	
	@RequestMapping(value="getUserView", method=RequestMethod.GET)
	public ModelAndView getUserView(HttpSession session) throws Exception{
		
		int notRead = letterService.getCountNetReadReceive(((User)session.getAttribute("me")).getUserId());
		session.setAttribute("notRead", notRead);
		
		ModelAndView modelAndView = new ModelAndView();
		/*modelAndView.setViewName("forward:/layout/header.jsp");*/
		modelAndView.setViewName("forward:/user/userInfo/getUserView.jsp");
		modelAndView.addObject("me", session.getAttribute("me"));
		modelAndView.addObject("notRead", notRead);
		return modelAndView;
	}
	
	@RequestMapping(value="getUser/{userId}", method=RequestMethod.GET)
	public ModelAndView getUser(@PathVariable("userId") String userId) throws Exception {
		
		System.out.println("/user/getUser");
		
		User user = userService.getUser(userId);
		
		//������ ����
		/*user.setProfile(user.getProfile().replace("[", ""));
		user.setProfile(user.getProfile().replace("]", ""));
		String[] filelist = user.getProfile().split(", ");*/
		
		
		//���ɻ� ��������
		int[] interestNo = new int[3];
		interestNo[0] = user.getFirstInterest();
		interestNo[1] = user.getSecondInterest();
		interestNo[2] = user.getThirdInterest();
		
		List<String> interestList = userService.getInterestByUser(interestNo);
		
		//�������� �� �̹��� ���� ��������
		int[] typeNo = new int[4];
		typeNo[0] = user.getMyType();
		typeNo[1] = user.getFirstType();
		typeNo[2] = user.getSecondType();
		typeNo[3] = user.getThirdType();
		
		Map<String, Object> typeMap = userService.getTypeByUser(typeNo);
		
		String myTypeFile = (String) typeMap.get("myType") + ".png";
		List<String> typeFileList = new ArrayList<String>();
		typeFileList.add((String) typeMap.get("firstType") + ".png");
		typeFileList.add((String) typeMap.get("secondType") + ".png");
		typeFileList.add((String) typeMap.get("thirdType") + ".png");
		
		Map<String, Object> typeFileMap = new HashMap<String, Object>();
		typeFileMap.put("myTpyeFile", myTypeFile);
		typeFileMap.put("typeFileList", typeFileList);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userInfo/getUser.jsp");
		modelAndView.addObject("user", user);
		/*modelAndView.addObject("filelist", filelist);*/
		modelAndView.addObject("interestList", interestList);
		modelAndView.addObject("typeMap", typeMap);
		modelAndView.addObject("typeFileMap", typeFileMap);
		return modelAndView;
	}
	
	@RequestMapping(value="getUserByNickName/{nickName}", method=RequestMethod.GET)
	public ModelAndView getUserByNickName(@PathVariable("nickName") String nickName) throws Exception {
		
		System.out.println("/user/getUserByNickName");
		
		User user = userService.getUserByNickName(nickName);
		
		//������ ����
		user.setProfile(user.getProfile().replace("[", ""));
		user.setProfile(user.getProfile().replace("]", ""));
		String[] filelist = user.getProfile().split(", ");
		
		//���ɻ� ��������
		int[] interestNo = new int[3];
		interestNo[0] = user.getFirstInterest();
		interestNo[1] = user.getSecondInterest();
		interestNo[2] = user.getThirdInterest();
		
		List<String> interestList = userService.getInterestByUser(interestNo);
		
		//�������� �� �̹��� ���� ��������
		int[] typeNo = new int[4];
		typeNo[0] = user.getMyType();
		typeNo[1] = user.getFirstType();
		typeNo[2] = user.getSecondType();
		typeNo[3] = user.getThirdType();
		
		Map<String, Object> typeMap = userService.getTypeByUser(typeNo);
		
		String myTypeFile = (String) typeMap.get("myType") + ".JPG";
		List<String> typeFileList = new ArrayList<String>();
		typeFileList.add((String) typeMap.get("firstType") + ".JPG");
		typeFileList.add((String) typeMap.get("secondType") + ".JPG");
		typeFileList.add((String) typeMap.get("thirdType") + ".JPG");
		
		Map<String, Object> typeFileMap = new HashMap<String, Object>();
		typeFileMap.put("myTpyeFile", myTypeFile);
		typeFileMap.put("typeFileList", typeFileList);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userInfo/getUser.jsp");
		modelAndView.addObject("user", user);
		modelAndView.addObject("filelist", filelist);
		modelAndView.addObject("interestList", interestList);
		modelAndView.addObject("typeMap", typeMap);
		modelAndView.addObject("typeFileMap", typeFileMap);
		return modelAndView;
	}
	
	@RequestMapping(value="updateUser/{userId}", method=RequestMethod.GET)
	public ModelAndView updateUser(@PathVariable String userId) throws Exception{
		
		User user = userService.getUser(userId);
		
		//���� ��/��  - ��/�� ���� Ȯ��
		List<String> location = new ArrayList<String>();
		location.add(user.getAddress().split(" ")[0]);
		location.add(user.getAddress().split(" ")[1]);
		
		//�� ��ȣ ���� Ȯ��
		List<String> phone = new ArrayList<String>();
		phone.add(user.getPhone().split("-")[0]);
		phone.add(user.getPhone().split("-")[1]);
		phone.add(user.getPhone().split("-")[2]);
		
		//������ ���� ����
		/*List<String> profile = new ArrayList<String>();
		for(String v : user.getProfile().split(", ")) {
			profile.add(v);
		}*/
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userInfo/updateUser.jsp");
		modelAndView.addObject("user", user);
		modelAndView.addObject("location", location);
		modelAndView.addObject("phone", phone);
		/*modelAndView.addObject("filelist", profile);*/
		
		return modelAndView;
	}
	
	@RequestMapping(value="updateUserResult", method=RequestMethod.POST)
	public ModelAndView updateUserResult(@ModelAttribute("user") User user, @RequestParam("uploadFile")MultipartFile profileName, HttpServletRequest request) throws Exception{
		System.out.println("user/updateUserResult POST ������ user���� : " + user);
		
		/* ===================== */
		String name="";
				
				if(profileName.getOriginalFilename() == "") {
					//name = communityService.getCommunity(communityNo).getFileName();
					name = userService.getUser(user.getUserId()).getProfile();
					System.out.println("name��?? : " + name);
				}else {
					/*��ǥ�̹��� ���ε� : start*/
					String path = "C:\\Users\\Bit\\git\\Destiny\\Destiny\\WebContent\\resources\\images\\userprofile\\";
					name = System.currentTimeMillis()+"."+profileName.getOriginalFilename().split("\\.")[1];
					System.out.println("name : " + name);
					File file = new File(path + name);
					
					profileName.transferTo(file);
					/*��ǥ�̹��� ���ε� : end*/
					
					
				}
		/* ===================== */
		user.setProfile(name);
		
		userService.updateUser(user);
		User reUser = userService.getUser(user.getUserId());
		
		
		//���ɻ� ��������
		int[] interestNo = new int[3];
		interestNo[0] = reUser.getFirstInterest();
		interestNo[1] = reUser.getSecondInterest();
		interestNo[2] = reUser.getThirdInterest();
		
		List<String> interestList = userService.getInterestByUser(interestNo);
		
		//�������� �� �̹��� ���� ��������
		int[] typeNo = new int[4];
		typeNo[0] = reUser.getMyType();
		typeNo[1] = reUser.getFirstType();
		typeNo[2] = reUser.getSecondType();
		typeNo[3] = reUser.getThirdType();
		
		Map<String, Object> typeMap = userService.getTypeByUser(typeNo);
		
		String myTypeFile = (String) typeMap.get("myType") + ".JPG";
		List<String> typeFileList = new ArrayList<String>();
		typeFileList.add((String) typeMap.get("firstType") + ".JPG");
		typeFileList.add((String) typeMap.get("secondType") + ".JPG");
		typeFileList.add((String) typeMap.get("thirdType") + ".JPG");
		
		Map<String, Object> typeFileMap = new HashMap<String, Object>();
		typeFileMap.put("myTpyeFile", myTypeFile);
		typeFileMap.put("typeFileList", typeFileList);
		
		ModelAndView modelAndView = new ModelAndView();
		/*modelAndView.setViewName("forward:/user/userInfo/getUser.jsp");*/
		modelAndView.setViewName("redirect:/user/getUser/"+user.getUserId());
		modelAndView.addObject("user", reUser);
		/*modelAndView.addObject("filelist", filelist);*/
		modelAndView.addObject("interestList", interestList);
		modelAndView.addObject("typeMap", typeMap);
		modelAndView.addObject("typeFileMap", typeFileMap);
		return modelAndView;
	}
	
	@RequestMapping(value="addTypeView/{userId}", method=RequestMethod.GET)
	public ModelAndView addTypeView(@PathVariable String userId) throws Exception{
		
		System.out.println("/user/addTypeView : GET");
		
		User user = userService.getUser(userId);
		
		int[] userList = new int[4];
		userList[0] = user.getMyType();
		userList[1] = user.getFirstType();
		userList[2] = user.getSecondType();
		userList[3] = user.getThirdType();
		
		List<String> list = userService.getTypeList();
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userInfo/addTypeView.jsp");
		modelAndView.addObject("list", list);
		modelAndView.addObject("userList", userList);
		return modelAndView;
	}
	
	@RequestMapping(value="addType", method=RequestMethod.POST)
	public ModelAndView addType(@ModelAttribute("user") User user, HttpSession session) throws Exception{
		
		System.out.println("/user/addType POST ������ user : " + user);
		
		user.setUserId(((User)session.getAttribute("me")).getUserId());
		
		userService.updateType(user);
		 
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/user/getUser/"+user.getUserId());
		return modelAndView;		
	}
	
	@RequestMapping(value="listUser", method=RequestMethod.GET)
	public ModelAndView listUser(@ModelAttribute("search") Search search) throws Exception{
		
		System.out.println("/user/listUser : GET");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);

		// Business logic ����
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/userInfo/getListUser.jsp");
		modelAndView.addObject("list",  map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		return modelAndView;
	}
	
	@RequestMapping(value="leaveSite", method=RequestMethod.GET)
	public ModelAndView leaveSite(HttpSession session) throws Exception{
		
		String userId = ( (User)session.getAttribute("me") ).getUserId();
		
		System.out.println("/user/leaveSite/{"+userId+"}");
		
		User user = userService.getUser(userId);
		
		user.setUserState("O");
		userService.updateState(user);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("forward:/user/logout/"+userId);
		return modelAndView;
	}
	
	@RequestMapping(value="getBackSite/{userId}/{email}", method=RequestMethod.GET)
	public ModelAndView getBackSite(@PathVariable("userId") String userId, 
									@PathVariable("email") String email) throws Exception{
		System.out.println("getBackSite : GET : " + userId + " + " + email);
		ModelAndView modelAndView = new ModelAndView();
		email += ".com";
		if(userService.getUser(userId) != null) {
			User user = userService.getUser(userId);
			
			if(user.getEmail().equals(email)) {
		
				user.setUserState("I");
				userService.updateState(user);
				user.setUserGrade("NEW");
				userService.updateGrade(user);
				
				user.setAttendCount(1);
				user.setLastLoginDay(new java.sql.Date(new java.util.Date().getTime()));
				userService.attendLogin(user);
				
				
				modelAndView.addObject("reason", "������ �����Ǿ����ϴ�. �ٽ� �α������ּ���.");
				modelAndView.setViewName("redirect:/index.jsp");
			} else {
				modelAndView.addObject("reason", "�̸����� �ùٸ��� �ʽ��ϴ�.");
				modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
			}
		} else {
			modelAndView.addObject("reason", "���̵� �ùٸ��� �ʽ��ϴ�.");
			modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
		}
		return modelAndView;
	}
	
	@RequestMapping(value="findId/{email}", method=RequestMethod.GET)
	public ModelAndView findId(@PathVariable("email") String email) throws Exception{
		System.out.println("user/findId/"+email);
		ModelAndView modelAndView = new ModelAndView();
		email += ".com";
		
		if(userService.getUserByEmail(email) != null) {
			User user = userService.getUserByEmail(email);
			modelAndView.addObject("reason", "����� ���̵��  ["+user.getUserId()+"] �Դϴ�.");
			
			modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
		} else {
			modelAndView.addObject("reason", "notFound");
			modelAndView.setViewName("redirect:/user/userInfo/findId.jsp");
		}
		
		return modelAndView;
	}
	
	@RequestMapping(value="updatePassword/{userId}", method=RequestMethod.GET)
	public ModelAndView updatePassword(@PathVariable("userId") String userId) throws Exception{
		System.out.println("user/updatePassword/"+userId);
		ModelAndView modelAndView = new ModelAndView();
		
		User user = new User();
		if(userService.getUser(userId) != null) {
			user = userService.getUser(userId);
		}
		
		modelAndView.setViewName("forward:/user/userInfo/updatePasswordSecond.jsp");
		modelAndView.addObject("user", user);
		
		return modelAndView;
	}
	
	@RequestMapping(value="updatePasswordSecond/{userId}/{password}", method=RequestMethod.GET)
	public ModelAndView updatePasswordSecond(@PathVariable("userId") String userId,
											@PathVariable("password") String password) throws Exception{
		
		System.out.println("user/updatePasswordSecond/"+userId);
		ModelAndView modelAndView = new ModelAndView();
		
		User user = new User();
		if(userService.getUser(userId) != null) {
			user = userService.getUser(userId);
		}
		
		user.setPassword(password);
		userService.updatePassword(user);
		
		modelAndView.setViewName("forward:/user/userInfo/loginDe.jsp");
		modelAndView.addObject("reason", "��й�ȣ�� ���������� ����Ǿ����ϴ�. �ٽ� �α������ּ���.");
		
		return modelAndView;
	}
	
}
