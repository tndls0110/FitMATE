package com.fitmate.crew.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fitmate.admin.dto.RegReportDTO;
import com.fitmate.admin.dto.ReportDTO;
import com.fitmate.crew.service.CrewPageService;

@Controller
public class CrewPageController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CrewPageService crewpage_service;
	
	@RequestMapping(value="/crew_report.go")
	public String crew_report() {
		
		return "crew_report";
	}
	
	@GetMapping(value="/crew_report.ajax")
	@ResponseBody
	public Map<String,Object> report_list(){
		
		Map<String,Object> result = new HashMap<String, Object>();
		
		List<ReportDTO> reportlist = crewpage_service.report_list();
		logger.info("reportlist = {}",reportlist);
		result.put("reportlist", reportlist);
		
		return result;
	}
	
}
