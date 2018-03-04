package com.ibm.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@EqualsAndHashCode(of = "roleNo")
@ToString
public class RoleDomain {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int roleNo;
	
	private String roleName;
	
	private String description;
}