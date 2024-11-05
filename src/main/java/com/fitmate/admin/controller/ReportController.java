package com.fitmate.admin.controller;

import com.fitmate.admin.service.ReportService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class ReportController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired ReportService report_service;

	// 세션 체크
	String page = "";
	@Autowired MainController main_controller;

	// 신고 목록
	@RequestMapping (value = "/admin_reportList.go")
	public String reportList(Model model, HttpSession session) {
		page = "admin_reportList";
		main_controller.checkPermit(model, session);
		return page;
	}

	@RequestMapping (value = "/report_list.ajax")
	@ResponseBody
	public Map<String, Object> list(String page, String cnt, String opt, String keyword, String sortType) {
		int pageInt = Integer.parseInt(page);
		int cntInt = Integer.parseInt(cnt);
		return report_service.list(pageInt, cntInt, opt, keyword, sortType);
	}

	// 신고 상세보기
	@RequestMapping (value = "/admin_reportDetail.go")
	public String reportDetail(String report_idx, Model model, HttpSession session) {
		page = "admin_reportDetail";
		main_controller.checkPermit(model, session);
		model.addAttribute("info", report_service.detail(report_idx));
		model.addAttribute("status", report_service.reportStatus());
		model.addAttribute("progress", report_service.reportProgress(report_idx));
		return page;
	}

	@RequestMapping (value = "/admin_reportDetail.do")
	public String confirmReport(@RequestParam Map<String, String> params, Model model, HttpSession session) {
		page = "redirect:/admin_reportDetail.go?report_idx="+params.get("report_idx");
		main_controller.checkPermit(model, session);
		int admin_idx = Integer.parseInt((String) session.getAttribute("loginIdx"));
		report_service.confirmReport(params, admin_idx);
		return page;
	}

}
