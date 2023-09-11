package com.example.demo.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.entity.Member;
import com.example.demo.service.MemberService;

@Controller
public class LoginController {
	@Autowired
	private MemberService memberService;

	@PostMapping("/login")
	public String login(@RequestParam String mid, @RequestParam String mpwd, Model model) {
		Optional<Member> member = memberService.login(mid, mpwd);
		if (member.isPresent()) {
			model.addAttribute("member", member.get());
			return "login/welcome";
		} else {
			model.addAttribute("error", "Invalid username or password");
			return "login/login_form";
		}
	}

	@GetMapping("/register")
	public String register() {
		return "login/register";
	}

	@PostMapping("/register")
	public String registerMember(@Valid Member member, BindingResult bindingResult, Model model) {

		if (bindingResult.hasErrors()) {
			return "register";
		}

		memberRepository.save(member);
		model.addAttribute("message", "회원가입이 성공적으로 완료되었습니다.");
		return "register_success";
	}
}
