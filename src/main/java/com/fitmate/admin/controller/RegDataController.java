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
	@Autowired MainController main_controller;

	// 헬스 MBTI 질문 관리
	@RequestMapping (value = "/admin_regMbtiq.go")
	public String regMbtiQuestion (Model model, HttpSession session) {
		page = "admin_regMbtiq";
		//main_controller.checkPermit(model, session);
		//String admin_idx = session.removeAttribute("loginIdx");
		int admin_idx = 1;
		return page;
	}

	@RequestMapping (value = "/admin_regMbtiq_sub.go")
	public String regMbtiQuestionSub (Model model, HttpSession session) {
		page = "admin_regMbtiq_sub";
		//main_controller.checkPermit(model, session);
		//String admin_idx = session.removeAttribute("loginIdx");
		int admin_idx = 1;
		return page;
	}

	@RequestMapping (value = "/admin_regMbtiq_scr.go")
	public String regMbtiQuestionScore (Model model, HttpSession session) {
		page = "admin_regMbtiq_scr";
		//main_controller.checkPermit(model, session);
		//String admin_idx = session.removeAttribute("loginIdx");
		int admin_idx = 1;
		return page;
	}

	// 헬스 MBTI 결과 관리
	@RequestMapping (value = "/admin_regMbtir.go")
	public String regMbtiResult (Model model, HttpSession session) {
		page = "admin_regMbtir";
		//main_controller.checkPermit(model, session);
		//String admin_idx = session.removeAttribute("loginIdx");
		int admin_idx = 1;
		return page;
	}

	// 지역 목록 관리
	@RequestMapping (value = "/admin_regRegion.go")
	public String regRegion (Model model, HttpSession session) {
		page = "admin_regRegion";
		//main_controller.checkPermit(model, session);
		//String admin_idx = session.removeAttribute("loginIdx");
		int admin_idx = 1;
		return page;
	}

	@RequestMapping (value = "/admin_regRegion_sub.go")
	public String regRegionSub (Model model, HttpSession session) {
		page = "admin_regRegion_sub";
		//main_controller.checkPermit(model, session);
		//String admin_idx = session.removeAttribute("loginIdx");
		int admin_idx = 1;
		return page;
	}

	// 신고 사유 관리
	@RequestMapping (value = "/admin_regReport.go")
	public String regReport (Model model, HttpSession session) {
		page = "admin_regReport";
		//main_controller.checkPermit(model, session);
		//int admin_idx = session.getAttribute("loginIdx");
		int admin_idx = 1;
		model.addAttribute("list", regData_service.regReport());
		return page;
	}

}
