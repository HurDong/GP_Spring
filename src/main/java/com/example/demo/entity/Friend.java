package com.example.demo.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
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
