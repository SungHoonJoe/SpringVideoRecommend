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
	public String timeline(Model model,HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		int userId  = (Integer) session.getAttribute("userId");
		//List<PostDetail> postList = postBO.getPostList(userId);
		
		
		
		//model.addAttribute("postList",postList);
		return "post/homepage";
	}
	
	
	@GetMapping("/create_view")
	public String createView() {
		return "post/createView";
	}
	
	@GetMapping("/detail_view")
	public String detailView(@RequestParam("postId") int postId,Model model) {
		//id 로 셀렉트
		
		//Post post = postBO.getPost(postId);
		model.addAttribute("post", post);
		
		
		return "post/detailView";
	}


}