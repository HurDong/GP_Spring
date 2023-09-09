package com.example.demo.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.entity.Friend;
import com.example.demo.repository.FriendRepository;
import com.example.demo.service.FriendService;

@Service
public class FriendServiceImpl implements FriendService {
	@Autowired
	private FriendRepository friendRepository;

	@Override
	public List<Friend> findAllFriends() {
		return friendRepository.findAll();
	}
}
