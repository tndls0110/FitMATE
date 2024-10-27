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
import java.util.Map;

@Controller
public class ScheduleController {
	@Autowired ScheduleService s_service = new ScheduleService();
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping (value = {"/" ,"/schedule.go"})
	public String main() {
		return "schedule";
	}

	@GetMapping (value = "get_events.ajax")
	@ResponseBody
	public Map<String,Object> getEvents() {
		Map<String,Object> event_day = new HashMap<String,Object>();
		Date events_day = s_service.getEvents();
		event_day.put("date", events_day);
		return event_day;
	}
}
