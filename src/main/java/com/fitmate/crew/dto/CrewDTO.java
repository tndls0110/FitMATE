package com.fitmate.crew.dto;

import java.util.Date;

public class CrewDTO {
	
	private	int crew_idx;
	private	String name;
	private	String crew_id;
	private	int regions_idx;
	private	Date create_date;
	private	boolean status;
	private	Date last_date;
	
	public int getCrew_idx() {
		return crew_idx;
	}
	public void setCrew_idx(int crew_idx) {
		this.crew_idx = crew_idx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCrew_id() {
		return crew_id;
	}
	public void setCrew_id(String crew_id) {
		this.crew_id = crew_id;
	}
	public int getRegions_idx() {
		return regions_idx;
	}
	public void setRegions_idx(int regions_idx) {
		this.regions_idx = regions_idx;
	}
	public Date getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}
	public Date getLast_date() {
		return last_date;
	}
	public void setLast_date(Date last_date) {
		this.last_date = last_date;
	}
	
}
