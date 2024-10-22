package com.fitmate.member.dto;

import java.sql.Date;

public class MemberDTO {

    private String user_id;
    private String nick;
    private String pw;
    private String email;
    private String name;
    private Date birthday;
    private String profile;
    private String status;
    private int regions_idx;
    private int mbtir_idx;

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
    public int getRegions_idx() {
        return regions_idx;
    }
    public int getMbtir_idx() {
        return mbtir_idx;
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
    public void setRegions_idx(int regions_idx) {
        this.regions_idx = regions_idx;
    }
    public void setMbtir_idx(int mbtir_idx) {
        this.mbtir_idx = mbtir_idx;
    }

}
