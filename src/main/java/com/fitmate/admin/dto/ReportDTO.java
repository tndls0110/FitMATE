package com.fitmate.admin.dto;

import java.time.LocalDateTime;

public class ReportDTO {

    private int report_idx;
    private String reporter_id;
    private int reportr_idx;
    private String reported_id;
    private int board_idx;
    private int board_type;
    private int report_prog;
    private LocalDateTime reported_date;

    private int reportd_idx;
    private int admin_idx;
    private String reportd_con;
    private LocalDateTime reportd_date;

    private String reportr_con;

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
    public LocalDateTime getReported_date() {
        return reported_date;
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
    public LocalDateTime getReportd_date() {
        return reportd_date;
    }
    public String getReportr_con() {
        return reportr_con;
    }

    public void setReportr_con(String reportr_con) {
        this.reportr_con = reportr_con;
    }
    public void setReportd_date(LocalDateTime reportd_date) {
        this.reportd_date = reportd_date;
    }
    public void setReportd_con(String reportd_con) {
        this.reportd_con = reportd_con;
    }
    public void setAdmin_idx(int admin_idx) {
        this.admin_idx = admin_idx;
    }
    public void setReportd_idx(int reportd_idx) {
        this.reportd_idx = reportd_idx;
    }
    public void setReported_date(LocalDateTime reported_date) {
        this.reported_date = reported_date;
    }
    public void setReport_prog(int report_prog) {
        this.report_prog = report_prog;
    }
    public void setBoard_type(int board_type) {
        this.board_type = board_type;
    }
    public void setBoard_idx(int board_idx) {
        this.board_idx = board_idx;
    }
    public void setReported_id(String reported_id) {
        this.reported_id = reported_id;
    }
    public void setReportr_idx(int reportr_idx) {
        this.reportr_idx = reportr_idx;
    }
    public void setReporter_id(String reporter_id) {
        this.reporter_id = reporter_id;
    }
    public void setReport_idx(int report_idx) {
        this.report_idx = report_idx;
    }

}
