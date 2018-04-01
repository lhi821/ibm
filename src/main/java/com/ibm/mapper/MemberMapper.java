package com.ibm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	
	@Update("UPDATE MEMBER "
			+ "SET companyid = #{companyid}, dept = #{dept}, jobs = #{jobs}, phone = #{phone}, email = #{email},  moddt = CURRENT_TIMESTAMP "
			+ "WHERE memberid = #{memberid} ")
	public void editMember(MemberDomain memberDomain);
	
	@Update("UPDATE MEMBER "
			+ "SET password = #{password},  moddt = CURRENT_TIMESTAMP "
			+ "WHERE memberid = #{memberid} ")
	public void editPassword(MemberDomain memberDomain);
	
	@Select("SELECT * FROM MEMBER WHERE memberid = #{memberid}")
	public MemberDomain selectMember_edit(MemberDomain memberDomain);
	
	@Select("SELECT * FROM MEMBER "
			+ "WHERE memberid = #{searchKey} "
			+ "OR membernm = #{searchKey} "
			+ "OR companyid = #{searchKey} "
			+ "OR dept = #{searchKey} "
			+ "OR phone = #{searchKey} "
			+ "OR email = #{searchKey}")
	public List<MemberDomain> selectMemberByKeyword(Map<String, String> MemberMap);
	
	@Select("SELECT MEMBERID FROM MEMBER ORDER BY MEMBERID DESC LIMIT 1")
	public String getLastMemberId();
	
	@Select("SELECT A.memberid memberid, membernm, companyid, dept, email " + 
			"FROM member A JOIN mbr_prj_div B ON A.MEMBERID = B.MEMBERID " + 
			"WHERE B.PROJECTID = #{projectid} "
			+ "AND B.ROLEID = 'USER' "
			+ "GROUP BY MEMBERID, MEMBERNM, COMPANYID, DEPT, EMAIL")
	public List<MemberDomain> selectMemberByProject(String projectid);
	
	@Select("SELECT A.memberid memberid, membernm, companyid, dept, email " + 
			"FROM member A LEFT JOIN mbr_prj_div B ON A.MEMBERID = B.MEMBERID " + 
			"AND B.PROJECTID = #{projectid} "
			+ "WHERE B.MEMBERID IS NULL")
	public List<MemberDomain> selectNonMemberByProject(String projectid);
	
	@Select("SELECT MEMBERNM FROM MEMBER WHERE MEMBERID = #{modMemberId}")
	public String getMemberNm(String modMemberId);
	
}
