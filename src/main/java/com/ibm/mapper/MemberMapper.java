package com.ibm.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

import com.ibm.domain.MemberDomain;

@Mapper
public interface MemberMapper {

	@Insert("INSERT INTO MEMBER (member_no, member_name, phone_number, email_addr, password, reg_date, mod_date, role_no) "
				+ "VALUES (#{memberNo}, #{memberName}, #{phoneNumber}, #{emailAddr}, #{password}, CURRENT_TIMESTAMP, NULL, #{roleNo})")
	public void insertMember(MemberDomain memberDomain);

}
