package com.fitmate.crew.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CrewJoinDTO {
	// 크루정보 테이블
	// 크루 Idx
	private int crew_idx;
	// 크루명
	private String crew_name;
	// 크루장 ID
	private String leader_id;
	
	// 회원테이블의 닉네임정보
	private String nick;
	
	// 프로필 테이블의 프로필사진
	private String profile;
	
	// 크루가입신청테이블 (crew_join)
	// 가입신청 idx
	private int join_idx;
	// 신청자 ID
	private String join_id;	 
	// 신청 상태
	private int status;	 
	// 작성일시
	private LocalDateTime date;
	
	public String getCreate_date() {
        if (date == null) {
            return "";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return date.format(formatter);
        }
	}

	public String getCrew_name() {
		return crew_name;
	}

	public void setCrew_name(String crew_name) {
		this.crew_name = crew_name;
	}

	public String getLeader_id() {
		return leader_id;
	}

	public void setLeader_id(String leader_id) {
		this.leader_id = leader_id;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	public int getJoin_idx() {
		return join_idx;
	}

	public void setJoin_idx(int join_idx) {
		this.join_idx = join_idx;
	}

	public int getCrew_idx() {
		return crew_idx;
	}

	public void setCrew_idx(int crew_idx) {
		this.crew_idx = crew_idx;
	}

	public String getJoin_id() {
		return join_id;
	}

	public void setJoin_id(String join_id) {
		this.join_id = join_id;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}

	
}
