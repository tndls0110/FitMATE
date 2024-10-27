package com.fitmate.admin.controller;

import com.fitmate.admin.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
public class UserController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired UserService user_service;

	// 세션 체크
	String page = "";

	// 사용자 목록
	@RequestMapping (value = "/admin_userList.go")
	public String userList (Model model, HttpSession session) {
		page = "admin_userList";
		return page;
	}

	// 공지사항 목록
	@RequestMapping (value = "/user_list.ajax")
	@ResponseBody
	public Map<String, Object> userList(String page, String cnt, String opt, String keyword) {
		int pageInt = Integer.parseInt(page);
		int cntInt = Integer.parseInt(cnt);
		return user_service.userList(pageInt, cntInt, opt, keyword);
	}

	// 사용자 조회
	@RequestMapping (value = "/admin_userDetail.go")
	public String userDetail (Model model, HttpSession session) {
		page = "admin_userDetail";
		return page;
	}

	// 크루 목록
	@RequestMapping (value = "/admin_crewList.go")
	public String crewList (Model model, HttpSession session) {
		page = "admin_crewList";
		return page;
	}

	// 크루 조회
	@RequestMapping (value = "/admin_crewDetail.go")
	public String crewDetail (Model model, HttpSession session) {
		page = "admin_crewDetail";
		return page;
	}

}
