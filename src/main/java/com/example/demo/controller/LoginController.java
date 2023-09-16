package com.example.demo.controller;

import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.demo.entity.Member;
import com.example.demo.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;

	@PostMapping("/login")
	public String login(@RequestParam String mid, @RequestParam String mpwd, Model model, RedirectAttributes redirect,
			HttpSession session) {
		Optional<Member> member = memberService.login(mid, mpwd);
		String memberId = (String) session.getAttribute("memberId");
		if (memberId != null) {
			return "logged_home";
		}
		if (mid.isEmpty() || mpwd.isEmpty()) {
			return "login/login_form";
		}
		if (member.isPresent()) {
			model.addAttribute("member", member.get());
			session.setAttribute("memberId", member.get().getMid());
			return "login/welcome";
		} else {
			model.addAttribute("error", "아이디 또는 비밀번호가 틀렸습니다!");
			return "login/login_form";
		}
	}

	@GetMapping("/register")
	public String register() {
		return "login/register";
	}

	@PostMapping("/register")
	public String registerMember(@ModelAttribute Member member) {
		memberService.registerMember(member);
		return "login/login_form";
	}

	@GetMapping("/logout")
	public String login(HttpSession session, RedirectAttributes redirect) {
		if (session.getAttribute("memberId") != null) {
			session.removeAttribute("memberId");
			redirect.addFlashAttribute("msg", "로그아웃이 완료되었습니다.");
			return "redirect:/home";
		}
		return "login/login_form";
	}
}
