package com.fitmate.crew.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.fitmate.admin.dto.RegReportDTO;
import com.fitmate.admin.dto.ReportDTO;
import com.fitmate.crew.dao.CrewPageDAO;
import com.fitmate.crew.dto.CrewBoardDTO;
import com.fitmate.crew.dto.CrewDTO;
import com.fitmate.crew.dto.CrewFileDTO;
import com.fitmate.crew.dto.CrewIdxDTO;
import com.fitmate.crew.dto.CrewMemberDTO;
import com.fitmate.crew.dto.CrewMemberProfileDTO;
import com.fitmate.member.dto.MemberDTO;

@Service
public class CrewPageService {
	Logger logger = LoggerFactory.getLogger(getClass());
    @Value("${spring.servlet.multipart.location}") String fileLocation;
	
	@Autowired CrewPageDAO crewpage_dao;
	
	public List<RegReportDTO> report_list() {
		
		return crewpage_dao.report_list();
	}
	
	@Transactional
	public int crew_notice_write(String subject, String board_id, int crew_idx) {
		
		int suc = 0;
		
		CrewBoardDTO board_dto = new CrewBoardDTO();
		CrewIdxDTO crewidx_dto = new CrewIdxDTO();
		CrewMemberDTO member_dto = new CrewMemberDTO();
		
		board_dto.setBoard_id(board_id);
		board_dto.setSubject(subject);
		// 크루 최근 활동시간 바꿔주기
		crewpage_dao.crew_lastdate_update(crew_idx);

		// 공지사항이 작성되면
		if(	crewpage_dao.crew_notice_write(board_dto)>0) {
			// 게시글(타입:공지사항)이 작성되면 board_idx를 crew_idx와 맞춰주는 작업 == 어느 크루의 게시물인지 식별하기 위해서
			int board_idx = board_dto.getBoard_idx();
			crewidx_dto.setBoard_idx(board_idx);
			crewidx_dto.setCrew_idx(crew_idx);
			// 크루idx 와 보드idx 합쳐주기
			crewpage_dao.notice_write_crewidx(crewidx_dto);
			suc = 1;	
			
			// 새로운 공지사항이 작성되면 알람 보내기
			crew_notice_noti(board_idx,crew_idx);
			
		};		
		
		return suc;
		
	}
	
	// 부모트랜잭션에 자식트랜잭션이 영향끼치지않기 트랜잭션 제외시키기?
	// 공지사항 작성시 해당 크루원들에게 알람보내기
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void crew_notice_noti(int board_idx, int crew_idx) {
		
		CrewDTO crew = new CrewDTO();
		crew.setCrew_idx(crew_idx);
		logger.info("crew_idx = "+crew_idx);
		// 크루 이름 가져오기
		
		String name = crewpage_dao.notice_noti_crewname(crew);;
		logger.info("name = "+name);
		String crewidx = Integer.toString(crew_idx);
		
		// 알람 내용
		String noti_content = name+" 크루의 새로운 공지사항 갱신";
		// url 주소 == 크루페이지 기능이 완성되면 크루페이지 주소로 보내주기
		String noti_url = "crew_page_notice.go?crew_idx="+crewidx;
		// 크루원 목록 가져오기
		List<CrewMemberDTO> member_list = crewpage_dao.crew_member_list(crew_idx);
		// notis_cate 1로 맞춰주기
		name = "2";
		// 알림 보내기
		for (CrewMemberDTO  member : member_list) {
			// 멤버 id(수신자id) 가져오기
			String member_id = member.getMember_id();
			
			// 알림 보내는 로직 멤버 한명씩 보내기
			crewpage_dao.crew_notice_noti(member_id,board_idx,noti_content,noti_url,name);
			}
		
	}
	
	// 크루의 공지사항 가져오기
	public List<CrewBoardDTO> crew_notice_list(int crew_idx) {
	
		return crewpage_dao.crew_notice_list(crew_idx);
	}
	
	@Transactional
	public void crew_notice_del(String board_idx) {
		crewpage_dao.notice_del_crewidx(board_idx);
		crewpage_dao.crew_notice_del(board_idx);
		
	}
	
	@Transactional
	public void crew_oneboard_write(String subject, String board_id, int crew_idx) {
		
		CrewBoardDTO board_dto = new CrewBoardDTO();
		CrewIdxDTO crewidx_dto = new CrewIdxDTO();
		
		board_dto.setBoard_id(board_id);
		board_dto.setSubject(subject);
		// 크루 최근 활동시간 바꿔주기
		crewpage_dao.crew_lastdate_update(crew_idx);

		
		if(	crewpage_dao.crew_oneboard_write(board_dto)>0) {
			int board_idx = board_dto.getBoard_idx();
			crewidx_dto.setBoard_idx(board_idx);
			crewidx_dto.setCrew_idx(crew_idx);
			
			// 크루idx 와 보드idx 합쳐주기 이름은 notice_write_crewidx 이지만 oneboard와 로직은 동일하다
			crewpage_dao.notice_write_crewidx(crewidx_dto);	
			
		};		
		
	}
	
	// 크루의 한줄게시글 목록가져오기
	public List<CrewBoardDTO> crew_oneboard_list(int crew_idx) {
		
		return crewpage_dao.crew_oneboard_list(crew_idx);
	}
	
	// 크루 한줄 게시글 삭제하기
	// 이름은 notice이지만 게시글 삭제 로직은 같다 
	@Transactional
	public void crew_oneboard_del(String board_idx) {
		crewpage_dao.notice_del_crewidx(board_idx);
		crewpage_dao.crew_board_del(board_idx);
		
	}
	// 게시글 블라인드
	public void crew_oneboard_blind(String board_idx) {
		crewpage_dao.crew_oneboard_blind(board_idx);
		logger.info("사진게시글 블라인드 서비스 실행");
	}
	// 게시글 블라인드 해제
	public void crew_oneboard_unblind(String board_idx) {
		crewpage_dao.crew_oneboard_unblind(board_idx);
		
	}
	
	// 사진 게시글 작성하기 c드라이브 업로드폴더에 넣기
	public void crew_photo_write(MultipartFile file, String subject, String board_id, int crew_idx) {
		
		CrewBoardDTO board_dto = new CrewBoardDTO();
		// 크루 idx 테이블에 넣을 dto = board_idx + crew_idx 합쳐주기위함 // 어떤 크루의 게시글인지 식별하기 위해서
		CrewIdxDTO crewidx_dto = new CrewIdxDTO();
		
		board_dto.setBoard_id(board_id);
		board_dto.setSubject(subject);
		// 크루 최근 활동시간 바꿔주기
		crewpage_dao.crew_lastdate_update(crew_idx);

		
		if(	crewpage_dao.crew_photo_write(board_dto)>0) {
			
			int board_idx = board_dto.getBoard_idx();
			crewidx_dto.setBoard_idx(board_idx);
			crewidx_dto.setCrew_idx(crew_idx);
			
			// 크루idx 와 보드idx 합쳐주기 이름은 notice_write_crewidx 이지만 phto_write 와 로직은 동일하다
			crewpage_dao.notice_write_crewidx(crewidx_dto);
			
			// 파일 저장하는 로직
			if (!file.isEmpty()) {
	            
				try {
					// 파일 처리 로직 (저장, DB에 저장 등)
		            String ori_filename = file.getOriginalFilename();
		            // 파일 저장하는 코드 추가
		            String ext = ori_filename.substring(ori_filename.lastIndexOf("."));				
					logger.info(ext);
					String new_filename = UUID.randomUUID()+ext;
					Path path = Paths.get(fileLocation+new_filename);
					logger.info("ori이름,new이름 = "+ori_filename+new_filename);
					
					byte[] arr = file.getBytes();
					Files.write(path,arr);
					crewpage_dao.photofile_write(board_idx,ori_filename,new_filename);
					
					
				} catch (Exception e) {
					
					e.printStackTrace();
				}	
	        }
		};		
		
		
	} // public void crew_photo_write(MultipartFile file, String content, String board_id, int crew_idx)
	
	// 사진 게시글 상세보기
	public void crew_photo_detail(String board_idx, Model model) {
		CrewBoardDTO board_dto = new CrewBoardDTO();
		CrewFileDTO file_dto = new CrewFileDTO();
		MemberDTO member_dto = new MemberDTO();
		// 사진 게시글 정보 board_dto에 담아서 가져오기
		board_dto =	crewpage_dao.crew_photo_detail(board_idx);
		// 사진 정보 가져오기
		file_dto = crewpage_dao.crew_photo(board_idx);
		// 회원 정보 가져오기
		String user_id =board_dto.getBoard_id();
		member_dto.setUser_id(user_id);
		int status = board_dto.getStatus();
		logger.info("스테이터스값 = "+status);
		// 프로필 정보 와 회원 정보 합쳐서 가져오기
		member_dto = crewpage_dao.crew_getprofile(member_dto);

		
		logger.info("멤버 프로필 정보 = "+member_dto.getProfile());
		model.addAttribute("status", status);
		model.addAttribute("file", file_dto);
		model.addAttribute("board", board_dto);
		model.addAttribute("member", member_dto);
		
	
	} // 사진게시글 상세보기 public void crew_photo_detail(String board_idx, Model model)
	
	
	// 크루 사진 게시글 삭제하기
	@Transactional
	public void crew_photo_del(String board_idx) {
		// 이름은 notice이지만 게시글 삭제 로직은 같다 == board_idx 와 엮인 crew_idx 지우기
		crewpage_dao.notice_del_crewidx(board_idx);
		// status 3 으로 변경
		crewpage_dao.crew_board_del(board_idx);
		// 추가한 코드 사진파일 db 정보 없애주기
	// 게시글 삭제시(status = 3) 사진유지	crewpage_dao.crew_photofile_del(board_idx);
			
	}

	// 게시글 댓글 신고하기
	public void crew_report_do(Map<String, String> params) {
			
			// 담을 dto 선언해주기
			ReportDTO report_dto = new ReportDTO();
			
		    // 신고자 아이디
			String reporter_id =params.get("reporter_id");
			report_dto.setReporter_id(reporter_id);
			// 신고 사유 idx
			String reportr_idx = params.get("reportr_idx");
			report_dto.setReportr_idx(Integer.parseInt(reportr_idx));
			// 보드 idx
			String board_idx = params.get("board_idx");	
			report_dto.setBoard_idx(Integer.parseInt(board_idx));
			// 게시글 타입  
			String board_type = params.get("board_type");
			report_dto.setBoard_type(Integer.parseInt(board_type));
			// 피신고자 아이디 가져오기
			String reported_id = params.get("reported_id");
			report_dto.setReported_id(reported_id);
			
			logger.info("params 리포트 서비스 값 = {} ",params);
			
			// 다음 리포트 dto로 신고 인서트 시키기 
			crewpage_dao.report_do(report_dto);
		
	}

	// 크루 메인 페이지 한줄게시글 목록 가져오기
	public List<CrewBoardDTO> crew_main_oneboard(int crew_idx) {
		
		List<CrewBoardDTO> beforelist =	crewpage_dao.crew_oneboard_list(crew_idx);
		List<CrewBoardDTO> afterlist = new ArrayList<CrewBoardDTO>();
		
		 	DateTimeFormatter timeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	        DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	        // 오늘 날짜 가져오기
	        LocalDate today = LocalDate.now();

	        // 한줄게시글에서 10개 가져오기
	        for (int i = 0; i < Math.min(10, beforelist.size()); i++) {
	        	
	        	CrewBoardDTO board = beforelist.get(i);
	        	if(board.getSubject().length()>15) {
	        		 String shortenedSubject = board.getSubject().substring(0, 15); // 20자까지만 잘라서
	        		 shortenedSubject += "...";
	        		 board.setSubject(shortenedSubject); // 잘라낸 제목 저장
	        	}
	        	
	            afterlist.add(board); // 수정된 게시글을 추가
	        }

		
		return afterlist;
	}
	
	// 크루 메인페이지 최신 공지사항 가져오기
	public CrewBoardDTO crew_main_notice(int crew_idx) {
		
		return crewpage_dao.crew_main_notice(crew_idx);
	}
	// 크루원 멤버들 정보(닉네임,프로필사진) 가져오기
	public List<CrewMemberProfileDTO> crew_main_crewmember(int crew_idx) {
		
		return crewpage_dao.crew_main_crewmember(crew_idx);
	}
	// 크루 사진 게시글 가져오기
	public List<CrewBoardDTO> crew_photo_list(String crewidx, int offset, int size) {
		
		return crewpage_dao.crew_photo_list(crewidx,offset,size);
	}
	// 크루 정보 가져오기
	public CrewDTO crew_info(String crew_idx) {
		
		return crewpage_dao.crew_info(crew_idx);
		
	}
	

	
} // public class CrewPageService 
