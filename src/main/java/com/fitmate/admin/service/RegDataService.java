package com.fitmate.admin.service;

import com.fitmate.admin.dao.RegDataDAO;
import com.fitmate.admin.dto.RegReportDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegDataService {
	Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired RegDataDAO regData_dao;

    // 신고 사유 관리
    public List<RegReportDTO> regReport() {
        return regData_dao.regReport();
    }
}
