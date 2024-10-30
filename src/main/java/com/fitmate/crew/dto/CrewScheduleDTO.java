package com.fitmate.crew.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

public class CrewScheduleDTO {
	
	private int plan_idx;
	private int crew_idx;
	private LocalDate plan_date;
	private String plan_place;
	private String plan_subject;
	private String plan_content;
	private LocalTime plan_start; // 시작 시간
	private LocalTime plan_end;   // 종료 시간
	
	public int getPlan_idx() {
		return plan_idx;
	}
	public void setPlan_idx(int plan_idx) {
		this.plan_idx = plan_idx;
	}
	public int getCrew_idx() {
		return crew_idx;
	}
	public void setCrew_idx(int crew_idx) {
		this.crew_idx = crew_idx;
	}
	public LocalDate getPlan_date() {
		return plan_date;
	}
	public void setPlan_date(LocalDate plan_date) {
		this.plan_date = plan_date;
	}
	public String getPlan_place() {
		return plan_place;
	}
	public void setPlan_place(String plan_place) {
		this.plan_place = plan_place;
	}
	public String getPlan_subject() {
		return plan_subject;
	}
	public void setPlan_subject(String plan_subject) {
		this.plan_subject = plan_subject;
	}
	public String getPlan_content() {
		return plan_content;
	}
	public void setPlan_content(String plan_content) {
		this.plan_content = plan_content;
	}
	public LocalTime getPlan_start() {
		return plan_start;
	}
	public void setPlan_start(LocalTime plan_start) {
		this.plan_start = plan_start;
	}
	public LocalTime getPlan_end() {
		return plan_end;
	}
	public void setPlan_end(LocalTime plan_end) {
		this.plan_end = plan_end;
	}
	
	
	
	
	
}
