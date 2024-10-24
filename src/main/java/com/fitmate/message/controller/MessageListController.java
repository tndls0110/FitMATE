package com.fitmate.message.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fitmate.message.service.MessageListService;

@Controller
public class MessageListController {
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired MessageListService messagelist_service;
	
	
	@RequestMapping(value = "/message_list.go")
	public String message_list() {
		
		return "message_list";
	}
	
}
