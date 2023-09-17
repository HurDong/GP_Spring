package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {
	@GetMapping("/home")
	public String home(HttpSession session) {
		if (session.getAttribute("memberId") != null) {
			return "logged_home";
		}
		return "home";
	}

	@GetMapping("/login")
	public String login(HttpSession session) {
		if (session.getAttribute("memberId") != null) {
			return "redirect:/logged_home";
		}
		return "login/login_form";
	}

	@GetMapping("/logged_home")
	public String loggedHome(HttpSession session) {
		if (session.getAttribute("memberId") != null) {
			return "logged_home";
		} else {
			return "home";
		}
	}
}
