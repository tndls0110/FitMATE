package com.fitmate.crew.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fitmate.crew.dto.CrewBoardDTO;
import com.fitmate.crew.dto.CrewAskDTO;
import com.fitmate.crew.dto.CrewDTO;
import com.fitmate.crew.dto.CrewMemberDTO;
import com.fitmate.crew.dto.CrewSearchConditionDTO;
import com.fitmate.crew.dto.CrewSearchListDTO;

@Mapper
public interface CrewDAO {

	List<Map> placeFilter();

	List<Map> mbtiFilter();

	List<CrewSearchListDTO> crewList(CrewSearchConditionDTO searchDTO);
	
	int crew_create(CrewDTO crew_dto);

	int crew_post_create(CrewBoardDTO board_dto);

	int crew_idx(int board_idx, int crew_idx);

	int crew_leaderjoin(CrewMemberDTO crewmember_dto);

	int crew_create_rewrite(String content, int board_idx);

	int crew_create_rewrite_region(int regions_idx, int board_idx);

	CrewSearchListDTO recruitDetail(int board_idx);

	CrewAskDTO recruitComment(int board_idx);
	
}





















	
	
