package com.ibm.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberRoleMapper {

	@Insert("INSERT INTO member_role (memberNo, roleNo) VALUES (#{memberNo}, #{roleNo})")
	public void insertMemberRole(@Param("memberNo") Integer memberNo, @Param("roleNo") Integer roleNo);

}
