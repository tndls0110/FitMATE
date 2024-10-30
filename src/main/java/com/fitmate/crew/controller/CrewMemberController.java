package com.fitmate.crew.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

@Controller
public class CrewMemberController {
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired CrewMemberService crewmember_service;
	
	
	@GetMapping(value = "/mycrew_joinList.go")
	public String joinList(String idx, Model model) {
		int crew_idx = Integer.parseInt(idx); 
		model.addAttribute("crew_idx", crew_idx);
		
		return "mycrew_joinList";
	}
	
	// 크루 가입신청자 목록
	@PostMapping(value = "/mycrew_joinList.ajax")
	@ResponseBody
	public List<CrewJoinDTO> joinList(String crew_idx, Boolean order, String searchFilter, String searchKeyword){
		
		List<CrewJoinDTO> list = crewmember_service.joinList(crew_idx, order, searchFilter, searchKeyword);
		
		return list;
	}
	
	
	@PostMapping(value = "/join_approval.ajax")
	@ResponseBody
	public Map<String, Object> joinApprov(@RequestParam Map<String, String> params){
		boolean success = false;
		
		int row = crewmember_service.joinApproval(params);
        if(row > 0) {
        	success = true;
        }
		
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("success", success);
        
		return map;
	}
	
	// 크루원/일반회원 프로필 상세보기 
	@RequestMapping(value = "/mycrew_memberDetail.go")
	public String memberDetail(String id, String profileType, Model model) {
		String profileType_; // 0:일반유저 프로필, 1: 크루원 프로필
		
		// 프로필 타입을 전달받지 못한경우 => profileType 기본값: 0(일반유저)
		if(profileType == null || profileType.equals("0")) {
			profileType_ = "0";
		}else {
			profileType_ = profileType;     // 프로필 타입 1: 크루원 프로필
		}
		
		CrewMemberProfileDTO memberProfile = crewmember_service.memberDetail(id, profileType_);
		model.addAttribute("profile", memberProfile);
		
		logger.info("가져온 profile 정보 : ", memberProfile);
		
		// profileType  0: 일반회원 프로필, 1: 크루회원 프로필
		model.addAttribute("profileType", profileType_);
		
		return "mycrew_memberDetail"; 
	}
	
	
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
