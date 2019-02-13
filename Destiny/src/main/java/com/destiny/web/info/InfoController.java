package com.destiny.web.info;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.destiny.common.Page;
import com.destiny.common.Search;
import com.destiny.service.community.CommunityService;
import com.destiny.service.domain.Community;
import com.destiny.service.domain.LikeCount;
import com.destiny.service.domain.Upload;
import com.destiny.service.domain.User;
import com.destiny.service.upload.UploadService;

@Controller
@RequestMapping("/info/*")
public class InfoController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("uploadServiceImpl")
	private UploadService uploadService;
	
	///Constructor
	public InfoController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	///Method
	
	/*getRestaurantInfoList.jsp로 단순 Navigation : start*/
	@RequestMapping(value="listRestaurantInfo")
	public ModelAndView listRestaurantInfo(@ModelAttribute("search") Search search) throws Exception{
		System.out.println("::InfoController/listRestaurantInfo/get : 실행");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = communityService.getCommunityList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage : "+resultPage);
		System.out.println("map : "+map);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("/community/getRestaurantInfoList.jsp");
		return modelAndView;
	}
	/*getRestaurantInfoList.jsp로 단순 Navigation : end*/
	
	
	/*addRestaurantInfo.jsp로 단순 Navigation : start*/
	@RequestMapping(value="addRestaurantInfo", method=RequestMethod.GET)
	public ModelAndView addRestaurantInfo() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/community/addRestaurantInfo.jsp");
		return modelAndView;
	}
	/*addRestaurantInfo.jsp로 단순 Navigation : end*/
	
	/*addRestaurantInfo : start*/
	@RequestMapping(value="addRestaurantInfo", method=RequestMethod.POST)
	public ModelAndView addRestaurantInfo(@ModelAttribute("community") Community community, HttpSession session, @RequestParam("uploadFile")MultipartFile fileName, MultipartHttpServletRequest mtfRequest, @ModelAttribute("upload")Upload upload) throws Exception{
		System.out.println(":: InfoController/addRestaurantInfo/post : 실행");
		
		if(fileName.getOriginalFilename() == "") {
			System.out.println("이미지 없음");
			upload.setFileName("basic.gif");
		}else {
			/*대표이미지 업로드 : start*/
			String path = "C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\uploadImg\\";
			String name = System.currentTimeMillis()+"."+fileName.getOriginalFilename().split("\\.")[1];
			
			File file = new File(path + name);

			fileName.transferTo(file);
			/*대표이미지 업로드 : end*/
			
			upload.setFileName(name);
		}
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		String nickName = user.getNickName();
		String userGrade = user.getUserGrade();
		System.out.println("userId :: " + userId);
		System.out.println("nickName : "+nickName);
		System.out.println("userGrade : "+userGrade);
		
		community.setWriterId(userId);
		community.setCategory("RES");
		community.setUserGrade(userGrade);
		community.setWriterNickName(nickName);
		community.setViews(0);
		community.setLike(0);
		community.setImportRank("N");
		community.setViewCondition("DEF");
		
		System.out.println(":: InfoController/addRestaurantInfo/post의 community : "+community);
		
		ModelAndView modelAndView = new ModelAndView();
		communityService.addCommunity(community);
		
		System.out.println("community : "+community);
		/*업로드 테이블 : start*/
		upload.setCommunityNo(community.getCommunityNo());
		/*upload.setFileName(name);*/
		upload.setFileCode("IMG");
		uploadService.addUload(upload);
		System.out.println("upload : "+upload);
		/*업로드 테이블 : end*/

		/*modelAndView.setViewName("/community/addRestaurantInfoConfirm.jsp");*/
		modelAndView.setViewName("/info/listRestaurantInfo");
		return modelAndView;
	}
	/*addRestaurantInfo : end*/
	
	/*getRestaurantInfo : start*/
	@RequestMapping(value="getRestaurantInfo", method=RequestMethod.GET)
	public ModelAndView getRestaurantInfo(@RequestParam("communityNo") int communityNo, @ModelAttribute("likeCount") LikeCount likeCount,  HttpSession session) throws Exception{
		
		System.out.println(":: info/getRestaurantInfo : GET 실행 ========================");
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		System.out.println("userId :: " + userId);
		
		
		Community community = communityService.getCommunity(communityNo);
		communityService.updateViews(communityNo);
		likeCount.setLikeCountId(userId);
		likeCount.setLikeCountCommunityNo(communityNo);
		communityService.getLikeCount(likeCount);
		likeCount = communityService.getLikeCount(likeCount);
		System.out.println(community);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", community);
		modelAndView.addObject("likeCount", likeCount);
		modelAndView.setViewName("/community/getRestaurantInfo.jsp");
		return modelAndView;
	}
	/*getRestaurantInfo : end*/
	
	/*updateRestaurantInfo/GET : start*/
	@RequestMapping(value="updateRestaurantInfo", method=RequestMethod.GET)
	public ModelAndView updateRestaurantInfo(@RequestParam("communityNo") int communityNo) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", communityService.getCommunity(communityNo));
		modelAndView.setViewName("/community/updateRestaurantInfo.jsp");
		
		return modelAndView;
	}
	/*updateRestaurantInfo/GET : end*/
	
	/*updateRestaurantInfo/POST : start*/
	@RequestMapping(value="updateRestaurantInfo", method=RequestMethod.POST)
	public ModelAndView updateRestaurantInfo(@ModelAttribute("community") Community community, @RequestParam("communityNo") int communityNo, @RequestParam("uploadFile")MultipartFile fileName, MultipartHttpServletRequest mtfRequest, @ModelAttribute("upload")Upload upload) throws Exception{
		
		System.out.println(":: InfoController/info/updateRestaurantInfo : POST 실행 ===========================================================");
		
		String name="";
		
		if(fileName.getOriginalFilename() == "") {
			name = communityService.getCommunity(communityNo).getFileName();
		}else {
			/*대표이미지 업로드 : start*/
			String path = "C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\uploadImg\\";
			name = System.currentTimeMillis()+"."+fileName.getOriginalFilename().split("\\.")[1];
			System.out.println("name : " + name);
			File file = new File(path + name);
			
			fileName.transferTo(file);
			/*대표이미지 업로드 : end*/
			
			
		}
		
		communityService.updateCommunity(community);
		upload = uploadService.getUpload(communityNo);
		
		/*업로드 테이블 : start*/
		upload.setFileName(name);
		upload.setUploadNo(upload.getUploadNo());
		uploadService.updateUpload(upload);
		/*업로드 테이블 : end*/
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", community);
		modelAndView.setViewName("redirect:/info/getRestaurantInfo?communityNo="+community.getCommunityNo());
		return modelAndView;
	}
	/*updateRestaurantInfo/POST : end*/
	
	/*deleteRestaurantInfo : start*/
	@RequestMapping(value="deleteRestaurantInfo", method=RequestMethod.GET)
	public ModelAndView deleteRestaurantInfo(@ModelAttribute("community") Community community, @RequestParam("communityNo") int communityNo) throws Exception{
		
		communityService.deleteCommunity(community);
		System.out.println(community);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", community);
		modelAndView.setViewName("/info/listRestaurantInfo");
		return modelAndView;
	}
	/*deleteRestaurantInfo : end*/
	
	/*getPreRestaurantInfo : start*/
	@RequestMapping(value="getPreRestaurantInfo", method=RequestMethod.GET)
	public ModelAndView getPreRestaurantInfo(@RequestParam("communityNo") int communityNo, @ModelAttribute("likeCount") LikeCount likeCount,  HttpSession session) throws Exception{
		
		System.out.println(":: info/getRestaurantInfo : GET 실행 ========================");
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		System.out.println("userId :: " + userId);
		
		
		Community community = communityService.getPreCommunity(communityNo);
		
		if (community == null) {
			community = communityService.getCommunity(communityNo);
		}
		
		communityService.updateViews(communityNo);
		likeCount.setLikeCountId(userId);
		likeCount.setLikeCountCommunityNo(communityNo);
		communityService.getLikeCount(likeCount);
		likeCount = communityService.getLikeCount(likeCount);
		System.out.println(community);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", community);
		modelAndView.addObject("likeCount", likeCount);
		modelAndView.setViewName("/community/getRestaurantInfo.jsp");
		return modelAndView;
	}
	/*getPreRestaurantInfo : end*/
	
	/*getNextRestaurantInfo : start*/
	@RequestMapping(value="getNextRestaurantInfo", method=RequestMethod.GET)
	public ModelAndView getNextRestaurantInfo(@RequestParam("communityNo") int communityNo, @ModelAttribute("likeCount") LikeCount likeCount,  HttpSession session) throws Exception{
		
		System.out.println(":: info/getRestaurantInfo : GET 실행 ========================");
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		System.out.println("userId :: " + userId);
		
		
		Community community = communityService.getNextCommunity(communityNo);
		
		if (community == null) {
			community = communityService.getCommunity(communityNo);
		}
		
		communityService.updateViews(communityNo);
		likeCount.setLikeCountId(userId);
		likeCount.setLikeCountCommunityNo(communityNo);
		communityService.getLikeCount(likeCount);
		likeCount = communityService.getLikeCount(likeCount);
		System.out.println(community);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", community);
		modelAndView.addObject("likeCount", likeCount);
		modelAndView.setViewName("/community/getRestaurantInfo.jsp");
		return modelAndView;
	}
	/*getNextRestaurantInfo : end*/
	
}
































