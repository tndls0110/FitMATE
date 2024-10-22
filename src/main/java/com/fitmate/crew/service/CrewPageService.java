package com.fitmate.crew.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fitmate.admin.dto.ReportDTO;
import com.fitmate.crew.dao.CrewPageDAO;

@Service
public class CrewPageService {
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired CrewPageDAO crewpage_dao;
	
	public List<ReportDTO> report_list() {
		
		return crewpage_dao.report_list();
	}

}
