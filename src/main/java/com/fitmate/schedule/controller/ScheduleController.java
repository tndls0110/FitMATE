package com.fitmate.schedule.controller;

import com.fitmate.schedule.service.ScheduleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ScheduleController {
	@Autowired ScheduleService s_service;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping (value = {"/" ,"/schedule.go"})
	public String main() {
		return "schedule";
	}

	@GetMapping (value = "/get_totalevents.ajax")
	@ResponseBody
	public Map<String,Object> getEvents() {
		Map<String,Object> event_day =  s_service.getEvents();
		return event_day;
	}

	@GetMapping (value = "/journal_get.ajax")
	@ResponseBody
	public Map<String,Object> getJournal(String date) {
		String id = "member01";
		Map<String,Object> journal = s_service.getJournal(date,id);
			//글 idx 기반으로 file을 가져와야하는데.... 여기에서 글 idx

		return journal;
	}


	@RequestMapping (value = "/schedule_write.go")
	public String schedule_write() {
		return "schedule_write";
	}

	@PostMapping (value = "/schedule_write.do")
	public String schedule_write(MultipartFile[] files, @RequestParam Map<String,String> content) {
		logger.info("schedule_write 컨트롤러 도착");

		//세션으로 나중에 바꾸기
		String id = "member01";
		logger.info("content:{}",content);
		logger.info("files 길이 :{}",files.length);



		s_service.schedule_write(files,content,id);//순서 지키기

		return "redirect:/schedule.go";
	}


	@GetMapping (value = "/crewplan_get.ajax")
	@ResponseBody
	public Map<String,Object> crewplan_get(String date) {
		logger.info("컨트롤러에서 전달받은 date :{}",date);
		Map<String,Object> crew = new HashMap<>();

		List<Map<String,Object>> crew_plans = s_service.crewplan_get(date);
		//한 날짜에 crew plan은 여러 개 있을 수 있음
		crew.put("content", crew_plans);
		return crew;
	}

	@GetMapping (value = "/delete_journal.ajax")
	@ResponseBody
	public Map<String,Object> delete_journal(int idx) {
		logger.info("받아온 idx : ", idx);
		Map<String,Object> data = new HashMap<>();
		s_service.delete_journal(idx);
		return data;
	}
}
