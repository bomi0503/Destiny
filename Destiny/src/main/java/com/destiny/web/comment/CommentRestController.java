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
	//setter Method ���� ����
	
	public CommentRestController() {
		System.out.println(this.getClass());
	}
	
	/*��۵�� : start*/
	@RequestMapping(value="/rest/addComment/{communityNo}", method=RequestMethod.POST)
	public int addComment(@PathVariable("communityNo") int communityNo, @RequestBody Comment comment) throws Exception{
		System.out.println("CommentRestController/addComment():POST ����==========================");
		
		comment.setViewCondition("DEF");
		comment.setCommentComuNo(communityNo);
		comment.setCommentWriterId(comment.getCommentWriterId());
		comment.setCommentDetail(comment.getCommentDetail());
		
		commentService.addComment(comment);
		
		System.out.println("comment : "+comment);
		
		return 1;
	}
	/*��۵�� : end*/
	
	/*��� ����Ʈ : start*/
	@RequestMapping(value="/rest/getCommentList/{communityNo}", method=RequestMethod.GET)
	public List<Comment> getCommentList(@PathVariable int communityNo) throws Exception{
		
		System.out.println("/rest/listComment/ : GET ���� ========================================================");
		System.out.println("communityNo : "+communityNo);
		
		List<Comment> list = commentService.getCommentList(communityNo);
		System.out.println("::: list : "+list);
		
		return list;
	}
	/*��� ����Ʈ : end*/
	
	/*��� ���� : start*/
	@RequestMapping(value="/rest/updateComment", method=RequestMethod.POST)
	public int updateComment(@ModelAttribute("comment") Comment comment) throws Exception{
		
		System.out.println("/rest/updateComment : POST");
		System.out.println("comment : "+comment);
		
		commentService.updateComment(comment);
		
		return 1;
	}
	/*��� ���� : start*/
	
	/*��� ���� : start*/
	@RequestMapping(value="/rest/deleteComment/{commentNo}", method=RequestMethod.GET)
	public int deleteReply(@PathVariable int commentNo) throws Exception{
		System.out.println("/rest/deleteComment : GET");
		Comment comment = new Comment();
		commentService.getComment(commentNo);
		commentService.updateViewCondition(commentNo);
		System.out.println("comment : "+comment);
		
		return 1;
	}
	/*��� ���� : end*/
	
	/*���� ��� : start*/
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
	/*���� ��� : end*/
}



















