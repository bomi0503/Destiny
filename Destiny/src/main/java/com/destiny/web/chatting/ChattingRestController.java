package com.destiny.web.chatting;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.codehaus.jackson.map.ext.JodaDeserializers.PeriodDeserializer;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.JSONValue;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.service.chatting.ChattingService;
import com.destiny.service.domain.Chatting;
import com.destiny.service.domain.Telepathy;
import com.destiny.service.domain.User;
import com.destiny.service.user.UserService;

@RestController
@RequestMapping("/chatting/*")
public class ChattingRestController {
	/// Field

	@Autowired
	@Qualifier("chattingServiceImpl")
	private ChattingService chattingService;

	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;

	//// ���� ����Ʈ�� ���� ����Ʈ�� ���� ��ü ����
	private List<User> womanList = new ArrayList<User>();
	private List<User> manList = new ArrayList<User>();
	private List<User> perfectWomanList = new ArrayList<User>();
	private List<User> perfectManList = new ArrayList<User>();
	private List<Chatting> chattingList = new ArrayList<Chatting>();
	private List<Chatting> perfectMatchingResult = new ArrayList<Chatting>();
	private int no;
	private int perfectNo;
	private List<Telepathy> telepathyList = new ArrayList<Telepathy>();
	private int count;
	private String file;
	@ResponseBody
	@RequestMapping(value = "json/translate", method = RequestMethod.POST)

	public String chatGoogleTranslatePOST(@RequestBody JSONObject body, HttpSession session) throws Exception {
		System.out.println("chat ����");
		System.out.println(body);
		// userId ������
		User user = (User) session.getAttribute("me");
		String userId = user.getUserId();
		System.out.println("userId : " + userId);
		session.setAttribute("chat", userId);
		System.out.println("session�� �����value : " + session.getAttribute("chat"));

		String q = (String) body.get("message");

		String query = URLEncoder.encode(q, "UTF-8");
		// ���� �ޱ� ���ϴ� ���

		String target = (String) body.get("lang");
		// google translate api key
		String key = "AIzaSyBFXIiBAU7QfCf0fwndqoR63wwS0P8kNDM";

		//// ���߿� ���� 20���� ���� ���̸� �ٷ� ���� �� �̻���̸� �������->��->target���/////////////////////
		// int textLength=q.length();
		// if (textLength>20) {
		// 000+
		// }else {
		//
		// }

		/////////////////////////////////////////////////////////////////////////
		// google�� ���� ��û
		String googleApi = "https://translation.googleapis.com/language/translate/v2?q=" + query + "&target=" + target
				+ "&model=nmt&key=" + key;

		URL url = new URL(googleApi);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("POST");

		// post request

		con.setDoOutput(true);
		DataOutputStream wr = new DataOutputStream(con.getOutputStream());

		wr.flush();
		wr.close();
		int responseCode = con.getResponseCode();
		BufferedReader br;
		if (responseCode == 200) { // ���� ȣ��
			br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		} else { // ���� �߻�
			br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
		}
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		JSONObject jsonobj = (JSONObject) JSONValue.parse(response.toString());
		System.out.println("����� : " + jsonobj.get("data").toString());

		br.close();

		/// ������ Text ������////////////////////////////

		JSONObject data = (JSONObject) jsonobj.get("data");
		JSONArray translations = (JSONArray) data.get("translations");
		JSONObject translationsArr = (JSONObject) translations.get(0);
		String transText = (String) translationsArr.get("translatedText");

		System.out.println("translations" + (String) translations.toString());
		System.out.println("translationsArr :" + translations.get(0).toString());
		System.out.println("������ text :" + transText);
		///////////////////////////////////////
		return transText;
	}

	@RequestMapping(value = "json/addPerfectChatting", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> addPerfectChatting(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("json/addPerfectChatting ����");

		// ===========================================���� ������ ���� ����
		// part=================================================

		Chatting chatting = new Chatting();
		ServletContext applicationScope = request.getSession().getServletContext();
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("me");
		System.out.println("user" + user);
		ModelAndView modelAndView = new ModelAndView();
		//// user���α��� �� ���

		//// ���̵�� user������ �����´�.
		User dbUser = userService.getUser(user.getUserId());

		///// ������ ���
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("perfectWomanList") != null) {
				perfectWomanList = (List<User>) applicationScope.getAttribute("perfectWomanList");
			}
			perfectWomanList.add(dbUser);

			applicationScope.setAttribute("perfectWomanList", perfectWomanList);

			for (User v : perfectWomanList) {
				System.out.println("���� �̻��� ä�� ���� ������ ��� : " + v);

			}
		} else {
			// ������ ���
			if (applicationScope.getAttribute("perfectManList") != null) {
				perfectManList = (List<User>) applicationScope.getAttribute("perfectManList");
			}
			perfectManList.add(dbUser);

			applicationScope.setAttribute("perfectManList", perfectManList);

			for (User v : perfectManList) {
				System.out.println("����  �̻��� ä�� ���� ������ ��� : " + v);
			}
		}

		System.out.println("perfectManList.size() : " + perfectManList.size() + "perfectWomanList.size() : "
				+ perfectWomanList.size());
		System.out.println("perfectManList : " + perfectManList + "perfectWomanList : " + perfectWomanList);

		map.put("perfectManList", perfectManList);
		map.put("perfectWomanList", perfectWomanList);

		// ====================================================================================================

		// user�� ���̵��ʿ� ������ ��������, �̻��� ������ ���� ��Ī

		return map;
	}

	@RequestMapping(value = "json/getPerfectMatching", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getPerfectMatching(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("json/getPerfectMatching ����");

		Chatting chatting = new Chatting();
		Chatting resultChatting = new Chatting();
		Map<String, Object> map = new HashMap<String, Object>();
		ServletContext applicationScope = request.getSession().getServletContext();
		User user = (User) session.getAttribute("me");
		System.out.println("user" + user);
		String userId = user.getUserId();
		int myType = user.getMyType();// ���� ��������
		int myFirstType = user.getFirstType();// ���� �̻��� ����1
		int mySecondType = user.getSecondType();// ���� �̻��� ����2
		int myThirdType = user.getThirdType();//// ���� �̻��� ����3
		String partnerId = "";
		String man = null;
		String woman = null;
		int roomNo = 0;
		//// user���α��� �� ���

		//// ���̵�� user������ �����´�.

		if (applicationScope.getAttribute("perfectMatchingResult") != null) {
			perfectMatchingResult = (List<Chatting>) applicationScope.getAttribute("perfectMatchingResult");

		}

		int j = 0;
		boolean result = perfectMatchingResult.size() > j;

		System.out.println("perfectManList.size() : " + perfectManList.size() + "perfectWomanList.size() : "
				+ perfectWomanList.size());
		System.out.println("perfectManList : " + perfectManList + "perfectWomanList : " + perfectWomanList);

		//// ��Ī�� ���� 1�� �̻��� ��츸
		//// ����///////////////////////////////////////////////////////////////////
		if (perfectWomanList.size() > 0 && perfectManList.size() > 0) {
			boolean partnerResult = false;
			boolean myResult = false;

			System.out.println("��Ī�� ���� ���� ���");
			// ��Ī ���� ��� ��Ī����
			System.out.println("��Ī���� �� �� 1�� �̻�");
			///// ������ ���
			if (user.getGender().equals("W")) {
				if (applicationScope.getAttribute("perfectWomanList") != null) {
					perfectWomanList = (List<User>) applicationScope.getAttribute("perfectWomanList");
				}
				if (applicationScope.getAttribute("perfectManList") != null) {
					perfectManList = (List<User>) applicationScope.getAttribute("perfectManList");
				}

				System.out.println("������ ���");
				// �̻��� ��Ī ����
				partnerResult = false;
				myResult = false;
				int i = 0;
				while (!myResult && perfectManList.size() > i) {

					System.out.println("while�� ��");
					/// ����///////////////////////////
					int partnerType = perfectManList.get(i).getMyType(); // ������ ����
					int partnerFirstType = perfectManList.get(i).getFirstType();// ������ �̻��� ����1
					int partnerSecondType = perfectManList.get(i).getSecondType();// ������ �̻��� ����2
					int partnerThirdType = perfectManList.get(i).getThirdType();// ������ �̻��� ����3

					// ��Ʈ�ʰ� �� �̻������� �Ǵ�//////////////////////////////////////////
					partnerResult = (partnerType == myFirstType); // ������ ������ �� ù��° �̻��������� ���

					if (!partnerResult) {
						partnerResult = (partnerType == mySecondType);// �ι�° �̻����ϰ��
					} else if (!partnerResult) {
						partnerResult = (partnerType == myThirdType);// ����° �̻����ϰ��
					}
					System.out.println("���� �̻����� �����ϴ°� ? " + partnerResult);// true�� �̻��� false�� �̻����ƴ�
					//////////////////////////////////////////////////
					// ��Ʈ���� �̻����� ���� �´��� �Ǵ�/////////////////////////////////////////////////
					if (partnerResult) {
						int[] partnerWantType = { partnerFirstType, partnerSecondType, partnerThirdType }; // ���� �̻���
																											// ����3��

						myResult = Arrays.stream(partnerWantType).anyMatch(b -> b == myType); // ���� ����
						System.out.println("������ �̻����� �����ϴ°� ? " + myResult);// ���� ������ �̻����� ���ԵǴ��� ����

					}
					System.out.println("partnerResult : " + partnerResult + "  myResult : " + myResult); // �Ѵ� true������
					// ��Ī�Ϸ�� ���� ���̵� ����
					if (myResult) {

						// return userId;
						partnerId = perfectManList.get(i).getUserId();// ��Ī�� ���� ���̵�
						man = partnerId;
						woman = userId;
						chatting.setManId(man);
						chatting.setWomanId(woman);
						chatting.setContactMeeting("N");
						// addChatting
						System.out.println(" ��Ī �Ϸ� man  : " + man + "  woman : " + woman);

						chattingService.addPerfectChatting(chatting);

						// ����� ����Ʈ���� ����
						for (int k = 0; k < perfectWomanList.size(); k++) {
							if (perfectWomanList.get(k).getUserId().equals(woman)) {
								perfectWomanList.remove(k);
							}
						}
						System.out.println("remove ���� �̻�����Ī ���� ������ ��� : " + perfectWomanList);
						for (int l = 0; l < perfectManList.size(); l++) {
							if (perfectManList.get(l).getUserId().equals(man)) {
								perfectManList.remove(l);
							}
						}
						System.out.println("remove ���� �̻�����Ī ���� ������ ��� : " + perfectManList);

						perfectNo++;

					}

					i++;
					/////////////////////////////////////////////

				}

				// ������Ī��///////////////////////////////////////
			} else {
				// ������ ���
				System.out.println("���� ��Ī ����");
				if (applicationScope.getAttribute("perfectWomanList") != null) {
					perfectWomanList = (List<User>) applicationScope.getAttribute("perfectWomanList");
				}
				if (applicationScope.getAttribute("perfectManList") != null) {
					perfectManList = (List<User>) applicationScope.getAttribute("perfectManList");
				}

				// �̻��� ��Ī ����
				partnerResult = false;
				myResult = false;
				int i = 0;
				while (!myResult && perfectWomanList.size() > i) {
					System.out.println("while�� ��");

					/// ����///////////////////////////
					int partnerType = perfectWomanList.get(i).getMyType(); // ������ ����
					int partnerFirstType = perfectWomanList.get(i).getFirstType();// ������ �̻��� ����1
					int partnerSecondType = perfectWomanList.get(i).getSecondType();// ������ �̻��� ����2
					int partnerThirdType = perfectWomanList.get(i).getThirdType();// ������ �̻��� ����3

					// ��Ʈ�ʰ� �� �̻������� �Ǵ�//////////////////////////////////////////
					partnerResult = (partnerType == myFirstType); // ������ ������ �� ù��° �̻��������� ���

					if (!partnerResult) {
						partnerResult = (partnerType == mySecondType);// �ι�° �̻����ϰ��
					} else if (!partnerResult) {
						partnerResult = (partnerType == myThirdType);// ����° �̻����ϰ��
					}
					System.out.println("���� �̻����� �����ϴ°� ? " + partnerResult);// true�� �̻��� false�� �̻����ƴ�
					//////////////////////////////////////////////////
					// ��Ʈ���� �̻����� ���� �´��� �Ǵ�/////////////////////////////////////////////////
					if (partnerResult) {
						int[] partnerWantType = { partnerFirstType, partnerSecondType, partnerThirdType }; // ���� �̻���
																											// ����3��

						myResult = Arrays.stream(partnerWantType).anyMatch(b -> b == myType); // ���� ����
						System.out.println("������ �̻����� �����ϴ°� ? " + myResult);// ���� ������ �̻����� ���ԵǴ��� ����

					}
					System.out.println("partnerResult : " + partnerResult + "  myResult : " + myResult); // �Ѵ� true������
					// ��Ī�Ϸ�� ���� ���̵� ����
					if (myResult) {
						// return userId;
						partnerId = perfectWomanList.get(i).getUserId();// ��Ī�� ���� ���̵�
						man = userId;
						woman = partnerId;
						chatting.setManId(man);
						chatting.setWomanId(woman);
						chatting.setContactMeeting("N");
						// addChatting
						System.out.println("��Ī �Ϸ�  man  : " + man + "  woman : " + woman);

						chattingService.addPerfectChatting(chatting);
						// ����� ����Ʈ���� ����
						for (int k = 0; k < perfectWomanList.size(); k++) {
							if (perfectWomanList.get(k).getUserId().equals(woman)) {
								perfectWomanList.remove(k);
							}
						}
						System.out.println("remove ���� �̻�����Ī ���� ������ ��� : " + perfectWomanList);
						for (int l = 0; l < perfectManList.size(); l++) {
							if (perfectManList.get(l).getUserId().equals(man)) {
								perfectManList.remove(l);
							}
						}
						System.out.println("remove ���� �̻�����Ī ���� ������ ��� : " + perfectManList);
						perfectNo++;

					}
					/////////////////////////////////////////////
					i++;
				}

			}
			//// ������Ī��/////////////////////////////////////////////
			// ��Ī ����
			if (myResult && partnerResult) {
				System.out.println("�̻�����Ī �Ϸ� getChatting");
				// ��Ī �Ϸ�ÿ��� get �Ϸ� �ȵ� ����
				resultChatting = chattingService.getChatting(userId);
				// roomName�� ChattingNo�� ����
				roomNo = resultChatting.getChattingNo();
				System.out.println("resultChatting : " + resultChatting);
				System.out.println("roomNo : " + roomNo);
				man = resultChatting.getManId();
				woman = resultChatting.getWomanId();
				map.put("womanId", woman);
				map.put("manId", man);
				map.put("roomNo", roomNo);
				map.put("perfectNo", perfectNo);
				session.setAttribute("chatting", resultChatting);
				chattingList.add(resultChatting);
				System.out.println("map : " + map);
				perfectMatchingResult.add(resultChatting);// getChatting �־���
				applicationScope.setAttribute("perfectMatchingResult", perfectMatchingResult);
				// ��Ī��
			} else {
				// ��Ī ����
				map.put("roomNo", "re");
			}

		} else {
			// 1,0 or 0,0 �ΰ��
			while (result) {
				// ��Ī �Ϸ�� ���
				if (perfectMatchingResult.get(j).getManId().equals(userId)
						|| perfectMatchingResult.get(j).getWomanId().equals(userId)) {
					// getChatting
					System.out.println("��Ī �Ϸ�� ��� �̻�����Ī getChatting");

					resultChatting = chattingService.getChatting(userId);
					// roomName�� ChattingNo�� ����
					roomNo = resultChatting.getChattingNo();
					System.out.println("resultChatting : " + resultChatting);
					System.out.println("roomNo : " + roomNo);
					man = resultChatting.getManId();
					woman = resultChatting.getWomanId();
					map.put("womanId", woman);
					map.put("manId", man);
					map.put("roomNo", roomNo);
					map.put("perfectNo", perfectNo);
					session.setAttribute("chatting", resultChatting);
					chattingList.add(resultChatting);
					System.out.println("����� ���� �ִ� map : " + map);
					perfectMatchingResult.add(resultChatting);// getChatting �־���
					result = false;
				}
				j++;

			} // for�� ��
			if (!result && roomNo == 0) {
				map.put("roomNo", "re");
				System.out.println("����� �͵� ���� ��Ī�� �ȵ� map : " + map);
			}

		}
		/////////////////////////////////////////////////////////////////////////////

		System.out.println("map : " + map);
		System.out.println("perfectMatchingResult.size() : " + perfectMatchingResult.size());
		System.out.println("perfectMatchingResult : " + perfectMatchingResult);

		return map;
	}

	@RequestMapping(value = "json/addRandomChatting", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> addRandomChatting(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("json/addRandomChatting ����");

		// ===========================================���� ������ ���� ����
		// part=================================================

		Chatting chatting = new Chatting();
		ServletContext applicationScope = request.getSession().getServletContext();
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("me");
		System.out.println("user" + user);
		ModelAndView modelAndView = new ModelAndView();
		//// user���α��� �� ���

		//// ���̵�� user������ �����´�.
		User dbUser = userService.getUser(user.getUserId());

		///// ������ ���
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("womanList") != null) {
				womanList = (List<User>) applicationScope.getAttribute("womanList");
			}
			womanList.add(dbUser);

			applicationScope.setAttribute("womanList", womanList);

			for (User v : womanList) {
				System.out.println("���� ����ä�� ���� ������ ��� : " + v);

			}
		} else {
			// ������ ���
			if (applicationScope.getAttribute("manList") != null) {
				manList = (List<User>) applicationScope.getAttribute("manList");
			}
			manList.add(dbUser);

			applicationScope.setAttribute("manList", manList);

			for (User v : manList) {
				System.out.println("���� ����ä�� ���� ������ ��� : " + v);
			}
		}

		System.out.println("manList.size() : " + manList.size() + "womanList.size() : " + womanList.size());
		System.out.println("manList : " + manList + "womanList : " + womanList);

		map.put("manList", manList);
		map.put("womanList", womanList);

		// ====================================================================================================

		// user�� ���̵��ʿ� ������ ��������, �̻��� ������ ���� ��Ī

		return map;
	}

	@RequestMapping(value = "json/getRandomMatching", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getRandomMatching(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("json/getRandomMatching ����");

		// ===========================================���� ������ ���� ����
		// part=================================================

		Chatting chatting = new Chatting();
		Map<String, Object> map = new HashMap<String, Object>();
		ServletContext applicationScope = request.getSession().getServletContext();
		User user = (User) session.getAttribute("me");
		System.out.println("user" + user);
		String userId = user.getUserId();
		ModelAndView modelAndView = new ModelAndView();
		//// user���α��� �� ���

		//// ���̵�� user������ �����´�.
		User dbUser = userService.getUser(user.getUserId());

		///// ������ ���
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("womanList") != null) {
				womanList = (List<User>) applicationScope.getAttribute("womanList");
			}

			for (User v : womanList) {
				System.out.println("���� ������Ī ���� ������ ��� : " + v);

			}
		} else {
			// ������ ���
			if (applicationScope.getAttribute("manList") != null) {
				manList = (List<User>) applicationScope.getAttribute("manList");
			}

			for (User v : manList) {
				System.out.println("���� ������Ī ���� ������ ��� : " + v);
			}
		}

		System.out.println("manList.size() : " + manList.size() + "womanList.size() : " + womanList.size());
		System.out.println("manList : " + manList + "womanList : " + womanList);
		String man = null;
		String woman = null;
		int roomNo = 0;

		if (manList.size() > no && womanList.size() > no) {
			//////// ��Ī�� ���̵� 2�� �ֱ�

			System.out.println("manList==womanList");
			man = manList.get(no).getUserId();
			woman = womanList.get(no).getUserId();
			chatting.setManId(man);
			chatting.setWomanId(woman);
			chatting.setContactMeeting("N");
			// addChatting
			System.out.println("man  : " + man + "  woman : " + woman);

			chattingService.addPerfectChatting(chatting);

			no++;

			map.put("manList", manList);
			map.put("womanList", womanList);

		}
		// get
		System.out.println("������Ī getChatting");

		if (no > 0
				&& (womanList.get(no - 1).getUserId().equals(userId) || manList.get(no - 1).getUserId().equals(userId))
				&& (manList.size() == womanList.size())) {
			Chatting resultChatting = chattingService.getChatting(userId);
			// roomName�� ChattingNo�� ����
			roomNo = resultChatting.getChattingNo();
			System.out.println("resultChatting : " + resultChatting);
			System.out.println("roomNo : " + roomNo);
			man = resultChatting.getManId();
			woman = resultChatting.getWomanId();
			map.put("womanId", woman);
			map.put("manId", man);
			map.put("roomNo", roomNo);
			map.put("no", no);
			session.setAttribute("chatting", resultChatting);
			chattingList.add(resultChatting);
			System.out.println("map : " + map);
		} else {
			map.put("womanId", woman);
			map.put("manId", man);
			map.put("roomNo", roomNo);
			Chatting emptyChatting = new Chatting();
			session.setAttribute("chatting", emptyChatting);
			System.out.println("map : " + map);
		}

		// ====================================================================================================

		// user�� ���̵��ʿ� ������ ��������, �̻��� ������ ���� ��Ī

		return map;
	}

	@RequestMapping(value = "json/endRandomMatching", method = RequestMethod.GET)
	public String endRandomMatching(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("endRandomMatching ����");
		// ��Ī �Ϸ� �� ���� ���
		String result = "";
		User user = (User) session.getAttribute("me");
		String userId = user.getUserId();
		ServletContext applicationScope = request.getSession().getServletContext();

		// ������ ���
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("womanList") != null) {
				womanList = (List<User>) applicationScope.getAttribute("womanList");
				for (int i = no; i < womanList.size(); i++) {
					if (womanList.get(i).getUserId().equals(userId)) {
						womanList.remove(i);
						result = "Random ���� ���� ����� ������";
					}
				}
			}

			// ������ ���
		} else {
			if (applicationScope.getAttribute("manList") != null) {
				manList = (List<User>) applicationScope.getAttribute("manList");
				for (int j = no; j < manList.size(); j++) {
					if (manList.get(j).getUserId().equals(userId)) {
						manList.remove(j);
						result = "Random ���� ���� ����� ������";
					}
				}
			}
		}

		System.out.println("remove=manList.size() : " + manList.size() + "womanList.size() : " + womanList.size());
		System.out.println("remove=manList : " + manList + "womanList : " + womanList);
		System.out.println(result);

		return result;
	}

	@RequestMapping(value = "json/endPerfectMatching", method = RequestMethod.GET)
	public String endPerfectMatching(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("endPerfectMatching ����");

		// ��Ī �Ϸ� �� ���� ���//////////////////////////////////////////////////////////
		String result = "";
		User user = (User) session.getAttribute("me");
		String userId = user.getUserId();
		ServletContext applicationScope = request.getSession().getServletContext();

		// ������ ���
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("perfectWomanList") != null) {
				perfectWomanList = (List<User>) applicationScope.getAttribute("perfectWomanList");
				for (int i = 0; i < perfectWomanList.size(); i++) {
					if (perfectWomanList.get(i).getUserId().equals(userId)) {
						perfectWomanList.remove(i);
						result = "Perfect ���� �̻��� ����� ������";
					}
				}
			}

			// ������ ���
		} else {
			if (applicationScope.getAttribute("perfectManList") != null) {
				perfectManList = (List<User>) applicationScope.getAttribute("perfectManList");
				for (int j = 0; j < perfectManList.size(); j++) {
					if (perfectManList.get(j).getUserId().equals(userId)) {
						perfectManList.remove(j);
						result = "Perfect ���� �̻��� ����� ������";
					}
				}
			}
		}
		//////////////////////////////////////////////////////////////////////////////////////////////

		System.out.println("remove=perfectManList : " + perfectManList + "perfectWomanList : " + perfectWomanList);
		System.out.println("remove=perfectManList.size() : " + perfectManList.size() + "perfectWomanList.size() : "
				+ perfectWomanList.size());
		System.out.println(result);

		return result;
	}

	@RequestMapping(value = "json/endPerfectChatting", method = RequestMethod.GET)
	public String endPerfectChatting(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("endPerfectChatting ����");
		// ä�� ���� �������
		Chatting outUserChatting = (Chatting) session.getAttribute("chatting");
		User user = (User) session.getAttribute("me");
		String userId = user.getUserId();
		String result = "";
		int chattingNo = outUserChatting.getChattingNo();
		ServletContext applicationScope = request.getSession().getServletContext();
		if (applicationScope.getAttribute("perfectMatchingResult") != null) {
			perfectMatchingResult = (List<Chatting>) applicationScope.getAttribute("perfectMatchingResult");

		}
		if (chattingNo != 0) {
			Chatting emptyChatting = new Chatting();
			outUserChatting=emptyChatting;
			session.setAttribute("chatting", outUserChatting);
			for (int i = 0; i < perfectMatchingResult.size(); i++) {
				if (perfectMatchingResult.get(i).getManId().equals(userId)
						|| perfectMatchingResult.get(i).getWomanId().equals(userId)) {
					perfectMatchingResult.remove(i);
					result = "�̻��� ä�� ���� ����Ʈ���� ������";
				}

			}

		} else {

		}
		System.out.println("perfectMatchingResult : " + perfectMatchingResult);// ����� ��Ī ����Ʈ
		System.out.println("outUserChatting : "+outUserChatting);
		System.out.println("Result : " + result);// ���
		return result;
	}

	@RequestMapping(value = "json/endRandomChatting", method = RequestMethod.GET)
	public String endRandomChatting(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("endRandomChatting ����");
		// ä�� ���� �������
		Chatting outUserChatting = (Chatting) session.getAttribute("chatting");
		User user = (User) session.getAttribute("me");
		String userId = user.getUserId();
		String result = "";
		int chattingNo = outUserChatting.getChattingNo();
		String roomNo = "" + chattingNo;
		List<Telepathy> telepathyList = new ArrayList<Telepathy>();
		ServletContext applicationScope = request.getSession().getServletContext();
		if (applicationScope.getAttribute(roomNo) != null) {
			telepathyList = (List<Telepathy>) applicationScope.getAttribute(roomNo);
			telepathyList.removeAll(telepathyList);
		}
		if (chattingNo != 0) {
			Chatting emptyChatting = new Chatting();
			session.setAttribute("chatting", emptyChatting);
			result = "���� ä�� ���� ����Ʈ���� ������";

		} else {

		}
		System.out.println("telepathyList : " + telepathyList);
		System.out.println("Result : " + result);
		return result;
	}

	@RequestMapping(value = "json/getUserTypeInterest/{partnerId}", method = RequestMethod.GET)
	public Map<String, Object> getUserTypeInterest(HttpSession session, HttpServletRequest request,
			@PathVariable String partnerId) throws Exception {
		System.out.println("endPerfectChatting ����");
		// ä�� ���� �������
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("me");
		String myId = user.getUserId();
		int myType = user.getMyType();
		User user02 = (User) userService.getUser(partnerId);
		int partnerType = user02.getMyType();

		int[] type = { myType, partnerType, 0, 0 };
		int[] interest = { user02.getFirstInterest(), user02.getSecondInterest(), user02.getThirdInterest() };
		map.put("type", userService.getTypeByUser(type));
		map.put("interest", userService.getInterestByUser(interest));

		System.out.println("map : " + map);

		return map;
	}

	@RequestMapping(value = "json/getTelepathyResult", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getTelepathyResult(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("json/getTelepathyResult ����");

		// ===========================================���� ������ ���� ����
		// part=================================================

		ServletContext applicationScope = request.getSession().getServletContext();
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("me");
		Chatting chatting = (Chatting) session.getAttribute("chatting");
		int chattingNo = chatting.getChattingNo();
		String roomNo = "" + chattingNo;
		System.out.println("user" + user);
		telepathyList = (List<Telepathy>) applicationScope.getAttribute(roomNo);
		map.put("telepathyListRe", telepathyList);
		System.out.println("telepathyList : " + telepathyList);
		return map;
	}

	@RequestMapping(value = "json/imageUpload", method = RequestMethod.POST)
	public Map<String, Object> imageUpload(HttpSession session, HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		System.out.println("json/imageUpload ����");
		 Chatting chatting= (Chatting)session.getAttribute("chatting");
         User user=(User)session.getAttribute("me");
	
	
		
    String path = "C:\\Users\\Bit\\git\\Destiny\\Destiny\\WebContent\\resources\\images\\chatting\\image\\";
    System.out.println("���Ͼ��ε��ϴ°�");

    
      File dir = new File(path);
      if(!dir.isDirectory()){
          dir.mkdir();
      }
      //String fileName1="";
      Iterator<String> files = multipartHttpServletRequest.getFileNames();
      System.out.println(files.hasNext());
      System.out.println(files.toString());
      while(files.hasNext()){
          String uploadFile = files.next();
          MultipartFile mFile = multipartHttpServletRequest.getFile(uploadFile);
         
          String chattingFile=""+chatting.getChattingNo()+user.getUserId()+count;
          String fileName = mFile.getOriginalFilename();
          System.out.println("���� ���� �̸� : " +fileName);
          System.out.println("������ ���� �̸� : "+chattingFile);
         
          String splitFileName=fileName.split("\\.")[0];
          
          System.out.println("splitFileName[0] : "+splitFileName);
          String extension=fileName.split("\\.")[1];
         // splitFileName[0]=chattingFile;
         fileName=chattingFile+"."+extension;
          System.out.println("����� ���� �̸� : "+fileName);
          count++;
          try {
              mFile.transferTo(new File(path,fileName));
             
          } catch (Exception e) {
              e.printStackTrace();
          }finally {
          this.file = fileName;
          
       }
      }
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("fileName", file);
      System.out.println(file);
      map.put("userId", user.getUserId());
      
      return map;
	}
	
	@RequestMapping(value = "json/voiceUpload", method = RequestMethod.POST)
	public Map<String, Object> voiceUpload(HttpSession session, HttpServletRequest request, MultipartHttpServletRequest multipartHttpServletRequest) throws Exception {
		System.out.println("json/imageUpload ����");
		 Chatting chatting= (Chatting)session.getAttribute("chatting");
         User user=(User)session.getAttribute("me");
	
	
		
    String path = "C:\\Users\\Bit\\git\\Destiny\\Destiny\\WebContent\\resources\\images\\chatting\\image\\";
    System.out.println("���Ͼ��ε��ϴ°�");

    
      File dir = new File(path);
      if(!dir.isDirectory()){
          dir.mkdir();
      }
      //String fileName1="";
      Iterator<String> files = multipartHttpServletRequest.getFileNames();
      System.out.println(files.hasNext());
      System.out.println(files.toString());
      while(files.hasNext()){
          String uploadFile = files.next();
          MultipartFile mFile = multipartHttpServletRequest.getFile(uploadFile);
         
          String chattingFile=""+chatting.getChattingNo()+user.getUserId()+count;
          String fileName = mFile.getOriginalFilename();
          System.out.println("���� ���� �̸� : " +fileName);
          System.out.println("������ ���� �̸� : "+chattingFile);
         
          if (fileName!=null) {
        	  String splitFileName=fileName.split("\\.")[0];
              
              System.out.println("splitFileName[0] : "+splitFileName);
              String extension=fileName.split("\\.")[1];
             // splitFileName[0]=chattingFile;
             fileName=chattingFile+"."+extension;
              System.out.println("����� ���� �̸� : "+fileName);
              count++;
              try {
                  mFile.transferTo(new File(path,fileName));
                 
              } catch (Exception e) {
                  e.printStackTrace();
              }finally {
              this.file = fileName;
              
           }
		}else {
			this.file=null;
		}
          
      }
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("fileName", file);
      System.out.println(file);
      map.put("userId", user.getUserId());
      
      return map;
	}

	@RequestMapping(value = "json/updateContactMeeting", method = RequestMethod.GET)
	@ResponseBody
	public String updateContactMeeting(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("json/updateContactMeeting ����");
		String result = "";
		Chatting chatting = (Chatting) session.getAttribute("chatting");
		chattingService.updateContactMeeting(chatting);
		System.out.println("�Ϸ�");
		result = "ok";
		System.out.println("result" + result);
		return result;
	}

}
