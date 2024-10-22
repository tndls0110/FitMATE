package com.fitmate.mbti.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fitmate.mbti.service.MbtiService;

@Controller
public class MbtiController {
	@Autowired MbtiService m_service;
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping (value = "/mbti")//push하기 전에 /mbti로 수정해두기
	public String main() {
		return "redirect_test";
	}
	
	@RequestMapping (value = "/mbtiQ.go")
	public String mbtiQ() {
		return "mbti_q";
	}
	
	@GetMapping (value = "/mbtiIdx.ajax")
	@ResponseBody
	public Map<String, Object> mbtiIdx() {
		logger.info("mbti 컨트롤러 도착");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("idx",m_service.mbtiIdx());
		
		return result;
	}
	
	@GetMapping (value = "/loadQuestion.ajax")
	@ResponseBody
	public Map<String, Object> loadQuestion(int Qidx){
		logger.info("loadQuestion 컨트롤러 도착");
		logger.info("컨트롤러에서 전달 받은 idx : " + Qidx);
		
		Map<String, Object> data = m_service.loadQuestion(Qidx);
		
		return data;
	}
	
	
	
	
}