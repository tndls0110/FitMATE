package com.fitmate.admin.controller;

import com.fitmate.admin.service.RegDataService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class RegDataController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired RegDataService regData_service;

	// 세션 체크
	String page = "";

	// 헬스 MBTI 질문 관리
	@RequestMapping (value = "/admin_regMbtiq.go")
	public String reg_mbtiQuestion (Model model, HttpSession session) {
		page = "admin_regMbtiq";
		return page;
	}

	@RequestMapping (value = "/admin_regMbtiq_sub.go")
	public String reg_mbtiQuestion_sub (Model model, HttpSession session) {
		page = "admin_regMbtiq_sub";
		return page;
	}

	@RequestMapping (value = "/admin_regMbtiq_scr.go")
	public String reg_mbtiQuestion_score (Model model, HttpSession session) {
		page = "admin_regMbtiq_scr";
		return page;
	}

	// 헬스 MBTI 결과 관리
	@RequestMapping (value = "/admin_regMbtir.go")
	public String reg_mbtiResult (Model model, HttpSession session) {
		page = "admin_regMbtir";
		return page;
	}

	// 지역 목록 관리
	@RequestMapping (value = "/admin_regRegion.go")
	public String reg_region (Model model, HttpSession session) {
		page = "admin_regRegion";
		return page;
	}

	@RequestMapping (value = "/admin_regRegion_sub.go")
	public String reg_region_sub (Model model, HttpSession session) {
		page = "admin_regRegion_sub";
		return page;
	}

	// 신고 사유 관리
	@RequestMapping (value = "/admin_regReport.go")
	public String reg_report (Model model, HttpSession session) {
		page = "admin_regReport";
		return page;
	}

}
