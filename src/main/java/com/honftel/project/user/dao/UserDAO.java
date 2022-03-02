package com.honftel.project.user.dao;

import org.apache.ibatis.annotations.Param;

import org.springframework.stereotype.Repository;

import com.honftel.project.user.model.User;

@Repository
public interface UserDAO {
	
	public int insertUser(
			@Param("loginId") String loginId,
			@Param("password") String password,
			@Param("name") String name,
			@Param("email") String email
			);
	
	public User selectUser(@Param("loginId") String loginId,@Param("password") String password);
	
	public int selectCountId(@Param("loginId") String loginId);
	
	

}
