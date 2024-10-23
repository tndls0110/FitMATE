package com.fitmate.crew.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.fitmate.admin.dto.ReportDTO;
import com.fitmate.crew.dao.CrewPageDAO;
import com.fitmate.crew.dto.CrewBoardDTO;
import com.fitmate.crew.dto.CrewDTO;
import com.fitmate.crew.dto.CrewIdxDTO;
import com.fitmate.crew.dto.CrewMemberDTO;

@Service
public class CrewPageService {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CrewPageDAO crewpage_dao;
	
	public List<ReportDTO> report_list() {
		
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

		
		if(	crewpage_dao.crew_notice_write(board_dto)>0) {
			int board_idx = board_dto.getBoard_idx();
			crewidx_dto.setBoard_idx(board_idx);
			crewidx_dto.setCrew_idx(crew_idx);
			// 크루idx 와 보드idx 합쳐주기
			crewpage_dao.notice_write_crewidx(crewidx_dto);
			suc = 1;	
			
			crew_notice_noti(board_idx,crew_idx);
			
		};		
		
		return suc;
		
	}
	
	// 부모트랜잭션에 자식트랜잭션이 영향끼치지않기 트랜잭션 제외시키기?
	@Transactional(propagation = Propagation.REQUIRES_NEW)
	public void crew_notice_noti(int board_idx, int crew_idx) {
		
		CrewDTO crew = new CrewDTO();
		crew.setCrew_idx(crew_idx);
		
		// 크루 이름 가져오기
		crewpage_dao.notice_noti_crewname(crew);
		String name = crew.getName();
		logger.info("name = "+name);
		String crewidx = Integer.toString(crew_idx);
		
		// 공지 내용
		String noti_content = name+" 크루의 새로운 공지사항 갱신";
		// url 주소
		String noti_url = crewidx+"=url주소";
		// 크루원 목록 가져오기
		List<CrewMemberDTO> member_list = crewpage_dao.crew_member_list(crew_idx);
		
		// 알림 보내기
		for (CrewMemberDTO  member : member_list) {
			// 멤버 id(수신자id) 가져오기
			String member_id = member.getMember_id();
			
			// 알림 보내는 로직 멤버 한명씩 보내기
			crewpage_dao.crew_notice_noti(member_id,board_idx,noti_content,noti_url,name);
			}
		
	}
	
	
	public List<CrewBoardDTO> crew_notice_list(int crew_idx) {
	
		return crewpage_dao.crew_notice_list(crew_idx);
	}
	
	@Transactional
	public void crew_notice_del(String board_idx) {
		crewpage_dao.notice_del_crewidx(board_idx);
		crewpage_dao.crew_notice_del(board_idx);
		
	}

}
