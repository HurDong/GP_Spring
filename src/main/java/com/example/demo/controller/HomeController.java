package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.demo.entity.Member;
import com.example.demo.service.MemberService;

@Controller
public class HomeController {
	@Autowired
	MemberService memberService;

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

	@GetMapping("/mypage")
	public String myPage(HttpSession session, Model model) {
		String memberId = (String) session.getAttribute("memberId");
		if (memberId == null) {
			return "redirect:login";
		}
		Member member = memberService.findMemberById(memberId);
		model.addAttribute("member", member);
		return "mypage/main";
	}
}
