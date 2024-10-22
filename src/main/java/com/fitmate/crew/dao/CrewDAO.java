package com.fitmate.crew.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fitmate.crew.dto.CrewSearchConditionDTO;
import com.fitmate.crew.dto.CrewSearchListDTO;

@Mapper
public interface CrewDAO {

	List<Map> placeFilter();

	List<Map> mbtiFilter();

	List<CrewSearchListDTO> crewList(CrewSearchConditionDTO searchDTO);

}
