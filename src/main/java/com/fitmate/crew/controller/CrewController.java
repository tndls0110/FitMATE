package com.fitmate.crew.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.server.ResponseStatusException;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fitmate.admin.dto.RegCountyDTO;
import com.fitmate.crew.dto.CrewCommentDTO;
import com.fitmate.crew.dto.CrewSearchListDTO;
import com.fitmate.crew.service.CrewService;
import com.fitmate.member.service.MemberService;

@Controller
public class CrewController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CrewService crew_service;
	@Autowired MemberService member_service;
	
	String page = "";
	
	/* checkPermit(model, session);를 써서 세션ID와 크루이용가능여부 전부 체크. */
	// 세션 체크
	public void checkPermit(Model model, HttpSession session) {
		if (session.getAttribute("loginId") == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			page = "member_login";
		}
	}
	
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
	      }
	}
	
	// 크루 이용 가능 여부 체크
	public void checkPermitCrew(String addr, Model model, HttpSession session) {
		if (session.getAttribute("loginId") != null) {
			String user_id = (String) session.getAttribute("loginId");
			LocalDateTime cleared_date = member_service.getPermit(user_id);
			LocalDateTime now = LocalDateTime.now();
			if (cleared_date != null){
				DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM월 dd일 HH시 mm분");
				String clearedDate = cleared_date.format(formatter);
				if (cleared_date.isAfter(now)) {
					model.addAttribute("msg", user_id+"님은 "+clearedDate+"까지 크루 기능을 이용하실 수 없습니다.");
					page = "schedule";
				}
			}
		} else {
			checkPermit(addr, model, session);
			
		}
	}
	
	
	   
	
	
	
	
	
		
	@RequestMapping(value="/crew_create.go")
	public String crew_create(Model model, HttpSession session) {
		
		List<RegCountyDTO> list = member_service.getRegion();
		model.addAttribute("region", list);
		list = member_service.getRegion2("1");
		model.addAttribute("region2", list);
		
		return "crew_create";
	}
	
	@RequestMapping (value = "crew_regions.ajax")
	@ResponseBody
	public List<RegCountyDTO> crew_regions(@RequestParam String selectedRegionIdx , HttpSession session) {
		
		
		List<RegCountyDTO> placemap = crew_service.crew_regions(selectedRegionIdx);
		
		
		
		logger.info(selectedRegionIdx);
		return placemap;
	}
	
	@RequestMapping(value="/crew_create_rewrite.go")
	public String crew_create_rewrite(@RequestParam String idx,@RequestParam String board_idx,Model model) {
		
		logger.info("crew_idx = "+idx+"board_idx = "+board_idx);
		
		
		String crew_idx = idx;
		CrewSearchListDTO crewboard = new CrewSearchListDTO();
		
		crewboard = crew_service.crew_board_detail(board_idx,crew_idx);
		String crew_name = crewboard.getCrew_name();
		String region_idx = crewboard.getRegion_name();
		String regions_idx = crewboard.getRegions_name();
		String subject = crewboard.getSubject();
		String crew_id = crewboard.getLeader_id();
		
		
		List<RegCountyDTO> list = member_service.getRegion();
		logger.info("crew_idx"+crew_idx+"board_idx"+board_idx+"crew_name"+crew_name+"region_idx"+region_idx+"regions_idx"+regions_idx);
		model.addAttribute("region", list);
		model.addAttribute("crew_idx", crew_idx);
		model.addAttribute("board_idx", board_idx);
		model.addAttribute("crew_name", crew_name);
		model.addAttribute("region_idx", region_idx);
		model.addAttribute("regions_idx", regions_idx);
		model.addAttribute("subject", subject);
		model.addAttribute("crew_id", crew_id);
		
		
		return "crew_create_rewrite";
	}
	
	@PostMapping(value="/crew_create.do")
	public String crew_create(@RequestParam String crew_id,@RequestParam String name,@RequestParam int regions_idx,@RequestParam String content) {
		
		int crew_idx = crew_service.crew_create(crew_id,name,regions_idx,content);
		/* 
		logger.info("crew_id {}",crew_id);
		logger.info("name {}",name);
		logger.info("regions_idx {}",regions_idx);
		logger.info("content {}",content);
		*/
		logger.info("crewidx = "+crew_idx+" regions_idx= "+regions_idx);
		String crewidx = Integer.toString(crew_idx);
		 String page = "redirect:/crew_main_page.go?crew_idx="+crewidx;
		return page;
	}
	
	
	
	
	
	// 크루 모집글 수정하기
	@PostMapping(value="/crew_create_rewrite.do")
	public String crew_create_rewrite(@RequestParam int regions_idx,@RequestParam String content,@RequestParam int board_idx, String crew_idx) {
		 crew_service.crew_create_rewrite(regions_idx,content,board_idx);
		 logger.info("regions_idx = "+regions_idx+" board_idx = "+board_idx);
		 
		 String page = "redirect:/crew_recruit_detail.go?board_idx="+board_idx+"&crew_idx="+crew_idx;
		return page;
	}
	
	
	// 크루검색
	@RequestMapping(value = "/crew_search")
	public String crewSearch(Model model, HttpSession session) {
		page = "crew_search";
		
		
		if (session.getAttribute("loginId") == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			page = "member_login";
		}else {
			String addr = page;
			checkPermitCrew(addr, model, session);
			
			// 1-1. 필터 - 지역정보/MBTI정보 가져오기
			List<Map> placeFilter = crew_service.placeFilter();
			model.addAttribute("placeFilter", placeFilter);
	
			List<Map> mbtiFilter = crew_service.mbtiFilter();
			model.addAttribute("mbtiFilter", mbtiFilter);
		}
		
		return page;
	}

	// 크루 모집글 목록조회
	@GetMapping(value = "/crew_search.ajax")
	@ResponseBody 
	public List<CrewSearchListDTO> crewSearchList( @RequestParam Map<String, String> params, HttpSession session){
		//세션ID가져오기
		String user_id = (String) session.getAttribute("loginId");
		
		List<CrewSearchListDTO> recruitList = crew_service.crewList(params, user_id);
	 
		return recruitList; 
	}
	
	// 크루 모집글 상세조회
	@RequestMapping(value="/crew_recruit_detail.go")
	public String recruitDetail(String board_idx, String crew_idx, HttpSession session, Model model) {
		page = "crew_recruit_detail";
				
		
		if (session.getAttribute("loginId") == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			page = "member_login";
		}else {
			String addr = page;
			checkPermitCrew(addr, model, session);
		
			//세션ID가져오기
			String user_id = (String) session.getAttribute("loginId");
			
			// 크루 모집글 정보 + 크루 가입여부 체크
			crew_service.recruitDetail(board_idx, user_id, crew_idx, model);
		}
		
		return page;
	}
	
	// 크루 모집글 - 댓글,대댓글 가져오기
	@GetMapping(value = "/crew_recruit_detail.ajax")
	@ResponseBody 
	public List<CrewCommentDTO> recruitDetail(String board_idx, String limit, String offset, HttpSession session){
		
		return crew_service.recruitDetail(board_idx, limit, offset); 
	}
	
	// 크루 입단 신청
	@PostMapping(value = "/join_crew.ajax")
	@ResponseBody
	public Map<String, Object> joinCrew(String crew_idx, String join_id, String leader_id, String crew_name){
		boolean success = false;
		Map<String, Object> map = new HashMap<String, Object>();
		
		int row = crew_service.joinCrew(crew_idx, join_id, leader_id, crew_name);
		
		// Insert에 성공했을 때 
		if(row > 0) {
			success = true;
		}
		
		map.put("success", success);
		return map;
	}
	
	// 크루 입단 취소
	@PostMapping(value = "/leave_crew.ajax")
	@ResponseBody
	public Map<String, Object> leaveCrew(String join_idx){
		boolean success = false;
		Map<String, Object> map = new HashMap<String, Object>();
		
		int row = crew_service.leaveCrew(join_idx);
		
		// delete에 성공했을 때 
		if(row > 0) {
			success = true;
		}
		
		map.put("success", success);
		return map;
	}
	
	// 크루 탈퇴
	@PostMapping(value = "/memberExit.ajax")
	@ResponseBody
	public Map<String, Object> memberExit(String member_idx){
		boolean success = false;
		
		int row = crew_service.memberExit(member_idx); 
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(row > 0) {
			success = true;
		}
		
		map.put("success", success);
		
		return map;
	}
	
	
	// 크루 모집글 - 문의댓글/답변대댓글 내용저장
	@PostMapping(value="/crew_recruit_detail.do")
	public String commentWrite(@RequestParam Map<String, String> params, Model model, HttpSession session) {
		// 이동할 페이지
		String board_idx = params.get("board_idx");
		String crew_idx = params.get("crew_idx");
		
		page = "redirect:/crew_recruit_detail.go?board_idx=" + board_idx+ "&crew_idx=" + crew_idx;
		if (session.getAttribute("loginId") == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			page = "member_login";
		}else {
			String addr = page;
			checkPermitCrew(addr, model, session);
			// 댓글 또는 대댓글작성.
			crew_service.commentWrite(params);
		}
		return page;
	}
	
   // 내 크루 페이지
   @RequestMapping(value = "/mycrew")
   public String myCrew(Model model, HttpSession session) {
	  page = "mycrew";
	  
	  if (session.getAttribute("loginId") == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			page = "member_login";
	  }else {
		  String addr = page;
		  checkPermitCrew(addr, model, session);
	  }
      return page;
   }
   
   
   // 내 크루 목록조회
   @GetMapping(value = "/mycrew.ajax")
   @ResponseBody 
   public List<CrewSearchListDTO> myCrewList(@RequestParam Map<String, String> params, HttpSession session){
	 //세션ID가져오기
	 String user_id = (String) session.getAttribute("loginId");
	   
      List<CrewSearchListDTO> recruitList = crew_service.mycrewList(params, user_id);
      
      return recruitList; 
   }
   
   // Comment 모달 - 댓글 수정/삭제/신고 이벤트 처리
   @PostMapping(value = "/comment_event.ajax")
   @ResponseBody
   public Map<String, Object> comment_event(@RequestBody String json_info) throws Exception {
	   // 신고페이지로 이동인지 확인하기 위함. (1인경우 신고페이지에 넘겨줄 데이터가 존재함을 의미.)
	   String report_chk = "0"; 

	   //String 을 Map 을 바꿔주기위해 라이브러리 사용.
	   ObjectMapper mapper = new ObjectMapper();
	   HashMap<String, Object> info = mapper.readValue(json_info, new TypeReference<HashMap<String, Object>>(){});
	   
	   Map<String, Object> map = new HashMap<String, Object>();
	   
	   // 수정 or 삭제 or 신고를 구분하기 위한 변수
	   String event = (String) info.get("event");
	   
	   if(event.equals("report")) {
		   // 신고페이지에 넘겨줄 데이터
		   int comment_idx = (int) info.get("comment_idx");  
		   String comment_id = (String) info.get("comment_id");
		   int board_idx = (int) info.get("board_idx");
		   int crew_idx = (int) info.get("crew_idx");
		   
		   report_chk = "1";
		   map.put("comment_idx", comment_idx); // 신고대상 댓글idx 
		   map.put("comment_id", comment_id); // 신고대상 댓글id 
		   map.put("board_type", "2"); // 댓글신고유형
		   map.put("board_idx", board_idx); // 게시글 idx
		   map.put("crew_idx", crew_idx); // 크루 idx
		   
	   }else {
		   crew_service.comment_event(info);
	   }
	   		
	   map.put("success", "성공");
	   map.put("report_chk", report_chk);
	   return map;
   }

}