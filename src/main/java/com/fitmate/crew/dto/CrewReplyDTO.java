package com.fitmate.crew.dto;

import java.time.LocalDateTime;

public class CrewReplyDTO {
	// 대댓글 idx
	private int recomment_idx;
	// 대댓글 작성자 ID
	private String recomment_id;
	// 대댓글 작성자 프로필사진
	private String profile;
	// 대댓글 작성자 닉네임
	private String nick;
	// 대댓글 내용
	private String content;
	// 작성일시
	private LocalDateTime date;
	
	// 값이 제대로 담겼는지 여부체크 true:성공 / fals:실패
	public boolean isValid() {
		return recomment_id != null || recomment_id.isEmpty(); 
	}
	
	public int getRecomment_idx() {
		return recomment_idx;
	}
	public void setRecomment_idx(int recomment_idx) {
		this.recomment_idx = recomment_idx;
	}
	public String getRecomment_id() {
		return recomment_id;
	}
	public void setRecomment_id(String recomment_id) {
		this.recomment_id = recomment_id;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	
	
}
