package com.honftel.project.post.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.honftel.project.post.model.Post;



public interface PostDAO {
	
	public int insertPost(
			@Param("userId") int userId, 
			@Param("userName") String userName, 
			@Param("subject") String subject,
			@Param("genre") String genre,
			@Param("content") String content,
			@Param("broadcastdays") String broadcastdays,
			@Param("releasedate") String releasedate,
			@Param("year") int year,
			@Param("grade") Double grade,
			@Param("imagePath") String imagePath,
			@Param("videoPath") String videoPath
			);
	
	public List<Post> selectPostList();
	
	public List<Post> selectScoreList();
	
	public int selectCountSubject(@Param("subject") String subject);
	
	public Post selectPost(@Param("postId") int postId);
	
	public List<Post> searchGenreList(@Param("genre") List<String> genre);
	
	public List<Post> selectWeekList(@Param("broadcastdays") String broadcastdays);
	
	public List<Post> selectYearList();
	
	public List<Post> searchYearList(@Param("year") int year);
	
	public List<Post> searchSubjectList(@Param("subject") String subject);

}
