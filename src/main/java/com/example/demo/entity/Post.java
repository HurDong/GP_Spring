package com.example.demo.entity;

import java.util.Date;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name = "POST")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Post {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "POST_NO_SEQ")
	@SequenceGenerator(name = "POST_NO_SEQ", sequenceName = "POST_NO_SEQ", allocationSize = 1)
	@Column(name = "NO", nullable = false)
	private Long no;

	@Column(name = "TITLE", length = 50)
	private String title;

	@Column(name = "CONTENT", length = 100)
	private String content;

	@Column(name = "REGDATE")
	private Date regDate;

	@Column(name = "LOCATION", length = 50)
	private String location;

	@ManyToOne
	@JoinColumn(name = "ID", insertable = false, updatable = false)
	private Member member;
}
