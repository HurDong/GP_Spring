package com.example.demo.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

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
	@Column(name = "PNO", nullable = false)
	private Long pno;

	@Column(name = "PTITLE", length = 50)
	private String ptitle;

	@Column(name = "PCONTENT", length = 100)
	private String pcontent;

	@Column(name = "PREGDATE")
	@CreationTimestamp
	private Date pregdate;

	@Column(name = "PLOCATION", length = 50)
	private String plocation;
	
	@Column(name = "PRATING", length = 1)
	private Long prating;

	@ManyToOne
	@JoinColumn(name = "MID", insertable = true, updatable = true)
	private Member member;
}
