package com.fitmate.admin.dto;

public class ReportDTO {
	
	// repoart_reason dto
	int reportr_idx;
	String reportr_con;
	boolean reportr_show;
	int admin_idx;
	public int getReportr_idx() {
		return reportr_idx;
	}
	public void setReportr_idx(int reportr_idx) {
		this.reportr_idx = reportr_idx;
	}
	public String getReportr_con() {
		return reportr_con;
	}
	public void setReportr_con(String reportr_con) {
		this.reportr_con = reportr_con;
	}
	public boolean isReportr_show() {
		return reportr_show;
	}
	public void setReportr_show(boolean reportr_show) {
		this.reportr_show = reportr_show;
	}
	public int getAdmin_idx() {
		return admin_idx;
	}
	public void setAdmin_idx(int admin_idx) {
		this.admin_idx = admin_idx;
	}
	
	
}
