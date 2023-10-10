package com.example.demo.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.service.MemberService;

@RestController
public class MyPageController {
	@Autowired
	private MemberService memberService; // MemberService는 주소 정보를 업데이트하는 로직을 포함하고 있다고 가정합니다.

	@PostMapping("/updateLocation")
	public String updateLocation(@RequestParam String postcode, @RequestParam String roadAddress,
			@RequestParam String jibunAddress, HttpSession session) {
		String memberId = (String) session.getAttribute("memberId");

		if (memberId == null) {
			return "로그인이 필요합니다.";
		}

		try {
			memberService.updateLocation(memberId, postcode, roadAddress, jibunAddress);
			return "위치가 성공적으로 업데이트되었습니다.";
		} catch (Exception e) {
			return "위치 업데이트에 실패했습니다: " + e.getMessage();
		}
	}
}
