package com.fitmate.crew.dto;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CrewMemberProfileDTO {
	// 크루명 
	private String crew_name;
	// 크루장ID
	private String crew_id;
	
	// 크루 추방을 위한 크루원목록 idx
	private int member_idx;
	// 크루원 입단날짜
	private LocalDateTime join_date;
	
	// 유저ID
	private String user_id;
	// 유저 닉네임
	private String nick;
	// 유저 이메일
    private String email;
	// 유저 생일
    private Date birthday;
	// 프로필 사진
    private String profile;
	// 프로필 상태메시지
    private String status;
	// 상위 지역명
    private String region_name;	
 	// 하위 지역명
    private String regions_name;
 	// mbti 성향
    private String mbtir_name;
    
    
    
    
	@Override
	public String toString() {
		return "CrewMemberProfileDTO [crew_name=" + crew_name + ", crew_id=" + crew_id + ", member_idx=" + member_idx
				+ ", join_date=" + join_date + ", user_id=" + user_id + ", nick=" + nick + ", email=" + email
				+ ", birthday=" + birthday + ", profile=" + profile + ", status=" + status + ", region_name="
				+ region_name + ", regions_name=" + regions_name + ", mbtir_name=" + mbtir_name + "]";
	}

	public String getCrew_name() {
		return crew_name;
	}

	public void setCrew_name(String crew_name) {
		this.crew_name = crew_name;
	}

	public String getCrew_id() {
		return crew_id;
	}

	public void setCrew_id(String crew_id) {
		this.crew_id = crew_id;
	}

	public String getJoin_date() {
		if (join_date == null) {
	        return "";
	    } else {
	        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	        return join_date.format(formatter);
	    }
	}
	
	
	
	public void setJoin_date(LocalDateTime join_date) {
		this.join_date = join_date;
	}

	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public int getMember_idx() {
		return member_idx;
	}
	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getRegion_name() {
		return region_name;
	}
	public void setRegion_name(String region_name) {
		this.region_name = region_name;
	}
	public String getRegions_name() {
		return regions_name;
	}
	public void setRegions_name(String regions_name) {
		this.regions_name = regions_name;
	}
	public String getMbtir_name() {
		return mbtir_name;
	}
	public void setMbtir_name(String mbtir_name) {
		this.mbtir_name = mbtir_name;
	}
    
    
}
