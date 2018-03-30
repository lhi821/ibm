package com.ibm.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.ibm.domain.MeetingNoteDomain;

@Mapper
public interface IntegSearchMapper {

	@Select("select mtn.meetingnoteid, mtn.title, mtnc.contents, mtn.regmemberid, mtn.regdate, mtn.moddate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID " +
			"WHERE mtn.title LIKE CONCAT('%',UPPER(#{inputVal}),'%') "
			+ "OR "
			+ "mtnc.contents LIKE CONCAT('%',UPPER(#{inputVal}),'%') "
			+ "OR "
			+ "mtn.regmemberid LIKE CONCAT('%',UPPER(#{inputVal}),'%') ")
	public List<MeetingNoteDomain> getIntegSearchResult_all(MeetingNoteDomain mtnDomain);
	
	@Select("select mtn.meetingnoteid, mtn.title, mtnc.contents, mtn.regmemberid, mtn.regdate, mtn.moddate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID " +
			"WHERE mtn.title LIKE CONCAT('%',UPPER(#{inputVal}),'%')")
	public List<MeetingNoteDomain> getIntegSearchResult_title(MeetingNoteDomain mtnDomain);
	
	@Select("select mtn.meetingnoteid, mtn.title, mtnc.contents, mtn.regmemberid, mtn.regdate, mtn.moddate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID " +
			"WHERE mtnc.contents LIKE CONCAT('%',UPPER(#{inputVal}),'%')")
	public List<MeetingNoteDomain> getIntegSearchResult_content(MeetingNoteDomain mtnDomain);
	
	@Select("select mtn.meetingnoteid, mtn.title, mtnc.contents, mtn.regmemberid, mtn.regdate, mtn.moddate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID " +
			"WHERE mtn.regmemberid LIKE CONCAT('%',UPPER(#{inputVal}),'%')")
	public List<MeetingNoteDomain> getIntegSearchResult_regId(MeetingNoteDomain mtnDomain);
	
	
	
	
//날짜 하루씩 검색(기간검색 후 사용 안함)
	@Select("select mtn.meetingnoteid, mtn.title, mtnc.contents, mtn.regmemberid, mtn.regdate, mtn.moddate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID " +
			"WHERE DATE_FORMAT(mtn.regdate, '%Y-%m-%d') = #{regDate}")
	public List<MeetingNoteDomain> getIntegSearchResult_date(MeetingNoteDomain mtnDomain);

	
	
	
	
	@Select("select mtn.meetingnoteid, mtn.title, mtnc.contents, mtn.regmemberid, mtn.regdate, mtn.moddate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID " + 
			"WHERE DATE_FORMAT(mtn.regdate, '%Y-%m-%d') >= #{startTm} and DATE_FORMAT(mtn.regdate, '%Y-%m-%d') <= #{endTm}")
	public List<MeetingNoteDomain> getIntegSearchResult_onlyDate(MeetingNoteDomain mtnDomain);
	
	
	@Select("select mtn.meetingnoteid, mtn.title, mtnc.contents, mtn.regmemberid, mtn.regdate, mtn.moddate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID " +
			"WHERE (mtn.title LIKE CONCAT('%',UPPER(#{inputVal}),'%') "
			+ "OR "
			+ "mtnc.contents LIKE CONCAT('%',UPPER(#{inputVal}),'%') "
			+ "OR "
			+ "mtn.regmemberid LIKE CONCAT('%',UPPER(#{inputVal}),'%') ) "
			+ "AND (DATE_FORMAT(mtn.regdate, '%Y-%m-%d') >= #{startTm} and DATE_FORMAT(mtn.regdate, '%Y-%m-%d') <= #{endTm})")
	public List<MeetingNoteDomain> getIntegSearchResult_all_withDate(MeetingNoteDomain mtnDomain);

	
	@Select("select mtn.meetingnoteid, mtn.title, mtnc.contents, mtn.regmemberid, mtn.regdate, mtn.moddate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID " +
			"WHERE mtn.title LIKE CONCAT('%',UPPER(#{inputVal}),'%') "
			+ "AND DATE_FORMAT(mtn.regdate, '%Y-%m-%d') >= #{startTm} and DATE_FORMAT(mtn.regdate, '%Y-%m-%d') <= #{endTm}")
	public List<MeetingNoteDomain> getIntegSearchResult_title_withDate(MeetingNoteDomain mtnDomain);

	
	@Select("select mtn.meetingnoteid, mtn.title, mtnc.contents, mtn.regmemberid, mtn.regdate, mtn.moddate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID " +
			"WHERE mtnc.contents LIKE CONCAT('%',UPPER(#{inputVal}),'%') "
			+ "AND (DATE_FORMAT(mtn.regdate, '%Y-%m-%d') >= #{startTm} and DATE_FORMAT(mtn.regdate, '%Y-%m-%d') <= #{endTm})")
	public List<MeetingNoteDomain> getIntegSearchResult_content_withDate(MeetingNoteDomain mtnDomain);

	
	
	@Select("select mtn.meetingnoteid, mtn.title, mtnc.contents, mtn.regmemberid, mtn.regdate, mtn.moddate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID " +
			"WHERE mtn.regmemberid LIKE CONCAT('%',UPPER(#{inputVal}),'%') "
			+ "AND DATE_FORMAT(mtn.regdate, '%Y-%m-%d') >= #{startTm} and DATE_FORMAT(mtn.regdate, '%Y-%m-%d') <= #{endTm}")
	public List<MeetingNoteDomain> getIntegSearchResult_regId_withDate(MeetingNoteDomain mtnDomain);

	

}