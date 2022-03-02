package com.honftel.project.user.bo;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.honftel.project.common.EncryptUtils;
import com.honftel.project.user.dao.UserDAO;
import com.honftel.project.user.model.User;

@Service
public class UserBO {
	
	@Autowired
	private UserDAO userDAO;
	
	
	public int addUser(String loginId,String password,String name,String email) {
		
		String encPassword = EncryptUtils.md5(password);
		return userDAO.insertUser(loginId, encPassword, name, email);
		
	}
	
	public User getUser(String loginId,String password) {
		
		String encPassword = EncryptUtils.md5(password);
		
		return userDAO.selectUser(loginId, encPassword);
		
	}
	
	public boolean isDuplicateId(String loginId) {
		
		int count = userDAO.selectCountId(loginId);
		
		if(count == 0) {
			return false;
		}else {
			return true;
		}
		
	}

}
