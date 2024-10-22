package com.fitmate.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fitmate.member.service.MemberService;

import javax.servlet.http.HttpSession;

@Controller
public class MemberController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberService member_service;

	// 세션 체크
	String page = "";
	public void checkPermit(Model model, HttpSession session) {
		if (session.getAttribute("loginId") == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			page = "member_login";
		}
	}

	// 유저 로그인
	@RequestMapping (value = "/member_login.go")
	public String login() {
		return "member_login";
	}

	@RequestMapping (value = "/member_login.do")
	public String login(String user_id, String pw, Model model, HttpSession session) {
		page = "/member_login";
		switch (member_service.login(user_id, pw)){
			case "pass":
				session.setAttribute("loginId", user_id);
				page = "/";
				break;
			case "invalidID":
				model.addAttribute("msg", "invalidID");
				break;
			case "invalidPW":
				model.addAttribute("msg", "invalidPW");
				break;
		}
		return page;
	}
	
}
