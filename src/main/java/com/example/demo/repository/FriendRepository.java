package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.demo.entity.Friend;

@Repository
public interface FriendRepository extends JpaRepository<Friend, String> {

}
