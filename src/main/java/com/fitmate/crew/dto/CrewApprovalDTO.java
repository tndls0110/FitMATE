package com.fitmate.crew.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CrewApprovalDTO {
	// 가입신청 idx
	private int join_idx;
	// 크루 idx
	private int crew_idx;
	// 신청자ID
	private String join_id;
	// 신청상태 (1: 신청 2: 신청 거절 3: 신청 수락)
	private int status;
	// 처리일시 
	private LocalDateTime date;
	
	
	public String getCreate_date() {
        if (date == null) {
            return "";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return date.format(formatter);
        }
	}

	// 값이 제대로 담겼는지 여부체크 true:성공 / fals:실패
	public boolean isValid() {
		return join_idx != 0; 
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
