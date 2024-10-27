package com.fitmate.admin.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class CrewListDTO {

    private int crew_idx;
    private String name;
    private String crew_id;
    private int regions_idx;
    private String region_name;
    private String regions_name;
    private int cnt_members;
    private int cnt_plan;
    private int cnt_board;
    private int cnt_recruit;
    private int cnt_notice;
    private int cnt_singleline;
    private int cnt_photo;
    private boolean status;
    private LocalDateTime create_date;
    private LocalDateTime last_date;

    public int getCrew_idx() {
        return crew_idx;
    }
    public String getName() {
        return name;
    }
    public String getCrew_id() {
        return crew_id;
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
    public int getCnt_members() {
        return cnt_members;
    }
    public int getCnt_plan() {
        return cnt_plan;
    }
    public int getCnt_board() {
        return cnt_board;
    }
    public int getCnt_recruit() {
        return cnt_recruit;
    }
    public int getCnt_notice() {
        return cnt_notice;
    }
    public int getCnt_singleline() {
        return cnt_singleline;
    }
    public int getCnt_photo() {
        return cnt_photo;
    }
    public boolean isStatus() {
        return status;
    }
    public String getCreate_date() {
        if (create_date == null) {
            return "";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return create_date.format(formatter);
        }
    }
    public String getLast_date() {
        if (last_date == null) {
            return "";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return last_date.format(formatter);
        }
    }

    public void setCrew_idx(int crew_idx) {
        this.crew_idx = crew_idx;
    }
    public void setName(String name) {
        this.name = name;
    }
    public void setCrew_id(String crew_id) {
        this.crew_id = crew_id;
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
    public void setCnt_members(int cnt_members) {
        this.cnt_members = cnt_members;
    }
    public void setCnt_plan(int cnt_plan) {
        this.cnt_plan = cnt_plan;
    }
    public void setCnt_board(int cnt_board) {
        this.cnt_board = cnt_board;
    }
    public void setCnt_recruit(int cnt_recruit) {
        this.cnt_recruit = cnt_recruit;
    }
    public void setCnt_notice(int cnt_notice) {
        this.cnt_notice = cnt_notice;
    }
    public void setCnt_singleline(int cnt_singleline) {
        this.cnt_singleline = cnt_singleline;
    }
    public void setCnt_photo(int cnt_photo) {
        this.cnt_photo = cnt_photo;
    }
    public void setStatus(int status) {
        if (status == 1) {
            this.status = true;
        } else {
            this.status = false;
        }
    }
    public void setCreate_date(LocalDateTime create_date) {
        this.create_date = create_date;
    }
    public void setLast_date(LocalDateTime last_date) {
        this.last_date = last_date;
    }
}
