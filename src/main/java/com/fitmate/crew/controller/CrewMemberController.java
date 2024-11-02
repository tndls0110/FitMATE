package com.fitmate.crew.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fitmate.crew.dto.CrewJoinDTO;
import com.fitmate.crew.dto.CrewMemberProfileDTO;
import com.fitmate.crew.service.CrewMemberService;
import com.fitmate.member.service.MemberService;

@Controller
public class CrewMemberController {
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired CrewMemberService crewmember_service;
	@Autowired MemberService member_service;
	
	String page = "";
	
	/* checkPermit(model, session);를 써서 세션ID와 크루이용가능여부 전부 체크. */
	// 세션 체크
	public void checkPermit(Model model, HttpSession session) {
		if (session.getAttribute("loginId") == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			page = "member_login";
		}
	}
	
	// 크루 이용 가능 여부 체크
	public void checkPermitCrew(Model model, HttpSession session) {
		if (session.getAttribute("loginId") != null) {
			String user_id = (String) session.getAttribute("loginId");
			LocalDateTime cleared_date = member_service.getPermit(user_id);
			LocalDateTime now = LocalDateTime.now();
			if (cleared_date != null){
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM월 dd일 HH시 mm분");
				String clearedDate = cleared_date.format(formatter);
				if (cleared_date.isAfter(now)) {
					model.addAttribute("msg", user_id+"님은 "+clearedDate+"까지 크루 기능을 이용하실 수 없습니다.");
					page = "schedule";
				}
			}
		} else {
			checkPermit(model, session);
		}
	}
	
	
	
	
	
	
	
	// 크루 가입신청자 목록
	@GetMapping(value = "/mycrew_joinList.go")
	public String joinList(String idx, Model model, HttpSession session) {
		checkPermit(model, session);
		int crew_idx = Integer.parseInt(idx); 
		model.addAttribute("crew_idx", crew_idx);
		
		return "mycrew_joinList";
	}
	
	// 크루 가입신청자 목록 (검색 or 오름차순시)
	@PostMapping(value = "/mycrew_joinList.ajax")
	@ResponseBody
	public List<CrewJoinDTO> joinList(String crew_idx, Boolean order, String searchFilter, String searchKeyword){
		
		List<CrewJoinDTO> list = crewmember_service.joinList(crew_idx, order, searchFilter, searchKeyword);
		
		return list;
	}
	
	// 크루원 목록
	@GetMapping(value = "/mycrew_memberList.go")
	public String memberList(String idx, Model model, HttpSession session) {
		checkPermit(model, session);
		int crew_idx = 0;
		
		if (idx != null && !idx.isEmpty()) {
			crew_idx = Integer.parseInt(idx);
        }
		model.addAttribute("crew_idx", crew_idx);
		
		return "mycrew_memberList";
	}
	
	// 크루원 목록 (검색 or 오름차순시)
	@PostMapping(value = "/mycrew_memberList.ajax")
	@ResponseBody
	public List<CrewMemberProfileDTO> memberList(String crew_idx, Boolean order, String searchFilter, String searchKeyword){
		
		List<CrewMemberProfileDTO> list = crewmember_service.memberList(crew_idx, order, searchFilter, searchKeyword);
		
		return list;
	}
	
	
	
	// 크루 입단승인/거절
	@PostMapping(value = "/join_approval.ajax")
	@ResponseBody
	public Map<String, Object> joinApproval(@RequestParam Map<String, String> params){
		boolean success = false;
		
		int row = crewmember_service.joinApproval(params);
        if(row > 0) {
        	success = true;
        }
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("success", success);
        
		return map;
	}
	
	// 크루원/일반회원 프로필 상세보기 (id : 보고자하는 멤버ID, idx : crew_idx)
	@RequestMapping(value = "/mycrew_memberDetail.go")
	public String memberDetail(String id, String profileType, String idx, Model model, HttpSession session) {
		checkPermit(model, session);
		//세션ID가져오기
		String user_id = (String) session.getAttribute("loginId");
		// 추후 해당 크루의 크루장인지 확인하여 아니라면.. 일반유저 프로필이 나오도록 한번더 처리.
		
		String profileType_; // 0:일반유저 프로필, 1: 크루원 프로필
		CrewMemberProfileDTO memberProfile = null;		
		
		// 프로필 타입을 전달받지 못한경우 => profileType 기본값: 0(일반유저)
		if(profileType == null || profileType.equals("0")) {
			profileType_ = "0";
			// 일반회원정보 찾기
			memberProfile = crewmember_service.memberDetail(id);
		}else {
			profileType_ = profileType;     // 프로필 타입 1: 크루원 프로필
			// 크루원정보 찾기
			memberProfile = crewmember_service.memberDetail(id, idx);
		}
		
		
		model.addAttribute("profile", memberProfile);
		logger.info("profileDTO CrewMemberProfileDTO: {}", memberProfile.toString());
		
		// profileType  0: 일반회원 프로필, 1: 크루회원 프로필
		model.addAttribute("profileType", profileType_);
		
		return "mycrew_memberDetail"; 
	}
	
	
	// 크루원 추방하기
	@PostMapping(value = "/crewMemberFire.ajax")
	@ResponseBody
	public Map<String, Object> memberFire(String member_idx){
		boolean success = false;
		
		int row = crewmember_service.memberFire(member_idx); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(row > 0) {
			success = true;
		}
		
		map.put("success", success);
		
		return map;
	}
	
	
	
}
