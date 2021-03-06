package com.ibm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ibm.domain.BoardDomain;
import com.ibm.domain.MeetingNoteDomain;
import com.ibm.domain.NoteHeadDomain;

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
	

	@Insert("INSERT INTO NOTEHEAD ("
			+ "noteheadId, "
			+ "ALIAS, "
			+ "MEETINGTYPEID, "
			+ "TITLE, "
			+ "LOCATION, "
			+ "MEMBERID"
		+ ")"
		+ "VALUES ("
			+ "#{noteHeadId}, "
			+ "#{alias}, "
			+ "#{meetingTypeId}, "
			+ "#{title}, "
			+ "#{location}, "
			+ "#{memberId}"
		+ ")")
	public void setNoteHead(Map<String, Object> noteHeadMap);
	
	@Select("SELECT NOTEHEADID FROM NOTEHEAD ORDER BY NOTEHEADID DESC LIMIT 1")
	public String getLastNoteHeadId();
	
	@Insert("INSERT INTO NOTEHEAD_MEMBER ("
			+ "HEADMBRID, "
			+ "NOTEHEADID, "
			+ "MEMBERID"
		+ ")"
		+ "VALUES ("
			+ "#{headmbrId}, "
			+ "#{noteheadId}, "
			+ "#{memberId}"
		+ ")")
	public void createNoteHeadMbr(Map<String, Object> headMbrMap);
	
	@Select("SELECT HEADMBRID FROM NOTEHEAD_MEMBER ORDER BY HEADMBRID DESC LIMIT 1")
	public String getLastNoteHeadMmbId();
	
	@Select("SELECT NOTEHEADID, ALIAS, TITLE, MEETINGTYPE.MEETINGTYPEID as meetingTypeId, MEETINGTYPENM as MEETINGTYPE, LOCATION, MEMBERID FROM NOTEHEAD, MEETINGTYPE WHERE MEMBERID = #{memberId} "
				+ "AND NOTEHEAD.MEETINGTYPEID = MEETINGTYPE.MEETINGTYPEID")
	public List<NoteHeadDomain> getNoteHead(Map<String, Object> noteHeadMap);
	
	@Select("SELECT MEMBER.MEMBERID as MEMBERID, MEMBER.MEMBERNM as MEMBERNM " + 
					"FROM MEMBER, NOTEHEAD_MEMBER, NOTEHEAD " + 
					"WHERE MEMBER.MEMBERID= NOTEHEAD_MEMBER.MEMBERID " + 
					"AND NOTEHEAD.NOTEHEADID = NOTEHEAD_MEMBER.NOTEHEADID " + 
					"AND NOTEHEAD_MEMBER.NOTEHEADID = #{id}")
	public List<Map<String, String>> getAttendants(String id);

	@Select("SELECT meetingnoteid, version, title, projectid, divisionid, meetingtypeid, "
			+ "regmemberid, modmemberid, location, starttm, endtm, mainpoint, hit, statusid, statusdesc,"
			+ "DATE_FORMAT(regdate, '%Y-%m-%d %H:%i:%s') regdate, "
			+ "DATE_FORMAT(moddate, '%Y-%m-%d %H:%i:%s') moddate "
	+ "FROM MEETINGNOTE")
	public List<MeetingNoteDomain> selectMeetingNoteList();
	
	//---ANALYSIS---
	// chart 1
	@Select("SELECT COUNT(meetingnoteid) meetingtypecount "
			+ "FROM MEETINGNOTE "
			+ "GROUP BY meetingtypeid desc")
	public List<Integer> countMeetingTypePerNote();	
	
	@Select("SELECT meetingtypenm FROM MEETINGTYPE "
			+ "INNER JOIN MEETINGNOTE ON MEETINGNOTE.meetingtypeid = MEETINGTYPE.meetingtypeid "
			+ "GROUP BY meetingtypenm desc")
	public List<String> type_countMeetingTypePerNote();
	
	// chart 3
	@Select("SELECT count(meetingnoteid) from MEETINGNOTE")
	public int countMeetingNote();	
	
	@Select("select companynm from company "
			+ "inner join member on company.companyid = member.companyid "
			+ "inner join meetingnote on meetingnote.regmemberid = member.memberid "
			+ "group by companynm DESC")
	public List<String> companyRanking();
	
	@Select("select count(companynm) from company "
			+ "inner join member on company.companyid = member.companyid "
			+ "inner join meetingnote on meetingnote.regmemberid = member.memberid "
			+ "group by companynm DESC")
	public List<Integer> countCompanyRanking();
	
	// chart 4
	@Select("SELECT hit FROM MEETINGNOTE ORDER BY hit desc")
	public List<Integer> hitRanking();	
	
	@Select("SELECT title FROM MEETINGNOTE ORDER BY hit desc")
	public List<String> title_hitRanking();	

	@Update("Update MEETINGNOTE SET STATUSID = 3, STATUSDESC = '삭제' WHERE MEETINGNOTEID = #{meetingNoteId}")
	public void deleteMtn(Map<String, Object> requestMap);	

	
	@Insert("INSERT INTO FAVORITES ("
			+ "MEMBERID, "
			+ "FAVORITESTYPE, "
			+ "FAVORITESID"
		+ ")"
		+ "VALUES ("
			+ "#{memberId}, "
			+ "#{favoritetype}, "
			+ "#{favoriteId}"
		+ ")")
	public void favorite(Map<String, Object> requestMap);
	
	@Select("SELECT * FROM FAVORITES WHERE FAVORITESID = #{meetingNoteId}")
	public Map<String, Object> findFav(String meetingNoteId);
	
	@Select("SELECT * \r\n" + 
			"FROM FAVORITES, MEETINGNOTE \r\n" + 
			"where MEETINGNOTE.MEETINGNOTEID = FAVORITES.FAVORITESID\r\n" + 
			"and MEETINGNOTE.STATUSID not in (3, 4)\r\n" + 
			"and MEMBERID = #{memberId}")
	public List<Map<String, Object>> findFavList(String memberId);
}

