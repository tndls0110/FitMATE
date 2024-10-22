package com.fitmate.crew.dao;
import java.util.List;
import java.util.Map;


import org.apache.ibatis.annotations.Mapper;

import com.fitmate.crew.dto.CrewBoardDTO;
import com.fitmate.crew.dto.CrewDTO;
import com.fitmate.crew.dto.CrewMemberDTO;

@Mapper
public interface CrewDAO {

	int crew_create(CrewDTO crew_dto);

	int crew_post_create(CrewBoardDTO board_dto);

	int crew_idx(int board_idx, int crew_idx);

	int crew_leaderjoin(CrewMemberDTO crewmember_dto);

	int crew_create_rewrite(String content, int board_idx);

	int crew_create_rewrite_region(int regions_idx, int board_idx);
	

	List<Map> placeFilter();

	List<Map> mbtiFilter();

	List<Map> crewList(int searchFilter, String searchKeyword, int region_idx, int regions_idx, int mbtiFilter,int limit, int offset);


}	


