package com.ibm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.ibm.domain.BoardDomain;
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
	
	@Select("SELECT meetingnoteid, version, title, projectid, divisionid, meetingtypeid, "
			+ "regmemberid, modmemberid, location, starttm, endtm, mainpoint, hit, statusid, statusdesc,"
			+ "DATE_FORMAT(regdate, '%Y-%m-%d %H:%i:%s') regdate, "
			+ "DATE_FORMAT(moddate, '%Y-%m-%d %H:%i:%s') moddate "
	+ "FROM MEETINGNOTE")
	public List<MeetingNoteDomain> selectMeetingNoteList();
	
	//---ANALYSIS---
	@Select("SELECT COUNT(meetingnoteid) meetingtypecount "
			+ "FROM MEETINGNOTE "
			+ "GROUP BY meetingtypeid desc")
	public List<Integer> countMeetingTypePerNote();	// analysis - chart 1
	
	@Select("SELECT meetingtypenm FROM MEETINGTYPE INNER JOIN MEETINGNOTE ON MEETINGNOTE.meetingtypeid = MEETINGTYPE.meetingtypeid GROUP BY meetingtypenm desc")
	public List<String> type_countMeetingTypePerNote();	// analysis - chart 1
	
	@Select("SELECT hit FROM MEETINGNOTE ORDER BY hit desc")
	public List<Integer> hitRanking();	// analysis - chart 4
	
	@Select("SELECT title FROM MEETINGNOTE ORDER BY hit desc")
	public List<String> title_hitRanking();	// analysis - chart 4
}
