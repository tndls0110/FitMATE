package com.fitmate.message.dto;

import java.time.LocalDateTime;

public class MessageDTO {

	private int message_idx;
	public int getMessage_idx() {
		return message_idx;
	}
	public void setMessage_idx(int message_idx) {
		this.message_idx = message_idx;
	}
	public String getSender_id() {
		return sender_id;
	}
	public void setSender_id(String sender_id) {
		this.sender_id = sender_id;
	}
	public String getReceiver_id() {
		return receiver_id;
	}
	public void setReceiver_id(String receiver_id) {
		this.receiver_id = receiver_id;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public LocalDateTime getSendtime() {
		return sendtime;
	}
	public void setSendtime(LocalDateTime sendtime) {
		this.sendtime = sendtime;
	}
	public boolean isReadcheck() {
		return readcheck;
	}
	public void setReadcheck(boolean readcheck) {
		this.readcheck = readcheck;
	}
	public int getGroup_idx() {
		return group_idx;
	}
	public void setGroup_idx(int group_idx) {
		this.group_idx = group_idx;
	}
	private String sender_id;
	private String receiver_id;
	private String Content;
	private LocalDateTime sendtime;
	private boolean readcheck;
	private int group_idx;	 
}
