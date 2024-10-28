package com.fitmate.crew.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CrewAskDTO {
	// 댓글 idx
	private int comment_idx;
	// 댓글 작성자 ID
	private String comment_id;
	// 댓글 작성자 프로필사진
	private String profile;
	// 댓글 작성자 닉네임
	private String nick;
	// 댓글 내용
	private String content;
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
	
	// 대댓글 존재여부체크 0:존재X / 1:존재O 
	private int recomment_chk;
	// 대댓글 정보 DTO
	private CrewReplyDTO replyDTO;

	
	public CrewReplyDTO getReplyDTO() {
		return replyDTO;
	}
	public void setReplyDTO(CrewReplyDTO replyDTO) {
		this.replyDTO = replyDTO;
	}
	public int getRecomment_chk() {
		return recomment_chk;
	}
	public void setRecomment_chk(int recomment_chk) {
		this.recomment_chk = recomment_chk;
	}
	public int getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
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
