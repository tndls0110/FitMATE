package com.fitmate.crew.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fitmate.crew.service.CrewScheduleService;

@Controller
public class CrewScheduleController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CrewScheduleService crewschedule_service;
	
	// 크루 일정 작성
	@GetMapping(value="/crew_schedule_write.go")
	public String crew_schedule_write_go(@RequestParam Map<String,String> params,Model model) {
		
		/*
		String page = "";
		// 받을 파라미터값 = 크루장id,크루idx,
		String crew_idx = params.get("crew_idx");
		String crew_id = params.get("crew_id");
		
		if(crew_id == loginId) {
			
			// 작성자가 크루 작성자면
			page =	"crew_schedule_write";
		}
		else {
			// 작성자가 크루장이 아니라면
			page = "";
		}
		// 전달 받은 파라미터값 crew_schedule_write 에 뿌려주기
		model.addAttribute("crew_id", crew_id);
		model.addAttribute("crew_idx", crew_idx);
		*/
			return "crew_schedule_write";
		}
	
	@PostMapping(value="/crew_schedule_write.do")
	public String crew_schedule_write(@RequestParam(value = "day", required = false) String[] days,
			 String crew_id,
			 String crew_idx,
			 String date,
			 String start_time,
			 String end_time,
			String place,
			String content,
			 String subject) {
		
		// 받을 파라미터 = 크루idx,모임일시,모임장소,모인이유 // 주기적 일정인 경우 주기적날짜 정보
		
		
		logger.info("전달 받은 값 "+crew_id+date+start_time+end_time+place+content+subject);
		 // 선택된 요일 배열 받기
		if (days != null) {
			for (String day : days) {
	            logger.info("선택된 날짜는 {}", day);
	        }
	    } else {
	        logger.info("선택된 날짜가 없습니다.");
	    }
		
		crewschedule_service.crew_plan_create(days,crew_id,crew_idx,date,start_time,end_time,place,content,subject);
	       
		return "index123";
	}


}
