package com.fitmate.admin.service;

import com.fitmate.admin.dao.ReportDAO;
import com.fitmate.admin.dto.ReportDTO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReportService {
	Logger logger = LoggerFactory.getLogger(getClass());
    @Autowired ReportDAO report_dao;

    // 신고 목록
    public List<ReportDTO> getlist() {
        return report_dao.getlist();
    }

}
