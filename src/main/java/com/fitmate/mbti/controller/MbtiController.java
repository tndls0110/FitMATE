package com.fitmate.mbti.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.fitmate.mbti.dto.MbtiQRDTO;
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

	@GetMapping (value = "/mbti_r.go") //결과 페이지에서 insert 시켜줘야하니까.. 그냥 결과 쪽에 다 넘겨서 결과 단에서 최댓값 계산하게 하기
	public String mbtiR(@RequestParam Map<String, String> scores, Model model) {

		//login id 임의 설정
		logger.info("mbtiR 컨트롤러 도착");
		logger.info("scores 받아온 값 : " + scores);
		String login_id = "member01";

		Map<String,Object> data = new HashMap<>();
		data.put("login_id",login_id);

		model.addAttribute("data",data);

		model.addAttribute("scores",scores);
		return "mbti_r";
	};

	@GetMapping (value = "/mbti_r_get.ajax")
	@ResponseBody
	public Map<String,String> mbtiRGet(String max_mbti) {
		logger.info("mbti_r_get.ajax 컨트롤러 도착");
		logger.info("max_mbti : {}",max_mbti);
		Map<String,String> recommend =  m_service.mbtiRGet(max_mbti);
		return recommend;
	};

	@GetMapping (value = "/create_Totalscore.ajax")
	@ResponseBody
	public Map<String,Object> createTotalScore() {
		Map<String,Object> scores = new HashMap<>();
		scores.put("create_totalScore",m_service.create_totalScore());
		return scores;
	};

	@GetMapping (value = "/checkResult.ajax")
	@ResponseBody
	public Map<String,Object> checkResult(String id) {
		logger.info("check 컨트롤러에서 받아온 id 값 : " + id);
		Map<String,Object> data = new HashMap<>();
		Boolean success = m_service.checkResult(id);
		data.put("success",success);
		return data;
	}


	@PostMapping (value = "delete_result.ajax")
	@ResponseBody
	public Map<String,Object> deleteResult(String id) {
		logger.info("delete 컨트롤러에서 받아온 id 값 :",id);
		Map<String,Object> data = new HashMap<>();
		Boolean success = m_service.deleteResult(id);
		data.put("success",success);
		return data;
	}


	@PostMapping (value = "/save_result.ajax")
	@ResponseBody
	public Map<String,Object> saveResult(@RequestBody Map<String,Object> score) {
		//String id는 그냥 session에서 받아다 써...;;;;;
		String id = "member01";
		logger.info("save 컨트롤러에서 받아온 값 :{}",score);

		Set <String> keys= score.keySet();
		for(String key : keys) {
			logger.info("key : {}",key);

			Object value = score.get(key);
			logger.info("value : {}",value);
		}
		Map<String,Object> data = new HashMap<>();
		Boolean success = m_service.saveResult(id,score);
		data.put("success",success);
		return data;
	}

	@GetMapping (value = "/profile_mbti.ajax")
	@ResponseBody
	public Map<String,Object> profileMbti(@RequestParam Map<String, String> max) {
		String id = "member01";
		Map<String,Object> data = new HashMap<>();
		logger.info("profile_mbti 컨트롤러에서 받아온 값 :{}",max);
		Boolean success = m_service.profileMbti(max,id);

		data.put("success",success);
		return data;
	}


}
