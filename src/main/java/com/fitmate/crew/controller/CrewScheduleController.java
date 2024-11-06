package com.fitmate.crew.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fitmate.crew.dto.CrewScheduleDTO;
import com.fitmate.crew.dto.CrewScheduleMDTO;
import com.fitmate.crew.service.CrewScheduleService;

@Controller
public class CrewScheduleController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CrewScheduleService crewschedule_service;
	
	// 크루 일정 작성
	@GetMapping(value="/crew_schedule_write.go")
	public String crew_schedule_write_go(@RequestParam Map<String,String> params,Model model,HttpSession session) {
		
		
		String page = "";
		// 받을 파라미터값 = 크루장id,크루idx,
		String crew_idx = params.get("crew_idx");
		String crew_id = params.get("crew_id");
		String loginId = session.getAttribute("loginId").toString();
		logger.info("로그인아이디"+loginId);
		logger.info("크루장id"+crew_id);
		logger.info("크루idx"+crew_idx);
		if(crew_id.equals(loginId)&&loginId != null) {
			
			// 작성자가 크루 작성자면
			page =	"crew_schedule_write";
			// 전달 받은 파라미터값 crew_schedule_write 에 뿌려주기
			model.addAttribute("crew_id", crew_id);
			model.addAttribute("crew_idx", crew_idx);
		}
		else {
			// 작성자가 크루장이 아니라면
			page = "redirect:/crew_main_page.go?crew_idx="+crew_idx;
		}
		
		
			return page;
		}
	// 크루 일정 작성하기
	@PostMapping(value="/crew_schedule_write.do")
	public String crew_schedule_write(@RequestParam(value = "day", required = false) String[] days,
			 String crew_id,
			 String crew_idx,
			 String date,
			 String start_time,
			 String end_time,
			String place,
			String content,
			 String subject,HttpServletRequest session) {
		
		// 받을 파라미터 = 크루idx,모임일시,모임장소,모인이유 // 주기적 일정인 경우 주기적날짜 정보
		
		
		logger.info("전달 받은 값 "+crew_id+date+start_time+end_time+place+content+subject);
		 // 선택된 요일 배열 받기
		if (days != null) {
			for (String day : days) {
	            logger.info("선택된 날짜는 {}", day);
	        }
	    } else {
	        logger.info("선택된 날짜가 없습니다.");
	    }
		String page = "redirect:/crew_main_page.go?crew_idx="+crew_idx;
		crewschedule_service.crew_plan_create(days,crew_id,crew_idx,date,start_time,end_time,place,content,subject);
	    // 크루 페이지 redirect로 바꿔주기
		return page;
	}
	
	// 크루 일정 날짜 가져오기
	@GetMapping(value="/crew_plan_events.ajax")
	@ResponseBody
	public Map<String,Object> crew_get_plan(@RequestParam String crew_idx){
		// getCrewEvents
		logger.info("크루 이벤트 아작스 실행");
		logger.info("crew idx = "+crew_idx);
		Map<String,Object> crew_plan =  crewschedule_service.crew_get_plan(crew_idx);
		return crew_plan;
	}
	
	// 크루 일정 상세 정보 가져오기
	@GetMapping(value="/crew_plan_detail.ajax")
	@ResponseBody
	public Map<String,Object> crew_plan_detail(@RequestParam String date,String crew_idx){
		// getCrewEvents
		Map<String,Object> response = new HashMap<>();
		logger.info("크루 플랜 디테일 아작스 실행");
		logger.info("date = "+date);
		logger.info("crew_idx = "+crew_idx);
		 try {
		        // 크루 플랜 세부 정보 가져오기
			 	List<CrewScheduleDTO> crewPlan = crewschedule_service.crew_plan_detail(date, crew_idx);
		        if (crewPlan != null && !crewPlan.isEmpty()) {
		        	
		        	
		        	 List<Map<String, Object>> crewPlanDetails = new ArrayList<>();
		        	for (CrewScheduleDTO crewScheduleDTO : crewPlan) {
		        		/* 받아온 크루 일정 디테일 정보 확인
		        		logger.info("크루 일정 가져온 값 = plan_idx: {}, crew_idx: {}, plan_date: {}, plan_place: {}, plan_subject: {}, plan_content: {}, plan_start: {}, plan_end: {}",
		                        crewScheduleDTO.getPlan_idx(),
		                        crewScheduleDTO.getCrew_idx(),
		                        crewScheduleDTO.getPlan_date(),
		                        crewScheduleDTO.getPlan_place(),
		                        crewScheduleDTO.getPlan_subject(),
		                        crewScheduleDTO.getPlan_content(),
		                        crewScheduleDTO.getPlan_start(),
		                        crewScheduleDTO.getPlan_end());
		        		*/
		        		
		        		int planidx = crewScheduleDTO.getPlan_idx();
		        		List<CrewScheduleMDTO> participants = crewschedule_service.crew_plan_members(planidx);
		        		// 크루 일정 참가자 정보
		        		// logger.info("크루 일정 참가자 가져온값 = {}",participants);
		        		// 크루 플랜과 참가자 목록을 쌍으로 묶어 추가
		                Map<String, Object> crewPlanDetail = new HashMap<>();
		                crewPlanDetail.put("crewPlan", crewScheduleDTO);
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
	// 크루 일정 삭제
	@PostMapping(value="/crew_plan_del.do")
	public String crew_plan_del(@RequestParam Map<String,String> params) {
		logger.info("삭제 실행");
		logger.info("del {}",params);
		
		String plan_idx = params.get("plan_idx");
		String crew_idx = params.get("crew_idx");
		String page = "redirect:/crew_main_page.go?crew_idx="+crew_idx;
		crewschedule_service.crew_plan_del(plan_idx,crew_idx);
		
		return page;
	}
	// 크루 일정 참가
	@PostMapping(value="/crew_plan_join.do")
	public String crew_plan_join(@RequestParam Map<String,String> params) {
		logger.info("참가 실행");
		logger.info("join {}",params);
		String crew_idx = params.get("crew_idx");
		String plan_idx = params.get("plan_idx");
		String user_id = params.get("user_id");
		String page = "redirect:/crew_main_page.go?crew_idx="+crew_idx;
		crewschedule_service.crew_plan_join(plan_idx,user_id);
		return page;
	}
	// 크루 일정 취소 
	@PostMapping(value="crew_plan_cancel.ajax")
	@ResponseBody
	public int crew_plan_cancel(@RequestParam String plan_idx,String user_id) {
		 logger.info("userid"+user_id);
		 logger.info("plan_idx"+plan_idx);
		 crewschedule_service.crew_plan_cancel(plan_idx,user_id);
		 
		 return 1;
	 }
	
	
}
