package com.fitmate.crew.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fitmate.crew.dao.CrewMemberDAO;
import com.fitmate.crew.dto.CrewJoinDTO;

@Service
public class CrewMemberService {
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CrewMemberDAO crewmember_dao;
	
	
	public List<CrewJoinDTO> joinList(String crew_idx_) {
		int crew_idx = Integer.parseInt(crew_idx_);
		
		// 크루 및 크루장정보
		CrewJoinDTO profileDTO = crewmember_dao.profileInfo(crew_idx); 
		// 크루 가입신청자목록
		List<CrewJoinDTO> list = crewmember_dao.joinList(crew_idx);
		
		list.add(0, profileDTO);
		
		return list; 
	}


	@Transactional
	public int joinApproval(Map<String, String> params) {
		// 현재 날짜와 시간 가져오기
        LocalDateTime date = LocalDateTime.now();
        // 원하는 포맷으로 날짜와 시간을 String으로 변환
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String formattedDate = date.format(formatter);
		 
        // map에 date 추가.
        params.put("date", formattedDate);
        
        logger.info("params Test : " + params);
        
        int status = Integer.parseInt(params.get("status"));
		
        // 신청 수락/거절인경우 공통수행. => 신청자목록 상태바꾸기.
		int row = crewmember_dao.joinApproval(params);
		 // 신청수락인 경우 크루원 목록테이블에도 저장. 
		if(row > 0 && status == 3) { 
			row = crewmember_dao.crewMember(params); 
		}
		 
        
        logger.info("params Test : " + params);
        
        return row;
		
	}
	
}
