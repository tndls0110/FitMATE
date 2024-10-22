package com.fitmate.crew.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.fitmate.crew.dao.CrewDAO;
import com.fitmate.crew.dto.CrewBoardDTO;
import com.fitmate.crew.dto.CrewDTO;
import com.fitmate.crew.dto.CrewIdxDTO;
import com.fitmate.crew.dto.CrewMemberDTO;

@Service
public class CrewService {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CrewDAO crew_dao;
	
	
	
	public void crew_create(String crew_id, String name, int regions_idx, String content) {
		
		int suc = 0;
		// 크루idx와 모집게시글idx 동시성 맞춰주기 = dto로 변환 시켜 idx 받기
		
		CrewBoardDTO board_dto = new CrewBoardDTO();
		CrewDTO crew_dto = new CrewDTO();
		CrewIdxDTO crewidx_dto = new CrewIdxDTO();
		CrewMemberDTO crewmember_dto = new CrewMemberDTO();
		
		crew_dto.setCrew_id(crew_id);
		crew_dto.setName(name);
		crew_dto.setRegions_idx(regions_idx);
		
		board_dto.setBoard_id(crew_id);
		board_dto.setContent(content);
		
		// 크루 생성 (크루 idx 생성) 
		if(crew_dao.crew_create(crew_dto)>0 && crew_dao.crew_post_create(board_dto)>0) {
			
			int crew_idx = crew_dto.getCrew_idx();
			int board_idx = board_dto.getBoard_idx();
			// 크루원 목록에 크루장 넣기
			crewmember_dto.setMember_id(crew_id);
			crewmember_dto.setCrew_idx(crew_idx);
			if(crew_dao.crew_idx(board_idx,crew_idx)>0) {
				suc = 1;
				crew_dao.crew_leaderjoin(crewmember_dto);
			};
			
		};
				
		// 크루 생성 확인
	//	logger.info("크루생성 성공 : ",suc);
	
		
	}


	// 크루 모집글 수정하기 - 크루 지역정보 수정하기
	public void crew_create_rewrite(int regions_idx, String content, int board_idx) {
		crew_dao.crew_create_rewrite(content,board_idx);
		crew_dao.crew_create_rewrite_region(regions_idx,board_idx);
		
	}



	

}
