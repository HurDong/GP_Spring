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
	@Column(name = "MID", nullable = false, length = 50)
	private String mid;

	@Column(name = "MPWD", length = 50)
	private String mpwd;

	@Column(name = "MNAME", length = 50)
	private String mname;

	@Column(name = "MBIRTH")
	private Date mbirth;

	@Column(name = "MGENDER")
	private Integer mgender;

	@Column(name = "MTEL", length = 50)
	private String mtel;

	@Column(name = "MPOS", length = 50)
	private String mpos;

	@Column(name = "FNAME", nullable = false, length = 50)
	private String fname;

	@ManyToOne
	@JoinColumn(name = "FNAME", insertable = false, updatable = false)
	private Friend friend;
}
