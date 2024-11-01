package com.fitmate.admin.controller;

import com.fitmate.admin.service.MainService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
public class MainController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MainService main_service;

	// 세션 체크
	String page = "";
	public void checkPermit(Model model, HttpSession session) {
		if (session.getAttribute("loginId") == null || session.getAttribute("permit") == null) {
			model.addAttribute("msg", "관리자 로그인이 필요한 페이지입니다.");
			page = "admin_login";
		}
	}

	// layout
	@RequestMapping (value = "/admin_header.ajax")
	@ResponseBody
	public Map<String, Object> leftnav(HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		//String admin_idx = session.removeAttribute("loginIdx");
		int admin_idx = 1;
		result.put("name", main_service.getnick(admin_idx));
		return result;
	}

	// 로그인
	@RequestMapping (value = "/admin_login.go")
	public String login(Model model, HttpSession session) {
		return "admin_login";
	}

	@RequestMapping (value = "/admin_login.do")
	public String login(String admin_id, String pw, Model model, HttpSession session) {
		page = "admin_login";
		switch (main_service.login(admin_id, pw)){
			case "pass":
				session.setAttribute("loginIdx", main_service.getidx(admin_id));
				session.setAttribute("permit", "all");
				page = "redirect:/admin_dashboard.go";
				break;
			case "invalidID":
				model.addAttribute("state", "invalidID");
				model.addAttribute("admin_id", admin_id);
				model.addAttribute("pw", pw);
				break;
			case "invalidPW":
				model.addAttribute("state", "invalidPW");
				model.addAttribute("admin_id", admin_id);
				model.addAttribute("pw", pw);
				break;
		}
		return page;
	}

	// 로그아웃
	@RequestMapping (value = "/admin_logout.do")
	public String logout(Model model, HttpSession session) {
		session.removeAttribute("loginIdx");
		session.removeAttribute("permit");
		return "admin_login";
	}

	// 대시보드
	@RequestMapping (value = "/admin_dashboard.go")
	public String dashboard(Model model, HttpSession session) {
		page = "admin_dashboard";
		//checkPermit(model, session);
		model.addAttribute("notice", main_service.dashboardList1());
		model.addAttribute("report", main_service.dashboardList2());
		return page;
	}

}
