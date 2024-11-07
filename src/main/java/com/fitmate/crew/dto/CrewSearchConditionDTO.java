package com.fitmate.crew.dto;

//크루원 모집글 목록을 가져오기 위한 조건 데이터
public class CrewSearchConditionDTO {
	private int searchFilter;
	private String searchKeyword;
	private int regions_idx;
	private int mbtiFilter;
	private int limit;
	private int offset;
	private String user_id;
	
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getSearchFilter() {
		return searchFilter;
	}
	public void setSearchFilter(int searchFilter) {
		this.searchFilter = searchFilter;
	}
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public int getRegions_idx() {
		return regions_idx;
	}
	public void setRegions_idx(int regions_idx) {
		this.regions_idx = regions_idx;
	}
	public int getMbtiFilter() {
		return mbtiFilter;
	}
	public void setMbtiFilter(int mbtiFilter) {
		this.mbtiFilter = mbtiFilter;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getOffset() {
		return offset;
	}
	public void setOffset(int offset) {
		this.offset = offset;
	}
}
