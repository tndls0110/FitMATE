package com.fitmate.crew.dto;

import java.sql.Date;

public class CrewSearchListDTO {

	// 크루명 
	private String crew_name;
	// 크루idx 
	private int crew_idx;
	// 게시글idx
	private int board_idx;
	// 크루 소개글
	private String subject;
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
	// 크루장 닉네임 
	private String leader_nick;
	// 크루장 프로필사진 
	private String leader_profile;
	// 크루장 mbti
	private String leader_mbti;
	// 전체 게시글 수
	private int board_count;
	// 크루 생성일
	private Date create_date;
	
	// 크루원 목록 idx
	private int member_idx;
	
	// 가입신청 idx
	private int join_idx;
	
	// 이 크루의 크루원인지 체크 0: 일반멤버 1: 크루원 
	private int member_chk;
	
	
	
	
	@Override
	public String toString() {
		return "CrewSearchListDTO [crew_name=" + crew_name + ", crew_idx=" + crew_idx + ", board_idx=" + board_idx
				+ ", subject=" + subject + ", region_name=" + region_name + ", regions_name=" + regions_name
				+ ", member_count=" + member_count + ", leader_id=" + leader_id + ", leader_name=" + leader_name
				+ ", leader_nick=" + leader_nick + ", leader_profile=" + leader_profile + ", leader_mbti=" + leader_mbti
				+ ", board_count=" + board_count + ", create_date=" + create_date + ", member_idx=" + member_idx
				+ ", join_idx=" + join_idx + "]";
	}
	
	
	
	public int getMember_chk() {
		return member_chk;
	}

	public void setMember_chk(int member_chk) {
		this.member_chk = member_chk;
	}

	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public int getJoin_idx() {
		return join_idx;
	}
	public void setJoin_idx(int join_idx) {
		this.join_idx = join_idx;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public int getBoard_count() {
		return board_count;
	}
	public void setBoard_count(int board_count) {
		this.board_count = board_count;
	}
	public String getLeader_nick() {
		return leader_nick;
	}
	public void setLeader_nick(String leader_nick) {
		this.leader_nick = leader_nick;
	}
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
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	
}
