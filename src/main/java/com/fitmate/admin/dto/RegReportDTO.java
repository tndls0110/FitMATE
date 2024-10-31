package com.fitmate.admin.dto;

import java.time.LocalDateTime;

public class RegReportDTO {

    private int reportr_idx;
    private String reportr_con;
    private int reportr_show;
    private int admin_idx;
    private int report_prog;
    private String report_state;

    public int getReportr_idx() {
        return reportr_idx;
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
    public int getReport_prog() {
        return report_prog;
    }
    public String getReport_state() {
        return report_state;
    }

    public void setReportr_idx(int reportr_idx) {
        this.reportr_idx = reportr_idx;
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
    public void setReport_prog(int report_prog) {
        this.report_prog = report_prog;
    }
    public void setReport_state(String report_state) {
        this.report_state = report_state;
    }
}
