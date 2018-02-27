package com.ibm.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.ibm.domain.MemberDomain;

@Mapper
public interface MemberMapper {

	@Insert("INSERT INTO MEMBER (memberNo, memberName, phoneNumber, emailAddr, password, regDate)"
				+ "VALUES (#{memberNo}, #{memberName}, #{phoneNumber}, #{emailAddr}, #{password}, CURRENT_TIMESTAMP)")
	public void insertMember(MemberDomain memberDomain);
	
	@Select("SELECT * FROM MEMBER WHERE memberNo = #{memberNo}")
	public MemberDomain selectMember(MemberDomain memberDomain);
	
	@Select("SELECT * FROM MEMBER WHERE emailAddr = #{emailAddr}")
	public MemberDomain selectMemberByEmail(String emailAddr);

}
