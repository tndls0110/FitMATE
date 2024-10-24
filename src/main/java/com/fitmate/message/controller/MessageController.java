package com.fitmate.message.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fitmate.message.service.MessageService;

@Controller
public class MessageController {
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired MessageService message_service;
	
	@RequestMapping(value = "/message.go")
	public String message() {
		
		return "message";
	}
	@RequestMapping(value = "/message.do")
	public String message(HttpServletRequest request, HttpSession session) {
		
		return"message.do";
	}
}
