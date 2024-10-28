package com.fitmate.crew.dto;

// 크루 모집게시글에 입력한 댓글정보를 담기위한 DTO
public class AskWriteDTO {
	
	// 게시글 idx
	private int board_idx;
	// 댓글 작성자ID
	private String comment_id;
	// 댓글내용
	private String content;
	
	
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public String getComment_id() {
		return comment_id;
	}
	public void setComment_id(String comment_id) {
		this.comment_id = comment_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
}
