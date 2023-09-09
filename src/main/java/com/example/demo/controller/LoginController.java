package com.example.demo.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Member;
import com.example.demo.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;

	@PostMapping("/login")
	public String login(@RequestParam String id, @RequestParam String pwd, Model model) {
		Optional<Member> member = memberService.login(id, pwd);
		if (member.isPresent()) {
			model.addAttribute("member", member.get());
			return "login/welcome";
		} else {
			model.addAttribute("error", "Invalid username or password");
			return "login/login_form";
		}
	}
}
