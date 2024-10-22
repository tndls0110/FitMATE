package com.fitmate.member.controller;

import com.fitmate.admin.dto.RegCountyDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fitmate.member.service.MemberService;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	// 회원 가입
	@RequestMapping (value = "/member_join.go")
	public String join(Model model) {
		List<RegCountyDTO> list = member_service.getRegion();
		model.addAttribute("region", list);
		return "member_join";
	}

	@RequestMapping (value = "/member_checkid.ajax")
	@ResponseBody
	public Map<String, Object> checkid(String user_id) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("check_id", member_service.checkid(user_id));
		return result;
	}

	@RequestMapping (value = "/member_checknick.ajax")
	@ResponseBody
	public Map<String, Object> checknick(String nick) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("check_nick", member_service.checknick(nick));
		return result;
	}

}
