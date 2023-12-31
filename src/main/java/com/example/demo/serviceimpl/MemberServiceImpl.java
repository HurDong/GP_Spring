package com.example.demo.serviceimpl;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Member;
import com.example.demo.repository.MemberRepository;
import com.example.demo.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberRepository memberRepository;

	@Override
	public Optional<Member> login(String mid, String mpwd) {
		return memberRepository.findByMidAndMpwd(mid, mpwd);
	}

	@Override
	public void registerMember(Member member) {
		memberRepository.save(member);
	}

	@Override
	public Member findMemberById(String memberId) {
		return memberRepository.findById(memberId).orElse(null);
	}

	@Override
	public void updateLocation(String memberId, String postcode, String roadAddress, String jibunAddress) {
		Optional<Member> optionalMember = memberRepository.findById(memberId);
		if (optionalMember.isPresent()) {
			Member member = optionalMember.get();
			member.setPostcode(postcode);
			member.setRoadAddress(roadAddress);
			member.setJibunAddress(jibunAddress);
			memberRepository.save(member);
		} else {
			throw new IllegalArgumentException("해당하는 회원이 없습니다.");
		}

	}

	@Override
	public String getRoadAddressByMid(String mid) {
		Member member = memberRepository.findByMid(mid);
		if(member != null) {
			return member.getRoadAddress();
		}
		return null;
	}
}
