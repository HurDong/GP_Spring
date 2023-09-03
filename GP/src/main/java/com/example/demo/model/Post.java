package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Post {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String title;
	private String content;
	private int rating;
	private String location;

	public Post() {
		// TODO Auto-generated constructor stub
	}

	public Post(Long id, String title, String content, int rating, String location) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.rating = rating;
		this.location = location;
	}

	public Post(String title, String content, int rating, String location) {
		this.title = title;
		this.content = content;
		this.rating = rating;
		this.location = location;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	@Override
	public String toString() {
		return "Post [id=" + id + ", title=" + title + ", content=" + content + ", rating=" + rating + ", location="
				+ location + "]";
	}
}
