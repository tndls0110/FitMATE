package com.fitmate.member.dto;

import java.sql.Date;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class MemberDTO {

    private String user_id;
    private String nick;
    private String pw;
    private String email;
    private String name;
    private Date birthday;
    private String profile;
    private String status;
    private int region_idx;
    private int regions_idx;
    private String region_name;
    private String regions_name;
    private int mbtir_idx;
    private String mbtir_name;
    private LocalDateTime last_regdate;

    public String getUser_id() {
        return user_id;
    }
    public String getNick() {
        return nick;
    }
    public String getPw() {
        return pw;
    }
    public String getEmail() {
        return email;
    }
    public String getName() {
        return name;
    }
    public Date getBirthday() {
        return birthday;
    }
    public String getProfile() {
        return profile;
    }
    public String getStatus() {
        return status;
    }
    public int getRegion_idx() {
        return region_idx;
    }
    public int getRegions_idx() {
        return regions_idx;
    }
    public String getRegion_name() {
        return region_name;
    }
    public String getRegions_name() {
        return regions_name;
    }
    public int getMbtir_idx() {
        return mbtir_idx;
    }
    public String getMbtir_name() {
        return mbtir_name;
    }
    public String getLast_regdate() {
        if (last_regdate == null) {
            return "";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return last_regdate.format(formatter);
        }
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public void setNick(String nick) {
        this.nick = nick;
    }
    public void setPw(String pw) {
        this.pw = pw;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }
    public void setProfile(String profile) {
        this.profile = profile;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public void setRegion_idx(int region_idx) {
        this.region_idx = region_idx;
    }
    public void setRegions_idx(int regions_idx) {
        this.regions_idx = regions_idx;
    }
    public void setRegion_name(String region_name) {
        this.region_name = region_name;
    }
    public void setRegions_name(String regions_name) {
        this.regions_name = regions_name;
    }
    public void setMbtir_idx(int mbtir_idx) {
        this.mbtir_idx = mbtir_idx;
    }
    public void setMbtir_name(String mbtir_name) {
        this.mbtir_name = mbtir_name;
    }
    public void setLast_regdate(LocalDateTime last_regdate) {
        this.last_regdate = last_regdate;
    }
}
