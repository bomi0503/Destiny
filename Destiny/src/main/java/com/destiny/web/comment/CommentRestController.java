package com.destiny.web.comment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.destiny.service.comment.CommentService;
import com.destiny.service.domain.Comment;
import com.destiny.service.domain.User;
import com.destiny.service.user.UserService;

@RestController
@RequestMapping("/comment/*")
public class CommentRestController {

	///Field
	@Autowired
	@Qualifier("commentServiceImpl")
	private CommentService commentService;
	
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ±¸Çö ¾ÊÀ½
	
	public CommentRestController() {
		System.out.println(this.getClass());
	}
	
	/*´ñ±Ûµî·Ï : start*/
	@RequestMapping(value="/rest/addComment/{communityNo}", method=RequestMethod.POST)
	public int addComment(@PathVariable("communityNo") int communityNo, @RequestBody Comment comment) throws Exception{
		System.out.println("CommentRestController/addComment():POST ½ÇÇà==========================");
		
		comment.setViewCondition("DEF");
		comment.setCommentComuNo(communityNo);
		comment.setCommentWriterId(comment.getCommentWriterId());
		comment.setCommentDetail(comment.getCommentDetail());
		
		commentService.addComment(comment);
		
		System.out.println("comment : "+comment);
		
		return 1;
	}
	/*´ñ±Ûµî·Ï : end*/
	
	/*´ñ±Û ¸®½ºÆ® : start*/
	@RequestMapping(value="/rest/getCommentList/{communityNo}", method=RequestMethod.GET)
	public List<Comment> getCommentList(@PathVariable int communityNo) throws Exception{
		
		System.out.println("/rest/listComment/ : GET ½ÇÇà ========================================================");
		System.out.println("communityNo : "+communityNo);
		
		List<Comment> list = commentService.getCommentList(communityNo);
		System.out.println("::: list : "+list);
		
		return list;
	}
	/*´ñ±Û ¸®½ºÆ® : end*/
	
	/*´ñ±Û ¼öÁ¤ : start*/
	@RequestMapping(value="/rest/updateComment", method=RequestMethod.POST)
	public int updateComment(@ModelAttribute("comment") Comment comment) throws Exception{
		
		System.out.println("/rest/updateComment : POST");
		System.out.println("comment : "+comment);
		
		commentService.updateComment(comment);
		
		return 1;
	}
	/*´ñ±Û ¼öÁ¤ : start*/
	
	/*´ñ±Û »èÁ¦ : start*/
	@RequestMapping(value="/rest/deleteComment/{commentNo}", method=RequestMethod.GET)
	public int deleteReply(@PathVariable int commentNo) throws Exception{
		System.out.println("/rest/deleteComment : GET");
		Comment comment = new Comment();
		commentService.getComment(commentNo);
		commentService.updateViewCondition(commentNo);
		System.out.println("comment : "+comment);
		
		return 1;
	}
	/*´ñ±Û »èÁ¦ : end*/
	
	/*´ë´ñ±Û µî·Ï : start*/
	@RequestMapping(value="/rest/addReComment/{targetNo}", method=RequestMethod.POST)
	public int addReComment(@PathVariable("targetNo") int targetNo, @RequestBody Comment comment ) throws Exception{
		System.out.println("/rest/addReComment : POST");
		
		System.out.println("comment : "+comment);
		
		comment.setViewCondition("DEF");
		comment.setCommentComuNo(comment.getCommentComuNo());
		comment.setCommentWriterId(comment.getCommentWriterId());
		comment.setCommentDetail(comment.getCommentDetail());
		comment.setTargetNo(targetNo);
		
		System.out.println("comment : "+comment);
		commentService.addReComment(comment);
		System.out.println("comment11 : " + comment);

		return 1;
	}
	/*´ë´ñ±Û µî·Ï : end*/
}



















