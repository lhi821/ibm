package com.ibm.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.ibm.domain.RoleDomain;

@Mapper
public interface RoleMapper {

	@Select("SELECT * FROM Role WHERE roleName = #{roleNameh}")
	public RoleDomain selectRoleByName(String roleName);

}
