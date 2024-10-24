package com.fitmate.crew.dto;

import java.sql.Date;

public class CrewAskDTO {
	// 댓글 idx
	private int comment_idx;
	// 대댓글 idx
	private int recomment_idx;
	// 댓글 작성자 ID
	private String comment_id;
	// 대댓글 작성자 ID
	private String recomment_id;
	// 댓글, 대댓글 작성자 프로필사진
	private String profile;
	// 댓글, 대댓글 작성자 닉네임
	private String nick;
	// 댓글, 대댓글 내용
	private String content;
	// 작성일시
	private Date date;
	
	
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
	public int getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}
	public int getRecomment_idx() {
		return recomment_idx;
	}
	public void setRecomment_idx(int recomment_idx) {
		this.recomment_idx = recomment_idx;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getRecomment_id() {
		return recomment_id;
	}
	public void setRecomment_id(String recomment_id) {
		this.recomment_id = recomment_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
