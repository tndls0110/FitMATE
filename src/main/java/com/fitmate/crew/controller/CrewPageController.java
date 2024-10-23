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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fitmate.admin.dto.RegReportDTO;
import com.fitmate.admin.dto.ReportDTO;
import com.fitmate.crew.dto.CrewBoardDTO;
import com.fitmate.crew.dto.CrewSearchListDTO;
import com.fitmate.crew.service.CrewPageService;

@Controller
public class CrewPageController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CrewPageService crewpage_service;
	
	// 신고 페이지 이동
	@RequestMapping(value="/crew_report.go")
	public String crew_report() {
		
		return "crew_report";
	}
	
	// 신고사유 리스트 불러오는 ajax
	@GetMapping(value="/crew_report.ajax")
	@ResponseBody
	public Map<String,Object> report_list(){
		
		Map<String,Object> result = new HashMap<String, Object>();
		
		List<ReportDTO> reportlist = crewpage_service.report_list();
		logger.info("reportlist = {}",reportlist);
		result.put("reportlist", reportlist);
		
		return result;
	}
	
	// 공지사항 페이지로 이동하기
	@RequestMapping(value="/crew_page_notice.go")
	public String crew_page_notice() {
	
		return "crew_page_notice";
	}
	
	// 공지사항 작성하기
	@RequestMapping(value="/crew_page_notice.do",method =RequestMethod.POST)
	public String crew_notice_write(@RequestParam String subject,@RequestParam String board_id,@RequestParam int crew_idx) {
		// subject = 공지사항 내용이자 제목, board_id = 작성자, crew_idx = 크루 식별위한 변수 + board_idx 와 crew_idx 합쳐줄때(식별하기위해) 필요
		
		logger.info("입력값 {} ",subject);
		
		crewpage_service.crew_notice_write(subject,board_id,crew_idx);
		
		return "redirect:crew_page_notice.go";
	}
	
	// 공지사항목록 불러오기
	@GetMapping(value = "/crew_page_notice.ajax")
	@ResponseBody 
	public List<CrewBoardDTO> crew_notice_list(@RequestParam Map<String,String> params){
		
		logger.info("params : " + params);
		String crewidx = params.get("crew_idx");
		int crew_idx = Integer.parseInt(crewidx);
		List<CrewBoardDTO> notcelist = crewpage_service.crew_notice_list(crew_idx);
		
		logger.info("notcelist : "+notcelist);
		return notcelist; 
	}	
	
	@GetMapping(value="/crew_notice_del")
	public String crew_notice_del(@RequestParam String board_idx) {
		
		logger.info("보드번호는 ? " + board_idx);
		
		crewpage_service.crew_notice_del(board_idx);
		
		return "redirect:crew_page_notice.go";
	}
	
}
