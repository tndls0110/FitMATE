package com.fitmate.crew.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fitmate.crew.service.CrewService;

@Controller
public class CrewController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CrewService crew_service;
		
	@RequestMapping(value="crew_create.go")
	public String crew_create() {
		
		return "crew_create";
	}
}
