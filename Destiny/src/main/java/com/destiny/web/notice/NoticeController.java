package com.destiny.web.notice;

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
@RequestMapping("/notice/*")
public class NoticeController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("uploadServiceImpl")
	private UploadService uploadService;
	
	///Constructor
	public NoticeController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	///Method
	
	/*getNoticeList.jsp로 단순 Navigation : start*/
	@RequestMapping(value="listNotice")
	public ModelAndView listNotice(@ModelAttribute("search") Search search) throws Exception{
		System.out.println("::NoticeController/listNotice/get : 실행");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = communityService.getNoticeList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage : "+resultPage);
		System.out.println("map : "+map);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("/community/getNoticeList.jsp");
		return modelAndView;
	}
	/*getNoticeList.jsp로 단순 Navigation : end*/
	
	
	/*addNotice.jsp로 단순 Navigation : start*/
	@RequestMapping(value="addNotice", method=RequestMethod.GET)
	public ModelAndView addNotice() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/community/addNotice.jsp");
		return modelAndView;
	}
	/*addNotice.jsp로 단순 Navigation : end*/
	
	/*addNotice : start*/
	@RequestMapping(value="addNotice", method=RequestMethod.POST)
	public ModelAndView addNotice(@ModelAttribute("community") Community community, HttpSession session) throws Exception{
		System.out.println(":: NoticeController/addNotice/post : 실행");
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		String nickName = user.getNickName();
		String userGrade = user.getUserGrade();
		System.out.println("userId :: " + userId);
		System.out.println("nickName : "+nickName);
		System.out.println("userGrade : "+userGrade);
		
		community.setWriterId(userId);
		community.setCategory("NTC");
		community.setUserGrade(userGrade);
		community.setWriterNickName(nickName);
		community.setViews(0);
		community.setLike(0);
		community.setImportRank(community.getImportRank());
		community.setViewCondition("DEF");
		
		System.out.println(":: InfoController/addRestaurantInfo/post의 community : "+community);
		
		ModelAndView modelAndView = new ModelAndView();
		communityService.addCommunity(community);
		
		System.out.println("community : "+community);
		/*modelAndView.setViewName("/community/addNoticeConfirm.jsp");*/
		modelAndView.setViewName("/notice/listNotice");
		return modelAndView;
	}
	/*addNotice : end*/
	
	/*getNotice : start*/
	@RequestMapping(value="getNotice", method=RequestMethod.GET)
	public ModelAndView getNotice(@RequestParam("communityNo") int communityNo, @ModelAttribute("likeCount") LikeCount likeCount,  HttpSession session) throws Exception{
		
		System.out.println(":: notice/getNotice : GET 실행 ========================");
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		System.out.println("userId :: " + userId);
		
		
		Community community = communityService.getNotice(communityNo);
		communityService.updateViews(communityNo);
		likeCount.setLikeCountId(userId);
		likeCount.setLikeCountCommunityNo(communityNo);
		communityService.getLikeCount(likeCount);
		likeCount = communityService.getLikeCount(likeCount);
		System.out.println(community);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", community);
		modelAndView.addObject("likeCount", likeCount);
		modelAndView.setViewName("/community/getNotice.jsp");
		return modelAndView;
	}
	/*getNotice : end*/
	
	/*updateNotice/GET : start*/
	@RequestMapping(value="updateNotice", method=RequestMethod.GET)
	public ModelAndView updateNotice(@RequestParam("communityNo") int communityNo) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", communityService.getNotice(communityNo));
		modelAndView.setViewName("/community/updateNotice.jsp");
		
		return modelAndView;
	}
	/*updateNotice/GET : end*/
	
	/*updateNotice/POST : start*/
	@RequestMapping(value="updateNotice", method=RequestMethod.POST)
	public ModelAndView updateNotice(@ModelAttribute("community") Community community, @RequestParam("communityNo") int communityNo) throws Exception{
		
		/*대표이미지 업로드 : start*/
		/*String path = "C:\\Users\\Bit\\git\\Destiny02\\Destiny\\WebContent\\resources\\images\\uploadImg\\";
		String name = System.currentTimeMillis()+"."+fileName.getOriginalFilename().split("\\.")[1];
		
		File file = new File(path + name);

		fileName.transferTo(file);*/
		/*대표이미지 업로드 : end*/
		System.out.println(":::community : "+community);
		communityService.updateCommunity(community);
		/*upload = uploadService.getUpload(communityNo);*/
		/*업로드 테이블 : start*/
		/*upload.setFileName(name);
		upload.setUploadNo(upload.getUploadNo());
		uploadService.updateUpload(upload);*/
		/*업로드 테이블 : end*/
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", community);
		modelAndView.setViewName("redirect:/notice/getNotice?communityNo="+community.getCommunityNo());
		return modelAndView;
	}
	/*updateNotice/POST : end*/
	
	/*deleteNotice : start*/
	@RequestMapping(value="deleteNotice", method=RequestMethod.GET)
	public ModelAndView deleteNotice(@ModelAttribute("community") Community community, @RequestParam("communityNo") int communityNo) throws Exception{
		
		communityService.deleteCommunity(community);
		System.out.println(community);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", community);
		modelAndView.setViewName("/notice/listNotice");
		return modelAndView;
	}
	/*deleteNotice : end*/
	
	/*getPreNotice : start*/
	@RequestMapping(value="getPreNotice", method=RequestMethod.GET)
	public ModelAndView getPreNotice(@RequestParam("communityNo") int communityNo, @ModelAttribute("likeCount") LikeCount likeCount,  HttpSession session) throws Exception{
		
		System.out.println(":: notice/getNotice : GET 실행 ========================");
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		System.out.println("userId :: " + userId);
		
		
		Community community = communityService.getPreNotice(communityNo);
		
		if (community == null) {
			community = communityService.getNotice(communityNo);
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
		modelAndView.setViewName("/community/getNotice.jsp");
		return modelAndView;
	}
	/*getPreNotice : end*/
	
	/*getNextNotice : start*/
	@RequestMapping(value="getNextNotice", method=RequestMethod.GET)
	public ModelAndView getNextNotice(@RequestParam("communityNo") int communityNo, @ModelAttribute("likeCount") LikeCount likeCount,  HttpSession session) throws Exception{
		
		System.out.println(":: notice/getNotice : GET 실행 ========================");
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		System.out.println("userId :: " + userId);
		
		
		Community community = communityService.getNextNotice(communityNo);
		
		if (community == null) {
			community = communityService.getNotice(communityNo);
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
		modelAndView.setViewName("/community/getNotice.jsp");
		return modelAndView;
	}
	/*getNextNotice : end*/
	
}