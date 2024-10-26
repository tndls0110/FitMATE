package com.fitmate.admin.controller;

import com.fitmate.admin.service.ReportService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class ReportController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReportService report_service;

	// 세션 체크
	String page = "";
	@Autowired MainController main_controller;

	// 신고 목록
	@RequestMapping (value = "/admin_reportList.go")
	public String noticeList(Model model, HttpSession session) {
		page = "admin_reportList";
		//main_controller.checkPermit(model, session);
		model.addAttribute("list", report_service.getlist());
		return page;
	}

	// 신고 상새보기
	@RequestMapping (value = "/admin_reportDetail.go")
	public String noticeDetail(){
		//main_controller.checkPermit(model, session);
		//int admin_idx = (int) session.getAttribute("loginIdx");
		int admin_idx = 1;
		page = "admin_reportDetail";
		return page;
	}

}
