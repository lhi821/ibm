package com.ibm.domain;

import java.sql.Date;

import javax.persistence.Column;

public class MemberProjectDivisionDomain {

	@Column(nullable = false, length=100)
	private String projectid;
	
	@Column(nullable = false, length=100)
	private String divisionid;
	
	@Column(nullable = false, length=100)
	private String memberid;
	
	@Column(nullable = false, length=100)
	private String roleid;
	
	@Column(nullable = false, length=100)
	private Date joindt;

	public String getProjectid() {
		return projectid;
	}

	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}

	public String getDivisionid() {
		return divisionid;
	}

	public void setDivisionid(String divisionid) {
		this.divisionid = divisionid;
	}

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public String getRoleid() {
		return roleid;
	}

	public void setRoleid(String roleid) {
		this.roleid = roleid;
	}

	public Date getJoindt() {
		return joindt;
	}

	public void setJoindt(Date joindt) {
		this.joindt = joindt;
	}
    
}
