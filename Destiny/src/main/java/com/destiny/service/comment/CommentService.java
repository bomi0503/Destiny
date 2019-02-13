package com.destiny.service.comment;

import java.util.List;
import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Comment;

public interface CommentService {
	
	//´ñ±Û µî·Ï
	public void addComment(Comment comment) throws Exception;
	
	//´ë´ñ±Û µî·Ï
	public void addReComment(Comment comment) throws Exception;
	
	//´ñ±Û »ó¼¼º¸±â
	public Comment getComment(int commentNo) throws Exception;
	
	//´ñ±Û ¸®½ºÆ®
	public List<Comment> getCommentList(int commentComuNo) throws Exception;
	/*public Map<String, Object> getCommentList(Search search) throws Exception;*/
	
	//´ñ±Û ¼öÁ¤
	public void updateComment(Comment comment) throws Exception;
	
	//´ñ±Û viewCondition ¼öÁ¤
	public void updateViewCondition(int commentNo) throws Exception;

}
