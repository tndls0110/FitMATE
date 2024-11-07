package com.fitmate.crew.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fitmate.crew.dto.CrewJoinDTO;
import com.fitmate.crew.dto.CrewMemberProfileDTO;

@Mapper
public interface CrewMemberDAO {

	List<CrewJoinDTO> joinList(Map<String, Object> map);

	CrewJoinDTO profileInfo(Map<String, Object> map);

	// 크루 가입승인처리 
	int joinApproval(Map<String, String> params);
	// 크루에 크루원을 멤버로 등록.
	int crewMember(Map<String, String> params);
	
	/*
	 * CrewMemberProfileDTO memberDetail(String member_id, String profileType,
	 * String crew_idx);
	 */

	int memberFire(int member_idx, String date);

	List<CrewMemberProfileDTO> memberList(Map<String, Object> map);
	
	// 크루원 프로필 상세보기
	CrewMemberProfileDTO crewMemberDetail(String member_id, String crew_idx);

	// 일반회원 프로필 상세보기
	CrewMemberProfileDTO userMemberDetail(String member_id);

	// 크루테이블의 크루장 정보를 새로운 크루장정보로 변경
	int updtLeader(int crew_idx, String member_id);
	// 모집게시글 board_idx 가져오기
	int selectBoard(int crew_idx);
	// 모집게시글 작성자를 새로 바뀐 크루장정보로 변경
	int updtRecruit(int board_idx, String member_id);

}
