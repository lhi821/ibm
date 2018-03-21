package com.ibm.domain;

public class MtnContentsDomain {
	
	String meetingNoteId;
	String version;
	String seq;
	String speakerId;
	String contents;
	
	public String getMeetingNoteId() {
		return meetingNoteId;
	}
	public void setMeetingNoteId(String meetingNoteId) {
		this.meetingNoteId = meetingNoteId;
	}
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public String getSeq() {
		return seq;
	}
	public void setSeq(String seq) {
		this.seq = seq;
	}
	public String getSpeakerId() {
		return speakerId;
	}
	public void setSpeakerId(String speakerId) {
		this.speakerId = speakerId;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}

}
