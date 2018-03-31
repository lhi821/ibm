package com.ibm.domain;

import java.sql.Date;

import javax.persistence.Column;

public class ProjectDomain {
	
	@Column(nullable = false, unique = true, length=100)
	private String projectid;
	
	@Column(nullable = false, length=100)
	private String projectnm;
	
	@Column(length=100)
	private String companyid;
	
	private Date startdt;

	private Date enddt;

	public String getProjectid() {
		return projectid;
	}

	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}

	public String getProjectnm() {
		return projectnm;
	}

	public void setProjectnm(String projectnm) {
		this.projectnm = projectnm;
	}

	public String getCompanyid() {
		return companyid;
	}

	public void setCompanyid(String companyid) {
		this.companyid = companyid;
	}

	public Date getStartdt() {
		return startdt;
	}

	public void setStartdt(Date startdt) {
		this.startdt = startdt;
	}

	public Date getEnddt() {
		return enddt;
	}

	public void setEnddt(Date enddt) {
		this.enddt = enddt;
	}
	
}
