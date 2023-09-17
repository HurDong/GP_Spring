package com.example.demo.service;

import java.util.List;

import com.example.demo.entity.Post;

public interface PostService {
	public Post savePost(Post post);

	List<Post> getAllPosts();

	Post getPostById(Long id);
}
