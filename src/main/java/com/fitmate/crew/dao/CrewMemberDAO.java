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

	int joinApproval(Map<String, String> params);

	int crewMember(Map<String, String> params);
	
	CrewMemberProfileDTO memberDetail(String member_id, String profileType);

	int memberFire(int member_idx, String date);

}
