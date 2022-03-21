package com.honftel.project.post.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.honftel.project.post.comment.model.Comment;

@Repository
public interface CommentDAO {
	
	public int insertComment(
			@Param("postId") int postId,
			@Param("userId") int userId,
			@Param("userName") String userName,
			@Param("content") String content
			);
	public List<Comment> selectCommentList(@Param("postId") int postId);
	
	public int deleteComment(@Param("postId") int postId);

}