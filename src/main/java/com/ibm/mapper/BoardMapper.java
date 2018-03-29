package com.ibm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Options;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.ibm.domain.BoardDomain;

@Mapper
public interface BoardMapper {

	@Select("SELECT id, title, contents, "
						+ "DATE_FORMAT(reg_date, '%Y-%m-%d %H:%i:%s') reg_date, "
						+ "DATE_FORMAT(mod_date, '%Y-%m-%d %H:%i:%s') mod_date "
				+ "FROM BOARD "
				+ "WHERE id = #{id}")
	public BoardDomain selectBoard(@Param("id") int id);
	
	@Insert("INSERT INTO BOARD (title, contents, reg_date, mod_date) "
				+ "VALUES (#{title}, #{contents}, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)")
	@Options(useGeneratedKeys=true, keyProperty="id", keyColumn = "id")
	public void insertBoard(BoardDomain boardDomain);
	
	@Update("UPDATE BOARD "
				+ "SET title = #{title}, "
						+ "contents = #{contents}, "
						+ "mod_date = CURRENT_TIMESTAMP "
				+ "WHERE id = #{id}")
	public void updateBoard(BoardDomain boardDomain);
	
	@Delete("DELETE FROM BOARD WHERE id = #{id}")
	public void deleteBoard(@Param("id") int id);
	
	@Select("SELECT id, title, contents, "
						+ "DATE_FORMAT(reg_date, '%Y-%m-%d %H:%i:%s') reg_date, "
						+ "DATE_FORMAT(mod_date, '%Y-%m-%d %H:%i:%s') mod_date "
				+ "FROM BOARD")
	public List<BoardDomain> selectBoardList();
	
	
	@Select("SELECT MEETINGNOTE.MEETINGNOTEID as meetingNoteId, MEETINGNOTE.VERSION, TITLE as title, CONTENTS as contents, MEETINGTYPENM as meetingNoteNm, MODMEMBERID as regMemberId, HIT as hit, DATE_FORMAT(MODDATE, '%Y-%m-%d %H:%i:%s') modDate\r\n" + 
			"FROM MEETINGNOTE, MEETINGTYPE, MTNCONTENTS\r\n" + 
			"WHERE MEETINGNOTE.MEETINGTYPEID = MEETINGTYPE.MEETINGTYPEID\r\n" + 
			"and MEETINGNOTE.MEETINGNOTEID = MTNCONTENTS.MEETINGNOTEID\r\n" + 
			"and MTNCONTENTS.seq = 1;")
	public List<Map<String, Object>> getMeetingNote(Map<String, Object> requestMap);
	
	@Select("Select * From MEETINGNOTE where MEETINGNOTEID = #{meetingNoteId}")
	public Map<String, Object> selectMeetingNote(String meetingNoteId);
	
	@Select("Select * From ACTIONITEM where MEETINGNOTEID = #{meetingNoteId}")
	public List<Map<String, Object>> selectMeetingNoteActionItem(String meetingNoteId);

	@Select("Select * From MTN_HASHTAG, HASHTAG where MTN_HASHTAG.HASHTAGID = HASHTAG.HASHTAGID "
				+ "AND MEETINGNOTEID = #{meetingNoteId}")
	public List<Map<String, Object>> selectMeetingNoteHashTag(String meetingNoteId);
	
	@Select("select * " + 
					"from meetingNote, attendee, member " + 
					"where meetingNote.meetingnoteId = attendee.meetingnoteId " + 
					"and attendee.memberid = member.memberid " + 
					"and meetingNote.meetingnoteId = #{meetingNoteId}")
	public List<Map<String, Object>> selectMeetingNoteAttendant(String meetingNoteId);
	
	@Select("select * " + 
					"from meetingNote, mtncontents, member " + 
					"where meetingNote.meetingnoteId = mtncontents.meetingnoteId " + 
					"and mtncontents.speakerId = member.memberId " +
					"and meetingNote.meetingnoteId = #{meetingNoteId}")
	public List<Map<String, Object>> selectMeetingNoteContent(String meetingNoteId);
	
	@Select("SELECT * FROM MEETINGTYPE WHERE MEETINGTYPEID = #{meetingTypeId}")
	public Map<String, Object> selectMeetingTypeNmbyId(String meetingTypeId);
}
