package com.fitmate.schedule.controller;

import com.fitmate.schedule.service.ScheduleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

	@GetMapping (value = "get_jounalevents.ajax")
	@ResponseBody
	public Map<String,Object> getEvents() {
		Map<String,Object> event_day = new HashMap<String,Object>();
		List<Map<String,Object>> events_day = s_service.getEvents();
		event_day.put("date", events_day);
		return event_day;
	}

	@GetMapping (value = "journal_get.ajax")
	@ResponseBody
	public Map<String,Object> getJournal(String date) {
		Map<String,Object> journal = new HashMap<String,Object>();
			List<Map<String,Object>> journal_list =s_service.getJournal(date);
			journal.put("content", journal_list);
		return journal;
	}



}
