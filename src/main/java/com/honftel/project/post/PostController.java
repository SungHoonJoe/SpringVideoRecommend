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
import com.honftel.project.post.comment.bo.CommentBO;
import com.honftel.project.post.comment.model.Comment;
import com.honftel.project.post.model.Post;

@Controller
@RequestMapping("/post")
public class PostController {
	
	
	
	@Autowired
	private PostBO postBO;
	
	@Autowired
	private CommentBO commentBO;
	
	
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
	
	@GetMapping("/genresearch")
	public String genresearch(Model model,HttpServletRequest request) {
		
		
		//List<PostDetail> postList = postBO.getPostList(userId);
		
		
		return "post/genresearch";
	}
	
	@GetMapping("/genreinfo")
	public String genreinfo(@RequestParam("genre") List<String> genre, Model model,HttpServletRequest request) {
		
		
		//List<PostDetail> postList = postBO.getPostList(userId);
		List<Post> postList = postBO.getGenreSelectedList(genre);
		int count = postBO.getGenreSelectedCount(genre);
		
		
		
		model.addAttribute("postList",postList);
		model.addAttribute("count",count);
		return "post/genreinfo";
	}
	
	
	@GetMapping("/weeksearch")
	public String weeksearch(Model model,HttpServletRequest request) {
		
		
		//List<PostDetail> postList = postBO.getPostList(userId);
		List<Post> postList1 = postBO.getWeekList("월");
		List<Post> postList2 = postBO.getWeekList("화");
		List<Post> postList3 = postBO.getWeekList("수");
		List<Post> postList4 = postBO.getWeekList("목");
		List<Post> postList5 = postBO.getWeekList("금");
		List<Post> postList6 = postBO.getWeekList("토");
		List<Post> postList7 = postBO.getWeekList("일");
		
		
		
		
		model.addAttribute("postList1",postList1);
		model.addAttribute("postList2",postList2);
		model.addAttribute("postList3",postList3);
		model.addAttribute("postList4",postList4);
		model.addAttribute("postList5",postList5);
		model.addAttribute("postList6",postList6);
		model.addAttribute("postList7",postList7);
		
		return "post/weeksearch";
	}
	
	
	
	@GetMapping("/yearsearch")
	public String yearsearch(Model model,HttpServletRequest request) {
		
		
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
	public String detailView(@RequestParam("postId") int postId,Model model,HttpServletRequest request) {
		//id 로 셀렉트
		
		HttpSession session = request.getSession();
		int userId  = (Integer) session.getAttribute("userId");
		Post post = postBO.getPost(postId);
		
		List<Comment> comment = commentBO.getCommentList(postId);
		model.addAttribute("post", post);
		model.addAttribute("comment", comment);
		model.addAttribute("commentwriter", userId);
		
		return "post/detailView";
	}
	
	


}