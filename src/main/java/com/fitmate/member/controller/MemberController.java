package com.fitmate.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fitmate.member.service.MemberService;

@Controller
public class MemberController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired MemberService member_service;
	
	String page = "";
	
	@RequestMapping (value = "/member_login.go")
	public String login() {
		
		return "member_login";
	}
	
}
