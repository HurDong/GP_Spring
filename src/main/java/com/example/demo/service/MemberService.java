package com.example.demo.service;

import java.util.Optional;

import com.example.demo.entity.Member;

public interface MemberService {
	Optional<Member> login(String mid, String mpwd);

	void registerMember(Member member);

	Member findMemberById(String memberId);

	void updateLocation(String memberId, String postcode, String roadAddress, String jibunAddress);
	
	String getRoadAddressByMid(String mid);
}
