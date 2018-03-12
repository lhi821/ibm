package com.ibm.domain;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

public class RoleDomain {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int roleNo;
	
	private String roleName;
	
	private String description;

	public int getRoleNo() {
		return roleNo;
	}

	public void setRoleNo(int roleNo) {
		this.roleNo = roleNo;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
}