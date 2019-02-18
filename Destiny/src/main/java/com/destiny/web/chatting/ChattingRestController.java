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

	//// 여성 리스트와 남성 리스트를 담을 객체 생성
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
		System.out.println("chat 들어옴");
		System.out.println(body);
		// userId 가져옴
		User user = (User) session.getAttribute("me");
		String userId = user.getUserId();
		System.out.println("userId : " + userId);
		session.setAttribute("chat", userId);
		System.out.println("session에 저장된value : " + session.getAttribute("chat"));

		String q = (String) body.get("message");

		String query = URLEncoder.encode(q, "UTF-8");
		// 번역 받기 원하는 언어

		String target = (String) body.get("lang");
		// google translate api key
		String key = "AIzaSyBFXIiBAU7QfCf0fwndqoR63wwS0P8kNDM";

		//// 나중에 구현 20개의 문자 길이면 바로 번역 그 이상길이면 원본언어->일->target언어/////////////////////
		// int textLength=q.length();
		// if (textLength>20) {
		// 000+
		// }else {
		//
		// }

		/////////////////////////////////////////////////////////////////////////
		// google에 번역 요청
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
		if (responseCode == 200) { // 정상 호출
			br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		} else { // 에러 발생
			br = new BufferedReader(new InputStreamReader(con.getErrorStream(), "UTF-8"));
		}
		String inputLine;
		StringBuffer response = new StringBuffer();
		while ((inputLine = br.readLine()) != null) {
			response.append(inputLine);
		}
		JSONObject jsonobj = (JSONObject) JSONValue.parse(response.toString());
		System.out.println("결과값 : " + jsonobj.get("data").toString());

		br.close();

		/// 번역된 Text 꺼내기////////////////////////////

		JSONObject data = (JSONObject) jsonobj.get("data");
		JSONArray translations = (JSONArray) data.get("translations");
		JSONObject translationsArr = (JSONObject) translations.get(0);
		String transText = (String) translationsArr.get("translatedText");

		System.out.println("translations" + (String) translations.toString());
		System.out.println("translationsArr :" + translations.get(0).toString());
		System.out.println("번역된 text :" + transText);
		///////////////////////////////////////
		return transText;
	}

	@RequestMapping(value = "json/addPerfectChatting", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> addPerfectChatting(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("json/addPerfectChatting 들어옴");

		// ===========================================현재 접속자 구현 로직
		// part=================================================

		Chatting chatting = new Chatting();
		ServletContext applicationScope = request.getSession().getServletContext();
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("me");
		System.out.println("user" + user);
		ModelAndView modelAndView = new ModelAndView();
		//// user가로그인 한 경우

		//// 아이디로 user정보를 가져온다.
		User dbUser = userService.getUser(user.getUserId());

		///// 여성일 경우
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("perfectWomanList") != null) {
				perfectWomanList = (List<User>) applicationScope.getAttribute("perfectWomanList");
			}
			perfectWomanList.add(dbUser);

			applicationScope.setAttribute("perfectWomanList", perfectWomanList);

			for (User v : perfectWomanList) {
				System.out.println("현재 이상형 채팅 여성 접속자 목록 : " + v);

			}
		} else {
			// 남성일 경우
			if (applicationScope.getAttribute("perfectManList") != null) {
				perfectManList = (List<User>) applicationScope.getAttribute("perfectManList");
			}
			perfectManList.add(dbUser);

			applicationScope.setAttribute("perfectManList", perfectManList);

			for (User v : perfectManList) {
				System.out.println("현재  이상형 채팅 남성 접속자 목록 : " + v);
			}
		}

		System.out.println("perfectManList.size() : " + perfectManList.size() + "perfectWomanList.size() : "
				+ perfectWomanList.size());
		System.out.println("perfectManList : " + perfectManList + "perfectWomanList : " + perfectWomanList);

		map.put("perfectManList", perfectManList);
		map.put("perfectWomanList", perfectWomanList);

		// ====================================================================================================

		// user의 아이디필요 본인의 성격유형, 이상형 유형을 통해 매칭

		return map;
	}

	@RequestMapping(value = "json/getPerfectMatching", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getPerfectMatching(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("json/getPerfectMatching 들어옴");

		Chatting chatting = new Chatting();
		Chatting resultChatting = new Chatting();
		Map<String, Object> map = new HashMap<String, Object>();
		ServletContext applicationScope = request.getSession().getServletContext();
		User user = (User) session.getAttribute("me");
		System.out.println("user" + user);
		String userId = user.getUserId();
		int myType = user.getMyType();// 나의 성격유형
		int myFirstType = user.getFirstType();// 나의 이상형 유형1
		int mySecondType = user.getSecondType();// 나의 이상형 유형2
		int myThirdType = user.getThirdType();//// 나의 이상형 유형3
		String partnerId = "";
		String man = null;
		String woman = null;
		int roomNo = 0;
		//// user가로그인 한 경우

		//// 아이디로 user정보를 가져온다.

		if (applicationScope.getAttribute("perfectMatchingResult") != null) {
			perfectMatchingResult = (List<Chatting>) applicationScope.getAttribute("perfectMatchingResult");

		}

		int j = 0;
		boolean result = perfectMatchingResult.size() > j;

		System.out.println("perfectManList.size() : " + perfectManList.size() + "perfectWomanList.size() : "
				+ perfectWomanList.size());
		System.out.println("perfectManList : " + perfectManList + "perfectWomanList : " + perfectWomanList);

		//// 매칭은 남녀 1명 이상일 경우만
		//// 시행///////////////////////////////////////////////////////////////////
		if (perfectWomanList.size() > 0 && perfectManList.size() > 0) {
			boolean partnerResult = false;
			boolean myResult = false;

			System.out.println("매칭된 내역 없는 경우");
			// 매칭 전인 경우 매칭시작
			System.out.println("매칭시작 남 여 1명 이상");
			///// 여성일 경우
			if (user.getGender().equals("W")) {
				if (applicationScope.getAttribute("perfectWomanList") != null) {
					perfectWomanList = (List<User>) applicationScope.getAttribute("perfectWomanList");
				}
				if (applicationScope.getAttribute("perfectManList") != null) {
					perfectManList = (List<User>) applicationScope.getAttribute("perfectManList");
				}

				System.out.println("여자일 경우");
				// 이상형 매칭 시작
				partnerResult = false;
				myResult = false;
				int i = 0;
				while (!myResult && perfectManList.size() > i) {

					System.out.println("while문 안");
					/// 상대방///////////////////////////
					int partnerType = perfectManList.get(i).getMyType(); // 상대방의 유형
					int partnerFirstType = perfectManList.get(i).getFirstType();// 상대방의 이상형 유형1
					int partnerSecondType = perfectManList.get(i).getSecondType();// 상대방의 이상형 유형2
					int partnerThirdType = perfectManList.get(i).getThirdType();// 상대방의 이상형 유형3

					// 파트너가 내 이상형인지 판단//////////////////////////////////////////
					partnerResult = (partnerType == myFirstType); // 상대방의 유형이 내 첫번째 이상형유형일 경우

					if (!partnerResult) {
						partnerResult = (partnerType == mySecondType);// 두번째 이상형일경우
					} else if (!partnerResult) {
						partnerResult = (partnerType == myThirdType);// 세번째 이상형일경우
					}
					System.out.println("나의 이상형에 부합하는가 ? " + partnerResult);// true면 이상형 false면 이상형아님
					//////////////////////////////////////////////////
					// 파트너의 이상형이 내가 맞는지 판단/////////////////////////////////////////////////
					if (partnerResult) {
						int[] partnerWantType = { partnerFirstType, partnerSecondType, partnerThirdType }; // 상대방 이상형
																											// 유형3개

						myResult = Arrays.stream(partnerWantType).anyMatch(b -> b == myType); // 나의 유형
						System.out.println("상대방의 이상형에 부합하는가 ? " + myResult);// 내가 상대방의 이상형에 포함되는지 여부

					}
					System.out.println("partnerResult : " + partnerResult + "  myResult : " + myResult); // 둘다 true여야함
					// 매칭완료시 상대방 아이디를 리턴
					if (myResult) {

						// return userId;
						partnerId = perfectManList.get(i).getUserId();// 매칭된 남자 아이디
						man = partnerId;
						woman = userId;
						chatting.setManId(man);
						chatting.setWomanId(woman);
						chatting.setContactMeeting("N");
						// addChatting
						System.out.println(" 매칭 완료 man  : " + man + "  woman : " + woman);

						chattingService.addPerfectChatting(chatting);

						// 대기자 리스트에서 삭제
						for (int k = 0; k < perfectWomanList.size(); k++) {
							if (perfectWomanList.get(k).getUserId().equals(woman)) {
								perfectWomanList.remove(k);
							}
						}
						System.out.println("remove 현재 이상형매칭 여성 접속자 목록 : " + perfectWomanList);
						for (int l = 0; l < perfectManList.size(); l++) {
							if (perfectManList.get(l).getUserId().equals(man)) {
								perfectManList.remove(l);
							}
						}
						System.out.println("remove 현재 이상형매칭 남성 접속자 목록 : " + perfectManList);

						perfectNo++;

					}

					i++;
					/////////////////////////////////////////////

				}

				// 여성매칭끝///////////////////////////////////////
			} else {
				// 남성일 경우
				System.out.println("남성 매칭 시작");
				if (applicationScope.getAttribute("perfectWomanList") != null) {
					perfectWomanList = (List<User>) applicationScope.getAttribute("perfectWomanList");
				}
				if (applicationScope.getAttribute("perfectManList") != null) {
					perfectManList = (List<User>) applicationScope.getAttribute("perfectManList");
				}

				// 이상형 매칭 시작
				partnerResult = false;
				myResult = false;
				int i = 0;
				while (!myResult && perfectWomanList.size() > i) {
					System.out.println("while문 안");

					/// 상대방///////////////////////////
					int partnerType = perfectWomanList.get(i).getMyType(); // 상대방의 유형
					int partnerFirstType = perfectWomanList.get(i).getFirstType();// 상대방의 이상형 유형1
					int partnerSecondType = perfectWomanList.get(i).getSecondType();// 상대방의 이상형 유형2
					int partnerThirdType = perfectWomanList.get(i).getThirdType();// 상대방의 이상형 유형3

					// 파트너가 내 이상형인지 판단//////////////////////////////////////////
					partnerResult = (partnerType == myFirstType); // 상대방의 유형이 내 첫번째 이상형유형일 경우

					if (!partnerResult) {
						partnerResult = (partnerType == mySecondType);// 두번째 이상형일경우
					} else if (!partnerResult) {
						partnerResult = (partnerType == myThirdType);// 세번째 이상형일경우
					}
					System.out.println("나의 이상형에 부합하는가 ? " + partnerResult);// true면 이상형 false면 이상형아님
					//////////////////////////////////////////////////
					// 파트너의 이상형이 내가 맞는지 판단/////////////////////////////////////////////////
					if (partnerResult) {
						int[] partnerWantType = { partnerFirstType, partnerSecondType, partnerThirdType }; // 상대방 이상형
																											// 유형3개

						myResult = Arrays.stream(partnerWantType).anyMatch(b -> b == myType); // 나의 유형
						System.out.println("상대방의 이상형에 부합하는가 ? " + myResult);// 내가 상대방의 이상형에 포함되는지 여부

					}
					System.out.println("partnerResult : " + partnerResult + "  myResult : " + myResult); // 둘다 true여야함
					// 매칭완료시 상대방 아이디를 리턴
					if (myResult) {
						// return userId;
						partnerId = perfectWomanList.get(i).getUserId();// 매칭된 여자 아이디
						man = userId;
						woman = partnerId;
						chatting.setManId(man);
						chatting.setWomanId(woman);
						chatting.setContactMeeting("N");
						// addChatting
						System.out.println("매칭 완료  man  : " + man + "  woman : " + woman);

						chattingService.addPerfectChatting(chatting);
						// 대기자 리스트에서 삭제
						for (int k = 0; k < perfectWomanList.size(); k++) {
							if (perfectWomanList.get(k).getUserId().equals(woman)) {
								perfectWomanList.remove(k);
							}
						}
						System.out.println("remove 현재 이상형매칭 여성 접속자 목록 : " + perfectWomanList);
						for (int l = 0; l < perfectManList.size(); l++) {
							if (perfectManList.get(l).getUserId().equals(man)) {
								perfectManList.remove(l);
							}
						}
						System.out.println("remove 현재 이상형매칭 남성 접속자 목록 : " + perfectManList);
						perfectNo++;

					}
					/////////////////////////////////////////////
					i++;
				}

			}
			//// 남성매칭끝/////////////////////////////////////////////
			// 매칭 성공
			if (myResult && partnerResult) {
				System.out.println("이상형매칭 완료 getChatting");
				// 매칭 완료시에만 get 완료 안된 경우는
				resultChatting = chattingService.getChatting(userId);
				// roomName은 ChattingNo로 지정
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
				perfectMatchingResult.add(resultChatting);// getChatting 넣어줌
				applicationScope.setAttribute("perfectMatchingResult", perfectMatchingResult);
				// 매칭끝
			} else {
				// 매칭 실패
				map.put("roomNo", "re");
			}

		} else {
			// 1,0 or 0,0 인경우
			while (result) {
				// 매칭 완료된 경우
				if (perfectMatchingResult.get(j).getManId().equals(userId)
						|| perfectMatchingResult.get(j).getWomanId().equals(userId)) {
					// getChatting
					System.out.println("매칭 완료된 경우 이상형매칭 getChatting");

					resultChatting = chattingService.getChatting(userId);
					// roomName은 ChattingNo로 지정
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
					System.out.println("저장된 값이 있는 map : " + map);
					perfectMatchingResult.add(resultChatting);// getChatting 넣어줌
					result = false;
				}
				j++;

			} // for문 끝
			if (!result && roomNo == 0) {
				map.put("roomNo", "re");
				System.out.println("저장된 것도 없고 매칭도 안됨 map : " + map);
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
		System.out.println("json/addRandomChatting 들어옴");

		// ===========================================현재 접속자 구현 로직
		// part=================================================

		Chatting chatting = new Chatting();
		ServletContext applicationScope = request.getSession().getServletContext();
		Map<String, Object> map = new HashMap<String, Object>();
		User user = (User) session.getAttribute("me");
		System.out.println("user" + user);
		ModelAndView modelAndView = new ModelAndView();
		//// user가로그인 한 경우

		//// 아이디로 user정보를 가져온다.
		User dbUser = userService.getUser(user.getUserId());

		///// 여성일 경우
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("womanList") != null) {
				womanList = (List<User>) applicationScope.getAttribute("womanList");
			}
			womanList.add(dbUser);

			applicationScope.setAttribute("womanList", womanList);

			for (User v : womanList) {
				System.out.println("현재 랜덤채팅 여성 접속자 목록 : " + v);

			}
		} else {
			// 남성일 경우
			if (applicationScope.getAttribute("manList") != null) {
				manList = (List<User>) applicationScope.getAttribute("manList");
			}
			manList.add(dbUser);

			applicationScope.setAttribute("manList", manList);

			for (User v : manList) {
				System.out.println("현재 랜덤채팅 남성 접속자 목록 : " + v);
			}
		}

		System.out.println("manList.size() : " + manList.size() + "womanList.size() : " + womanList.size());
		System.out.println("manList : " + manList + "womanList : " + womanList);

		map.put("manList", manList);
		map.put("womanList", womanList);

		// ====================================================================================================

		// user의 아이디필요 본인의 성격유형, 이상형 유형을 통해 매칭

		return map;
	}

	@RequestMapping(value = "json/getRandomMatching", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> getRandomMatching(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("json/getRandomMatching 들어옴");

		// ===========================================현제 접속자 구현 로직
		// part=================================================

		Chatting chatting = new Chatting();
		Map<String, Object> map = new HashMap<String, Object>();
		ServletContext applicationScope = request.getSession().getServletContext();
		User user = (User) session.getAttribute("me");
		System.out.println("user" + user);
		String userId = user.getUserId();
		ModelAndView modelAndView = new ModelAndView();
		//// user가로그인 한 경우

		//// 아이디로 user정보를 가져온다.
		User dbUser = userService.getUser(user.getUserId());

		///// 여성일 경우
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("womanList") != null) {
				womanList = (List<User>) applicationScope.getAttribute("womanList");
			}

			for (User v : womanList) {
				System.out.println("현재 랜덤매칭 여성 접속자 목록 : " + v);

			}
		} else {
			// 남성일 경우
			if (applicationScope.getAttribute("manList") != null) {
				manList = (List<User>) applicationScope.getAttribute("manList");
			}

			for (User v : manList) {
				System.out.println("현재 랜덤매칭 남성 접속자 목록 : " + v);
			}
		}

		System.out.println("manList.size() : " + manList.size() + "womanList.size() : " + womanList.size());
		System.out.println("manList : " + manList + "womanList : " + womanList);
		String man = null;
		String woman = null;
		int roomNo = 0;

		if (manList.size() > no && womanList.size() > no) {
			//////// 매칭된 아이디 2개 넣기

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
		System.out.println("랜덤매칭 getChatting");

		if (no > 0
				&& (womanList.get(no - 1).getUserId().equals(userId) || manList.get(no - 1).getUserId().equals(userId))
				&& (manList.size() == womanList.size())) {
			Chatting resultChatting = chattingService.getChatting(userId);
			// roomName은 ChattingNo로 지정
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

		// user의 아이디필요 본인의 성격유형, 이상형 유형을 통해 매칭

		return map;
	}

	@RequestMapping(value = "json/endRandomMatching", method = RequestMethod.GET)
	public String endRandomMatching(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("endRandomMatching 들어옴");
		// 매칭 완료 전 나갈 경우
		String result = "";
		User user = (User) session.getAttribute("me");
		String userId = user.getUserId();
		ServletContext applicationScope = request.getSession().getServletContext();

		// 여성일 경우
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("womanList") != null) {
				womanList = (List<User>) applicationScope.getAttribute("womanList");
				for (int i = no; i < womanList.size(); i++) {
					if (womanList.get(i).getUserId().equals(userId)) {
						womanList.remove(i);
						result = "Random 여성 랜덤 대기자 지워짐";
					}
				}
			}

			// 남성일 경우
		} else {
			if (applicationScope.getAttribute("manList") != null) {
				manList = (List<User>) applicationScope.getAttribute("manList");
				for (int j = no; j < manList.size(); j++) {
					if (manList.get(j).getUserId().equals(userId)) {
						manList.remove(j);
						result = "Random 남성 랜덤 대기자 지워짐";
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
		System.out.println("endPerfectMatching 들어옴");

		// 매칭 완료 전 나갈 경우//////////////////////////////////////////////////////////
		String result = "";
		User user = (User) session.getAttribute("me");
		String userId = user.getUserId();
		ServletContext applicationScope = request.getSession().getServletContext();

		// 여성일 경우
		if (user.getGender().equals("W")) {
			if (applicationScope.getAttribute("perfectWomanList") != null) {
				perfectWomanList = (List<User>) applicationScope.getAttribute("perfectWomanList");
				for (int i = 0; i < perfectWomanList.size(); i++) {
					if (perfectWomanList.get(i).getUserId().equals(userId)) {
						perfectWomanList.remove(i);
						result = "Perfect 여성 이상형 대기자 지워짐";
					}
				}
			}

			// 남성일 경우
		} else {
			if (applicationScope.getAttribute("perfectManList") != null) {
				perfectManList = (List<User>) applicationScope.getAttribute("perfectManList");
				for (int j = 0; j < perfectManList.size(); j++) {
					if (perfectManList.get(j).getUserId().equals(userId)) {
						perfectManList.remove(j);
						result = "Perfect 남성 이상형 대기자 지워짐";
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
		System.out.println("endPerfectChatting 들어옴");
		// 채팅 방을 나갈경우
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
					result = "이상형 채팅 나감 리스트에서 지워짐";
				}

			}

		} else {

		}
		System.out.println("perfectMatchingResult : " + perfectMatchingResult);// 저장된 매칭 리스트
		System.out.println("outUserChatting : "+outUserChatting);
		System.out.println("Result : " + result);// 결과
		return result;
	}

	@RequestMapping(value = "json/endRandomChatting", method = RequestMethod.GET)
	public String endRandomChatting(HttpSession session, HttpServletRequest request) throws Exception {
		System.out.println("endRandomChatting 들어옴");
		// 채팅 방을 나갈경우
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
			result = "랜덤 채팅 나감 리스트에서 지워짐";

		} else {

		}
		System.out.println("telepathyList : " + telepathyList);
		System.out.println("Result : " + result);
		return result;
	}

	@RequestMapping(value = "json/getUserTypeInterest/{partnerId}", method = RequestMethod.GET)
	public Map<String, Object> getUserTypeInterest(HttpSession session, HttpServletRequest request,
			@PathVariable String partnerId) throws Exception {
		System.out.println("endPerfectChatting 들어옴");
		// 채팅 방을 나갈경우
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
		System.out.println("json/getTelepathyResult 들어옴");

		// ===========================================현재 접속자 구현 로직
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
		System.out.println("json/imageUpload 들어옴");
		 Chatting chatting= (Chatting)session.getAttribute("chatting");
         User user=(User)session.getAttribute("me");
	
	
		
    String path = "C:\\Users\\Bit\\git\\Destiny\\Destiny\\WebContent\\resources\\images\\chatting\\image\\";
    System.out.println("파일업로드하는곳");

    
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
          System.out.println("실제 파일 이름 : " +fileName);
          System.out.println("변경할 파일 이름 : "+chattingFile);
         
          String splitFileName=fileName.split("\\.")[0];
          
          System.out.println("splitFileName[0] : "+splitFileName);
          String extension=fileName.split("\\.")[1];
         // splitFileName[0]=chattingFile;
         fileName=chattingFile+"."+extension;
          System.out.println("변경된 파일 이름 : "+fileName);
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
		System.out.println("json/imageUpload 들어옴");
		 Chatting chatting= (Chatting)session.getAttribute("chatting");
         User user=(User)session.getAttribute("me");
	
	
		
    String path = "C:\\Users\\Bit\\git\\Destiny\\Destiny\\WebContent\\resources\\images\\chatting\\image\\";
    System.out.println("파일업로드하는곳");

    
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
          System.out.println("실제 파일 이름 : " +fileName);
          System.out.println("변경할 파일 이름 : "+chattingFile);
         
          if (fileName!=null) {
        	  String splitFileName=fileName.split("\\.")[0];
              
              System.out.println("splitFileName[0] : "+splitFileName);
              String extension=fileName.split("\\.")[1];
             // splitFileName[0]=chattingFile;
             fileName=chattingFile+"."+extension;
              System.out.println("변경된 파일 이름 : "+fileName);
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
		System.out.println("json/updateContactMeeting 들어옴");
		String result = "";
		Chatting chatting = (Chatting) session.getAttribute("chatting");
		chattingService.updateContactMeeting(chatting);
		System.out.println("완료");
		result = "ok";
		System.out.println("result" + result);
		return result;
	}

}
