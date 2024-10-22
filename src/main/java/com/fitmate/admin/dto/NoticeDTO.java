package com.fitmate.admin.dto;

import java.sql.Date;

public class NoticeDTO {

    private int notice_idx;
    private String notice_cont;
    private Date notice_regdate;
    private int notice_show;
    private int admin_idx;

    public int getNotice_idx() {
        return notice_idx;
    }
    public String getNotice_cont() {
        return notice_cont;
    }
    public Date getNotice_regdate() {
        return notice_regdate;
    }
    public int getNotice_show() {
        return notice_show;
    }
    public int getAdmin_idx() {
        return admin_idx;
    }

    public void setNotice_idx(int notice_idx) {
        this.notice_idx = notice_idx;
    }
    public void setNotice_cont(String notice_cont) {
        this.notice_cont = notice_cont;
    }
    public void setNotice_regdate(Date notice_regdate) {
        this.notice_regdate = notice_regdate;
    }
    public void setNotice_show(int notice_show) {
        this.notice_show = notice_show;
    }
    public void setAdmin_idx(int admin_idx) {
        this.admin_idx = admin_idx;
    }

}
