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
	@Autowired MainController main_controller;

	// 사용자 목록
	@RequestMapping (value = "/admin_userList.go")
	public String userList (Model model, HttpSession session) {
		page = "admin_userList";
		//main_controller.checkPermit(model, session);
		return page;
	}

	@RequestMapping (value = "/user_list.ajax")
	@ResponseBody
	public Map<String, Object> userList(String page, String cnt, String opt, String keyword, String sortType1, String sortType2) {
		int pageInt = Integer.parseInt(page);
		int cntInt = Integer.parseInt(cnt);
		return user_service.userList(pageInt, cntInt, opt, keyword, sortType1, sortType2);
	}

	// 사용자 조회
	@RequestMapping (value = "/admin_userDetail.go")
	public String userDetail (String user_id, Model model, HttpSession session) {
		page = "admin_userDetail";
		//main_controller.checkPermit(model, session);
		model.addAttribute("member", user_service.userDetail(user_id));
		return page;
	}

	// 크루 목록
	@RequestMapping (value = "/admin_crewList.go")
	public String crewList (Model model, HttpSession session) {
		page = "admin_crewList";
		//main_controller.checkPermit(model, session);
		return page;
	}

	@RequestMapping (value = "/crew_list.ajax")
	@ResponseBody
	public Map<String, Object> crewList(String page, String cnt, String opt, String keyword, String sortType) {
		int pageInt = Integer.parseInt(page);
		int cntInt = Integer.parseInt(cnt);
		logger.info("sortType: "+sortType);
		return user_service.crewList(pageInt, cntInt, opt, keyword, sortType);
	}

	// 크루 조회
	@RequestMapping (value = "/admin_crewDetail.go")
	public String crewDetail (String crew_idx, Model model, HttpSession session) {
		page = "admin_crewDetail";
		//main_controller.checkPermit(model, session);
		model.addAttribute("crew", user_service.crewDetail(crew_idx));
		return page;
	}

}
