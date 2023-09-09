package com.example.demo.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "MEMBER")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Member {
	@Id
	@Column(name = "ID", nullable = false, length = 50)
	private String id;

	@Column(name = "PWD", length = 50)
	private String pwd;

	@Column(name = "NAME", length = 50)
	private String name;

	@Column(name = "BIRTH")
	private Date birth;

	@Column(name = "GENDER")
	private Integer gender;

	@Column(name = "TEL", length = 50)
	private String tel;

	@Column(name = "POS", length = 50)
	private String pos;

	@Column(name = "FNAME", nullable = false, length = 50)
	private String fname;

	@ManyToOne
	@JoinColumn(name = "FNAME", insertable = false, updatable = false)
	private Friend friend;
}
