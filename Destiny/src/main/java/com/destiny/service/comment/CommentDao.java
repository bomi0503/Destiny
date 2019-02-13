package com.destiny.service.comment;

import java.util.List;
import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Comment;

public interface CommentDao {
	
	//댓글 등록
	public void addComment(Comment comment) throws Exception;
	
	//대댓글 등록
	public void addReComment(Comment comment) throws Exception;
	
	//댓글 상세보기
	public Comment getComment(int commentNo) throws Exception;
	
	//댓글 리스트
	public List<Comment> getCommentList(int commentComuNo) throws Exception;
	/*public List<Comment> getCommentList(Search search) throws Exception;*/
	
	//댓글 수정
	public void updateComment(Comment comment) throws Exception;
	
	//댓글 viewCondition 수정
	public void updateViewCondition(int commentNo) throws Exception;
	
	//게시판 page 처리를 위한 전체 row(totalCount) return
	public int getTotalCount(Search search) throws Exception;

}
