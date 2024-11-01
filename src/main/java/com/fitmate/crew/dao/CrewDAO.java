package com.fitmate.crew.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fitmate.crew.dto.CrewBoardDTO;
import com.fitmate.crew.dto.AskWriteDTO;
import com.fitmate.crew.dto.CrewApprovalDTO;
import com.fitmate.crew.dto.CrewAskDTO;
import com.fitmate.crew.dto.CrewDTO;
import com.fitmate.crew.dto.CrewMemberDTO;
import com.fitmate.crew.dto.CrewReplyDTO;
import com.fitmate.crew.dto.CrewSearchConditionDTO;
import com.fitmate.crew.dto.CrewSearchListDTO;
import com.fitmate.crew.dto.ReplyWriteDTO;

@Mapper
public interface CrewDAO {
	
	int crew_create(CrewDTO crew_dto);

	int crew_post_create(CrewBoardDTO board_dto);

	int crew_idx(int board_idx, int crew_idx);

	int crew_leaderjoin(CrewMemberDTO crewmember_dto);

	int crew_create_rewrite(String content, int board_idx);

	int crew_create_rewrite_region(int regions_idx, int board_idx);

	// 필터에 뿌려줄 지역명 목록
	List<Map> placeFilter();
	// 필터에 뿌려줄 MBTI 목록
	List<Map> mbtiFilter();
	
	// 크루검색 페이지에 뿌려줄 '크루 모집게시글List'
	List<CrewSearchListDTO> crewList(CrewSearchConditionDTO searchDTO);
	
	// 모집게시글 상세보기
	CrewSearchListDTO recruitDetail(int board_idx);
	// 문의 댓글 정보 가져오기
	List<CrewAskDTO> ask(int board_idx);
	// 답변 대댓글 정보 가져오기
	CrewReplyDTO reply(int comment_idx);
	// 문의 댓글 작성하기
	int askWrite(AskWriteDTO askWriteDTO);
	// 답변 대댓글 작성하기
	int replyWrite(ReplyWriteDTO replyWriteDTO);
	// 문의댓글 삭제
	int comment_delete(HashMap<String, Object> info);
	// 문의댓글 수정
	int comment_update(HashMap<String, Object> info);
	// 답변 대댓글 수정
	int recomment_update(HashMap<String, Object> info);
	// 답변 대댓글 삭제
	int recomment_delete(HashMap<String, Object> info);
	// 크루입단신청여부 확인 => 모집게시글에 사용
	CrewApprovalDTO crewApproval(String currentId);
	// 크루 입단신청
	int joinCrew(int crew_idx_, String join_id, int status);
	// 크루 입단신청 취소
	int leaveCrew(int join_idx);

	// 가입신청중인 크루목록
	List<CrewSearchListDTO> joincrewList(String userId);
	// 내가 속해있는 크루목록
	List<CrewSearchListDTO> mycrewList(String userId);
	
	// 크루 탈퇴하기
	int memberExit(int member_idx);

	
}