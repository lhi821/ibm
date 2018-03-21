package com.ibm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.ibm.domain.MeetingNoteDomain;



@Mapper
public interface MypageMapper {

	
	@Select("SELECT * FROM MEETINGNOTE WHERE REGMEMBERID = #{usrId}")
	public List<MeetingNoteDomain> getMeetingNoteInfo(String usrId);
}
