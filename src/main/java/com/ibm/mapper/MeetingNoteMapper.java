package com.ibm.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

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
	public void insertMeetingNote(MeetingNoteDomain meetingNoteDomain);
	
}
