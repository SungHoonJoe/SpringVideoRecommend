package com.honftel.project.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.honftel.project.post.bo.PostBO;
import com.honftel.project.post.model.Post;
import com.honftel.project.post.model.PostDetail;

@Controller
@RequestMapping("/post")
public class PostController {
	
	@Autowired
	private PostBO postBO;
	
	@GetMapping("/homepage")
	public String homepage(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId  = (Integer) session.getAttribute("userId");
		//List<PostDetail> postList = postBO.getPostList(userId);
		List<Post> postList = postBO.getPostList();
		List<Post> scoreList = postBO.getScoreList();
		
		
		
		model.addAttribute("postList",postList);
		model.addAttribute("scoreList",scoreList);
		return "post/homepage";
	}
	
	@GetMapping("/recentshow")
	public String recentshow(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId  = (Integer) session.getAttribute("userId");
		//List<PostDetail> postList = postBO.getPostList(userId);
		List<Post> postList = postBO.getPostList();
		
		
		
		
		model.addAttribute("postList",postList);
		
		return "post/recentshow";
	}
	
	@GetMapping("/scoreshow")
	public String scoreshow(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId  = (Integer) session.getAttribute("userId");
		//List<PostDetail> postList = postBO.getPostList(userId);
		
		List<Post> scoreList = postBO.getScoreList();
		
		
		
		
		model.addAttribute("scoreList",scoreList);
		return "post/scoreshow";
	}
	
	@GetMapping("/weeksearch")
	public String weeksearch(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId  = (Integer) session.getAttribute("userId");
		//List<PostDetail> postList = postBO.getPostList(userId);
		List<Post> postList = postBO.getYearList();
		
		
		
		
		model.addAttribute("postList",postList);
		
		return "post/yearsearch";
	}
	
	
	
	@GetMapping("/yearsearch")
	public String yearsearch(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId  = (Integer) session.getAttribute("userId");
		//List<PostDetail> postList = postBO.getPostList(userId);
		List<Post> postList = postBO.getYearList();
		
		
		
		
		model.addAttribute("postList",postList);
		
		return "post/yearsearch";
	}
	@GetMapping("/yearinfo")
	public String yearinfo(@RequestParam("year") int year, Model model,HttpServletRequest request) {
		
		
		//List<PostDetail> postList = postBO.getPostList(userId);
		List<Post> postList = postBO. getYearSelectedList(year);
		
		
		
		
		model.addAttribute("postList",postList);
		
		return "post/yearinfo";
	}
	
	@GetMapping("/searchinfo")
	public String searchinfo(@RequestParam("subject") String subject, Model model,HttpServletRequest request) {
		
		
		//List<PostDetail> postList = postBO.getPostList(userId);
		List<Post> postList = postBO.getSubjectSelectedList(subject);
		
		
		
		
		model.addAttribute("postList",postList);
		
		return "post/searchinfo";
	}
	
	
	@GetMapping("/create_view")
	public String createView() {
		return "post/createView";
	}
	
	@GetMapping("/detail_view")
	public String detailView(@RequestParam("postId") int postId,Model model) {
		//id 로 셀렉트
		
		Post post = postBO.getPost(postId);
		model.addAttribute("post", post);
		
		
		return "post/detailView";
	}
	
	


}