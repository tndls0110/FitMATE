package com.fitmate.member.controller;

import com.fitmate.admin.dto.RegCountyDTO;
import com.fitmate.member.dto.MemberDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fitmate.member.service.MemberService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
		page = "member_login";
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

	// 로그아웃
	@RequestMapping (value = "/member_logout.do")
	public String logout(HttpSession session) {
		session.removeAttribute("loginId");
		return "member_login";
	}

	// 회원 가입
	@RequestMapping (value = "/member_join.go")
	public String join(Model model) {
		List<RegCountyDTO> list = member_service.getRegion();
		model.addAttribute("region", list);
		list = member_service.getRegion2("1");
		model.addAttribute("region2", list);
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

	@RequestMapping (value = "member_callregion.ajax")
	@ResponseBody
	public Map<String, Object> callregion(String region_idx) {
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", member_service.getRegion2(region_idx));
		return result;
	}

	@RequestMapping (value = "/member_join.do")
	public String join(MultipartFile[] files, @RequestParam Map<String, String> params, Model model) {
		page = "member_join";
		logger.info("files at controller: "+files);
		if (member_service.join(files, params)){
			model.addAttribute("msg", params.get("nick")+"님, 환영합니다. 로그인하세요.");
			model.addAttribute("user_id", params.get("user_id"));
			page = "member_login";
		} else {
			model.addAttribute("msg", "회원 가입 과정에 문제가 발생했습니다. 다시 시도하세요.");
		}
		return page;
	}

	// leftnav 프로필 불러오기
	@RequestMapping (value = "/member_leftnav.ajax")
	@ResponseBody
	public Map<String, Object> leftnav(HttpSession session) {
		Map<String, Object> result = new HashMap<String, Object>();
		//String user_id = (String) session.getAttribute("loginId");
		String user_id = "member03";
		result.put("leftnav_prof", member_service.getProfile(user_id));
		return result;
	}

	// 내 프로필 보기
	@RequestMapping (value = "/member_profile.go")
	public String profile(Model model, HttpSession session) {
		//String user_id = (String) session.getAttribute("loginId");
		String user_id = "member03";
		model.addAttribute("list", member_service.profile(user_id));
		return "member_profile";
	}

	// 정보 수정하기
	@RequestMapping (value = "/member_update.go")
	public String update(Model model, HttpSession session) {
		//String user_id = (String) session.getAttribute("loginId");
		String user_id = "member03";

		// 프로필 불러오기
		MemberDTO profile = member_service.profile(user_id);
		model.addAttribute("list", profile);

		// 지역 정보 불러오기
		List<RegCountyDTO> list = member_service.getRegion();
		model.addAttribute("region", list);
		list = member_service.getRegion2(Integer.toString(profile.getRegion_idx()));
		model.addAttribute("region2", list);
		return "member_update";
	}

	// 비밀번호 변경
	@RequestMapping (value = "/member_updatepw.go")
	public String updatepw() {
		return "member_updatepw";
	}

	@RequestMapping (value = "member_checkpw.ajax")
	@ResponseBody
	public Map<String, Object> checkpw(String old_pw, HttpSession session) {
		//String user_id = (String) session.getAttribute("loginId");
		String user_id = "member03";
		Map<String, Object> result = new HashMap<String, Object>();
		if (member_service.login(user_id, old_pw) == "pass"){
			result.put("check_pw", true);
		} else {
			result.put("check_pw", false);
		}
		return result;
	}

	@RequestMapping (value = "/member_updatepw.do")
	public String updatepw(String pw, HttpSession session) {
		//String user_id = (String) session.getAttribute("loginId");
		String user_id = "member03";
		member_service.updatepw(user_id, pw);
		return "redirect:/member_update.go";
	}

}
