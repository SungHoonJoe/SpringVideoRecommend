package com.honftel.project.post.bo;

import java.util.ArrayList;



import java.util.List;
import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.honftel.project.common.FileManagerService;
import com.honftel.project.post.comment.bo.CommentBO;
import com.honftel.project.post.comment.model.Comment;
import com.honftel.project.post.dao.PostDAO;
import com.honftel.project.post.model.Post;
import com.honftel.project.post.model.PostDetail;





@Service
public class PostBO {
	
	@Autowired
	private PostDAO postDAO;
	
	@Autowired
	private CommentBO commentBO;

	public int addPost(int userId, String userName,String subject,String genre, String content,String broadcastdays,String releasedate,int year,double grade,String videoPath, MultipartFile file) {

		// 파일을 컴퓨터(서버)에 저장하고, 클라이언트(브라우저)가 접근 가능한 주소를 만들어 낸다.
		String filePath = FileManagerService.saveFile(userId, file);

		return postDAO.insertPost(userId, userName, subject, genre, content, broadcastdays, releasedate, year, grade, filePath, videoPath);
	}
	
	public List<Post> getPostList() {
		// post 리스트 가져오기
		// post 대응하는 댓글 좋아요 가져오기
		// post 대응하는 댓글 좋아요 데이터 구조 만들기
		List<Post> postList = postDAO.selectPostList();
		
		
		
		return postList;
	}
	
	public List<PostDetail> getPostdetailList() {
		// post 리스트 가져오기
		// post 대응하는 댓글 좋아요 가져오기
		// post 대응하는 댓글 좋아요 데이터 구조 만들기
		List<Post> postList = postDAO.selectPostList();
		List<PostDetail> postDetailList = new ArrayList<>();
		
		for(Post post:postList) {
			// 해당하는  post id로 댓글 가져오기
			List<Comment> commentList = commentBO.getCommentList(post.getId());
		    
			PostDetail postDetail = new PostDetail();
			postDetail.setPost(post);
			postDetail.setCommentList(commentList);
			
			postDetailList.add(postDetail);
			
		}
		return postDetailList;
	}
	
	public List<Post> getScoreList() {
		List<Post> postList = postDAO.selectScoreList();
		
		return postList;
	}
	
	public List<Post> getGenreSelectedList(List<String> genre) {
		List<Post> postList = postDAO.searchGenreList(genre);
		
		return postList;
	}
	
	public int getGenreSelectedCount(List<String> genre) {
		 
		
		return postDAO.searchGenreCount(genre);
	}
	
	
	
	public List<Post> getWeekList(String broadcastdays) {
		List<Post> postList = postDAO.selectWeekList(broadcastdays);
		
		return postList;
	}
	
	
	public List<Post> getYearList() {
		List<Post> postList = postDAO.selectYearList();
		
		return postList;
	}
	
	public List<Post> getYearSelectedList(int year) {
		List<Post> postList = postDAO.searchYearList(year);
		
		return postList;
	}
	
	public List<Post> getSubjectSelectedList(String subject) {
		List<Post> postList = postDAO.searchSubjectList(subject);
		
		return postList;
	}
	
    public boolean isDuplicateSubject(String subject) {
		
		int count = postDAO.selectCountSubject(subject);
		
		if(count == 0) {
			return false;
		}else {
			return true;
		}
		
	}
	
	
	public Post getPost(int postId) {
		
		return postDAO.selectPost(postId);
	}
	
	public int deletePost(int postId, int userId) {

		

		// 포스트 삭제
		return;
	}

}
