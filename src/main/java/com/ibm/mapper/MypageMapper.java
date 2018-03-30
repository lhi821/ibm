package com.ibm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.ibm.domain.HitHistoryDomain;
import com.ibm.domain.MeetingNoteDomain;



@Mapper
public interface MypageMapper {

	
	@Select("SELECT * FROM MEETINGNOTE WHERE REGMEMBERID = #{usrId}")
	public List<MeetingNoteDomain> getMeetingNoteInfo(String usrId);
	
	@Insert("INSERT INTO HITHISTORY (memberId, meetingNoteId, hitDttm, hitHistoryDiv) "
			+ "VALUES (#{memberId}, #{meetingNoteId}, CURRENT_TIMESTAMP, #{hitHistoryDiv})")
	public void insertHistory(HitHistoryDomain hitHistoryDomain);

	
	@Select("select * "
			+ " from meetingnote mtn join hithistory hh "
				+ " on(mtn.meetingNoteId = hh.meetingNoteId) "
			+ "	order by hh.hitDttm desc"
			+ " limit 5")
	public List<MeetingNoteDomain> getViewHistory(HitHistoryDomain hitHistoryDomain);

	
	
}
