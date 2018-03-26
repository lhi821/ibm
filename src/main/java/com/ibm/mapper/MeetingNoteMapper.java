package com.ibm.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.ibm.domain.MeetingNoteDomain;

@Mapper
public interface MeetingNoteMapper {

	@Insert("INSERT INTO MEETINGNOTE ("
					+ "MEETINGNOTEID, "
					+ "VERSION, "
					+ "TITLE, "
					+ "PROJECTID, "
					+ "DIVISIONID, "
					+ "MEETINGTYPEID, "
					+ "REGMEMBERID, "
					+ "MODMEMBERID, "
					+ "LOCATION, "
					+ "STARTTM, "
					+ "ENDTM, "
					+ "MAINPOINT, "
					+ "HIT, "
					+ "STATUSID, "
					+ "STATUSDESC, "
					+ "REGDATE, "
					+ "MODDATE"
				+ ")"
				+ "VALUES ("
					+ "#{meetingNoteId}, "
					+ "#{version}, "
					+ "#{title}, "
					+ "#{projectId}, "
					+ "#{divisionId}, "
					+ "#{meetingTypeId}, "
					+ "#{regMemberId}, "
					+ "#{modMemberId}, "
					+ "#{location}, "
					+ "#{startTm}, "
					+ "#{endTm}, "
					+ "#{mainPoint}, "
					+ "#{hit}, "
					+ "#{statusId}, "
					+ "#{statusDesc}, "
					+ "CURRENT_TIMESTAMP, "
					+ "CURRENT_TIMESTAMP"
				+ ")")
	public void insertMeetingNote(Map<String, Object> meetingNoteMap);
	
	@Select("SELECT MEETINGNOTEID FROM MEETINGNOTE ORDER BY MEETINGNOTEID DESC LIMIT 1")
	public String getLastMeetingNoteId();
	
	
	@Insert("INSERT INTO MTNCONTENTS ("
			+ "MEETINGNOTEID, "
			+ "VERSION, "
			+ "SEQ, "
			+ "SPEAKERID, "
			+ "CONTENTS"
		+ ")"
		+ "VALUES ("
			+ "#{meetingNoteId}, "
			+ "#{version}, "
			+ "#{seq}, "
			+ "#{speakerId}, "
			+ "#{contents}"
		+ ")")
	public void insertMtnContents(Map<String, Object> mtnContentsMap);
	
	@Insert("INSERT INTO ATTENDEE ("
			+ "MEETINGNOTEID, "
			+ "VERSION, "
			+ "SEQ, "
			+ "MEMBERID"
		+ ")"
		+ "VALUES ("
			+ "#{meetingNoteId}, "
			+ "#{version}, "
			+ "#{seq}, "
			+ "#{memberId}"
		+ ")")
	public void insertMtnAtentants(Map<String, Object> attenantsMap);
}
