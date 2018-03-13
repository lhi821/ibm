package com.ibm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.ibm.domain.AdminDomain;

@Mapper
public interface AdminMapper {

//	@Delete("DELETE FROM MEETINGTYPE")      
//	public void deleteMeetingType();      
	
	@Select("SELECT meetingtypeid, meetingtypenm, meetingtypedesc FROM MEETINGTYPE")
	public List<AdminDomain> selectMeetingTypeList();
}
