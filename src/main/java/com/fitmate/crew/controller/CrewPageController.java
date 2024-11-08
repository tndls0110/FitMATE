package com.fitmate.crew.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fitmate.admin.dto.RegCountyDTO;
import com.fitmate.admin.dto.RegReportDTO;
import com.fitmate.crew.dto.CrewBoardDTO;
import com.fitmate.crew.dto.CrewDTO;
import com.fitmate.crew.dto.CrewMemberProfileDTO;
import com.fitmate.crew.service.CrewPageService;
import com.fitmate.member.service.MemberService;

@Controller
public class CrewPageController {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CrewPageService crewpage_service;
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
	

	// 신고 페이지 이동 
	@RequestMapping(value="/crew_report.go")
	public String crew_report(@RequestParam Map<String,String> params,Model model,HttpSession session) {
		
		page = "crew_report";
		
		
		if (session.getAttribute("loginId") == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			page = "member_login";
		}else {
			String url = "";
			logger.info("신고 페이지 이동 params = {}",params);
			/*
			// 보드 idx가 있으면 >> 신고글이 게시글이면
			if(params.get("board_idx")!=null) {
				model.addAttribute("board_type", 1);
				model.addAttribute("board_idx", params.get("board_idx"));
				model.addAttribute("reported_id", params.get("board_id"));
				
			}
			else { // 신고글이 게시글이 아니라면
				model.addAttribute("board_type", 2);
				model.addAttribute("board_idx", params.get("comment_idx"));
				model.addAttribute("reported_id", params.get("comment_id"));
			}
			 */
			
			// 신고글이 댓글이면
			if(params.get("comment_idx")!=null) {
				String boardidx = params.get("board_idx");
				String crew_idx = params.get("crew_idx");
				url = "redirect:/crew_recruit_detail.go?board_idx="+boardidx+"&crew_idx="+crew_idx;
				model.addAttribute("board_type", 2);
				model.addAttribute("board_idx", params.get("comment_idx"));
				model.addAttribute("reported_id", params.get("comment_id"));
				model.addAttribute("url", url);
						
			}
			else { // 신고글이 게시글이면
				String crewidx = params.get("crew_idx");
				url = "redirect:/crew_main_page.go?crew_idx="+crewidx;
				model.addAttribute("board_type", 1);
				model.addAttribute("board_idx", params.get("board_idx"));
				model.addAttribute("reported_id", params.get("board_id"));
				model.addAttribute("url", url);
				
			}
			
			String addr = page;
			checkPermitCrew(addr, model, session);
		}
		
		return page;
	}
	
	// 신고사유 리스트 불러오는 ajax
	@GetMapping(value="/crew_report.ajax")
	@ResponseBody
	public List<RegReportDTO> report_list(){
	
		List<RegReportDTO> report = crewpage_service.report_list();
		logger.info("reportlist = {}",report);
		
		
		return report;
	}
	
	// 신고하기 board_type 가져오는거 확인하기 == 게시글인경우 board_type=1, 댓글인경우 board_type=2
	@RequestMapping(value="/crew_report.do",method =RequestMethod.POST)
	public String crew_report_do(@RequestParam Map<String,String> params,HttpSession session,Model model) {
		
			logger.info("params = {}", params);
		 String reportrIdxStr = params.get("reportr_idx");
		 String url = params.get("url");
		
		 logger.info("신고후 url 주소 ="+url);
		 logger.info("Received reportr_idx = {}", reportrIdxStr);
	
		crewpage_service.crew_report_do(params);
		// index123 url로 바꿔주기
	
		return url;
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
	
	// 공지사항 페이지로 이동하기 
		@RequestMapping(value="/crew_page_notice.go")
		public String crew_page_notice(@RequestParam Map<String,String> params,HttpSession session, Model model) {
			page = "crew_page_notice";
			
			
			if (session.getAttribute("loginId") == null) {
				model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
				page = "member_login";
			}else {
				String crew_idx = params.get("crew_idx");
				String crew_id = params.get("crew_id");
			//	model.addAttribute("crew_idx", crew_idx);
			//	model.addAttribute("crew_id", crew_id);
				CrewDTO crewdto = new CrewDTO();
				crewdto = crewpage_service.crew_info(crew_idx);
				
					String crewid =	crewdto.getCrew_id();
					String crewname =	crewdto.getName();
					int crewidx = crewdto.getCrew_idx();
					
				model.addAttribute("crew_idx", crewidx);
				model.addAttribute("crew_id", crewid);
				model.addAttribute("crewname", crewname);
				
				String addr = page;
				checkPermitCrew(addr, model, session);
			}
	
			
			return page;
		}
	
	
	// 공지사항 작성하기
	@RequestMapping(value="/crew_page_notice.do",method =RequestMethod.POST)
	public String crew_notice_write(@RequestParam String subject,@RequestParam String board_id,@RequestParam int crew_idx,Model model) {
		// subject = 공지사항 내용이자 제목, board_id = 작성자, crew_idx = 크루 식별위한 변수 + board_idx 와 crew_idx 합쳐줄때(식별하기위해) 필요
		
		logger.info("입력값 {} ",subject);
		
		crewpage_service.crew_notice_write(subject,board_id,crew_idx);
		String page = "redirect:/crew_page_notice.go?crew_idx="+crew_idx+"&crew_id="+board_id;
		
		
		return page;
	}
	
	// 공지사항목록 불러오기
	@GetMapping(value = "/crew_page_notice.ajax")
	@ResponseBody
	public List<CrewBoardDTO> crew_notice_list(@RequestParam Map<String,String> params,HttpSession session){
		
		logger.info("params : " + params);
		String crewidx = params.get("crew_idx");
		logger.info(crewidx);
		int crew_idx = Integer.parseInt(crewidx);
		List<CrewBoardDTO> notcelist = crewpage_service.crew_notice_list(crew_idx);
		

		logger.info("notcelist : "+notcelist);
		return notcelist; 
	}	
	
	@GetMapping(value="/crew_notice_del")
	public String crew_notice_del(@RequestParam String board_idx,String crew_idx) {
		
		logger.info("보드번호는 ? " + board_idx);
		String page = "redirect:/crew_page_notice.go?crew_idx="+crew_idx;
		crewpage_service.crew_notice_del(board_idx);
		
		return page;
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
		
		// 한줄 게시글 페이지로 이동하기 
			@RequestMapping(value="/crew_oneboard.go")
			public String crew_oneboard(@RequestParam Map<String,String> params,HttpSession session,Model model) {
				
				page = "crew_oneboard";
			      
			      
			      if (session.getAttribute("loginId") == null) {
			         model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			         page = "member_login";
			      }else {
			         String addr = page;
			         List<RegCountyDTO> list = member_service.getRegion();
			         model.addAttribute("region", list);
			         list = member_service.getRegion2("1");
			         model.addAttribute("region2", list);
			         checkPermitCrew(addr, model, session);
			      }
				
				String crew_idx = params.get("crew_idx");
				String crew_id = params.get("crew_id");
				
				CrewDTO crewdto = new CrewDTO();
				crewdto = crewpage_service.crew_info(crew_idx);
				
					String crewid =	crewdto.getCrew_id();
					String crewname =crewdto.getName();
					int crewidx = crewdto.getCrew_idx();
					
				model.addAttribute("crew_idx", crewidx);
				model.addAttribute("crew_id", crewid);
				model.addAttribute("crewname", crewname);
				
				
			//	model.addAttribute("crew_idx", crew_idx); // 전달받은 크루idx 다음 페이지에 넘겨주기
			//	model.addAttribute("crew_id", crew_id); // 전달받은 크루id 다음 페이지에 넘겨주기
				
				return page;
			}
	
		
		// 한줄 게시글 작성하기
		@RequestMapping(value="/crew_oneboard.do",method =RequestMethod.POST)
		public String crew_oneboard_write(@RequestParam String subject,@RequestParam String board_id,@RequestParam int crew_idx) {
			// subject = 공지사항 내용이자 제목, board_id = 작성자, crew_idx = 크루 식별위한 변수 + board_idx 와 crew_idx 합쳐줄때(식별하기위해) 필요
			
			logger.info("입력값 {} ",subject);
			
			crewpage_service.crew_oneboard_write(subject,board_id,crew_idx);
			String page = "redirect:/crew_oneboard.go?crew_idx="+crew_idx;
			
			
			return page;
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
		public String crew_oneboard_del(@RequestParam String board_idx, String crew_idx) {
			
			// logger.info("oneboard 보드번호는 ? " + board_idx);
			
			crewpage_service.crew_oneboard_del(board_idx);
			String page = "redirect:/crew_oneboard.go?crew_idx="+crew_idx;
			
			return page;
		}
		
		// 한줄게시글 블라인드
		@GetMapping(value="/crew_oneboard_blind")
		public String crew_oneboard_blind(@RequestParam String board_idx,String crew_idx) {
			
			 logger.info("한줄게시글 블라인드 ? " + board_idx);
			 logger.info("한줄게시글 블라인드  " + crew_idx);
			
			crewpage_service.crew_oneboard_blind(board_idx);
			String page = "redirect:/crew_oneboard.go?crew_idx="+crew_idx;
			
			return page;
		}
		
		// 한줄게시글 블라인드 해제
		@GetMapping(value="/crew_oneboard_unblind")
		public String crew_oneboard_unblind(@RequestParam String board_idx,String crew_idx) {
			
			 logger.info("한줄게시글 블라인드 해제 ? " + board_idx);
			 logger.info("한줄게시글 블라인드 해제  " + crew_idx);
			crewpage_service.crew_oneboard_unblind(board_idx);
			String page = "redirect:/crew_oneboard.go?crew_idx="+crew_idx;
			
			return page;
		}
		
		
		
		
		// 사진 게시글 작성 페이지로 이동하기
		@RequestMapping(value="/crew_photo_write.go")
		public String crew_photo(@RequestParam Map<String,String> params,Model model,HttpSession session) {
			
			page = "crew_photo_write";
		      
		      
		      if (session.getAttribute("loginId") == null) {
		         model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
		         page = "member_login";
		      }else {
		         String addr = page;
		         List<RegCountyDTO> list = member_service.getRegion();
		         model.addAttribute("region", list);
		         list = member_service.getRegion2("1");
		         model.addAttribute("region2", list);
		         checkPermitCrew(addr, model, session);
		      }
			
			
			String crew_idx = params.get("crew_idx");
			CrewDTO crewdto = new CrewDTO();
			crewdto = crewpage_service.crew_info(crew_idx);
			String crew_name =	crewdto.getName();
			String crew_id = crewdto.getCrew_id();
			model.addAttribute("crew_idx", crew_idx);
			model.addAttribute("crew_id", crew_id);
			model.addAttribute("crewname", crew_name);
			
			return page;
		}

		
		// 사진 게시글 작성하기
		@RequestMapping(value="/crew_photo_write.do",method =RequestMethod.POST)
		public String crew_photo_write(MultipartFile file,@RequestParam String subject,@RequestParam String board_id,@RequestParam int crew_idx) {
				
			logger.info("입력값 {} ",subject);
			
			crewpage_service.crew_photo_write(file,subject,board_id,crew_idx);
			String page = "redirect:/crew_main_page.go?crew_idx="+crew_idx;
			
			return page;
			
		}
		
		// 사진 게시글 상세보기
		@RequestMapping(value="/crew_photo_detail.go")
		public String crew_photo_detail(String board_idx,String crew_id,String crew_idx,Model model,HttpSession session) {
			
			page = "crew_photo_detail";
		      
		      
		      if (session.getAttribute("loginId") == null) {
		         model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
		         page = "member_login";
		      }else {
		    	  
		    	  CrewDTO crewdto = new CrewDTO();
					crewdto = crewpage_service.crew_info(crew_idx);
				String crewname =	crewdto.getName();
		    	  crewpage_service.crew_photo_detail(board_idx, model);
					
					model.addAttribute("board_idx",board_idx);
					model.addAttribute("crew_id",crew_id);
					model.addAttribute("crew_idx",crew_idx);
					model.addAttribute("crewname",crewname);
					
		         String addr = page;
		         checkPermitCrew(addr, model, session);
		      }

			
			return page;
			
		}
		
		// 사진게시글 삭제
		@GetMapping(value="/crew_photo_del")
		public String crew_photo_del(@RequestParam String board_idx,String crew_idx) {
					
			// logger.info("oneboard 보드번호는 ? " + board_idx);
			String page = 	"redirect:/crew_main_page.go?crew_idx="+crew_idx;	
			crewpage_service.crew_photo_del(board_idx);
					
			return page;
		}
		
		
		// 사진게시글 블라인드
		@GetMapping(value="/crew_photo_blind")
		public String crew_photo_blind(@RequestParam String board_idx,String crew_idx) {
					
				 logger.info("사진게시글 블라인드 컨트로러 실행");
				logger.info(board_idx);	
				crewpage_service.crew_oneboard_blind(board_idx);
					
				String page = 	"redirect:/crew_main_page.go?crew_idx="+crew_idx;	
				
				return page;
			}
				
		// 사진게시글 블라인드 해제
		@GetMapping(value="/crew_photo_unblind")
		public String crew_photo_unblind(@RequestParam String board_idx,String crew_idx) {
					
				logger.info("사진게시글 블라인드 해제 컨트로러 실행");
				logger.info(board_idx);	
				crewpage_service.crew_oneboard_unblind(board_idx);
				
				String page = "redirect:/crew_main_page.go?crew_idx="+crew_idx;	
				
				return page;
			}
		
		
		// 크루 메인페이지(대시보드) 가기
		@GetMapping(value="/crew_main_page.go")
		public String crew_main_page(@RequestParam String crew_idx,Model model,HttpSession session) {
			
			page = "crew_main_page";
		      
		      
		      if (session.getAttribute("loginId") == null) {
		         model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
		         page = "member_login";
		      }else {
		    	  

					logger.info("크루 대시보드 실행");
					logger.info("crew idx = "+crew_idx);
					
					model.addAttribute("crew_idx", crew_idx);
					// 크루 정보 가져오기
					CrewDTO crew = crewpage_service.crew_info(crew_idx);
					String crew_id = crew.getCrew_id();
					logger.info("crew main page crew_id = "+crew_id);
					model.addAttribute("crew_id", crew_id);
					String name = crew.getName();
					model.addAttribute("name", name);
					logger.info("crew main page crew_name = "+name);
		    	  
		         String addr = page;
		         checkPermitCrew(addr, model, session);
		      }
	
			return page;
		}
		
		// 크루 메인페이지 한줄게시글 목록 가져오기
		@GetMapping(value = "/crew_main_oneboard.ajax")
		@ResponseBody 
		public List<CrewBoardDTO> crew_main_oneboard(@RequestParam Map<String,String> params,HttpSession session,Model model){
			
			logger.info("params : " + params);
			String crewidx = params.get("crew_idx");			
			// 문자열인 크루idx를 int로 형변환
			int crew_idx = Integer.parseInt(crewidx);			
			List<CrewBoardDTO> oneboardlist = crewpage_service.crew_main_oneboard(crew_idx);			
	
			logger.info("oneboardlist : "+oneboardlist);
			return oneboardlist; 
		}	
		
		// 크루 메인페이지 최신 공지사항 가져오기
				@GetMapping(value = "/crew_main_notice.ajax")
				@ResponseBody 
				public CrewBoardDTO crew_main_notice(@RequestParam Map<String,String> params,HttpSession session,Model model){
					
					logger.info("params : " + params);
					String crewidx = params.get("crew_idx");			
					// 문자열인 크루idx를 int로 형변환
					int crew_idx = Integer.parseInt(crewidx);			
					CrewBoardDTO oneboardlist = crewpage_service.crew_main_notice(crew_idx);			
			
					logger.info("oneboardlist : "+oneboardlist);
					
					return oneboardlist; 
				}	
		
				
		// 크루 메인페이지 크루원 목록 가져오기
		@GetMapping(value = "/crew_main_crewmember.ajax")
		@ResponseBody 
		public List<CrewMemberProfileDTO> crew_main_crewmember(@RequestParam Map<String,String> params,HttpSession session,Model model){
					
			logger.info("params : " + params);
			String crewidx = params.get("crew_idx");			
			// 문자열인 크루idx를 int로 형변환
			int crew_idx = Integer.parseInt(crewidx);			
			List<CrewMemberProfileDTO> oneboardlist = crewpage_service.crew_main_crewmember(crew_idx);			
			// 크루원 목록 열개 가져오기
			List<CrewMemberProfileDTO> limitedMembers = new ArrayList<>();
			
			for (int i = 0; i < Math.min(10, oneboardlist.size()); i++) {
		        limitedMembers.add(oneboardlist.get(i));
		    }
			
			logger.info("oneboardlist : "+limitedMembers);
			return limitedMembers; 
		}			
		
		
		// 크루 메인페이지 사진게시글 목록 가져오기
		@GetMapping(value = "/crew_photo_list.ajax")
		@ResponseBody 
		public List<CrewBoardDTO> crew_photo_list(@RequestParam Map<String,String> params,HttpSession session,Model model){
					
			logger.info("params : " + params);
			String crewidx = params.get("crew_idx");			
			// 문자열인 크루idx를 int로 형변환
			String page_ =  params.get("page");
			String size_ =  params.get("size");
			int page = Integer.parseInt(page_);
			int size = Integer.parseInt(size_);
			int offset = size * (page - 1);
			
			List<CrewBoardDTO> photolist = 	crewpage_service.crew_photo_list(crewidx,offset,size);
		
			logger.info("photolist : "+photolist);
			return photolist; 
		}	
		
		
		//  카카오 api test code
		@GetMapping(value="/kakao")
		public String kakao() {
			return "kakao_map";
		}
}
