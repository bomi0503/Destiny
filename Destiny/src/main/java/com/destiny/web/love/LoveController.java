package com.destiny.web.love;

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
@RequestMapping("/love/*")
public class LoveController {
	
	///Field
	@Autowired
	@Qualifier("communityServiceImpl")
	private CommunityService communityService;
	
	@Autowired
	@Qualifier("uploadServiceImpl")
	private UploadService uploadService;
	
	///Constructor
	public LoveController() {
		System.out.println(this.getClass());
	}
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
	
	///Method
	
	/*getLoveAdviceList.jsp로 단순 Navigation : start*/
	@RequestMapping(value="listLoveAdvice")
	public ModelAndView listLoveAdvice(@ModelAttribute("search") Search search) throws Exception{
		System.out.println("::LoveController/LoveAdvice/get : 실행");
		
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> map = communityService.getLoveAdviceList(search);
		
		Page resultPage = new Page(search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage : "+resultPage);
		System.out.println("map : "+map);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("list", map.get("list"));
		modelAndView.addObject("resultPage", resultPage);
		modelAndView.addObject("search", search);
		modelAndView.setViewName("/community/getLoveAdviceList.jsp");
		return modelAndView;
	}
	/*getLoveAdviceList.jsp로 단순 Navigation : end*/
	
	
	/*addLoveAdvice.jsp로 단순 Navigation : start*/
	@RequestMapping(value="addLoveAdvice", method=RequestMethod.GET)
	public ModelAndView addLoveAdvice() throws Exception{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:/community/addLoveAdvice.jsp");
		return modelAndView;
	}
	/*addLoveAdvice.jsp로 단순 Navigation : end*/
	
	/*addLoveAdvice : start*/
	@RequestMapping(value="addLoveAdvice", method=RequestMethod.POST)
	public ModelAndView addLoveAdvice(@ModelAttribute("community") Community community, HttpSession session, @RequestParam("uploadFile")MultipartFile fileName, MultipartHttpServletRequest mtfRequest, @ModelAttribute("upload")Upload upload) throws Exception{
		System.out.println(":: LoveController/addLoveAdvice/post : 실행");
		
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
		community.setCategory("LUV");
		community.setUserGrade(userGrade);
		community.setWriterNickName(nickName);
		community.setViews(0);
		community.setLike(0);
		community.setImportRank("N");
		community.setViewCondition("DEF");
		
		System.out.println(":: LoveController/addLoveAdvice/post의 community : "+community);
		
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
		/*modelAndView.setViewName("/community/addLoveAdviceConfirm.jsp");*/
		modelAndView.setViewName("/love/listLoveAdvice");
		return modelAndView;
	}
	/*addLoveAdvice : end*/
	
	/*getLoveAdvice : start*/
	@RequestMapping(value="getLoveAdvice", method=RequestMethod.GET)
	public ModelAndView getLoveAdvice(@RequestParam("communityNo") int communityNo, @ModelAttribute("likeCount") LikeCount likeCount,  HttpSession session) throws Exception{
		
		System.out.println(":: love/getLoveAdvice : GET 실행 ========================");
		
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
		modelAndView.setViewName("/community/getLoveAdvice.jsp");
		return modelAndView;
	}
	/*getLoveAdvice : end*/
	
	/*updateLoveAdvice/GET : start*/
	@RequestMapping(value="updateLoveAdvice", method=RequestMethod.GET)
	public ModelAndView updateLoveAdvice(@RequestParam("communityNo") int communityNo) throws Exception{
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", communityService.getCommunity(communityNo));
		modelAndView.setViewName("/community/updateLoveAdvice.jsp");
		
		return modelAndView;
	}
	/*updateLoveAdvice/GET : end*/
	
	/*updateLoveAdvice/POST : start*/
	@RequestMapping(value="updateLoveAdvice", method=RequestMethod.POST)
	public ModelAndView updateLoveAdvice(@ModelAttribute("community") Community community, @RequestParam("communityNo") int communityNo, @RequestParam("uploadFile")MultipartFile fileName, MultipartHttpServletRequest mtfRequest, @ModelAttribute("upload")Upload upload) throws Exception{
		
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
		modelAndView.setViewName("redirect:/love/getLoveAdvice?communityNo="+community.getCommunityNo());
		return modelAndView;
	}
	/*updateLoveAdvice/POST : end*/
	
	/*deleteLoveAdvice : start*/
	@RequestMapping(value="deleteLoveAdvice", method=RequestMethod.GET)
	public ModelAndView deleteLoveAdvice(@ModelAttribute("community") Community community, @RequestParam("communityNo") int communityNo) throws Exception{
		
		communityService.deleteCommunity(community);
		System.out.println(community);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("community", community);
		modelAndView.setViewName("/love/listLoveAdvice");
		return modelAndView;
	}
	/*deleteLoveAdvice : end*/
	
	/*getPreLoveAdvice : start*/
	@RequestMapping(value="getPreLoveAdvice", method=RequestMethod.GET)
	public ModelAndView getPreLoveAdvice(@RequestParam("communityNo") int communityNo, @ModelAttribute("likeCount") LikeCount likeCount,  HttpSession session) throws Exception{
		
		System.out.println(":: love/getLoveAdvice : GET 실행 ========================");
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		System.out.println("userId :: " + userId);
		
		
		Community community = communityService.getPreLoveAdvice(communityNo);
		
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
		modelAndView.setViewName("/community/getLoveAdvice.jsp");
		return modelAndView;
	}
	/*getPreLoveAdvice : end*/
	
	/*getNextLoveAdvice : start*/
	@RequestMapping(value="getNextLoveAdvice", method=RequestMethod.GET)
	public ModelAndView getNextLoveAdvice(@RequestParam("communityNo") int communityNo, @ModelAttribute("likeCount") LikeCount likeCount,  HttpSession session) throws Exception{
		
		System.out.println(":: love/getLoveAdvice : GET 실행 ========================");
		
		User user = (User)session.getAttribute("me"); 
		String userId = user.getUserId();
		System.out.println("userId :: " + userId);
		
		
		Community community = communityService.getNextLoveAdvice(communityNo);
		
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
		modelAndView.setViewName("/community/getLoveAdvice.jsp");
		return modelAndView;
	}
	/*getNextLoveAdvice : end*/
	
}