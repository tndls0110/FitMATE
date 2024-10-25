package com.fitmate.crew.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fitmate.admin.dto.RegReportDTO;
import com.fitmate.admin.dto.ReportDTO;
import com.fitmate.crew.dto.CrewBoardDTO;
import com.fitmate.crew.dto.CrewSearchListDTO;
import com.fitmate.crew.service.CrewPageService;

@Controller
public class CrewPageController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CrewPageService crewpage_service;
	
	/*
	// 신고 페이지 이동
	@RequestMapping(value="/crew_report.go")
	public String crew_report(@RequestParam Map<String,String> params, Model model) {
		
		params.get("board_idx");
		
		return "crew_report";
	}
	*/
	
	// 신고 페이지 이동 test code
	@RequestMapping(value="/crew_report.go")
	public String crew_report(Map<String,String> param,Model model) {
		
		// 보드idx가 있다면
		if(param.get("board_idx")!=null) {
			// 신고 board_type 은 게시물
			model.addAttribute("board_type", "1");
		}
		else {
			// 신고 board_type 은 댓글 // 댓글만 신고가능 대댓글신고 불가능
			model.addAttribute("board_type", "2");
		}
		
		return "crew_report";
	}
	
	// 신고사유 리스트 불러오는 ajax
	@GetMapping(value="/crew_report.ajax")
	@ResponseBody
	public List<RegReportDTO> report_list(){
	
		List<RegReportDTO> report = crewpage_service.report_list();
		logger.info("reportlist = {}",report);
		
		
		return report;
	}
	// 신고하기
	@RequestMapping(value="/crew_report.do")
	public String crew_report_do() {
				
		return "index";
	}
	
	/*
	// 공지사항 페이지로 이동하기
	@RequestMapping(value="/crew_page_notice.go")
	public String crew_page_notice(String board_idx,HttpSession session, Model model) {
	
	//	logger.info("공지사항페이지 이동 {}", params);
	//	model.addAttribute("crew_idx", "6");
		
		// crew_id 를 받아서 크루장 확인 여부
		String sessionId = (String) session.getAttribute("sessionId");
		String crewleader = params.get("crew_id");
		boolean isCrewLeader = false;
	
		if(crewleader.equals(sessionId)) {
			isCrewLeader = true;
		}
		
		// 크루장이면 isCrewLeader값에 ture로 넣고 전달
		// 받는 페이지에서 isCrewLeader값이 ture면 크루장 >> 크루장 권한 구분
		model.addAttribute("isCrewLeader", isCrewLeader);
		
		return "crew_page_notice";
	}
	*/
	
	// 공지사항 페이지로 이동하기 test code
		@RequestMapping(value="/crew_page_notice.go")
		public String crew_page_notice() {
		
		
			
			return "crew_page_notice";
		}
	
	
	// 공지사항 작성하기
	@RequestMapping(value="/crew_page_notice.do",method =RequestMethod.POST)
	public String crew_notice_write(@RequestParam String content,@RequestParam String board_id,@RequestParam int crew_idx) {
		// subject = 공지사항 내용이자 제목, board_id = 작성자, crew_idx = 크루 식별위한 변수 + board_idx 와 crew_idx 합쳐줄때(식별하기위해) 필요
		
		logger.info("입력값 {} ",content);
		
		crewpage_service.crew_notice_write(content,board_id,crew_idx);
		
		return "redirect:/crew_page_notice.go";
	}
	
	// 공지사항목록 불러오기
	@GetMapping(value = "/crew_page_notice.ajax")
	@ResponseBody 
	public List<CrewBoardDTO> crew_notice_list(@RequestParam Map<String,String> params,HttpSession session){
		
		logger.info("params : " + params);
		String crewidx = params.get("crew_idx");
		
		int crew_idx = Integer.parseInt(crewidx);
		List<CrewBoardDTO> notcelist = crewpage_service.crew_notice_list(crew_idx);
		

		logger.info("notcelist : "+notcelist);
		return notcelist; 
	}	
	
	@GetMapping(value="/crew_notice_del")
	public String crew_notice_del(@RequestParam String board_idx) {
		
		logger.info("보드번호는 ? " + board_idx);
		
		crewpage_service.crew_notice_del(board_idx);
		
		return "redirect:/crew_page_notice.go";
	}
	
	/*
		// 한줄 게시글 페이지로 이동하기
		@RequestMapping(value="/crew_oneboard.go")
		public String crew_oneboard(@RequestParam String crew_idx,@RequestParam String crew_id,HttpSession session,Model model) {
			
			// String crew_idx 크루 idx 전달받기
			// String crew_id 크루장 id 전달받기
			model.addAttribute("crew_id", crew_id); // 전달받은 크루id 다음 페이지에 넘겨주기
			model.addAttribute("crew_idx", crew_idx); // 전달받은 크루idx 다음 페이지에 넘겨주기
			
			// crew_id 를 받아서 크루장 확인 여부
			String sessionId = (String) session.getAttribute("sessionId");
			String crewleader = crew_id;
			boolean isCrewLeader = false;
		
			if(crewleader.equals(sessionId)) {
				isCrewLeader = true;
			}
			
			// 크루장이면 isCrewLeader값에 ture로 넣고 전달
			// 받는 페이지에서 isCrewLeader값이 ture면 크루장 >> 크루장 권한 구분
			model.addAttribute("isCrewLeader", isCrewLeader);
			
			return "crew_oneboard";
		}
		*/
		
		// 한줄 게시글 페이지로 이동하기 test code
			@RequestMapping(value="/crew_oneboard.go")
			public String crew_oneboard() {
			
				return "crew_oneboard";
			}
	
		
		// 한줄 게시글 작성하기
		@RequestMapping(value="/crew_oneboard.do",method =RequestMethod.POST)
		public String crew_oneboard_write(@RequestParam String content,@RequestParam String board_id,@RequestParam int crew_idx) {
			// subject = 공지사항 내용이자 제목, board_id = 작성자, crew_idx = 크루 식별위한 변수 + board_idx 와 crew_idx 합쳐줄때(식별하기위해) 필요
			
			logger.info("입력값 {} ",content);
			
			crewpage_service.crew_oneboard_write(content,board_id,crew_idx);
			
			return "redirect:/crew_oneboard.go";
		}
		
		// 한줄 게시글 리스트 가져오기
		@GetMapping(value = "/crew_oneboard.ajax")
		@ResponseBody 
		public List<CrewBoardDTO> crew_oneboard_list(@RequestParam Map<String,String> params,HttpSession session,Model model){
			
			logger.info("params : " + params);
			String crewidx = params.get("crew_idx");
			
			// 문자열인 크루idx를 int로 형변환
			int crew_idx = Integer.parseInt(crewidx);
			List<CrewBoardDTO> oneboardlist = crewpage_service.crew_oneboard_list(crew_idx);
			// 닉네임가져오려면 List<CrewBoardDTO> 크기만큼 for문을 실행하고 CrewBoardDTO에서 board_id를 꺼내고 그 값을 회원 테이블에서 닉네임 가져오고 board_id와 닉네임을 바꾼다
			
			//크루장 확인  크루idx로 크루id 가져와서 조회하기
			String master = params.get("board_id"); // 나중에 고칠 코드
			
			// session.setAttribute("sessionId","member01"); // 세션아이디에 임시로 보드id 집어넣음 로그인기능 업데이트시 나중에 없애줄 코드?
			
			
			logger.info("oneboardlist : "+oneboardlist);
			return oneboardlist; 
		}	
		
		// 한줄게시글 삭제
		@GetMapping(value="/crew_oneboard_del")
		public String crew_oneboard_del(@RequestParam String board_idx) {
			
			// logger.info("oneboard 보드번호는 ? " + board_idx);
			
			crewpage_service.crew_oneboard_del(board_idx);
			
			return "redirect:/crew_oneboard.go";
		}
		
		// 한줄게시글 블라인드
		@GetMapping(value="/crew_oneboard_blind")
		public String crew_oneboard_blind(@RequestParam String board_idx) {
			
			// logger.info("oneboard 보드번호는 ? " + board_idx);
			
			crewpage_service.crew_oneboard_blind(board_idx);
			
			return "redirect:/crew_oneboard.go";
		}
		
		// 한줄게시글 블라인드 해제
		@GetMapping(value="/crew_oneboard_unblind")
		public String crew_oneboard_unblind(@RequestParam String board_idx) {
			
			// logger.info("oneboard 보드번호는 ? " + board_idx);
			
			crewpage_service.crew_oneboard_unblind(board_idx);
			
			return "redirect:/crew_oneboard.go";
		}
		
		
		// 사진 게시글 작성 페이지로 이동하기
		@RequestMapping(value="/crew_photo_write.go")
		public String crew_photo() {
					
			return "crew_photo_write";
		}

		
		// 사진 게시글 작성하기
		@RequestMapping(value="/crew_photo_write.do",method =RequestMethod.POST)
		public String crew_photo_write(MultipartFile file,@RequestParam String content,@RequestParam String board_id,@RequestParam int crew_idx) {
				
			logger.info("입력값 {} ",content);
			
			crewpage_service.crew_photo_write(file,content,board_id,crew_idx);
						
			return "index";
			
		}
		
		// 사진 게시글 상세보기
		@RequestMapping(value="/crew_photo_detail.go")
		public String crew_photo_detail(String board_idx,Model model) {
				
			crewpage_service.crew_photo_detail(board_idx, model);

			return "crew_photo_detail";
			
		}
		
		// 사진게시글 삭제
				@GetMapping(value="/crew_photo_del")
				public String crew_photo_del(@RequestParam String board_idx) {
					
					// logger.info("oneboard 보드번호는 ? " + board_idx);
					
					crewpage_service.crew_photo_del(board_idx);
					
					return "index";
				}
		
		
}
