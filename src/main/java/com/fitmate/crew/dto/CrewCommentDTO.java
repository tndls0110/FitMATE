package com.fitmate.crew.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CrewCommentDTO {
	
	private int comment_idx;
	// 댓글 작성자 ID
	private String comment_id;
	// 댓글 내용
	private String comment_content;
	// 작성일시
    private LocalDateTime comment_date;
    // 댓글 게시여부 (1: 정상게시, 2: 본인이 삭제, 3: 운영자가 제재)
    private String comment_status;
    // 댓글 작성자 닉네임
    private String comment_nick;
    // 댓글 작성자 프로필사진
    private String comment_profile;
    
    
    private int recomment_idx;
    private String recomment_id;
    private String recomment_content;
    private LocalDateTime recomment_date;
    private String recomment_nick;
    private String recomment_profile;
	
	
	public String getComment_date() {
        if (comment_date == null) {
            return "";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return comment_date.format(formatter);
        }
	}
	
	public String getRecomment_date() {
        if (recomment_date == null) {
            return "";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return recomment_date.format(formatter);
        }
	}

	public int getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}

	public String getComment_content() {
		return comment_content;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public String getComment_status() {
		return comment_status;
	}

	public void setComment_status(String comment_status) {
		this.comment_status = comment_status;
	}

	public String getComment_nick() {
		return comment_nick;
	}

	public void setComment_nick(String comment_nick) {
		this.comment_nick = comment_nick;
	}

	public String getComment_profile() {
		return comment_profile;
	}

	public void setComment_profile(String comment_profile) {
		this.comment_profile = comment_profile;
	}

	public String getRecomment_id() {
		return recomment_id;
	}

	public void setRecomment_id(String recomment_id) {
		this.recomment_id = recomment_id;
	}

	public String getRecomment_content() {
		return recomment_content;
	}

	public void setRecomment_content(String recomment_content) {
		this.recomment_content = recomment_content;
	}

	public String getRecomment_nick() {
		return recomment_nick;
	}

	public void setRecomment_nick(String recomment_nick) {
		this.recomment_nick = recomment_nick;
	}

	public String getRecomment_profile() {
		return recomment_profile;
	}

	public void setRecomment_profile(String recomment_profile) {
		this.recomment_profile = recomment_profile;
	}

	public void setComment_date(LocalDateTime comment_date) {
		this.comment_date = comment_date;
	}

	public void setRecomment_date(LocalDateTime recomment_date) {
		this.recomment_date = recomment_date;
	}

	public String getComment_id() {
		return comment_id;
	}

	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}

	public int getRecomment_idx() {
		return recomment_idx;
	}

	public void setRecomment_idx(int recomment_idx) {
		this.recomment_idx = recomment_idx;
	}
		
	
}
