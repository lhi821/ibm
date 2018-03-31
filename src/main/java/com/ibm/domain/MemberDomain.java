package com.ibm.domain;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


public class MemberDomain {
	
	@Column(nullable = false, unique = true, length=100)
	private String memberid;
	
	@Column(nullable = false, length=100)
	private String membernm;
	
	@Column(nullable = true, length=100)
	private String companyid;
	
	@Column(nullable = true, length=50)
	private String dept;
	
	@Column(nullable = true, length=50)
	private String jobs;
	
	@Column(nullable = true, length=100)
	private String phone;
	
	@Column(nullable = true, length=100)
	private String email;
	
	@Column(nullable = true, length=100)
	private String password;
	
	@Column(nullable = false, length=1)
	private String joinyn;
	
	private Date regdt;
	
	private Date moddt;

	
	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getMembernm() {
		return membernm;
	}

	public void setMembernm(String membernm) {
		this.membernm = membernm;
	}

	public String getCompanyid() {
		return companyid;
	}

	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	public String getJobs() {
		return jobs;
	}

	public void setJobs(String jobs) {
		this.jobs = jobs;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getJoinyn() {
		return joinyn;
	}

	public void setJoinyn(String joinyn) {
		this.joinyn = joinyn;
	}

	public Date getRegdt() {
		return regdt;
	}

	public void setRegdt(Date regdt) {
		this.regdt = regdt;
	}

	public Date getModdt() {
		return moddt;
	}

	public void setModdt(Date moddt) {
		this.moddt = moddt;
	}


}
