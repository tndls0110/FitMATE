package com.fitmate.crew.dto;

import java.util.Date;

public class CrewMemberDTO {
	
	int member_idx;
	int crew_idx;
	String member_id;
	Date join_date;
	Date leave_date;
	Boolean status;
	
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getCrew_idx() {
		return crew_idx;
	}
	public void setCrew_idx(int crew_idx) {
		this.crew_idx = crew_idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public Date getLeave_date() {
		return leave_date;
	}
	public void setLeave_date(Date leave_date) {
		this.leave_date = leave_date;
	}
	public Boolean getStatus() {
		return status;
	}
	public void setStatus(Boolean status) {
		this.status = status;
	}
	
	
}
