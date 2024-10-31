package com.fitmate.crew.dto;

public class CrewScheduleMDTO {
	
	// 크루 플랜 참가자 테이블의 식별 idx
	private int party_idx;
	// crew_plan idx
	private int plan_idx;
	// crew_plan 참가자의 id
	private String party_id;
	// crew_plan 참가자의 프로필 정보
	private String profile;
	
	public int getParty_idx() {
		return party_idx;
	}
	public void setParty_idx(int party_idx) {
		this.party_idx = party_idx;
	}
	public int getPlan_idx() {
		return plan_idx;
	}
	public void setPlan_idx(int plan_idx) {
		this.plan_idx = plan_idx;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
	
}
