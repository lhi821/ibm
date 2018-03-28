package com.ibm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ibm.domain.CompanyInfoDomain;
import com.ibm.domain.MeetingTypeCodeDomain;
import com.ibm.domain.MemberProjectDivisionDomain;

@Mapper
public interface AdminMapper {
	
	//TAB 1 [MeetingTypeCode Config]-----------------
	@Insert("INSERT INTO MEETINGTYPE (meetingTypeID, meetingTypeNM, meetingTypeDesc) "
			+ "VALUES (#{meetingTypeID}, #{meetingTypeNM}, #{meetingTypeDesc})")
	public void insertMeetingType(MeetingTypeCodeDomain meetingTypeCodeDomain);
	
	@Select("SELECT meetingtypeid, meetingtypenm, meetingtypedesc FROM MEETINGTYPE")
	public List<MeetingTypeCodeDomain> selectMeetingTypeList();
	
	@Select("SELECT meetingtypeid, meetingtypenm, meetingtypedesc FROM MEETINGTYPE ORDER BY meetingtypeid desc")
	public List<MeetingTypeCodeDomain> selectLatestMeetingType();
	
	@Update("UPDATE MEETINGTYPE "
			+ "SET meetingTypeNM = #{meetingTypeNM}, "
			        + "meetingTypeDesc = #{meetingTypeDesc}"
			+ "WHERE meetingTypeID = #{meetingTypeID}")
	public void updateMeetingType(MeetingTypeCodeDomain meetingTypeCodeDomain);
	
	@Delete("DELETE FROM MEETINGTYPE WHERE meetingtypeid = #{id}")      
	public void deleteMeetingType(@Param("id") String id);      
	
	
	//TAB 2 [CompanyInfo Config]-----------------
	@Insert("INSERT INTO COMPANY (companyID, companyNM, address, tel) "
			+ "VALUES (#{companyID}, #{companyNM}, #{address}, #{tel})")
	public void insertCompany(CompanyInfoDomain companyInfoDomain);
	
	@Select("SELECT companyid, companynm, address, tel FROM COMPANY")
	public List<CompanyInfoDomain> selectCompanyInfoList();
	
	@Select("SELECT companyid, companynm, address, tel FROM COMPANY ORDER BY companyid desc")
	public List<CompanyInfoDomain> selectLatestCompany();
	
	@Update("UPDATE COMPANY "
			+ "SET companyNM = #{companyNM}, "
			        + "address = #{address}, "
			        + "tel = #{tel} "
			+ "WHERE companyID = #{companyID}")
	public void updateCompany(CompanyInfoDomain companyInfoDomain);
	
	@Delete("DELETE FROM COMPANY WHERE companyid = #{id}")      
	public void deleteCompany(@Param("id") String id);     
	
	//TAB 3 [InviteMember Config]-----------------
	@Select("SELECT projectnm FROM MBR_PRJ_DIV A JOIN PROJECT B ON A.PROJECTID = B.PROJECTID WHERE memberID = #{memberid} AND roleid = 'ADMIN'")
	public List<String> selectProjectByAdmin(@Param("memberid") String memberid);

	
}
