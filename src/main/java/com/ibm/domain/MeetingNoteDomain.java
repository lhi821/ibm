package com.ibm.domain;

public class MeetingNoteDomain {
	
	String meetingNoteId;
	String version;
	String title;
	String projectId;
	String divisionId;
	String meetingTypeId;
	String regMemberId;
	String modMemberId;
	String location;
	String startTm;
	String endTm;
	String mainPoint;
	int hit;
	String statusId;
	String statusDesc;
	String regDate;
	String modDate;
	
	String withDate;
	String meetingNoteNm;
	
	//for history
	String hitDttm;
	String memberId;
	
	public String getHitDttm() {
		return hitDttm;
	}
	public void setHitDttm(String hitDttm) {
		this.hitDttm = hitDttm;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	

	public String getMeetingNoteNm() {
		return meetingNoteNm;
	}
	public void setMeetingNoteNm(String meetingNoteNm) {
		this.meetingNoteNm = meetingNoteNm;
	}
	public String getWithDate() {
		return withDate;
	}
	public void setWithDate(String withDate) {
		this.withDate = withDate;
	}
	//for integSearch	
	String contents;
	String inputVal;
	String category;
	
	//for analysis
	int meetingTypeCount;
	
	public int getMeetingTypeCount() {
		return meetingTypeCount;
	}
	public void setMeetingTypeCount(int meetingTypeCount) {
		this.meetingTypeCount = meetingTypeCount;
	}
	public String getInputVal() {
		return inputVal;
	}
	public void setInputVal(String inputVal) {
		this.inputVal = inputVal;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
		
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getDivisionId() {
		return divisionId;
	}
	public void setDivisionId(String divisionId) {
		this.divisionId = divisionId;
	}
	public String getMeetingTypeId() {
		return meetingTypeId;
	}
	public void setMeetingTypeId(String meetingTypeId) {
		this.meetingTypeId = meetingTypeId;
	}
	public String getRegMemberId() {
		return regMemberId;
	}
	public void setRegMemberId(String regMemberId) {
		this.regMemberId = regMemberId;
	}
	public String getModMemberId() {
		return modMemberId;
	}
	public void setModMemberId(String modMemberId) {
		this.modMemberId = modMemberId;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getStartTm() {
		return startTm;
	}
	public void setStartTm(String startTm) {
		this.startTm = startTm;
	}
	public String getEndTm() {
		return endTm;
	}
	public void setEndTm(String endTm) {
		this.endTm = endTm;
	}
	public String getMainPoint() {
		return mainPoint;
	}
	public void setMainPoint(String mainPoint) {
		this.mainPoint = mainPoint;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getStatusId() {
		return statusId;
	}
	public void setStatusId(String statusId) {
		this.statusId = statusId;
	}
	public String getStatusDesc() {
		return statusDesc;
	}
	public void setStatusDesc(String statusDesc) {
		this.statusDesc = statusDesc;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getModDate() {
		return modDate;
	}
	public void setModDate(String modDate) {
		this.modDate = modDate;
	}
	
}
