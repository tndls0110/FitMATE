package com.fitmate.crew.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.fitmate.admin.dto.ReportDTO;

@Mapper
public interface CrewPageDAO {

	List<ReportDTO> report_list();

}
