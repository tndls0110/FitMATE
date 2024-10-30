package com.fitmate.admin.dto;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ReportDTO {

    private int report_idx;
    private String reporter_id;
    private int reportr_idx;
    private String reported_id;
    private int board_idx;
    private int board_type;
    private int report_prog;
    private LocalDateTime report_date;

    private int reportd_idx;
    private int admin_idx;
    private String reportd_con;
    private LocalDateTime reportd_date;
    private String reportr_con;
    private String report_state;
    private int report_cnt;

    private String subject;
    private String content;
    private LocalDateTime date;
    private int status;
    private int category_idx;
    private String category_name;
    private int crew_idx;
    private String crew_name;
    private String reporter_nick;
    private String reported_nick;
    private int file_cnt;
    private String ori_filename;
    private String new_filename;

    public int getReport_idx() {
        return report_idx;
    }
    public String getReporter_id() {
        return reporter_id;
    }
    public int getReportr_idx() {
        return reportr_idx;
    }
    public String getReported_id() {
        return reported_id;
    }
    public int getBoard_idx() {
        return board_idx;
    }
    public int getBoard_type() {
        return board_type;
    }
    public int getReport_prog() {
        return report_prog;
    }
    public String getReport_date() {
        if (report_date == null) {
            return "";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return report_date.format(formatter);
        }
    }
    public int getReportd_idx() {
        return reportd_idx;
    }
    public int getAdmin_idx() {
        return admin_idx;
    }
    public String getReportd_con() {
        return reportd_con;
    }
    public String getReportd_date() {
        if (reportd_date == null) {
            return "";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return reportd_date.format(formatter);
        }
    }
    public String getReportr_con() {
        return reportr_con;
    }
    public String getReport_state() {
        return report_state;
    }
    public int getReport_cnt() {
        return report_cnt;
    }
    public String getSubject() {
        return subject;
    }
    public String getContent() {
        return content;
    }
    public String getDate() {
        if (date == null) {
            return "";
        } else {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            return date.format(formatter);
        }
    }
    public int getStatus() {
        return status;
    }
    public int getCategory_idx() {
        return category_idx;
    }
    public String getCategory_name() {
        return category_name;
    }
    public int getCrew_idx() {
        return crew_idx;
    }
    public String getCrew_name() {
        return crew_name;
    }
    public String getReporter_nick() {
        return reporter_nick;
    }
    public String getReported_nick() {
        return reported_nick;
    }
    public int getFile_cnt() {
        return file_cnt;
    }
    public String getOri_filename() {
        return ori_filename;
    }
    public String getNew_filename() {
        return new_filename;
    }

    public void setReport_idx(int report_idx) {
        this.report_idx = report_idx;
    }
    public void setReporter_id(String reporter_id) {
        this.reporter_id = reporter_id;
    }
    public void setReportr_idx(int reportr_idx) {
        this.reportr_idx = reportr_idx;
    }
    public void setReported_id(String reported_id) {
        this.reported_id = reported_id;
    }
    public void setBoard_idx(int board_idx) {
        this.board_idx = board_idx;
    }
    public void setBoard_type(int board_type) {
        this.board_type = board_type;
    }
    public void setReport_prog(int report_prog) {
        this.report_prog = report_prog;
    }
    public void setReport_date(LocalDateTime report_date) {
        this.report_date = report_date;
    }
    public void setReportd_idx(int reportd_idx) {
        this.reportd_idx = reportd_idx;
    }
    public void setAdmin_idx(int admin_idx) {
        this.admin_idx = admin_idx;
    }
    public void setReportd_con(String reportd_con) {
        this.reportd_con = reportd_con;
    }
    public void setReportd_date(LocalDateTime reportd_date) {
        this.reportd_date = reportd_date;
    }
    public void setReportr_con(String reportr_con) {
        this.reportr_con = reportr_con;
    }
    public void setReport_state(String report_state) {
        this.report_state = report_state;
    }
    public void setReport_cnt(int report_cnt) {
        this.report_cnt = report_cnt;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public void setDate(LocalDateTime date) {
        this.date = date;
    }
    public void setStatus(int status) {
        this.status = status;
    }
    public void setCategory_idx(int category_idx) {
        this.category_idx = category_idx;
    }
    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }
    public void setCrew_idx(int crew_idx) {
        this.crew_idx = crew_idx;
    }
    public void setCrew_name(String crew_name) {
        this.crew_name = crew_name;
    }
    public void setReporter_nick(String reporter_nick) {
        this.reporter_nick = reporter_nick;
    }
    public void setReported_nick(String reported_nick) {
        this.reported_nick = reported_nick;
    }
    public void setFile_cnt(int file_cnt) {
        this.file_cnt = file_cnt;
    }
    public void setOri_filename(String ori_filename) {
        this.ori_filename = ori_filename;
    }
    public void setNew_filename(String new_filename) {
        this.new_filename = new_filename;
    }
}
