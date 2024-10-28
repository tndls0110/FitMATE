package com.fitmate.schedule.service;

import com.fitmate.schedule.dao.ScheduleDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class ScheduleService {
	@Autowired ScheduleDAO s_dao;
	Logger logger = LoggerFactory.getLogger(getClass());

	public List<Map<String,Object>> getEvents() {
		return s_dao.getEvents();
	}

	public List<Map<String, Object>> getJournal(String date) {
		List<Map<String,Object>> journal_list = s_dao.getJournal(date);
	}
}
