package com.fitmate.crew.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fitmate.crew.dto.CrewJoinDTO;
import com.fitmate.crew.dto.CrewMemberProfileDTO;
import com.fitmate.member.dto.MemberDTO;

@Mapper
public interface CrewMemberDAO {

	List<CrewJoinDTO> joinList(int crew_idx);

	CrewJoinDTO profileInfo(int crew_idx);

	int joinApproval(Map<String, String> params);

	int crewMember(Map<String, String> params);

	CrewMemberProfileDTO memberDetail(String member_id);

	int memberFire(int member_idx, String date);


}
