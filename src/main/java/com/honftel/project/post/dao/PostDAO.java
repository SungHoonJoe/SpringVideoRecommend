package com.honftel.project.post.dao;

import org.apache.ibatis.annotations.Param;

public interface PostDAO {
	
	public int insertPost(
			@Param("userId") int userId, 
			@Param("userName") String userName, 
			@Param("subject") String subject,
			@Param("genre") String genre,
			@Param("content") String content,
			@Param("broadcastdays") String broadcastdays,
			@Param("releasedate") String releasedate,
			@Param("grade") Double grade,
			@Param("imagePath") String imagePath,
			@Param("videoPath") String videoPath
			);

}
