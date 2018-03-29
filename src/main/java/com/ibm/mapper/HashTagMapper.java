package com.ibm.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface HashTagMapper {
	
	@Insert("INSERT INTO MTN_HASHTAG ("
			+ "MEETINGNOTEID, "
			+ "VERSION, "
			+ "SEQ, "
			+ "HASHTAGID"
		+ ")"
		+ "VALUES ("
			+ "#{meetingNoteId}, "
			+ "#{version}, "
			+ "#{seq}, "
			+ "#{hashTagId}"
		+ ")")
	public void insertMtnHashTag(Map<String, Object> mtnHashTagMap);
	
	@Insert("INSERT INTO HASHTAG ("
			+ "HASHTAGID, "
			+ "HASHTAG"
		+ ")"
		+ "VALUES ("
			+ "#{hashTagId}, "
			+ "#{hashTag}"
		+ ")")
	public void insertHashTag(Map<String, Object> hashTagMap);
	
	@Select("SELECT HASHTAGID FROM HASHTAG ORDER BY HASHTAGID DESC LIMIT 1")
	public String getLastHashTagId();
	
	@Select("SELECT * FROM HASHTAG WHERE HASHTAG = #{hashTag}")
	public Map<String, String> getHashTag(Map<String, Object> hashTagMap);
	
	@Select("SELECT HASHTAG.HASHTAG "
				+ "FROM HASHTAG, MTN_HASHTAG "
				+ "WHERE HASHTAG.HASHTAGID = MTN_HASHTAG.HASHTAGID "
				+ "AND MTN_HASHTAG.MEETINGNOTEID = #{meetingNoteId}")
	public List<String> getHashTagStr(Object meetingNoteId);

}
