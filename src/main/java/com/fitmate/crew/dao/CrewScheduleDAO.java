package com.fitmate.crew.dao;

import org.apache.ibatis.annotations.Mapper;

import com.fitmate.crew.dto.CrewScheduleDTO;

@Mapper
public interface CrewScheduleDAO {

	int crew_plan_create(CrewScheduleDTO plan_dto);

}
