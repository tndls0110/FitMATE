package com.fitmate.crew.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fitmate.crew.dao.CrewDAO;
import com.fitmate.crew.dao.CrewMemberDAO;
import com.fitmate.crew.dto.CrewJoinDTO;
import com.fitmate.crew.dto.CrewMemberProfileDTO;

@Service
public class CrewMemberService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CrewMemberDAO crewmember_dao;
	@Autowired CrewDAO crew_dao;
	
	public List<CrewJoinDTO> joinList(String crew_idx_, Boolean order, String searchFilter_, String searchKeyword) {
		
		int crew_idx = Integer.parseInt(crew_idx_);
		
		// 파라미터들을 담아서 전달할 Map 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(searchFilter_ != null && searchKeyword != null) {
			int searchFilter = Integer.parseInt(searchFilter_);
			map.put("searchFilter", searchFilter);
			map.put("searchKeyword", searchKeyword);
		}
		map.put("crew_idx", crew_idx);
		
		// 정렬 초기값
		String orderBy = "";
		
		// 정렬값이 있는경우
		if(order != null) {
			// true: ASC, false: DESC
			if(order) {
				orderBy = "ASC"; 
			}else {
				orderBy = "DESC";
			}
			map.put("orderBy", orderBy);
		}
		
		// 크루 및 크루장정보 (크루장정보는 join테이블에 존재하지 않기때문에 따로 불러오기)
		CrewJoinDTO profileDTO = crewmember_dao.profileInfo(map); 
		// 크루 가입신청자목록
		List<CrewJoinDTO> list = crewmember_dao.joinList(map);
		
		list.add(0, profileDTO);
		
		return list; 
	}


	@Transactional
	public int joinApproval(Map<String, String> params) {
        
        int status = Integer.parseInt(params.get("status"));
        
        // 신청 수락/거절인경우 공통수행. => 신청자목록 상태바꾸기.
		int row = crewmember_dao.joinApproval(params);
		 // 신청수락인 경우 크루원 목록테이블에도 저장. 
		if(row > 0 && status == 3) { 
			row = crewmember_dao.crewMember(params); 
		}
		
		
		// 최종적으로 모든 신청 수락/거절이 정상적으로 처리되었을시 => 크루원에게 알림전송
		if(row > 0) {
			// 크루 idx
			String crew_idx = params.get("crew_idx");
			
			// 크루명 받아오기 
			String name = params.get("crew_name");
			logger.info("crew_name 체킹: " + name);
			logger.info("crew_name 파람체킹: " + params.get("crew_name"));
			
			// 입단 신청자ID(수신자ID)
			String notir_id = params.get("join_id");
			
			// 알람내용
			String noti_content = "";
			
			// url 주소
			String noti_url = "";
			
			// status 2: 거절, 3: 수락
			if(status == 2) {
				noti_content = "'" +name+ "' 크루 입단이 거절되었습니다.";
				
				// url 주소 미존재
				noti_url = "none";
			}else if(status == 3){
				noti_content = "'" +name+ "' 크루 입단이 승인되었습니다.";
				
				// url 주소는 크루페이지
				noti_url = "crew_main_page.go?crew_idx=" + crew_idx;
			}
			
			// 알림 보내기
			row = crew_dao.crew_alarmSend(notir_id, noti_content, noti_url);
			
		}
        
        return row;
	}


	// 크루 멤버 프로필 상세보기
	public CrewMemberProfileDTO memberDetail(String member_id, String idx) {
		
		String crew_idx = idx;
		logger.info("idx idx2 : ", crew_idx);
		logger.info("idx idx2 : ", idx);
		logger.info("profileY : ", idx);
		
		return crewmember_dao.crewMemberDetail(member_id, crew_idx);
		
	}
	
	// 일반 회원 프로필 상세보기
	public CrewMemberProfileDTO memberDetail(String member_id) {
		
		return crewmember_dao.userMemberDetail(member_id);
	}
	
	

	// 크루멤버 추방
	public int memberFire(String member_idx_, String member_nick, String crew_name, String member_id) {
		// 현재 날짜와 시간 가져오기
        LocalDateTime localDate = LocalDateTime.now();
        // 원하는 포맷으로 날짜와 시간을 String으로 변환
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String date = localDate.format(formatter);
		
		
		int member_idx = Integer.parseInt(member_idx_);
		
		int row = crewmember_dao.memberFire(member_idx, date);
		
		// 크루멤버 추방에 성공하였다면 => 크루원에게 알림전송
		if(row > 0) {
			// 알림 수신자ID
			String notir_id = member_id;
			
			// 알람내용
			String noti_content = "'" +member_nick+ "'님은 '" +crew_name+ "' 크루에서 추방되었습니다.";
			
			// url 주소 미존재
			String noti_url = "none";
			
			// 알림 보내기
			row = crew_dao.crew_alarmSend(notir_id, noti_content, noti_url);
		}
		
		
		return row;
	}
	
	// 크루장 위임
	@Transactional
	public int leaderChange(String crew_idx_, String member_id, String member_nick, String crew_name) {
		
		int crew_idx = Integer.parseInt(crew_idx_);
		
		// 1. 크루테이블의 크루장 정보를 새로운 크루장정보로 변경
		int row = crewmember_dao.updtLeader(crew_idx, member_id);
		
		// 2. 크루 모집게시글의 작성자를 바뀐 크루장정보로 변경
		if(row > 0) {
			// 모집게시글 board_idx 가져오기
			int board_idx = crewmember_dao.selectBoard(crew_idx);
			
			row = crewmember_dao.updtRecruit(board_idx, member_id);
		}
		
		// 크루장 위임에 성공하였다면 => 새로운 크루장에게 알림전송
		if(row > 0) {
			// 알림 수신자ID
			String notir_id = member_id;
			
			// 알람내용
			String noti_content = "'" +member_nick+ "'님에게 '" +crew_name+ "' 크루의 크루장이 위임되었습니다.";
			
			// url 크루페이지
			String noti_url = "crew_main_page.go?crew_idx=" + crew_idx;
			
			// 알림 보내기
			row = crew_dao.crew_alarmSend(notir_id, noti_content, noti_url);
		}
		
		return row;
	}

	
	// 크루원 목록 가져오기
	public List<CrewMemberProfileDTO> memberList(String crew_idx_, Boolean order, String searchFilter_, String searchKeyword){
		
		int crew_idx = Integer.parseInt(crew_idx_);
		
		
		
		// 파라미터들을 담아서 전달할 Map 생성
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(searchFilter_ != null && searchKeyword != null) {
			int searchFilter = Integer.parseInt(searchFilter_);
			map.put("searchFilter", searchFilter);
			map.put("searchKeyword", searchKeyword);
		}
		map.put("crew_idx", crew_idx);
		
		// 정렬 초기값
		String orderBy = "";
		
		// 정렬값이 있는경우
		if(order != null) {
			// true: ASC, false: DESC
			if(order) {
				orderBy = "ASC"; 
			}else {
				orderBy = "DESC";
			}
			map.put("orderBy", orderBy);
		}
		
		
		// 크루원 목록
		List<CrewMemberProfileDTO> list = crewmember_dao.memberList(map);
		
		
		return list; 
	}
	

	
}
