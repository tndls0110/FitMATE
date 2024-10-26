package com.fitmate.admin.controller;

import com.fitmate.admin.service.ReportService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ReportController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReportService report_service;

	// 세션 체크
	String page = "";

	// 신고 목록
	@RequestMapping (value = "/admin_reportList.go")
	public String noticeList(){
		page = "admin_reportList";
		return page;
	}

	// 신고 상새보기
	@RequestMapping (value = "/admin_reportDetail.go")
	public String noticeDetail(){
		page = "admin_reportDetail";
		return page;
	}

}
