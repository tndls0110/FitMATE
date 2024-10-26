package com.fitmate.admin.controller;

import com.fitmate.admin.service.NoticeService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class NoticeController {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired NoticeService notice_service;

	// 세션 체크
	String page = "";

	// 공지사항 조회
	@RequestMapping (value = "/admin_notice.go")
	public String notice (Model model, HttpSession session) {
		page = "admin_notice";
		return page;
	}

}
