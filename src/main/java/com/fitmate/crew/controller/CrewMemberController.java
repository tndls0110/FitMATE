package com.fitmate.crew.controller;

import java.time.LocalDateTime;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fitmate.crew.dto.CrewJoinDTO;
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
	public List<CrewJoinDTO> joinList(String crew_idx){
		
		List<CrewJoinDTO> list = crewmember_service.joinList(crew_idx);
		
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
	
}
