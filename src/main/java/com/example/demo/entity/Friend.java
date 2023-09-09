package com.example.demo.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "FRIEND")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Friend {

	@Id
	@Column(name = "FNAME", nullable = false, length = 50)
	private String fname;

	@Column(name = "FPOS", length = 50)
	private String fpos;

	@OneToMany(mappedBy = "friend")
	private List<Member> members;
}
