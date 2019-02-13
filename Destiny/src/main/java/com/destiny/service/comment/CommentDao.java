package com.destiny.service.comment;

import java.util.List;
import java.util.Map;

import com.destiny.common.Search;
import com.destiny.service.domain.Comment;

public interface CommentDao {
	
	//��� ���
	public void addComment(Comment comment) throws Exception;
	
	//���� ���
	public void addReComment(Comment comment) throws Exception;
	
	//��� �󼼺���
	public Comment getComment(int commentNo) throws Exception;
	
	//��� ����Ʈ
	public List<Comment> getCommentList(int commentComuNo) throws Exception;
	/*public List<Comment> getCommentList(Search search) throws Exception;*/
	
	//��� ����
	public void updateComment(Comment comment) throws Exception;
	
	//��� viewCondition ����
	public void updateViewCondition(int commentNo) throws Exception;
	
	//�Խ��� page ó���� ���� ��ü row(totalCount) return
	public int getTotalCount(Search search) throws Exception;

}
