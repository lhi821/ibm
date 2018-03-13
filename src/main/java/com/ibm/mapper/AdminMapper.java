package com.ibm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.ibm.domain.AdminDomain;

@Mapper
public interface AdminMapper {

	@Delete("DELETE FROM MEETINGTYPE WHERE meetingid = #{id}")      
	public void deleteMeetingType();      
	
	@Insert("INSERT INTO MEETINGTYPE (meetingTypeID, meetingTypeNM, meetingTypeDesc) "
			+ "VALUES (#{meetingTypeID}, #{meetingTypeNM}, #{meetingTypeDesc})")
	public void insertMeetingType(AdminDomain adminDomain);
	
	@Select("SELECT meetingtypeid, meetingtypenm, meetingtypedesc FROM MEETINGTYPE")
	public List<AdminDomain> selectMeetingTypeList();
	
	@Select("SELECT meetingtypeid, meetingtypenm, meetingtypedesc FROM MEETINGTYPE ORDER BY meetingtypeid desc")
	public List<AdminDomain> selectLatestMeetingType();
}
