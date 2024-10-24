package com.fitmate.crew.dto;

import java.io.File;

public class CrewSearchListDTO {

	// 크루명 
	private String crew_name;
	// 크루idx 
	private int crew_idx;
	// 게시글idx
	private int board_idx;
	// 크루 소개글
	private String crew_content;
	// 활동지역 시단위
	private String region_name;
	// 활동지역 구단위 
	private String regions_name; 
	// 크루원 수 
	private int member_count;
	// 크루장 ID
	private String leader_id;
	// 크루장 이름 
	private String leader_name;
	// 크루장 프로필사진 
	private String leader_profile;
	// 크루장 mbti
	private String leader_mbti;
	
	
	
	
	public String getLeader_profile() {
		return leader_profile;
	}
	public void setLeader_profile(String leader_profile) {
		this.leader_profile = leader_profile;
	}
	public String getLeader_id() {
		return leader_id;
	}
	public void setLeader_id(String leader_id) {
		this.leader_id = leader_id;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getCrew_name() {
		return crew_name;
	}
	public void setCrew_name(String crew_name) {
		this.crew_name = crew_name;
	}
	public int getCrew_idx() {
		return crew_idx;
	}
	public void setCrew_idx(int crew_idx) {
		this.crew_idx = crew_idx;
	}
	public String getRegion_name() {
		return region_name;
	}
	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}
	public String getRegions_name() {
		return regions_name;
	}
	public void setRegions_name(String regions_name) {
		this.regions_name = regions_name;
	}
	public int getMember_count() {
		return member_count;
	}
	public void setMember_count(int member_count) {
		this.member_count = member_count;
	}
	public String getLeader_name() {
		return leader_name;
	}
	public void setLeader_name(String leader_name) {
		this.leader_name = leader_name;
	}
	public String getLeader_mbti() {
		return leader_mbti;
	}
	public void setLeader_mbti(String leader_mbti) {
		this.leader_mbti = leader_mbti;
	}
	public String getCrew_content() {
		return crew_content;
	}
	public void setCrew_content(String crew_content) {
		this.crew_content = crew_content;
	}
	
}
