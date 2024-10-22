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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fitmate.crew.service.CrewService;

@Controller
public class CrewController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CrewService crew_service;
		
	@RequestMapping(value="/crew_create.go")
	public String crew_create() {
		
		return "crew_create";
	}
	
	// 1. 크루 모집글페이지
	@RequestMapping(value = "/crew_search")
	public String crewSearch(Model model) {
		// 1-1. 필터 - 지역정보/MBTI정보 가져오기
		List<Map> placeFilter = crew_service.placeFilter();
		model.addAttribute("placeFilter", placeFilter);

		List<Map> mbtiFilter = crew_service.mbtiFilter();
		model.addAttribute("mbtiFilter", mbtiFilter);

		return "crew_search";
	}

	// 2. 크루 모집글 목록조회
	@GetMapping(value = "/crew_search.ajax")
	@ResponseBody 
	public Map<String, Object> crewSearch2( @RequestParam Map<String, String> params){
		
		logger.info("params : " + params);
	 
		Map<String, Object> map = new HashMap<String, Object>();
	 
		List<Map> recruitList = crew_service.crewList(params);
		
		map.put("String", "Hi");
	 
		return map; 
	}	
}
