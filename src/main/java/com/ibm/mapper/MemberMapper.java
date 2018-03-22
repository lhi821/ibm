package com.ibm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ibm.domain.MemberDomain;

@Mapper
public interface MemberMapper {

	@Insert("INSERT INTO MEMBER (memberName, phoneNumber, emailAddr, password, regDate)"
				+ "VALUES (#{memberName}, #{phoneNumber}, #{emailAddr}, #{password}, CURRENT_TIMESTAMP)")
	public void insertMember(MemberDomain memberDomain);
	
	@Select("SELECT * FROM MEMBER WHERE memberNo = #{memberNo}")
	public MemberDomain selectMember(MemberDomain memberDomain);
	
	@Select("SELECT * FROM MEMBER WHERE emailAddr = #{emailAddr}")
	public MemberDomain selectMemberByEmail(String emailAddr);

	@Select("SELECT * FROM MEMBER WHERE EMAIL = #{email} AND JOINYN = 'Y'")
	public MemberDomain login(@Param("email") String email, @Param("password") String password);

	@Insert("INSERT INTO MEMBER (memberid, membernm, companyid, dept, jobs, phone, email, password, joinyn, regdt, moddt)"
			+ "VALUES (#{memberid}, #{membernm}, #{companyid}, #{dept}, #{jobs}, #{phone}, #{email}, #{password}, #{joinyn}, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)")
	public void createMember(MemberDomain memberDomain);
	
	@Select("SELECT * FROM MEMBER "
			+ "WHERE memberid = #{searchKey} "
			+ "OR membernm = #{searchKey} "
			+ "OR companyid = #{searchKey} "
			+ "OR dept = #{searchKey} "
			+ "OR phone = #{searchKey} "
			+ "OR email = #{searchKey}")
	public List<MemberDomain> selectMemberByKeyword(Map<String, String> MemberMap);
	
}
