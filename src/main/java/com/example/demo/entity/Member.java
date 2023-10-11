package com.example.demo.entity;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

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
	private String mid;

	private String mpwd;

	private String mname;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mbirth;
	
	private String mtel;

	private String postcode;

	private String roadAddress;

	private String jibunAddress;

	/* private String mpos; */
}
