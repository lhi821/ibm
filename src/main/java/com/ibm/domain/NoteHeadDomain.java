package com.ibm.domain;

import java.util.List;

public class NoteHeadDomain {
	
	String noteHeadId;
	String alias;
	String meetingType;
	String meetingTypeId;
	String title;
	String location;
	String memberId;
	String attendant;
	
	List<String> attendantIds;
	List<String> attendantNms;
	
	public String getNoteHeadId() {
		return noteHeadId;
	}
	public void setNoteHeadId(String noteHeadId) {
		this.noteHeadId = noteHeadId;
	}
	public String getAlias() {
		return alias;
	}
	public void setAlias(String alias) {
		this.alias = alias;
	}
	public String getMeetingType() {
		return meetingType;
	}
	public void setMeetingType(String meetingType) {
		this.meetingType = meetingType;
	}
	public String getMeetingTypeId() {
		return meetingTypeId;
	}
	public void setMeetingTypeId(String meetingTypeId) {
		this.meetingTypeId = meetingTypeId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getAttendant() {
		return attendant;
	}
	public void setAttendant(String attendant) {
		this.attendant = attendant;
	}
	public List<String> getAttendantIds() {
		return attendantIds;
	}
	public void setAttendantIds(List<String> attendantIds) {
		this.attendantIds = attendantIds;
	}
	public List<String> getAttendantNms() {
		return attendantNms;
	}
	public void setAttendantNms(List<String> attendantNms) {
		this.attendantNms = attendantNms;
	}
	
}
