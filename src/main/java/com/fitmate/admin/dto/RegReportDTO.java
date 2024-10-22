package com.fitmate.admin.dto;

public class RegReportDTO {

    private int reportr_idx;
    private String reportr_con;
    private int reportr_show;
    private int admin_idx;

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

}
