package com.fitmate.admin.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class NoticeDTO {

    private int notice_idx;
    private String notice_cont;
    private LocalDateTime notice_regdate;
    private int notice_show;
    private int admin_idx;
    private String admin_name;

    public int getNotice_idx() {
        return notice_idx;
    }
    public String getNotice_cont() {
        return notice_cont;
    }
    public String getNotice_regdate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        return notice_regdate.format(formatter);
    }
    public int getNotice_show() {
        return notice_show;
    }
    public int getAdmin_idx() {
        return admin_idx;
    }
    public String getAdmin_name() {
        return admin_name;
    }

    public void setNotice_idx(int notice_idx) {
        this.notice_idx = notice_idx;
    }
    public void setNotice_cont(String notice_cont) {
        this.notice_cont = notice_cont;
    }
    public void setNotice_regdate(LocalDateTime notice_regdate) {
        this.notice_regdate = notice_regdate;
    }
    public void setNotice_show(int notice_show) {
        this.notice_show = notice_show;
    }
    public void setAdmin_idx(int admin_idx) {
        this.admin_idx = admin_idx;
    }
    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

}
