package com.fitmate.admin.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DashboardDTO {

    private String notice_cont;
    private LocalDateTime notice_regdate;
    private int notice_show;
    private int report_idx;
    private String subject;
    private String comment;
    private int board_type;
    private String reportr_con;
    private int report_prog;
    private String report_state;
    private LocalDateTime report_date;
    private int data_member_today;
    private int data_member_thisweek;
    private int data_crew_today;
    private int data_crew_thisweek;
    private int data_textboard_today;
    private int data_textboard_thisweek;
    private int data_photoboard_today;
    private int data_photoboard_thisweek;
    private int data_report_today;
    private int data_report_thisweek;

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
    public String getComment() {
        String con = comment;
        if (con.length() > 19) {
            con = con.substring(0, 19);
            con += "…";
        }
        return con;
    }
    public int getBoard_type() {
        return board_type;
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
    public int getData_member_today() {
        return data_member_today;
    }
    public int getData_member_thisweek() {
        return data_member_thisweek;
    }
    public int getData_crew_today() {
        return data_crew_today;
    }
    public int getData_crew_thisweek() {
        return data_crew_thisweek;
    }
    public int getData_textboard_today() {
        return data_textboard_today;
    }
    public int getData_textboard_thisweek() {
        return data_textboard_thisweek;
    }
    public int getData_photoboard_today() {
        return data_photoboard_today;
    }
    public int getData_photoboard_thisweek() {
        return data_photoboard_thisweek;
    }
    public int getData_report_today() {
        return data_report_today;
    }
    public int getData_report_thisweek() {
        return data_report_thisweek;
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
    public void setComment(String comment) { this.comment = comment; }
    public void setBoard_type(int board_type) {
        this.board_type = board_type;
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
    public void setData_member_today(int data_member_today) {
        this.data_member_today = data_member_today;
    }
    public void setData_member_thisweek(int data_member_thisweek) {
        this.data_member_thisweek = data_member_thisweek;
    }
    public void setData_crew_today(int data_crew_today) {
        this.data_crew_today = data_crew_today;
    }
    public void setData_crew_thisweek(int data_crew_thisweek) {
        this.data_crew_thisweek = data_crew_thisweek;
    }
    public void setData_textboard_today(int data_textboard_today) {
        this.data_textboard_today = data_textboard_today;
    }
    public void setData_textboard_thisweek(int data_textboard_thisweek) {
        this.data_textboard_thisweek = data_textboard_thisweek;
    }
    public void setData_photoboard_today(int data_photoboard_today) {
        this.data_photoboard_today = data_photoboard_today;
    }
    public void setData_photoboard_thisweek(int data_photoboard_thisweek) {
        this.data_photoboard_thisweek = data_photoboard_thisweek;
    }
    public void setData_report_today(int data_report_today) {
        this.data_report_today = data_report_today;
    }
    public void setData_report_thisweek(int data_report_thisweek) {
        this.data_report_thisweek = data_report_thisweek;
    }
}
