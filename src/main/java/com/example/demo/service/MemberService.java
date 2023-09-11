package com.example.demo.service;

import java.util.Optional;

import com.example.demo.entity.Member;

public interface MemberService {
	Optional<Member> login(String mid, String mpwd);
}
