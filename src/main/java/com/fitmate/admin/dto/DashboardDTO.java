package com.fitmate.admin.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DashboardDTO {

    private String notice_cont;
    private LocalDateTime notice_regdate;
    private int notice_show;

    public String getNotice_cont() {
        return notice_cont;
    }
    public String getNotice_regdate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd HH:mm");
        String formattedDateTime = notice_regdate.format(formatter);
        return formattedDateTime;
    }
    public int getNotice_show() {
        return notice_show;
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

}
