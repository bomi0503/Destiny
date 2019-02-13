package com.destiny.web.date;

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
@RequestMapping("/date/*")
public class DateController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("uploadServiceImpl")
	private UploadService uploadService;
	
	///Constructor
	public DateController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	///Method
	
	/*getMeetingStoryList.jsp로 단순 Navigation : start*/
	@RequestMapping(value="listDateStory")
	public ModelAndView listDateStory(@ModelAttribute("search") Search search) throws Exception{
		System.out.println("::listDateStory/get : 실행");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = communityService.getDateStoryList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage : "+resultPage);
		System.out.println("map : "+map);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("/community/getDateStoryList.jsp");
		return modelAndView;
	}
	/*getMeetingStoryList.jsp로 단순 Navigation : end*/
	
	
	/*addMeetingStory.jsp로 단순 Navigation : start*/
	@RequestMapping(value="addDateStory", method=RequestMethod.GET)
	public ModelAndView addDateStory() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/community/addDateStory.jsp");
		return modelAndView;
	}
	/*addMeetingStory.jsp로 단순 Navigation : end*/
	
	/*addMeetingStory : start*/
	@RequestMapping(value="addDateStory", method=RequestMethod.POST)
	public ModelAndView addDateStory(@ModelAttribute("community") Community community, HttpSession session, @RequestParam("uploadFile")MultipartFile fileName, MultipartHttpServletRequest mtfRequest, @ModelAttribute("upload")Upload upload) throws Exception{
		System.out.println(":: addDateStory/post : 실행");
		
		/*대표이미지 업로드 : start*/
		String path = "C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\uploadImg\\";
		String name = System.currentTimeMillis()+"."+fileName.getOriginalFilename().split("\\.")[1];
		
		File file = new File(path + name);

		fileName.transferTo(file);
		/*대표이미지 업로드 : end*/
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		String nickName = user.getNickName();
		String userGrade = user.getUserGrade();
		System.out.println("userId :: " + userId);
		System.out.println("nickName : "+nickName);
		System.out.println("userGrade : "+userGrade);
		
		community.setWriterId(userId);
		community.setCategory("DAT");
		community.setUserGrade(userGrade);
		community.setWriterNickName(nickName);
		community.setViews(0);
		community.setLike(0);
		community.setImportRank("N");
		community.setViewCondition("DEF");
		
		System.out.println(":: addDateStory/post의 community : "+community);
		
		ModelAndView modelAndView = new ModelAndView();
		communityService.addCommunity(community);
		
		System.out.println("community : "+community);
		/*업로드 테이블 : start*/
		upload.setCommunityNo(community.getCommunityNo());
		upload.setFileName(name);
		upload.setFileCode("IMG");
		uploadService.addUload(upload);
		System.out.println("upload : "+upload);
		/*업로드 테이블 : end*/
		modelAndView.setViewName("/community/addDateStoryConfirm.jsp");
		return modelAndView;
	}
	/*addMeetingStory : end*/
	
	/*getMeetingStory : start*/
	@RequestMapping(value="getDateStory", method=RequestMethod.GET)
	public ModelAndView getDateStory(@RequestParam("communityNo") int communityNo, @ModelAttribute("likeCount") LikeCount likeCount,  HttpSession session) throws Exception{
		
		System.out.println(":: getDateStory : GET 실행 ========================");
		
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
		modelAndView.setViewName("/community/getDateStory.jsp");
		return modelAndView;
	}
	/*getMeetingStory : end*/
	
	/*updateMeetingStory/GET : start*/
	@RequestMapping(value="updateDateStory", method=RequestMethod.GET)
	public ModelAndView updateDateStory(@RequestParam("communityNo") int communityNo) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", communityService.getCommunity(communityNo));
		modelAndView.setViewName("/community/updateDateStory.jsp");
		
		return modelAndView;
	}
	/*updateMeetingStory/GET : end*/
	
	/*updateMeetingStory/POST : start*/
	@RequestMapping(value="updateDateStory", method=RequestMethod.POST)
	public ModelAndView updateDateStory(@ModelAttribute("community") Community community, @RequestParam("communityNo") int communityNo, @RequestParam("uploadFile")MultipartFile fileName, MultipartHttpServletRequest mtfRequest, @ModelAttribute("upload")Upload upload) throws Exception{
		
		String name = "";
		
		if (fileName.getOriginalFilename() == "") {
			name = communityService.getCommunity(communityNo).getFileName();
		}else {
			/*대표이미지 업로드 : start*/
			String path = "C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\uploadImg\\";
			name = System.currentTimeMillis()+"."+fileName.getOriginalFilename().split("\\.")[1];
			
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
		modelAndView.setViewName("redirect:/date/getDateStory?communityNo="+community.getCommunityNo());
		return modelAndView;
	}
	/*updateMeetingStory/POST : end*/
	
	/*deleteMeetingStory : start*/
	@RequestMapping(value="deleteDateStory", method=RequestMethod.GET)
	public ModelAndView deleteDateStory(@ModelAttribute("community") Community community, @RequestParam("communityNo") int communityNo) throws Exception{
		
		communityService.deleteCommunity(community);
		System.out.println(community);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", community);
		modelAndView.setViewName("/date/listDateStory");
		return modelAndView;
	}
	/*deleteMeetingStory : end*/
	
	/*getPreMeetingStory : start*/
	@RequestMapping(value="getPreDateStory", method=RequestMethod.GET)
	public ModelAndView getPreDateStory(@RequestParam("communityNo") int communityNo, @ModelAttribute("likeCount") LikeCount likeCount,  HttpSession session) throws Exception{
		
		System.out.println(":: meetingStory/getMeetingStory : GET 실행 ========================");
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		System.out.println("userId :: " + userId);
		
		
		Community community = communityService.getPreDateStory(communityNo);
		
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
		modelAndView.setViewName("/community/getDateStory.jsp");
		return modelAndView;
	}
	/*getPreMeetingStory : end*/
	
	/*getNextMeetingStory : start*/
	@RequestMapping(value="getNextDateStory", method=RequestMethod.GET)
	public ModelAndView getNextDateStory(@RequestParam("communityNo") int communityNo, @ModelAttribute("likeCount") LikeCount likeCount,  HttpSession session) throws Exception{
		
		System.out.println(":: meetingStory/getMeetingStory : GET 실행 ========================");
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		System.out.println("userId :: " + userId);
		
		
		Community community = communityService.getNextDateStory(communityNo);
		
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
		modelAndView.setViewName("/community/getDateStory.jsp");
		return modelAndView;
	}
	/*getNextMeetingStory : end*/
	
}