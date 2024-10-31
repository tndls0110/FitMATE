package com.fitmate.admin.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DashboardDTO {


    private String notice_cont;
    private LocalDateTime notice_regdate;
    private int notice_show;
    private int report_idx;
    private String subject;
    private String reportr_con;
    private int report_prog;
    private String report_state;
    private LocalDateTime report_date;

    public String getNotice_cont() {
        String con = notice_cont;
        if (con.length() > 18) {
            con = con.substring(0, 18);
            con += "…";
        }
        return con;
    }
    public String getNotice_regdate() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd HH:mm");
        return notice_regdate.format(formatter);
    }
    public int getNotice_show() {
        return notice_show;
    }
    public int getReport_idx() {
        return report_idx;
    }
    public String getSubject() {
        String con = subject;
        if (con.length() > 19) {
            con = con.substring(0, 19);
            con += "…";
        }
        return con;
    }
    public String getReportr_con() {
        String con = reportr_con;
        if (con.length() > 8) {
            con = con.substring(0, 8);
            con += "…";
        }
        return con;
    }
    public int getReport_prog() {
        return report_prog;
    }
    public String getReport_state() {
        return report_state;
    }
    public String getReport_date() {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd HH:mm");
        return report_date.format(formatter);
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
    public void setReportr_con(String reportr_con) {
        this.reportr_con = reportr_con;
    }
    public void setReport_idx(int report_idx) {
        this.report_idx = report_idx;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public void setReport_prog(int report_prog) {
        this.report_prog = report_prog;
    }
    public void setReport_state(String report_state) {
        this.report_state = report_state;
    }
    public void setReport_date(LocalDateTime report_date) {
        this.report_date = report_date;
    }
}
