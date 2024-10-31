package com.fitmate.admin.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class RestrictionDTO {

    private int restr_idx;
    private String user_id;
    private LocalDateTime cleared_date;
    private int reported_cnt;
    private int reportr_idx;
    private int board_idx;

    public int getRestr_idx() {
        return restr_idx;
    }
    public String getUser_id() {
        return user_id;
    }
    public String getCleared_date() {
        if (cleared_date == null) {
            return "";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return cleared_date.format(formatter);
        }
    }
    public int getReported_cnt() {
        return reported_cnt;
    }
    public int getReportr_idx() {
        return reportr_idx;
    }
    public int getBoard_idx() {
        return board_idx;
    }

    public void setRestr_idx(int restr_idx) {
        this.restr_idx = restr_idx;
    }
    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }
    public void setCleared_date(LocalDateTime cleared_date) {
        this.cleared_date = cleared_date;
    }
    public void setReported_cnt(int reported_cnt) {
        this.reported_cnt = reported_cnt;
    }
    public void setReportr_idx(int reportr_idx) {
        this.reportr_idx = reportr_idx;
    }
    public void setBoard_idx(int board_idx) {
        this.board_idx = board_idx;
    }

}
