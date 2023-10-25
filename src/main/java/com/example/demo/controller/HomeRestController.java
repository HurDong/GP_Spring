package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.MemberService;

@RestController
public class HomeRestController {
	
	@Autowired
	MemberService memberService;

	@GetMapping("/getRoadAddress")
	public String getRoadAddress(HttpSession session) {
	    String mid = (String) session.getAttribute("memberId"); // 세션에서 mid 가져오기
	    String roadAddress = memberService.getRoadAddressByMid(mid); // mid로 roadAddress 가져오기
	    return roadAddress;
	}
}
