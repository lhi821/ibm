package com.ibm.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@ToString
public class MemberRoleDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long rno;
	
	private String roleName;

	public void setRoleName(String string) {
		// TODO Auto-generated method stub
		
	}
	
}
