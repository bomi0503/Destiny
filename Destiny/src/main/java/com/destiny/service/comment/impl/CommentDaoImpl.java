package com.destiny.service.comment.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.destiny.common.Search;
import com.destiny.service.comment.CommentDao;
import com.destiny.service.domain.Comment;

@Repository("commentDaoImpl")
public class CommentDaoImpl implements CommentDao{
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}	
	
	public CommentDaoImpl() {
		System.out.println(this.getClass());
	}

	@Override
	public void addComment(Comment comment) throws Exception {
		sqlSession.insert("CommentMapper.addComment", comment);
	}

	@Override
	public Comment getComment(int commentNo) throws Exception {
		return sqlSession.selectOne("CommentMapper.getComment", commentNo);
	}

	@Override
	public void updateComment(Comment comment) throws Exception {
		sqlSession.update("CommentMapper.updateComment", comment);
	}

	@Override
	public void updateViewCondition(int commentNo) throws Exception {
		sqlSession.update("CommentMapper.updateViewCondition", commentNo);
	}

	@Override
	public int getTotalCount(Search search) throws Exception {
		return sqlSession.selectOne("CommentMapper.getTotalCount", search);
	}

	@Override
	public List<Comment> getCommentList(int commentComuNo) throws Exception {
		return sqlSession.selectList("CommentMapper.getCommentList", commentComuNo);
	}

	@Override
	public void addReComment(Comment comment) throws Exception {
		sqlSession.insert("CommentMapper.addReComment", comment);
	}
	
}
