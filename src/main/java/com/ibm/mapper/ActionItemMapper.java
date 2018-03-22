package com.ibm.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ActionItemMapper {
	
	@Insert("INSERT INTO ACTIONITEM ("
			+ "MEETINGNOTEID, "
			+ "VERSION, "
			+ "SEQ, "
			+ "ACTIONITEM"
		+ ")"
		+ "VALUES ("
			+ "#{meetingNoteId}, "
			+ "#{version}, "
			+ "#{seq}, "
			+ "#{actionItem}"
		+ ")")
	public void insertActionItem(Map<String, Object> actionItemMap);

}
