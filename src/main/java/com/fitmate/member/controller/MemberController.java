package com.fitmate.member.controller;

import com.fitmate.admin.dto.RegCountyDTO;
import com.fitmate.member.dto.MemberDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.fitmate.member.service.MemberService;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class MemberController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberService member_service;
	String page = "";

	// 세션 체크
	public void checkPermit(Model model, HttpSession session) {
		if (session.getAttribute("loginId") == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			page = "member_login";
		}
	}

	// 크루 이용 가능 여부 체크
	public void checkPermitCrew(Model model, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		LocalDateTime cleared_date = member_service.getPermit(user_id);
		LocalDateTime now = LocalDateTime.now();
		if (cleared_date.isBefore(now)) {
			model.addAttribute("msg", user_id+"님은 "+cleared_date+"까지 크루 기능을 이용하실 수 없습니다.");
			page = "schedule";
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
				page = "schedule";
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
	public String join(MultipartFile[] profile, @RequestParam Map<String, String> params, Model model) {
		page = "member_join";
		if (member_service.join(profile, params)){
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
		String user_id = (String) session.getAttribute("loginId");
		result.put("leftnav_prof", member_service.getProfile(user_id));
		return result;
	}

	// 내 프로필 보기
	@RequestMapping (value = "/member_profile.go")
	public String profile(Model model, HttpSession session) {
		page = "member_profile";
		checkPermit(model, session);
		String user_id = (String) session.getAttribute("loginId");
		model.addAttribute("list", member_service.profile(user_id));
		return page;
	}

	// 정보 수정하기
	@RequestMapping (value = "/member_update.go")
	public String update(Model model, HttpSession session) {
		page = "member_update";
		checkPermit(model, session);
		checkPermitCrew(model, session);
		String user_id = (String) session.getAttribute("loginId");

		// 프로필 불러오기
		MemberDTO profile = member_service.profile(user_id);
		model.addAttribute("list", profile);

		// 지역 정보 불러오기
		List<RegCountyDTO> list = member_service.getRegion();
		model.addAttribute("region", list);
		list = member_service.getRegion2(Integer.toString(profile.getRegion_idx()));
		model.addAttribute("region2", list);
		return page;
	}

	@RequestMapping (value = "member_deleteImg.ajax")
	@ResponseBody
	public void deleteImg(Model model, HttpSession session) {
		checkPermit(model, session);
		String user_id = (String) session.getAttribute("loginId");
		member_service.deleteImg(user_id);
	}

	@RequestMapping (value = "/member_update.do")
	public String update(MultipartFile[] profile, @RequestParam Map<String, String> params, Model model, HttpSession session) {
		page = "member_update";
		checkPermit(model, session);
		page = "member_update";
		if (member_service.update(profile, params)){
			model.addAttribute("msg", "정보가 수정되었습니다.");
			page = "redirect:/member_profile.go";
		} else {
			model.addAttribute("msg", "정보 수정 과정에 문제가 발생했습니다. 다시 시도하세요.");
		}
		return page;
	}

	// 비밀번호 변경
	@RequestMapping (value = "/member_updatepw.go")
	public String updatepw(Model model, HttpSession session) {
		page = "member_updatepw";
		checkPermit(model, session);
		return page;
	}

	@RequestMapping (value = "member_checkpw.ajax")
	@ResponseBody
	public Map<String, Object> checkpw(String old_pw, HttpSession session) {
		String user_id = (String) session.getAttribute("loginId");
		Map<String, Object> result = new HashMap<String, Object>();
		if (member_service.login(user_id, old_pw) == "pass"){
			result.put("check_pw", true);
		} else {
			result.put("check_pw", false);
		}
		return result;
	}

	@RequestMapping (value = "/member_updatepw.do")
	public String updatepw(String pw, HttpSession session, Model model) {
		page = "redirect:/member_update.go";
		checkPermit(model, session);
		String user_id = (String) session.getAttribute("loginId");
		member_service.updatepw(user_id, pw);
		return page;
	}

}
