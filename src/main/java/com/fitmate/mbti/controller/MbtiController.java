package com.fitmate.mbti.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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

	@GetMapping (value = "/loadOption.ajax")
	@ResponseBody
	public Map<String, Object> loadOption(int Qidx){
		logger.info("loadOption 컨트롤러 도착");
		logger.info("loadOption컨트롤러에서 전달 받은 idx : " + Qidx);

		Map<String, Object> data = m_service.loadOption(Qidx);

		return data;
	}


	@GetMapping (value = "/get_typeScore.ajax")
	@ResponseBody
	public Map<String, Object> getTypeScore(int Oidx){
		logger.info("getTypeScore 컨트롤러 도착");
		logger.info("getTypeScore 컨트롤러에서 전달받은 option idx : " + Oidx);

		Map<String,Object> data = m_service.getTypeScore(Oidx);
		return data;
	};

	@GetMapping (value = "/nextPageIdx.ajax")
	@ResponseBody
	public Map<String, Object> nextPageIdx(int lastQIdx){
		Map<String,Object> result = new HashMap<>();
		result.put("idx",m_service.nextPageIdx(lastQIdx));
		return result;
	};


	@GetMapping (value = "/question_count.ajax")
	@ResponseBody
	public Map<String, Object> questionCount(){
		Map<String,Object> data = new HashMap<>();
		data.put("count",m_service.questionCount());
		return data;
	};

	@GetMapping (value = "/mbti_r.go")
	public String mbtiR(@RequestParam Map<String, String> scores, Model model) {
			logger.info("mbtiR 컨트롤러 도착");
		logger.info("scores 받아온 값 : " + scores);

		Map<String,Object> data = new HashMap<>();
		Set <String> keySets = scores.keySet();
		logger.info("keySets 받아온 값 : " + keySets);
		//List로 보내기?
		for (String key : keySets) {
			logger.info("key 받아온 값 : " + key);
			String value = scores.get(key);
			logger.info("value 받아온 값 : " + value);
			data.put(key, value);
		}
		logger.info("data:{}",data);

		model.addAttribute("scores",scores);
		return "mbti_r";


	};

	//=========test ===========





}
