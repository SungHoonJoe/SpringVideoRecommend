package com.honftel.project.post;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.honftel.project.post.bo.PostBO;



@RestController
@RequestMapping("/post")
public class PostRestController {
	
	@Autowired
	private PostBO postBO;
	
	@PostMapping("/create")
	public Map<String,String> create(
			@RequestParam("subject") String subject,
			@RequestParam("genre") String genre,
			@RequestParam("content") String content,
			@RequestParam("broadcastdays") String broadcastdays,
			@RequestParam("releasedate") String releasedate,
			@RequestParam("grade") double grade,
			@RequestParam("videoPath") String videoPath,
			@RequestParam("file") MultipartFile file,
			HttpServletRequest request
			
			){
		
		HttpSession session = request.getSession();
		// userId, userName
		
		
		// 현재 로그인된 사용자의 user 테이블
		int userId = (Integer)session.getAttribute("userId");
		String userName = (String)session.getAttribute("userName");
		 
		// year 컬럼이 releasedate 뒤에 추가되어 substring으로 연도를 추출하고 Integer.parseInt()로 int형으로 전환후 insert 쿼리에 추가한다
		
		String data =  releasedate;
		int year = Integer.parseInt(data.substring(0,4));
		int count = postBO.addPost(userId, userName, subject, genre, content, broadcastdays, releasedate, year, grade, videoPath, file);
		
		Map<String,String> result = new HashMap<>();
		
		
		if(count == 1) {
			result.put("result", "success");
		}else {
			result.put("result", "fail");
		}
		return result;
	}
	
	@PostMapping("/duplicate")
	public Map<String,String> duplicateId(@RequestParam("subject") String subject){
		 Map<String,String> result = new HashMap<>();
		 
		 if(postBO.isDuplicateSubject(subject)) {
			 result.put("isDuplicate", "true");
		 }else {
			 result.put("isDuplicate", "false");
		 }
		 
		return result;
		 
		 
	}
	
	

}
