package com.fitmate.admin.dto;

import java.sql.Date;

public class ReportDTO {

    private int report_idx;
    private String reporter_id;
    private String reporter_nick;
    private int reportr_idx;
    private String reported_id;
    private String reported_nick;
    private int board_idx;
    private int board_type;
    private int report_prog;
    private Date report_date;

    private int reportd_idx;
    private String reportd_con;
    private Date reportd_date;

    private String reportr_con;
    private int reportr_show;
    private int admin_idx;

    public int getReport_idx() {
        return report_idx;
    }
    public String getReporter_id() {
        return reporter_id;
    }
    public String getReporter_nick() {
        return reporter_nick;
    }
    public int getReportr_idx() {
        return reportr_idx;
    }
    public String getReported_id() {
        return reported_id;
    }
    public String getReported_nick() {
        return reported_nick;
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
    public Date getReport_date() {
        return report_date;
    }
    public int getReportd_idx() {
        return reportd_idx;
    }
    public String getReportd_con() {
        return reportd_con;
    }
    public Date getReportd_date() {
        return reportd_date;
    }
    public String getReportr_con() {
        return reportr_con;
    }
    public int getReportr_show() {
        return reportr_show;
    }
    public int getAdmin_idx() {
        return admin_idx;
    }

    public void setReport_idx(int report_idx) {
        this.report_idx = report_idx;
    }
    public void setReporter_id(String reporter_id) {
        this.reporter_id = reporter_id;
    }
    public void setReporter_nick(String reporter_nick) {
        this.reporter_nick = reporter_nick;
    }
    public void setReportr_idx(int reportr_idx) {
        this.reportr_idx = reportr_idx;
    }
    public void setReported_id(String reported_id) {
        this.reported_id = reported_id;
    }
    public void setReported_nick(String reported_nick) {
        this.reported_nick = reported_nick;
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
    public void setReport_date(Date report_date) {
        this.report_date = report_date;
    }
    public void setReportd_idx(int reportd_idx) {
        this.reportd_idx = reportd_idx;
    }
    public void setReportd_con(String reportd_con) {
        this.reportd_con = reportd_con;
    }
    public void setReportd_date(Date reportd_date) {
        this.reportd_date = reportd_date;
    }
    public void setReportr_con(String reportr_con) {
        this.reportr_con = reportr_con;
    }
    public void setReportr_show(int reportr_show) {
        this.reportr_show = reportr_show;
    }
    public void setAdmin_idx(int admin_idx) {
        this.admin_idx = admin_idx;
    }

}
