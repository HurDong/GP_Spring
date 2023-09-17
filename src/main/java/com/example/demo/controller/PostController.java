package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.example.demo.entity.Post;
import com.example.demo.service.PostService;

@Controller
public class PostController {
	@Autowired
	private PostService postService;

	@GetMapping("/createPost")
	public String createPostForm(Model model) {
		model.addAttribute("post", new Post());
		return "post/createPost";
	}

	@PostMapping("/createPost")
	public String createPost(@RequestBody Post post) {
		postService.savePost(post);
		return "redirect:post/posts";
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
