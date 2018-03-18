package com.ibm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ibm.domain.AdminDomain;
import com.ibm.domain.BoardDomain;

@Mapper
public interface AdminMapper {
	
	@Insert("INSERT INTO MEETINGTYPE (meetingTypeID, meetingTypeNM, meetingTypeDesc) "
			+ "VALUES (#{meetingTypeID}, #{meetingTypeNM}, #{meetingTypeDesc})")
	public void insertMeetingType(AdminDomain adminDomain);
	
	@Select("SELECT meetingtypeid, meetingtypenm, meetingtypedesc FROM MEETINGTYPE")
	public List<AdminDomain> selectMeetingTypeList();
	
	@Select("SELECT meetingtypeid, meetingtypenm, meetingtypedesc FROM MEETINGTYPE ORDER BY meetingtypeid desc")
	public List<AdminDomain> selectLatestMeetingType();
	
	@Update("UPDATE MEETINGTYPE "
			+ "SET meetingTypeNM = #{meetingTypeNM}, "
			        + "meetingTypeDesc = #{meetingTypeDesc}"
			+ "WHERE meetingTypeID = #{meetingTypeID}")
	public void updateMeetingType(AdminDomain adminDomain);
	
	@Delete("DELETE FROM MEETINGTYPE WHERE meetingtypeid = #{id}")      
	public void deleteMeetingType(@Param("id") String id);      
}
