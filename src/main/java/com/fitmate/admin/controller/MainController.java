package com.fitmate.admin.controller;

import com.fitmate.admin.service.MainService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

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

	// 로그인
	@RequestMapping (value = "/admin_login.go")
	public String login(Model model, HttpSession session) {
		return "admin_login";
	}

	@RequestMapping (value = "/member_login.do")
	public String login(String user_id, String pw, Model model, HttpSession session) {
		page = "member_login";
		switch (main_service.login(user_id, pw)){
			case "pass":
				session.setAttribute("loginId", user_id);
				session.setAttribute("permit", "all");
				page = "admin_dashboard";
				break;
			case "invalidID":
				model.addAttribute("state", "invalidID");
				model.addAttribute("user_id", user_id);
				model.addAttribute("pw", pw);
				break;
			case "invalidPW":
				model.addAttribute("state", "invalidPW");
				model.addAttribute("user_id", user_id);
				model.addAttribute("pw", pw);
				break;
		}
		return page;
	}

	// 로그아웃
	@RequestMapping (value = "/admin_logout.go")
	public String logout(Model model, HttpSession session) {
		session.removeAttribute("loginId");
		session.removeAttribute("permit");
		return "admin_login";
	}

	// header
	@RequestMapping (value = "/admin_leftnav.go")
	public String leftnav(Model model, HttpSession session) {
		page = "admin_leftnav";
		//String admin_id = session.removeAttribute("loginId");
		String admin_id = "admin";
		return page;
	}

	// 대시보드
	@RequestMapping (value = "/admin_dashboard.go")
	public String dashboard(Model model, HttpSession session) {
		page = "admin_dashboard";
		//checkPermit(model, session);
		//String admin_id = session.removeAttribute("loginId");
		String admin_id = "admin";
		return page;
	}

}
