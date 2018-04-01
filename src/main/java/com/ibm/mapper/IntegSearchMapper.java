package com.ibm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.ibm.domain.MeetingNoteDomain;

@Mapper
public interface IntegSearchMapper {

	@Select("select distinct MEETINGNOTE.meetingnoteid as meetingNoteId, MEETINGNOTE.meetingtypeid as meetingTypeId, meetingtype.codecolor as codeColor, member.membernm as memberNm, MEETINGNOTE.title as title, MTNCONTENTS.contents as contents,  MEETINGNOTE.regmemberid as regMemberId, MEETINGNOTE.modmemberid as modMemberId, MEETINGNOTE.regdate as regDate, MEETINGNOTE.moddate as modDate " +
			"from MEETINGNOTE, MEETINGTYPE, MTNCONTENTS, mtn_hashtag, hashTag, member " +
			"where MEETINGNOTE.MEETINGNOTEID = MTNCONTENTS.MEETINGNOTEID " +
			"and MEETINGNOTE.MEETINGTYPEID = MEETINGTYPE.MEETINGTYPEID " +
			"and MEETINGNOTE.MEETINGNOTEID = mtn_hashtag.MEETINGNOTEID " +
			"and mtn_hashtag.HASHTAGID = hashTag.HASHTAGID " +
			"and MEETINGNOTE.modmemberid = member.MEMBERID " +
			"and MEETINGNOTE.STATUSID not in (3, 4) " +	
			"and (MEETINGNOTE.title LIKE CONCAT ('%',UPPER(#{inputVal}),'%') " +
			"OR MTNCONTENTS.contents LIKE CONCAT ('%',UPPER(#{inputVal}),'%') " +
			"OR member.memberNm LIKE CONCAT('%',UPPER(#{inputVal}),'%') " + 
			"OR hashTag.hashTag LIKE CONCAT('%',UPPER(#{inputVal}),'%')) "
			+ "and MTNCONTENTS.seq = 1 ")
	public List<Map<String, Object>> getIntegSearchResult_all(MeetingNoteDomain mtnDomain);
	
	
	@Select("select distinct mtn.meetingnoteid as meetingNoteId, mtn.meetingtypeid as meetingTypeId, meetingtype.codecolor as codeColor, mb.membernm as memberNm, mtn.title as title, mtnc.contents as contents,  mtn.regmemberid as regMemberId, mtn.modmemberid as modMemberId, mtn.regdate as regDate, mtn.moddate as modDate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID, member mb, MEETINGTYPE " +
			"WHERE mtn.modmemberid = mb.memberid " +
			"and mtn.STATUSID not in (3, 4) " +
			"and mtn.MEETINGTYPEID = MEETINGTYPE.MEETINGTYPEID " +
			"and mtn.title LIKE CONCAT('%',UPPER(#{inputVal}),'%')"
			+ " and mtnc.seq = 1")
	public List<Map<String, Object>> getIntegSearchResult_title(MeetingNoteDomain mtnDomain);
	
	
	@Select("select distinct mtn.meetingnoteid as meetingNoteId, mtn.meetingtypeid as meetingTypeId, meetingtype.codecolor as codeColor, mb.membernm as memberNm,  mtn.title as title, mtnc.contents as contents,  mtn.regmemberid as regMemberId, mtn.modmemberid as modMemberId, mtn.regdate as regDate, mtn.moddate as modDate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID, member mb, MEETINGTYPE " +
			"WHERE mtn.modmemberid = mb.memberid " +
			"and mtn.STATUSID not in (3, 4) " +
			"and mtn.MEETINGTYPEID = MEETINGTYPE.MEETINGTYPEID " +
			"and mtnc.contents LIKE CONCAT('%',UPPER(#{inputVal}),'%')"
			+ " and mtnc.seq = 1")
	public List<Map<String, Object>> getIntegSearchResult_content(MeetingNoteDomain mtnDomain);
	
	
	@Select("select distinct mtn.meetingnoteid as meetingNoteId, mtn.meetingtypeid as meetingTypeId, meetingtype.codecolor as codeColor, mb.membernm as memberNm, mtn.title as title, mtnc.contents as contents,  mtn.regmemberid as regMemberId, mtn.modmemberid as modMemberId, mtn.regdate as regDate, mtn.moddate as modDate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID, member mb, MEETINGTYPE " +
			"WHERE mtn.modmemberid = mb.memberid " +
			"and mtn.STATUSID not in (3, 4) " +
			"and mtn.MEETINGTYPEID = MEETINGTYPE.MEETINGTYPEID " +
			"and memberNm LIKE CONCAT('%',UPPER(#{inputVal}),'%')"
			+ "and mtnc.seq = 1")
	public List<Map<String, Object>> getIntegSearchResult_regId(MeetingNoteDomain mtnDomain);
	
	@Select("select distinct MEETINGNOTE.meetingnoteid as meetingNoteId, MEETINGNOTE.meetingtypeid as meetingTypeId, meetingtype.codecolor as codeColor, member.membernm as memberNm, MEETINGNOTE.title as title, MTNCONTENTS.contents as contents, MEETINGNOTE.regmemberid as regMemberId, MEETINGNOTE.modmemberid as modMemberId, MEETINGNOTE.regdate as regDate, MEETINGNOTE.moddate as modDate, hashtag.hashtag as hashTag " +
			"from MEETINGNOTE, MEETINGTYPE, MTNCONTENTS, mtn_hashtag, hashTag, member " +
			"where MEETINGNOTE.MEETINGNOTEID = MTNCONTENTS.MEETINGNOTEID " +
			"and MEETINGNOTE.MEETINGNOTEID = mtn_hashtag.MEETINGNOTEID " +
			"and mtn_hashtag.HASHTAGID = hashTag.HASHTAGID " +
			"and MEETINGNOTE.modmemberid = member.MEMBERID " +
			"and MEETINGNOTE.STATUSID not in (3, 4) " +
			"and MEETINGNOTE.MEETINGTYPEID = MEETINGTYPE.MEETINGTYPEID " +
			"and hashTag.hashTag LIKE CONCAT('%',UPPER(#{inputVal}),'%') "
			+ "and MTNCONTENTS.seq = 1")
	public List<Map<String, Object>> getIntegSearchResult_hashTag(MeetingNoteDomain mtnDomain);
	
	
	@Select("select distinct mtn.meetingnoteid as meetingNoteId, mtn.meetingtypeid as meetingTypeId, meetingtype.codecolor as codeColor, mb.membernm as memberNm, mtn.title as title, mtnc.contents as contents, mtn.regmemberid as regMemberId, mtn.modmemberid as modMemberId, mtn.regdate as regDate, mtn.moddate as modDate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID, member mb, MEETINGTYPE " + 
			"WHERE mtn.modmemberid = mb.memberid " +
			"and mtn.STATUSID not in (3, 4) " +
			"and mtn.MEETINGTYPEID = MEETINGTYPE.MEETINGTYPEID " +
			"and DATE_FORMAT(mtn.regdate, '%Y-%m-%d') >= #{startTm} and DATE_FORMAT(mtn.regdate, '%Y-%m-%d') <= #{endTm}"//여기 띄어쓰기 안해도되냐고 
			+ " and mtnc.seq = 1")
	public List<Map<String, Object>> getIntegSearchResult_onlyDate(MeetingNoteDomain mtnDomain);
	
	
	@Select("select distinct MEETINGNOTE.meetingnoteid as meetingNoteId, MEETINGNOTE.meetingtypeid as meetingTypeId, meetingtype.codecolor as codeColor member.membernm as memberNm, MEETINGNOTE.title as title, MTNCONTENTS.contents as contents, MEETINGNOTE.regmemberid as regMemberId, MEETINGNOTE.modmemberid as modMemberId, MEETINGNOTE.regdate as regDate, MEETINGNOTE.moddate as modDate " +
			"from MEETINGNOTE, MEETINGTYPE, MTNCONTENTS, mtn_hashtag, hashTag, member " +
			"where MEETINGNOTE.MEETINGNOTEID = MTNCONTENTS.MEETINGNOTEID " +
			"and MEETINGNOTE.MEETINGNOTEID = mtn_hashtag.MEETINGNOTEID " +
			"and mtn_hashtag.HASHTAGID = hashTag.HASHTAGID " +
			"and MEETINGNOTE.modmemberid = member.MEMBERID " +
			"and MEETINGNOTE.STATUSID not in (3, 4) " +
			"and MEETINGNOTE.MEETINGTYPEID = MEETINGTYPE.MEETINGTYPEID " +
			"and (MEETINGNOTE.title LIKE CONCAT ('%',UPPER(#{inputVal}),'%') " +
			"OR MTNCONTENTS.contents LIKE CONCAT ('%',UPPER(#{inputVal}),'%') " +
			"OR member.memberNm LIKE CONCAT('%',UPPER(#{inputVal}),'%') " + 
			"OR hashTag.hashTag LIKE CONCAT('%',UPPER(#{inputVal}),'%')) " +
			"AND (DATE_FORMAT(MEETINGNOTE.regdate, '%Y-%m-%d') >= #{startTm} and DATE_FORMAT(MEETINGNOTE.regdate, '%Y-%m-%d') <= #{endTm})"
			+ " and MTNCONTENTS.seq = 1")
	public List<Map<String, Object>> getIntegSearchResult_all_withDate(MeetingNoteDomain mtnDomain);

	
	@Select("select distinct mtn.meetingnoteid as meetingNoteId, mtn.meetingtypeid as meetingTypeId, meetingtype.codecolor as codeColor, mb.membernm as memberNm, mtn.title as title, mtnc.contents as contents, mtn.regmemberid as regMemberId, mtn.modmemberid as modMemberId, mtn.regdate as regDate, mtn.moddate as modDate " + 
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID, member mb, MEETINGTYPE " +
			"WHERE mtn.modmemberid = mb.memberid" +
			"and mtn.STATUSID not in (3, 4) " +
			"and mtn.MEETINGTYPEID = MEETINGTYPE.MEETINGTYPEID " +
			"and mtn.title LIKE CONCAT('%',UPPER(#{inputVal}),'%') " +
			"AND DATE_FORMAT(mtn.regdate, '%Y-%m-%d') >= #{startTm} and DATE_FORMAT(mtn.regdate, '%Y-%m-%d') <= #{endTm} "
			+ "mtnc.seq = 1")
	public List<Map<String, Object>> getIntegSearchResult_title_withDate(MeetingNoteDomain mtnDomain);

	
	@Select("select distinct mtn.meetingnoteid as meetingNoteId, mtn.meetingtypeid as meetingTypeId, meetingtype.codecolor as codeColor, mb.membernm as memberNm, mtn.title as title, mtnc.contents as contents, mtn.regmemberid as regMemberId, mtn.modmemberid as modMemberId, mtn.regdate as regDate, mtn.moddate as modDate " +
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID, member mb, MEETINGTYPE " +
			"WHERE mtn.modmemberid = mb.memberid and " +
			"and mtn.STATUSID not in (3, 4) " +
			"and mtn.MEETINGTYPEID = MEETINGTYPE.MEETINGTYPEID " +
			"mtnc.contents LIKE CONCAT('%',UPPER(#{inputVal}),'%') " + 
			"AND (DATE_FORMAT(mtn.regdate, '%Y-%m-%d') >= #{startTm} and DATE_FORMAT(mtn.regdate, '%Y-%m-%d') <= #{endTm}) "
			+ "and mtnc.seq = 1")
	public List<Map<String, Object>> getIntegSearchResult_content_withDate(MeetingNoteDomain mtnDomain);

	
	
	@Select("select distinct mtn.meetingnoteid as meetingNoteId, mtn.meetingtypeid as meetingTypeId, meetingtype.codecolor as codeColor, mb.membernm as memberNm, mtn.title as title, mtnc.contents as contents, mtn.regmemberid as regMemberId, mtn.modmemberid as modMemberId, mtn.regdate as regDate, mtn.moddate as modDate " +
			"from MEETINGNOTE mtn left JOIN MTNCONTENTS mtnc on mtn.MEETINGNOTEID  = mtnc.MEETINGNOTEID, member mb, MEETINGTYPE " +
			"WHERE mtn.modmemberid = mb.memberid " +
			"and mtn.STATUSID not in (3, 4) " +
			"and mtn.MEETINGTYPEID = MEETINGTYPE.MEETINGTYPEID " +
			"and memberNm LIKE CONCAT('%',UPPER(#{inputVal}),'%') " +
			"AND DATE_FORMAT(mtn.regdate, '%Y-%m-%d') >= #{startTm} and DATE_FORMAT(mtn.regdate, '%Y-%m-%d') <= #{endTm} "
			+ "and mtnc.seq = 1")
	public List<Map<String, Object>> getIntegSearchResult_regId_withDate(MeetingNoteDomain mtnDomain);
	
	@Select("select distinct MEETINGNOTE.meetingnoteid as meetingNoteId, MEETINGNOTE.meetingtypeid as meetingTypeId, meetingtype.codecolor as codeColor, member.membernm as memberNm, MEETINGNOTE.title as title, MTNCONTENTS.contents as contents, MEETINGNOTE.regmemberid as regMemberId, MEETINGNOTE.modmemberid as modMemberId, MEETINGNOTE.regdate as regDate, MEETINGNOTE.moddate as modDate " +
			"from MEETINGNOTE, MEETINGTYPE, MTNCONTENTS, mtn_hashtag, hashTag, member " +
			"where MEETINGNOTE.MEETINGNOTEID = MTNCONTENTS.MEETINGNOTEID " +
			"and MEETINGNOTE.MEETINGNOTEID = mtn_hashtag.MEETINGNOTEID " +
			"and mtn_hashtag.HASHTAGID = hashTag.HASHTAGID " +
			"and MEETINGNOTE.modmemberid = member.MEMBERID " +
			"and MEETINGNOTE.STATUSID not in (3, 4) " +
			"and MEETINGNOTE.MEETINGTYPEID = MEETINGTYPE.MEETINGTYPEID " +
			"and hashTag.hashTag LIKE CONCAT('%',UPPER(#{inputVal}),'%') " +
			"AND DATE_FORMAT(MEETINGNOTE.regdate, '%Y-%m-%d') >= #{startTm} and DATE_FORMAT(MEETINGNOTE.regdate, '%Y-%m-%d') <= #{endTm} "
			+ "and MTNCONTENTS.seq = 1")
	public List<Map<String, Object>> getIntegSearchResult_hashTag_wtihDate(MeetingNoteDomain mtnDomain);

	@Select("select meetingtypenm from MEETINGTYPE"
			+ " where meetingtypeid = #{mtnTypeId}")
	public String getMeetingNoteTypeNm(String mtnTypeId);


	

}
