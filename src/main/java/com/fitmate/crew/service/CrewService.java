package com.fitmate.crew.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.fitmate.admin.dto.RegCountyDTO;
import com.fitmate.crew.dao.CrewDAO;
import com.fitmate.crew.dto.AskWriteDTO;
import com.fitmate.crew.dto.CrewApprovalDTO;
import com.fitmate.crew.dto.CrewBoardDTO;
import com.fitmate.crew.dto.CrewCommentDTO;
import com.fitmate.crew.dto.CrewDTO;
import com.fitmate.crew.dto.CrewIdxDTO;
import com.fitmate.crew.dto.CrewMemberDTO;
import com.fitmate.crew.dto.CrewSearchConditionDTO;
import com.fitmate.crew.dto.CrewSearchListDTO;
import com.fitmate.crew.dto.ReplyWriteDTO;

@Service
public class CrewService {
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired CrewDAO crew_dao;
	
	
	
public int crew_create(String crew_id, String name, int regions_idx, String content) {
		
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
			suc = crew_idx;
			// 크루원 목록에 크루장 넣기
			crewmember_dto.setMember_id(crew_id);
			crewmember_dto.setCrew_idx(crew_idx);
			if(crew_dao.crew_idx(board_idx,crew_idx)>0) {
			//	suc = crew_idx;
				crew_dao.crew_leaderjoin(crewmember_dto);
			};
			
		};
				
		// 크루 생성 확인
	//	logger.info("크루생성 성공 : ",suc);
	
		return suc;
	}


	// 크루 모집글 수정하기 - 크루 지역정보 수정하기
	public void crew_create_rewrite(int regions_idx, String content, int board_idx) {
		crew_dao.crew_create_rewrite(content,board_idx);
		crew_dao.crew_create_rewrite_region(regions_idx,board_idx);
		
	}
	
	
	
	
	
	// placeFilter목록 가져오기
	public List<Map> placeFilter() {
		return crew_dao.placeFilter();
	}
	
	// mbtiFilter목록 가져오기
	public List<Map> mbtiFilter() {
		return crew_dao.mbtiFilter();
	}

	// 크루검색페이지에 뿌려줄 데이터
	public List<CrewSearchListDTO> crewList(Map<String, String> params, String user_id) {
		
		// 1. 받아온 데이터가공.
		String searchFilter_ = params.get("searchFilter");      // searchFilter [1='크루이름' / 2='크루장닉네임']
		String searchKeyword = params.get("searchKeyword");    // searchKeyword [검색키워드]
		String placeFilter_ = params.get("placeFilter");        // placeFilter [regions_idx]
		String mbtiFilter_ = params.get("mbtiFilter");          // mbtiFilter [프로필-mbtir_idx]
		int offset = Integer.parseInt(params.get("offset")); 
		int limit = Integer.parseInt(params.get("limit")); 
		
		
		CrewSearchConditionDTO searchDTO = new CrewSearchConditionDTO();
		
		
		if(searchFilter_ != null && !searchFilter_.equals("")) {
			searchDTO.setSearchFilter(Integer.parseInt(searchFilter_.trim())); 
		}
		if(searchKeyword != null && !searchKeyword.equals("")) {
			searchDTO.setSearchKeyword(searchKeyword.trim()); 
		}
		if(placeFilter_ != null && !placeFilter_.equals("")) {
			searchDTO.setRegions_idx(Integer.parseInt(placeFilter_.trim()));
		}
		if(mbtiFilter_ != null && !mbtiFilter_.equals("")) {
			searchDTO.setMbtiFilter(Integer.parseInt(mbtiFilter_.trim()));
		}
		
		searchDTO.setLimit(limit);
		searchDTO.setOffset(offset);
		searchDTO.setUser_id(user_id);
		
		return crew_dao.crewList(searchDTO);
		
	}
	
	// 크루 생성전 MBTI검사를 받았는지 체크하는 로직.
	public int mbtiChk(HttpSession session) {
		String login_id = (String) session.getAttribute("loginId");
		int mbtir_idx = crew_dao.mbtiChk(login_id);
		
		return mbtir_idx;
	}
	
	// 내 크루 목록조회
	public List<CrewSearchListDTO> mycrewList(Map<String, String> params, String user_id) {
		List<CrewSearchListDTO> list = null;
		
		int info_chk = Integer.parseInt(params.get("info_chk"));
		int limit = Integer.parseInt(params.get("limit"));
		int offset = Integer.parseInt(params.get("offset"));
		
		logger.info("limit 확인 : " + limit);
		logger.info("offset 확인 : " + offset);
		logger.info("info_chk 확인 : " + info_chk);
		
		// info_chk 0:신청중인 크루목록, 1: 내크루 목록 
		if(info_chk == 0) {
			list = crew_dao.joincrewList(user_id, limit, offset);
		}else if(info_chk == 1){
			list = crew_dao.mycrewList(user_id, limit, offset);
		}
		
		return list;
	}
	
	
	// 모집글 상세조회
	public boolean recruitDetail(String board_idx_, String currentUserId, String crew_idx, Model model) {
		int board_idx = 0;
		int approval_status = 0; // 크루입단 신청여부 (0: 신청전 / 1: 신청/ 2: 거절/ 3: 수락/ 4: 크루원)
		
		if(board_idx_ != null && !board_idx_.equals("")) {
			board_idx = Integer.parseInt(board_idx_);
		}
		
		// 1. 모집게시글 내용가져오기
		CrewSearchListDTO recruitDetailDTO = crew_dao.recruitDetail(board_idx);
		
		// 2. 크루원인지 여부, 크루원이 아니라면 크루입단신청 여부 가져오기. 
		CrewApprovalDTO approval = crew_dao.crewApproval(crew_idx, currentUserId);
		
		if(approval != null && approval.isValid()) {
			logger.info("approval확인: {}", approval.toString());
			// 이미 크루원이라면 approval_status 4
			if(approval.getMember_idx() != 0) {
				approval_status = 4;
			}else { // 아직 크루원이 아닌경우 1: 신청/ 2: 거절/ 3: 수락(재입단)
				approval_status = approval.getStatus();
				model.addAttribute("join_idx", approval.getJoin_idx());
			}
			
		}else { // 값이 존재하지 않으면... 크루입단 신청전
			approval_status = 0; // 신청전
		}  
		
		model.addAttribute("recruitHead", recruitDetailDTO);
		model.addAttribute("approval_status", approval_status);
		
		return true;
	}
	
	// 모집글 댓글조회
	@Transactional
	public List<CrewCommentDTO> recruitDetail(String board_idx_, String limit_, String offset_) {
		int board_idx = 0;
		int limit = 0;
		int offset = 0;
		
		
		if(board_idx_ != null && !board_idx_.equals("")) {
			board_idx = Integer.parseInt(board_idx_);
		}
		if(limit_ != null && !limit_.equals("")) {
			limit = Integer.parseInt(limit_);
		}
		if(offset_ != null && !offset_.equals("")) {
			offset = Integer.parseInt(offset_);
		}
		
		
		logger.info("limitasdfsdf : " + limit);
		logger.info("offsetasdfasd : " + offset);
		
		
		// 댓글, 대댓글 가져오기
		List<CrewCommentDTO> commentDTO = crew_dao.comment(board_idx, limit, offset);
		
		
		 for (CrewCommentDTO crewCommentDTO : commentDTO) {
		  logger.info("123정말로 가져올 데이터가 없나.. : " + crewCommentDTO); 
		  }
		 
		
		
		return commentDTO;
	}


	public void commentWrite(Map<String, String> params) {
		
		// Insert 성공여부 체크변수
		int success = 0;
		
		// content_chk (0: 댓글, 1: 대댓글) 
		if(params.get("content_chk").equals("0")) {
			AskWriteDTO askWriteDTO = new AskWriteDTO();
			// 게시판 idx
			int board_idx = Integer.parseInt(params.get("board_idx"));
			askWriteDTO.setBoard_idx(board_idx);
			// 작성자 id
			String comment_id = params.get("comment_id");
			askWriteDTO.setComment_id(comment_id);
			// 내용
			String content = params.get("content");
			askWriteDTO.setContent(content);
			
			success = crew_dao.askWrite(askWriteDTO);
		}else if(params.get("content_chk").equals("1")) {
			ReplyWriteDTO replyWriteDTO = new ReplyWriteDTO();
			// 댓글 idx
			int comment_idx = Integer.parseInt(params.get("comment_idx"));
			replyWriteDTO.setComment_idx(comment_idx);
			// 작성자 id
			String recomment_id = params.get("recomment_id");
			replyWriteDTO.setRecomment_id(recomment_id);
			// 내용
			String content = params.get("content");
			replyWriteDTO.setContent(content);
			
			success = crew_dao.replyWrite(replyWriteDTO);
		}
		
		
		
		// 댓글저장 성공시 => 크루장에게 알림전송
		if(success > 0) {
			String board_idx = params.get("board_idx");
			String crew_idx = params.get("crew_idx");
			
			// 크루명
			String name = params.get("crew_name");
			
			// 알람내용
			String noti_content = "";
			
			// 크루장ID(수신자ID)
			String notir_id = "";
			
			// 댓글일 때
			if(params.get("content_chk").equals("0")) {
				noti_content = "'" +name+ "' 크루에 문의댓글이 달렸습니다.";
				notir_id = params.get("comment_id");
			}else { // 대댓글일 때
				noti_content = "'" +name+ "' 크루에 문의하신 건에 대해 답변이 완료됬습니다.";
				notir_id = params.get("recomment_id");
			}
			
			// url 주소 == 크루입단신청관리 주소로 보내주기
			String noti_url = "crew_recruit_detail.go?board_idx=" + board_idx + "&crew_idx=" + crew_idx;
			
			// 알림 보내기
			success = crew_dao.crew_alarmSend(notir_id, noti_content, noti_url);
			
		}else { 
			logger.info("댓글저장에 실패했습니다.");
		}
		
		
	}

	// Comment 모달 - 댓글 수정/삭제/신고 이벤트 처리
	public void comment_event(HashMap<String, Object> info) {
		
		int success = 0;
		
		// 수정 or 삭제
		String event = (String) info.get("event");
		// 0: 댓글, 1: 대댓글
		int content_chk = (int) info.get("content_chk");
		
		switch (event) {
		// 수정
		case "update":
			if(content_chk == 0) {
				success = crew_dao.comment_update(info);
			}else {
				success = crew_dao.recomment_update(info);
			}
			break;
		// 삭제
		case "delete":
			if(content_chk == 0) {
				success = crew_dao.comment_delete(info);
			}else {
				success = crew_dao.recomment_delete(info);
			}
			break;
		default:
			break;
		}
		
	}
	
	// 크루 입단신청하기
	public int joinCrew(String crew_idx_, String join_id, String leader_id, String crew_name) {
		
		int crew_idx = Integer.parseInt(crew_idx_);
		// 1: 신청 / 2: 신청 거절/ 3: 수락
		int status = 1;
		
		int row = crew_dao.joinCrew(crew_idx, join_id, status);
		
		// 입단신청 성공시 => 크루장에게 알림전송
		if(row > 0) {
			// 크루명
			String name = crew_name;
			
			// 크루장ID(수신자ID)
			String notir_id = leader_id;
			
			// 알람 내용
			String noti_content = "'" +name+ "' 크루에 '" +join_id+ "'님이 입단을 요청하였습니다.";
			
			// url 주소 == 크루입단신청관리 주소로 보내주기
			String noti_url = "mycrew_joinList.go?idx=" + crew_idx;
			
			
			// 알림 보내기
			row = crew_dao.crew_alarmSend(notir_id, noti_content, noti_url);
			
		}		
		
		return row;
	}

	// 입단신청 취소하기.
	public int leaveCrew(String join_idx_) {

		int join_idx = Integer.parseInt(join_idx_);
		int row = crew_dao.leaveCrew(join_idx);
		
		return row;
	}

	// 크루 탈퇴
	public int memberExit(String member_idx_) {
		
		int member_idx = Integer.parseInt(member_idx_);
		
		int row = crew_dao.memberExit(member_idx);
		
		return row;
	}


	public List<RegCountyDTO> crew_regions(String selectedRegionIdx) {
		
		return crew_dao.crew_regions(selectedRegionIdx);
	}


	public CrewSearchListDTO crew_board_detail(String board_idx, String crew_idx) {
		
		return crew_dao.crew_board_detail(board_idx,crew_idx);
		
	}


	public int crew_namecheck(String crewName) {
		int suc = 0;
		int iscrew_name = crew_dao.crew_namecheck(crewName);
		logger.info("중복된 크루가 있는지 = "+iscrew_name);
		if(iscrew_name==0) {
			suc = 0; // 사용가능 크루명
		}
		else {
			suc = 1; // 사용불가능 크루명
		}
		return suc;
		
	}



	
	


	
}