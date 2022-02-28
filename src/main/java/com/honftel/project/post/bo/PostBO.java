package com.honftel.project.post.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.honftel.project.common.FileManagerService;
import com.honftel.project.post.dao.PostDAO;




@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;

	public int addPost(int userId, String userName,String subject,String genre, String content,String broadcastdays,String releasedate,double grade,String videoPath, MultipartFile file) {

		// 파일을 컴퓨터(서버)에 저장하고, 클라이언트(브라우저)가 접근 가능한 주소를 만들어 낸다.
		String filePath = FileManagerService.saveFile(userId, file);

		return postDAO.insertPost(userId, userName, content, filePath);
	}

}
