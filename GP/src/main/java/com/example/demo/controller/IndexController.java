package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.example.demo.model.Post;
import com.example.demo.model.User;
import com.example.demo.repository.UserRepository;
import com.example.demo.service.PostService;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

@Controller
public class IndexController {

	@Autowired
	private UserRepository userRepository;

	@Autowired
    private PostService postService;

	@RequestMapping("/")

	public String index() {
		return "index";
	}

	@RequestMapping("/login")
	public String loginPage() {
		return "login";
	}

	@PostMapping("/perform_login")
	public void performLogin(@RequestParam("username") String username, @RequestParam("password") String password,
			HttpServletResponse response) throws IOException {
		User user = userRepository.findByUsernameAndPassword(username, password);
		if (user != null) {
			response.sendRedirect("/");
		} else {
			response.getWriter().write("<script>alert('아이디 또는 비밀번호가 틀립니다.'); location.href='/login';</script>");
		}
	}

	@GetMapping("/board")
	public String board() {
		return "board";
	}

	@GetMapping("/createPost")
	public String createPostForm() {
		return "createPost";
	}

	@PostMapping("/createPost")
	public String createPost(@RequestParam("title") String title, @RequestParam("content") String content,
			@RequestParam("rating") int rating, @RequestParam("location") String location) {
		Post post = new Post(title, content, rating, location);
		postService.savePost(post);
		return "redirect:/board";
	}
}
