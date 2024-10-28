package com.fitmate.crew.dto;

// 크루 모집게시글에 입력한 대댓글정보를 담기위한 DTO
public class ReplyWriteDTO {
	
	// 댓글 idx
	private int comment_idx;
	// 대댓글 작성자ID
	private String recomment_id;
	// 대댓글내용
	private String content;
	
	public int getComment_idx() {
		return comment_idx;
	}
	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
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
	
	
}
