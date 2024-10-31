package com.fitmate.crew.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.fitmate.crew.dto.CrewScheduleDTO;
import com.fitmate.crew.dto.CrewScheduleMDTO;

@Mapper
public interface CrewScheduleDAO {

	int crew_plan_create(CrewScheduleDTO plan_dto);

	List<Map<String, Object>> crew_get_plan(String crew_idx);

	List<CrewScheduleDTO> crew_plan_detail(String date, String crew_idx);

	List<CrewScheduleMDTO> crew_plan_members(int planidx);

	int crew_plan_join(String plan_idx, String user_id);

	int crew_plan_del(String plan_idx);

}
