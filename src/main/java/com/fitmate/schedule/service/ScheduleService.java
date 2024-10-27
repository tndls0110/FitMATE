package com.fitmate.schedule.service;

import com.fitmate.schedule.dao.ScheduleDAO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class ScheduleService {
	@Autowired ScheduleDAO s_dao;
	Logger logger = LoggerFactory.getLogger(getClass());

	public Date getEvents() {
		return s_dao.getEvents();
	}
}
