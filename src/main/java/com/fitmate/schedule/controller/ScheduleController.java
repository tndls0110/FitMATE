package com.fitmate.schedule.controller;

import com.fitmate.crew.dto.CrewScheduleDTO;
import com.fitmate.crew.dto.CrewScheduleMDTO;
import com.fitmate.schedule.dto.ScheduleDTO;
import com.fitmate.schedule.service.ScheduleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.Console;
import java.util.*;

@Controller
public class ScheduleController {
	@Autowired ScheduleService s_service;
	Logger logger = LoggerFactory.getLogger(getClass());

	String page = "";

	public void checkPermit(String addr, Model model, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		if (loginId == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			if (addr.equals("") || addr == null) {
				model.addAttribute("addr", "redirect:/schedule.go");
			} else {
				model.addAttribute("addr", addr);
			}
			page = "member_login";
			logger.info("checkPermit2 / page address: "+page);
		}
	}



	@RequestMapping (value = {"/" ,"/schedule.go"})
	public String main(Model model, HttpSession session) {
		page = "schedule";
		checkPermit("redirect:/schedule.go",model,session);
		return page;
	}

	@GetMapping (value = "/get_totalevents.ajax")
	@ResponseBody
	public Map<String,Object> getEvents(HttpSession session) {
		String id = session.getAttribute("loginId").toString();
		logger.info("세션에서 받아온 id 값 :{}",id);
		Map<String,Object> event_day =  s_service.getEvents(id);
		return event_day;
	}

	@GetMapping (value = "/journal_get.ajax")
	@ResponseBody
	public Map<String,Object> getJournal(String date, HttpSession session) {
		String id = session.getAttribute("loginId").toString();
		logger.info("세션에서 받아온 id 값 :{}",id);
		Map<String,Object> journal = s_service.getJournal(date,id);
			//글 idx 기반으로 file을 가져와야하는데.... 여기에서 글 idx

		return journal;
	}


	@RequestMapping (value = "/schedule_write.go")
	public String schedule_write(Model model, HttpSession session) {
		page = "schedule_write";
		checkPermit("redirect:/schedule_write.go",model,session);
		return page;
	}

	@PostMapping (value = "/schedule_write.do")
	public String schedule_write(MultipartFile[] files, @RequestParam Map<String,String> content,HttpSession session) {
		logger.info("schedule_write 컨트롤러 도착");

		//세션으로 나중에 바꾸기
		String id = session.getAttribute("loginId").toString();
		logger.info("세션에서 받아온 id 값 :{}",id);

		logger.info("content:{}",content);
		logger.info("files 길이 :{}",files.length);

		s_service.schedule_write(files,content,id);//순서 지키기

		return "redirect:/schedule.go";
	}


	@GetMapping (value = "/crewplan_get.ajax")
	@ResponseBody
	public Map<String,Object> crewplan_get(String date,HttpSession session) {
		logger.info("컨트롤러에서 전달받은 date :{}",date);
		String id = session.getAttribute("loginId").toString();
		logger.info("세션에서 받아온 id 값 :{}",id);
		Map<String,Object> crew = new HashMap<>();

		List<Map<String,Object>> crew_plans = s_service.crewplan_get(id,date);
		//한 날짜에 crew plan은 여러 개 있을 수 있음
		crew.put("content", crew_plans);
		return crew;
	}

	@GetMapping (value = "/delete_journal.ajax")
	@ResponseBody
	public Map<String,Object> delete_journal(int idx) {
		logger.info("받아온 idx :{}", idx);
		boolean success = false;
		Map<String,Object> data = new HashMap<>();
		int updated_rows = s_service.delete_journal(idx);
		if(updated_rows > 0) {
			success = true;
			data.put("success",success);
		}
		return data;
	}

	@GetMapping (value = "/update_journal.go")
	public String update_journal(int idx, Model model,HttpSession session) {
		logger.info("컨트롤러에 전달된 idx:{}",idx);
		page = "schedule_update";

		if(session.getAttribute("loginId") != null) {
			checkPermit("redirect:/update_journal.go",model,session);
			s_service.getJournal_detail(idx,model);
		}

		return page;
	}

	@GetMapping (value = "delete_img.ajax")
	@ResponseBody
	public Map<String,Object> delete_img(int file_idx){
		Map<String,Object> data = new HashMap<>();
		boolean success = s_service.delete_img(file_idx);
		data.put("success",success);
		return data;
	}

	@GetMapping (value = "individual_crew_plan_detail.ajax")
	@ResponseBody
	public Map<String,Object> crew_plan_detail(@RequestParam String date,String crew_idx,HttpSession session){
		String id = session.getAttribute("loginId").toString();
		logger.info("세션에서 받아온 id 값 :{}",id);

		// getCrewEvents
		Map<String,Object> response = new HashMap<>();
		logger.info("크루 플랜 디테일 아작스 실행");
		logger.info("date = "+date);
		logger.info("crew_idx = "+crew_idx);
		try {
			// 크루 플랜 세부 정보 가져오기
			List<ScheduleDTO> crewPlan = s_service.crew_plan_detail(date, crew_idx,id);
			if (crewPlan != null && !crewPlan.isEmpty()) {


				List<Map<String, Object>> crewPlanDetails = new ArrayList<>();
				for (ScheduleDTO ScheduleDTO : crewPlan) {
		        		/* 받아온 크루 일정 디테일 정보 확인*/

		        		logger.info("크루 일정 가져온 값 = plan_idx: {}, crew_idx: {}, plan_date: {}, plan_place: {}, plan_subject: {}, plan_content: {}, plan_start: {}, plan_end: {}",
								ScheduleDTO.getPlan_idx(),
								ScheduleDTO.getCrew_idx(),
								ScheduleDTO.getPlan_date(),
								ScheduleDTO.getPlan_place(),
								ScheduleDTO.getPlan_subject(),
								ScheduleDTO.getPlan_content(),
								ScheduleDTO.getPlan_start(),
								ScheduleDTO.getPlan_end()
						);


					int planidx = ScheduleDTO.getPlan_idx();
					List<CrewScheduleMDTO> participants = s_service.crew_plan_members(planidx);
					// 크루 일정 참가자 정보
					// logger.info("크루 일정 참가자 가져온값 = {}",participants);
					// 크루 플랜과 참가자 목록을 쌍으로 묶어 추가
					Map<String, Object> crewPlanDetail = new HashMap<>();
					crewPlanDetail.put("crewPlan", ScheduleDTO);
					crewPlanDetail.put("participants", participants);
					crewPlanDetails.add(crewPlanDetail);
				}

				response.put("crewPlanDetails", crewPlanDetails);
				response.put("status", "success");
			} else {
				response.put("status", "error");
				response.put("message", "크루 플랜을 찾을 수 없습니다.");
			}
		} catch (Exception e) {
			logger.error("크루 플랜 세부 정보 조회 중 오류 발생", e);
			response.put("status", "error");
			response.put("message", "내부 서버 오류입니다.");
		}

		return response;
	}



	@GetMapping (value = "update_content.ajax")
	@ResponseBody
	public Map<String,Object> update_content(@RequestParam Map<String,Object> param,HttpSession session){
		logger.info("업데이트 해야하는 param :{}", param);
		String id = session.getAttribute("loginId").toString();
		logger.info("세션에서 받아온 id 값 :{}",id);
		Map<String,Object> data = new HashMap<>();
		data.put("content", s_service.update_content(param));
		return data;
	}


	@PostMapping (value = "file_insert.ajax")
	@ResponseBody
	public Map<String,Object> file_insert(@RequestParam Map<String, Object> input ,@RequestParam MultipartFile file){
		logger.info("받아온 idx 값 :{}",input);
		logger.info("받아온 파일 값 :{}",file);
		String idx = "";
		for (String key : input.keySet()) {
			logger.info("key:{}",key);
			idx = (String) input.get(key);
			logger.info("idx:{}",idx);
		}

		Map<String,Object> data = new HashMap<>();
		boolean success = s_service.file_insert(idx,file);
		data.put("success",success);
		return data;
	}
}
