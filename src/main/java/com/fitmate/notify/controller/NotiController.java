package com.fitmate.notify.controller;

import com.fitmate.notify.service.NotiService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class NotiController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NotiService n_Service;
	@RequestMapping (value = "/alarm.go")
	public String goAlarm () {
		return "alarm";
	}

	@GetMapping (value = "/get_all_alarm.ajax")
	@ResponseBody
	public Map<String, Object> getAllAlarm (int idx) {
		logger.info("idx:{}",idx);
		Map<String, Object> data = new HashMap<String, Object>();
		String id = "member01";

		data.put("id", n_Service.getAllAlarm(id,idx));
		return data;
	}

	@GetMapping (value = "/read_change.ajax")
	@ResponseBody
	public Map<String, Object> read_change (int idx) {
		logger.info("idx:{}",idx);
		Map<String, Object> data = new HashMap<String, Object>();
		data.put("success", n_Service.read_change(idx));
		return data;
	}


	@GetMapping (value = "/delete_alarm.ajax")
	@ResponseBody
	public Map<String, Object> deleteAlarm (int idx) {
		logger.info("idx:{}",idx);
		Map<String, Object> data = new HashMap<>();
		data.put("success", n_Service.deleteAlarm(idx));
		return data;
	}

	@GetMapping (value = "/check_unreadAlarm.ajax")
	@ResponseBody
	public Map<String, Object> checkUnreadAlarm () {
		String id = "member01";
		Map<String, Object> data = new HashMap<>();
		String exists = n_Service.checkUnreadAlarm(id);
		data.put("exists", exists);
		return data;
	}

	@GetMapping (value = "/unread_count.ajax")
	@ResponseBody
	public Map<String, Object> unreadCount () {
		String id = "member01";
		Map<String, Object> data = new HashMap<>();
		int unread = n_Service.unread_count(id);
		data.put("count",unread);
		return data;
	}
}
