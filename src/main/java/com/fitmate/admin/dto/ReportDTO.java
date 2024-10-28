package com.fitmate.admin.dto;

import java.util.Date;

public class ReportDTO {
	
	private int report_idx;
	private String reporter_id;
	private int reportr_idx;
	private String reported_id;
	private int board_idx;
	private int board_type;
	private int report_prog;
	private Date report_date;
	public int getReport_idx() {
		return report_idx;
	}
	public void setReport_idx(int report_idx) {
		this.report_idx = report_idx;
	}
	public String getReporter_id() {
		return reporter_id;
	}
	public void setReporter_id(String reporter_id) {
		this.reporter_id = reporter_id;
	}
	public int getReportr_idx() {
		return reportr_idx;
	}
	public void setReportr_idx(int reportr_idx) {
		this.reportr_idx = reportr_idx;
	}
	public String getReported_id() {
		return reported_id;
	}
	public void setReported_id(String reported_id) {
		this.reported_id = reported_id;
	}
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getBoard_type() {
		return board_type;
	}
	public void setBoard_type(int board_type) {
		this.board_type = board_type;
	}
	public int getReport_prog() {
		return report_prog;
	}
	public void setReport_prog(int report_prog) {
		this.report_prog = report_prog;
	}
	public Date getReport_date() {
		return report_date;
	}
	public void setReport_date(Date report_date) {
		this.report_date = report_date;
	}
	
	
	
	
}
