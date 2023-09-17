package com.example.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.entity.Member;
import com.example.demo.entity.Post;
import com.example.demo.service.MemberService;
import com.example.demo.service.PostService;

@Controller
public class PostController {
	@Autowired
	private PostService postService;
	
	@Autowired
	private MemberService memberService;

	@GetMapping("/createPost")
	public String createPostForm(Model model,HttpSession session) {
		String memberId = (String) session.getAttribute("memberId");
		System.out.println(memberId);
		if(memberId == null)
		{
			return "redirect:login";
		}
		model.addAttribute("post", new Post());
		return "post/createPost";
	}

	@PostMapping("/createPost")
	public String createPost(HttpSession session, @ModelAttribute Post post) {
		String memberId = (String) session.getAttribute("memberId");
		if (memberId != null) {
			Member member = memberService.findMemberById(memberId); // memberService를 사용하여 Member 엔터티 찾기
			if (member != null) {
				post.setMember(member); // Post 엔터티에 Member 엔터티 설정
				postService.savePost(post);
				return "redirect:/post";
			} else {
				// memberId에 해당하는 Member 엔터티가 없을 때의 처리 코드 (예: 오류 메시지 표시)
				return "redirect:error"; // 예시: 오류 페이지로 리다이렉트
			}
		} else {
			// memberId가 세션에 없을 때의 처리 코드 (예: 오류 메시지 표시)
			return "redirect:/login"; // 예시: 로그인 페이지로 리다이렉트
		}
	}

	@GetMapping("/post")
	public String listPosts(Model model) {
		List<Post> posts = postService.getAllPosts();
		model.addAttribute("posts", posts);
		return "post/post";
	}

	@GetMapping("/post/{id}")
	public String viewPost(@PathVariable Long id, Model model) {
		Post post = postService.getPostById(id);
		model.addAttribute("post", post);
		return "post/detail";
	}
}
