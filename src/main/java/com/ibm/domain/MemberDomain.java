package com.ibm.domain;

import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@EqualsAndHashCode(of = "memberNo")
@ToString
public @Data class MemberDomain {
	
	@Id
	@GeneratedValue
	private int memberNo;
	
	@Column(nullable = false, length=10)
	private String memberName;
	
	@Column(nullable = false, unique = true, length=50)
	private String phoneNumber;
	
	@Column(nullable = false, unique = true, length=50)
	private String emailAddr;
	
	@Column(nullable = false, length=50)
	private String password;
	
	@CreationTimestamp
	private Date regDate;
	
	@UpdateTimestamp
	private Date modDate;
	
	@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name="memberNo")
	private int roleNo;
}
